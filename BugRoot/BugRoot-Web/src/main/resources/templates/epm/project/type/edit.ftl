<form method="post">
	<input type="hidden" name="typeId" value="${projectType.typeId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">类型名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="typeName" data-options="
					required: true,
					missingMessage:'必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
					value="${projectType.typeName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">类型序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="typeOrder" data-options="
					required: true, 
					width: 260, 
					min: 1, 
					max: 999,
					missingMessage: '必填字段'" 
					value="${projectType.typeOrder }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">类型描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="typeRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
					value="${projectType.typeRemark }" 
				/>
			</td>
		</tr>
	</table>
</form>