<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
    <link rel="stylesheet" href="../css/style2.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
	<form class="login_form" action=LoginProcess.jsp method=POST>
		<img src="../Images/login.png" class="login_logo">
		<div class="form-group">
			<input type="text" name=id class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="���̵�">
		</div>
		<div class="form-group">
			<input type="password" name=password class="form-control" id="exampleInputPassword1" placeholder="��й�ȣ">
		</div>
		<br>
			<a class="nav-link" href="SignUp.jsp">ȸ������</a>
			<input type="submit" value='Ȯ��' style="float:right;" class="btn btn-secondary btn-sm">
	</form>	

</body>
</html>