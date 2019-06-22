<form method="post">
	<input type="hidden" name="typeId" value="${knowType.typeId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="center" class="l-table-edit-td">所属分类:</td>
			<td class="l-table-edit-td">
				<input id="combotree" class="easyui-combotree" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
					required: false,
					editable: false,
					missingMessage:'必填字段', 
					width: 260,
					url: '${request.contextPath}/knowledge/type/listAll.htm',
		
					value: '${knowType.parentId }',
					
					onChange: function(newValue, oldValue) {
						var currentId = '${knowType.typeId }';	// 当前节点的ID
						var oldParentId = '${knowType.parentId }';	// 原始父节点的ID
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
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目计划名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="typeName" data-options="
					required: true,
					missingMessage:'必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
					value="${knowType.typeName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目计划描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="typeRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
					value="${knowType.typeRemark }" 
				/>
			</td>
		</tr>
	</table>
</form>