package com.jiangxinsoft.scorpio.exception;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.ui.Model;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.alibaba.fastjson.JSONObject;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.util.CommonUtil;

import freemarker.template.TemplateModelException;

@ControllerAdvice
public class GlobalExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	@ExceptionHandler(UnauthorizedException.class)
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, 
			UnauthorizedException unauthorizedException) {
		if (CommonUtil.isAjax(request)) {
			try {
				response.setContentType("application/json;charset=UTF-8");
				PrintWriter writer = response.getWriter();
				RestResponse failResponse = RestResponse.failure("您无此权限,请联系管理员!");
				writer.write(JSONObject.toJSONString(failResponse));
				writer.flush();
				writer.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} else {
			RestResponse restResponse = RestResponse.failure(unauthorizedException.getMessage());
			return new ModelAndView("error/500", restResponse);
		}

		return null;
	}

	@ExceptionHandler(OperationException.class)
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, 
			OperationException operationException) {

		if (CommonUtil.isAjax(request)) {
			try {
				response.setContentType("application/json;charset=UTF-8");

				PrintWriter writer = response.getWriter();
				RestResponse failResponse = RestResponse.failure(operationException.getMessage());
				writer.write(JSONObject.toJSONString(failResponse));
				writer.flush();
				writer.close();
			} catch (IOException e) {
				logger.debug(e.getMessage(), e);
			}
		} else {
			RestResponse restResponse = RestResponse.failure(operationException.getMessage());
			return new ModelAndView("error/500", restResponse);
		}

		return null;
	}

	/**
	 * 500 - Bad Request
	 */
	@ExceptionHandler({ HttpMessageNotReadableException.class,
			HttpRequestMethodNotSupportedException.class,
			HttpMediaTypeNotSupportedException.class,
			TemplateModelException.class, SQLException.class })
	public ModelAndView handleHttpMessageNotReadableException(HttpServletRequest request, HttpServletResponse response,
			Exception e) {
		RestResponse restResponse = RestResponse.failure(e.getMessage());
		return new ModelAndView("error/500", restResponse);
	}

	/**
	 * 404的拦截.
	 * 
	 * @param request
	 * @param response
	 * @param ex
	 * @return
	 * @throws Exception
	 */
	@ResponseStatus(code = HttpStatus.NOT_FOUND)
	@ExceptionHandler(NoHandlerFoundException.class)
	public String notFound(HttpServletRequest request, HttpServletResponse response, Exception ex, Model model) {
		System.out.println("******************************************");
		System.out.println("*********NoHandlerFoundException***********");
		System.out.println("******************************************");
		model.addAttribute("url", request.getRequestURI());
		return "error/404";
	}

}
