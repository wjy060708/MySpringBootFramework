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

	    <div id="mainLayout" class="easyui-layout hidden" data-options="fit: true">
			<div data-options="region: 'center', border: false" >
				<table id="achieGrid" title="缺陷规则列表" toolbar="#toolbar2"></table>
			</div>	
			
			<div id="toolbar2" style="padding:1px; height:auto">
				<div class="layui-btn-group">
					<a href="#" id="barAddAchie" class="easyui-linkbutton" iconCls="icon-sys-user-add" plain="true">添加缺陷规则</a>
					<a href="#" id="barDelete2" class="easyui-linkbutton" iconCls="icon-sys-user-delete" plain="true">删除缺陷规则</a>
				</div>
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
					idField: 'ruleId',		
					width: '100%',
					height: 'auto',
					fit: true,
					rownumbers: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					pagination: true,
					
					url : '${request.contextPath}/knowledge/mode/rule/listPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'ruleId',
						checkbox: true
					}, {
						title : '缺陷规则',
						field : 'ruleContent',
						align : 'center',
						width : 240,
						sortable: false
					}, {
						title : '缺陷模式',
						field : 'modeName',
						align : 'center',
						width : 240,
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
				
				$('#barAddAchie').click(function() {
					$.easyui.showDialog({
						title: '添加缺陷规则',
						
						width: 530,
					    height: 450, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,

	                    href:'${request.contextPath}/knowledge/mode/rule/new.htm',
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/knowledge/mode/rule/save.jsn',
	                    				success: function(response) {
	    									if(response) {
	    										$.easyui.messager.alert('提示', response.message, 'info');	
	    										$("#achieGrid").datagrid("reload");
	    									}
	                    				}
	                    			}
	                    		);
	                    	} else {
	                    		return false;
	                    	}
	                    }
	                });
				});
				
				$('#barDelete2').click(function() {
					var dataRows = $("#achieGrid").datagrid("getSelections");
					
					if(dataRows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的缺陷规则吗？', function(r) {
							if (r) {
								DeleteObjectEntity(dataRows);
							}
						});
						
					} else {
						$.easyui.messager.alert('提示','请选择需要删除的缺陷规则!','info');
					}
				});
						
				showPage();
			});					

			function DeleteObjectEntity(dataRows) {
				var Ids = [];
				$.each(dataRows, function(i, dataRow) {
	            	Ids[Ids.length] = dataRow['ruleId'];
	            });
	            
	            $.ajax({
					type : 'post',
					url : '${request.contextPath}/knowledge/mode/rule/delete.jsn',
					data : {
						ids : Ids
					},
					dataType: 'json',
					traditional: true,
					
					success : function(data, textStatus) {
						if(data) {
							if(data.success) {
								$.easyui.messager.alert('提示',data.message, 'info');
								$("#achieGrid").datagrid("reload");
							} else {
								$.easyui.messager.alert('提示',data.message, 'info');
							}
						}
					}
				});
			}
			
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
