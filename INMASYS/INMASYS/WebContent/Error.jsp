<!DOCTYPE html>
<%@ page import="bean.LoginForm"%>
<%@ page import="controller.LoginServlet"%>
<html lang="en">
<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>Login To INMASYS</title>
<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
<script src="prefix-free.js"></script>
<script type="text/javascript">
	function validate_email(field, alerttxt) {
		with (field) {
			pos1 = value.indexOf("@");
			pos2 = value.lastIndexOf(".");
			if (pos1 < 1 || pos2 - pos1 < 2) {
				alert(alerttxt);
				return false;
			} else {
				return true;
			}
		}
	}
	function validate_form(thisform) {
		with (thisform) {
			if (validate_email(userid, "Not a valid Username") == false) {
				username.focus();
				return false;

			}

		}
	}
	function CheckPassword() {
		var user = document.forms["signin"]["userid"].value;
		var password = document.forms["signin"]["password"].value;
		if (user == "") {
			alert("username field is blank");
			return false;
		}
		if (password == "") {
			alert("password field is empty");
			return false;
		}
		if ((password.length < 7) || (password.length > 15)) {
			alert("The password is the wrong length. \n");
			return false;
		}

	}
	function forgot() {
		var user = document.forms["signin"]["userid"].value;
		if (user == "") {
			alert("username field is blank");
			return false;
		}
	}
</script>
</head>

<body>

	<div class="wrap">


		<nav>
			<br>
			<h1 align="center">
				<b>WELCOME TO REMASYS!</b>
			</h1>
			<br>
		</nav>
		<br> <br> <br> <br> <br>

		<center>
			<h1>Wrong Answer.!!!!</h1>
			<br> <a href="First.jsp"><font color="white">Try
					Again!!!</font></a>
		</center>
		<br> <br> <br> <br> <br> <br> <br>
	</div>
	<hr>
	<div align="center">
		<font color="white">&copy;&nbsp;INMASYS-NVSS 
	</div>

</body>

</html>