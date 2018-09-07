<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*" %>

<%request.setCharacterEncoding("euc-kr");%>
<%Cookie[] cookies =request.getCookies();%>

<%

Class.forName( "com.mysql.jdbc.Driver");
request.setCharacterEncoding("euc-kr");
String commentID=getCookieValue(cookies,"commentID");

String bid=getCookieValue(cookies,"webtoonID");
int webtoonID=Integer.parseInt(bid);
try {

Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");

   String command="delete from comment where commentID=? and webtoonID=?";
   PreparedStatement pstmt= conn.prepareStatement(command);
   pstmt.setString(1,commentID);
   pstmt.setInt(2,webtoonID);
   
   pstmt.executeUpdate();
   pstmt.close();
   conn.close();


} catch (Exception e) {

   out.println(e.toString());


}

%>
 <%!
private String getCookieValue(Cookie[] cookies, String name){
		String value=null;
		if(cookies==null) return null;
		for(Cookie cookie:cookies){
			if(cookie.getName().equals(name)) return cookie.getValue();}
		return null;
		} %>
		<script language=javascript>
		self.window.alert("댓글을 삭제했습니다.");
		 location.href="Detail.jsp?number=<%=webtoonID%>";
		</script>