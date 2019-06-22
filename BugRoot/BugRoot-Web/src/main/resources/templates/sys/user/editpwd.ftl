<table cellpadding="5" cellspacing="1" class="l-table-edit">
	<tr>
		<td align="right" class="l-table-edit-td">原密码:</td>
		<td class="l-table-edit-td">
			<input class="easyui-textbox" type="password" name="oldPassword" data-options="
				required: true, 
				width: 200,
				missingMessage: '必填字段',
				validType: 'length[6, 32]'" 
			/>
		</td>
	</tr>
	<tr>
		<td align="right" class="l-table-edit-td">新密码:</td>
		<td class="l-table-edit-td">
			<input class="easyui-textbox" type="password" name="newPassword1" data-options="
				required: true, 
				width: 200,
				missingMessage: '必填字段',
				validType: 'length[6, 32]'" 
			/>
		</td>
	</tr>
	<tr>
		<td align="right" class="l-table-edit-td">确认新密码:</td>
		<td class="l-table-edit-td">
			<input class="easyui-textbox" type="password" name="newPassword2" data-options="
				required: true, 
				width: 200,
				missingMessage:'必填字段',
				validType: 'length[6, 32]'" 
			/>
		</td>
	</tr>
</table>