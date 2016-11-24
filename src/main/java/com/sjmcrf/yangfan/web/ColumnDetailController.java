package com.sjmcrf.yangfan.web;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sjmcrf.yangfan.dto.ActionResult;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Column;
import com.sjmcrf.yangfan.entity.ColumnDetail;
import com.sjmcrf.yangfan.service.ColumnDetailService;
import com.sjmcrf.yangfan.service.ColumnService;
import com.sjmcrf.yangfan.util.CustomizedPropertyConfig;

@Controller
public class ColumnDetailController {
	
	@Autowired
	private CustomizedPropertyConfig config;
	@Autowired
	private ColumnDetailService service;
	@Autowired
	private ColumnService columnService;
	
	@RequestMapping(value="/admin/columnDetailList.do")
	public String columnDetailList(){
		
		return "admin/column-detail-list";
	}
	
	@RequestMapping(value="/admin/columnDetail.do")
	public String columnDetail(String id,HttpServletRequest request,HttpServletResponse response){
		
		ColumnDetail detail = service.get(id);		
		List<Column> cloumns = columnService.queryAll();
		
		request.setAttribute("detail", detail);
		request.setAttribute("columns", cloumns);
		
		return "admin/column-detail";
	}
	@RequestMapping(value="/admin/modifyColumnDetail.do")
	@ResponseBody
	public ActionResult modify(ColumnDetail detail,HttpServletRequest request){
		ActionResult result = new ActionResult(false);
		
		if(detail.getId() == null||"".equals(detail.getId())){
			service.insert(detail);
		}else{
			service.update(detail);
		}
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/deleteColumnDetail.do")
	@ResponseBody
	public ActionResult delete(String id){
		ActionResult result = new ActionResult(false);
		
		service.delete(id);
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/queryColumnDetail.do")
	@ResponseBody
	public PageQueryResult queryByPage(int pageIndex,int pageSize){
		
		return service.queryByPage(pageIndex, pageSize);
	}
	
}
