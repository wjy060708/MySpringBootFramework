<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[综合信息管理系统]</title>
		
		<link type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" rel="stylesheet" />
		
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
				padding: 10px;
				background: #f2f2f2;
			}
			
			.div-center {
				text-align: center;
			}
			
			.layui-upload-drag {
				padding-left: 200px;
				padding-top: 20px;
				padding-right: 200px;
				padding-bottom: 0px;
			}
		</style>
	</head>
	<body>
		<div class="layui-row">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header">
						<div class="div-center">批量导入系统用户</div>
					</div>
					<div class="layui-card-body">
						<div class="div-center">
							<div class="layui-upload-drag" id="Uploader">
								<i class="layui-icon layui-icon-upload-drag"></i>
								<p class="tip">点击或拖拽上传</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-md12">
				<button class="layui-btn layui-btn-fluid div-button">下载模板</button>
			</div>
		</div>
		<script src="${request.contextPath}/plugins/layui/layui.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-plugins/download/download.min.js" type="text/javascript"></script>
		
		<script>
			layui.use(['upload'], function() {
				var $ = layui.jquery;
				var upload = layui.upload;
				
				upload.render({
					elem: '#Uploader',
					accept: 'file',
					exts: 'xlsx',
					auto: true,
					
					url: '${ctx}/sys/user/manage/userUpload.jsn',
					field: 'Filedata',
					
					before: function(obj) {	// 上传前回调
						layer.load();
					},
					done: function(res) {	// 上传完成回调
						layer.closeAll('loading');
						layer.msg(res.message);
					}
				});
				
				$('.div-button').on('click', function() {
					var sUrl = '${request.contextPath}/sys/download/fileDownload.htm?fileName=templates-user.xlsx';
					download(sUrl, '系统用户导入模板.xlsx', 'application/x-msdownload');
				});
			});
		</script>
	</body>
</html>
