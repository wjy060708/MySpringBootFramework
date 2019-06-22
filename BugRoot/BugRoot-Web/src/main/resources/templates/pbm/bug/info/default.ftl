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
				<table id="dataGrid" title="缺陷管理" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>缺陷名称:</label>
						<input id="txtProjectName" class="easyui-textbox" type="text" />
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
					idField: 'bugId',
					parentField: "parentId",
					treeField: 'bugName',
					
					title: '缺陷管理',
					iconCls: 'icon-sys-modules',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/pbm/bug/info/listPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'bugId',
						checkbox: true
					}, {
						title : '缺陷名称',
						field : 'bugName',
						align : 'center',
						width : 200,
						sortable: true
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
					}, {
						title : '缺陷描述',
						field : 'bugRemark',
						width : 200,
						align : 'center'
					}] ]
				});

				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '新建缺陷',
						
						width: 380,
					    height: 200, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/pbm/bug/info/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${request.contextPath}/pbm/bug/info/save.jsn',
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
						var bugId = dataRow['bugId'];
						EditObjectEntity(bugId);
					} else {
						$.easyui.messager.alert('提示','请选择需要编辑的缺陷!','info');
					}	
				});
				
				$('#barDelete').click(function() {
					var dataRows = $("#dataGrid").treegrid("getSelections");
					
					if (dataRows.length > 0) {
						$.easyui.messager.confirm('确认对话框', '确定删除选中的缺陷吗？', function(r) {
							if (r) {
								DeleteObjectEntity(dataRows);
							}
						});
					}else{
						$.easyui.messager.alert('提示','请选择需要删除的缺陷!','info');
		            	return;	
					}	
				});
				
				$('#barSearch').click(function() {
					var bugName = $("#txtProjectName").textbox('getValue');
					
					$("#dataGrid").treegrid('load', {
						bugName: bugName
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").treegrid("reload");
				});
				
				showPage();
			});
			
			function EditObjectEntity(bugId) {
				$.easyui.showDialog({
					title: '编辑缺陷',
					
					width: 380,
				    height: 200, 
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${request.contextPath}/pbm/bug/info/edit.htm',
                    queryParams: {
                    	bugId: bugId
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form(
                    			'submit', {
                    				url: '${request.contextPath}/pbm/bug/info/update.jsn',
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
			
			function DeleteObjectEntity(dataRows) {
				var bugIds = [];
	            $.each(dataRows, function(i, dataRow) {
	            	bugIds.push(dataRow['bugId']);
	            });
		            
				$.ajax({
					type : 'post',
					url : '${request.contextPath}/pbm/bug/info/delete.jsn',
					data : {
						bugIds : bugIds
					},
					dataType: 'json',
					traditional: true,
					
					success : function(response) {
						if(response) {
							$.easyui.messager.alert('提示',response.message, 'info');
							if(response.success) {
								$("#dataGrid").treegrid("reload");
							}
						}
					}
				});
			}
		</script>
	</body>
</html>
