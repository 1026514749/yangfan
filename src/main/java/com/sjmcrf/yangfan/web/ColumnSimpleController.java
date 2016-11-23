package com.sjmcrf.yangfan.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sjmcrf.yangfan.dto.ActionResult;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Column;
import com.sjmcrf.yangfan.entity.ColumnSimple;
import com.sjmcrf.yangfan.service.ColumnService;
import com.sjmcrf.yangfan.service.ColumnSimpleService;
import com.sjmcrf.yangfan.util.CustomizedPropertyConfig;
import com.sjmcrf.yangfan.util.ImageUtils;

@Controller
public class ColumnSimpleController {
	
	@Autowired
	private CustomizedPropertyConfig config;
	@Autowired
	private ColumnSimpleService service;
	@Autowired
	private ColumnService columnService;
	
	@RequestMapping(value="/admin/columnSimpleList.do")
	public String columnSimpleList(){
		
		return "admin/column-simple-list";
	}
	
	@RequestMapping(value="/admin/columnSimple.do")
	public String columnSimple(String id,HttpServletRequest request,HttpServletResponse response){
		
		ColumnSimple simple = service.get(id);		
		List<Column> cloumns = columnService.queryAll();
		
		request.setAttribute("simple", simple);
		request.setAttribute("columns", cloumns);
		
		return "admin/column-simple";
	}
	@RequestMapping(value="/admin/modifyColumnSimple.do")
	@ResponseBody
	public ActionResult modify(ColumnSimple simple,HttpServletRequest request){
		ActionResult result = new ActionResult(false);
		
		if(simple.getId() == null||"".equals(simple.getId())){
			service.insert(simple);
		}else{
			service.update(simple);
		}
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/deleteColumnSimple.do")
	@ResponseBody
	public ActionResult delete(String id){
		ActionResult result = new ActionResult(false);
		
		service.delete(id);
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/queryColumnSimple.do")
	@ResponseBody
	public PageQueryResult queryByPage(int pageIndex,int pageSize){
		
		return service.queryByPage(pageIndex, pageSize);
	}
	
}
