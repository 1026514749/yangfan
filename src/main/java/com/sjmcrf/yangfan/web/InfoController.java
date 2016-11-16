package com.sjmcrf.yangfan.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjmcrf.yangfan.dto.ActionResult;
import com.sjmcrf.yangfan.entity.Info;
import com.sjmcrf.yangfan.service.InfoService;

@Controller
public class InfoController {
	@Autowired
	private InfoService infoService;
	@RequestMapping(value = "/admin/info.do")
	public String info(HttpServletRequest request){
		Info info = infoService.get();
		request.setAttribute("info", info);
		return "admin/info";
	}
	
	@RequestMapping(value = "/admin/modifyInfo.do")
	@ResponseBody
	public ActionResult modify(Info info,HttpServletRequest request){
		ActionResult result = new ActionResult(false);
		if(infoService.modify(info)){
			result.setMessage("更新成功");
		}else{
			result.setMessage("更新失败");
		}
		result.setSuccess(true);
		return result;
	}
}
