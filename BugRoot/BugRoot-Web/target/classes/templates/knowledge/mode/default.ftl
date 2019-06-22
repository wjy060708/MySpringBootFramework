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

	    <div id="mainLayout" class="easyui-layout hidden" data-options="fit: true">
			<div data-options="region: 'center', border: false" style="padding: 5px;">
				<table id="dataGrid" title="缺陷模式" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>缺陷模式名称:</label>
						<input id="txtModeName" class="easyui-textbox" type="text" />
						<label>作者:</label>
						<input id="txtModeAuthor" class="easyui-textbox" type="text" />
						<a href="#" id="barSearch" class="easyui-linkbutton" iconCls="icon-search">查询</a>
				    </div>
				    
					<div class="ctrl-div">
						<a href="#" id="barUpload" class="easyui-linkbutton" iconCls="icon-sys-user-add" plain="true">导入</a>
						<a href="#" id="barNew" class="easyui-linkbutton" iconCls="icon-add" plain="true">新建</a>
				   		<a href="#" id="barEdit" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
				    	<a href="#" id="barDelete" class="easyui-linkbutton" iconCls="icon-delete" plain="true">删除</a>
				    	<a href="#" id="barRefresh" class="easyui-linkbutton" iconCls="icon-refresh" plain="true">刷新</a>
					</div>
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
		
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.edatagrid.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			function showPage() {
				$("#maskContainer").remove();
				$("#mainLayout").removeClass("hidden").layout("resize");
			}
			
			$(function() {
				$("#dataGrid").datagrid({
					title: '缺陷模式名称',
					iconCls: 'icon-sys-modules',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					singleSelect: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/knowledge/mode/listAll1.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'modeId',
						checkbox: true
					}, {
						title : '缺陷模式名称',
						field : 'modeName',
						align : 'center',
						width : 200,
						sortable: true
					},{
						title : '所属知识分类',
						field : 'typeName',
						align : 'center',
						width : 100
					},{
						title : '创建时间',
						field : 'createTime',
						align : 'center',
						width : 150
					}, {
						title : '更新时间',
						field : 'updateTime',
						align : 'center',
						width : 150
						
					}, {
						title : '缺陷模式描述',
						field : 'modeRemark',
						width : 200,
						align : 'center'
					}, {
						title : '缺陷模式作者',
						field : 'author',
						width : 150,
						align : 'center'
					},{
						title : '查看详情',
						field : 'operator',
						width : 100,
						align : 'center',
						formatter: function (val, row, index) {
							var html = "<a class='l-btn l-btn-plain' onclick='javascript: OnKnowModeDetailControl(" + index + ");'><span class='l-btn-left'><span class='l-btn-text icon-sys-grant l-btn-icon-left'>查看</span></span></a>";
							return html;
						}
					}]],
					onLoadSuccess: function(data) {
						// 清除选择
						$('#dataGrid').datagrid('clearSelections');
						
						// 清空数据
						$("#dataTree").tree("loadData", []);
					}
				});

				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建缺陷模式',
						
						width: 500,
					    height: 420, 

	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/knowledge/mode/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/knowledge/mode/save.jsn',
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
				
				$('#barAdd2').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					var modeId = dataRow['modeId'];
					
					$.easyui.showDialog({
						title: '添加缺陷知识',
						
						width: 450,
					    height: 350, 

	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/knowledge/content/new.htm',            
	                    queryParams: {
				    		modeId: modeId
				  		},
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/knowledge/content/save.jsn',
	                    				success: function(response) {
	    									if(response) {
	    										$.easyui.messager.alert('提示', response.message, 'info');
	    										if(response.success) {
	    											$("#knowledgeGrid").datagrid("reload");
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
				
				$('#barUpload').click(function() {
					var node = $('#dataGrid').datagrid('getSelected');
					if(node) {
						var modeId = node.modeId;
						
						$.easyui.showDialog({
							title: '上传缺陷模式知识',
							
							width: 520,
							height: 340,
						    
							iniframe: true,
		                    topMost: true,
						    modal: true,
						    enableApplyButton: false,
						    enableSaveButton: false,
						    closeButtonText: '关闭',
						    resizable: false,
						    
		                    href:'${request.contextPath}/knowledge/mode/upload.htm?modeId=' + modeId,
		                    		
		                    onClose: function() {
		                    	$("#dataGrid").datagrid("reload");
		                    }
		                });
					} else {
						$.easyui.messager.alert('提示', '请选择模板上传归档类型!', 'info');
					}
				});
				
				
				$('#barEdit').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					if(dataRow != null) {
						var modeId = dataRow['modeId'];
						EditObjectEntity(modeId);
					} else {
						$.easyui.messager.alert('提示','请选择需要编辑的过程类型!','info');
					}	
				});
				
				
				$('#barDelete').click(function() {
					var dataRows = $("#dataGrid").datagrid("getSelections");
					
					if (dataRows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的过程类型吗？', function(r) {
							if (r) {
								DeleteObjectEntity(dataRows);
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的过程类型!','info');
		            	return;	
					}	
				});
				
				
				$('#barSearch').click(function() {
					var modeName = $("#txtModeName").textbox('getValue');
					var author = $("#txtModeAuthor").textbox('getValue');
					
					$("#dataGrid").datagrid('load', {
						modeName: modeName,
						author:author
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
				
				$('#newFiledKnow').click(function() {
					$.easyui.showDialog({
						title: '新建文件知识',
						
						width: 445,
					    height: 280, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false, 
	                    
	                    href:'${request.contextPath}/knowledge/modeContent/new.jsn',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form('validate');
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${ctx}/pdm/archive/catalog/save.jsn',
	                    				success: function(response) {
	    									if(response) {
	    										$.easyui.messager.alert('提示', response.message, 'info');
	    										
	    										$('#dataTree').tree('reload');
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
				
				showPage();
			});
			
			function EditObjectEntity(modeId) {
				$.easyui.showDialog({
					title: '编辑过程类型',
					
					width: 420,
				    height: 360, 
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/knowledge/mode/edit.htm',
                    queryParams: {
                    	modeId: modeId
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form(
                    			'submit', {
                    				url: '${request.contextPath}/knowledge/mode/update.jsn',
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
				var modeIds = [];
	            $.each(dataRows, function(i, dataRow) {
	            	modeIds.push(dataRow['modeId']);
	            });
		            
				$.ajax({
					type : 'post',
					url : '${request.contextPath}/knowledge/mode/delete.jsn',
					data : {
						modeIds : modeIds
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
			
			function OnKnowModeDetailControl(rowIndex) {
				if($.util.parent && $.util.parent.mainpage && $.isFunction($.util.parent.mainpage.addModuleTab)) {
					if(rowIndex >= 0) {
						var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
						
						if(rowData) {
							var title = rowData.modeName;
							var href = "${request.contextPath}/knowledge/mode/manage.htm?modeId=" + rowData.modeId;
							var iconCls = "icon-ais-assess-plan2";
							
							$.util.parent.mainpage.addModuleTab({title:title, href:href, iconCls:iconCls});
						}
					}
				}
			}
			
		</script>
	</body>
</html>
