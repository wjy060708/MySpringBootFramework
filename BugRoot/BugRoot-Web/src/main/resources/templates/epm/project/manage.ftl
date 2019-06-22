<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[综合信息管理系统]</title>
		
		<!-- jquery -->
		<script src="${request.contextPath}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.utils.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.json-2.4.min.js" type="text/javascript"></script>
		
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
			<div data-options="title: '基本信息', iniframe: true, iconCls: 'icon-sys-module-pages', href: '${request.contextPath}/epm/project/info/default.htm?projectId=${projectInfoVo.projectId }'">
	        </div>
			<div data-options="title: '项目计划', iniframe: true, iconCls: 'icon-sys-module-pages', href: '${request.contextPath}/epm/task/info/default.htm?projectId=${projectInfoVo.projectId }'">
	        </div>
	        <div data-options="title: '项目文档', iniframe: true, iconCls: 'icon-sys-org-add', href: '${request.contextPath}/epm/project/document/default.htm?projectId=${projectInfoVo.projectId }'">
	        </div>
	        <div data-options="title: '产品清单', iniframe: true, iconCls: 'icon-sys-department-config', href: '${request.contextPath}/epm/bom/entry/default.htm?projectId=${projectInfoVo.projectId }'">
	        </div>
	    </div>
	</body>
</html>
