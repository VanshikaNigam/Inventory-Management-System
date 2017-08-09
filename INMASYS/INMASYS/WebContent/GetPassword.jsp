<!DOCTYPE html>
<%@ page import="bean.LoginForm"%>
<%@ page import="controller.LoginServlet"%>
<%@ page import="bean.ForgotForm"%>
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
</script>
</head>

<body>

	<div class="wrap">


		<nav>
			<br>
			<h1 align="center">
				<b>WELCOME TO INMASYS!</b>
			</h1>
			<br>
		</nav>
		<br> <br> <br> <br> <br>
		<%
			ForgotForm forgotForm = (ForgotForm) request
					.getAttribute("forgotForm");
			String userid = (String) request.getAttribute("userid");
		%>
		<form action="Login" onSubmit="return validate_form(this);"
			method="post" name="signin">
			<center>
				<table>
					<tr>
						<br>
						<br>
						<br>
						<br>


					</tr>
					<%
						if (forgotForm.getAns() == null && forgotForm.getPassword() == null) {
					%>
					<tr>

						<td><h4>User ID:</h4></td>
						<td><input type="text" name="userid"
							value="<%out.print(userid);%>" required></td>

					</tr>
					<tr>

						<td><h4>Question:</h4></td>
						<td><input type="text" readonly name="ques"
							style="height: 1em; width: 18em;"
							value="<%out.print(forgotForm.getQues());%>"></td>

					</tr>
					<tr>

						<td><h4>Answer:</h4></td>
						<td><input type="text" name="ans" placeholder="Enter Answer"
							required></td>
						<td><input type="submit" name="btn" value="Get Password"></td>
					</tr>
					<%
						} else if (forgotForm.getPassword() != null) {
					%><tr>

						<td><h4>User ID:</h4></td>
						<td><input type="text" name="userid"
							value="<%out.print(userid);%>" required></td>

					</tr>
					<tr>

						<td><h4>Question:</h4></td>
						<td><input type="text" name="ques"
							style="height: 1em; width: 18em;"
							value="<%out.print(forgotForm.getQues());%>"></td>

					</tr>
					<tr>

						<td><h4>Answer:</h4></td>
						<td><input type="text" name="ans" placeholder="Enter Answer"
							value="<%out.print(forgotForm.getAns());%>"></td>

					</tr>
					<tr>

						<td><h4>Password:</h4></td>
						<td><input type="text" name="pass" placeholder="Enter Answer"
							value="<%out.print(forgotForm.getPassword());%>" required></td>

					</tr>
					<tr>
						<td><a href="First.jsp"><font color="white">Login</font></a></td>
					</tr>
					<%
						}
					%>
				</table>
		</form>
		</center>
		<br> <br> <br> <br> <br> <br> <br>
	</div>
	<hr>
	<div align="center">
		<font color="white">&copy;&nbsp;INMASYS-NVSS 
	</div>

</body>

</html>