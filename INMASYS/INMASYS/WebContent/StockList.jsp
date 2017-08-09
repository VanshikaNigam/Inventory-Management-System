<!DOCTYPE html>
<%@ page import="bean.StockForm"%>
<%@ page import="controller.StockListServlet"%>
<%@ page import="java.util.ArrayList"%>
<html lang="en">

<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>Stock List</title>
<link href="print.css" media="print" rel="stylesheet" type="text/css" />
<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
<script src="prefix-free.js"></script>
</head>



<body>
	<h3 class="menu" align="right">
		<font color="White"> <%
 	Object username = session.getAttribute("username");
 %> <%
 	out.print("Welcome:");
 %><%=username%></font>
	</h3>


	<div class="wrap">
		<br> <br>

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

		<br> <br>

		<h4 align="center">
			<u>Stock List</u>
		</h4>
		<br> <br> <br>


		<%
			ArrayList<StockForm> list = (ArrayList<StockForm>) request
					.getAttribute("list");
			int i = 1;
		%>
		<center>
			<form action="StockListServlet" method="get">

				<table border="3" width="490" id="t">

					<tr class="color" id="t<%=i++%>">
						<th>Article No.</th>
						<th>Quantity</th>
						<th>Type</th>


					</tr>
					<%
						for (StockForm stockForm : list) {
					%>
					<tr>
					</tr>
					<tr class="color2" "t<%=i++%>">
						<td><%=stockForm.getArticleno()%></td>
						<td><%=stockForm.getQuantity()%></td>
						<td><%=stockForm.getType()%></td>


					</tr>
					<%
						}
					%>

				</table>
			</form>
			<input type="button" class="menu" value=" Print the Stocklist "
				onclick="window.print();return false;" />
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<div align="center">
		<font color="white">&copy;&nbsp;INMASYS-NVSS 
	</div>

	</center>

</body>

</html>