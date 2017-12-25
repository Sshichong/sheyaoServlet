<%@page import="com.beans.MessInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MessInfo messInfo = new MessInfo();
	String bzName = request.getParameter("name");
	String bzQP = request.getParameter("quanpin");
	String bzKs = request.getParameter("keshi");
	String bzJp = request.getParameter("jianpin");
	String bzJj = request.getParameter("gzjj");
	
	if(bzName==null||bzName.equals("")||bzJp==null||bzJp.equals("")||bzJj==null||bzJj.equals("")||bzKs==null||bzKs.equals("")||bzQP==null||bzQP.equals("")){
		messInfo.setMess("请输入完整信息");
		request.setAttribute("messInfo", messInfo);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("bingzhengtianjia.jsp");
		requestDispatcher.forward(request, response);
		return;
	}
	
	bzName = ZhuanyiChinese.changeChinese(bzName);
	bzQP = ZhuanyiChinese.changeChinese(bzQP);
	bzKs = ZhuanyiChinese.changeChinese(bzKs);
	bzJp = ZhuanyiChinese.changeChinese(bzJp);
	bzJj = ZhuanyiChinese.changeChinese(bzJj);
	bzQP = bzQP.replace(" ", "");
	bzJp = bzJp.replace(" ", "");
	
	
	
	String bzFZ = request.getParameter("textForChuanshu");
	if(bzFZ!=null&&!bzFZ.equals("")){
		
		bzFZ = ZhuanyiChinese.changeChinese(bzFZ);
		
	}else{
		bzFZ="";
	}
	

%>


<form action="Bztianjia" >
病名：<%=bzName %><br>
病症所属科室：<%=bzKs %><br>
病症描述：<%=bzJj %><br>
病症方子：<%=bzFZ %><br>
	<input type="text" name="name" style="display: none;" value="<%=bzName%>">
	<input type="text" name="quanpin" style="display: none;" value="<%=bzQP%>">
	<input type="text" name="keshi" style="display: none;" value="<%=bzKs%>">
	<input type="text" name="jianpin" style="display: none;" value="<%=bzJp%>">
	<input type="text" name="gzjj" style="display: none;" value="<%=bzJj%>">
	<input type="submit" value="提交">
	<input type="button" value="返回修改" onclick="history.back()">
	<input id="textForChuanshu" name="textForChuanshu"  style="display: none">
</form>

</body>
</html>