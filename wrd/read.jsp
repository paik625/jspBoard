<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<meta charset="UTF-8">
<title>인프라앤이 백경준 게시</title>
</head>

<%
request.setCharacterEncoding("UTF-8");
String idx = request.getParameter("idx");

System.out.println(idx);

//한글 깨짐 방지

		Connection conn =null;
		PreparedStatement pstmt =null;
		
		ResultSet rs=null;
		
		try{ 
			String url = "jdbc:mysql://localhost:3306/test";
			String id = "root"; // 사용자계정 
			String pw = "dlsvmfk123"; // 사용자계정의 패스워드 
			// 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
			Class.forName("com.mysql.jdbc.Driver"); 
			// DriverManager 객체로부터 Connection 객체를 얻어온다. 
			conn=DriverManager.getConnection(url,id,pw); 
			//pstmt =conn.prepareStatement(sql);

		
        String sql = "select * from listtest where idx = ?" ;
		pstmt = conn.prepareStatement(sql);        
		pstmt.setString(1,idx);
		
		rs = pstmt.executeQuery();

        while(rs.next()){
 
    		String title = rs.getString("title");
    		String writer = rs.getString("writer");
    		int hit = rs.getInt("hit");
    		String regdate = rs.getString("regdate");
			hit+=1;
    		String content = rs.getString("content");
    		
    		
        	%>
               <body>                          
        	 
        	    <h1>게시글 조회</h1>                    
        	 
        	    <table class="tbl-ex">                            <!-- border은 테두리를 표시하는 속성입니다. -->
        	 
        	        <tr>       
        	            <th >제목</th>                    
        	            <td colspan="5"><%=title%></td>
        	        	</tr>
        	        	<tr>
        	            <th>작성자</th> 
        	            <td><%=writer%></td>   
        	            <th>&nbsp;조회수</th>   
        	      	 	<td><%=hit%></td>
						<th>&nbsp;작성일자</th> 
        	      	 	<td><%=regdate%></td>
        	      	 	 </tr>
						<tr>
        	            <th height=500em >내용</th>            
       					 <td colspan="5" >&nbsp;&nbsp;&nbsp;&nbsp;<%= content%></td>        
        	        </tr>
        	    </table>

  <hr>

		
		<%
	 	sql = "UPDATE listtest SET HIT=" + hit + " where idx=" +idx;
	 	pstmt.executeUpdate(sql);
		
        
        }	

		

        }catch(SQLException e){
        	e.printStackTrace();
        	System.out.println(e.getMessage()); 
        	
        	
        	
		}finally{
			try{
				if(pstmt != null)pstmt.close();
				if(conn!=null) conn.close();
				if(rs!=null) rs.close();
			}catch(SQLException se){
				out.println(se.getMessage());
			}	
		}
		%>
		
		&emsp;&emsp;
		<a href="../index.jsp"  ><button>글목록</button></a>
	    &emsp;&emsp;
	    <a href="./modify.jsp?idx=<%=idx%>"><button>수정</button></a>
		&emsp;	&emsp;
		<a href="./delete.jsp?idx=<%=idx%>"><button>삭제</button></a>
	
</body>
</html>