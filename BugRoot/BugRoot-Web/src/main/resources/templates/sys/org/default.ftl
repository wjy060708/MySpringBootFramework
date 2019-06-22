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
				<table id="dataGrid" title="组织机构" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>组织名称:</label>
						<input id="txtDepartmentName" class="easyui-textbox" type="text" />
						<label>组织编码:</label>
						<input id="txtDepartmentCode" class="easyui-textbox" type="text" data-options="width: 120" />
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
					idField: 'departmentId',
					parentField: "parentId",
					treeField: 'departmentName',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					fitColumns: true,
					
					pagination: true,
					pageSize: 100,
					pageList: [50, 100, 150, 200],
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/sys/org/listOrgPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'departmentId',
						checkbox: true
					}, {
						title : '组织名称',
						field : 'departmentName',
						align : 'left',
						width : 300,
						sortable: true
					}, {
						title : '组织编码',
						field : 'departmentCode',
						width : 100,
						align : 'center',
						sortable: true
					}, {
						title : '组织序号',
						field : 'departmentOrder',
						width : 100,
						align : 'center',
						sortable: true
					}, {
						title : '组织描述',
						field : 'departmentRemark',
						width : 300,
						align : 'center'
					}]],
					onLoadSuccess: function(row, data) {
						$('#dataGrid').treegrid('clearSelections');
					}
				});

				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建组织机构',
						
						width: 450,
					    height: 310, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/sys/org/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form('submit', {
	                    				url: '${request.contextPath}/sys/org/save.jsn',
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
	                    		return true;
	                    	} else {
	                    		return false;
	                    	}
	                    }
	                });
				});
				
				$('#barEdit').click(function() {
					var dataRow = $("#dataGrid").treegrid("getSelected");
					if(dataRow != null) {
						var departmentId = dataRow['departmentId'];
						EditObjectEntity(departmentId);
					} else {
						$.easyui.messager.alert('提示','请选择需要编辑的组织机构!','info');
					}	
				});
				
				$('#barDelete').click(function() {
					var dataRow = $("#dataGrid").treegrid("getSelected");
					
					if(dataRow != null) {
						var departmentId = dataRow['departmentId'];
						$.easyui.messager.confirm('确认对话框', '确定删除选中的组织机构吗？', function(r) {
							if (r) {
								DeleteObjectEntity(departmentId);
							}
						});
						
					} else {
						$.easyui.messager.alert('提示','请选择需要删除的组织机构!','info');
					}
				});
				
				$('#barSearch').click(function() {
					var departmentName = $("#txtDepartmentName").textbox('getValue');
					var departmentCode = $("#txtDepartmentCode").textbox('getValue');
					$("#dataGrid").treegrid('load', {
						departmentName: departmentName,
						departmentCode: departmentCode
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").treegrid("reload");
				});
				
				showPage();
			});
			
			function EditObjectEntity(departmentId) {
				$.easyui.showDialog({
					title: '编辑组织机构',
					
					width: 450,
				    height: 350,
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/sys/org/edit.htm',
                    queryParams: {
				    	departmentId: departmentId
				    },
				    
				    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form('submit', {
                    				url: '${request.contextPath}/sys/org/update.jsn',
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
                    		return true;
                    	} else {
                    		return false;
                    	}
                    }
                });	
			}
			
			function DeleteObjectEntity(departmentId) {
				if(departmentId) {
					var url = '${request.contextPath}/sys/org/delete.jsn';
					
					$.get(url, {departmentId: departmentId}, function(response) {
						if(response) {
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
