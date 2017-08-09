<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@ page import="controller.SalesServlet"%>
<%@ page import="bean.SalesForm"%>
<%@ page import="bean.EntryForm"%>
<html lang="en">

<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>Return Bill</title>
<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
<script src="prefix-free.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
	<h3 align="right">
		<font color="white"> <%
						Object username = session.getAttribute("username");
					%> <%
						out.print("Welcome");
					%><%=username%></font>
	</h3>
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
			<u>Bill</u>
		</h4>
		<br> <br>


		<form action="comp" method="post">
			<table align="center" border="2">

				<%
							ArrayList<SalesForm> salelist = (ArrayList<SalesForm>) request
									.getAttribute("list");
							int gqty = (Integer) request.getAttribute("gqty");
							double bal = (Double) request.getAttribute("bal");
							long billno=(Long)request.getAttribute("billno");

							if (salelist != null) {
						%>
						<tr><td>Bill No: <%=billno%></td></tr>
				<tr>
					<td>Art No:</td>
					<td>Type</td>
					<td>Unit Price</td>
					<td>Quantity</td>
					<td>Discount(%)</td>
					<td>Total</td>
				</tr>
				<%
							for (SalesForm salesForm : salelist) {
						%><tr>

					<td><%=salesForm.getArtno()%></td>
					<td><%=salesForm.getType()%></td>
					<td><%=salesForm.getRate()%></td>
					<td><%=salesForm.getQty()%></td>
					<td><%=salesForm.getDis()%></td>
					<td><%=salesForm.getTotal()%></td>
				</tr>
				<
				<%
							}
							}
						%>
				<tr>
					<td>Total Quantity:</td>

					<td><%=gqty%></td>
				</tr>
				<tr>
					<td>AMOUNT PAYABLE</td>
					<td>
						<%if(bal<0)
						{%> <%=((-1) * bal)%> <%} 
						
						else{%> <%= bal %> <%}
						 %>
					</td>

				</tr>


			</table>


			<br> <br> <br> <br> <br>
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
