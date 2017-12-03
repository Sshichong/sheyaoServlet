<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>畲药添加</title>
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
<h2>
<!--//end-smoth-scrolling-->
</head>
<body>
	<div class="container-fluid" >
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
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main about-main">
			
				<div class="about">
					
					<div class="clearfix">
					<div class=neirong>
	<div class="xinxitianjia" >
		<form action="InsertSyServlet" method="post" >
			<table >
				<tr><td>正名</td><td><input name="zhengming"></td></tr>
				<tr><td>异名</td><td><input name="yiming"></td></tr>
				<tr><td>全拼</td><td><input name="quanpin"></td></tr>
				<tr><td>简拼</td><td><input name="jianpin"></td></tr>
				<tr><td>异名全拼</td><td><input name="yimingquanpin"></td></tr>
				<tr><td>异名简拼</td><td><input name="yimingjianpin"></td></tr>
				<tr><td>药性</td>
					<td><select name="yaoxing">
							<option value="yinyao">阴药</option>
							<option value="yangyao">阳药</option>
						</select></td></tr>
				<tr><td>类别</td>
						<td><select name="leibie">
							<option value="2">菌类植物</option>
							<option value="3">地衣类植物</option>
							<option value="5">蕨类类植物</option>
							<option value="6">裸子类植物</option>
							<option value="7">双子叶类植物</option>
							</select></td></tr>
				<tr><td>原植物介绍</td><td><input name="yuanzhiwujieshao" type="text"></td></tr>
				<tr><td>生境分布</td><td><input name="shengjingfenbu" type="text"></td></tr>
				<tr><td>采集加工</td><td><input name="caijijiagong" type="text"></td></tr>
				<tr><td></td><td><input type="button" id="add" value="添加一条"/><td></tr>
				<!-- <tr><td>奢药药方</td><td> <textarea rows="10" cols="21" name="sheyaoyaofang"></textarea> </td></tr> -->
				<tr><td>奢药药方</td><td id="td"><input type="text" name="yaofang" /><br/></td></tr>
				<tr><td><input type="submit" value="添加" /></td></tr>
			</table>
		</form>
	</div>
</div>
					 </div>
				</div>
				

				
			</div>
			<div class="clearfix"> </div>				
		</div>
	</div>
<!-- <div class=neirong>
	<div class="xinxitianjia" style="float:right">
		<form action="Sheyao_tianjia" method="post" >
			<table>
				<tr><td>正名</td><td><input name="zhengming"></td></tr>
				<tr><td>异名</td><td><input name="yiming"></td></tr>
				<tr><td>全拼</td><td><input name="quanpin"></td></tr>
				<tr><td>简拼</td><td><input name="jianpin"></td></tr>
				<tr><td>药性</td>
					<td><select name="yaoxing">
							<option value="yinyao">阴药</option>
							<option value="yangyao">阳药</option>
						</select></td></tr>
				<tr><td>类别</td>
						<td><select name="leibie">
							<option value="junleizhiwu">菌类植物</option>
							<option value="diyitaixianleizhiwu">地衣苔藓类植物</option>
							</select></td></tr>
				<tr><td>原植物介绍</td><td><input name="yuanzhiwujieshao"></td></tr>
				<tr><td>生境分布</td><td><input name="shengjingfenbu"></td></tr>
				<tr><td>采集加工</td><td><input name="caijijiagong"></td></tr>
				<tr><td>奢药药方</td><td></td></tr>不会
			</table>
		</form>
	</div>
</div> -->
<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"> </script>
    <script>
    add.onclick=function(){
    	/* var input=document.getElementById("td");
        input.innerHTML+='<input type="'+'text" name="'+'yaofang"/><br/>'; */
            var input = document.createElement('input');//创建input节点
            input.name  = 'yaofang';   //设置属性
            input.type = 'text';
            var br= document.createElement('br');  //添加br节点换行
            document.getElementById("td").appendChild(input);  //追加节点
            document.getElementById("td").appendChild(br);
    }
    
    
    </script>
</body>
</html>