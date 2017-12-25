<%@page import="com.beans.Bingzheng"%>
<%@page import="com.db.DataProcess"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
	<jsp:useBean id="message" class="com.beans.Message" scope="request"/>
	<jsp:useBean id="bingzheng" class="com.beans.Bingzheng" scope="request"/>
	<%
	
		//获取数据
		String bingzheng_names = (String)request.getAttribute("bingzheng_names");
		//验证数据的存在性


		
		
		
		
		DataProcess dataProcess = new DataProcess();
		Vector big_one = dataProcess.getData("Select * from disease");
		Vector small_one;
	
	%>
<!DOCTYPE html>
<html>
<head>
<title>Services</title>
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
#tu{
float:left;
padding-left:20px;
padding-top:20px;
width:20%;

}
#wenzi{
float:left;
padding-top:25px;
padding-right:30px;
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
							<li><a href="index.jsp">主页</a></li>
							<li><a href="sheyao.jsp">畲药</a></li>
							<li class="active"><a href="bingzheng.jsp">病症</a></li>
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
						   $( "span.menu-icon" ).click(function() {
							 $( ".nav1" ).slideToggle( 300, function() {
							 // Animation complete.
							  });
							 });
						</script>
						<!-- /script-for-menu -->
				</div>
				<div class="clearfix"> </div>				
			</div>
			<!--//side-bar-->
			<div id="mian_show" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main about-main">
			
				
				
				
				<div class="services">
				<!-- <h1>病症模块</h1>  -->
				<img alt="header" src="images/header.png" height="80px" id="image" /> 
				<div style="position: absolute;left: 300px;top: 160px; color: red;" >
				<jsp:getProperty property="mess" name="message"/>
				</div>
					<form action="Select_bingzheng">
						<div align="center">
							搜索病症: <input type="text" name="select_chaxunbingzheng"   style="margin-left: 10px; margin-top: 50px; width: 400px;" placeholder="请输入正名，异名，全拼或简拼"/><input type="submit" value="查询"/>
							<input type="button" name="addBingzheng" id = "addBingzheng"  onclick="window.location.href = 'bingzhengtianjia.jsp'" value="病症添加" />
							</div>
							</form>
						</div>
				<div id="aside">
                    <details>
						<summary>内科</summary>
							<%
							if(big_one.size()!=0){
								%>
								<ul>
								<%
								for(int i =0 ; i < big_one.size();i++){
									small_one = (Vector)big_one.get(i);
									if(small_one.get(2).equals("1")){
										%>
										<ol><a href="Select_bingzheng?select_id=<%=small_one.get(0).toString() %>"> <%=small_one.get(1).toString() %></a></ol>
										<%
									}
								}
								%>
								</ul>
								<%
							}
							
							%>					
						
					</details>
					<details>
						<summary>外科</summary>
