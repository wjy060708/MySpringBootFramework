package com.jiangxinsoft.scorpio.javaconfig;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.Filter;

import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.session.mgt.SessionValidationScheduler;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.session.mgt.eis.JavaUuidSessionIdGenerator;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.session.mgt.eis.SessionIdGenerator;
import org.apache.shiro.session.mgt.quartz.QuartzSessionValidationScheduler;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.apache.shiro.web.session.mgt.WebSessionManager;

import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import com.jiangxinsoft.scorpio.shiro.RetryLimitHashedCredentialsMatcher;
import com.jiangxinsoft.scorpio.shiro.filter.MyFormAuthenticationFilter;
import com.jiangxinsoft.scorpio.shiro.realm.MyJdbcAuthorizingRealm;

@Configuration
public class ShiroConfiguration {

	@Bean(name = "shiroCacheManager")
    @ConditionalOnClass(name = {"org.apache.shiro.cache.ehcache.EhCacheManager"})
    @ConditionalOnMissingBean(name = "shiroCacheManager")
    public CacheManager shiroCacheManager() {
        EhCacheManager ehCacheManager = new EhCacheManager();
        ehCacheManager.setCacheManagerConfigFile("classpath:shiro/shiro-ehcache.xml");
        return ehCacheManager;
    }
	
	@Bean(name = "credentialsMatcher")
    @ConditionalOnMissingBean
    @DependsOn("shiroCacheManager")
    public CredentialsMatcher credentialsMatcher(CacheManager cacheManager) {
        RetryLimitHashedCredentialsMatcher credentialsMatcher = new RetryLimitHashedCredentialsMatcher(cacheManager);
        credentialsMatcher.setHashAlgorithmName("md5");
        credentialsMatcher.setHashIterations(2);
        credentialsMatcher.setStoredCredentialsHexEncoded(true);
        credentialsMatcher.setRetryMax(5);
        return credentialsMatcher;
    }
	
	@Bean
	@ConditionalOnMissingBean
	@DependsOn("shiroCacheManager")
	public EnterpriseCacheSessionDAO sessionDAO(CacheManager cacheManager) {
		EnterpriseCacheSessionDAO sessionDAO = new EnterpriseCacheSessionDAO();
		
		SessionIdGenerator sessionIdGenerator = new JavaUuidSessionIdGenerator();
		sessionDAO.setSessionIdGenerator(sessionIdGenerator);
		sessionDAO.setActiveSessionsCacheName("shiro-activeSessionCache");
		sessionDAO.setCacheManager(cacheManager);
		
		return sessionDAO;
	}
	
	@Bean(name = "mainRealm")
    @ConditionalOnMissingBean(name = "mainRealm")
    @DependsOn(value = {"lifecycleBeanPostProcessor", "credentialsMatcher"})
	public Realm userRealm(CredentialsMatcher credentialsMatcher) {
		MyJdbcAuthorizingRealm userRealm = new MyJdbcAuthorizingRealm();
		
		userRealm.setCredentialsMatcher(credentialsMatcher);
		userRealm.setCachingEnabled(true);
		userRealm.setAuthenticationCachingEnabled(true);
		userRealm.setAuthorizationCachingEnabled(true);
		
		userRealm.setAuthenticationCacheName("authenticationCache");
		userRealm.setAuthorizationCacheName("authorizationCache");
		
		return userRealm;
	}
	
	@Bean(name = "securityManager")
    @DependsOn(value = {"shiroCacheManager", "mainRealm"})
	public DefaultSecurityManager securityManager(Realm userRealm, CacheManager cacheManager, SessionManager sessionManager) {
		DefaultSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(userRealm);
		securityManager.setRememberMeManager(rememberMeManager());
		securityManager.setCacheManager(cacheManager);
		securityManager.setSessionManager(sessionManager);
		
		return securityManager;
	}
	
	@Bean
    @DependsOn(value = {"shiroCacheManager", "sessionDAO"})
    public WebSessionManager sessionManager(CacheManager cacheManager, SessionDAO sessionDAO) {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        //sessionManager.setCacheManager(cacheManager);
        
        sessionManager.setGlobalSessionTimeout(60 * 60 * 1000);
        sessionManager.setSessionValidationSchedulerEnabled(true);
        sessionManager.setSessionDAO(sessionDAO);
        
        /*
        SimpleCookie sessionIdCookie = new SimpleCookie("sid");
		sessionIdCookie.setHttpOnly(true);
		sessionIdCookie.setMaxAge(180000);
		sessionManager.setSessionIdCookie(sessionIdCookie);
		*/
        
        return sessionManager;
    }
	
