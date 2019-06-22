<form method="post">
	<input type="hidden" name="entryId" value="${dictEntry.entryId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">条目类别:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combotree" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
					readonly: true,
					width: 330,
					url: '${request.contextPath}/sys/dict/category/listAll.htm',
					value: '${dictEntry.categoryId }'
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">条目名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="entryName" data-options="
					required: true,
					prompt: '请填写字典条目名称',
					missingMessage: '字典条目名称必须填写',
					width: 330, 
					validType:'length[1, 64]'" 
					value="${dictEntry.entryName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">条目序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="entryOrder" data-options="
					required: true, 
					width: 330, 
					min: 1, 
					max: 999,
					prompt: '请填写字典条目序号',
					missingMessage: '字典条目序号必须填写'
				"  value="${dictEntry.entryOrder }" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">条目状态:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" name="entryState" data-options="
					readonly: true, 
					width: 330,
					valueField: 'id',
					textField: 'text',
					data: [{
						id: '0',
						text: '不启用'
					},{
						id: '1',
						text: '启用'
					},{
						id: '2',
						text: '禁用'
					}]
					" value="${dictEntry.entryState }"
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">条目备注:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="entryRemark" data-options="
					multiline: true, 
					width: 330,
					height: 60, 
					prompt: '请填写字典条目备注', 
					validType: 'length[0, 256]'" 
					value="${dictEntry.entryRemark}" 
				/>
			</td>
		</tr>
	</table>
</form>