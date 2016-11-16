package com.sjmcrf.yangfan.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjmcrf.yangfan.dto.ActionResult;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Column;
import com.sjmcrf.yangfan.service.ColumnService;

@Controller
public class ColumnController {
	
	@Autowired
	private ColumnService service;
	
	@RequestMapping(value="/admin/columnList.do")
	public String columnList(){
		
		return "admin/column-list";
	}
	
	@RequestMapping(value="/admin/column.do")
	public String column(String id,HttpServletRequest request,HttpServletResponse response){
		
		Column column = service.get(id);
		request.setAttribute("column", column);
		
		return "admin/column";
	}
	@RequestMapping(value="/admin/modifyColumn.do")
	@ResponseBody
	public ActionResult modify(Column column){
		ActionResult result = new ActionResult(false);
		if(column.getId() == null||"".equals(column.getId())){
			service.insert(column);
		}else{
			service.update(column);
		}
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/deleteColumn.do")
	@ResponseBody
	public ActionResult delete(String id){
		ActionResult result = new ActionResult(false);
		
		service.delete(id);
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/queryColumn.do")
	@ResponseBody
	public PageQueryResult queryByPage(int pageIndex,int pageSize){
		
		return service.queryByPage(pageIndex, pageSize);
	}
	
}
