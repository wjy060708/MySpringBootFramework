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
				<table id="dataGrid" title="产品清单列表"></table>
			</div>	
			
			<div data-options="region: 'east', split: true, width: 500, maxWidth: 500, minWidth: 500, collapsed: true, title: '成果列表', iconCls: 'icon-sys-user-config'">
				<table id="achieGrid" toolbar="#toolbar2"></table>
			</div>
			
			<div id="toolbar2" style="padding:1px; height:auto">
				<div class="layui-btn-group">
					<a href="#" id="barAddAchie" class="easyui-linkbutton" iconCls="icon-sys-user-add" plain="true">添加项目成果</a>
					<a href="#" id="barDelete2" class="easyui-linkbutton" iconCls="icon-sys-user-delete" plain="true">删除项目成果</a>
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
				$("#dataGrid").treegrid({
					dataPlain: true,
					idField: 'entryId',
					parentField: "parentId",
					treeField: 'entryName',
					
					title: '产品清单列表',
					iconCls: 'icon-sys-modules',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					
					pagination: true,
					pageSize: 50,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/epm/bom/entry/listPage.htm',
					queryParams: {
				    	templateId: '${projectInfoVo.templateId}'
				    },
					
					columns : [[{
						title : '唯一标识',
						field : 'entryId',
						checkbox: true
					}, {
						title : '产品清单名称',
						field : 'entryName',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '产品清单描述',
						field : 'entryRemark',
						width : 200,
						align : 'center'
					}] ],
					onLoadSuccess: function(data) {
						// 清除选择
						$('#dataGrid').datagrid('clearSelections');
						
						// 折叠
						$("#mainLayout").layout("collapse", 'east');
					},
					onSelect: function(rowData) {
						$("#mainLayout").layout("expand", 'east');
						
						projectId='${projectInfoVo.projectId}';
						
						ViewObjectEntity(rowData,projectId);
					}
				});
				
				$("#achieGrid").datagrid({
					dataPlain: true,
					idField: 'achieId',		
					width: '100%',
					height: 'auto',
					fit: true,
					rownumbers: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					pagination: true,
					
					url : '${request.contextPath}/epm/project/achie/listEntryAchie.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'achieId',
						checkbox: true
					}, {
						title : '成果名称',
						field : 'achieTitle',
						align : 'center',
						width : 120,
						sortable: false
					}, {
						title : '成果作者',
						field : 'achieAthor',
						align : 'center',
						width : 120,
						sortable: false
					}, {
						title : '操作',
						field : 'operator',
						width : 120,
						align : 'center',
						formatter: function (val, row, index) {
							return "<a class='l-btn l-btn-plain' onclick='javascript: ViewAchieDetails(" + index + ");'><span class='l-btn-left'><span class='l-btn-text icon-epm-view l-btn-icon-left'>查看成果</span></span></a>";
						}
					}]],
					onLoadSuccess: function(data) {
						$(this).datagrid('clearSelections');
					}
				});
				
				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建产品清单',
						
						width: 400,
					    height: 280, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/epm/bom/entry/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/epm/bom/entry/save.jsn',
	                    				success: function(response) {
	    									if(response) {
	    										$.easyui.messager.alert('提示', response.message, 'info');
	    										if(response.success) {
	    											$("#dataGrid").treegrid("reload");
	    										}
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
				
				$('#barAddAchie').click(function() {
					var dataRow = $("#dataGrid").treegrid("getSelected");
					var entryId = dataRow['entryId'];
					
					$.easyui.showDialog({
						title: '添加项目成果',
						
						width: 600,
					    height: 470, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,

	                    href:'${request.contextPath}/epm/project/achie/new.htm',
	               		queryParams: {
				    		projectId: '${projectInfoVo.projectId}',
				    		entryId: entryId
				  		},
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/epm/project/achie/save.jsn',
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
				
				$('#barEdit').click(function() {
					var dataRow = $("#dataGrid").treegrid("getSelected");
					if(dataRow != null) {
						var entryId = dataRow['entryId'];
						EditObjectEntity(entryId);
					}else{
						$.easyui.messager.alert('提示','请选择需要编辑的产品清单!','info');
					}	
				});
				
				$('#barDelete').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					
					if(dataRow != null) {
						var entryId = dataRow['entryId'];
						$.easyui.messager.confirm('确认对话框', '确定删除选中的产品清单吗？', function(r) {
							if (r) {
								DeleteObjectEntity(entryId);
							}
						});
						
					} else {
						$.easyui.messager.alert('提示','请选择需要删除的产品清单!','info');
					}
				});
				
				$('#barDelete2').click(function() {
					var dataRows = $("#achieGrid").datagrid("getSelections");
					
					if(dataRows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的项目成果吗？', function(r) {
							if (r) {
								DeleteObjectEntity(dataRows);
							}
						});
						
					} else {
						$.easyui.messager.alert('提示','请选择需要删除的项目成果!','info');
					}
				});
				
				$('#barSearch').click(function() {
					var entryName = $("#txtTemplateName").textbox('getValue');
					
					$("#dataGrid").treegrid('load', {
						entryName: entryName
            		});
				});
				
	
				$('#barRefresh').click(function() {
					$("#dataGrid").treegrid("reload");
				});
						
				showPage();
			});					
			
			function EditObjectEntity(entryId) {
				$.easyui.showDialog({
					title: '编辑产品清单',
					
					width: 400,
				    height: 280, 
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/epm/bom/entry/edit.htm',
                    queryParams: {
                    	entryId: entryId
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form(
                    			'submit', {
                    				url: '${request.contextPath}/epm/bom/entry/update.jsn',
                    				success: function(response) {
    									if(response) {
    										$.easyui.messager.alert('提示', response.message, 'info');
    										if(response.success) {
    											$("#dataGrid").treegrid("reload");
    										}
    									}
                    				}
                    			}
                    		);
                    	} else {
                    		return false;
                    	}
                    }
                });
			}
			
			function DeleteObjectEntity(entryId) {
				if(entryId) {
					var url = '${request.contextPath}/epm/bom/entry/delete.jsn';
					$.get(url, {entryId: entryId}, function(response) {
						if(response) {	// 成功取消
							$.easyui.messager.alert('提示', response.message, 'info');
							if(response.success) {
								$("#dataGrid").treegrid("reload");
							}
						}
					}, "json");
				}
			}
			
			function DeleteObjectEntity(dataRows) {
				var Ids = [];
				$.each(dataRows, function(i, dataRow) {
	            	Ids[Ids.length] = dataRow['achieId'];
	            });
	            
	            $.ajax({
					type : 'post',
					url : '${request.contextPath}/epm/project/achie/delete.jsn',
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

			function ViewObjectEntity(rowData,projectId) {	
				if(rowData) {
					var dataRow = $("#dataGrid").treegrid("getSelected");
					var entryId = dataRow['entryId'];		
					var url = '${request.contextPath}/epm/project/achie/listEntryAchie.jsn';
					
					$.get(url, {entryId: entryId,projectId: projectId}, function(data) {
						$("#achieGrid").datagrid("loadData", data);
					});
				}
			}
			
			function ViewAchieDetails(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#achieGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var achieId = rowData.achieId;
						$.easyui.showDialog({
							title: '成果管理面板',
							
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
						    
		                    href:'${request.contextPath}/epm/project/achie/view.htm',
		                    queryParams: {
		                    	achieId: achieId
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
