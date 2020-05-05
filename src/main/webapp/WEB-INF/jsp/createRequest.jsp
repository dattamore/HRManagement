<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>BGV - Create Request</title>
</head>
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
.divForm{
    color: #1c1a1a;
    margin-left: auto;
    clear: left;
    left: 500px;
    position: relative;
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
<script type="text/javascript">

  $(document).ready(function(){
		
console.log("create request page ready");
		$("#welcomeMsg").text("Welcome "+localStorage.getItem("empname"));
		
	

	
		
	    $.showErrorMsg = function (name) {
		if(empname=="NOEMPLOYEE"){
			$("#errors").attr("style", "display:block; color:red;margin-left: 384px;");
		}else{
			$("#errors").attr("style", "display:none; color:red");
		}
	}
		//$.showErrorMsg(empname);
  });
  </script>
<body>
<h1>WIPRO</h1>
<h1 style="text-align: center;">BGV</h1>
<Label id="welcomeMsg" style="margin-left: 1091px; font-size: larger;">Welcome </Label>
<div id="mySidenav" class="sidenav">
<!--   <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
  <a href="home">Home</a>
  <a href="createRequest">Create Request</a>
  <a id="logouts" href="#"  onClick = "logouts(event);" >LogOut</a>
 
</div>

<div id="errorMsg" style="display:block;color:red;position: relative;left: 668px;font-size: large;">
</div> 
<div id="divForm" class="divForm">

<h1>Create Request</h1>
<h4>Employment History</h4>

<form id="form" action="createRequestAdd" method="post">
 <b> <p>previous company details -1:</p></b>
 <label for="companyName1">Company Name 1:</label>&nbsp;
  <input type="text" Id="companyName1" name="companyName1" pattern="[A-Za-z0-9 ]+" title="Enter AlphaNumeric Values Only"  maxlength="50" value="" required><br>
 
  <label for="doj1">Date of Joining:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" Id="doj1" name="doj1"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])-(0[1-9]|1[012])-[0-9]{4}"
  title="Enter in (dd-mm-yyyy) format" value="" required>  dd-mm-yyyy<br>
  
  <label for="lastwd1">Last Working Date:</label>&nbsp;
  <input type="text" Id="lastwd1" name="lastwd1"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])-(0[1-9]|1[012])-[0-9]{4}"
 title="Enter in (dd-mm-yyyy) format"  value="" required>  dd-mm-yyyy<br>
 
  <label for="address1">Address:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
  <input type="text" Id="address1" name="address1" pattern="[A-Za-z0-9 ]+" title="Enter AlphaNumeric Values Only"  maxlength="50" value="" required><br>

   <b> <p>previous company details -2:</p></b>
 <label for="companyName2">Company Name 2:</label>&nbsp;
  <input type="text" Id="companyName2" name="companyName2" pattern="[A-Za-z0-9 ]+" title="Enter AlphaNumeric Values Only"  maxlength="50" value="" required><br>
 
  <label for="doj2">Date of Joining:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" Id="doj2" name="doj2"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])-(0[1-9]|1[012])-[0-9]{4}"
 title="Enter in (dd-mm-yyyy) format" value="" required>  dd-mm-yyyy<br>
  
  <label for="lastwd2">Last Working Date:</label>&nbsp;
  <input type="text"  Id="lastwd2" name="lastwd2"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])-(0[1-9]|1[012])-[0-9]{4}"
 title="Enter in (dd-mm-yyyy) format"  value="" required>  dd-mm-yyyy<br>
 
  <label for="address2">Address:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" Id="address2" name="address2" pattern="[A-Za-z0-9 ]+" title="Enter AlphaNumeric Values Only"  maxlength="50" value="" required><br>
  
  
 <b> <p>Educational details :</p></b>
 <label for="hdegree">Highest Degree:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" Id="hdegree" name="hdegree" pattern="[A-Za-z0-9 ]+" title="Enter AlphaNumeric Values Only"  maxlength="50" value="" required><br>
 
  <label for="college">College/university</label>&nbsp;&nbsp;&nbsp;
  <input type="text" Id="college" name="college" pattern="[A-Za-z0-9 ]+" title="Enter AlphaNumeric Values Only"  maxlength="50"  value="" required><br>
  
  <label for="passedOutYear">Passed out year:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="text" Id="passedOutYear" name="passedOutYear" maxlength="4" size="4" pattern="[0-9]{4}" value="" required>  yyyy<br> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input class="button"  Id="createRequest" type="submit" value="Submit">
</form>

</div>
</body>
<script>

        $(function () {

            $('form').on('submit', function (e) {
            console.log("sending data");
         
            //var dateSubmitted = new Date("MM/DD/YYYY");
            const date = new Date();
            const dateSubmitted = date.toLocaleDateString('nl', {
            day: '2-digit', month: '2-digit', year: 'numeric'
            }).replace(/ /g, '-');
            
            // d.getDate()+"-"+(d.getMonth()+1)+"-"+d.getFullYear();
        
            var userName=localStorage.getItem("empname");
          
                e.preventDefault();
            
              
                $.ajax({
                    type: 'post',
                    url: 'createRequestAdd',
                    data: '{ "companyName1":"'+$("#companyName1").val()+'", "doj1":"'+$("#doj1").val()+'", "lastwd1":"'+$("#lastwd1").val()+'" ,"address1":"'+$("#address1").val()+'","companyName2":"'+$("#companyName2").val()+'", "doj2":"'+$("#doj2").val()+'", "lastwd2":"'+$("#lastwd2").val()+'" ,"address2":"'+$("#address2").val()+'","hdegree":"'+$("#hdegree").val()+'", "college":"'+$("#college").val()+'", "passedOutYear":"'+$("#passedOutYear").val()+'", "dateSubmitted":"'+dateSubmitted+'", "status":"Open" , "userName":"'+userName+'" }',
                    dataType: 'json',
                  //  dataType: 'FormData', dateSubmitted; private String status <input type="hidden" id="myFile" value="1234"> userName
                    processData: false,
                    contentType: 'application/json',   
                   
                    success: function (response) {
                        //$('form')[0].reset();
                       // $("#feedback").text(response);
                       console.log(" response: ");
                       console.log(" response: "+response);
                       if(response=="") {
                    	   console.log(" response: in if ");
                    	   $("#errorMsg").attr("style", "display:block;color:red;position: relative;left: 668px;font-size: large;").text("Something went wrong,Please try again");
                       }else{
                    	   console.log(" response: in else ");
                    	   $("#errorMsg").attr("style", "display:block;color:blue;position: relative;left: 668px;font-size: large;").text("Request Created Successfully");
                       }
                  
                    },
                    error: function(xhr){
                    	console.log("An error occured: " + xhr.status + " " + xhr.statusText);
                    },
                    complete: function(xhr,status){
                    	console.log("An completion occured: ");
                    	console.log(xhr);
                    	
                    	 if(xhr.status==200) {
                      	   console.log(" response: in if ");
                      	 $('form')[0].reset();
                      	 $("#errorMsg").attr("style", "display:block;color:blue;position: relative;left: 668px;font-size: large;").text("Request Created Successfully");
                      	   
                         }else{
                      	   console.log(" response: in else ");
                      	 $('form')[0].reset();
                      	 $("#errorMsg").attr("style", "display:block;color:red;position: relative;left: 668px;font-size: large;").text("Something went wrong,Please try again");
                      	   
                         }
                    }
                });

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
</html>