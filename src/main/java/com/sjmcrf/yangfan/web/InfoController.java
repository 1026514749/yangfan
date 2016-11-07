package com.sjmcrf.yangfan.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sjmcrf.yangfan.entity.Info;
import com.sjmcrf.yangfan.service.InfoService;

@Controller
public class InfoController {
	@Autowired
	private InfoService infoService;
	@RequestMapping(value = "/info.do")
	public String info(HttpServletRequest request){
		Info info = infoService.get();
		request.setAttribute("info", info);
		return "admin/info";
	}
}
