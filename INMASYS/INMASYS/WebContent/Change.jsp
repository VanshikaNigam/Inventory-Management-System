<!DOCTYPE html>
<%@ page import="bean.LoginForm"%>
<%@ page import="controller.LoginServlet"%>
<html lang="en">
<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>INMASYS</title>
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
	function changePassword() 
	{
		var user=document.forms["changep"]["userid"].value;
		var pass=document.forms["changep"]["password"].value;
		var newpassword=document.forms["changep"]["newpass"].value;
		var compassword=document.forms["changep"]["conpass"].value;
		if (user=="")
		{
			alert("UserId field is blank");
			return false;
		}
		if (pass=="") {
			alert("password field is empty");
			return false;
		}
		if (newpassword=="") {
			alert("password field is empty");
			return false;
		}
		if (compassword=="") {
			alert("password field is empty");
			return false;
		}
		if((pass.length<7) || (pass.length>15))
			{
			alert("Old password should be between 8 and 15");
			return false;
			}
		if((newpassword.length<7) || (newpassword.length>15))
		{
		alert("New password should be between 8 and 15");
		return false;
		}
		if(newpassword!=compassword)
			{
			alert("passwords do not match");
			return false;
			}
	}
</script>
</head>

<body>
<h3 align="right"><font color="white">
			<%
						Object username = session.getAttribute("username");
			String userid = (String) session.getAttribute("userid");
			
					%>
			<%
						out.print("Welcome:");
					%><%=username%></font></h3>
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
						<li><a href="SlByArticleFirst.jsp">Sale Report By Date</a>
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
		<br>
		<br>
		<br>
		<br>
		<br>


		<center>
			<form action="Change" onSubmit="return validate_form(this);"
				method="post" name="changep">
				<table width="40%">
					<tr colspan="2" align="center">
						<td>
						<td></td>
						<a href="Change.jsp"><img src="img/rsz_1change_password.jpg"/></a><br>
						</td>

					</tr>
					<tr><br></tr>
					
					<tr>
						<td>
							<h4>Old Password:</h4>
						</td>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<td>
							<h4>New Password:</h4>
						</td>
						<td><input type="password" name="newpass"></td>
					</tr>
					<tr>
						<td>
							<h4>Confirm Password:</h4>
						</td>
						<td><input type="password" name="conpass"></td>
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
						<td><input type="hidden" name="userid"
							value="<%out.print(userid);%>"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Confirm"
							onclick="return changePassword();"> <input type="reset"
							value="Reset"></td>
					</tr>

				</table>
			</form>
		</center>


	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<div align="center"><font color="white">&copy;&nbsp;INMASYS-NVSS</div>



</body>

</html>