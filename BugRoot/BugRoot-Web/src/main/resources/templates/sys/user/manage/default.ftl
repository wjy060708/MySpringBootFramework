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
					<div data-options="region: 'center', border: false," style="overflow: hidden;">
						<table id="dataGrid" title="用户管理" toolbar="#toolbar"></table>
					</div>
					
					<div data-options="region: 'south', split: true, collapsed: true, title: '用户设置', height: 200, minWidth: 100, iconCls: 'icon-sys-role-config'">
						<div class="easyui-tabs" data-options="fit: true">
							<div data-options="title: '授权设置', iconCls: 'icon-sys-role', refreshable: false">
								<table id="dataGrid1" class="easyui-datagrid" data-options="
									width: '100%',
									height: 'auto',
									fit: true,
									rownumbers: true,
									
									url : '${request.contextPath}/sys/user/manage/listRole.htm',
									
									columns : [[{
										title : '角色名称',
										field : 'roleName',
										align : 'center',
										width : 150,
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
									}]]
								">
								</table>
							</div>
							<div data-options="title: '授权岗位', iconCls: 'icon-sys-position', refreshable: false">
								<table id="dataGrid2" class="easyui-datagrid" data-options="
									width: '100%',
									height: 'auto',
									fit: true,
									rownumbers: true,
									
									url : '${request.contextPath}/sys/user/manage/listPosition.htm',
									
									columns : [[{
										title : '岗位名称',
										field : 'positionName',
										align : 'center',
										width : 150,
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
									}]]
								">
								</table>
							</div>
							
							<div data-options="title: '主管部门', iconCls: 'icon-sys-organization', refreshable: false">
								<table id="dataGrid3" class="easyui-datagrid" data-options="
									width: '100%',
									height: 'auto',
									fit: true,
									rownumbers: true,
									
									url : '${request.contextPath}/sys/user/auth/listDepartment.htm',
									
									columns : [[{
										title : '部门名称',
										field : 'departmentName',
										align : 'center',
										width : 150,
										sortable: true
									}, {
										title : '部门编码',
										field : 'departmentCode',
										align : 'center',
										width : 200,
										sortable: true
									}, {
										title : '部门备注',
										field : 'departmentRemark',
										width : 200,
										align : 'center'
									}]]
								">
								</table>
							</div>
						</div>
					</div>
					
					<div class="toolbar" id="toolbar">
						<div class="search-div">
							<label>用户账号:</label>
							<input id="txtUserName" class="easyui-textbox" type="text" />
							<label>用户编码:</label>
							<input id="txtUserCard" class="easyui-textbox" type="text" />
							<label>用户姓名:</label>
							<input id="txtPersonName" class="easyui-textbox" type="text" />
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
					idField: 'userId',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					fitColumns: true,
					
					pagination: true,
					pageSize: 50,
					pageList: [20, 50, 100, 200],
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/sys/user/listPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'userId',
						checkbox: true
					}, {
						title : '用户名称',
						field : 'userName',
						align : 'center',
						width : 160,
						sortable: true
					}, {
						title : '用户姓名',
						field : 'trueName',
						align : 'center',
						width : 100,
						sortable: true
					}, {
						title : '用户编码',
						field : 'userCard',
						align : 'center',
						width : 150,
						sortable: true
					}, {
						title : '用户状态',
						field : 'userState',
						align : 'center',
						width : 100,
						formatter: function (val, row, index) {
							if(val == '0') {
								return '未激活';
							} else if(val == '1') {
								return '已激活';
							} else if(val == '2') {
								return '已冻结';
							} else {
								return '未知状态';
							}
						}
					}, {
						title : '用户部门',
						field : 'departmentName',
						align : 'center',
						width : 200
					}, {
						title : '备注信息',
						field : 'userRemark',
						align : 'center',
						width : 200
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

				$('#barUpload').click(function() {
					$.easyui.showDialog({
						title: '系统用户上传',
						
						width: 600,
						height: 290,
					    
						iniframe: true,
	                    topMost: true,
					    modal: true,
					    enableApplyButton: false,
					    enableSaveButton: false,
					    closeButtonText: '关闭',
					    resizable: false,
					    
	                    href:'${request.contextPath}/sys/user/manage/upload.htm',
	                    		
	                    onClose: function() {
	                    	$("#dataGrid").datagrid("reload");
	                    }
	                });
				});
				
				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建系统用户',
						
						width: 445,
					    height: 315, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/sys/user/manage/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form('submit', {
	                    				url: '${request.contextPath}/sys/user/manage/save.jsn',
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
						var userId = dataRow['userId'];
						EditObjectEntity(userId);
					} else {
						$.easyui.messager.alert('提示','请选择需要编辑的系统用户!','info');
					}	
				});
				
				$('#barDelete').click(function() {
					var dataRows = $("#dataGrid").datagrid("getSelections");
					
					if (dataRows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的系统用户吗？', function(r) {
							if (r) {
								DeleteObjectEntity(dataRows);
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的系统用户!','info');
		            	return;	
					}
				});
				
				$('#barSearch').click(function() {
					var userName = $("#txtUserName").textbox('getValue');
					var userCard = $("#txtUserCard").textbox('getValue');
					 
					var personName = $("#txtPersonName").textbox('getValue');
					$("#dataGrid").datagrid('load', {
						userName: userName,
						userCard: userCard,
						
						personName: personName
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
				
				showPage();
			});
			
			function EditObjectEntity(userId) {
				$.easyui.showDialog({
					title: '编辑系统用户',
					
					width: 445,
					height: 315, 
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/sys/user/manage/edit.htm',
                    queryParams: {
				    	userId: userId
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form('submit', {
                    				url: '${request.contextPath}/sys/user/manage/update.jsn',
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
				var userIds = [];
	            $.each(dataRows, function(i, dataRow) {
	            	userIds.push(dataRow['userId']);
	            });
	            $.ajax({
					type : 'post',
					url : '${request.contextPath}/sys/user/manage/delete.jsn',
					data : {
						userIds : userIds
					},
					dataType: 'json',
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
			}
			
			function ViewObjectEntity(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var userId = rowData.userId;
						
						$("#dataGrid1").datagrid("reload", {userId: userId});
						$("#dataGrid2").datagrid("reload", {userId: userId});
						$("#dataGrid3").datagrid("reload", {userId: userId});
					}
				}
			}
		</script>
	</body>
</html>
