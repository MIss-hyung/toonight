<%@ page language="java" contentType="text/html; charset=euc-kr" errorPage="DBError.jsp"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�˻� ���</title>

</head>
<body>
    	<section id="one" class="" style="text-align:center; padding-left:20%; padding-right:20%">
	<div id="wrapper">
		<div id="box">

			
			<div id="content">
				<div class="album text-muted">
					<div class="container">
						<div class="row">
							<%
								String search = request.getParameter("search");
								Connection conn = null;
								Statement stmt = null;
								int count = 0;
								try {
									Class.forName("com.mysql.jdbc.Driver");
									conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/toonight", "root", "1234");
									if (conn == null)
										throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
									stmt = conn.createStatement();
									ResultSet rs = stmt
											.executeQuery("select count(*) from webtoon where webtoonTitle like '%" + search + "%'");
									while (rs.next()) {
										count = rs.getInt(1);
									}
									rs.close();
									if (count == 0) {
							%>
							<script language=javascript>
 							self.window.alert("�˻������ �������� �ʽ��ϴ�.");
							location.href="../Main.jsp";
							</script>
							<%
								} else {
										rs = stmt.executeQuery("select webtoonID, webtoonTitle from webtoon where webtoonTitle like '%"
												+ search + "%'");
										while (rs.next()) {
											int webtoonID = rs.getInt(1);
											String webtoonTitle = rs.getString(2);
											
							%>
							<div class="card" style="margin-right: 20px; margin-top: 9px; border: none; border-bottom: solid 1px; border-color: #D3D3D3;">
									
									<a href="Detail.jsp?number=<%=webtoonID%>"><p class="card-text"><%=webtoonTitle%></p></a>
							</div>
							
							<%
								}
									}
									rs.close();
									stmt.close();
									conn.close();
								} catch (SQLException e) {
									out.println(e.toString());
								}
							%>
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
			</section>

</body>
</html>