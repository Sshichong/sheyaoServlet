<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
   <%--  <%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    %> --%>
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

<!--//end-smoth-scrolling-->
<style type="text/css">
.yangshi{
background-color: #F0F0F0;
float:left;

}
.yangshi1{
float:left;
}
#yaoxing{
clear:both;
}
</style>
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
					<div class=neirong >
	<div class="xinxitianjia" >
	<a href="sheyao.jsp">完成</a><br><br>
		<form action="medicineCheckServlet" method="post" >
		<div style="float:left;margin-left:150px">
		<div id="zhengming">
		正名：<input type="text" size="25" name="zhengming"/>
		</div>
		<div id="yiming" style="padding-top:10px">
		异名：<input type="button" value="增加" id="another" />
		<div id="ym">
		</div>
				
		</div>
		<div id="yaoxing" style="padding-top:10px">
		药性：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="yaoxing" >
							<option value="yinyao">阴药</option>
							<option value="yangyao">阳药</option>
						</select>
		</div>
		<div id="leibie" style="padding-top:10px">
		植物类别：<select name="leibie">
							<option value="2">菌类植物</option>
							<option value="3">地衣类植物</option>
							<option value="5">蕨类类植物</option>
							<option value="6">裸子类植物</option>
							<option value="7">双子叶类植物</option>
							</select>
		</div>
		<div id="yuanzhiwujieshao" style="padding-top:10px">
		<div style="text-align="center;padding-top:10px">原植物介绍：</div><textarea rows="5" cols="50" name="yuanzhiwujieshao"></textarea>
		</div>
		<div id="shengjingfenbu" style="padding-top:10px">
		<div style="text-align="center;padding-top:10px">生境分布：</div><textarea rows="5" cols="50" name="shengjingfenbu"></textarea>
		</div>
		<div id="caijijiagong" style="padding-top:10px">
		<div style="text-align="center;padding-top:10px">采集加工：</div><textarea rows="5" cols="50" name="caijijiagong"></textarea>
		</div>
		
		<div id="zhuyishixiang" style="padding-top:10px">
		<div style="text-align="center;padding-top:10px">注意事项：</div><textarea rows="5" cols="50" name="zhuyishixiang"></textarea>
		</div>
		<div id="huaxuechengfen" style="padding-top:10px">
		<div style="text-align="center;padding-top:10px">化学成分（分号隔开）：
		</div><textarea rows="5" cols="50" name="huaxuechengfen"></textarea>
		</div>
		<div id="huaxuechengfencankaowenxian" style="padding-top:10px">
		<div style="text-align="center;padding-top:10px">化学成分参考文献（分号隔开）：</div><textarea rows="5" cols="50" name="huaxuechengfencankaowenxian"></textarea>
		</div>
		<div id="xiandailinchuangyanjiucankaowenxian" style="padding-top:10px">
		<div style="text-align="center;padding-top:10px">现代临床研究参考文献（分号隔开）：</div><textarea rows="5" cols="50" name="xiandailinchuangyanjiucankaowenxian"></textarea>
		</div>
		<div id="yaolicankaowenxian" style="padding-top:10px">
		<div style="text-align="center;padding-top:10px">药理参考文献（分号隔开）：</div><textarea rows="5" cols="50" name="yaolicankaowenxian"></textarea>
		</div>
		<div>
			畲药药方：<input type="button" id="add" value="增加一条" />
			<div id="yaofang">
				<input type="50" name="yaofang" size="50"/><br />
			</div>
			<br />
		</div>
<!-- 
										<div>
											<div id="tu1" style="padding-top: 10px">
												植物种子图片：<input type="file" name="new_image" id="doc" value=""
													onchange="javascript:setImagePreview();" />
												<div id="localImag">
													<img id="preview" width=-1 height=-1 style="diplay: none" />
												</div>
											</div>
										</div>-->
										<input type="submit" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置" />
		</div>
		<!-- <div style="float:left">
		<img alt="sheyaotianjia" src="picture/sheyaotianjia.png" style="margin-left:250px">
		</div>  -->
		
			<!-- <table >
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
				<tr><td>奢药药方</td><td> <textarea rows="10" cols="21" name="sheyaoyaofang"></textarea> </td></tr>
				<tr><td>奢药药方</td><td id="td"><input type="text" name="yaofang" /><br/></td></tr>
				<tr><td><input type="submit" value="添加" /></td></tr>
			</table> -->
		</form>
	</div>
