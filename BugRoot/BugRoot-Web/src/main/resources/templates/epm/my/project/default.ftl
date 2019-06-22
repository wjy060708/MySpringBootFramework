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
			<div data-options="region: 'center', border: false" >
				<table id="dataGrid" title="项目管理" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>项目名称:</label>
						<input id="txtProjectName" class="easyui-textbox" type="text" />
						<a href="#" id="barSearch" class="easyui-linkbutton" iconCls="icon-search">查询</a>
				    </div>
					<div class="ctrl-div">
				   		<a href="#" id="barFinish" class="easyui-linkbutton" iconCls="icon-refresh" plain="true">完成</a>
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
				$("#dataGrid").datagrid({
					dataPlain: true,
					idField: 'projectId',
					parentField: "parentId",
					treeField: 'projectName',
					singleSelect: true,
					
					title: '项目管理',
					iconCls: 'icon-sys-modules',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/epm/my/project/listMyProject.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'projectId',
						checkbox: true
					}, {
						title : '项目名称',
						field : 'projectName',
						align : 'center',
						width : 200,
						sortable: false
					}, {
						title : '项目模板',
						field : 'templateName',
						align : 'center',
						width : 200
					}, {
						title : '项目序号',
						field : 'projectOrder',
						align : 'center',
						width : 100,
						sortable: true
					}, {
						title : '项目描述',
						field : 'projectRemark',
						width : 200,
						align : 'center'
					}, {
						title : '考核状态',
						field : 'projectStatus',
						align : 'center',
						width : 120,
						formatter: function (val, row, index) {
							if(val == '0') {
								return '未发布';
							} else if(val == '1') {
								return '已发布';
							} else if(val == '2') {
								return '已挂起';
							} else {
								return '未知状态';
							}
						}
					}, {
						title : '项目类型',
						field : 'typeName',
						width : 200,
						align : 'center'
					}, {
						title : '项目详情',
						field : 'operator',
						width : 100,
						align : 'center',
						formatter: function (val, row, index) {
							var html = "<a class='l-btn l-btn-plain' onclick='javascript: OnProjectDetailControl(" + index + ");'><span class='l-btn-left'><span class='l-btn-text icon-sys-grant l-btn-icon-left'>查看</span></span></a>";
							return html;
						}
					}] ],
					onLoadSuccess: function(data) {
						// 清除选择
						$('#dataGrid').datagrid('clearSelections');
					},
				});
				
				$('#barDelete').click(function() {
					var dataRows = $("#dataGrid").datagrid("getSelections");
					
					if (dataRows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的项目吗？', function(r) {
							if (r) {
								DeleteObjectEntity(dataRows);
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的项目!','info');
		            	return;	
					}	
				});
				
				$('#barSearch').click(function() {
					var projectName = $("#txtProjectName").textbox('getValue');
					
					$("#dataGrid").datagrid('load', {
						projectName: projectName
            		});
				});
				
				$('#barFinish').click(function() {
					var dataRow = $("#dataGrid").datagrid("getSelected");
					if(dataRow != null) {
						var projectId = dataRow['projectId'];
						
						var url = '${request.contextPath}/epm/project/info/projectFinish.jsn';
						
						$.get(url, {projectId: projectId}, function(response) {
							if(response.success) {	// 成功取消
								$.easyui.messager.alert('提示', response.message, 'info');
								$("#dataGrid").datagrid("reload");
							} else {
								$.easyui.messager.alert('提示', response.message, 'info');
							}
						}, "json");
					} else {
						$.easyui.messager.alert('提示','请选择将要完成的项目!','info');
					}
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
				
				showPage();
			});
			
			
			function DeleteObjectEntity(dataRows) {
				var projectIds = [];
	            $.each(dataRows, function(i, dataRow) {
	            	projectIds.push(dataRow['projectId']);
	            });
		            
				$.ajax({
					type : 'post',
					url : '${request.contextPath}/epm/project/info/delete.jsn',
					data : {
						projectIds : projectIds
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
			
			function OnProjectDetailControl(rowIndex) {
				if($.util.parent && $.util.parent.mainpage && $.isFunction($.util.parent.mainpage.addModuleTab)) {
					if(rowIndex >= 0) {
						var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
						
						if(rowData) {
							var title = rowData.projectName;
							var href = "${request.contextPath}/epm/project/info/manage.htm?projectId=" + rowData.projectId;
							var iconCls = "icon-ais-assess-plan2";
							
							$.util.parent.mainpage.addModuleTab({title:title, href:href, iconCls:iconCls});
						}
					}
				}
			}
			
		</script>
	</body>
</html>
