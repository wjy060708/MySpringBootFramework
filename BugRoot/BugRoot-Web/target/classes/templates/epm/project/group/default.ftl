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
				<table id="dataGrid" title="项目群管理" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>项目群名称:</label>
						<input id="txtGroupName" class="easyui-textbox" type="text" />
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
			
			<div data-options="region: 'east', split: true, width: 400, maxWidth: 400, minWidth: 400, collapsed: true, title: '项目列表--（双击可查看项目详情）', iconCls: 'icon-sys-user-config'">
				<table id="listProjectGrid" ></table>
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
					idField: 'groupId',
					
					title: '项目群管理',
					iconCls: 'icon-sys-modules',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					singleSelect: true,
					fit: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/epm/project/group/listPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'groupId',
						checkbox: true
					}, {
						title : '项目群名称',
						field : 'groupName',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '项目群图标',
						field : 'groupIcon',
						align : 'center',
						width : 200
					}, {
						title : '项目群序号',
						field : 'groupOrder',
						align : 'center',
						width : 100,
						sortable: true
					}, {
						title : '项目群描述',
						field : 'groupRemark',
						width : 200,
						align : 'center'
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
				
				$("#listProjectGrid").datagrid({
					dataPlain: true,
					idField: 'projectId',
					
					width: '100%',
					height: 'auto',
					fit: true,
					rownumbers: true,
					singleSelect: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					pagination: true,
					
					url : '${request.contextPath}/epm/project/info/listGroupProject.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'projectId',
						checkbox: true
					}, {
						title : '项目名称',
						field : 'projectName',
						align : 'center',
						width : 110,
						sortable: false
					}, {
						title : '项目类型',
						field : 'typeName',
						align : 'center',
						width : 110,
						sortable: false
					}, {
						title : '项目模板',
						field : 'templateName',
						align : 'center',
						width : 110,
						sortable: false
					}]],
					onLoadSuccess: function(data) {
						$(this).datagrid('clearSelections');
					},
					onDblClickRow: function(rowIndex, rowData) {
						OnProjectDetailControl(rowData.projectId);
					}
				});

				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建项目群',
						
						width: 390,
					    height: 280, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/epm/project/group/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/epm/project/group/save.jsn',
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
						var groupId = dataRow['groupId'];
						EditObjectEntity(groupId);
					} else {
						$.easyui.messager.alert('提示','请选择需要编辑的项目群!','info');
					}	
				});
				
				$('#barDelete').click(function() {
					var dataRows = $("#dataGrid").datagrid("getSelections");
					
					if (dataRows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的项目群吗？', function(r) {
							if (r) {
								DeleteObjectEntity(dataRows);
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的项目群!','info');
		            	return;	
					}	
				});
				
				$('#barSearch').click(function() {
					var groupName = $("#txtGroupName").textbox('getValue');
					
					$("#dataGrid").datagrid('load', {
						groupName: groupName
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
				
				showPage();
			});
			
			function EditObjectEntity(groupId) {
				$.easyui.showDialog({
					title: '编辑项目群',
					
					width: 390,
				    height: 280, 
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/epm/project/group/edit.htm',
                    queryParams: {
                    	groupId: groupId
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form(
                    			'submit', {
                    				url: '${request.contextPath}/epm/project/group/update.jsn',
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
				var groupIds = [];
	            $.each(dataRows, function(i, dataRow) {
	            	groupIds.push(dataRow['groupId']);
	            });
		            
				$.ajax({
					type : 'post',
					url : '${request.contextPath}/epm/project/group/delete.jsn',
					data : {
						groupIds : groupIds
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
			
			function ViewObjectEntity(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var groupId = rowData.groupId;
						
						var url = '${request.contextPath}/epm/project/info/listGroupProject.jsn';
						$.get(url, {groupId: groupId}, function(data) {
							$("#listProjectGrid").datagrid("loadData", data);
						});
					}
				}
			}
			
			function OnProjectDetailControl(projectId) {
				if($.util.parent && $.util.parent.mainpage && $.isFunction($.util.parent.mainpage.addModuleTab)) {
					var rowIndex = $("#listProjectGrid").datagrid("getRowIndex", projectId);
					if(rowIndex >= 0) {
						var rowData = $("#listProjectGrid").datagrid("getRowData", rowIndex);
						
						if(rowData) {
							var title = rowData.projectName;
							var href = "${ctx}/epm/project/info/manage.htm?projectId=" + rowData.projectId;
							var iconCls = "icon-ais-assess-plan2";
							
							$.util.parent.mainpage.addModuleTab({title:title, href:href, iconCls:iconCls});
						}
					}
				}
			}
		</script>
	</body>
</html>
