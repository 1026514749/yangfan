package com.sjmcrf.yangfan.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sjmcrf.yangfan.util.CustomizedPropertyConfig;

@Controller
public class LoginController {
	
	@Autowired
	private CustomizedPropertyConfig config;

	@RequestMapping(value = "/login/loginIn.do")
	public String login(String user,String pass,HttpServletRequest request){
		String userName = config.getContextProperty("user");
		String password = config.getContextProperty("password");
		if(userName.equals(user)&&password.equals(pass)){
			HttpSession session = request.getSession(true);
			session.setAttribute("user", userName);
			return "redirect:/admin/index.do";
		}
		return "login";
	}
	@RequestMapping(value = "/login/loginOut.do")
	public String login(HttpServletRequest request){
		HttpSession session = request.getSession(true);
		session.setAttribute("user", "");
		return "redirect:/index/column.do";
	}
	@RequestMapping(value = "/login/login.do")
	public String login(){
		return "login";
	}
}
