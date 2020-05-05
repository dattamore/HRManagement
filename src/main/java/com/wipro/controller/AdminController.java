package com.wipro.controller;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wipro.model.EmployeeRequestDetails;
import com.wipro.service.UserService;

@Controller
public class AdminController {


	@Autowired
	UserService userService;
	
	public AdminController() {
		System.out.println(" AdminController inintialized--//");
	}
	
	 @RequestMapping(value = "/adminhome", method = RequestMethod.GET)
	   public String loginPage(Model model) {
		 System.out.println("AdminController home method--");
	      return "/adminhome";
	   }
	 @RequestMapping(value = "/getOpenStatusData", method = RequestMethod.POST)
	 @ResponseBody
	 public List getOpenStatusData(@RequestBody EmployeeRequestDetails emprd) {
		 System.out.println(" AdminController getOpenStatusData method-- : ");
		 List<EmployeeRequestDetails> l= userService.getOpenStatusData();
	      return l;
	   }
	 
	 @RequestMapping(value = "/updateStatus", method = RequestMethod.GET)
	   public String updateStatus(Model model) {
		 System.out.println(" AdminController updateStatus method--");
	      return  "/updateStatus";
	   }
	 
	 @RequestMapping(value = "/getDatatoAdmin", method = RequestMethod.POST)
	 @ResponseBody
	   public List getDatatoAdmin(@RequestBody EmployeeRequestDetails emprd) {
		// System.out.println(" user controlleer getDataeditRequest method--"+emprd.getRequestNumber());
		 List<EmployeeRequestDetails> l= userService.getDatatoAdmin(emprd);
	      return  l;
	   }
	 
	 //setStatus
	 @RequestMapping(value = "/setStatus", method = RequestMethod.POST)
	 @ResponseBody
	   public List setStatus(@RequestBody EmployeeRequestDetails emprd) {
		// System.out.println(" user controlleer getDataeditRequest method--"+emprd.getRequestNumber());
		 List<EmployeeRequestDetails> l= userService.setStatus(emprd);
	      return  l;
	   }
}
