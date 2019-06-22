package com.jiangxinsoft.scorpio.shiro.realm;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ConcurrentAccessException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiangxinsoft.scorpio.base.ShiroUser;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;

public class MyJdbcAuthorizingRealm extends AuthorizingRealm {
	
	@Autowired
	private ISysUserService sysUserService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		ShiroUser shiroUser = (ShiroUser)principals.getPrimaryPrincipal();
		String userKind = shiroUser.getUserKind();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		
		if(StringUtils.isNotBlank(userKind)) {
			if(userKind.equals(SysConstants.USER_KIND_ADMIN)) {	// 系统管理员
				authorizationInfo.addRole(SysConstants.USER_KIND_ADMIN);
			} else if(userKind.equals(SysConstants.USER_KIND_COMMON)) {	//普通用户
				authorizationInfo.addRole(SysConstants.USER_KIND_COMMON);
			} else if(userKind.equals(SysConstants.USER_KIND_OPERATOR)) {	//系统操作员
				authorizationInfo.addRole(SysConstants.USER_KIND_OPERATOR);
			}else if(userKind.equals(SysConstants.USER_KIND_SECRECY)) {	//安全保密员
				authorizationInfo.addRole(SysConstants.USER_KIND_SECRECY);
			}else if(userKind.equals(SysConstants.USER_KIND_AUDITOR)) {	//安全保密员
				authorizationInfo.addRole(SysConstants.USER_KIND_AUDITOR);
			}else if(userKind.equals(SysConstants.USER_KIND_BUG_MANAGER)) {	//缺陷模式管理员
				authorizationInfo.addRole(SysConstants.USER_KIND_BUG_MANAGER);
			}
			
		}
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws 
	AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		
		String userName = (String)token.getPrincipal();
		
		SysUser user = sysUserService.getUserByUsername(userName);
		if(user == null) {
			throw new UnknownAccountException();//没找到帐号
		}
		
		String userState = user.getUserState();
		if(userState.equals(SysConstants.USER_STATE_DEFAULT)) { // 未激活
			throw new ConcurrentAccessException("登录失败,用户未激活!");
		} 
		
		if(userState.equals(SysConstants.USER_STATE_DISABLED)) { // 已冻结
			throw new DisabledAccountException("登录失败,用户已被冻结!");
		}
		ShiroUser shiroUser = new ShiroUser(user.getUserId(), user.getUserName(), user.getUserKind(), user.getUserIcon(), 
				user.getTrueName());
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(shiroUser, user.getPassword(), getName());
		return authenticationInfo;
	}
	
	/**
	 * 重载父类方法，改变缓存主键的创建方式
	 */
    @Override
	protected Object getAuthorizationCacheKey(PrincipalCollection principals) {
		Object primaryPrincipal = principals.getPrimaryPrincipal();
		if(primaryPrincipal instanceof ShiroUser) {
			return ((ShiroUser)primaryPrincipal).getUserName();
		} else {
			return primaryPrincipal;
		}
    }
	
    /**
	 * 重载父类方法，改变缓存主键的创建方式
	 */
	@Override
	protected Object getAuthenticationCacheKey(PrincipalCollection principals) {
		Object primaryPrincipal = principals.getPrimaryPrincipal();
		if(primaryPrincipal instanceof ShiroUser) {
			return ((ShiroUser)primaryPrincipal).getUserName();
		} else {
			return primaryPrincipal;
		}
    }
	
}
