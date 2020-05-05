<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
console.log("first script in  called");
</script>
<script type="text/javascript">
console.log("second script in  called");
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
	
    $.showErrorMsg = function (name) {
	if(empname=="NOEMPLOYEE"){
		$("#errors").attr("style", "display:block; color:red;margin-left: 384px;");
	}else{
		$("#errors").attr("style", "display:none; color:red");
	}
}
	$.showErrorMsg(empname);

	
	
	  $("button").click(function(){
	    $("input:text").val("Glenn Quagmire");
	  });
	});
	

</script>
<script type="text/javascript">
console.log("onpopstate script called :"+history.state);
console.log(`History.state before pushState: ${history.state}`);

function preventBack() { 
    window.history.forward();  
} 
  
setTimeout("preventBack()", 0); 
  
window.onunload = function () { null };
/* window.onpopstate = function(event) {
	alert(" home page popstate");
	window.history.forward();
	 // alert(" home page location: " + document.location + ", state: " + JSON.stringify(event.state));
	}; */
	


</script>
<style>
form { 
/* margin: 0 auto; */ 
margin-top: 2em;
margin-left: 24em;
width:250px;
}
</style>
</head>
<body>
<div class="container">
<h1 style="margin-left: 2em; margin-top: 2em; color:#42698f;">Wipro</h1>
  <h2 style="margin-left: 12em; margin-top: 3em;">Login</h2>
   <div id="errors" style="display:none; color:red"> Invalid Credentials</div>
 
  <form action="login/submit" method="post">
 
    <div class="form-group">
      <label for="username">User Name:</label>
      <input type="text" class="form-control" id="username" placeholder="Enter username" name="username"    required>
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password"   required>
    </div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
   <!--  <button id="login" type="submit" class="btn btn-primary">Login</button> -->
    <input type="submit" class="btn btn-primary" value="Login">
  </form>
</div>
<script>
console.log("lower script in body called");
</script>
</body>
<script>
console.log("lower script called");
</script>
</html>