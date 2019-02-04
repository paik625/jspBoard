<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>


<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<h1>게시글 작성</h1>

<%

    String title = request.getParameter("title");
 
    String writer = request.getParameter("writer");
 
    String passwd = request.getParameter("passwd");
    
    String content = request.getParameter("content");
    
 
    
    %>

    
   



<form action="./insert.jsp"  name="fileForm" method="post"   onsubmit="return formCheck();"><br>

<script>
function formCheck() {

	var title = document.forms[0].title.value;     
   var writer = document.forms[0].writer.value;
   var content = document.forms[0].content.value; // 추가되었습니다. 글내용
    
   if (title == null || title == ""){      // null인지 비교한 뒤
       alert('제목을 입력하세요');           // 경고창을 띄우고
       document.forms[0].title.focus();    // 해당태그에 포커스를 준뒤
       return false;                       // false를 리턴합니다.
   }
   if (writer == null ||  writer  == ""){   
       alert('작성자를 입력하세요'); 
       document.forms[0].writer.focus();            
       return false;               
   }
    
    
   if (content == null ||  content == ""){
       alert('내용을 입력하세요'); 
       document.forms[0].content.focus();
       return false;
   }
    

	}



</script>

		<table class="tbl-ex">
		<tr>
		<th colspan="1">제목 </th>
		<td ><input type="text" name="title"/><br></td>
		</tr>
		<tr>
		<th >작성자</th>
		<td><input type="text" name="writer"/><br></td>
		</tr>		

		<tr>
		<th >내용</th>
		<td  height=500px><input type="text" name="content"   style= height:500px;/><br></td>
		</tr>
		<tr>
  			<th>파일첨부</th>
  			<td align="left"><input type="file" name="file1"></td>
			 </tr> 
		</table>
	 <br><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="게시글 작성" style="width=5px" />
</form>

<form action="../index.jsp"><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="게시글 목록" style="width=5px"/>
</form>



</body>
</html>