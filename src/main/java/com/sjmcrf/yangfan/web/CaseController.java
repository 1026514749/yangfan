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
import com.sjmcrf.yangfan.entity.Case;
import com.sjmcrf.yangfan.service.CaseService;
import com.sjmcrf.yangfan.service.ColumnService;

@Controller
public class CaseController {
	
	@Autowired
	private CaseService service;
	@Autowired
	private ColumnService columnService;
	
	@RequestMapping(value="/admin/caseList.do")
	public String columnSimpleList(){
		
		return "admin/case-list";
	}
	
	@RequestMapping(value="/admin/case.do")
	public String Case(String id,HttpServletRequest request,HttpServletResponse response){
		
		Case ncase = service.get(id);		
		List<Column> cloumns = columnService.queryAll();
		
		request.setAttribute("ncase", ncase);
		request.setAttribute("columns", cloumns);
		
		return "admin/case";
	}
	@RequestMapping(value="/admin/modifyCase.do")
	@ResponseBody
	public ActionResult modify(Case ncase,HttpServletRequest request){
		ActionResult result = new ActionResult(false);
		
		if(ncase.getId() == null||"".equals(ncase.getId())){
			service.insert(ncase);
		}else{
			service.update(ncase);
		}
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/deleteCase.do")
	@ResponseBody
	public ActionResult delete(String id){
		ActionResult result = new ActionResult(false);
		
		service.delete(id);
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/queryCase.do")
	@ResponseBody
	public PageQueryResult queryByPage(int pageIndex,int pageSize){
		
		return service.queryByPage(pageIndex, pageSize);
	}
	
}
