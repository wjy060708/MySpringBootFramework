<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>[基于缺陷模式知识库管理系统]</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Access-Control-Allow-Origin" content="*">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		
		<link href="${request.contextPath}/images/favicon.ico" rel="icon" type="image/x-icon" />
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/iconfont/iconfont.css" media="all" />
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/styles/login.css" />
	</head>
	
	<body class="layui-layout-body">
		<div class="layadmin-login-box">
			<div class="layadmin-login-header">
				<h1 class="layadmin-login-logo">
					<a href="#"><img src="images/login_logo.png" /></a>
				</h1>
				
				<div class="layadmin-login-headerContent">
					<div class="layadmin-navList">
						<ul>
							<li><a href="#">设为首页</a></li>
							<li><a href="#">反馈</a></li>
							<li><a href="#">帮助</a></li>
						</ul>
					</div>
					<h2 class="layadmin-login-title">
						<img src="images/login_title.png" />
					</h2>
				</div>
			</div>
			
			<div class="layadmin-login-main">
				<div class="layadmin-user-login" style="display: none;">
					<div class="layadmin-user-login-main">
						<div class="layadmin-user-login-box layadmin-user-login-body">
							<form class="layui-form layui-form-pane" lay-filter="usrform">
								<div class="layui-form-item">
									<label class="layadmin-user-login-icon"><i class="layui-icon layui-icon-username" style="color: #1E9FFF;"></i></label>
									<input type="text" name="username" value="SysAdmin" lay-verify="required" autocomplete="off" placeholder="请输入登录账号" class="layui-input" />
								</div>
								<div class="layui-form-item">
									<label class="layadmin-user-login-icon"><i class="layui-icon layui-icon-password" style="color: #1E9FFF;"></i></label>
									<input type="password" name="password" value="123456" lay-verify="required" autocomplete="off" placeholder="请输入登录密码" class="layui-input">
								</div>
								<div class="layui-form-item">
									<input type="checkbox" lay-skin="primary" title="记住账号" name="rememberMe" value="true">
									<div class="layui-unselect layui-form-checkbox" lay-skin="primary">
										<span>记住账号?</span><i class="layui-icon"></i>
									</div>
								</div>
								<div class="layui-form-item">
									<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="login">登 录</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<div class="layadmin-login-banner">
					<img src="images/login_banner.jpg" />
				</div>
				<div class="layadmin-login-manual">
					<ul class="layadmin-login-helpList">
						<li><a href="#">系统手册</a></li>
						<li><a href="#">系统常见问题</a></li>
					</ul>
					<div class="layadmin-login-inner">
						<p>&nbsp;</p>
					</div>
				</div>
			</div>
			
			<div class="layadmin-login-footer">
				BugRoot v1.0.1  版权所有 &copy; 2012 - ${.now?string("yyyy")}. 保留一切权利.推荐使用Chrome或Firefox浏览器.
			</div>
		</div>
		
		<script src="${request.contextPath}/plugins/layui/layui.js"></script>
		<script src="${request.contextPath}/plugins/jquery/jquery.min.js"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.cookie.min.js"></script>
		<script>
			//当这个窗口出现在iframe里，表示其目前已经timeout，需要把外面的框架窗口也重定向登录页面
			if(top != this) {
				top.location = '${request.contextPath}/login.htm';
			}
			layui.use(['layer', 'form'], function() {
				var layer = layui.layer,
	                $ = layui.jquery,
	                form = layui.form;
		
				var username = $.cookie('QuickBoot.username');
            	if(username) {
            		form.val('usrform', {"username": username});
            	}
            	
		        form.on('submit(login)', function(data) {
		            var loadIndex = layer.load(2, {
		                shade: [0.3, '#333']
		            });
		            
		            if($('form').find('input[type="checkbox"]')[0].checked){
		                data.field.rememberMe = true;
		            }else{
		                data.field.rememberMe = false;
		            }
		            
		            // 记录输入用户名
        			var username = data.field['username'];
        			if(username) {
        				$.cookie('QuickBoot.username', username, {expires: 30});
                	}
		            
		            var url = '${request.contextPath}/login/main.json';
		            $.post(url, data.field, function(res) {
		                layer.close(loadIndex);
		                if(res.success){
		                    location.href = "${request.contextPath}/" + res.data.url;
		                }else{
		                    layer.msg(res.message);
		                }
		            });
		            return false;
		        });
		    });
		</script>
	</body>
</html>