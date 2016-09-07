package com.easytoolsoft.easyreport.web.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.easytoolsoft.easyreport.web.viewmodel.JsonResult;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

/**
 * SpringMVC全局异常处理器
 *
 * @author Tom Deng
 */
@Slf4j
@Component("handlerExceptionResolver")
public class GlobalExceptionHandler implements HandlerExceptionResolver {
	private Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);
	private final ObjectMapper mapper = new ObjectMapper();

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		String detailMessage = (ex.getCause() == null ? ex.getMessage() : ex.getCause().getMessage());
		JsonResult<String> result = new JsonResult<>(false, StringEscapeUtils.escapeHtml4(detailMessage));
		try {
			String str = mapper.writeValueAsString(result);
			log.error(str, ex);
			response.getOutputStream().write(str.getBytes());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return new ModelAndView();
	}
}
