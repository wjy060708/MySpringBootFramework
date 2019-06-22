<form method="post">
	<input type="hidden" name="modeId" value="${knowMode.modeId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
	
		<tr>
			<td align="center" class="l-table-edit-td">缺陷模式名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="modeName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 270, 
					validType:'length[1, 64]'" ,
					value="${knowMode.modeName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">所属分类:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" name="typeId" data-options="
					readonly: false,
					width: 260,
					valueField: 'typeId',
					textField: 'typeName',
					url: '${request.contextPath}/knowledge/type/listAll.htm',
					
					value: '${knowMode.typeId }'
				" />
			</td>
		</tr>
		 <tr>
			<td align="center" class="l-table-edit-td">编辑权限:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" type="text" name="isEdit" data-options="
					editable: false,
					valueField: 'value',
					width: 250, 
					textField: 'label',
				data: [{
					label: '~请选择~',
					value: ''
				}, {
					label: '创建人',
					value: '0'
				}, {
					label: '分类',
					value: '1'
				}, {
					label: '小组',
					value: '2'
				}]
											
			"
							
					value="${knowMode.isEdit }" 
				/>
			</td>
		</tr>
		 <tr>
			<td align="center" class="l-table-edit-td">阅读权限:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" type="text" name="isRead" data-options="
					editable: false,
					valueField: 'value',
					width: 250, 
					textField: 'label',
				data: [{
					label: '~请选择~',
					value: ''
				}, {
					label: '创建人',
					value: '0'
				}, {
					label: '分类',
					value: '1'
				}, {
					label: '小组',
					value: '2'
				}]
											
			"	
			
					value="${knowMode.isRead }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">缺陷模式作者:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="author" data-options="
					width: 270, 
					validType:'length[1, 64]'" ,
					value="${knowMode.author }" 
				/>
			</td>
		</tr>
		
		<tr>
			<td align="center" class="l-table-edit-td">缺陷模式描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="modeRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
					value="${knowMode.modeRemark }" 
				/>
			</td>
		</tr>
		
	</table>
</form>