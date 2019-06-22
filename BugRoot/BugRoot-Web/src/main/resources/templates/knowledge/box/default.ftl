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
			$(function() {
				$("#dataGrid").datagrid({
					iconCls: 'icon-sys-modules',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					singleSelect: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/knowledge/mode/listPage.htm',
					
					columns : [[{
						title : '唯一标识',
						field : 'modeId',
						checkbox: true
					}, {
						title : '缺陷模式名称',
						field : 'modeName',
						align : 'center',
						width : 270,
						sortable: true
					}, {
						title : '缺陷模式作者',
						field : 'author',
						width : 100,
						align : 'center'
					}, {
						title : '缺陷模式描述',
						field : 'modeRemark',
						width : 270,
						align : 'center'
					}, {
						title : '查看详情',
						field : 'operator',
						width : 100,
						align : 'center',
						formatter: function (val, row, index) {
							var html = "<a class='l-btn l-btn-plain' onclick='javascript: OnKnowModeDetailControl(" + index + ");'><span class='l-btn-left'><span class='l-btn-text icon-sys-grant l-btn-icon-left'>查看</span></span></a>";
							return html;
						}
					}]],
					onLoadSuccess: function(data) {
						// 清除选择
						$('#dataGrid').datagrid('clearSelections');
						
						// 折叠
						$("#mainLayout").layout("collapse", 'east');
						
						// 清空数据
						$("#dataTree").tree("loadData", []);
					},
					onSelect: function(rowIndex, rowData) {
						$("#mainLayout").layout("expand", 'east');
						
					}
				});

				$('#barNew').click(function() {
					$.easyui.showDialog({
						title: '添加缺陷模式',
						
						width: 630,
					    height: 470, 
					    
	                    topMost: true,
	                    enableApplyButton: false,
	                    resizable: false,
	                    
	                    href:'${request.contextPath}/knowledge/box/new.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form(
	                    			'submit', {
	                    				url: '${ctx}/sys/user/manage/save.jsn',
	                    				success: function(response) {
	    									if(response) {
	    										$.easyui.messager.alert('提示', response.message, 'info');	
	    										$("#dataGrid").datagrid("reload");
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
					var userState = $("#cbStateId").combobox('getValue');
					
					$("#dataGrid").datagrid('load', {
						userName: userName,
						userCard: userCard,
						
						personName: personName,
						userState: userState
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
			});
			
			function EditObjectEntity(userId) {
				$.easyui.showDialog({
					title: '编辑系统用户',
					
					width: 445,
					height: 315, 
				    
                    topMost: true,
                    enableApplyButton: false,
                    resizable: false,
                    
                    href:'${ctx}/sys/user/manage/edit.htm',
                    queryParams: {
				    	userId: userId
				    },
				    
                    onSave: function (d) {
                    	var validate = d.form("validate");
                    	if(validate) {
                    		d.form(
                    			'submit', {
                    				url: '${ctx}/sys/user/manage/update.jsn',
                    				success: function(response) {
    									if(response) {
    										$.easyui.messager.alert('提示', response.message, 'info');	
    										$("#dataGrid").datagrid("reload");
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
					url : '${ctx}/sys/user/manage/delete.jsn',
					data : {
						userIds : userIds
					},
					dataType: 'json',
					traditional: true,
					
					success : function(response) {
						if(response.success) {	// 成功取消
							$.easyui.messager.alert('提示', response.message, 'info');
						
							$("#dataGrid").datagrid("reload");
						} else {
							$.easyui.messager.alert('提示', response.message, 'info');
						}
					}
				});
			}
			
			function ViewObjectEntity(rowIndex) {
				if(rowIndex >= 0) {
					var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
					if(rowData) {
						var userId = rowData.userId;
						
						$("#positionGrid").datalist("reload", {userId: userId});
					}
				}
			}
			
			function OnKnowModeDetailControl(rowIndex) {
				if($.util.parent && $.util.parent.mainpage && $.isFunction($.util.parent.mainpage.addModuleTab)) {
					if(rowIndex >= 0) {
						var rowData = $("#dataGrid").datagrid("getRowData", rowIndex);
						
						if(rowData) {
							var title = rowData.modeName;
							var href = "${request.contextPath}/knowledge/mode/manage.htm?modeId=" + rowData.modeId;
							var iconCls = "icon-ais-assess-plan2";
							
							$.util.parent.mainpage.addModuleTab({title:title, href:href, iconCls:iconCls});
						}
					}
				}
			}
			
		</script>
	</head>
	
	<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
		<div data-options="region: 'west', split: true, title: '知识分类过程', 
			width: 260,
			minWidth: 200,
			iconCls: 'icon-sys-organization',
			">
			
			<ul class="easyui-tree" style="padding: 5px 5px 5px 5px;" data-options="
				url: '${request.contextPath}/knowledge/type/listAll.htm',
					lines: true,
					dataPlain: true,
					parentField: 'parentId',
					
					onClick: function(node) {
						// 清除所有选择的行
						$('#dataGrid').datagrid('clearSelections');
						
						// 加载某个分类下的所有缺陷模式
						$('#dataGrid').datagrid('load', {typeId: node.id});
					}
			">
			</ul>
		</div>
		
		<div data-options="region: 'center', border: false" >	
			<table id="dataGrid" title="缺陷模式" toolbar="#toolbar"></table>
		
			<div class="toolbar" id="toolbar">
				<div class="search-div">
					<label>缺陷模式名称:</label>
					<input id="txtModeName" class="easyui-textbox" type="text" />
					<label>作者:</label>
					<input id="txtModeAuthor" class="easyui-textbox" type="text" />
					<a href="#" id="barSearch" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			    </div>
			</div>
		</div>
	</body>
</html>
