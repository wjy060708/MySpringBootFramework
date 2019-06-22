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
				<table id="dataGrid" title="项目计划管理" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>项目计划名称:</label>
						<input id="txtTaskName" class="easyui-textbox" type="text" />
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
					idField: 'taskId',
					parentField: "parentId",
					treeField: 'taskName',
					
					title: '项目计划管理',
					iconCls: 'icon-sys-modules',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/epm/task/info/listPage.htm',
					queryParams: {
				    	projectId: '${projectInfoVo.projectId}'
				    },
									
					columns : [[{
						title : '唯一标识',
						field : 'taskId',
						checkbox: true
					}, {
						title : '项目计划名称',
						field : 'taskName',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '项目计划描述',
						field : 'taskRemark',
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
						
					}] ]
				});

				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建项目计划',
						
						width: 400,
					    height: 280, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/epm/task/info/new.htm',
	                    queryParams: {
				    		projectId: '${projectInfoVo.projectId}'
				  	    },
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/epm/task/info/save.jsn',
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
				
				$('#barEdit').click(function() {
					var dataRow = $("#dataGrid").treegrid("getSelected");
					if(dataRow != null) {
						var taskId = dataRow['taskId'];
						EditObjectEntity(taskId);
					} else {
						$.easyui.messager.alert('提示','请选择需要编辑的项目计划!','info');
					}	
				});
				
				$('#barDelete').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					
					if(dataRow != null) {
						var taskId = dataRow['taskId'];
						$.easyui.messager.confirm('确认对话框', '确定删除选中的项目计划吗？', function(r) {
							if (r) {
								DeleteObjectEntity(taskId);
							}
						});
						
					} else {
						$.easyui.messager.alert('提示','请选择需要删除的项目计划!','info');
					}
				});
				
				$('#barSearch').click(function() {
					var taskName = $("#txtTaskName").textbox('getValue');
					
					$("#dataGrid").treegrid('load', {
						taskName: taskName,
						projectId: '${projectInfoVo.projectId}'
						
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").treegrid("reload");
				});
				
				showPage();
			});
			
			function EditObjectEntity(taskId) {
				$.easyui.showDialog({
					title: '编辑项目计划',
					
					width: 400,
				    height: 250, 
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/epm/task/info/edit.htm',
                    queryParams: {
                    	taskId: taskId,
                    	projectId: '${projectInfoVo.projectId}'
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form(
                    			'submit', {
                    				url: '${request.contextPath}/epm/task/info/update.jsn',
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
			
			function DeleteObjectEntity(taskId) {
				if(taskId) {
					var url = '${request.contextPath}/epm/task/info/delete.jsn';
					$.get(url, {taskId: taskId}, function(response) {
						if(response) {	// 成功取消
							$.easyui.messager.alert('提示', response.message, 'info');
							if(response.success) {
								$("#dataGrid").treegrid("reload");
							}
						}
					}, "json");
				}
			}
		</script>
	</body>
</html>
