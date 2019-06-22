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
				<table id="dataGrid" title="数据字典项管理" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>条目名称:</label>
						<input id="txtEntryName" class="easyui-textbox" type="text" />
						<label>条目类别:</label>
						<input id="cbCategoryId" class="easyui-combotree" data-options="
							lines: true,
							dataPlain: true,
							parentField: 'parentId', 
							
							url: '${request.contextPath}/sys/dict/category/listAll.htm'
						" />
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
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.combotree.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.panel.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.dialog.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.datagrid.min.js" type="text/javascript"></script>
	    <script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.datagrid-groupview.min.js" type="text/javascript"></script>
	    
		<script type="text/javascript">
			function showPage() {
				$("#maskContainer").remove();
				$("#mainLayout").removeClass("hidden").layout("resize");
			}
			
			$(function() {
				$("#dataGrid").datagrid({
					dataPlain: true,
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					
					pagination: true,
					pageSize: 50,
					pageList: [10, 20, 50, 100],
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${ctx}/sys/dict/entry/listPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'entryId',
						checkbox: true
					}, {
						title : '字典条目类别',
						field : 'categoryName',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '字典条目名称',
						field : 'entryName',
						align : 'center',
						width : 200,
						sortable: true
					}, {
						title : '字典条目序号',
						field : 'entryOrder',
						align : 'center',
						width : 100,
						sortable: true
					}, {
						title : '字典条目状态',
						field : 'entryState',
						align : 'center',
						width : 100,
						formatter: function (val, row, index) {
							if(val == '1') {
								return '已启用';
							} else if(val == '2') {
								return '已禁用';
							} else {
								return '未启用';
							}
						}
					}, {
						title : '字典条目备注',
						field : 'entryRemark',
						width : 200,
						align : 'center'
					}]],
					groupField: 'categoryName',
					view: groupview,
					groupFormatter: function(categoryName, groupdata){
						return categoryName;
					},
				});

				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建字典条目',
						
						width: 445,
					    height: 320, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false, 
	                    
	                    href:'${request.contextPath}/sys/dict/entry/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/sys/dict/entry/save.jsn',
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
						var entryId = dataRow['entryId'];
						EditObjectEntity(entryId);
					} else {
						$.easyui.messager.alert('提示','请选择需要编辑的数据字典条目!','info');
					}	
				});
				
				$('#barDelete').click(function() {
					var dataRows = $("#dataGrid").datagrid("getSelections");
					
					if (dataRows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的数据字典条目吗？', function(r) {
							if (r) {
								DeleteObjectEntity(dataRows);
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的数据字典条目!','info');
		            	return;	
					}
				});
				
				$('#barSearch').click(function() {
					var categoryId = $("#cbCategoryId").combobox('getValue');
					var entryName = $("#txtEntryName").textbox('getValue');
					
					$("#dataGrid").datagrid('load', {
						categoryId: categoryId,
						entryName: entryName
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
				
				showPage();
			});
			
			function EditObjectEntity(entryId) {
				$.easyui.showDialog({
					title: '编辑字典条目',
					
					width: 445,
					height: 320,
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/sys/dict/entry/edit.htm',
                    queryParams: {
				    	entryId: entryId
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form(
                    			'submit', {
                    				url: '${request.contextPath}/sys/dict/entry/update.jsn',
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
				var entryIds = [];
	            $.each(dataRows, function(i, dataRow) {
	            	entryIds.push(dataRow['entryId']);
	            });
	            $.ajax({
					type : 'post',
					url : '${request.contextPath}/sys/dict/entry/delete.jsn',
					data : {
						entryIds : entryIds
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
		</script>
	</body>
</html>
