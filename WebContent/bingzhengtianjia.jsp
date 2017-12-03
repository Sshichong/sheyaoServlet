<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <jsp:useBean id="messInfo" class="com.beans.MessInfo" scope="request" />
    
    
    
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
position:relative;
left:1300px;	
top:-43px
}
p.pos
{position:relative;
left:50px;
top:0px
}
p.pos1
{
position:relative;
left:300px;
top:-26px
}
p.pos2
{
position:relative;
left:50px;
top:0px
}
p.pos3
{
position:relative;
left:300px;
top:-26px
}
p.pos4
{
position:relative;
left:50px;
top:0px
}
p.pos5
{
position:relative;
left:50px;
top:20px
}
p.pos6
{
position:relative;
left:50px;
top:100px
}
textarea.pos
{
position:relative;
left:110px;
top:100px
}
input.pos
{
position:relative;
left:110px;
top:100px
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
							<li class="active"><a href="bingzheng.jsp">病症</a></li>
							<li><a href="yijia.jsp">医家</a></li>
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
				<a href="bingzheng.jsp" class="pos">完成</a>
				<jsp:getProperty property="mess" name="messInfo"/>
				<form action="Bztianjia" method="post">
				
				
				<input id="textForChuanshu" name="textForChuanshu"  style="display: none">
				
				
				<p class="pos">病名:<input type="text" name="name" ></p>
				<p class="pos1">全拼:<input type="text" name="quanpin"></p>
				<p class="pos2">科室:<select name="keshi" >
				      <option value="1">内科</option>
				      <option value="2">外科</option>
				      <option value="3">妇科</option>
				      <option value="4">儿科</option>
				      <option value="5">五官科</option>
				      <option value="6">蛇伤科</option>
				      </select></p>
				<p class="pos3">简拼:<input type="text" name="jianpin"></p>
				<p class="pos5">病症介绍:<textarea  name="gzjj" cols="60" rows="5" style="overflow:hidden;resize: none;"></textarea></p>
				<p class="pos6">畲药药方:<input id="tianjia" type="button" value="新增一条"></p>
				<textarea id="fangzi_show" readonly="readonly" cols="120" rows="10" style="overflow-x:hidden;overflow-y:scroll;" class="pos"></textarea>
				<br><br>
				<input type="submit" value="提交" class="pos">
				<input type="reset" value="重置" class= "pos"> 
				
				</form> 
				
				
				
				</div>
				
				<div  id="big_shurulan"  style="position: absolute; background: gainsboro; left: 200px; top: 200px; width: 500px; display: none;">
					<div align="right">
						<button id="tianjia_yitiao">增加一条</button>
						<button id="jianshao_yitiao">减少 一条</button>
					</div>
					
					<div id="shurulan">
					<div align="center" id="shuru1">
					药名：<input id="yaoming1" type="text" width="100px" />
					计量：<input id="yaoji1" type="text"  width="100px"/>
					</div>
					</div>
					
					
					<div align="center">
						<button id="fangzi_queding">确定</button>
						<button id="fangzi_guanbi">关闭</button>
					</div>
					
					
					
					
					
					
				</div>
				
				
				
				<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.js"></script>
				<script>
				var i = 1;
				var text_all_chuanshu="";
				var text_show_for = "";
				$("#tianjia").click(function(){
					$("#big_shurulan").css("display","block");
					i=1;
				
				});
				
				
				$("#tianjia_yitiao").click(function(){
					i+=1;
					
					p = i-1;
					if(p==0)
						p=1;
					$("#shuru"+p).append(function(){
						return "<div align='center' id='shuru"+i+"'>药名：<input id='yaoming"+i+"' type='text' width='100px' />计量：<input id='yaoji"+i+"' type='text'  width='100px'/></div>";
					});
				
				});
				
				$("#jianshao_yitiao").click(function(){
					
					$("#shuru"+i).remove();
					i--;
					
				});
				
				
				
				$("#fangzi_guanbi").click(function(){
					$("#big_shurulan").css("display","none");
						
					$("#shurulan").empty();
					
					$("#shurulan").append("<div align='center' id='shuru1'>药名：<input id='yaoming1' type='text' width='100px' />计量：<input id='yaoji1' type='text'  width='100px'/>")
					
					i=1;
				});
				
				
				$("#fangzi_queding").click(function(){
					var text_chuanshu = "";
					var text="" ;
					for(var xx = 1; xx<=i;xx++){
						if(xx==i){
							text_chuanshu = text_chuanshu+$("#yaoming"+xx).val()+"+"+$("#yaoji"+xx).val();
							text = text+$("#yaoming"+xx).val()+"+"+$("#yaoji"+xx).val();
							continue;
						}
						text_chuanshu = text_chuanshu+$("#yaoming"+xx).val()+"+"+$("#yaoji"+xx).val()+"_";
						text = text+$("#yaoming"+xx).val()+"+"+$("#yaoji"+xx).val()+"_";
					}
					
					//传输到servlet的数据
					
					text_all_chuanshu = text_all_chuanshu+text_chuanshu+";";
					
					text_chuanshu = text_chuanshu.replace(/\+/g,"%2B");
					
					$.ajax({
						type:"post",
						url:"bingfang_tianjia?bingfang="+text_chuanshu,
						timeout:3000,
						dataType : "string",
						success:function(data){
							alert("成功");
						}
					});
					
					
					$("#textForChuanshu").attr("value",text_all_chuanshu);
					
					
					
					if(text_show_for==null||text_show_for==""){
						text_show_for = text+";";
					}else{
						text_show_for = text_show_for+"\r\n"+text+";";
					}
					
					$("#fangzi_show").val(text_show_for);
					
					
					
					
					
					$("#big_shurulan").css("display","none");
					$("#shurulan").empty();
					$("#shurulan").append("<div align='center' id='shuru1'>药名：<input id='yaoming1' type='text' width='100px' />计量：<input id='yaoji1' type='text'  width='100px'/>")
					i=1;
					
					
				});
				
				
				</script>
				
				
				
				
				
				
				
				
				
				
				
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