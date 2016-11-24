package com.sjmcrf.yangfan.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sjmcrf.yangfan.dto.ActionResult;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Employee;
import com.sjmcrf.yangfan.service.EmployeeService;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService service;
	
	@RequestMapping(value="/admin/employeeList.do")
	public String employeeList(){
		
		return "admin/employee-list";
	}
	
	@RequestMapping(value="/admin/employee.do")
	public String employee(String id,HttpServletRequest request,HttpServletResponse response){
		
		Employee employee = service.get(id);		
		
		request.setAttribute("employee", employee);
		
		return "admin/employee";
	}
	@RequestMapping(value="/admin/modifyEmployee.do")
	@ResponseBody
	public ActionResult modify(Employee employee,HttpServletRequest request){
		ActionResult result = new ActionResult(false);
		
		if(employee.getId() == null||"".equals(employee.getId())){
			service.insert(employee);
		}else{
			service.update(employee);
		}
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/deleteEmployee.do")
	@ResponseBody
	public ActionResult delete(String id){
		ActionResult result = new ActionResult(false);
		
		service.delete(id);
		
		result.setSuccess(true);
		return result;
	}
	@RequestMapping(value="/admin/queryEmployee.do")
	@ResponseBody
	public PageQueryResult queryByPage(int pageIndex,int pageSize){
		
		return service.queryByPage(pageIndex, pageSize);
	}
	
}
