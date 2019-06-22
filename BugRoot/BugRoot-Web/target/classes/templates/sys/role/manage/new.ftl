<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">角色名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="roleName" data-options="
					required: true, 
					missingMessage: '必填字段', 
					width: 330, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">角色编码:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="roleCode" data-options="
					required: true, 
					missingMessage: '必填字段', 
					width: 330, 
					validType:'length[1, 10]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">角色描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="roleRemark" data-options="
					multiline: true, 
					width: 330, 
					height:80, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>