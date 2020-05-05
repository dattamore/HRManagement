package com.wipro.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wipro.model.Employee;
import com.wipro.service.LoginService;

@Controller
public class LoginController {
//@RequestMapping("/login")
	
	@Autowired
	private LoginService loginService;
	
	public LoginController() {
		System.out.println(" LoginController inintialized--");
	
	}
	
	  @RequestMapping(value = "/login", method = RequestMethod.GET)
	   public String loginPage(Model model) {
	      return "login";
	   }
	  
	  
	  @RequestMapping(value = "/login/submit" , method = RequestMethod.POST)
	  public String submitCredentialspoat(@RequestParam("username") String id,@RequestParam("password") String password,Model model)
	    {
		 System.out.println(" submitCredentials psot success new--: "+id);
		 String[] s= loginService.validateUser(id,password);
	        model.addAttribute("empName", s[1]);
	        if( s[0]=="login") {
	        return "redirect:/login";
	        }else {
	        	//return s[0];
	        	 return "redirect:/"+s[0];
	        }
	    }

	/*
	 * @RequestMapping(value = "/login/submit" , method = RequestMethod.POST) public
	 * ModelAndView submitCredentialspoat(@RequestParam("username") String
	 * username,@RequestParam("password") String password) {
	 * System.out.println(" submitCredentials psot success--: "+username);
	 * //model.addAttribute("employees", "datta"); ModelAndView m = new
	 * ModelAndView(); m.addObject("fullname", "datta"); m.setViewName("login");
	 * return m; //return "login"; }
	 */
		
		@RequestMapping("*")
		@ResponseBody
		public String fallbackMethod(){
			return "fallback method";
		}
			
}
