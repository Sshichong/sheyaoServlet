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
td {
      white-space:nowrap;
      overflow:hidden;
      text-overflow: ellipsis;
}
table{
        table-layout:fixed;
        word-wrap:break-word;
        margin-top:20px;
        word-wrap: break-word; 
        word-break: break-all;
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
							<li class="active"><a href="QueryServlet">畲药</a></li>
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
				<div class="about" >
				<img alt="header" src="images/header.png" height="80px" id="image" /> 
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
				<!-- <h1>畲药</h1> -->
				<form action="QueryServlet" method="post">
				<div align="center">
				搜索畲药：<input id="select" type="text" name="select" placeholder="请输入正名，异名，全拼或简拼" style="margin-left: 10px; margin-top: 50px; width: 400px;"/><input id="submit" type="submit" value="搜索"/>
				<input type="button" name="addBingzheng" id = "addBingzheng"  onclick="window.location.href = 'sheyao_tianjia.jsp'" value="畲药添加" />
				</div>
				</form>
				<!-- <a href="sheyao_tianjia.jsp" class="pos_abs1" >畲药添加</a> -->
				</div>
				<div id="aside" >
					<details>
						<summary><a href="QueryServlet?sort=2" style="color:black">菌类植物</a></summary>
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
						<summary><a href="QueryServlet?sort=3" style="color:black">地衣苔藓类植物</a></summary>
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
						<summary><a href="QueryServlet?sort=5" style="color:black">蕨类植物</a></summary>
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
						<summary><a href="QueryServlet?sort=6" style="color:black">裸子植物</a></summary>
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
						<summary><a href="QueryServlet?sort=7" style="color:black">双子叶植物</a></summary>
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
					<%
						List<Medizin> list = (List<Medizin>) request.getAttribute("yitiaojilu");
						List<Medizin> qb =(List<Medizin>)request.getAttribute("quanbu");
						List<Medizin> fl =(List<Medizin>)request.getAttribute("fenlei");
// 						out.print(fl);
// 						out.print(qb);
						if (list != null) {
							for (Medizin m : list) {
					%>
					<div id="wenzi">
						<div class="posa">
							<span class="word1"><%=m.getMedizin_name()%></span><span
								style="padding-left: 10px"><%=m.getMedizin_property()%></span>
							<p class="word">
								<%=m.getMedizin_anotherName()%>
							</p>

						</div>

						<div class=pos1>
							<p class="word2">原植物</p>
							<div style="border:1px #A9A9A9 solid; width:100%; height:200px"><%=m.getMedizin_introduce()%></div>
						</div>
						<div class="pos">
							<p class="word2">生境分布</p>
							<p class="word3">
								<%=m.getMedizin_distribution()%>
							</p>

						</div>
						<div class="pos">
							<p class="word2">采收加工</p>
							<p class="word3">
								<%=m.getMedizin_collectionProcessing()%>
							</p>

						</div>
						<div class=pos1>
							<p class="word2">主治用法</p>
							<div style="border:1px #A9A9A9 solid; width:100%; height:200px"><%=m.getMedizin_mainUse() %></div>
						</div>
					</div>
				
					<div id="tu">
						<h2>标志图片</h2>
						<br>
						<div style="background: #F0F0F0; width: 210px; height: 130px">
							
								<img  src="picture/<%=m.getMedizin_plantSeed() %>"
								width="210px" height="130px">
						</div>
						<br>
						<h2>图册</h2>
						<div style="background: #F0F0F0; width: 150px; height: 150px">
						<img width="150px"  height="150px" src="picture/<%=m.getMedizin_plantJuvenile()%>" >
						</div>
						<br>
						<div style="background: #F0F0F0; width: 150px; height: 150px">
						<img alt="222" src="picture/<%=m.getMedizin_plantAdult()%>" width="150px"  height="150px">
						</div>

					</div>
					<%-- <div id ="tu">
						<h2>标志图片</h2>
						<br>
						<div style="background: #F0F0F0; width: 330px; height: 248px">
							<img  src="C/Program Files/Java/apache-tomcat-8.0.45/webapps/myFristServlet//upload/"+<%=m.getMedizin_plantSeed() %>
								width="400px" height="300px">
						</div>
						<br>
						<h2>图册</h2>
						<div style="background: #F0F0F0; width: 150px; height: 150px">
						</div>
						<br>
						<div style="background: #F0F0F0; width: 150px; height: 150px">
						</div> --%>

					<%}
						}else if(qb!=null){%>
					<table border="1" style="width: 100%">
						<col style="width: 7%" />
						<!-- 畲药名 -->
						<col style="width: 8%" />
						<!--异名  -->
						<col style="width: 10%" />
						<!--畲药药性  -->
						<col style="width: 25%" />
						<!-- 原植物  -->
						<col style="width: 20%" />
						<!--时间  -->
						<col style="width: 25%" />
						<!--主要操作  -->
						<tr>
							<th colspan="6">最近添加</th>
						</tr>
						<tr>
							<th>畲药名</th>
							<th>异名</th>
							<th>畲药药性</th>
							<th>原植物</th>
							<th>添加时间</th>
							<th>主要操作</th>
						</tr>
						<%
							for (int i = qb.size() - 1; i >= qb.size() - 3; i--) {
									Medizin m = qb.get(i);
						%>
						<tr>
							<td><%=m.getMedizin_name()%></td>
							<td><%=m.getMedizin_anotherName()%></td>
							<td><%=m.getMedizin_property()%></td>
							<td><%=m.getMedizin_introduce()%></td>
							<td><%=m.getMedizin_date()%></td>
							<td><a href="QueryServlet?select=<%=m.getMedizin_name()%>"
								target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a
								href="modifyServlet?select=<%=m.getMedizin_name()%>"
								target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a
								href="deleteServlet?select=<%=m.getMedizin_name()%>">删除</a>&nbsp;&nbsp;&nbsp;<a>恢复</a></td>
						</tr>

						<%	
							}%>

					</table>

					<table border="1" style="width:100%" >
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->

							<tr><th colspan="7">菌类植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medizin m:qb){
								if(m.getMedizin_planCategory().equals("2")){
									if(m.getMedizin_deleteTag()==null||m.getMedizin_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ><%=m.getMedizin_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
							
					       </table>
					       <table border="1" style="width:100%" >
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->
							<tr><th colspan="7">地衣苔藓类植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medizin m:qb){
								if(m.getMedizin_planCategory().equals("3")){
									if(m.getMedizin_deleteTag()==null||m.getMedizin_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ><%=m.getMedizin_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
					       </table>
					       
					        <table border="1" style="width:100%" >
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->
							<tr><th colspan="7">蕨类植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medizin m:qb){
								if(m.getMedizin_planCategory().equals("5")){
									if(m.getMedizin_deleteTag()==null||m.getMedizin_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ><%=m.getMedizin_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
							
					       </table>
					        <table border="1" style="width:100%" >
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->
							<tr><th colspan="7">裸子植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medizin m:qb){
								if(m.getMedizin_planCategory().equals("6")){
									if(m.getMedizin_deleteTag()==null||m.getMedizin_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ><%=m.getMedizin_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
					       </table>
					        <table border="1" style="width:100%" >
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->
							<tr><th colspan="7">双子叶植物</th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medizin m:qb){
								if(m.getMedizin_planCategory().equals("7")){
									if(m.getMedizin_deleteTag()==null||m.getMedizin_deleteTag().equals("")){%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
									<%}else{%>
										<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ><%=m.getMedizin_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
								<%	}
								%>
									
							<%	}
							}%>
							
					       </table>
						<%}
						else if(fl!=null){
							Medizin medizin1 =(Medizin)fl.get(0);
							String leiming =(String)medizin1.getMedizin_planCategory().trim();
							if(leiming.equals("2")){
								leiming="菌类植物";
							}else if(leiming.equals("3")){
								leiming="地衣苔藓类植物";
							}else if(leiming.equals("5")){
								leiming="蕨类植物";
							}else if(leiming.equals("6")){
								leiming="裸子植物";
							}else if(leiming.equals("7")){
								leiming="双子叶植物";
							}
						%>
						
							 <table border="1" style="width:100%" >
							<col style="width: 7%" />  <!-- 畲药名 -->
							<col style="width: 8%" />  <!--异名  -->
							<col style="width: 10%" />  <!--畲药药性  -->
							<col style="width: 15%" /> <!--采收加工  -->
							<col style="width: 25%" /> <!-- 原植物  -->
							<col style="width: 10%" /> <!--状态  -->
							<col style="width: 25%" /> <!--主要操作  -->
							<tr><th colspan="7"><%=leiming %></th></tr>
							<tr><th >畲药名</th><th>异名</th><th >畲药药性</th><th>采收加工</th><th >原植物</th><th >状态</th><th >主要操作</th></tr>
							<%for(Medizin m:fl){
							if(m.getMedizin_deleteTag()==null||m.getMedizin_deleteTag().equals("")){%>
								<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
						<%	}else{%>
							<tr><td ><%=m.getMedizin_name() %></td><td><%=m.getMedizin_anotherName()%></td><td><%=m.getMedizin_property() %></td><td ><%=m.getMedizin_distribution() %></td><td ><%=m.getMedizin_introduce() %></td><td ><%=m.getMedizin_deleteTag() %></td><td ><a href="QueryServlet?select=<%=m.getMedizin_name()%>" target="_blank">详情</a>&nbsp;&nbsp;&nbsp;<a href="modifyServlet?select=<%=m.getMedizin_name()%>" target="_blank">修改</a>&nbsp;&nbsp;&nbsp;<a href="deleteServlet?select=<%=m.getMedizin_name()%>" >删除</a>&nbsp;&nbsp;&nbsp;<a  >恢复</a></td></tr>
						<%}
							%>
								
						<%	}%>
							
							 </table>
						<%}
						else{%>
							<jsp:getProperty property="mess" name="messInfo"/>
						<%}
						%>



				</div>
				<div class="clearfix"></div>
		</div>
	</div>


	<div class="footer"></div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/bootstrap.js"> </script>
	<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			if($("#select").val()==""){
				alert("请输入关键字！");
			}
		})
	});
	</script>
</body>
</html>