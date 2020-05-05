package com.wipro.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wipro.model.EmployeeRequestDetails;
import com.wipro.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	public UserController() {
		//System.out.println(" UserController inintialized--");
	}
	
	 @RequestMapping(value = "/home", method = RequestMethod.GET)
	   public String loginPage(Model model) {
		// System.out.println(" user controlleer home method--");
	      return "/home";
	   }
	 
	 @RequestMapping(value = "/getUserData", method = RequestMethod.POST)
	 @ResponseBody
	   public List getUserData(@RequestBody EmployeeRequestDetails emprd) {
		// System.out.println(" user controlleer getUserData method-- : ");
		List<EmployeeRequestDetails> l= userService.getUserData(emprd.getUserName());
	      return l;
	   }
	
	 
	 @RequestMapping(value = "/logout", method = RequestMethod.GET)
	   public String logout(Model model) {
		// System.out.println(" user controlleer logout method--");
	      return  "redirect:/login";
	   }
	 
	 @RequestMapping(value = "/createRequest", method = RequestMethod.GET)
	   public String createRequest(Model model) {
		// System.out.println(" user controlleer createRequest method--");
	      return  "/createRequest";
	   }
	 @RequestMapping(value = "/editRequest", method = RequestMethod.GET)
	   public String editRequest(Model model) {
		// System.out.println(" user controlleer editRequest method--");
	      return  "/editRequest";
	   }
	 
	 @RequestMapping(value = "/getDataeditRequest", method = RequestMethod.POST)
	 @ResponseBody
	   public List getDataeditRequest(@RequestBody EmployeeRequestDetails emprd) {
		// System.out.println(" user controlleer getDataeditRequest method--"+emprd.getRequestNumber());
		 List<EmployeeRequestDetails> l= userService.getDatatoEdit(emprd);
	      return  l;
	   }
	 
	

	 @RequestMapping(value = "/updateDataeditRequest", method = RequestMethod.POST)
	 @ResponseBody
	   public List updateDataeditRequest(@RequestBody EmployeeRequestDetails emprd) {
		 System.out.println(" user controlleer updateDataeditRequest method--"+emprd.getRequestNumber());
		// List<EmployeeRequestDetails> l= userService.getDatatoEdit(emprd);
		 userService.updateDataeditRequest(emprd);
		 List<EmployeeRequestDetails> l =new ArrayList();
	      return  l;
	   }
	 @RequestMapping(value = "/createRequestAdd", method = RequestMethod.POST)
	   public String createRequestAdd(@RequestBody EmployeeRequestDetails emprd) {
		 System.out.println("-------------------");
		// System.out.println(" EmployeeRequestDetails data : "+emprd.toString());
		userService.saveData(emprd);
		 
	      return  "/createRequest";
	   }
	 
	 @RequestMapping(value = "/getTime", method = RequestMethod.GET)
	 @ResponseBody
	    public String getTime(Model model)
	    {
		 System.out.println(" date controlleer success--");
		   Date d= new Date();
	        //model.addAttribute("employees", "datta"); , consumes="application/json"
	        return d.toString();
	    }
}
