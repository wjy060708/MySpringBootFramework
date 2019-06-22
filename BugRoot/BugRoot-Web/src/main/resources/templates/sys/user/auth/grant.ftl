<table class="easyui-datagrid" data-options="
		idField: 'roleId',
		width: '100%',
		height: 'auto',
		fit: true,
		rownumbers: true,
		
		url : '${request.contextPath}/sys/role/auth/listUserRole.htm',
		queryParams: {
			userId: '${user.userId}'
		},
		
		columns : [[{
			title : '唯一标识',
			field : 'roleId',
			checkbox: true
		}, {
			title : '角色名称',
			field : 'roleName',
			align : 'center',
			width : 200
		}, {
			title : '角色描述',
			field : 'roleRemark',
			width : 200,
			align : 'center'
		}]],
		
		onLoadSuccess: function(data) {
			var rows = data.rows;
			for(var i = 0;i < rows.length;i ++) {
				if(rows[i].checked == true) {
					$(this).datagrid('selectRecord', rows[i].roleId);
				}
			}
		}
	">
</table>