<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[综合信息管理系统]</title>
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.css" />
		
		<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
		
	    <style type="text/css">
			body {
				moz-user-select: -moz-none;
				-moz-user-select: none;
				-o-user-select: none;
				-khtml-user-select: none;
				-webkit-user-select: none;
				user-select: none;
			}
			
			body {
				padding: 5px 5px 5px 5px;
			}
			
			.div-button {
				padding-top: 10px;
				padding-bottom: 10px;
				text-align: center;
			}
			
			.layui-upload-drag {
				padding: 30px 190px;
			}
		</style>
	</head>
	<body>
		<div class="layui-row">
			<div class="layui-col-xs12">
				<div class="div-button">批量导入缺陷模式知识</div>
			</div>
			<div class="layui-col-xs12">
				<div class="div-upload div-upload-bg">
					<div class="layui-upload-drag" id="Uploader">
						<i class="fa fa-cloud-upload fa-5x"></i>
						<p>点击上传,或拖拽文件上传</p>
						<p>&nbsp;</p>
					</div>
				</div>
			</div>
			<div class="layui-upload">
				<button type="button" class="layui-btn" style="width: 100%">下载模板</div>
			</div>
		</div>
		<script>
			layui.use(['upload'], function() {
				var upload = layui.upload;
				
				upload.render({
					elem: '#Uploader',
					accept: 'file',
					exts: 'doc|docx|ppt|pptx|pdf|xls|xlsx',
					auto: true,
					number: 10,
					
					url: '${request.contextPath}/knowledge/mode/fileUpload.jsn',
					field: 'Filedata',
					data: {
						typeId: '${knowType.typeId }'
					},
					
					multiple: true,
					
					before: function(obj) {
						layer.load();
					},
					
					allDone: function(obj) {
						layer.closeAll('loading');
						
						layer.msg('文档上传完成!');
				    }
				});
			});
		</script>
	</body>
</html>
