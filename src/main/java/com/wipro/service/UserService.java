package com.wipro.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import javax.sound.midi.SysexMessage;

import org.springframework.stereotype.Service;

import com.wipro.model.EmployeeRequestDetails;

@Service
public class UserService {

	public UserService() {
		super();
		System.out.println("UserService inintilized 4--");
		
	}
	
	List<EmployeeRequestDetails> ram =new ArrayList();
	List<EmployeeRequestDetails> sam =new ArrayList();
	private int requestNumber=0; 
	private int index=0; 

	public void saveData(EmployeeRequestDetails emprd) {
		// TODO Auto-generated method stub
	//	System.out.println("UserService  4--"+emprd.toString());
		emprd.setRequestNumber(++requestNumber);
	//	System.out.println(" requestNumber :"+requestNumber);
		
		if(emprd.getUserName().equalsIgnoreCase("ram")) {
			ram.add(emprd);
			
		}else {
			sam.add(emprd);
		}
	//	ram.forEach(a -> System.out.println("savedaata : "+a));
	}

	public List<EmployeeRequestDetails> getUserData(String username) {
		if(username.equalsIgnoreCase("ram")) {
			ram.forEach(a -> System.out.println("ram : "+a));
			return ram;
			
		}else {
			sam.forEach(a -> System.out.println("sam : "+a));
			return sam;
		}
	}

	public  List<EmployeeRequestDetails> getDatatoEdit(EmployeeRequestDetails emprd) {
		// TODO Auto-generated method stub
		 List<EmployeeRequestDetails> result;
		 index=0;
		if(emprd.getUserName().equalsIgnoreCase("ram")) {
		 result = ram.stream()               
	                .filter(ram ->emprd.getRequestNumber()==ram.getRequestNumber())   
	                .collect(Collectors.toList());   
		 
		 for(Object e:ram) {
				index++;
				EmployeeRequestDetails w=(EmployeeRequestDetails) e;
				if(w.getRequestNumber()==emprd.getRequestNumber())
					break;
				
			}
		}else {
		 result = sam.stream()               
		                .filter(ram ->emprd.getRequestNumber()==ram.getRequestNumber())   
		                .collect(Collectors.toList()); 
		 
		 for(Object e:sam) {
				index++;
				EmployeeRequestDetails w=(EmployeeRequestDetails) e;
				if(w.getRequestNumber()==emprd.getRequestNumber())
					break;
				
			}
		}

	  	//	System.out.println(" index : "+(index-1));
	        return result;
		
	}
	
	public void updateDataeditRequest(EmployeeRequestDetails emprd) {
		// TODO Auto-generated method stub
		try {
		if(emprd.getUserName().equalsIgnoreCase("ram")) {
	     ram.set(index-1, emprd);
		}else {
		sam.set(index-1, emprd);
		}
		}catch(Exception e) {
			
		}finally {
		index=0;
		}
		//ram.forEach(a -> System.out.println("ram : "+a));
				//sam.forEach(a -> System.out.println("sam : "+a));
		
	}

		
	public List<EmployeeRequestDetails> getOpenStatusData() {
		System.out.println("getOpenStatusData");
		 List<EmployeeRequestDetails> result;
	   	 List<EmployeeRequestDetails> result2;
		 List<EmployeeRequestDetails> orderedList = new ArrayList();
		 int size=0;
			
		 result = ram.stream()               
	                .filter(ram ->"Open".equals(ram.getStatus())) 
	                .collect(Collectors.toList());
		 result.forEach(a -> System.out.println("only ram openstatus : "+a));
			 
		
		  result2 = sam.stream() .filter(sam ->"Open".equals(sam.getStatus()))
		  .collect(Collectors.toList());
		  
		  result.addAll(result2);
		  result.forEach(a -> System.out.println("added sam openstatus : "+a));
		  
		/* ascending order with respect to request number */
		size=  ram.size() +sam.size();
		
		for(int i=1;i<=size;i++) {
		Iterator itr=	result.iterator();
		 while (itr.hasNext()) { 
			 EmployeeRequestDetails o=(EmployeeRequestDetails)itr.next() ;
			 
			 System.out.println("********************* ");
			 if( o.getRequestNumber()==i) {
				 System.out.println(" o.getRequestNumber() : "+o.getRequestNumber()+ " i : "+i);
				int ind= result.indexOf(o);
				 System.out.println("index:  "+ind);
					EmployeeRequestDetails resul=result.get(ind);
					System.out.println("EmployeeRequestDetails object add:  "+resul);
					orderedList.add(resul);
				}
	        } 
			
		}
	 System.out.println("orderedList : "+orderedList);
		 
		return orderedList;
		}
	

	public  List<EmployeeRequestDetails> getDatatoAdmin(EmployeeRequestDetails emprd) {
		// TODO Auto-generated method stub
		 List<EmployeeRequestDetails> result;
		
		if(emprd.getUserName().equalsIgnoreCase("ram")) {
		 result = ram.stream()               
	                .filter(ram ->emprd.getRequestNumber()==ram.getRequestNumber())   
	                .collect(Collectors.toList());   
		}else {
		 result = sam.stream()               
		                .filter(sam ->emprd.getRequestNumber()==sam.getRequestNumber())   
		                .collect(Collectors.toList()); 
		}

	  	//	System.out.println(" index : "+(index-1));
	        return result;
		
	}

	public List<EmployeeRequestDetails> setStatus(EmployeeRequestDetails emprd) {
		// TODO Auto-generated method stub
		 List<EmployeeRequestDetails> result;
		 int adminindex=0;
		 
		if(emprd.getUserName().equalsIgnoreCase("ram")) {
					 
			 for(Object e:ram) {
					adminindex++;
					EmployeeRequestDetails w=(EmployeeRequestDetails) e;
					if(w.getRequestNumber()==emprd.getRequestNumber())
						break;
			 		}
			 EmployeeRequestDetails resul=ram.get(adminindex-1);
			 resul.setStatus(emprd.getStatus());
			}else {
				 for(Object e:sam) {
						adminindex++;
						EmployeeRequestDetails w=(EmployeeRequestDetails) e;
						if(w.getRequestNumber()==emprd.getRequestNumber())
							break;
				 		}
				 EmployeeRequestDetails resul=sam.get(adminindex-1);
				 resul.setStatus(emprd.getStatus());
			}
		
		adminindex=0;
		System.out.println(" status list : "+ram);
		return null;
	}

}
