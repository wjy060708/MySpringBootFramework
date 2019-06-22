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
		  	<li class="layui-nav-item layui-this">
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
		    <li class="layui-nav-item">
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
	         <li class="layui-this" lay-id="info">帮助中心</li>
	      </ul>
	      
	       <div class="layui-tab-content" style="padding: 20px 0;height:450px;">
	        <strong id="content">全部帮助<i id="mode1" class="layui-icon layui-icon-down"></i></strong>
	        <hr/>
	        <div id="authorRight">
              <a href="${request.contextPath}/knowledge/help/aboutUs.htm">
		       	1.关于我们
		      </a>
	        </div>
	         <hr/>
	        <div id="authorRight">
              <a href="${request.contextPath}/knowledge/help/authorRight.htm">
		     	  2.作者权益
		      </a>
	        </div>
	        
	         <hr/>
	        <div id="authorRight">
                <a href="${request.contextPath}/knowledge/help/downloadInstruction.htm">
		     	 3.下载须知
		      </a>
	        </div>
	        
	        <hr/>
	        <div id="authorRight">
               <a href="${request.contextPath}/knowledge/help/contactUs.htm">
		     	 4.联系我们
		      </a>
	        </div>
	        
	         <hr/>
	        <div id="authorRight">
              <a href="${request.contextPath}/knowledge/help/aboutCompany.htm">
		     	5.获取积分
		      </a>
	        </div>
	     </div>
	  </div>
	</div>
   </div>
	<#include "${request.contextPath}/knowledge/nav/foot.ftl">
	</body>
	</html>