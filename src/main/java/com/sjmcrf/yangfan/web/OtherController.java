package com.sjmcrf.yangfan.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sjmcrf.yangfan.dto.ActionResult;
import com.sjmcrf.yangfan.entity.Other;
import com.sjmcrf.yangfan.service.OtherService;

@Controller
public class OtherController {
	@Autowired
	private OtherService service;
	
	@RequestMapping("admin/other.do")
	public String other(HttpServletRequest request){
		Other other = service.get();
		request.setAttribute("other", other);
		return "admin/other";
	}
	
	public ActionResult modify(Other other,HttpServletRequest request){
		
		ActionResult result = new ActionResult(false);
		if(service.modify(other)){
			result.setMessage("更新成功");
		}else{
			result.setMessage("更新失败");
		}
		result.setSuccess(true);
		return result;
	}
}
