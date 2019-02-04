<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<%

String uploadPath = "C:\\";

int size = 10*1024*1024;        // ���ε� ���� �ִ� ũ�� ����

String name="";
String subject="";
String filename="";




try{

 // ���� ���ε�. ������ ������ ���ڰ��� ��� ����request ��ü ����,

 //���ε� ���, ���� �ִ� ũ��, �ѱ�ó��, ���� �ߺ�ó��
 MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());

 
 // ������ �Է��� ���� ������
 name = multi.getParameter("name");
 subject = multi.getParameter("subject");

 
//���ε��� ���ϵ��� Enumeration Ÿ������ ��ȯ
//Enumeration���� �����͸� �̾ƿö� ������ �������̽� Enumeration��ü�� java.util ��Ű���� ���� �Ǿ������Ƿ�
//java.util.Enumeration�� import ���Ѿ� �Ѵ�.
 Enumeration files = multi.getFileNames();

 
 // ���ε��� ���ϵ��� �̸��� ����
 String file = (String)files.nextElement();
 filename = multi.getFilesystemName(file);


}catch(Exception e){
 // ����ó��
 e.printStackTrace();
}



%>
<body>
���ε� �� ���ϸ� : <%=filename%><br>
</body>
</html>