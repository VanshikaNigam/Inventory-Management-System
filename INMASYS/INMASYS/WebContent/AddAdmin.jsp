<!DOCTYPE html>

<html lang="en">
<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>Add Admin</title>
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
			if (validate_email(username, "Not a valid Username") == false) {
				username.focus();
				return false;

			}

		}
	}
	function CheckPassword() {
		var userID = document.forms["signin"]["userid"].value;
		var user = document.forms["signin"]["username"].value;
		var password = document.forms["signin"]["password"].value;
		if (userID == "") {
			alert("User Id field is blank");
			return false;
		}
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
		<h1 align="center">INMASYS</h1>
		<br>
		<br>
		<h3 align="right">
			<%
											Object username = session.getAttribute("username");
										%>
			<%
											out.print("Welcome");
										%><br><%=username%></h3>
		<nav>
			<br>
			<br>
			<h1 align="center">
				<b>WELCOME TO INMASYS!</b>
			</h1>

			<br>
			<br>
		</nav>
		<br>
		<br>
		<br>
		<br>
		<br>
		<center>
			<form action="AddServlet" onSubmit="return validate_form(this);"
				method="post" name="signin">
				<table width="60%">
					<tr>
						<td width="5px"></td>
						<td>
							<h4>New Admin</h4> <br>
						</td>
					</tr>

					<tr>
						<td><h4>UserId:</h4></td>
						<td><input type="text" name="userid" required></td>
					</tr>

					<tr>

						<td><h4>UserName:</h4></td>
						<td><input type="text" name="username" required></td>
					</tr>
					<tr>
						<td><h4>Password:</h4></td>
						<td><input type="password" name="password" required></td>
					</tr>
					<tr>
						<td>
							<h4>Security Question:</h4>
						</td>
						<td><input type="text" name="ques"></td>
					</tr>
					<tr>
						<td>
							<h4>Answer:</h4>
						</td>
						<td><input type="text" name="ans"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Add Admin"
							onclick="return CheckPassword();"><input type="reset"
							value="Reset"></td>
					</tr>

				</table>
			</form>
		</center>

	</div>



</body>

</html>