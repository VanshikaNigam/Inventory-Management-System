<!DOCTYPE html>

<html lang="en">
<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>AddAdmin</title>
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
			if (validate_email(userid, "Not a valid Userid") == false) {
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
	<h3 align="right">
		<font color="white"> <%
 	Object username = session.getAttribute("username");
 	
 %> <%
 	out.print("Welcome:");
 %><%=username%></font>
	</h3>

	<div class="wrap">


		<nav>
			<ul class="menu">

				<li><a href="#"><span class="iconic home"></span> Stock</a>
					<ul>
						<li><a href="StockEntryFirst.jsp">Stock Entry</a></li>
						<li><a href="StockReturnFirst.jsp">Stock Return</a></li>
						<li><a href="List">Stock List</a></li>
					</ul></li>


				<li><a href="#"><span class="iconic plus-alt"></span>Sales</a>
					<ul>
						<li><a href="SaleFormFirst.jsp">Sales Form</a></li>
						<li><a href="SaleReturnFirst.jsp">Sales Return Form</a></li>
					</ul></li>
				<li><a href="#"><span class="iconic magnifying-glass"></span>Report</a>
					<ul>
						<li><a href="StrByArticleFirst.jsp">Stock Report By
								Article</a>
						<li><a href="StrByDateFirst.jsp">Stock Report By Date</a>
						<li><a href="SlByArticleFirst.jsp">Sale Report By Article</a>
						<li><a href="SlByDateFirst.jsp">Sale Report By Date</a>
					</ul></li>
				<li><a href="AddAdminFirst.jsp"><span
						class="iconic map-pin"></span>Add Admin</a></li>
				<li><a href="Change.jsp"><span class="iconic mail"></span>Change
						Password</a>
				<li><a href="Logout"><span class="iconic home"></span>
						Logout</a></li>
			</ul>
			<div class="clearfix"></div>
			<div></div>
			<div></div>
		</nav>
		<br> <br> <br>
		<center>
			<form action="Add" onSubmit="return validate_form(this);"
				method="post" name="signin">
				<table>
					<tr>
						<td width="5px"></td>
						<br>
						<td><a href="AddAdminFirst.jsp"><img
								src="img/rsz_1admin.png" /></a> <br> <br></td>
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




		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>

	</div>

	<br>
	<br>
	<br>
	<hr>
	<div align="center">
		<font color="white">&copy;&nbsp;INMASYS-NVSS 
	</div>

</body>

</html>