<!DOCTYPE html>
<html>
	<head>
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
					      <i class="layui-icon layui-icon-search"></i>
					      <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input">
					    </div>
					</div>
				</form>
				
				<div class="blog-nav pull-right">
					<ul class="layui-nav pull-left">
					  <li class="layui-nav-item"><a href="${request.contextPath}/knowledge/mode/remark/index.ftl">首页</a></li>
					  
					  <li class="layui-nav-item  layui-this"><a href="${request.contextPath}/knowledge/mode/remark/default.ftl">留言</a></li>
					  <li class="layui-nav-item"><a href="about.html">关于</a></li>
					</ul>
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
			<ul class="pop-nav" id="pop-nav">
				<li><a href="index.html">首页</a></li>
				<li><a href="message.html">留言</a></li>
				<li><a href="about.html">关于</a></li>
			</ul>
		</div>
		<div class="container-wrap">
			<div class="container container-message">
				<div class="contar-wrap" id="contar-wrap">
					<form class="layui-form" action="">
						<div class="layui-form-item layui-form-text">
							  <textarea  class="layui-textarea" id="LAY-msg-content" style="resize:none"></textarea>
						</div>
					</form>
					<div class="item-btn">
						<button class="layui-btn layui-btn-normal" id="item-btn">提交</button>
					</div>
					
					<div id="LAY-msg-box">
						<div class="info-box">
							<div class="info-item">
								<img class="info-img" src="../res/static/images/info-img.png" alt="">
								<div class="info-text">
									<p class="title count">
										<span class="name">一片空白</span>
										<span class="info-img like"><i class="layui-icon layui-icon-praise"></i>5.8万</span>
									</p>
									<p class="info-intr">父爱如山，不善表达。回想十多年前，总记得父亲有个宽厚的肩膀，小小的自己跨坐在上面，越过人山人海去看更广阔的天空，那个时候期望自己有一双翅膀，能够像鸟儿一样飞得高，看得远。虽然父亲有时会和自己开玩笑，但在做错事的时候会受到严厉的训斥。父亲有双粗糙的大手掌。</p>
								</div>
							</div>
						</div>
					</div>

					<div id="test1" class="paging"></div>
				</div>
			</div>
		</div>
		<div class="footer">
			<p>
				<span>BugRoot v1.0.1  版权所有 &copy; 2012 - ${.now?string("yyyy")}. 保留一切权利.推荐使用Chrome或Firefox浏览器.</span>
			</p>
			<p><span>缺陷无处不在，请留下你声音</span></p>
		</div>
	</div>
	<script src="${request.contextPath}/res/layui/layui.js">

	</script>
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

</body>
	

	
</html>
