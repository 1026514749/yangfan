package com.sjmcrf.yangfan.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sjmcrf.yangfan.entity.Activity;
import com.sjmcrf.yangfan.entity.Case;
import com.sjmcrf.yangfan.entity.Column;
import com.sjmcrf.yangfan.entity.ColumnSimple;
import com.sjmcrf.yangfan.entity.Employee;
import com.sjmcrf.yangfan.entity.Evaluate;
import com.sjmcrf.yangfan.entity.Info;
import com.sjmcrf.yangfan.service.ActivityService;
import com.sjmcrf.yangfan.service.CaseService;
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
	private ColumnSimpleService columnSimpleSerivice;
	
	@Autowired
	private InfoService infoSerivice;
	
	@Autowired
	private EvaluateService evaluateService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/index.do")
	public String openIndex(HttpServletRequest request){
		//取公司信息
		Info info = infoSerivice.get();
		
		//取栏目信息
		List<Column> columns = columnService.queryAll();
		
		//取最新活动
		
		request.setAttribute("columns",columns);
		request.setAttribute("info",info);
		return "index";
	}
	
	@RequestMapping(value="index/openColumn.do")
	public String openColumn(String code,HttpServletRequest request){
		//取栏目
		Column column = columnService.getByCode(code);
		//取公司信息
		Info info = infoSerivice.get();
		//取经典案例
		List<Case> cases = caseService.queryAllByCode(code);
		
		//以下是首页需要的信息
		//取客户评价
		List<Evaluate> evaluates = evaluateService.queryAll();
		//取职员信息
		List<Employee> employees = employeeService.queryAll();
		//取栏目简介
		List<ColumnSimple> simples = columnSimpleSerivice.queryAll();
		
		
		if(column == null||column.getUrl() == null){
			column.setUrl("views/item");
		}
		
		
		request.setAttribute("column",column);
		request.setAttribute("info",info);
		request.setAttribute("evaluates",evaluates);
		request.setAttribute("employees",employees);
		request.setAttribute("cases",cases);
		request.setAttribute("simples",simples);
		return column.getUrl();
	}
	
	@RequestMapping(value="index/openActivity.do")
	public String openActivity(String id,HttpServletRequest request){
		Activity act = activityService.get(id);
		
		request.setAttribute("item",act);
		
		return "views/blank";
	}
	
	@RequestMapping(value="index/openCase.do")
	public String openCase(String id,HttpServletRequest request){
		Case ncase = caseService.get(id);
		
		request.setAttribute("item",ncase);
		
		return "views/blank";
	}
}
