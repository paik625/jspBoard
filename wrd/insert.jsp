<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<meta charset="UTF-8">
<title>게시판 작성 </title>
</head>
<body>
<h1>게시판 작성</h1>
<%
request.setCharacterEncoding("UTF-8");




String title = request.getParameter("title");
String writer = request.getParameter("writer");
String passwd = request.getParameter("passwd");
String content = request.getParameter("content");



Connection conn = null; 
PreparedStatement pstmt =null;

int n=0;

String sql = "INSERT INTO listtest (title, writer, content) values(?, ?, ?)";


try{


	
String url = "jdbc:mysql://localhost:3306/test";
String id = "root"; // 사용자계정 
String pw = "dlsvmfk123"; // 사용자계정의 패스워드 

// 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 

Class.forName("com.mysql.jdbc.Driver"); 

// DriverManager 객체로부터 Connection 객체를 얻어온다. 



conn=DriverManager.getConnection(url,id,pw); 


pstmt =conn.prepareStatement(sql);
pstmt.setString(1,title);
pstmt.setString(2,writer);
pstmt.setString(3,content);

n=pstmt.executeUpdate();





// 예외가 발생하면 예외 상황을 처리한다. 
}catch(Exception e)
{ 
	System.out.println("실패."); 
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
	alert("글이 작성 되었습니다.");
	location.href="../index.jsp";
}else{
		alert("글 작성이 실패되었습니다.")
		history.go(-1);
	}

</script>



</body>
</html>