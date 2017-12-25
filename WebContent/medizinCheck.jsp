<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.db.DataProcess"%>
<%@page import="com.beans.Medizin"%>
<jsp:useBean id="medizin" class="com.beans.Medizin" scope="request" />
<jsp:useBean id="messInfo" class="com.beans.MessInfo" scope="request"/>
<!DOCTYPE html>
<html>
<head>

<title>畲药</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!--web-font-->
<link
	href='https://fonts.googleapis.com/css?family=Marvel:400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!--//web-font-->
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Plot Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //Custom Theme files -->
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<style type="text/css">
#tu{
float:left;
padding-left:40px;
padding-top:30px;
width:20%;
}
#wenzi{
float:left;
padding-top:25px;
width:80%;
}
div.head_pos
{
position:absolute;
left:530px;
top:30px
}
input.pos_abs
{
position:relative;
}
a.pos_abs1
{
position:absolute;
left:900px;
top:150px
}
div.pos
{
position:relative;
left:10px;
top:20px
}
div.posa
{
position:relative;
left:10px;
}
div.pos1
{
position:relative;
left:10px;
top:20px
}

div.pos2
{
position:absolute;
left:250px;
top:500px
}
p.word
{
font-size:20px		
}
p.word1
{
font-size:50px;
font-weight:900		
}
span.word1
{
font-size:50px;
font-weight:900		
}
p.word2
{
font-size:20px;
font-weight:900		
}
p.word3
{
font-size:15px;
	
}
</style>

<!--//end-smoth-scrolling-->
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!--side-bar-->
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.png" alt="logo" /></a>
				</div>
				<div class="top-nav">
					<span class="menu-icon"><img src="images/menu-icon.png"
						alt="" /></span>
					<div class="nav1">
						<ul class=" nav nav-sidebar">
							<li><a href="index.jsp">主页</a></li>
							<li class="active"><a href="sheyao.jsp">畲药</a></li>
							<li><a href="bingzheng.jsp">病症</a></li>
							<li><a href="yijia.jsp">医家</a></li>
							<li><a href="minjianchufang.jsp">民间处方</a></li>
							<li><a href="tonji.jsp">统计</a></li>
						</ul>
						<div class="social-icons">
							<ul>
								<li><a href="#"></a></li>
								<li><a href="#" class="fb"></a></li>
								<li><a href="#" class="be"></a></li>
								<li><a href="#" class="gg"></a></li>
							</ul>
						</div>
					</div>
					<!-- script-for-menu -->
					<script>
						$("span.menu-icon").click(function() {
							$(".nav1").slideToggle(300, function() {
								// Animation complete.
							});
						});
					</script>
					<!-- /script-for-menu -->
				</div>
				<div class="clearfix"></div>
			</div>
			<!--//side-bar-->
			<div
				class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main about-main">
				<div class="about">
				<img alt="header" src="images/header.png" height="80px" id="image" /> 
					<div class="clearfix"></div>
				</div>

				<div class="services">
					<%
						String leibie = (String) request.getAttribute("lb");
					%>


					<div>
						畲药名称：<jsp:getProperty property="medizin_name" name="medizin" />
					</div>
					<div>
						别名：<jsp:getProperty property="medizin_anotherName" name="medizin" />
					</div>
					<div>
						药性：<jsp:getProperty property="medizin_property" name="medizin" />
					</div>
					<div>
						畲药类别：<%=leibie%>
					</div>
					<div>
						原植物介绍：<jsp:getProperty property="medizin_introduce" name="medizin" />
					</div>
					<div>
						生境分布：<jsp:getProperty property="medizin_distribution"
							name="medizin" />
					</div>
					<div>
						采集加工：<jsp:getProperty property="medizin_collectionProcessing"
							name="medizin" />
					</div>
					<div>
						注意事项：<jsp:getProperty property="medizin_precautions"
							name="medizin" />
					</div>
					<div>
						化学成分：<jsp:getProperty property="medizin_chemicalComponent"
							name="medizin" />
					</div>
					<div>
						化学成分参考文献：<jsp:getProperty property="medizin_referencesChemical"
							name="medizin" />
					</div>
					<div>
						现代临床研究参考文献：<jsp:getProperty property="medizin_referencesClinic"
							name="medizin" />
					</div>
					<div>
						药理参考文献：<jsp:getProperty property="medizin_referencesPharmacology"
							name="medizin" />
					</div>

					<form action="InsertSyServlet1" method="post">
						<input name="zhengming" type="hidden"
							value="<jsp:getProperty property="medizin_name" name="medizin"/>" />
						<input name="yiming" type="hidden"
							value="<jsp:getProperty property="medizin_anotherName" name="medizin"/>">
						<input name="yaoxing" type="hidden"
							value="<jsp:getProperty property="medizin_property" name="medizin"/> " />
						<input name="leibie" type="hidden"
							value=<jsp:getProperty property="medizin_planCategory" name="medizin"/> />
						<input name="yuanzhiwujieshao" type="hidden"
							value="<jsp:getProperty property="medizin_introduce" name="medizin"/>" />
						<input name="shengjingfenbu" type="hidden"
							value="<jsp:getProperty property="medizin_distribution" name="medizin"/>" />
						<input name="caijijiagong" type="hidden"
							value="<jsp:getProperty property="medizin_collectionProcessing" name="medizin"/>" />
						<input name="zhuyishixiang" type="hidden"
							value="<jsp:getProperty property="medizin_collectionProcessing" name="medizin"/>" />
						<input name="huaxuechengfen" type="hidden"
							value="<jsp:getProperty property="medizin_chemicalComponent" name="medizin"/>" />
						<input name="huaxuechengfencankaowenxian" type="hidden"
							value="<jsp:getProperty property="medizin_referencesChemical" name="medizin"/>" />
						<input name="xiandailinchuangyanjiucankaowenxian" type="hidden"
							value="<jsp:getProperty property="medizin_referencesClinic" name="medizin"/>" />
						<input name="yaolicankaowenxian" type="hidden"
							value="<jsp:getProperty property="medizin_referencesPharmacology" name="medizin"/>" />
						<input name="forSelect" type="hidden"
							value='<jsp:getProperty property="medizin_forSelect" name="medizin"/>'>

						<input type="button" name="back" value="修改"
							onclick="javascript:history.go(-1);" /> <input type="submit"
							value="确定">
					</form>








				</div>
				
				
				<div class="clearfix"></div>
		</div>
	</div>

</div>

	<div class="footer"></div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/bootstrap.js"> </script>
</body>
</html>