</div>
					 </div>
				</div>
				

				
			</div>
			<div class="clearfix"> </div>				
		</div>
	</div>

<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"> </script>
    <!-- 异名添加 -->
    <script type="text/javascript">
			$("#another").click(function(){
			var str=prompt();
			if(str){
				var ss = $("<div class='yangshi' >"+str+"</div>");
				var te = $("<input name='yiming' type='hidden' value='"+str+"' >");
				var del = $("<a class='yangshi1' href='#'>x</a>")
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
					$(te).remove();
					$(this).remove();
				})
			}
			})
			//console.log($("button").last().html())
		</script>
		<!-- 药方添加 -->
    <script>
    add.onclick=function(){
    	/* var input=document.getElementById("td");
        input.innerHTML+='<input type="'+'text" name="'+'yaofang"/><br/>'; */
            var input = document.createElement('input');//创建input节点
            input.name  = 'yaofang';   //设置属性
            input.type = 'text';
            input.size='50';
            var br= document.createElement('br');  //添加br节点换行
            document.getElementById("yaofang").appendChild(input);  //追加节点
            document.getElementById("yaofang").appendChild(br);
    }

//     $(function(){
//     	$("#another").click(function(){
//         	//var anotherName = prompt("异名：");
//         	var name= $("#ym").val();
//         	var anotherName =prompt("异名：");
//         	if(name==""){
//         		name+=anotherName;
//         	}
//         	else{
//         		name=name+";";
//             	name+=anotherName;
//         	}
        		
        	
        	
//         	$("#ym").val(name);
//         	//alert(name);
//         });
//     });
    
    
    </script>
    <!-- 添加图片时显示缩略图 -->
    <script> 
	function setImagePreview() {
		var docObj = document.getElementById("doc");
		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性 
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '100px';
			imgObjPreview.style.height = 'inherit';
			//imgObjPreview.src = docObj.files[0].getAsDataURL(); 
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜 
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小 
			localImagId.style.width = "100px";
			localImagId.style.height = "80px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片 
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script> 
<!-- 控制输入 -->
<script type="text/javascript">
			
		$("form").on("submit",function(e){
			if($("input[name='zhengming']").val().replace(/\s/g,"")==""){
				e.preventDefault();
				$("input[name='zhengming']").focus();
				alert("请输入正名！");
				return;
			}
			/* if($("input[name='yaoxing']:selected").length==0){
				//console.log($("#shanchang").length);
				if($("#yaoxing").length==0){
				e.preventDefault();
				if($("input[name='yaoxing']:selected").length==0){
					$("input[name='yaoxing']:first").focus();}
				alert("请选择药性！");
				return;
				}
			}
			if($("input[name='leibie']:selected").length==0){
				//console.log($("#shanchang").length);
				if($("#leibie").length==0){
				e.preventDefault();
				if($("input[name='leibie']:selected").length==0){
					$("input[name='leibie']:first").focus();}
				alert("请选择类别！");
				return;
				}
			} */
			if($("textarea[name='yuanzhiwujieshao']").val().replace(/\s/g,"")==""){
				e.preventDefault();
				$("textarea[name='yuanzhiwujieshao']").focus();
				alert("请填写原植物介绍！");
				return;
			}
			if($("textarea[name='shengjingfenbu']").val().replace(/\s/g,"")==""){
				e.preventDefault();
				$("textarea[name='shengjingfenbu']").focus();
				alert("请填写生境分布！");
				return;
			}
			if($("textarea[name='caijijiagong']").val().replace(/\s/g,"")==""){
				e.preventDefault();
				$("textarea[name='caijijiagong']").focus();
				alert("请填写采集加工！");
				return;
			}
		})
		
	</script>
</body>
</html>