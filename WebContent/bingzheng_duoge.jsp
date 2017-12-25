<%@page import="com.db.DataProcess"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>


	<%
		
		String bingzhengs = (String)request.getAttribute("bingzheng_names");
		if(bingzhengs==null||bingzhengs.equals("")){
			response.sendRedirect("bingzheng.jsp");
			return;
		}
		
		
		String[] bingzheng = bingzhengs.split(";");
		
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
				<img alt="header" src="images/header.png" height="80px" id="image" /> 
				<div>
					<form action="Select_bingzheng">
						<div style="position: absolute;left: 300px;top: 70px;">
							请输入您要搜索的病症: <input type="text" name="select_chaxunbingzheng"   style="margin-left: 10px; margin-top: 50px; width: 400px;" placeholder="病症名称，关键字或者拼音"/>
							<input type="submit" value="查询"/>
							<input type="button" name="addBingzheng" id = "addBingzheng"  onclick="window.location.href = 'bingzhengtianjia.jsp'" value="病症添加" />
						</div>
					</form>
					</div>
				<div style="position: absolute;left: 300px;top: 200px;">
					<%
					
						Vector big = new Vector();
						Vector small = new Vector();
						for(int i =0 ; i < bingzheng.length;i++){
							big = dataProcess.getData("Select Disease_ID from disease where Disease_Name like '"+bingzheng[i]+"'");
							small = (Vector)big.get(0);
							System.out.print(small.get(0)+"\n");
							%>
							<a href="Select_bingzheng?select_id=<%=small.get(0).toString() %>"><%=bingzheng[i] %></a>
							<br>
							<%
						}
					
					%>
				
				</div>
				
				<div style="position: absolute;top: 200px;width:200px">
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
				
			</div>
			
			
			<div class="clearfix">
			
			</div>					
			<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"> </script>
</body>
</html>