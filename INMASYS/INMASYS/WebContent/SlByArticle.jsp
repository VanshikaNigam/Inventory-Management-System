<!DOCTYPE html>
<%@ page import="bean.EntryForm"%>
<%@ page import="controller.SaleArtServlet"%>
<%@ page import="java.util.ArrayList"%>
<html lang="en">

<head>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<meta charset="utf-8">
<title>Sale By Article</title>
<link href="print.css" media="print" rel="stylesheet" type="text/css" />
<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
<script src="prefix-free.js"></script>
<script type="text/javascript"> 

	
</script>
</head>

<body>
	<h3 class="menu" align="right">
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
		<br>
		<br>
		<h4 align="center">
			<u>Sales Report</u>
		</h4>
		<br> <br>

		<%
					ArrayList<EntryForm> list = (ArrayList<EntryForm>) request
							.getAttribute("list");
				double earning=0.0;
				%>
		<center>
			<form action="Sale" method="post">

				<table align="center" width="80%" border="2">

					<tr class="color">
						<td>Article No.</td>
						<td>Quantity</td>
						<td>Unit Price</td>
						<td>Discount(%)</td>
						<td>Net:</td>
						<td>Date</td>
						<td>Bill No:</td>
						<td>Transaction Type</td>
					</tr>
					<%
							for (EntryForm entryForm : list) {
						%>
					<tr class="color2">
						<td><%=entryForm.getArtno()%></td>
						<td><%=entryForm.getQty()%></td>
						<td><%=entryForm.getSalerate()%></td>
						<td><%=entryForm.getDiscount()%></td>
						<td><%=entryForm.getNet()%></td>
						<td><%=entryForm.getDate()%></td>
						<td><%=entryForm.getBillno()%></td>
						<td><%=entryForm.getTrantype()%></td>
						<%earning=entryForm.getEarning(); %>
					</tr>
					<%
							}%>

					<tr>
						<td>Total Collection:</td>
						<td><%=earning%></td>
					</tr>




				</table>
				<input type="button" class="menu" value=" Print "
					onclick="window.print();return false;" />



			</form>
		</center>






		<br> <br> <br> <br> <br>

	</div>
	<hr>
	<div align="center">
		<font color="white">&copy;&nbsp;INMASYS-NVSS
	</div>


</body>

</html>
