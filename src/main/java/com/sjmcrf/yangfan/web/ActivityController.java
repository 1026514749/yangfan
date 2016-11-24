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
import com.sjmcrf.yangfan.entity.Activity;
import com.sjmcrf.yangfan.service.ActivityService;
import com.sjmcrf.yangfan.service.ColumnService;

@Controller
public class ActivityController {
	
	@Autowired
	private ActivityService service;
	@Autowired
	private ColumnService columnService;
	
	@RequestMapping(value="/admin/activityList.do")
	public String activityList(){
		
		return "admin/activity-list";
	}
	
	@RequestMapping(value="/admin/activity.do")
	public String activity(String id,HttpServletRequest request,HttpServletResponse response){
		
		Activity activity = service.get(id);		
		List<Column> cloumns = columnService.queryAll();
		
		request.setAttribute("activity", activity);
		request.setAttribute("columns", cloumns);
		
		return "admin/activity";
	}
	@RequestMapping(value="/admin/modifyActivity.do")
	@ResponseBody
	public ActionResult modify(Activity activity,HttpServletRequest request){
		ActionResult result = new ActionResult(false);
		
		if(activity.getId() == null||"".equals(activity.getId())){
			service.insert(activity);
		}else{
			service.update(activity);
		}
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/deleteActivity.do")
	@ResponseBody
	public ActionResult delete(String id){
		ActionResult result = new ActionResult(false);
		
		service.delete(id);
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/queryActivity.do")
	@ResponseBody
	public PageQueryResult queryByPage(int pageIndex,int pageSize){
		
		return service.queryByPage(pageIndex, pageSize);
	}
	
}
