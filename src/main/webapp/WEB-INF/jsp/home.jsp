<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">

  $(document).ready(function(){
		
		console.log("document.rady called");
		$.urlParam = function (name) {
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
		
		
	

	
		
	   /*  $.showErrorMsg = function (name) {
		if(empname=="NOEMPLOYEE"){
			$("#errors").attr("style", "display:block; color:red;margin-left: 384px;");
		}else{
			$("#errors").attr("style", "display:none; color:red");
		}
	}
		$.showErrorMsg(empname); */
		 $.bindCallBAck = function(response){
			for (i =response.length-1; i>=0; i--) {
				 // x += response[i] + "<br>";
				  //console.log( response[i]);
				   var markup;
				   var value=1;
				 var requestNumber = response[i].requestNumber;
				  var dateSubmitted = response[i].dateSubmitted;
				  var status = response[i].status;
		            markup = "<tr><td id='reqNo" + value + "'>" + requestNumber + "</td><td id='dc" + value + "'>" + dateSubmitted + "</td><td id='status" + value + "'>" + status + "</td>"
		                    // +" <td><a href='editRequest' class='button'>Edit</a></td></tr>";
		                
		           
		            if(status == "Open"){
		        	   markup +=" <td><a id='edit" + value + "' href='editRequest' onClick = 'anchorClick("+ requestNumber + ")' class='button'>Edit</a></td></tr>";
		           }else{
		        	   markup +="<td></td></tr>";
		           } 
		          
		            $("table tbody").append(markup); 
				  value++;
				}
		}
		
		
		$(function () {

            var userName=localStorage.getItem("empname");
            console.log("getting data ----: "+userName);
               // e.preventDefault();
                $.ajax({
                    type: 'post',
                    url: 'getUserData',
                    data: '{"userName":"'+userName+'"}',
                    dataType: 'json',
                  //  dataType: 'FormData', dateSubmitted; private String status <input type="hidden" id="myFile" value="1234"> userName
                    processData: true,
                    contentType: 'application/json',   
                   
                    success: function (response) {
                        //$('form')[0].reset();
                       // $("#feedback").text(response);
                       console.log(" response: ");
                       if(response=="") {
                    	   $("#table").attr("style", "display:none;");
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
		
	/* 	var rx = /INPUT|SELECT|TEXTAREA/i;

	    $(document).bind("keydown keypress", function(e){
	        if( e.which == 8 ){ // 8 == backspace
	            if(!rx.test(e.target.tagName) || e.target.disabled || e.target.readOnly ){
	                e.preventDefault();
	            }
	        }
	    }); */
		/* $.anchorClick = function () {
		$("table").click(function(){
			  alert("The paragraph was clicked.");
			console.log( $(this).attr('id'));
		});
		} */
	
		//setTimeout($.anchorClick(), 3000);
		//setTimeout("alert('Boom!');", 2000); onClick = "anchorClick();"
  });
</script>
<script type="text/javascript">
console.log("---------executing 2 scirpt---------");
function anchorClick(requestNumber){
	 // alert("The paragraph was clicked."+requestNumber);
		//console.log( $(this).attr('id'));
		localStorage.setItem("requestNumber", requestNumber);
	
}

/* window.onunload = function () { null };
history.pushState(null, document.title, location.href); 
history.back(); 
history.forward(); 
window.onpopstate = function () { 
history.go(1); 
}; */

function preventBack() { 
    window.history.forward();  
} 
  
setTimeout("preventBack()", 0); 
  
window.onunload = function () { null };

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
/* window.onpopstate = function(event) {
	alert(" home page popstate");
	window.history.forward();
	 // alert(" home page location: " + document.location + ", state: " + JSON.stringify(event.state));
	}; */



/* window.addEventListener('popstate', function(event) {
    // The popstate event is fired each time when the current history entry changes.

    var r = confirm("You pressed a Back button! Are you sure?!");

    if (r == true) {
        // Call Back button programmatically as per user confirmation.
        history.back();
        // Uncomment below line to redirect to the previous page instead.
        // window.location = document.referrer // Note: IE11 is not supporting this.
    } else {
        // Stay on the current page.
        history.pushState(null, null, window.location.pathname);
    }

    history.pushState(null, null, window.location.pathname);

}, false); */
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
<Label id="welcomeMsg" style="margin-left: 1091px; font-size: larger;">Welcome </Label>
<div id="mySidenav" class="sidenav">
<!--   <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
  <a href="home">Home</a>
  <a href="createRequest">Create Request</a>
  <a id="logouts" href="#"  onClick = "logouts(event);" >LogOut</a>
 
</div>

<div id="errorMsg" style="display:block;color:red;position: relative;left: 668px;font-size: large;">No requests to display</div>
<div id="divTable" class="divTable">
<table id="table">
<thead>
  <tr>
    <th>Request Number</th>
    <th>Date Submitted</th>
    <th>Status</th>
    <th>Action</th>
  </tr>
 </thead>
 <tbody>
  
  </tbody>
  
 
</table>
</div>


</body>
</html>