package com.wipro.model;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.DateSerializer;

public class EmployeeRequestDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	private String companyName1;
	private String doj1;
	private String lastwd1;
	private String address1;
	private String companyName2;
	private String doj2;
	private String lastwd2;
	private String address2;
	private String hdegree;
	private String college;
	private String passedOutYear;

	private int requestNumber=0; 
	private String dateSubmitted; 
	private String status;
	private String userName;
	 
	
	
	public EmployeeRequestDetails() {}
	@JsonCreator
	public EmployeeRequestDetails(@JsonProperty("companyName1") String companyName1, @JsonProperty("doj1") String doj1, @JsonProperty("lastwd1") String lastwd1, @JsonProperty("address1") String address1,
			@JsonProperty("companyName2") String companyName2, @JsonProperty("doj2") String doj2, @JsonProperty("lastwd2") String lastwd2, @JsonProperty("address2") String address2, @JsonProperty("hdegree") String hdegree, @JsonProperty("college") String college,
			@JsonProperty("passedOutYear") String passedOutYear,@JsonProperty("dateSubmitted") String dateSubmitted,@JsonProperty("status") String status,
			@JsonProperty("userName") String userName) {
		super();
		this.companyName1 = companyName1;
		this.doj1 = doj1;
		this.lastwd1 = lastwd1;
		this.address1 = address1;
		this.companyName2 = companyName2;
		this.doj2 = doj2;
		this.lastwd2 = lastwd2;
		this.address2 = address2;
		this.hdegree = hdegree;
		this.college = college;
		this.passedOutYear = passedOutYear;
		this.dateSubmitted = dateSubmitted;
		this.status = status;
		this.userName = userName;
		/*
		 * this.requestNumber = this.requestNumber++;
		 * System.out.println("requestNumber : "+requestNumber);
		 */
	}
	public String getCompanyName1() {
		return companyName1;
	}
	public void setCompanyName1(String companyName1) {
		this.companyName1 = companyName1;
	}
	public String getDoj1() {
		return doj1;
	}
	public void setDoj1(String doj1) {
		this.doj1 = doj1;
	}
	public String getLastwd1() {
		return lastwd1;
	}
	public void setLastwd1(String lastwd1) {
		this.lastwd1 = lastwd1;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getCompanyName2() {
		return companyName2;
	}
	public void setCompanyName2(String companyName2) {
		this.companyName2 = companyName2;
	}
	public String getDoj2() {
		return doj2;
	}
	public void setDoj2(String doj2) {
		this.doj2 = doj2;
	}
	public String getLastwd2() {
		return lastwd2;
	}
	public void setLastwd2(String lastwd2) {
		this.lastwd2 = lastwd2;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getHdegree() {
		return hdegree;
	}
	public void setHdegree(String hdegree) {
		this.hdegree = hdegree;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}

	public String getPassedOutYear() {
		return passedOutYear;
	}
	public void setPassedOutYear(String passedOutYear) {
		this.passedOutYear = passedOutYear;
	}

	
	  public Integer getRequestNumber() 
	  { 
		  return requestNumber; 
	  } 
	  public void setRequestNumber(Integer requestNumber) 
	  {
		  this.requestNumber = requestNumber;
	  } 
	  public String getDateSubmitted() { return dateSubmitted; } public void
	  setDateSubmitted(String dateSubmitted) { this.dateSubmitted = dateSubmitted;
	  } 
	  public String getStatus() { return status; } 
	  
	  public void setStatus(String status) { this.status = status; }
	  public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
	  
		@Override
		public String toString() {
			return "EmployeeRequestDetails [companyName1=" + companyName1 + ", doj1=" + doj1 + ", lastwd1=" + lastwd1
					+ ", address1=" + address1 + ", companyName2=" + companyName2 + ", doj2=" + doj2 + ", lastwd2="
					+ lastwd2 + ", address2=" + address2 + ", hdegree=" + hdegree + ", college=" + college
					+ ", passedOutYear=" + passedOutYear + ", requestNumber=" + requestNumber + ", dateSubmitted="
					+ dateSubmitted + ", status=" + status + ", userName=" + userName + "]";
		}
	
	
}
