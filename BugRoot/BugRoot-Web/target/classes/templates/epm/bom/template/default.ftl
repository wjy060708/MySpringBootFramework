<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[综合信息管理系统]</title>
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.css" />
		
		<!-- jquery-easyui -->
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
			<div data-options="region: 'center', border: false">
				<table id="dataGrid" title="模板管理" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>模板名称:</label>
						<input id="txtModuleName" class="easyui-textbox" type="text" />
						<a href="#" id="barSearch" class="easyui-linkbutton" iconCls="icon-search">查询</a>
				    </div>
					<div class="ctrl-div">
						<a href="#" id="barNew" class="easyui-linkbutton" iconCls="icon-add" plain="true">新建</a>
				   		<a href="#" id="barEdit" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
				    	<a href="#" id="barDelete" class="easyui-linkbutton" iconCls="icon-delete" plain="true">删除</a>
				    	<a href="#" id="barRefresh" class="easyui-linkbutton" iconCls="icon-refresh" plain="true">刷新</a>
					</div>
				</div>
			</div>
			
			<div data-options="region: 'east', split: true, width: 400, maxWidth: 400, minWidth: 400, collapsed: true, title: '项目模板管理', iconCls: 'icon-sys-user-config'">
				<table id="entryGrid" toolbar="#toolbar2"></table>
			</div>
			
			<div id="toolbar2" style="padding:1px; height:auto">
				<div class="layui-btn-group">
					<a href="#" id="barAdd2" class="easyui-linkbutton" iconCls="icon-sys-user-add" plain="true">添加产品清单</a>
					<a href="#" id="barDelete2" class="easyui-linkbutton" iconCls="icon-sys-user-delete" plain="true">删除产品清单</a>
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
				$("#dataGrid").datagrid({
					dataPlain: true,
					idField: 'templateId',
					
					title: '模板管理',
					iconCls: 'icon-sys-modules',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					singleSelect: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/epm/bom/template/listPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'templateId',
						checkbox: true
					}, {
						title : '模板名称',
						field : 'templateName',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '模板描述',
						field : 'templateRemark',
						width : 200,
						align : 'center'
					}, {
						title : '创建时间',
						field : 'createTime',
						align : 'center',
						width : 200
					}, {
						title : '更新时间',
						field : 'updateTime',
						align : 'center',
						width : 200
						
					}] ],
					onLoadSuccess: function(data) {
						// 清除选择
						$('#dataGrid').datagrid('clearSelections');
						
						// 折叠
						$("#mainLayout").layout("collapse", 'east');
					},
					onSelect: function(rowIndex, rowData) {
						$("#mainLayout").layout("expand", 'east');
						
						ViewObjectEntity(rowIndex);
					}
				});
				
				$("#entryGrid").treegrid({
					dataPlain: true,
					idField: 'entryId',
					parentField: "parentId",
					treeField: 'entryName',
					
					width: '100%',
					height: 'auto',
					fit: true,
					rownumbers: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					pagination: true,
					
					url : '${request.contextPath}/epm/bom/entry/listTemplateEntrys.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'entryId',
						checkbox: true
					}, {
						title : '产品清单名称',
						field : 'entryName',
						align : 'center',
						width : 120,
						sortable: false
					}, {
						title : '产品清单描述',
						field : 'entryRemark',
						align : 'center',
						width : 200,
						sortable: false
					}]],
					onLoadSuccess: function(data) {
						$(this).treegrid('clearSelections');
					}
				});

				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建项目模板',
						
						width: 390,
					    height: 200, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/epm/bom/template/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/epm/bom/template/save.jsn',
	                    				success: function(response) {
	    									if(response) {
	    										$.easyui.messager.alert('提示', response.message, 'info');
	    										if(response.success) {
	    											$("#dataGrid").datagrid("reload");
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
				
				$('#barEdit').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					if(dataRow != null) {
						var templateId = dataRow['templateId'];
						EditObjectEntity(templateId);
					}else{
						$.easyui.messager.alert('提示','请选择需要编辑的项目模板!','info');
					}	
				});
				
				$('#barDelete').click(function() {
					var dataRows = $("#dataGrid").datagrid("getSelections");
					
					if (dataRows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的项目模板吗？', function(r) {
							if (r) {
								DeleteObjectEntity(dataRows);
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的项目模板!','info');
		            	return;	
					}	
				});
				
				$('#barSearch').click(function() {
					var templateName = $("#txtTemplateName").textbox('getValue');
					
					$("#dataGrid").treegrid('load', {
						templateName: templateName
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
				
				$('#barAdd2').click(function() {
					$.easyui.showDialog({
						title: '添加产品清单',
						
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
	    											$("#entryGrid").treegrid("reload");
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
				
				$('#barDelete2').click(function() {
					var dataRow = $("#entryGrid").treegrid("getSelected");
					
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

				showPage();
			});
			
			function EditObjectEntity(templateId) {
				$.easyui.showDialog({
					title: '编辑项目模板',
					
					width: 390,
				    height: 200, 
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/epm/bom/template/edit.htm',
                    queryParams: {
                    	templateId: templateId
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form(
                    			'submit', {
                    				url: '${request.contextPath}/epm/bom/template/update.jsn',
                    				success: function(response) {
    									if(response) {
    										$.easyui.messager.alert('提示', response.message, 'info');
    										if(response.success) {
    											$("#dataGrid").datagrid("reload");
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
			
			function DeleteObjectEntity(dataRows) {
				var templateIds = [];
	            $.each(dataRows, function(i, dataRow) {
	            	templateIds.push(dataRow['templateId']);
	            });
		            
				$.ajax({
					type : 'post',
					url : '${request.contextPath}/epm/bom/template/delete.jsn',
					data : {
						templateIds : templateIds
					},
					dataType: 'json',
					traditional: true,
					
					success : function(response) {
						if(response) {
							$.easyui.messager.alert('提示',response.message, 'info');
							if(response.success) {
								$("#dataGrid").datagrid("reload");
							}
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
								$("#entryGrid").treegrid("reload");
							}
						}
					}, "json");
				}
			}
			
			function ViewObjectEntity(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var templateId = rowData.templateId;
						
						var url = '${request.contextPath}/epm/bom/entry/listTemplateEntrys.jsn';
						$.get(url, {templateId: templateId}, function(data) {
							$("#entryGrid").treegrid("loadData", data);
						});
					}
				}
			}
		</script>
	</body>
</html>
