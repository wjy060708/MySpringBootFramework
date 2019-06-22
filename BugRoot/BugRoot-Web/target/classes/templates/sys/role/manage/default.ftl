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
				<table id="dataGrid" title="角色管理" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>角色名称:</label>
						<input id="txtRoleName" class="easyui-textbox" type="text" />
						<label>角色编码:</label>
						<input id="txtRoleCode" class="easyui-textbox" type="text" />
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
			
			<div data-options="region: 'east', title: '角色授权', split: true, iconCls: 'icon-sys-role', width: 300, maxWidth: 300, minWidth: 300">
				<ul id="dataTree" class="easyui-tree" style="padding: 10px" data-options="
						lines: true,
						dataPlain: true,
						parentField: 'parentId',
						checkbox: true
					">
				</ul>
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
		
		<script type="text/javascript">
			function showPage() {
				$("#maskContainer").remove();
				$("#mainLayout").removeClass("hidden").layout("resize");
			}
			
			$(function() {
				$("#dataGrid").datagrid({
					dataPlain: true,
					idField: 'roleId',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					singleSelect: true,
					
					pagination: true,
					pageSize: 50,
					pageList: [50, 100, 150, 200],
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/sys/role/listPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'roleId',
						checkbox: true
					}, {
						title : '角色名称',
						field : 'roleName',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '角色编码',
						field : 'roleCode',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '角色描述',
						field : 'roleRemark',
						width : 200,
						align : 'center'
					}, {
						title : '角色授权',
						field : 'operator',
						width : 100,
						align : 'center',
						formatter: function (val, row, index) {
							var html = "<a class='l-btn l-btn-plain' onclick='javascript: GrantObjectEntity(" + index + ");'><span class='l-btn-left'><span class='l-btn-text icon-sys-grant l-btn-icon-left'>角色授权</span></span></a>";
							return html;
						}
					}]],
					onLoadSuccess: function(data) {
						// 清除选择
						$('#dataGrid').datagrid('clearSelections');
						
						// 清空数据
						$("#dataTree").tree("loadData", []);
					},
					onSelect: function(rowIndex, rowData) {
						ViewObjectEntity(rowIndex);
					}
				});

				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建系统角色',
						
						width: 445,
					    height: 270, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/sys/role/manage/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/sys/role/manage/save.jsn',
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
						var roleId = dataRow['roleId'];
						EditObjectEntity(roleId);
					} else {
						$.easyui.messager.alert('提示','请选择需要编辑的系统角色!','info');
					}	
				});
				
				$('#barDelete').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					
					if(dataRow != null) {
						var roleId = dataRow['roleId'];
						$.easyui.messager.confirm('确认对话框', '确定删除选中的系统角色吗？', function(r) {
							if (r) {
								DeleteObjectEntity(roleId);
							}
						});
						
					} else {
						$.easyui.messager.alert('提示','请选择需要删除的系统角色!','info');
					}
				});
				
				$('#barSearch').click(function() {
					var roleName = $("#txtRoleName").textbox('getValue');
					var roleCode = $("#txtRoleCode").textbox('getValue');
					$("#dataGrid").datagrid('load', {
						roleName: roleName,
						roleCode: roleCode
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
				
				showPage();
			});
			
			function EditObjectEntity(roleId) {
				$.easyui.showDialog({
					title: '编辑系统角色',
					
					width: 445,
				    height: 270,
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/sys/role/manage/edit.htm',
                    queryParams: {
				    	roleId: roleId
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form('submit', {
                    				url: '${request.contextPath}/sys/role/manage/update.jsn',
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
			
			function DeleteObjectEntity(roleId) {
				if(roleId) {
					var url = '${request.contextPath}/sys/role/manage/delete.jsn';
					
					$.get(url, {roleId: roleId}, function(response) {
						if(response) {
							$.easyui.messager.alert('提示', response.message, 'info');
							if(response.success) {
								$("#dataGrid").datagrid("reload");
							}
						}
					}, "json");
				}
			}
			
			function GrantObjectEntity(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var roleId = rowData.roleId;
						var roleName = rowData.roleName;
						
						$.easyui.showDialog({
							title: '角色授权-[' + roleName + ']',
							
							width: 315,
						    height: 400, 
						    
		                    topMost: true,
		                    enableApplyButton: false,
		                    resizable: false,
		                    
		                    href:'${request.contextPath}/sys/role/manage/grant.htm',
		                    queryParams: {
						    	roleId: roleId
						    },
						    
		                    onSave: function (dlg) {
		                    	var roleAuthorities = [];
		                    	
		                    	var treeObj = $('.easyui-tree', dlg);	// 获得树对象
		                    	var nodes1 = treeObj.tree("getChecked");
		                    	var nodes2 = treeObj.tree('getChecked', 'indeterminate');
		                    	
		                    	$.each(nodes1, function(i, node) {
		                    		if(treeObj.tree("isLeaf", node.target)) {
		                    			roleAuthorities.push({
		                        			roleId: roleId,
		                        			pageId: node.id,
		                        			flag: '1'
		                        		});
		                    		} else {
		                    			roleAuthorities.push({
		                        			roleId: roleId,
		                        			pageId: node.id,
		                        			flag: '0'
		                        		});
		                    		}
								});
		                    	$.each(nodes2, function(i, node) {
		                    		roleAuthorities.push({
		                    			roleId: roleId,
		                    			pageId: node.id,
		                    			flag: '0'
		                    		});
								});
		                    	
		                    	// 提交
		                    	var sUrl = '${request.contextPath}/sys/role/manage/ajaxGrant.jsn?roleId=' + roleId;
		                    	$.ajax({
			                    	type:'post',
			                    	url: sUrl,
			                    	
			                    	data: $.toJSON(roleAuthorities),
			                    	
			    					dataType: 'json',
			    					contentType: 'application/json',
			    					traditional: true,
			                    	
			    					success : function(response) {
			    						if(response) {
			    							$.easyui.messager.alert('提示', response.message, 'info');
			    							if(response.success) {
			    								$("#dataGrid").datagrid("reload");
			    							}
			    						}
			    					}
			                    });
		                    	
		                    	return true;
		                    }
		                });	
					}
				}
			}
			
			function ViewObjectEntity(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var roleId = rowData.roleId;
						
						var url = '${request.contextPath}/sys/page/listRolePages.jsn';
						$.get(url, {roleId: roleId}, function(data) {
							$("#dataTree").tree("loadData", data);
						});
					}
				}
			}
		</script>
	</body>
</html>
