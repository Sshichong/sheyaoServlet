<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.11.1.min.js"></script> 
<title>Insert title here</title>
</head>
<body>
<%
String name = (String)request.getAttribute("name");
String zhicheng = (String)request.getAttribute("zhicheng");
StringBuffer shanchang = (StringBuffer)request.getAttribute("shanchang");
String grjj = (String)request.getAttribute("grjj");
String PY = (String)request.getAttribute("PY");
%>
<div>
姓名：<%=name%>
</div>
<div>
职称：<%=zhicheng%>
</div>
<div>
擅长：<%=shanchang%>
</div>
<div>
个人简介：<%=grjj%>
</div>
<form action="yijiattservlet" method="post">
<input name="name" type="hidden" value=<%=name %> />
<input name="PY" type="hidden" value=<%=PY%> >
<input name="zhicheng" type="hidden" value=<%=zhicheng %> />
<input name="shanchang" type="hidden" value=<%=shanchang %> />
<input name="grjj" type="hidden" value=<%=grjj %> />
<input type="button" name="back" value="修改" onclick="javascript:history.go(-1);"/>
<input type="submit" value="确定"></form>

</body>
</html>