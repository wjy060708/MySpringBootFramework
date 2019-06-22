<!DOCTYPE html>
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[综合信息管理系统]</title>
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.css" />
		
		<!-- jquery-easyui -->
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/styles/icons/icon-all.css" />
		
		<!-- jquery-easyui-extensions -->
		<link href="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.css" rel="stylesheet" type="text/css" />
		
	    <link rel="stylesheet" href="${request.contextPath}/res/static/css/mian.css">
</head>
<body class="lay-blog">
		<div class="header">
			<div class="header-wrap">
				<h1 class="logo pull-left">
					<a href="index.html">
						<img src="${request.contextPath}/res/static/images/logo.png" alt="" class="logo-img">
						<img src="${request.contextPath}/res/static/images/logo-text.png" alt="" class="logo-text">
					</a>
				</h1>
				
				<form class="layui-form blog-seach pull-left" action=" " method="post" id="form1">
					<div class="layui-form-item blog-sewrap">				
					    <input class="easyui-textbox"  type="hidden" name="modeId" data-options="
				          	      value:'${knowMode.modeId}'"
				          	      "/>      	      
					    <div class="layui-input-block blog-sebox">
					       <a href="#" id="barSearch" onclick="document:form1.sbmit();"> <i class="layui-icon layui-icon-search"></i></a>
					       <input type="text" name="content" lay-verify="title" autocomplete="off"  class="layui-input" id="">
					    </div>
					    
					</div>
				</form>
				
				<div class="blog-nav pull-right">
					
					<a href="#" class="personal pull-left">
						<i class="layui-icon layui-icon-username"></i>
					</a>
					
				</div>
				
				<div class="mobile-nav pull-right" id="mobile-nav">
					<a href="javascript:;">
						<i class="layui-icon layui-icon-more"></i>
					</a>
				</div>
			</div>
			
			
		</div>
		
		<div class="container-wrap">
			<div class="container container-message container-details">
					<div class="contar-wrap">
						<div class="item">
							<div class="item-box  layer-photos-demo1 layer-photos-demo">
								<h3>${knowMode.modeName}</h3>
								<h5>发布于：<span>${knowMode.createTime?date}</span></h5>     <h5>作者： <span>${knowMode.author}</span></h5>
								<p>${knowMode.modeRemark}</p>
								<img src="${request.contextPath}/res/static/images/item.png" alt="">
								
								<div class="count layui-clear">
									<span class="pull-left">阅读 <em>100000+</em></span>
									<span class="pull-right like"><i class="layui-icon layui-icon-praise"></i><em>999</em></span>
								</div>
								
							</div>
						</div>	
						<a name="comment"> </a>
						
						<div class="comt layui-clear">
							<a href="javascript:;" class="pull-left">评论</a>
							<a href="${request.contextPath}/knowledge/mode/remark/comment.ftl?modeId=${knowMode.modeId }" class="pull-right">写评论</a>
						</div>
						
						<div id="LAY-msg-box">
						<#list knowRemarks as knowRemark>
							<div class="info-item">
								<img class="info-img" src="${request.contextPath}/${knowRemark.userIcon}" alt="">
								<div class="info-text">
									<p class="title count">
										<span class="name">${knowRemark.userName}</span>
										<span class="info-img like"><i class="layui-icon layui-icon-praise"></i>${knowRemark.goodNum}</span>
									</p>
									<p class="info-intr">${knowRemark.content}</p>
								</div>
								
							</div>	
						 </#list>
						</div>
					</div>
			</div>
		</div>
		<div class="footer">
		
			<p>
				<span>BugRoot v1.0.1  版权所有 &copy; 2012 - ${.now?string("yyyy")}. 保留一切权利.推荐使用Chrome或Firefox浏览器.</span>
			</p>
			<p><span>缺陷无处不在，请留下你声音</span></p>
		</div>
	<script src="${request.contextPath}/res/layui/layui.js">

	</script>
	<script>
		layui.config({
		  base: '${request.contextPath}/res/static/js/' 
		}).use('blog');
	</script>
</body>
</html>