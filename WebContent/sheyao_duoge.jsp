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

}
#wenzi{
float:left;
padding-top:25px;
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
				<!-- <img alt="111" src="images/1111.png" height="100px" > -->
					<div class="clearfix"></div>
				</div>
				<%--  <%
DataProcess dataProcess =new DataProcess();
String sql ="select * from medizin";
Vector vector = dataProcess.getData(sql);

for(int i=0;i<vector.size();i++){
	Vector v= (Vector)vector.get(i);	
	for(int j=0;j<v.size();j++){
		if(j==1){
			out.print("名称：");
		}else if(j==2){
			out.print("别名：");
		}
		out.print(v.get(j)+" ");
	}
	out.print("<br/>");
}
%> --%>

				<%
					
				%>
				<div class="services">
				<h1>畲药</h1>
				<form action="QueryServlet" method="post">
				<div align="center">
				搜索畲药：<input type="text" name="select" placeholder="请输入正名，异名，全拼或简拼" style="margin-left: 10px; margin-top: 50px; width: 400px;"/><input type="submit" value="搜索"/>
				<input type="button" name="addSheyao" id = "addSheyao"  onclick="window.location.href = 'sheyao_tianjia.jsp'" value="畲药添加" />
				</div>
				</form>
				<!-- <a href="sheyao_tianjia.jsp" class="pos_abs1" >畲药添加</a> -->
				</div>
				<div id="aside" >
					<details>
						<summary>菌类植物</summary>
						<ul>

							<%
							request.setCharacterEncoding("utf-8");
							response.setCharacterEncoding("utf-8");
							DataProcess dataProcess = new DataProcess();
							String sql = "select * from medizin";
							Vector vector = dataProcess.getData(sql);
							for (int i = 0; i < vector.size(); i++) {
								Vector v = (Vector) vector.get(i);
								if(v.get(13).equals("2")){
						%>

							 <!-- <li><a href="#<%=v.get(19)%>>"><%=v.get(1)%></a></li> -->
							<li><a href="QueryServlet?select=<%=v.get(1)%>"><%=v.get(1) %></a></li>
							<%}
								}%>
						</ul>
					</details>
					<details>
						<summary>地衣苔藓类植物</summary>
						<ul>

							<%
						for (int i = 0; i < vector.size(); i++) {
							Vector v = (Vector) vector.get(i);
							if(v.get(13).equals("3")){%>
							<%-- <li><a href="#<%=v.get(19)%>>"><%=v.get(1)%></a></li> --%>
							<li><a href="QueryServlet?select=<%=v.get(1)%>"><%=v.get(1) %></a></li>
							<% }
						}%>






						</ul>
					</details>
					<details>
						<summary>蕨类植物</summary>
						<ul>
							<%
						for (int i = 0; i < vector.size(); i++) {
							Vector v = (Vector) vector.get(i);
							if(v.get(13).equals("5")){%>

							<%-- <li><a href="#<%=v.get(19)%>>"><%=v.get(1)%></a></li> --%>
							<li><a href="QueryServlet?select=<%=v.get(1)%>"><%=v.get(1) %></a></li>
							<% }
						}%>

						</ul>
					</details>
					<details>
						<summary>裸子植物</summary>
						<ul>


							<%
						for (int i = 0; i < vector.size(); i++) {
							Vector v = (Vector) vector.get(i);
							if(v.get(13).equals("6")){%>

							<%-- <li><a href="#<%=v.get(19)%>>"><%=v.get(1)%></a></li> --%>
							<li><a href="QueryServlet?select=<%=v.get(1)%>"><%=v.get(1) %></a></li>
							<% }
						}%>
						</ul>
					</details>
					<details>
						<summary>双子叶植物</summary>
						<ul>
							<%
						for (int i = 0; i < vector.size(); i++) {
							Vector v = (Vector) vector.get(i);
							if(v.get(13).equals("7")){%>

							<%-- <li><a href="#<%=v.get(19)%>>"><%=v.get(1)%></a></li> --%>
							<li><a href="QueryServlet?select=<%=v.get(1)%>"><%=v.get(1) %></a></li>
							<%
								}
							}
							
						%>
						</ul>
					</details>



				</div>
				<div id="content-right">
				<h4 style="margin-top:30px"><jsp:getProperty property="mess" name="messInfo"/></h4><br/>
					<%
						List<Medizin> list = (List<Medizin>) request.getAttribute("duotiaojilu");
						if (list != null) {
							for (Medizin m : list) {%>
						<a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank" ><%=m.getMedizin_name() %></a><br/>		
					<%	}
						}
					%>
					


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