package com.wipro.service;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.stereotype.Service;
import com.wipro.model.Employee;

@Service
public class LoginService {
	
	List<Employee> employeeList ;
	public LoginService() {
		
			System.out.println(" LoginService inintialized--");
		    employeeList = Arrays.asList(new Employee("Ram","123456","wipro@123"),new
					  Employee("Sam","654321","wipro@123"),new
					  Employee("Admin","admin","admin@123"));
	}

	public String[] validateUser(String id, String password) {
		System.out.println(" LoginService validateUser--  id: "+id +" password: "+password);
		String[] s= new String[3];
	     Stream<Employee> employeeStream = employeeList.stream();
	     List<Employee> highNums = employeeStream.filter(emp -> emp.getId().equals(id) && emp.getPassword().equals(password))
	    		                       .collect(Collectors.toList());
	  
	   if( ! highNums.isEmpty()) {
		   System.out.println("string 0: "+highNums.get(0).getName());
		     
		    // highNums.forEach(emp -> System.out.println(emp.getName()));
		     if(highNums.get(0).getId().equals("123456") || highNums.get(0).getId().equals("654321")) {
		    	 s[0]="home";
		    	 s[1]=highNums.get(0).getId().equals("123456")?"Ram" : "Sam";
		     }else if(highNums.get(0).getId().equals("admin")){
		    	 s[0]="adminhome";
		    	 s[1]="Admin";
		     }
	   }else {
	    	 s[0]="login";
	    	 s[1]="NOEMPLOYEE";
	     }
	     return s;
	}

}
