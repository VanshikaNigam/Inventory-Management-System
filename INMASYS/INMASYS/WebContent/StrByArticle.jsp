<!DOCTYPE html>
<%@ page import="bean.EntryForm"%>
<%@ page import="controller.StockReportServlet"%>
<%@ page import="java.util.ArrayList"%>
<html lang="en">

	<head>
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
		<meta charset="utf-8">
		<title>Stock By Article</title>
		<link href="print.css" media="print" rel="stylesheet" type="text/css" />
		<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
		<script src="prefix-free.js">
		
</script>
	</head>

<body>
<h3 class="menu" align="right"><font color="white">
					<%
						Object username = session.getAttribute("username");
					%>
					<%
						out.print("Welcome");
					%><%=username%></font></h3>

	<div class="wrap">
	
	<br><br>
	
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
	<h4 align="center"><u>Stock Report</u></h4>
	<br>
	<br>
	
				
				<form action="StrByArt" method="post">
					
					<%
						ArrayList<EntryForm> list = (ArrayList<EntryForm>) request
								.getAttribute("list");
					%>
<center>

					<table width="600" border="2">
						<tr class="color">
							<td><b>Article No:</b></td>
							
							<td>Price</td>
							<td>Quantity</td>
							<td>Sale Person</td>
							<td>Type</td>
							<td>Date</td>
							<td>Transaction Type</td>

						</tr>




						<%
							for (EntryForm entryForm :list)
							{
							%>

						<tr class="color2">

							<td><%=entryForm.getArtno() %></td>
							<td><%=entryForm.getSalerate()%></td>
							<td><%=entryForm.getQty()%></td>
							<td><%=entryForm.getSaler()%></td>
							<td><%=entryForm.getType()%></td>
							<td><%=entryForm.getDate()%></td>
							<td><%=entryForm.getTrantype()%></td>

						</tr>

						<%
							}
							%>








					</table>
					<input type="button" class="menu" value=" Print "
onclick="window.print();return false;" />

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