	@Bean(name = "sessionValidationScheduler")
    @DependsOn(value = {"sessionManager"})
    @ConditionalOnClass(name = {"org.quartz.Scheduler"})
    @ConditionalOnMissingBean(SessionValidationScheduler.class)
    public SessionValidationScheduler quartzSessionValidationScheduler(DefaultWebSessionManager sessionManager) {
        QuartzSessionValidationScheduler quartzSessionValidationScheduler = new QuartzSessionValidationScheduler(sessionManager);
        
        quartzSessionValidationScheduler.setSessionValidationInterval(1800000);
        quartzSessionValidationScheduler.enableSessionValidation();
        sessionManager.setSessionValidationScheduler(quartzSessionValidationScheduler);
        
        return quartzSessionValidationScheduler;
    }
	
	@Bean
	public MyFormAuthenticationFilter authcFilter() {
		MyFormAuthenticationFilter authcFilter = new MyFormAuthenticationFilter();
		
		authcFilter.setUsernameParam("username");
		authcFilter.setPasswordParam("password");
		
		//authcFilter.setLoginUrl("/login.htm");
		
		authcFilter.setLoginUrl("/index1.htm");
		authcFilter.setSuccessUrl("/index.htm");
		
		return authcFilter;
	}
	
	
	//处理拦截器资源问题
	@Bean(name = "shiroFilter")
    @DependsOn("securityManager")
    @ConditionalOnMissingBean
    public FilterRegistrationBean filterRegistrationBean(DefaultSecurityManager securityManager) throws Exception {
        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
        //该值缺省为false,表示生命周期由SpringApplicationContext管理,设置为true则表示由ServletContainer管理
        filterRegistration.addInitParameter("targetFilterLifecycle", "true");
        
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		shiroFilterFactoryBean.setLoginUrl("/login.htm");
		shiroFilterFactoryBean.setSuccessUrl("/index.htm");
		
		Map<String,String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
		
		filterChainDefinitionMap.put("/images/**", "anon");
		filterChainDefinitionMap.put("/plugins/**", "anon");
		filterChainDefinitionMap.put("/styles/**", "anon");
		filterChainDefinitionMap.put("/scripts/**", "anon");
		filterChainDefinitionMap.put("/login/main.json","anon");
		filterChainDefinitionMap.put("/logout","authc");
		filterChainDefinitionMap.put("/**", "authc");
		
		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        
        filterRegistration.setFilter((Filter) shiroFilterFactoryBean.getObject());
        filterRegistration.setEnabled(true);
        filterRegistration.addUrlPatterns("/*");
        
        return filterRegistration;
    }
	
	@Bean
    public SimpleCookie rememberMeCookie(){
        //这个参数是cookie的名称，对应前端的checkbox的name = rememberMe
        SimpleCookie cookie = new SimpleCookie("rememberMe");
        cookie.setHttpOnly(true);
        //记住我有效期长达30天
        cookie.setMaxAge(2592000);
        return cookie;
    }

    @Bean
    public CookieRememberMeManager rememberMeManager(){
        CookieRememberMeManager rememberMeManager = new CookieRememberMeManager();
        rememberMeManager.setCookie(rememberMeCookie());
        rememberMeManager.setCipherKey(Base64.decode("2AvVhdsgUs0FSA3SDFAdag=="));
        return rememberMeManager;
    }
	
	@Bean(name = "lifecycleBeanPostProcessor")
    @ConditionalOnMissingBean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }
	
	@ConditionalOnMissingBean
    @Bean(name = "defaultAdvisorAutoProxyCreator")
    @DependsOn("lifecycleBeanPostProcessor")
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
        return defaultAdvisorAutoProxyCreator;
    }
	
	@Bean
    public AuthorizationAttributeSourceAdvisor getAuthorizationAttributeSourceAdvisor(DefaultSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor aasa = new AuthorizationAttributeSourceAdvisor();
        aasa.setSecurityManager(securityManager);
        return aasa;
    }
}
