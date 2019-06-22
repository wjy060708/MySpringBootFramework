<!DOCTYPE html>
	<html>
		<head>
		  <meta charset="utf-8">
			<title>用户中心</title>
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
			  
			<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
			<link rel="stylesheet" href="${request.contextPath}/res/global.css">
			<link rel="stylesheet" href="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/css/index.css">
			<link rel="stylesheet" href="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/css/metroStyle.css">
			<link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
			<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
			<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/default/easyui.css" />
			
			<link href="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.css" rel="stylesheet" type="text/css" />
		</head>
		<body>
			 <!--网站头部 -->
			<div id="hd">
				<div class="wp">
					<#include "${request.contextPath}/knowledge/nav/common.ftl">
				</div>
			</div>
			
			<div class="clear"></div>
			<!--导航栏 -->
			<div class="deanheader" id="deanheader">
				<div class="w1000">
					<#include "${request.contextPath}/knowledge/nav/head.ftl">
		
					<div class="clear"></div>
				</div>
			</div>
			<br><br>
	
	<div class="layui-container fly-marginTop fly-user-main">
	 <ul class="layui-nav layui-nav-tree layui-inline layui-bg-blue" lay-filter="user" style="height:550px;">
		  	<li class="layui-nav-item">
		     <a href="${request.contextPath}/knowledge/help/default.htm">
		      	  帮助中心
		      </a>
		    </li>
		    <li class="layui-nav-item">
		      <a href="${request.contextPath}/knowledge/help/aboutUs.htm">
		       	关于我们
		      </a>
		    </li>
		    <li class="layui-nav-item">
		      <a href="${request.contextPath}/knowledge/help/authorRight.htm">
		     	  作者权益
		      </a>
		    </li>
		    <li class="layui-nav-item layui-this">
		      <a href="${request.contextPath}/knowledge/help/downloadInstruction.htm">
		     	下载须知
		      </a>
		    </li>
		     <li class="layui-nav-item">
		      <a href="${request.contextPath}/knowledge/help/contactUs.htm">
		     	 联系我们
		      </a>
		    </li>
		    
		    <li class="layui-nav-item">
		    <a href="${request.contextPath}/knowledge/help/aboutCompany.htm">
		     	获取积分
		      </a>
		    </li>
  		</ul>

	  <div class="fly-panel fly-panel-user" pad20>
	    <div class="layui-tab layui-tab-card" lay-filter="user">
	      <ul class="layui-tab-title" id="LAY_mine">
	        <li class="layui-this" lay-id="info">下载须知</li>
	      </ul>
	     
	      <div class="layui-tab-content" style="padding: 20px 0;height:450px;">
	         <strong id="content">用户下载用途须知<i id="mode1" class="layui-icon layui-icon-down"></i></strong>
	         <hr/>
	        <div id="downloadInstruction">
                                   下载用于非商业用途，了解作者权益说明：
	          <ul>
                 <li> 你在使用知识库平台时对文档，文字，图片，数据下载使用，需要来了解作者对文件内容的版权声明与用途限制，并严格遵守使用规范。知识库不对用户下载后用途说明</li>
               </ul>
	        </div>
	        
	        <hr/>
	         <strong id="content2">用户被禁止下载<i id="mode2" class="layui-icon layui-icon-down"></i></strong>
	         <hr/>
	        <div id="downloadInstruction2">
                                   下载用于非商业用途，了解作者权益说明：
	          <ul>
                 <li> 你在使用知识库平台时对文档，文字，图片，数据下载使用，需要来了解作者对文件内容的版权声明与用途限制，并严格遵守使用规范。知识库不对用户下载后用途说明</li>
               </ul>
	        </div>
	        
	    </div>
	  </div>
	</div>
	<#include "${request.contextPath}/knowledge/nav/foot.ftl">
	
	<script src="${request.contextPath}/plugins/layui/layui.js"></script>
	<script src="${request.contextPath}/plugins/jquery/jquery-2.1.1.min.js"></script>
	<script>
	  $(function(){
	     $("#content").click(function(){
	        var flag = $("#downloadInstruction").is(":hidden");
	        if(flag) {
	          $("#downloadInstruction").show();
	          $("#mode1").attr("class","layui-icon layui-icon-down");
	        } else {
	          $("#downloadInstruction").hide();
	           $("#mode1").attr("class","layui-icon layui-icon-up");
	        }
	     });
	     
	       $("#content2").click(function(){
	        var flag = $("#downloadInstruction2").is(":hidden");
	        if(flag) {
	          $("#downloadInstruction2").show();
	          $("#mode2").attr("class","layui-icon layui-icon-down");
	        } else {
	          $("#downloadInstruction2").hide();
	           $("#mode2").attr("class","layui-icon layui-icon-up");
	        }
	     });
	  })
	</script>
	</body>
	</html>