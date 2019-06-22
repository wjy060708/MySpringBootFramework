<form method="post">
	<input type="hidden" name="departmentId" value="${organization.departmentId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">组织名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="departmentName" data-options="
					required: true, 
					width: 330,
					missingMessage: '必填字段', 
					validType:'length[1, 64]'" 
					value="${organization.departmentName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">组织编码:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="departmentCode" data-options="
					readonly: true, 
					width: 330" 
					value="${organization.departmentCode }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">组织类型:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" type="text" name="departmentKind" data-options="
					readonly: true, 
					width: 330,
					valueField: 'id',
					textField: 'text',
					value: '${organization.departmentKind }',
					data: [{
						id: 'ogn',
						text: '机构'
					}, {
						id: 'dpt',
						text: '部门'
					}],
					onSelect: function(record) {
						if(record.id == 'ogn') {	// 机构
							$.util.delay(function() {
								$('#parentId').combotree('clear');
								$('#parentId').combotree('disable');
							}, 100);
							
						} else {
							$.util.delay(function() {
								$('#parentId').combotree('enable');
							}, 100);
						}
					}
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">上级组织:</td>
			<td class="l-table-edit-td">
				<select class="easyui-combotree" id="parentId" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId',
					
					required: true,
					editable: false,
					missingMessage:'必填字段', 
					width: 330,
					url: '${ctx}/sys/org/listOrg.htm',
					value: '${organization.parentId }',
					
					onChange: function(newValue, oldValue) {
						var currentId = '${organization.departmentId }';	// 当前节点的ID
						var oldParentId = '${organization.parentId }';	// 原始父节点的ID
						var newParentId = newValue;
						
						if(currentId == newParentId) {	// 不能将自己设置为自己的父节点
							$(this).combotree('setValue', oldParentId);
							$.easyui.messager.alert('提示', '设置有误!','info');
							return;
						} else {
							var ctree = $(this).combotree('tree');	// 获取树对象
							
							var parentNode = $(ctree).tree('find', newParentId);
							while(parentNode) {
								if(parentNode.parentId) {
									if(currentId == parentNode.parentId) {
										$(this).combotree('setValue', oldParentId);
										$.easyui.messager.alert('提示', '设置有误!','info');
										return;
									} else {
										parentNode = $(ctree).tree('find', parentNode.parentId);
									}
								} else {
									break;
								}
							}
						}
					}
				">
				</select>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">组织排序:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="departmentOrder" data-options="
					required: true, 
					width: 330, 
					min: 1,
					max: 999,
					missingMessage:'必填字段'" 
					value="${organization.departmentOrder }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">组织描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="departmentRemark" data-options="
					multiline: true,
					width: 330,
					height: 60, 
					validType:'length[0, 128]'" 
					value="${organization.departmentRemark }" 
				/>
			</td>
		</tr>
	</table>
</form>