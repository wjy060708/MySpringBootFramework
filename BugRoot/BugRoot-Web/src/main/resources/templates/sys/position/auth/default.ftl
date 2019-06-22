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
			<div data-options="region: 'west', split: true, title: '组织机构', width: 220, minWidth: 200, iconCls: 'icon-sys-organization'">
				<ul class="easyui-tree" style="padding: 5px 5px 5px 5px;" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId',
					url: '${request.contextPath}/sys/org/listOrg.htm',
					onClick: function(node) {
						// 清除所有选择的行
						$('#dataGrid').datagrid('clearSelections');
						
						// 加载某个部门下的所有人员
						$('#dataGrid').datagrid('load', {departmentId: node.id});
					}
				">
				</ul>
			</div>
			
			<div data-options="region: 'center', border: false">
				<div id="pageLayout" class="easyui-layout" data-options="fit: true" >
					<div data-options="region: 'center', border: false" style="overflow: hidden;">
						<table id="dataGrid" title="岗位管理" toolbar="#toolbar"></table>
					</div>
					
					<div data-options="region: 'south', split: true, collapsed: true, title: '岗位设置', height: 200, minWidth: 100, iconCls: 'icon-sys-position-config'">
						<div class="easyui-tabs" data-options="fit: true">
			                <div data-options="title: '授权部门', iconCls: 'icon-sys-department-config', refreshable: false">
			                	<table id="dataGrid1" class="easyui-datagrid" data-options="
			                		dataPlain: true,
									idField: 'departmentId',
									width: '100%',
									height: 'auto',
									fit: true,
									rownumbers: true,
									toolbar: '#toolbar1',
									
									loadMsg: '加载数据中,请稍后...',
									
									pagination: true,
									
									url : '${request.contextPath}/sys/position/auth/listScope.htm',
									
									columns : [[{
										title : '唯一标识',
										field : 'departmentId',
										checkbox: true
									}, {
										title : '责任部门名称',
										field : 'departmentName',
										align : 'center',
										width : 260,
										sortable: true
									}, {
										title : '责任部门备注',
										field : 'departmentRemark',
										align : 'center',
										width : 300
									}]],
									onLoadSuccess: function(data) {
										$(this).datagrid('clearSelections');
									}
			                	">
			                	</table>
			                </div>
			                
			                <div data-options="title: '成员设置', iconCls: 'icon-sys-user-config', refreshable: false">
			                	<table id="dataGrid2" class="easyui-datagrid" data-options="
			                		dataPlain: true,
									idField: 'userId',
									width: '100%',
									height: 'auto',
									fit: true,
									rownumbers: true,
									toolbar: '#toolbar2',
									
									loadMsg: '加载数据中,请稍后...',
									
									pagination: true,
									
									url : '${request.contextPath}/sys/position/auth/listMember.htm',
									
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
										title : '人员所在部门',
										field : 'departmentName',
										align : 'center',
										width : 240,
										sortable: true
									}, {
										title : '人员备注',
										field : 'userRemark',
										align : 'center',
										width : 200
									}]],
									onLoadSuccess: function(data) {
										$(this).datagrid('clearSelections');
									}
			                	">
			                	</table>
			                </div>
			            </div>	
					</div>
				</div>
			</div>
			
			<div class="toolbar" id="toolbar">
				<div class="search-div">
					<label>岗位名称:</label>
					<input id="txtPositionName" class="easyui-textbox" type="text" />
					<label>所属部门:</label>
					<input id="txtDepartmentName" class="easyui-textbox" type="text" />
					<a href="#" id="barSearch" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			    </div>
				<div class="ctrl-div">
					<a href="#" id="barNew" class="easyui-linkbutton" iconCls="icon-add" plain="true">新建</a>
			   		<a href="#" id="barEdit" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
			    	<a href="#" id="barDelete" class="easyui-linkbutton" iconCls="icon-delete" plain="true">删除</a>
			    	<a href="#" id="barRefresh" class="easyui-linkbutton" iconCls="icon-refresh" plain="true">刷新</a>
				</div>
			</div>
					
			<div id="toolbar1" style="padding:1px; height:auto">
				<div style="margin-bottom:1px;">
					<a href="#" id="barAdd1" class="easyui-linkbutton" iconCls="icon-sys-org-add" plain="true">添加部门</a>
					<a href="#" id="barDelete1" class="easyui-linkbutton" iconCls="icon-sys-org-delete" plain="true">删除部门</a>
				</div>
			</div>
			
			<div id="toolbar2" style="padding:1px; height:auto">
				<div style="margin-bottom:1px;">
					<a href="#" id="barAdd2" class="easyui-linkbutton" iconCls="icon-sys-user-add" plain="true">添加成员</a>
					<a href="#" id="barDelete2" class="easyui-linkbutton" iconCls="icon-sys-user-delete" plain="true">删除成员</a>
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
					title: '系统岗位', 
					iconCls: 'icon-sys-position',
					
					dataPlain: true,
					idField: 'positionId',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					singleSelect: true,
					fit: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/sys/position/auth/listPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'positionId',
						checkbox: true
					}, {
						title : '岗位名称',
						field : 'positionName',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '岗位所属部门',
						field : 'departmentName',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '岗位描述',
						field : 'positionRemark',
						width : 200,
						align : 'center'
					}, {
						title : '创建时间',
						field : 'createTime',
						width : 140,
						align : 'center'
					}]],
					onLoadSuccess: function(data) {
						$('#dataGrid').datagrid('clearSelections');
						
						// 折叠
						$("#pageLayout").layout("collapse", 'south');
					},
					onSelect: function(rowIndex, rowData) {
						$("#pageLayout").layout("expand", 'south');
						
						ViewObjectEntity(rowIndex);
					}
				});
				
				$('#barSearch').click(function() {
					var positionName = $("#txtPositionName").textbox('getValue');
					var departmentName = $("#txtDepartmentName").textbox('getValue');
					$("#dataGrid").datagrid('load', {
						positionName: positionName,
						departmentName: departmentName
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
				
				/* roleGrid */
				$('#barAdd1').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					if(dataRow != null) {
						var positionId = dataRow['positionId'];
						
						$.easyui.showDialog({
							title: '部门选择',
							
							width: 450,
						    height: 420, 
						    
		                    topMost: true,
		                    enableApplyButton: false,
		                    resizable: false,
		                    
		                    href:'${request.contextPath}/sys/org/orgDialog.htm',
		                    
		                    onSave: function (dlg) {
		                    	var nodes = $('.easyui-tree', dlg).tree('getChecked');
								
		                    	if(nodes.length > 0) {
		                    		var scopes = [];
									$.each(nodes, function(i, row) {
										scopes.push({
				                			positionId: positionId,
				                			departmentId: row.departmentId
				                		});
								    });
									
									var sUrl = '${request.contextPath}/sys/position/auth/saveScopes.jsn';
									$.ajax({
				                    	type:'post',
				                    	url: sUrl,
				                    	
				                    	data: $.toJSON(scopes),
				                    	
				    					dataType: 'json',
				    					contentType: 'application/json',
				    					traditional: true,
				                    	
				    					success : function(response) {
				    						if(response) {
				    							$.easyui.messager.alert('提示',response.message, 'info');
				    							if(response.success) {
				    								$("#dataGrid1").datagrid("reload");
				    							}
				    						}
				    					}
				                    });
		                    	}
		                    	
		                    	return true;
		                    }
		                });
					} else {
						$.easyui.messager.alert('提示','请选择需要进行角色设置的岗位!','info');
					}
				});
				
				$('#barDelete1').click(function() {
					var rows = $("#dataGrid1").datagrid("getChecked");
					
					if (rows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的岗位责任部门吗？', function(r) {
							if (r) {
								var scopes = [];
								$.each(rows, function(i, row) {
									scopes.push({
			                			positionId: row.positionId,
			                			departmentId: row.departmentId,
			                		});
								});
								
								var sUrl = '${request.contextPath}/sys/position/auth/deleteScopes.jsn';
								$.ajax({
			                    	type:'post',
			                    	url: sUrl,
			                    	
			                    	data: $.toJSON(scopes),
			                    	
			    					dataType: 'json',
			    					contentType: 'application/json',
			    					traditional: true,
			                    	
			    					success : function(response) {
			    						if(response) {
			    							$.easyui.messager.alert('提示',response.message, 'info');
			    							if(response.success) {
			    								$("#dataGrid1").datagrid("reload");
			    							}
			    						}
			    					}
			                    });
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的责任部门!','info');
		            	return;
					}
				});
				
				/* userGrid */
				$('#barAdd2').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					if(dataRow != null) {
						var positionId = dataRow['positionId'];
						
						$.easyui.showDialog({
							title: '人员选择',
							
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
				                			positionId: positionId,
				                			userId: row.userId
				                		});
								    });
									
									var sUrl = '${request.contextPath}/sys/position/auth/saveMembers.jsn';
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
				    								$("#dataGrid2").datagrid("reload");
				    							}
				    						}
				    					}
				                    });
		                    	}
		                    	return true;
		                    }
		                });
					} else {
						$.easyui.messager.alert('提示','请选择需要进行成员设置的岗位!','info');
					}
				});
				
				$('#barDelete2').click(function() {
					var rows = $("#dataGrid2").datagrid("getChecked");
					
					if (rows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的岗位成员吗？', function(r) {
							if (r) {
								var members = [];
								$.each(rows, function(i, row) {
									members.push({
			                			userId: row.userId,
			                			positionId: row.positionId
			                		});
								});
								
								var sUrl = '${request.contextPath}/sys/position/auth/deleteMembers.jsn';
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
			    								$("#dataGrid2").datagrid("reload");
			    							}
			    						}
			    					}
			                    });
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的岗位成员!','info');
		            	return;
					}
				});
				
				showPage();
			});
			
			function ViewObjectEntity(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var positionId = rowData.positionId;
						
						$("#dataGrid1").datagrid("reload", {positionId: positionId});
						$("#dataGrid2").datagrid("reload", {positionId: positionId});
					}
				}
			}
		</script>
	</body>
</html>
