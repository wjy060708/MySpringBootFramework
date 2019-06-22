package com.jiangxinsoft.scorpio.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MyFormAuthenticationFilter extends FormAuthenticationFilter {

	private static final Logger log = LoggerFactory.getLogger(MyFormAuthenticationFilter.class);
	
	public MyFormAuthenticationFilter() {
		super();
	}
	
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        if (isLoginRequest(request, response)) {
            if (isLoginSubmission(request, response)) {
                if (log.isTraceEnabled()) {
                    log.trace("Login submission detected.  Attempting to execute login.");
                }
                return executeLogin(request, response);
            } else {
                if (log.isTraceEnabled()) {
                    log.trace("Login page view.");
                }
                return true;
            }
        } else {
            if (log.isTraceEnabled()) {
                log.trace("Attempting to access a path which requires authentication.  Forwarding to the " + 
            "Authentication url [" + getLoginUrl() + "]");
            }
            
            HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        	String requestType = httpServletRequest.getHeader("x-requested-with");
        	if((requestType != null) && (requestType.equalsIgnoreCase("XMLHttpRequest"))) {	// Ajax请求
        		// 设置Ajax请求超时，或者未授权
        		((HttpServletResponse)response).setHeader("Ajax-Response-Header", "timeout");
        	} else { // 页面请求
        		redirectToLogin(request, response);
        	}
            
            return false;
        }
    }
}
