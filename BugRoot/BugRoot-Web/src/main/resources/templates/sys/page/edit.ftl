<form method="post">
	<input type="hidden" name="pageId" value="${modulePage.pageId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">所属模块:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" name="moduleId" data-options="
					readonly: true,
					width: 350,
					valueField: 'moduleId',
					textField: 'moduleName',
					url: '${request.contextPath}/sys/module/listAll.htm',
					value: '${modulePage.moduleId }'
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">上级页面:</td>
			<td class="l-table-edit-td">
				<input id="combotree" class="easyui-combotree" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
					required: false,
					editable: false,
					missingMessage:'必填字段', 
					width: 350,
					url: '${request.contextPath}/sys/page/listModulePages.htm',
					queryParams: {
						moduleId: '${modulePage.moduleId }'
					},
					value: '${modulePage.parentId }',
					
					onChange: function(newValue, oldValue) {
						var currentId = '${modulePage.pageId }';	// 当前节点的ID
						var oldParentId = '${modulePage.parentId }';	// 原始父节点的ID
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
			<td align="right" class="l-table-edit-td">页面名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="pageName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 350, 
					validType: 'length[1, 64]'" 
					value="${modulePage.pageName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面图标:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="pageIcon" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 350, 
					validType:'length[1, 64]'" 
					value="${modulePage.pageIcon }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="pageOrder" data-options="
					required: true, 
					width: 350, 
					min: 1, 
					max: 999,
					missingMessage:'必填字段'" 
					value="${modulePage.pageOrder }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面URL:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="pageURL" data-options="
					required: false, 
					width: 350, 
					validType: 'length[0,128]'" 
					value="${modulePage.pageURL }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面密钥:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="pageToken" data-options="
					required: false, 
					width: 350, 
					validType: 'length[0, 128]'" 
					value="${modulePage.pageToken }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="pageRemark" data-options="
					multiline: true, 
					width: 350,
					height: 60, 
					validType:'length[0, 128]'" 
					value="${modulePage.pageRemark }" 
				/>
			</td>
		</tr>
	</table>
</form>