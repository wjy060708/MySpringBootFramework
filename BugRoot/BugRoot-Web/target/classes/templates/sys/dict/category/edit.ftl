<form method="post">
	<input type="hidden" name="categoryId" value="${dictCategory.categoryId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">类别名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="categoryName" data-options="
					required: true,
					prompt: '请填写数据字典类别名称',
					missingMessage: '数据字典类别名称必须填写', 
					width: 330, 
					validType:'length[1, 64]'" 
					value="${dictCategory.categoryName }"
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">类别编码:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="categoryCode" data-options="
					prompt: '请填写数据字典类别编码',
					width: 330, 
					validType:'length[0, 16]'" 
					value="${dictCategory.categoryName }"
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">上级类别:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combotree" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
					editable: false,
					prompt: '请填写上级数据字典类别',
					width: 330,
					url: '${request.contextPath}/sys/dict/category/listAll.htm',
					value: '${dictCategory.parentId }',
					onChange: function(newValue, oldValue) {
						var currentId = '${dictCategory.categoryId }';	// 当前节点的ID
						var oldParentId = '${dictCategory.parentId }';	// 原始父节点的ID
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
			<td align="right" class="l-table-edit-td">类别序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="categoryOrder" data-options="
					required: true, 
					width: 330, 
					min: 1, 
					max: 999, 
					prompt: '请填写数据字典类别序号',
					missingMessage: '数据字典类别序号必须填写'
				" value="${dictCategory.categoryOrder }" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">类别备注:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="categoryRemark" data-options="
					multiline: true, 
					width: 330,
					height: 60, 
					prompt: '请填写数据字典类别备注', 
					validType:'length[0, 256]'" 
					value="${dictCategory.categoryRemark }"
				/>
			</td>
		</tr>
	</table>
</form>