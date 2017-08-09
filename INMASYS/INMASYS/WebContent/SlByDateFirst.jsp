<!DOCTYPE html>

<html lang="en">

	<head>
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
		<meta charset="utf-8">
		<title>Sale By Date</title>
		<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
		<script src="prefix-free.js"></script>
		<script>
		function validate() {
		var date1 = document.forms["SaleReportByDate"]["date1"].value;
		var date2 = document.forms["SaleReportByDate"]["date2"].value;
		if (date1 == "") {
			alert("From field is blank");
			return false;
		}
		if (date2 == "") {
			alert("To field is blank");
			return false;
		}
	}
</script>
	</head>

<body>
<h3 align="right"><font color="white">
					<%
						Object username = session.getAttribute("username");
					%>
					<%
						out.print("Welcome");
					%><%=username%></font></h3>

	<div class="wrap">
	
	<br>
	
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
	<br><br>
	<h4 align="center"><u>Sales Report</u></h4>
				<br>
				<br>
				
				<form action="Date" method="post" name="SaleReportByDate">
					<table width="600">

						<tr>
							<td>FROM:</td>
							<td><input type="date" name="date1"></td>

							<td>TO:</td>
							<td><input type="date" name="date2"></td>

							<td><input type="submit" value="Search"
								onclick="return validate();"></td>

						</tr>
					</table>
<br>
<br>
					<p align="left"><i>There is no Data to Display</i></p>
				</form>




			


	</div>
	
	
	
</body>

</html>
