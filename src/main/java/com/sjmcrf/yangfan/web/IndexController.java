package com.sjmcrf.yangfan.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sjmcrf.yangfan.entity.Activity;
import com.sjmcrf.yangfan.entity.Case;
import com.sjmcrf.yangfan.entity.Column;
import com.sjmcrf.yangfan.entity.ColumnDetail;
import com.sjmcrf.yangfan.entity.ColumnSimple;
import com.sjmcrf.yangfan.entity.Employee;
import com.sjmcrf.yangfan.entity.Evaluate;
import com.sjmcrf.yangfan.entity.Info;
import com.sjmcrf.yangfan.service.ActivityService;
import com.sjmcrf.yangfan.service.CaseService;
import com.sjmcrf.yangfan.service.ColumnDetailService;
import com.sjmcrf.yangfan.service.ColumnService;
import com.sjmcrf.yangfan.service.ColumnSimpleService;
import com.sjmcrf.yangfan.service.EmployeeService;
import com.sjmcrf.yangfan.service.EvaluateService;
import com.sjmcrf.yangfan.service.InfoService;
@Controller
public class IndexController {
	
	@Autowired
	private ColumnService columnService;
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private CaseService caseService;
	
	@Autowired
	private ColumnSimpleService columnSimpleService;
	
	@Autowired
	private ColumnDetailService columnDetailService;
	
	@Autowired
	private InfoService infoSerivice;
	
	@Autowired
	private EvaluateService evaluateService;
	
	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping(value="/index/column.do")
	public String openColumn(String code,HttpServletRequest request){
		getCommoninfo(request);
		
		if(code == null){
			code = "index";
		}
		//取栏目
		Column column = columnService.getByCode(code);
		
		//取栏目内容
		ColumnDetail columnDetail = columnDetailService.getByCode(code);

		//取经典案例
		List<Case> cases = caseService.queryAllByCode(code);
		
		
		//以下是首页需要的信息
		//取客户评价
		List<Evaluate> evaluates = evaluateService.queryAll();
		if(evaluates.size()>5){
			evaluates = evaluates.subList(0, 5);
		}
		//取职员信息
		List<Employee> employees = employeeService.queryAll();
		//取栏目简介
		List<ColumnSimple> simples = columnSimpleService.queryAll();
		
		
		
		request.setAttribute("item",columnDetail);
		request.setAttribute("evaluates",evaluates);
		request.setAttribute("employees",employees);
		request.setAttribute("cases",cases);
		request.setAttribute("simples",simples);
		
		
		if(column == null||column.getUrl() == null){
			return "index";
		}else{
			return column.getUrl();
		}
			
	}
	
	@RequestMapping(value="/index/activity.do")
	public String openActivity(String id,HttpServletRequest request){
		getCommoninfo(request);
		
		Activity act = activityService.get(id);
		
		request.setAttribute("item",act);
		
		return "blank";
	}
	
	@RequestMapping(value="/index/case.do")
	public String openCase(String id,HttpServletRequest request){
		getCommoninfo(request);
		
		Case ncase = caseService.get(id);
		
		request.setAttribute("item",ncase);
		
		return "blank";
	}
	
	@RequestMapping(value="/admin/index.do")
	public String aminIndex(HttpServletRequest request){
		
		return "admin/index";
	}
	
	public void getCommoninfo(HttpServletRequest request){
		//取公司信息
		Info info = infoSerivice.get();
				
		//取栏目信息
		List<Column> columns = columnService.queryAll();
				
		//取最新活动
		List<Activity> activitys = activityService.queryAll();
		if(activitys.size()>2){
			activitys = activitys.subList(0, 2);
		}
		request.setAttribute("columns",columns);
		request.setAttribute("info",info);
		request.setAttribute("activitys",activitys);
	}
}
