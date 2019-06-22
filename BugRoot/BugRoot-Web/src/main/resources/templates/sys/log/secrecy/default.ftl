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
				<table id="dataGrid" title="页面管理" toolbar="#toolbar"></table>
			
				<div class="toolbar" id="toolbar">
					<div class="search-div">
						<label>用户名:</label>
						<input id="txtUserName" class="easyui-textbox" type="text" />
						<label>开始时间:</label>
						<input id="txtStartDate" class="easyui-datetimebox" type="text" data-options="
							width: 160,
							editable: false, 
							icons: [{
								iconCls: 'icon-clear',
								handler: function(e){
									$(e.data.target).datetimebox('clear');
								}
							}]
						" />
						<label>截至时间:</label>
						<input id="txtFinishDate" class="easyui-datetimebox" type="text" data-options="
							width: 160,
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
					title: '日志审计',
					iconCls: 'icon-sys-logs',
					
					width: '100%',
					height: 'auto',
					rownumbers: true,
					striped: true,
					fit: true,
					
					pagination: true,
					
					loadMsg: '加载数据中,请稍后...',
					
					url : '${request.contextPath}/sys/log/secrecy/listPage.htm',
					
					columns : [[{
						field:'type',
						title: '请求类型',
						align : 'center',
						width : 100
					}, {
						field:'title',
						title: '日志标题',
						align : 'center',
						width : 120
					}, {
						field:'remoteAddr',
						title: '操作IP地址',
						align : 'center',
						width : 120
					}, {
						field:'userName',
						title: '操作用户',
						align : 'center',
						width : 120
					}, {
						title : '用户类型',
						field : 'userKind',
						align : 'center',
						width : 120,
						formatter: function (val, row, index) {
							if(val == '0') {
								return '普通用户';
							} else if(val == '1') {
								return '系统管理员';
							} else if(val == '2') {
								return '安全保密员';
							} else if(val == '3') {
								return '安全审计员';
							} else if(val == '4') {
								return '系统维护员';
							} else {
								return '未知用户';
							}
						}
					}, {
						title : '操作人姓名',
						field : 'trueName',
						align : 'center',
						width : 120
					}, {
						title: '请求URI',
						field:'requestUri',
						align : 'center',
						width : 120
					}, {
						title: '操作方式',
						field:'httpMethod',
						align : 'center',
						width : 120
					}, {
						title: '请求类型方法',
						field:'classMethod',
						align : 'center',
						width : 120
					}, {
						title: '请求参数',
						field:'params',
						align : 'center',
						width : 120
					}, {
						title: '返回的内容',
						field:'response',
						align : 'center',
						width : 120
					}, {
						field:'useTime',
						title: '执行时间(ms)',
						align : 'center',
						width : 120
					}, {
						field:'exception',
						title: '异常信息',
						align : 'center',
						width : 120
					}, {
						field:'createDate',  
						title: '操作时间',
						align : 'center',
						width : 120
					}]]
				});
				
				$('#barSearch').click(function() {
					var userName = $("#txtUserName").textbox('getValue');
					
					var startDate = $("#txtStartDate").datebox('getValue');
					var finishDate = $("#txtFinishDate").datebox('getValue');
					
					$("#dataGrid").datagrid('load', {
						userName: userName,
						
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
