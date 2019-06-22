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
				<table id="dataGrid" toolbar="#toolbar"></table>
			</div>
			
			<div class="toolbar" id="toolbar">
				<div class="search-div">
					<label>上传人:</label>
					<input id="txtPersonName" class="easyui-textbox" type="text" />
					<label>起始日期:</label>
					<input id="txtStartDate" class="easyui-datebox" type="text" data-options="
						width: 120,
						editable: false,
						icons: [{
							iconCls: 'icon-clear',
							handler: function(e){
								$(e.data.target).datetimebox('clear');
							}
						}]
					" />
					<label>截止日期:</label>
					<input id="txtFinishDate" class="easyui-datebox" type="text" data-options="
						width: 120,
						editable: false,
						icons: [{
							iconCls: 'icon-clear',
							handler: function(e){
								$(e.data.target).datetimebox('clear');
							}
						}]
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
					title: '文件审计',
					iconCls: 'icon-sys-files',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/sys/file/listPage.htm',
					
					columns : [[{
						title : '主键',
						field: 'fileId',
						checkbox: true
					}, {
						title : '上传人',
						field : 'personName',
						align : 'center',
						width : 120
					}, {
						title : '文件名称',
						field : 'fileTitle',
						align : 'center',
						width : 300
					}, {
						title : '文件状态',
						field : 'fileStatus',
						align : 'center',
						width : 120,
						formatter: function (val, row, index) {
							if(val == '0') {
								return '未启用';
							} else if(val == '1') {
								return '已启用';
							} else if(val == '2') {
								return '转换中';
							} else if(val == '3') {
								return '已转换';
							}
						}
					}, {
						title : '上传时间',
						field : 'createTime',
						align : 'center',
						width : 140
					}]]
				});
				
				$('#barSearch').click(function() {		
					var personName = $("#txtPersonName").textbox('getValue');
					
					var startDate = $("#txtStartDate").datebox('getValue');
					var finishDate = $("#txtFinishDate").datebox('getValue');
					$("#dataGrid").datagrid('load', {	
						personName: personName,
						
						startDate: startDate,
						finishDate: finishDate
            		});
				});
				
				$('#barRefresh').click(function() {
					$("#dataGrid").datagrid("reload");
				});
				
				showPage();
			});
		</script>
	</body>
</html>
