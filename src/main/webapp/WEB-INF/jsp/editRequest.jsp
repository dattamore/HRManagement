<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BGV - Edit Request </title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

  $(document).ready(function(){
		
		console.log("document.rady called");
		$.urlParam = function (name) {
			console.log("jquery callef");
		    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
		                      .exec(window.location.href);
		    if (results == null) {
		         return 0;
		    }
		    return results[1] || 0;
		}

		//console.log($.urlParam('empName'));
		var empname=$.urlParam('empName')
		// Store
		if(empname !=0){
		localStorage.setItem("empname", empname);
		}
		$("#welcomeMsg").text("Welcome "+localStorage.getItem("empname"));
		
		
	

	
		
	
		 $.bindCallBAck = function(response){
			console.log(" 0 :" + response[0].requestNumber);
			console.log(response.requestNumber);
			$("#companyName1").val(response[0].companyName1);
			$("#doj1").val(response[0].doj1);
			$("#lastwd1").val(response[0].lastwd1);
			$("#address1").val(response[0].address1);
			$("#companyName2").val(response[0].companyName2);
			$("#doj2").val(response[0].doj2);
			$("#lastwd2").val(response[0].lastwd2);
			$("#address2").val(response[0].address2);
			$("#hdegree").val(response[0].hdegree);
			$("#college").val(response[0].college);
			$("#passedOutYear").val(response[0].passedOutYear);
			/* for (i =response.length-1; i>=0; i--) {
				 // x += response[i] + "<br>";
				  //console.log( response[i]);
				   var markup;
				 var requestNumber = response[i].requestNumber;
				  var dateSubmitted = response[i].dateSubmitted;
				  var status = response[i].status;
		            markup = "<tr><td>" + requestNumber + "</td><td>" + dateSubmitted + "</td><td>" + status + "</td>"
		                    // +" <td><a href='editRequest' class='button'>Edit</a></td></tr>";
		                
		           
		            if(status == "Open"){
		        	   markup +=" <td><a id="+ requestNumber + " href='editRequest' onClick = 'anchorClick("+ requestNumber + ")' class='button'>Edit</a></td></tr>";
		           }else{
		        	   markup +="<td></td></tr>";
		           } 
		          
		            $("table tbody").append(markup); 
				  
				} */
		}
		
		
		$(function () {

            var userName=localStorage.getItem("empname");
            var requestNumber=localStorage.getItem("requestNumber");
            console.log("getting edit data ----: "+userName);
               // e.preventDefault();
                $.ajax({
                    type: 'post',
                    url: 'getDataeditRequest',
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
                    	   $("#errorMsg").attr("style", "display:block;color:red;position: relative;left: 668px;font-size: large;").text("Something went wrong,Please try again");
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
	
	
		//setTimeout($.anchorClick(), 3000);
		//setTimeout("alert('Boom!');", 2000); onClick = "anchorClick();"
		/* $("#updateRequest").click(function(){
			  alert("The updateRequest was clicked.");
			//console.log( $(this).attr('id'));
		}); */
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

<div id="errorMsg" style="display:block;color:red;position: relative;left: 668px;font-size: large;">Updated the request successfully Invalid input data

</div> 
<div id="divForm" class="divForm">

<h1>Edit Request</h1>
<h4>Employment History</h4>

<form id="form" action="/action_page.php" method="post">
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
   
   <input class="button"  Id="updateRequest" type="submit" value="Update">
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
        
            var userName=localStorage.getItem("empname");
            var requestNumber=localStorage.getItem("requestNumber");
          
                e.preventDefault();
            
              
                $.ajax({
                    type: 'post',
                    url: 'updateDataeditRequest',
                    data: '{ "companyName1":"'+$("#companyName1").val()+'", "doj1":"'+$("#doj1").val()+'", "lastwd1":"'+$("#lastwd1").val()+'" ,"address1":"'+$("#address1").val()+'","companyName2":"'+$("#companyName2").val()+'", "doj2":"'+$("#doj2").val()+'", "lastwd2":"'+$("#lastwd2").val()+'" ,"address2":"'+$("#address2").val()+'","hdegree":"'+$("#hdegree").val()+'", "college":"'+$("#college").val()+'", "passedOutYear":"'+$("#passedOutYear").val()+'", "dateSubmitted":"'+dateSubmitted+'", "status":"Open" , "userName":"'+userName+'","requestNumber":"'+requestNumber+'" }',
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
                       }else{
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
                        	 $("#errorMsg").attr("style", "display:block;color:blue;position: relative;left: 668px;font-size: large;").text("Data Updated Successfully");
                        	   
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