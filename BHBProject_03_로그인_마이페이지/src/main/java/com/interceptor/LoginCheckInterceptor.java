package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle================");
		HttpSession session = request.getSession();
		//boolean result= true;
		if(session.getAttribute("login") == null) {   //로그인안된경우
			response.sendRedirect("../loginForm");
			// /loginCheck/**  주소시 /loginCheck이 남아 있게 되어 /loginCheck/loginForm 주소요청이 됨   ../ 이용 하나 위로 올려 찾게 함 
			//servlet-context.xml 
			//<mvc:view-controller path="/loginForm" view-name="loginForm"/><!-- loginForm .jsp-->
			return false;  //주의
		}else {   //로그인 시
			return true; //주의
		}
		//return result;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("포스트 핸들러");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	
	
}
