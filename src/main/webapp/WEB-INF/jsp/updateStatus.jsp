<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BGV - Update Status</title>
<style type="text/css">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

  $(document).ready(function(){
		
	  var userName=localStorage.getItem("user");
      var requestNumber=localStorage.getItem("requestNumber");
      $("#welcomeMsg").text("Welcome "+localStorage.getItem("empname"));
		console.log("document.rady update status called");
	
		 $.bindCallBAck = function(response){
			console.log(" 0 :" + response[0].requestNumber);
			$("#companyName1").text(response[0].companyName1);
			$("#doj1").text(response[0].doj1);
			$("#lastwd1").text(response[0].lastwd1);
			$("#address1").text(response[0].address1);
			$("#companyName2").text(response[0].companyName2);
			$("#doj2").text(response[0].doj2);
			$("#lastwd2").text(response[0].lastwd2);
			$("#address2").text(response[0].address2);
			$("#hdegree").text(response[0].hdegree);
			$("#college").text(response[0].college);
			$("#passedOutYear").text(response[0].passedOutYear);
		
		}
		
		
		$(function () {

           
            console.log("getting admin updatestatus data ----userName: "+userName);
            console.log("getting admin updatestatus data ----requestNumber: "+requestNumber);
               // e.preventDefault();
                $.ajax({
                    type: 'post',
                    url: 'getDatatoAdmin',
                    data: '{"userName":"'+userName+'","requestNumber":"'+requestNumber+'"}',
                    dataType: 'json',
                  //  dataType: 'FormData', dateSubmitted; private String status <input type="hidden" id="myFile" value="1234"> userName
                    processData: true,
                    contentType: 'application/json',   
                   
                    success: function (response) {
                        //$('form')[0].reset();
                       // $("#feedback").text(response);
                       //console.log(" response1: ");
                       if(response=="") {
                    	 //  $("#errorMsg").attr("style", "display:block;color:red;position: relative;left: 668px;font-size: large;").text("Something went wrong,Please try again");
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
                    	console.log("An error occured: " + xhr.status + " " + xhr.statusText);
                    },
                    complete: function(xhr,status){
                    	console.log("An completion occured: "+xhr + " status: "+status);
                    }
                });
        });
	
		$(function () {

	           
            console.log("getting admin updatestatus data ----userName: "+userName);
            console.log("getting admin updatestatus data ----requestNumber: "+requestNumber);
            $('form').on('submit', function (e) {
               
                    e.preventDefault();
        
                $.ajax({
                    type: 'post',
                    url: 'setStatus',
                    data: '{"userName":"'+userName+'","requestNumber":"'+requestNumber+'","status":"'+$("#status").val()+'"}',
                    dataType: 'json',
                  //  dataType: 'FormData', dateSubmitted; private String status <input type="hidden" id="myFile" value="1234"> userName
                    processData: true,
                    contentType: 'application/json',   
                   
                    success: function (response) {
                        //$('form')[0].reset();
                       // $("#feedback").text(response);
                       //console.log(" response1: ");
                       if(response=="") {
                       }else{
                    	   //$("#errorMsg").attr("style", "display:none;");
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
                    	console.log("An error occured: " + xhr.status + " " + xhr.statusText);
                    },
                    complete: function(xhr,status){
                    	
                    	console.log("An completion occured: ");
                   	 if(xhr.status==200) {
                       	   console.log(" response: in if ");
                       	 $('form')[0].reset();
                       	 $("#errorMsg").attr("style", "display:block;color:blue;position: relative;left: 668px;font-size: large;").text("Status Updated Successfully");
                       	 $("#titleMsg").attr("style", "display:none;");
                          }else{
                       	   console.log(" response: in else ");
                       	 $('form')[0].reset();
                       	 $("#errorMsg").attr("style", "display:block;color:red;position: relative;left: 668px;font-size: large;").text("Something went wrong,Please try again");
                       	   
                          }
                    }
                });
        });
	
		//setTimeout($.anchorClick(), 3000);
		//setTimeout("alert('Boom!');", 2000); onClick = "anchorClick();"
		/* $("#updateRequest").click(function(){
			  alert("The updateRequest was clicked.");
			//console.log( $(this).attr('id'));
		}); */
  });
  });
  
  function logouts(event) {
		//alert("logout");
		event.preventDefault();
		localStorage.setItem("requestNumber", null);
		localStorage.setItem("empname", null);
		 var r = confirm("Do you want to logout ?!");
		  if (r == true) {
		        // Call Back button programmatically as per user confirmation.
		       // window.history.forward();
		       
		        window.location.href="logout";
		       // preventBack();
		       // history.back();
		        // Uncomment below line to redirect to the previous page instead.
		        // window.location = document.referrer // Note: IE11 is not supporting this.
		    } else {
		        // Stay on the current page.
		         console.log("false");
		       // history.pushState(null, null, window.location.pathname);
		    }
		//window.history.forward();
		//javascript:window.history.forward(1);	
	}
  </script>
</head>

<body>
<h1>WIPRO</h1>
<h1 style="text-align: center;">BGV</h1>
<Label id="welcomeMsg" style="margin-left: 1091px; font-size: larger;">Welcome </Label>
<div id="mySidenav" class="sidenav">
<!--   <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
  <a href="adminhome">Home</a>
  
  <a id="logouts" href="#"  onClick = "logouts(event);" >LogOut</a>
 
</div>

<div id="titleMsg" style="display:block;color:black;position: relative;left: 499px;font-size:x-large;">Requests pending for approval</div>
<div id="errorMsg" style="display:block;color:red;position: relative;left: 668px;font-size: large;">No requests to display</div>
<div id="divTable" class="divTable">
<b> <p>previous company details -1:</p></b>
 <label for="companyName1">Company Name 1:</label>&nbsp;
 <!--  <input type="text" Id="companyName1" name="companyName1" value=""> -->
  <span id="companyName1" >IBM PVT LTD PUNE</span>
  <br>
 
  <label for="doj1">Date of Joining:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <span id="doj1" >IBM PVT LTD PUNE</span><br>
  
  <label for="lastwd1">Last Working Date:</label>&nbsp;
   <span id="lastwd1" >IBM PVT LTD PUNE</span><br>
 
  <label for="address1">Address:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
   <span id="address1" >IBM PVT LTD PUNE</span><br>

   <b> <p>previous company details -2:</p></b>
 <label for="companyName2">Company Name 2:</label>&nbsp;
   <span id="companyName2" >IBM PVT LTD PUNE</span><br>
 
  <label for="doj2">Date of Joining:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <span id="doj2" >IBM PVT LTD PUNE</span><br>
  
  <label for="lastwd2">Last Working Date:</label>&nbsp;
   <span id="lastwd2">IBM PVT LTD PUNE</span> <br>
 
  <label for="address2">Address:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <span id="address2" >IBM PVT LTD PUNE</span><br>
  
  
 <b> <p>Educational details :</p></b>
 <label for="hdegree">Highest Degree:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <span id="hdegree" >IBM PVT LTD PUNE</span><br>
 
  <label for="college">College/university</label>&nbsp;&nbsp;&nbsp;
   <span id="college" >IBM PVT LTD PUNE</span><br>
  
  <label for="passedOutYear">Passed out year:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <span id="passedOutYear" >IBM PVT LTD PUNE</span>  <br>
   
   <form action="/" method="post">
 <b> <p>New Status</p></b>
 <label for="status">Status:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <select id="status">
  <option value="approved">Approved</option>
  <option value="rejected">Rejected</option>
 
</select><br><br>
 
  <label for="remarks">Remarks:</label>&nbsp;&nbsp;&nbsp;
  <input type="text" Id="remarks" name="remarks" value="">  <br><br>
      <input class="button"  Id="updateStatus" type="submit" value="Submit">
</form>
   </div>
</body>
</html>