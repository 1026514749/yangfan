package com.sjmcrf.yangfan.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SecurityFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		 HttpServletRequest request=(HttpServletRequest)arg0;   
         HttpServletResponse response  =(HttpServletResponse) arg1;    
         HttpSession session = request.getSession(true);     
         String user = (String)session.getAttribute("user");//登录人角色
         String url=request.getRequestURI();   
         if(user==null || "".equals(user)||url.indexOf(".jsp")<0) {      
              //判断获取的路径不为空且不是访问登录页面或执行登录操作时跳转    
              response.sendRedirect(request.getContextPath() + "/login/login.do");   
              return ;               
          }   
          chain.doFilter(arg0, arg1);   
          return;   
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
