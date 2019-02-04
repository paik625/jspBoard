<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인프라앤이 백경준 게시</title>
</head>
<body>

<%
int n=0;
request.setCharacterEncoding("UTF-8");



Connection conn = null; 
PreparedStatement pstmt  =null;




try{
String url = "jdbc:mysql://localhost:3306/test";
String id = "root"; // 사용자계정 
String pw = "dlsvmfk123"; // 사용자계정의 패스워드 

// 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
Class.forName("com.mysql.jdbc.Driver"); 
// DriverManager 객체로부터 Connection 객체를 얻어온다. 
conn=DriverManager.getConnection(url,id,pw); 



String idx =request.getParameter("idx");
System.out.println(idx);
String sql = "delete from listtest where idx=?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, idx);
n= pstmt.executeUpdate();



// 예외가 발생하면 예외 상황을 처리한다. 
}catch(Exception e)
{ 
	e.printStackTrace();
	out.println("실패."); 
	System.out.println(e.getMessage()); 
	
	
}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException se){
			out.println(se.getMessage());
		}
}
%>

<script>
if(<%=n%>>0){
	alert("글이 삭제 되었습니다.");
	location.href="../index.jsp";
}else{
		alert("글 삭제 실패되었습니다.")
		history.go(-1);
	}

</script>



</body>
</html>