<!DOCTYPE html>

<html lang="en">

	<head>
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
		<meta charset="utf-8">
		<title>Sale By Article</title>
		<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
		<script src="prefix-free.js"></script>
		<script type="text/javascript"> 
function validate()
{ var art=document.forms["SaleA"]["artno"].value;
 if(art=="")
	 {
	 alert("Article no. field is empty");
	 return false;
	 }
 if(isNaN(art))
	 {
	 alert("Articleno. should contain numbers");
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
	
				<form action="Sale" method="post" name="SaleA">
					<table width="450">
						<tr>
							<td>ARTICLE NUMBER:</td>
							<td><input type="text" name="artno"></input></td>
							<td><input type="submit" value="Check" name="btn" onclick="return validate();"></input></td>
							</tr>
					</table>
<br>
<br>
					<p align="left"><i>There is no Data to Display</i></p>
				</form>


			


	</div>
	
	
	
</body>

</html>
