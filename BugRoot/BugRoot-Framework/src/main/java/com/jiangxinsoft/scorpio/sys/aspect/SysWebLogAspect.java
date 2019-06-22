package com.jiangxinsoft.scorpio.sys.aspect;

import java.lang.reflect.Method;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.jiangxinsoft.scorpio.annotation.SysControllerLog;
import com.jiangxinsoft.scorpio.sys.base.SysCurrentUser;
import com.jiangxinsoft.scorpio.sys.model.SysLog;
import com.jiangxinsoft.scorpio.sys.service.ISysLogService;
import com.jiangxinsoft.scorpio.util.CommonUtil;

@Component
@Aspect
public class SysWebLogAspect {
	
	private ThreadLocal<Long> startTime = new ThreadLocal<>();

	private SysLog sysLog = null;
	
	@Autowired
	private ISysLogService sysLogService;
	
	// Controller层切点
	@Pointcut("@annotation(com.jiangxinsoft.scorpio.annotation.SysControllerLog)")
	public void controllerAspect() {
	}

	/**
	 * 前置通知 用于拦截Controller层记录用户的操作
	 * 
	 * @param joinPoint
	 *            切点
	 */
	@Before("controllerAspect()")
	public void doBefore(JoinPoint joinPoint) {
		startTime.set(System.currentTimeMillis());
		
		// 接收到请求，记录请求内容
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attributes.getRequest();
		
		sysLog = new SysLog();
		
		sysLog.setClassMethod(joinPoint.getSignature().getDeclaringTypeName()+ "." + joinPoint.getSignature().getName());
		sysLog.setHttpMethod(request.getMethod());
		
		// 获取传入目标方法的参数
		Object[] args = joinPoint.getArgs();
		for (int i = 0; i < args.length; i++) {
			Object o = args[i];
			if ((o instanceof ServletRequest) || (o instanceof ServletResponse) || (o instanceof MultipartFile)) {
				args[i] = o.toString();
			}
		}
		String str = JSONObject.toJSONString(args);
		sysLog.setParams(str.length() > 5000 ? JSONObject.toJSONString("请求参数数据过长不与显示") : str);
		String ip = CommonUtil.getClientIp(request);
		if ("0.0.0.0".equals(ip) || "0:0:0:0:0:0:0:1".equals(ip) || "localhost".equals(ip) || "127.0.0.1".equals(ip)) {
			ip = "127.0.0.1";
		}
		sysLog.setRemoteAddr(ip);
		
		sysLog.setRequestUri(request.getRequestURL().toString());
		
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method method = signature.getMethod();
		SysControllerLog mylog = method.getAnnotation(SysControllerLog.class);
		if (mylog != null) {
			// 注解上的描述
			sysLog.setTitle(mylog.value());
		}

		sysLog.setType(CommonUtil.isAjax(request) ? "Ajax请求" : "普通请求");
		if (SysCurrentUser.currentUser() != null) {
			sysLog.setUserName(SysCurrentUser.getUserName());
			sysLog.setUserKind(SysCurrentUser.getUserKind());
			sysLog.setTrueName(SysCurrentUser.getTrueName());
		}
	}
	
	@Around("controllerAspect()")
	public Object doAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
		try {
			Object obj = proceedingJoinPoint.proceed();
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			sysLog.setException(e.getMessage());
			throw e;
		}
	}

	@AfterReturning(returning = "ret", pointcut = "controllerAspect()")
	public void doAfterReturning(Object ret) {
		if (SysCurrentUser.currentUser() != null) {
			sysLog.setUserName(SysCurrentUser.getUserName());
			sysLog.setUserKind(SysCurrentUser.getUserKind());
		}
		String retString = JSONObject.toJSONString(ret);
		sysLog.setResponse(retString.length() > 5000 ? JSONObject.toJSONString("请求参数数据过长不与显示") : retString);
		sysLog.setUseTime(System.currentTimeMillis() - startTime.get());
		
		sysLogService.saveLog(sysLog);
	}
}
