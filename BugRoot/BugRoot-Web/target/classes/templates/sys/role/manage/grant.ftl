<ul class="easyui-tree" style="padding:10px;" data-options="
		lines: true,
		dataPlain: true,
		parentField: 'parentId',
		checkbox: true,
		
		url: '${request.contextPath}/sys/page/listRolePages.htm',
		queryParams: {
			roleId: '${sysRole.roleId}'
		}
	">
</ul>