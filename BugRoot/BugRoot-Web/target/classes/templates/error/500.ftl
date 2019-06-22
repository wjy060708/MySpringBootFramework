<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>[军用关键软件缺陷管理系统]</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Access-Control-Allow-Origin" content="*">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		
		<link href="images/favicon.ico" rel="icon" type="image/x-icon" />
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.css" media="all" />
	</head>
	<body class="childrenBody">
		<div style="text-align: center; padding:11% 0;">
		    <i class="layui-icon" style="line-height:20rem; font-size:20rem; color: #393D50;">&#xe69c;</i>
		    <p style="font-size: 20px; font-weight: 300; color: #999;">发生系统错误,请联系管理员</p>
		        <pre class="layui-code">
		            ${message}
		        </pre>
		</div>
		
		<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
		<script>
		    layui.use('code', function(){ //加载code模块
		        layui.code({
		            title: 'Exception',
		            encode: true
		        }); //引用code方法
		    });
		</script>
	</body>
</html>