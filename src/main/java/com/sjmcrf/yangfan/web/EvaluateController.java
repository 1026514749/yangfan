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
import com.sjmcrf.yangfan.entity.Evaluate;
import com.sjmcrf.yangfan.service.EvaluateService;
import com.sjmcrf.yangfan.service.ColumnService;

@Controller
public class EvaluateController {
	
	@Autowired
	private EvaluateService service;
	@Autowired
	private ColumnService columnService;
	
	@RequestMapping(value="/admin/evaluateList.do")
	public String evaluateList(){
		
		return "admin/evaluate-list";
	}
	
	@RequestMapping(value="/admin/evaluate.do")
	public String evaluate(String id,HttpServletRequest request,HttpServletResponse response){
		
		Evaluate evaluate = service.get(id);		
		List<Column> cloumns = columnService.queryAll();
		
		request.setAttribute("evaluate", evaluate);
		request.setAttribute("columns", cloumns);
		
		return "admin/evaluate";
	}
	@RequestMapping(value="/admin/modifyEvaluate.do")
	@ResponseBody
	public ActionResult modify(Evaluate evaluate,HttpServletRequest request){
		ActionResult result = new ActionResult(false);
		
		if(evaluate.getId() == null||"".equals(evaluate.getId())){
			service.insert(evaluate);
		}else{
			service.update(evaluate);
		}
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/deleteEvaluate.do")
	@ResponseBody
	public ActionResult delete(String id){
		ActionResult result = new ActionResult(false);
		
		service.delete(id);
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/queryEvaluate.do")
	@ResponseBody
	public PageQueryResult queryByPage(int pageIndex,int pageSize){
		
		return service.queryByPage(pageIndex, pageSize);
	}
	
}
