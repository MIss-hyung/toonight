<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" type="text/css" href="../css/style2.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>

<%
Cookie[] cookies = request.getCookies();
int feel[]= new int[51];
for(int i=1;i<51;i++){
	feel[i]=0;
}

String number = getCookieValue(cookies, "number");
    Class.forName("com.mysql.jdbc.Driver");
  
   int webtoonID = Integer.parseInt(number);
   String currentUser = (String) session.getAttribute("userID");
  
      Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/toonight", "root", "1234");
      

String command2="select count(*) from feelings where webtoonID="+webtoonID+" and f? =1";
PreparedStatement pstmt2=conn.prepareStatement(command2);

int k=1;
String command="select count(*) from feelings where webtoonID="+webtoonID;
PreparedStatement pstmt=conn.prepareStatement(command);
ResultSet rs22=pstmt.executeQuery();
while(rs22.next()){
	k=rs22.getInt(1);}
	if(k>0){


      Statement stmt = conn.createStatement();
      String sql="select sum(grade), count(*) from feelings where webtoonID="+webtoonID;
     
      ResultSet result=stmt.executeQuery(sql);
      while(result.next()){
    	  int grade=result.getInt(1);
    	  int n=result.getInt(2);
    	  
    	 
    	  float ave=(grade/n)+(grade%n);
    	  %>
<p>����:<%=ave %></p>
<%} %>

<p>������ ���� ����</p>
<div id="chart"></div>
<%


HashMap<String,Integer> hmap=new HashMap<String,Integer>();
for(Integer i=1;i<51;i++){
	pstmt2.setInt(1,i);

	ResultSet rs=pstmt2.executeQuery();
	while(rs.next()){
		feel[i]=rs.getInt(1);
		hmap.put("����",feel[1]);
		hmap.put("����",feel[2]);
		hmap.put("����",feel[3]);
		hmap.put("������",feel[4]);
		hmap.put("�θǽ�",feel[5]);
		hmap.put("ǲǲ��",feel[6]);
		hmap.put("����",feel[7]);
		hmap.put("���",feel[8]);
		hmap.put("����",feel[9]);
		hmap.put("�п�",feel[10]);
		hmap.put("�̽��׸�",feel[11]);
		hmap.put("����",feel[12]);
		hmap.put("�ϻ�",feel[13]);
		hmap.put("SF",feel[14]);
		hmap.put("���",feel[15]);
		hmap.put("������",feel[16]);
		hmap.put("������",feel[17]);
		hmap.put("������",feel[18]);
		hmap.put("����",feel[19]);
		hmap.put("���л�",feel[20]);
		hmap.put("û��",feel[21]);
		hmap.put("����",feel[22]);
		hmap.put("�׼�",feel[23]);
		hmap.put("���",feel[24]);
		hmap.put("����",feel[25]);
		hmap.put("�߸�",feel[26]);
		hmap.put("��ȯ",feel[27]);
		hmap.put("����",feel[28]);
		hmap.put("����",feel[29]);
		hmap.put("������",feel[30]);
		hmap.put("�� �ڹ̵�",feel[31]);
		hmap.put("ǳ��",feel[32]);
		hmap.put("����",feel[33]);
		hmap.put("����",feel[34]);
		hmap.put("����",feel[35]);
		hmap.put("���̴�",feel[36]);
		hmap.put("����",feel[37]);
		hmap.put("����",feel[38]);
		hmap.put("����",feel[39]);
		hmap.put("�Ǹ�",feel[40]);
		hmap.put("����",feel[41]);
		hmap.put("���",feel[42]);
		hmap.put("ȣ��",feel[43]);
		hmap.put("����",feel[44]);
		hmap.put("¥��",feel[45]);
		hmap.put("�г�",feel[46]);
		hmap.put("����",feel[47]);
		hmap.put("������",feel[48]);
		hmap.put("ģ����",feel[49]);
		hmap.put("��Ż",feel[50]);
	}
}


Iterator iterator=sortByValue(hmap).iterator();
String temp=(String)iterator.next();

for(int i=0;i<5;i++){
	%>
	<p><%=temp %>:<%=hmap.get(temp) %></p>

<%
temp=(String)iterator.next();
}
     }else{
    	 %>  	 
    	 <p>��ϵ� ������ ������ �����ϴ�. ù��° ����ڰ� �Ǿ��ּ���!</p>
    	 <%    	 
     }
   pstmt2.close();
	conn.close();   	  
%>
</body>
</html>
<%!private String getCookieValue(Cookie[] cookies, String name) {
		String value = null;
		if (cookies == null)
			return null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name))
				return cookie.getValue();
		}
		return null;
	}%>
<%!
public static List sortByValue(final Map<String,Integer> map){
	List <String> list=new ArrayList();
	list.addAll(map.keySet());
	
	Collections.sort(list,new Comparator(){
		public int compare(Object o1, Object o2){
			Object v1=map.get(o1);
			Object v2=map.get(o2);
			
			return((Comparable)v2).compareTo(v1);
		}
	});
	 return list;
}
%>