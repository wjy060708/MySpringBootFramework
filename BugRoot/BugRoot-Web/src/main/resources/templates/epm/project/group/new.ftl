<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">项目群名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="groupName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">项目群图标:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="groupIcon" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">项目群序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="groupOrder" data-options="
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
			<td align="right" class="l-table-edit-td">项目群描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="groupRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>