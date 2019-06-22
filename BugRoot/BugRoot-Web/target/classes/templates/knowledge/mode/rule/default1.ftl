<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[综合信息管理系统]</title>
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.css" />
		
		<!-- jquery-easyui -->
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/bootstrap/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/styles/icons/icon-all.css" />

		<!-- jquery-easyui-extensions -->
		<link href="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="maskContainer">
	        <div class="datagrid-mask" style="display: block;"></div>
	        <div class="datagrid-mask-msg" style="display: block; left: 50%; margin-left: -52.5px;">正在加载...</div>
	    </div>

	    <div id="mainLayout" class="easyui-layout hidden" data-options="fit: true" style="margin: 5px;padding: 5px;">
			<div data-options="region: 'center', border: false" >
				<table id="achieGrid" title="缺陷规则列表" ></table>
			</div>	
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
		
		<script type="text/javascript">
			function showPage() {
				$("#maskContainer").remove();
				$("#mainLayout").removeClass("hidden").layout("resize");
			}
			
			$(function() {			
				$("#achieGrid").datagrid({
					dataPlain: true,
					idField: 'achieId',		
					width: '100%',
					height: 'auto',
					fit: true,
					rownumbers: true,
					singleSelect: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					pagination: true,
					
					url : '${request.contextPath}/knowledge/mode/rule/listPage.htm',
					queryParams: {
				    	modeId: '${knowMode.modeId}'
				    },
					
					columns : [[{
						title : '唯一标识',
						field : 'ruleId',
						checkbox: true,
						hidden: true
					}, {
						title : '缺陷规则',
						field : 'ruleContent',
						align : 'center',
						width : 400,
						sortable: false
					}, {
						title : '相关资源',
						field : 'operator',
						width : 120,
						align : 'center',
						formatter: function (val, row, index) {
							return "<a class='l-btn l-btn-plain' onclick='javascript: ViewRuleDetails(" + index + ");'><span class='l-btn-left'><span class='l-btn-text icon-epm-view l-btn-icon-left'>相关资源</span></span></a>";
						}
					}]],
					onLoadSuccess: function(data) {
						$(this).datagrid('clearSelections');
					}
				});
						
				showPage();
			});					
			
			function ViewRuleDetails(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#achieGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var ruleId = rowData.ruleId;
						$.easyui.showDialog({
							title: '缺陷规则面板',
							
							width: 800,
							height: 600,
						    
							iniframe: false,
		                    topMost: true,
						    modal:true,
						    enableApplyButton: false,
						    enableSaveButton: false,
						    closeButtonText: '关闭',
						    resizable: false,
						    maximizable: true,
						    
		                    href:'${request.contextPath}/knowledge/mode/rule/view.htm',
		                    queryParams: {
		                    	ruleId: ruleId
		                    },
		                    onClose: function() {
		                    	$("#achieGrid").datagrid("reload");
		                    }
		                });
					}
				}
			}
							
		</script>
	</body>
</html>
