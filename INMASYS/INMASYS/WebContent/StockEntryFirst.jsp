<!DOCTYPE html>
<%@ page import="controller.LoginServlet"%>
<%@ page import="controller.LogoutServlet" %>
<html lang="en">

	<head>
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
		<meta charset="utf-8">
		<title>Stock Entry</title>
		<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
		<script src="prefix-free.js"></script>
		<script type="text/javascript">
	function validate() {
		var art = document.forms["Stockentry"]["artno"].value;
		
		if (art == "") {
			alert("Article no field is blank");
			return false;
		}
		if(isNaN(art))
		{
		alert("article No should contain numbers");
		return false;

		}
		
	}
	
</script>
	</head>

<body>

  
				<h3 align="right"><font color="White">	<%
		Object username = session.getAttribute("username");
	%>
					<%
						out.print("Welcome:");
					%><%=username%></font></h3>

	<div class="wrap">

	
	<h3 align="right">
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
				</ul>
			</li>
			<li><a href="#"><span class="iconic magnifying-glass"></span>Report</a>
			<ul>
									<li><a href="StrByArticleFirst.jsp">Stock Report By Article</a>
									<li><a href="StrByDateFirst.jsp">Stock Report By Date</a>	
									<li><a href="SlByArticleFirst.jsp">Sale Report By Article</a>
									<li><a href="SlByDateFirst.jsp">Sale Report By Date</a>	
								</ul>
				
			</li>
			<li><a href="AddAdminFirst.jsp"><span class="iconic map-pin"></span>Add Admin</a>
				
			</li>
			<li><a href="Change.jsp"><span class="iconic mail"></span>Change Password</a>
			<li><a href="Logout"><span class="iconic home"></span> Logout</a>	
			</li>
		</ul>
		<div class="clearfix"></div>
		<div></div>
		<div></div>
	</nav>
	
	<br>
	
	<h4 align="center"><u>Stock Entry Form</u></h4>
	<br>
	<br>
	<br>
				
				<form action="entry" method="post" name="Stockentry">
					<table align="center">
						<tr>

							<td>Article no.</td>
							<td><input type="text" name="artno" placeholder="article no"
								required></td>
						</tr>

						<tr>
							<td><input type="submit" value="Check" name="btn"
								onclick="return validate()"></td>
						</tr>
						<tr>
							<td>Type</td>
							<td><input type="text" name="type" placeholder="type"></td>
						</tr>


						<tr>
							<td>Sale rate</td>
							<td><input type="text" name="rate" placeholder="sale amnt"></td>
							
							<td>New Sale rate</td>
							<td><input type="text" name="newrate" placeholder="new rate"></td>
						</tr>
						<tr>
							<td>Date:</td>
							<td><input type="date" name="dt"></td>
							
							<td>New Date:</td>
							<td><input type="date" name="new"></td>
						</tr>

						<tr>
							<td>Qnty</td>
							<td><input type="text" name="qty" placeholder="no. of items"></td>

							<td>Add Qnty</td>
							<td><input type="text" name="addqty" placeholder="add qnty"></td>
						</tr>




						<tr>
							<td>Salesperson</td>
							<td><input type="text" name="name" placeholder="salesperson"></td>
						</tr>
						<tr>
<td></td>
							<td align="center"><input type="submit" value="Save"
								name="btn" onclick="return valid();"></td>
<td></td>
							<td align="center"><input type="submit" value="New Record"
								name="btn" onclick="return abc();"></td>
						</tr>


					</table>
				</form>

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