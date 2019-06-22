<form method="post">
	<input type="hidden" name="bugId" value="${pbmBugInfo.bugId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">项目名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="bugName" data-options="
					required: true,
					missingMessage:'必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
					value="${pbmBugInfo.bugName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">项目描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="bugRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
					value="${pbmBugInfo.bugRemark }" 
				/>
			</td>
		</tr>
	</table>
</form>