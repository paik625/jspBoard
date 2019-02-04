<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<h1>게시글 수정</h1>
<%

 
    String title = request.getParameter("title"); 
    String content = request.getParameter("content");
    String idx = request.getParameter("idx");

%>
<form action="./update.jsp?idx=<%=idx %>" method="post" onsubmit="return formCheck();"><br>
<script>
function formCheck() {
var title = document.forms[0].title.value;     
   var content = document.forms[0].content.value; // 추가되었습니다. 글내용
    
   if (title == null || title == ""){      // null인지 비교한 뒤
       alert('제목을 입력하세요');           // 경고창을 띄우고
       document.forms[0].title.focus();    // 해당태그에 포커스를 준뒤
       return false;                       // false를 리턴합니다.
   }
    
   // 글작성폼에 내용을 추가하였습니다. 게시판에 글내용은 당연히 있어야겠죠?
   // 추가할 html코드 : content : <textarea rows="10" cols="20" name="content"></textarea><br>
    
   if (content == null ||  content == ""){
       alert('내용을 입력하세요'); 
       document.forms[0].content.focus();
       return false;
   }
}
</script>

		<table class="tbl-ex">
		<tr>
		<th >제목 </th>
		<td ><input type="text" name="title"/><br></td>
		</tr>
		<tr>
		<tr>
		<th >내용</th>
		<td  height=500px><input type="text"  name="content"   style= height:500px;/><br></td>
		</tr>
		</table>
		<br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="수정" style="width=5px"/>
</form>

	




</body>
</html>