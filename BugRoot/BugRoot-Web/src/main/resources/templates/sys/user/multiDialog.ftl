<div class="easyui-layout" style="width:625px;height:400px;">
	<div data-options="region:'west'" style="width:200px;">
		<div class="easyui-accordion"  data-options="fit:true, border:false">
			<div title="按组织选择" data-options="iconCls:'icon-sys-organization', selected:true" style="overflow:auto;">
				<ul class="easyui-tree" data-options="
						lines: true,
						dataPlain: true,
						parentField: 'parentId',
						url:'${request.contextPath}/sys/org/listOrg.htm', 
						
						onClick:function(node){
							$('#datagrid').datagrid('clearSelections');
							$('#datagrid').datagrid('load', {departmentId: node.id});
						}
					">
				</ul>
			</div>
			
			<div title="按角色选择" data-options="iconCls:'icon-sys-position'" style="overflow:auto;">
				<ul class="easyui-tree" 
					data-options="
						lines: true,
						dataPlain: true,
						parentField: 'parentId',
						url:'${request.contextPath}/sys/role/listAll.htm', 
						
						onClick:function(node){
							$('#datagrid').datagrid('clearSelections');
							$('#datagrid').datagrid('load', {roleId: node.id});
						}
					">
				</ul>
			</div>
		</div>
	</div>
	
	<div data-options="region:'center', title:'人员列表', iconCls:'icon-sys-users'" style="width:420px;">
		<table id="datagrid" class="easyui-datagrid" data-options="
					idField: 'userId',
					width: '100%',
					height: 'auto',
					
					border: false,
					fit: true,
					
					rownumbers: true,
					pagination: true,
					
					url : '${request.contextPath}/sys/user/listPage.htm',
					
					method: 'post',
					
					columns : [[{
						title : '唯一标识',
						field : 'userId',
						checkbox: true
					}, {
						title : '人员姓名',
						field : 'trueName',
						align : 'center',
						width : 120,
						sortable: true
					}, {
						title : '所属部门',
						field : 'departmentName',
						width : 160,
						align : 'center'
					}]],
					onLoadSuccess: function(data) {
						$(this).datagrid('clearSelections');
					}
				">
		</table>
	</div>
</div>