<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"%>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
	<link rel="stylesheet" href="../css/style2.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>			
			<script>
				window.onload = function() {
					document.getElementById("isCheck").value = "false";
					document.getElementById("checkId").onclick = function() {
						var sid = document.getElementById("id").value;
						if (sid == null || sid.length == 0) {
							alert("���̵� �Է��ϰ� �˻��ϼ���");
						} else {
							window
								.open("CheckId.jsp?id=" + sid, "",
									"width=300 height=300");
						}
					}
					
					document.getElementById("SignUpForm").onsubmit=function(){
						var isCheck=document.getElementById("isCheck").value;
						if(isCheck != "true"){
							alert("���̵� �ߺ�üũ�� ���� �ʾҽ��ϴ�.");
						    return false;
						}
						return true;
					}
					//id ���� ��Ŀ���� ���� �ߺ�üũ�� �ٽ� �ϵ��� isCheck�� ���� ����
					document.getElementById("id").onblur = function() {
						document.getElementById("isCheck").value = "false";
					}
				}
			</script>
			<div id="content">
			<div id="login">
				<FORM class="login_form" ID="SignUpForm" ACTION=SignUpProcess.jsp Method=POST>
				<img src="../Images/signup_logo.png" class="login_logo">
				
				<div class="input-group mb-3">
					<input style="border:none; border-bottom:1px solid;" type="hidden" id="isCheck" /> 
					<INPUT type="text" class="form-control"  aria-label="Recipient's username" aria-describedby="button-addon2" id="id" NAME=id placeholder="���̵�" required>
					 <div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button" id="checkId" >�ߺ�Ȯ��</button>
					</div>
				</div>
				<div class="form-group">
					<INPUT class="form-control" TYPE=PASSWORD NAME=password id="password" placeholder="��й�ȣ" required>
				</div>
				<div class="form-group">
					<INPUT class="form-control" TYPE=TEXT NAME=name id="name" placeholder="�̸�" required >
				</div>
				
				<div class="custom-file">
					<input type="file" name="image" class="custom-file-input" id="customFile">
					<label class="custom-file-label" for="customFile">������ �̹���</label>
					
				</div>
				<br><br>
				<div style="text-align:center">
				<INPUT TYPE="SUBMIT" class="btn btn-secondary btn-sm" VALUE='ȸ������'> 
				<INPUT TYPE="RESET" class="btn btn-secondary btn-sm" VALUE='�ʱ�ȭ'>
				</div>
				</FORM>
				</div>
			</div>
		
</body>
</html>