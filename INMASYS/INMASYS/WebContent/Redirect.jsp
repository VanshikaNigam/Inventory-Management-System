<!DOCTYPE html>

<html lang="en">
	<head>
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
		<meta charset="utf-8">
		<title>Redirect</title>
		<link href="style.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
		<script src="prefix-free.js"></script>
	
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
	
	<br><br>
	<h2 align="center"><b>INMASYS</b></h2>
		
	<br>
	</nav>
		<br><br><br><br>
				
				<center>
					<h2>Your Password has being Successfully Changed!</h2>
					<h4>
						Click <a href="First.jsp"><b><i><font color="blue">here</font></i></b></a> to go back on
						login page
					</h4>


				</center>


	<br>
<br>
<br>
<br>
<br>

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