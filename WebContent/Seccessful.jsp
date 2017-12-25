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
		<div>
		假装这个是图：添加成功！
		</div>
		<button id="tj" type="button">继续添加</button>
		<button id="fh" type="button">返回首页</button>
		<script type="text/javascript">
<!--
//-->
			$("#tj").click(function(){
				$(window).attr('location','yijiatianjia.jsp');
			})
			$("#fh").click(function(){
				$(window).attr('location','index.jsp');
			})
</script>
	</body>
</html>