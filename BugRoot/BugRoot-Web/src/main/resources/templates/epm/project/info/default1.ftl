<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[综合信息管理系统]</title>
		
		<script src="${request.contextPath}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.utils.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.json-2.4.min.js" type="text/javascript"></script>

		<!-- jquery-easyui -->
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/bootstrap/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/styles/icons/icon-all.css" />
		
		<script src="${request.contextPath}/plugins/jeasyui-1.5/jquery.easyui.min.js" type="text/javascript" ></script>
		<script src="${request.contextPath}/plugins/jeasyui-1.5/locale/easyui-lang-zh_CN.js" type="text/javascript" ></script>
		
		<!-- jquery-easyui-extensions -->
		<link href="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.css" rel="stylesheet" type="text/css" />
		
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.min.js" type="text/javascript" ></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.messager.min.js" type="text/javascript" ></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.form.min.js" type="text/javascript" ></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.tree.min.js" type="text/javascript" ></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.panel.min.js" type="text/javascript" ></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.dialog.min.js" type="text/javascript" ></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.datagrid.min.js" type="text/javascript" ></script>
		
	    <script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.tabs.min.js" type="text/javascript"></script>
</head>
<body>
	<table border="1">
		<tr>
			<td align="left">项目名称:</td>
			<td align="left">${projectInfoVo.projectName }</td>
		</tr>
		<tr>
			<td align="left">项目经费:</td>
			<td align="left">${projectInfoVo.projectMonney }</td>
		</tr>
		<tr>
			<td align="left">项目类型:</td>
			<td align="left">${projectInfoVo.typeName }</td>
		</tr>
		<tr>
			<td align="left">项目模板:</td>
			<td align="left">${projectInfoVo.templateName }</td>
		</tr>
		<tr>
			<td align="left">责任单位:</td>
			<td align="left">${projectInfoVo.departmentName }</td>
		</tr>
		<tr>
			<td align="left">项目描述:</td>
			<td align="left">${projectInfoVo.projectRemark }</td>
		</tr>
		<tr>
			<td align="left">项目背景:</td>
			<td align="left">${projectInfoVo.projectGround }</td>
		</tr>
		<tr>
			<td align="left">项目责任人:</td>
			<td align="left">${projectInfoVo.trueName }</td>
		</tr>
		<tr>
			<td align="left">所属项目群:</td>
			<td align="left">${projectInfoVo.groupName }</td>
		</tr>
		<tr>
			<td align="left">项目开始时间:</td>
			<td align="left">${projectInfoVo.startTime }</td>
		</tr>
		<tr>
			<td align="left">项目截止时间:</td>
			<td align="left">${projectInfoVo.endTime }</td>
		</tr>
	
		
	</table>
</body>
</html>