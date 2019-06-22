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
			
			<div data-options="region: 'east', split: true, width: 400, maxWidth: 400, minWidth: 400, collapsed: true, title: '角色成员设置', iconCls: 'icon-sys-user-config'">
				<table id="userGrid" toolbar="#toolbar2"></table>
			</div>
			
			<div id="toolbar2" style="padding:1px; height:auto">
				<div class="layui-btn-group">
					<a href="#" id="barAdd2" class="easyui-linkbutton" iconCls="icon-sys-user-add" plain="true">添加人员</a>
					<a href="#" id="barDelete2" class="easyui-linkbutton" iconCls="icon-sys-user-delete" plain="true">删除人员</a>
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
		
		<script type="text/javascript">
			function showPage() {
				$("#maskContainer").remove();
				$("#mainLayout").removeClass("hidden").layout("resize");
			}
			
			$(function() {
				$("#dataGrid").datagrid({
					title: '角色授权',
					iconCls: 'icon-sys-role',
					
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
					}]],
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
				
				$("#userGrid").datagrid({
					dataPlain: true,
					idField: 'userId',
					width: '100%',
					height: 'auto',
					fit: true,
					rownumbers: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					pagination: true,
					
					url : '${request.contextPath}/sys/role/listMembers.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'userId',
						checkbox: true
					}, {
						title : '人员姓名',
						field : 'trueName',
						align : 'center',
						width : 120,
						sortable: true
					}, {
						title : '所属部门',
						field : 'departmentName',
						align : 'center',
						width : 200,
						sortable: true
					}]],
					onLoadSuccess: function(data) {
						$(this).datagrid('clearSelections');
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
				
				$('#barAdd2').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					if(dataRow != null) {
						var roleId = dataRow['roleId'];
						
						$.easyui.showDialog({
							title: '人员选择对话框',
							
							width: 640,
						    height: 475, 
						    
		                    topMost: true,
		                    enableApplyButton: false,
		                    resizable: false,
		                    
		                    href:'${request.contextPath}/sys/user/multiDialog.htm',
		                    
		                    onSave: function (dlg) {
		                    	var rows = $('.easyui-datagrid', dlg).datagrid('getChecked');
								
		                    	if(rows.length > 0) {
		                    		var members = [];
									$.each(rows, function(i, row) {
										members.push({
				                			userId: row.userId,
				                			roleId: roleId
				                		});
								    });
									
									var sUrl = '${request.contextPath}/sys/role/auth/saveMembers.jsn';
									$.ajax({
				                    	type:'post',
				                    	url: sUrl,
				                    	
				                    	data: $.toJSON(members),
				                    	
				    					dataType: 'json',
				    					contentType: 'application/json',
				    					traditional: true,
				                    	
				    					success : function(response) {
				    						if(response) {
				    							$.easyui.messager.alert('提示',response.message, 'info');
				    							if(response.success) {
				    								$("#userGrid").datagrid("reload");
				    							}
				    						}
				    					}
				                    });
		                    	}
		                    	
		                    	return true;
		                    }
		                });
					} else {
						$.easyui.messager.alert('提示','请选择需要进行人员设置的角色!','info');
					}
				});
				
				$('#barDelete2').click(function() {
					var rows = $("#userGrid").datagrid("getChecked");
					
					if (rows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的角色成员吗？', function(r) {
							if (r) {
								var members = [];
								$.each(rows, function(i, row) {
									members.push({
			                			userId: row.userId,
			                			roleId: row.roleId
			                		});
								});
								
								var sUrl = '${request.contextPath}/sys/role/auth/deleteMembers.jsn';
								$.ajax({
			                    	type:'post',
			                    	url: sUrl,
			                    	
			                    	data: $.toJSON(members),
			                    	
			    					dataType: 'json',
			    					contentType: 'application/json',
			    					traditional: true,
			                    	
			    					success : function(response) {
			    						if(response) {
			    							$.easyui.messager.alert('提示',response.message, 'info');
			    							if(response.success) {
			    								$("#userGrid").datagrid("reload");
			    							}
			    						}
			    					}
			                    });
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的角色成员!','info');
		            	return;
					}
				});
				
				showPage();
			});
			
			function ViewObjectEntity(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var roleId = rowData.roleId;
						$("#userGrid").datagrid("reload", {roleId: roleId});
					}
				}
			}
		</script>
	</body>
</html>
