<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BGV – Home</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
$.urlParam = function (name) {
	console.log("jquery callef");
    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
                      .exec(window.location.href);
    if (results == null) {
         return 0;
    }
    return results[1] || 0;
}

console.log($.urlParam('empName'));
var empname=$.urlParam('empName')
if(empname !=0){
	console.log("i if--");
	localStorage.setItem("empname", empname);
	}
	$("#welcomeMsg").text("Welcome "+localStorage.getItem("empname"));
	
	 $.bindCallBAck = function(response){
			for (i =0; i<response.length; i++) {
				 // x += response[i] + "<br>";
				  //console.log( response[i]);
				 var markup;
				 var value=1;
				 var requestNumber = response[i].requestNumber;
				 var userName = response[i].userName;
				 var empId;
				 var dateSubmitted = response[i].dateSubmitted;
				 var status = response[i].status;
		            markup = "<tr><td id='reqNo" + value + "'>" + requestNumber + "</td>"
		            
		            if(userName=="Ram"){
		            	empId=123456;
		            	 markup += "<td id='empNo" + value + "'>" + empId + "</td>"
		            }else{
		            	empId=654321;
		            	 markup += "<td id='empNo" + value + "'>" + empId + "</td>"
		            }
		            
		            
		            markup += "<td id='empName" + value + "'>" + userName + "</td><td id='dc" + value + "' >" + dateSubmitted + "</td><td id='status" + value + "' >" + status + "</td>"
		                    // +" <td><a href='editRequest' class='button'>Edit</a></td></tr>";
		                
		        	 markup +=" <td><a id='updateStatus" + value + "' href='updateStatus' onClick = 'anchorClickUpdate("+ requestNumber + ",\""+ userName + "\")' class='button'>updateStatus</a></td></tr>";
		          
		          
		            $("table tbody").append(markup); 
		            value++;
			}
				}
			
	$(function () {
 
        var userName=localStorage.getItem("empname");
        console.log("getting admin data ----: "+userName);
           // e.preventDefault();
            $.ajax({
                type: 'post',
                url: 'getOpenStatusData',
                data: '{"userName":"'+userName+'"}',
                dataType: 'json',
              //  dataType: 'FormData', dateSubmitted; private String status <input type="hidden" id="myFile" value="1234"> userName
                processData: true,
                contentType: 'application/json',   
               
                success: function (response) {
                    //$('form')[0].reset();
                   // $("#feedback").text(response);
                   console.log(" response: ");
                   console.log(response);
                   if(response=="") {
                	 //  $("#errorMsg").attr("style", "display:block;color:red;position: relative;left: 668px;font-size: large;").text("Something went wrong,Please try again");
                	   $("#titleMsg").attr("style", "display:none;");
                	   $("#table").attr("style", "display:none;");
                	
                	   
                   }else{
                	   $("#errorMsg").attr("style", "display:none;");
                	   $.bindCallBAck(response);
                   }
                  
                    if(response=="True") {
                       // $('form')[0].reset();
                       // $("#feedback").text("Your information has been stored.");
                       alert("sucess");
                    }
                    else{
                      //  $("#feedback").text(" Some Error has occured Errror !!! ID duplicate");
                    	//alert("failed");
                }
                },
                error: function(xhr){
                	console.log("An admin error occured: " + xhr.status + " " + xhr.statusText);
                },
                complete: function(xhr,status){
                	console.log("An admin completion occured: "+xhr + " status: "+status);
                }
            });
    });
	
  });
</script>
<script>
function anchorClickUpdate(requestNumber,user){
	  //alert("The paragraph was clicked."+requestNumber+ " user: "+user);
		//console.log( $(this).attr('id'));
		localStorage.setItem("requestNumber", requestNumber);
		localStorage.setItem("user", user);
	
}


function preventBack() { 
    window.history.forward();  
} 
  
setTimeout("preventBack()", 0); 
  
window.onunload = function () { null };
function logouts() {

	localStorage.setItem("requestNumber", null);
	localStorage.setItem("empname", null);
	 var r = confirm("Do you want to logout ?!");
	  if (r == true) {
		  
	       // window.history.forward();
	        window.location.href="logout";
	       // history.back();
	       
	    } else {
	        // Stay on the current page.
	         console.log("false");
	     
	    }

}
</script>
<style>
.sidenav {
  height: 100%;
  width:17% ;
  position: absolute;
  z-index: 15;
  top: 60;
  left: 0;
  background-color: #e4eeef;
  overflow-x: hidden;

  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;

}
 
.sidenav a:hover {
  color: black;
}

.divTable{
    color: #1c1a1a;
    margin-left: auto;
    clear: left;
    left: 500px;
    position: relative;
}
table, th, td {
  border: 1px solid black;
   padding: 15px;
}
.button {
     background-color: #4b64c0;
    border: none;
    border-radius: 12px;
    color: white;
    padding: 10px 22px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
}
</style>
</head>
<body>
<h1>WIPRO</h1>
<h1 style="text-align: center;">BGV</h1>
<div id="mySidenav" class="sidenav">
<!--   <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
  <a href="adminhome">Home</a>
  
  <a id="logouts" href="#"  onClick = "logouts(event);" >LogOut</a>
 
</div>

<div id="titleMsg" style="display:block;color:black;position: relative;left: 499px;font-size:x-large;">Requests pending for approval</div>
<Label id="welcomeMsg" style="margin-left: 1091px; font-size: larger;">Welcome </Label>
<div id="errorMsg" style="display:block;color:red;position: relative;left: 668px;font-size: large;">No requests to display</div>
<div id="divTable" class="divTable">
<table id="table">
<thead>
  <tr>
    <th>Request Number</th>
    <th>Employee Id</th>
    <th>Employee Name</th>
    <th>Date Submitted</th>
    <th>Status</th>
    <th>Action</th>
  </tr>
  </thead>
  <tbody>
  
  </tbody>
  <!-- <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>Germany</td>
    <td>Germany</td>
    <td>open</td>
    <td><a href="updateStatus" class="button">update status</a></td>
    <td><button class="button">Edit</button></td>
  </tr> -->


 
</table>
</div>


</body>
</html>