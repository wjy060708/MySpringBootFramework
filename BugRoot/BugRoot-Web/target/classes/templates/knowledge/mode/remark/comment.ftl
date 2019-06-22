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
				<form class="layui-form blog-seach pull-left" action="">
					<div class="layui-form-item blog-sewrap">
					    
					    <div class="layui-input-block blog-sebox">
					      <a href="" id="barSearch"> <i class="layui-icon layui-icon-search"></i> </a>
					      <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input">
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
			<div class="container container-message container-details container-comment">
					<div class="contar-wrap">
					
						<div class="item">
							<div class="item-box  layer-photos-demo1 layer-photos-demo">
								<h3>${knowMode.modeName}</h3>
								<h5>发布于：<span>${knowMode.createTime?datetime}</span></h5>
								<p>${knowMode.modeName}</p>
								<img src="${request.contextPath}/res/static/images/item.png" 
								 alt="帅哥">
								<div class="count layui-clear">
									<span class="pull-left">阅读 <em>100000+</em></span>
									<span class="pull-right like"><i class="layui-icon layui-icon-praise"></i><em>999</em></span>
								</div>
							</div>
						</div>	
						
						<form class="layui-form" action="" id="remarkForm">
							<input class="easyui-textbox"  type="hidden" name="modeId" data-options="
				          	      value:'${knowMode.modeId}'"
				          	      "/>
				          	      
							<div class="layui-form-item layui-form-text">
								<textarea  class="layui-textarea" name="content" style="resize:none" placeholder="写点什么啊"></textarea>
							</div>
							<div class="btnbox">
								<input type="submit" value="发表评论" style="width:80px;height:40px;background:red;border:1px solid false" /> 
							</div>
						</form>
					</div>
			</div>
		</div>
		<div class="footer">
			<p>
				<span>BugRoot v1.0.1  版权所有 &copy; 2012 - ${.now?string("yyyy")}. 保留一切权利.推荐使用Chrome或Firefox浏览器.</span>
			</p>
			<p><span>缺陷无处不在，请留下你声音</span></p>
		</div>
	
	    <script src="${request.contextPath}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.utils.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.json-2.4.min.js" type="text/javascript"></script>
		
		<script src="${request.contextPath}/plugins/jeasyui-1.5/jquery.easyui.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-1.5/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
		
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.messager.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.form.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.tree.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.panel.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.dialog.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.datagrid.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.treegrid.min.js" type="text/javascript"></script>
	    <script src="${request.contextPath}/res/layui/layui.js"></script>
	    <script>
		   layui.config({
		      base: '${request.contextPath}/res/static/js/' 
		    }).use('blog');
	    </script>
	    
	<script id="LAY-msg-tpl" type="text/html">
		<div class="info-box">
			<div class="info-item">
				<img class="info-img" src="{{ d.avatar }}" alt="">
			  <div class="info-text">
					<p class="title">
					  <span class="name">{{ d.username }}</span>
					  <span class="info-img">
					  	<i class="layui-icon layui-icon-praise"></i>
					  	{{ d.praise }}
					 	</span>
					</p>
					<p class="info-intr">
						{{ d.content }}
					</p>
			  </div>
			</div>
		</div>
	</script>
	
	<script type="text/javascript">
		
			$('#remarkForm').on('submit',function(){
			    remarkPost()
			    event.preventDefault()
			});
			
			function remarkPost(){
			   $.ajax({
			       type:"post",
			       url:"${request.contextPath}/knowledge/mode/remark/save.jsn",
			       data:$('#remarkForm').serialize()
			   }).success(function(response) {
						if(response) {
						    document.getElementById("remarkForm").reset();
							$.easyui.messager.alert('提示',response.message, 'info');
							window.location.href="${request.contextPath}/knowledge/mode/remark/details.ftl?modeId=${knowMode.modeId }"
						}
					})
			}
			
		</script>
</body>
</html>