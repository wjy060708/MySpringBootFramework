<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[电子文档管理系统]</title>
		
		<!-- ctx 已经定义 -->
		<!-- jquery -->
		<script src="${request.contextPath}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.utils.min.js" type="text/javascript"></script>
		
		<!-- jquery-easyui -->
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/bootstrap/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/icon.css" />
		
		<script src="${request.contextPath}/plugins/jeasyui-1.5/jquery.easyui.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-1.5/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
		   
		<!-- jquery-easyui-extensions -->
		<link href="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.css" rel="stylesheet" type="text/css" />
		
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.messager.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.panel.min.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			$(function() {
				$.ajaxSetup({
                	complete: function(XMLHttpRequest, textStatus) {
						var ajaxResponseHeader = XMLHttpRequest.getResponseHeader("Ajax-Response-Header");
						if(ajaxResponseHeader == 'timeout') {
							$.easyui.messager.alert('提示', '尚未登录或登录超时,请重新登录!','info', function() {
								top.location = '${request.contextPath}/login.htm';	
							});
						} else if(ajaxResponseHeader == 'unAuthorized') {
							$.easyui.messager.alert('提示', '很抱歉,您未授权进行该操作!','info');
						}
					}
            	});
				
				$.easyui.loading({
					locale: $('#documnentViewer')
				});
				
				$.util.delay(onDocumentReady, 10);
			});
			
			function onDocumentReady() {
				var ruleId = "${knowModeRule.ruleId}";
				var url = '${request.contextPath}/knowledge/mode/rule/documentReady.jsn';
				
				$.get(url, {ruleId: ruleId}, function(response) {
					if(response.success) {
						$.easyui.loaded($('#documnentViewer'));
						
						loadDocument(ruleId); // 加载文档
					} else {
						$.util.delay(onDocumentReady, 10);
					}
				}, 'json');
			}
			
			function loadDocument(ruleId) {
				this.location = '${request.contextPath}/knowledge/mode/rule/getPdfDocument/' + ruleId + ".pdf";
			}
		</script>
	</head>
	
	<body>
		<div id="documnentViewer" class="easyui-panel" data-options="fit: true, border: false"></div>
	</body>
</html>
