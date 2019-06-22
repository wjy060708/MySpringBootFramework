<form method="post">
	<input type="hidden" name="reasonId" value="${knowModeReason.reasonId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="center" class="l-table-edit-td">缺陷模式分类:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combotree" name="typeId" data-options="
					readonly: true,
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
					required: false,
					editable: false,
					missingMessage:'必填字段', 
					width: 260,
					url: '${request.contextPath}/knowledge/type/listAll.htm',
					
					value: '${knowModeReason.typeId }' 
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">缺陷模式:</td>
			<td class="l-table-edit-td">
				<input id="combobox" class="easyui-combobox" name="modeId" data-options="
					readonly: true,
					lines: true,
					dataPlain: true,
			
					valueField: 'modeId',
					textField: 'modeName',			
					required: false,
					editable: false,
					missingMessage:'必填字段', 
					width: 260,
					url: '${request.contextPath}/knowledge/mode/listAll1.htm',
					queryParams: {
						typeId: '${knowModeReason.typeId }'
					},
					value: '${knowModeReason.modeId }' 
					
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">缺陷原因:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="reasonContent" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
					
					value="${knowModeReason.reasonContent }" 
				/>
			</td>
		</tr>
	</table>
</form>