<form method="post">
	<input type="hidden" name="templateId" value="${BOMTemplate.templateId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">模板名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="templateName" data-options="
					required: true,
					missingMessage:'必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
					value="${BOMTemplate.templateName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">模板描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="templateRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
					value="${BOMTemplate.templateRemark }" 
				/>
			</td>
		</tr>
	</table>
</form>