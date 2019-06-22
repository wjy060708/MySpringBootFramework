<form method="post">
	<input type="hidden" name="moduleId" value="${module.moduleId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">模块名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="moduleName" data-options="
					required: true,
					missingMessage:'必填字段', 
					width: 330, 
					validType:'length[1, 64]'" 
					value="${module.moduleName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">模块图标:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="moduleIcon" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 330, 
					validType:'length[1, 64]'" 
					value="${module.moduleIcon }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">模块序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="moduleOrder" data-options="
					required: true, 
					width: 330, 
					min: 1, 
					max: 999,
					missingMessage: '必填字段'" 
					value="${module.moduleOrder }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">模块描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="moduleRemark" data-options="
					multiline: true, 
					width: 330,
					height: 60, 
					validType:'length[0, 128]'" 
					value="${module.moduleRemark }" 
				/>
			</td>
		</tr>
	</table>
</form>