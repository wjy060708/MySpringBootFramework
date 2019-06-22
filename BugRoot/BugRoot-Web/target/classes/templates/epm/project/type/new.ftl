<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="center" class="l-table-edit-td">类型名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="typeName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">类型序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="typeOrder" data-options="
					required: true, 
					width: 260, 
					min: 1, 
					max: 999, 
					value: 1,
					missingMessage: '必填字段'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">类型描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="typeRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>