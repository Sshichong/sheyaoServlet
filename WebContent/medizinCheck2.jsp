<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="medizin" class="com.beans.Medizin" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>检查</title>
</head>
<body>
<%

String leibie=(String)request.getAttribute("lb");

%>
<div>
畲药名称：<jsp:getProperty property="medizin_name" name="medizin"/>
</div>
<div>
别名：<jsp:getProperty property="medizin_anotherName" name="medizin"/>
</div>
<div>
药性：<jsp:getProperty property="medizin_property" name="medizin"/>
</div>
<div>
畲药类别：<%=leibie %>
</div>
<div>
原植物介绍：<jsp:getProperty property="medizin_introduce" name="medizin"/>
</div>
<div>
生境分布：<jsp:getProperty property="medizin_distribution" name="medizin"/>
</div>
<div>
采集加工：<jsp:getProperty property="medizin_collectionProcessing" name="medizin"/>
</div>
<div>
注意事项：<jsp:getProperty property="medizin_precautions" name="medizin"/>
</div>
<div>
化学成分：<jsp:getProperty property="medizin_chemicalComponent" name="medizin"/>
</div>
<div>
化学成分参考文献：<jsp:getProperty property="medizin_referencesChemical" name="medizin"/>
</div>
<div>
现代临床研究参考文献：<jsp:getProperty property="medizin_referencesClinic" name="medizin"/>
</div>
<div>
药理参考文献：<jsp:getProperty property="medizin_referencesPharmacology" name="medizin"/>
</div>

<form action="InsertSyServlet1" method="post">
<input name="zhengming" type="hidden" value="<jsp:getProperty property="medizin_name" name="medizin"/>" />
<input name="yiming" type="hidden" value="<jsp:getProperty property="medizin_anotherName" name="medizin"/>" >
<input name="yaoxing" type="hidden" value="<jsp:getProperty property="medizin_property" name="medizin"/> "/>
<input name="leibie" type="hidden" value=<jsp:getProperty property="medizin_planCategory" name="medizin"/> />
<input name="yuanzhiwujieshao" type="hidden" value="<jsp:getProperty property="medizin_introduce" name="medizin"/>" />
<input name="shengjingfenbu" type="hidden" value="<jsp:getProperty property="medizin_distribution" name="medizin"/>" />
<input name="caijijiagong" type="hidden" value="<jsp:getProperty property="medizin_collectionProcessing" name="medizin"/>" />
<input name="zhuyishixiang" type="hidden" value="<jsp:getProperty property="medizin_collectionProcessing" name="medizin"/>" />
<input name="huaxuechengfen" type="hidden" value="<jsp:getProperty property="medizin_chemicalComponent" name="medizin"/>" />
<input name="huaxuechengfencankaowenxian" type="hidden" value="<jsp:getProperty property="medizin_referencesChemical" name="medizin"/>" />
<input name="xiandailinchuangyanjiucankaowenxian" type="hidden" value="<jsp:getProperty property="medizin_referencesClinic" name="medizin"/>" />
<input name="yaolicankaowenxian" type="hidden" value="<jsp:getProperty property="medizin_referencesPharmacology" name="medizin"/>" />
<input name="forSelect" type="hidden" value='<jsp:getProperty property="medizin_forSelect" name="medizin"/>'>

<input type="button" name="back" value="修改" onclick="javascript:history.go(-1);"/>
<input type="submit" value="确定"></form>
</body>
</html>