<%
							if(big_one.size()!=0){
								%>
								<ul>
								<%
								for(int i =0 ; i < big_one.size();i++){
									small_one = (Vector)big_one.get(i);
									if(small_one.get(2).equals("2")){
										%>
										<ol><a href="Select_bingzheng?select_id=<%=small_one.get(0).toString() %>"> <%=small_one.get(1).toString() %></a></ol>
										<%
									}
								}
								%>
								</ul>
								<%
							}
							
							%>		
					</details>
					<details>
						<summary>妇科</summary>
						<%
							if(big_one.size()!=0){
								%>
								<ul>
								<%
								for(int i =0 ; i < big_one.size();i++){
									small_one = (Vector)big_one.get(i);
									if(small_one.get(2).equals("3")){
										%>
										<ol><a href="Select_bingzheng?select_id=<%=small_one.get(0).toString() %>"> <%=small_one.get(1).toString() %></a></ol>
										<%
									}
								}
								%>
								</ul>
								<%
							}
							
							%>		
					</details>
					<details>
						<summary>儿科</summary>
						<%
							if(big_one.size()!=0){
								%>
								<ul>
								<%
								for(int i =0 ; i < big_one.size();i++){
									small_one = (Vector)big_one.get(i);
									if(small_one.get(2).equals("4")){
										%>
										<ol><a href="Select_bingzheng?select_id=<%=small_one.get(0).toString() %>"> <%=small_one.get(1).toString() %></a></ol>
										<%
									}
								}
								%>
								</ul>
								<%
							}
							
							%>		
					</details>
					<details>
						<summary>五官科</summary>
						<%
							if(big_one.size()!=0){
								%>
								<ul>
								<%
								for(int i =0 ; i < big_one.size();i++){
									small_one = (Vector)big_one.get(i);
									if(small_one.get(2).equals("5")){
										%>
										<ol><a href="Select_bingzheng?select_id=<%=small_one.get(0).toString() %>"> <%=small_one.get(1).toString() %></a></ol>
										<%
									}
								}
								%>
								</ul>
								<%
							}
							
							%>		
					</details>
                    <details>
						<summary>蛇伤科</summary>
						<%
							if(big_one.size()!=0){
								%>
								<ul>
								<%
								for(int i =0 ; i < big_one.size();i++){
									small_one = (Vector)big_one.get(i);
									if(small_one.get(2).equals("6")){
										%>
										<ol><a href="Select_bingzheng?select_id=<%=small_one.get(0).toString() %>"> <%=small_one.get(1).toString() %></a></ol>
										<%
									}
								}
								%>
								</ul>
								<%
							}
							
							%>		
					</details>
			</div>
	<div id="content-right">
			 <div id="wenzi">
			     <div class="posa">
			 	<span class="word1"><jsp:getProperty property="bzKeshi" name="bingzheng"/> </span>
			 	<p class="word"><jsp:getProperty property="bzName" name="bingzheng"/></p>
			 	</div>
			 	
						<div class=pos1>
							<p class="word2">病症介绍</p>
							<div style="border:1px #A9A9A9 solid; width:100%; height:200px"><jsp:getProperty property="bzJieshao" name="bingzheng"/></div>
						</div>
						<div class="pos1">
							<p class="word2">畲药药方</p>
							<div style="border:1px #A9A9A9 solid; width:100%; height:200px">
								<%
			  	if(bingzheng.getBzID()==null){
			  		%>
			  			1:<a href="QueryServlet?select=马勃">马勃</a>3份 , 鲜猪油1份 ,
			  		<%	
			  	}
			  	
				if(bingzheng.getBzZhiliao()!=null){
					String bz[] = bingzheng.getBzZhiliao().split(";");

					for(int i =0 ; i<bz.length;i++){
						String bz2[] = bz[i].split("_");
						%><%=i+1+":" %><%
						
						for(int j = 0 ; j < bz2.length;j++){
							String[] bz1 = bz2[j].split("[+]");//转译"+"
							if(bz1[0].matches("[0-9]+")){
								Vector a = dataProcess.getData("select Medicine_Name from medicine where Medicine_ID like '"+bz1[0]+"'");
								Vector b = (Vector)a.get(0);
								%><a href="QueryServlet?select="+<%=b.get(0)%>><%=b.get(0)%></a><%=bz1[1] %><%
							}else{
							
							%>
							<%=bz1[0]%><%=bz1[1] %>
							<%
							}
							%>
							<%="," %>
							
							<%
						}
						%>
						<br>
						<%
					}
					
				}
				
			  	
			  	
			  	%>
				</div>
			</div>

		</div>
	 	
			<div  id="tu">
				<h2>标志图片</h2>
				<br>		
				<div style="background:#F0F0F0; width:400px; height:300px">
				<img alt="疔疮图片" src="images/bingzheng/dingchuang.jpg" width="400px" height="300px">
				</div>
				<br>
				<h2>图册</h2>
				<div style="background:#F0F0F0; width:180px; height:200px">
				</div>
				<br>
				<div style="background:#F0F0F0; width:180px; height:200px">
				</div>
		   </div>
		   
		
			</div>
		   
	
			
			<div class="clearfix">
			
			</div>					
			<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"> </script>
</body>
</html>