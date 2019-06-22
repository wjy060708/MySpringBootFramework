<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">类型名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="processName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		
		<tr>
			<td align="right" class="l-table-edit-td">类型描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="processRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>