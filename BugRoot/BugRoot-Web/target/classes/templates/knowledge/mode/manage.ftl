<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[综合信息管理系统]</title>
		
		<!-- jquery -->
		<script src="${request.contextPath}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.utils.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.json-2.4.min.js" type="text/javascript"></script>
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		
		<!-- jquery-easyui -->
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/bootstrap/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/styles/icons/icon-all.css" />
		
		<script src="${request.contextPath}/plugins/jeasyui-1.5/jquery.easyui.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-1.5/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
		   
		<!-- jquery-easyui-extensions -->
		<link href="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.css" rel="stylesheet" type="text/css" />
		
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.messager.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.form.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.tree.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.panel.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.dialog.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.datagrid.min.js" type="text/javascript"></script>
		
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.tabs.min.js" type="text/javascript"></script>
		
	    <style type="text/css">
			body {
				moz-user-select: -moz-none;
				-moz-user-select: none;
				-o-user-select: none;
				-khtml-user-select: none;
				-webkit-user-select: none;
				user-select: none;
			}
		</style>
		
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
			});
		</script>
		
	</head>
	<body>
		<div class="easyui-tabs" data-options="
			fit: true, 
			border: false,
			
			tabPosition: 'left',
			headerWidth: 100,
			tabHeight: 80
			">
			<div data-options="title: '缺陷知识', iniframe: true, iconCls: 'icon-sys-module-pages', href: '${request.contextPath}/knowledge/mode/expe.htm?modeId=${knowMode.modeId }'">
	        </div>
			<div data-options="title: '引入原因', iniframe: true, iconCls: 'icon-sys-module-pages', href: '${request.contextPath}/knowledge/mode/reason/default.htm?modeId=${knowMode.modeId }'">
	        </div>
			<div data-options="title: '引发后果', iniframe: true, iconCls: 'icon-sys-module-pages', href: '${request.contextPath}/knowledge/mode/consequence/default.htm?modeId=${knowMode.modeId }'">
	        </div>
	        <div data-options="title: '预防措施', iniframe: true, iconCls: 'icon-sys-org-add', href: '${request.contextPath}/knowledge/mode/prevention/default.htm?modeId=${knowMode.modeId }'">
	        </div>
	        <div data-options="title: '经验准则', iniframe: true, iconCls: 'icon-sys-department-config', href: '${request.contextPath}/knowledge/mode/rule/default.htm?modeId=${knowMode.modeId }'">
	        </div>
	        <div data-options="title: '发表评论', iniframe: true, iconCls: 'icon-sys-department-config', href: '${request.contextPath}/knowledge/mode/remark/details.htm?modeId=${knowMode.modeId }'">
	        </div>
	    </div>
	</body>
</html>
