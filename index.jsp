<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인프라앤이 백경준 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
//한글 깨짐 방지
 

 
%>


	<h1>인프라엔이 게시판</h1>
		<table  class="tbl-ex" >
		<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성날짜</th>	
		<th>조회</th>
		</tr>
		
		<%
		int no=0;
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		String sql = "select * from listtest";
		try{
			String url = "jdbc:mysql://localhost:3306/test";
			String id = "root"; // 사용자계정 
			String pw = "dlsvmfk123"; // 사용자계정의 패스워드 
			// 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
			Class.forName("com.mysql.jdbc.Driver"); 
			// DriverManager 객체로부터 Connection 객체를 얻어온다. 
			conn=DriverManager.getConnection(url,id,pw); 
			
			pstmt =conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()){
			int idx= rs.getInt("idx");	
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String regdate = rs.getString("regdate");
			String hit = rs.getString("hit");
			no=no+1;
			%>
			
		

	

		<tr>
    	<td><%=no%></td>          
    	<td><a href="./wrd/read.jsp?idx=<%=idx%>"><%=title%></a></td>
    	<td><%=writer%></td>
    	<td><%=regdate%></td>
    	<td><%=hit %></td>
  
		</tr>
		 
		<%
		
		
		}
		}catch(SQLException e){

        	System.out.println(e.getMessage()); 
		}finally{
			try{
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				if(rs!=null)	rs.close();
			}catch(SQLException se){
				out.println(se.getMessage());
			}	
		}
		%>

		</table>
		<hr>
		
	&nbsp;&nbsp;&nbsp;<a href="./wrd/write.jsp"  ><button>글작성</button></a>
</body>
</html>