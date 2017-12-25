<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.list.DataList"%>
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
a.pos
{
position:absolute;
left:68%;	
top:30px
}
p.pos
{position:absolute;
left:15%;
top:50px
}

p.pos2
{position:absolute;
left:15%;
top:90px
}


p.pos4
{
position:absolute;
left:15%;
top:130px
}
p.pos5
{
position:absolute;
left:15%;
top:190px
}
p.pos6
{
position:absolute;
left:15%;
top:350px
}
textarea.pos1
{
position:absolute;
left:15%;
top:210px
}
textarea.pos
{
position:absolute;
left:15%;
top:410px
}
input.pos
{
position:absolute;
left:15%;
top:660px
}
input.pos1
{
position:absolute;
left:19%;
top:660px
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
				<div class="clearfix"> </div>				
			</div>
			<!--//side-bar-->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main about-main">
				<div id="maincontent">
				<a href="yijia.jsp" class="pos">完成</a>
								
				<form action="yijiaxianshi" method="post">
				<p class="pos">姓名:<input type="text" name="name" ></p>
				<input type="hidden" name="quanpin">
				<p class="pos2">职称:<input type="text" name="zhicheng"></p>
				<input type="hidden" name="jianpin">
				<p class="pos4">擅长:	
				<%
				FunCtion FC = new FunCtion();
				List<DataList> LDL = new ArrayList<DataList>();
				LDL = FC.getList("department");
				for(DataList str : LDL){
				%>
				<input type="checkbox" name="shanchang" value="<%=str.getData()%>"/><%=str.getData()%>
				<%} %>
<!-- 				<input type="text" name="zhuzhi"></p> -->
				<button type="button" id="ddmo">+</button>
				
				
				
				<p class="pos5">个人简介:</p>
				<textarea class="pos1" name="grjj" cols="60" rows="5" style="overflow:hidden;resize: none;"></textarea>
				<p class="pos6">畲药药方:<input type="button" value="新增一条"></p>
				<textarea  readonly="readonly" cols="120" rows="10" style="overflow-x:hidden;overflow-y:scroll;" class="pos"></textarea>
				<br><br>
				<input type="submit" value="提交" class="pos">
				<input type="reset" value="重置" class= "pos1"> 
				
				<script type="text/javascript">
			$("#ddmo").click(function(){
			var str=prompt();
			if(str){
				var ss = $("<div style='background-color: aqua;'>"+str+"</div>");
				var te = $("<input name='shanchang' id='shanchang' type='hidden' value='"+str+"' >");
				var del = $("<a href='#'>x</a>")
				$(ss).appendTo($(this).parent());
				$(this).parent().append(te);
				$(this).parent().append(del);
				var flag=true;
				$(ss).dblclick(function(){
					if(flag){
					var ben = $(this).html();
					var tem = $("<input id='sa' type='text' value="+ben+" >");
					$(this).html("");
					$(this).append(tem)
					$(tem).focus();
					flag= false;
					$(tem).on("blur",function(){
						var bes = $(tem).val();
						if(bes==""){
							$(del).remove();
					//$(this).remove();
					$(te).remove();
						}
						console.log(bes)
						$(this).parent().html(" "+bes);
						$(te).val(bes);
						$(this).remove();
						flag=true;
						
					})
					$(tem).keydown(function(e){
						if(e.keyCode==13){
							var bes = $(tem).val();
						if(bes==""){
							$(del).remove();
					//$(this).remove();
					$(te).remove();
						}
						console.log(bes)
						$(this).parent().html(" "+bes);
						$(te).val(bes);
						$(this).remove();
						flag=true;
						}
					})
				}
					})
				$(del).click(function(){
					$(ss).remove();
					$(this).remove();
					$(te).remove();
				})
			}
			})
			//console.log($("button").last().html())
		</script>
				
				
				
				
			<script type="text/javascript">
			$("input[name='name']").on('blur',function(){
				if($("input[name='name']").val().replace(/\s/g,"")!=""){
					/* qpjp(); */
				}
			})
			
		$("form").on("submit",function(e){
			if($("input[name='name']").val().replace(/\s/g,"")==""){
				e.preventDefault();
				$("input[name='name']").focus();
				alert("please enter name");
				return;
			}
			qpjp();
			if($("input[name='zhicheng']").val().replace(/\s/g,"")==""){
				e.preventDefault();
				$("input[name='zhicheng']").focus();
				alert("请输入职称");
				return;
			}
			if($("input[name='shanchang']:checked").length==0){
				//console.log($("#shanchang").length);
				if($("#shanchang").length==0){
				e.preventDefault();
				if($("input[name='shanchang']:checked").length==0){
					$("input[name='shanchang']:first").focus();}
				alert("请填写擅长");
				return;
				}
			}
			if($("textarea[name='grjj']").val().replace(/\s/g,"")==""){
				e.preventDefault();
				$("textarea[name='grjj']").focus();
				alert("请填写个人简介");
				return;
			}
		})
	/* 	
		function qpjp(){
					$.getJSON("http://route.showapi.com/99-38?showapi_appid=51621&content="+$("input[name='name']").val()+"&showapi_sign=61964d17fdde49a1b0a95994b2fc9e60",function(data){
						var a = data.showapi_res_body.simpleData;
						var b = data.showapi_res_body.data;
						$("input[name='quanpin']").val(b);
						$("input[name='jianpin']").val(a);
					}
					
					);
					
				}
 */
		</script>
				</form> 
				
				
				
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