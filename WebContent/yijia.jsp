<%@page import="com.list.DataList"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DataProcess"%>
<%@page import="com.list.FunCtion"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Gallery</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">

<!--web-font-->
<link href='https://fonts.googleapis.com/css?family=Marvel:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!--//web-font-->
<!-- Custom Theme files -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Plot Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script> 
<!-- //js -->	
<!-- start-smoth-scrolling-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!--//end-smoth-scrolling-->

<style type="text/css">
html{font-size:62.5%;}
body {font:normal 100% Arial,sans-serif;font-size:14px; font-size:1.4rem; }

div.list_pos{
position:absolute;
left:8%;
top:70px
}
div.head1_pos
{
position:absolute;
left:8%;
top:50px
}
div.head_pos
{
position:absolute;
left:33%;
top:30px
}
input.pos_abs
{

position:absolute;
}
a.pos_abs1
{
position:relative;
left:10%;
top:0px
}
div.pos
{
position:absolute;
left:23%;
top:120px
}
div.pos1
{
position:absolute;
left:23%;
top:270px
}
div.pos2
{
position:absolute;
left:23%;
top:480px
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
p.word2
{
font-size:20px;
font-weight:900		
}

</style>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!--side-bar-->
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.png" alt="logo"/></a>
				</div>
				<div class="top-nav">
					<span class="menu-icon"><img src="images/menu-icon.png" alt=""/></span>	
					<div class="nav1">
						<ul class=" nav nav-sidebar">
							<li ><a href="index.jsp">主页</a></li>
							<li><a href="sheyao.jsp">畲药</a></li>
							<li><a href="bingzheng.jsp">病症</a></li>
							<li class="active"><a href="yijia.jsp">医家</a></li>
							<li><a href="minjianchufang.jsp">民间处方</a></li>
							<li><a href="tonji.jsp">统计</a></li>
						</ul> 					
					</div>	
					<!-- script-for-menu -->
						 <script>
						   $( "span.menu-icon" ).click(function() {
							 $( ".nav1" ).slideToggle( 300, function() {
							 // Animation complete.
							  });
							 });
						</script>
						<!-- /script-for-menu -->
				</div>
				<div class="clearfix">
				 </div>				
			</div>
			<!--//side-bar-->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main about-main">
				<div id="navsecond">
				
				<div id="course" class="head1_pos"><h2>姓氏排列</h2>
				 <div style="width: 80px" class="list_pos">
				 <%
				 FunCtion fc = new FunCtion();
				char zimu = 'A';
				while(zimu<'a'){
					
					List<DataList> list = fc.getName(zimu);
				if(list!=null){
				//	System.out.println(list.length);
				 %>
				 <details>
					<summary><%=zimu %></summary>
				<%	for(DataList str:list){ %>
					<ul><li><a href="yijiaAservlet?select_yijia=<%=str.getId()%>"><%=str.getData()%></a></li></ul>
					<%
					}
				}%>
				</details><%
				zimu++;
				} %>
					</div>
				</div>
				</div>
				
				<jsp:useBean id="yijia_name" class="com.list.DataLList" scope="request"></jsp:useBean>
				
				<%
				
				String yijia_title = (String) request.getAttribute("yijia_title");
					if(yijia_title==null){
									yijia_title="";
								}
				String yijia_dp = (String) request.getAttribute("yijia_dp");
				%>
				
				<div id="maincontent">
				<form action="yijiaservlet" method="post">
				<div class="head_pos">	
				医家查询
				<input type="text" size="50" placeholder="请输入您想要查询的医家，支持姓名简拼全拼等方式输入！" name="select_yijia">
				<input type="submit" value="查询">
				<a href="yijiatianjia.jsp" class="pos_abs1" >医家添加</a>
				</div>
				</form>
				
								
				<div class="pos">
				<p class="word"><%=yijia_title %></p>
				<p class="word1">
					<% if(yijia_name.getList()!=null){
					for(DataList str:yijia_name.getList()){
						%><a href="yijiaAservlet?select_yijia=<%=str.getId()%>"><%=str.getData()%> </a><%
					}
					}
					%>
					</p>
				<p class="word">
				<%
				if(yijia_dp!=null){
				%>
				擅长：<%=yijia_dp %>
				<%} %>
				</p>
				</div>	
				<%
				String doctor_in = (String)request.getAttribute("yijia_in");
				if(doctor_in!=null){
				%>
				<div class=pos1>
				<p class="word2">个人简介</p>
				<textarea readonly="readonly" cols="120" rows="10" style="overflow-x:hidden;overflow-y:scroll;"><%=doctor_in%></textarea> 
				</div>
				<%} %>
				
				<%
				StringBuffer Pp_in = (StringBuffer)request.getAttribute("yijia_Pp");
				if(Pp_in!=null){
				%>
				<div class=pos2>
				<p class="word2">个人处方</p>
				<textarea readonly="readonly" cols="120" rows="10" style="overflow-x:hidden;overflow-y:scroll;"><%=Pp_in%></textarea> 
				</div>
				<%} %>
				
				
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				<!--start-gallery js-->
				<script type="text/javascript" src="js/jquery.fancybox.js"></script>
					<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css" media="screen" />
					<script type="text/javascript">
						$(document).ready(function() {
							/*
							*  Simple image gallery. Uses default settings
							*/
						$('.fancybox').fancybox();
						});
				</script>
				<!--//end-gallery js-->
				<div class="footer">
					<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="æ¨¡æ¿ä¹å®¶">æ¨¡æ¿ä¹å®¶</a> - Collect from <a href="http://www.cssmoban.com/" title="ç½é¡µæ¨¡æ¿" target="_blank">ç½é¡µæ¨¡æ¿</a></p>
				</div>
			</div>	
			<div class="clearfix"> </div>								
		</div>
	</div>	
	
	
   <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"> </script>
</body>
</html>