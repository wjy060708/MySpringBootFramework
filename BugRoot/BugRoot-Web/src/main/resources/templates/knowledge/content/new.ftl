<form method="post">
	<input type="hidden" name="modeId" value="${knowMode.modeId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">缺陷模式:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="modeContentName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 330, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">引入原因:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="reason" data-options="
					multiline: true, 
					width: 330,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">引发后果:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="consequence" data-options="
					multiline: true, 
					width: 330,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">预防措施:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="prevention" data-options="
					multiline: true, 
					width: 330,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>