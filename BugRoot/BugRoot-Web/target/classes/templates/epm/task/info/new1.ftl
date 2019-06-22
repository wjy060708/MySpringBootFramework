<form method="post">
	<input type="hidden" name="projectId" value="${epmProjectInfo.projectId }" />
	
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="center" class="l-table-edit-td">上级项目计划:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combotree" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 				
					url: '${request.contextPath}/epm/task/info/listProjectTasks.htm?projectId=${epmProjectInfo.projectId }',
					required:false,
					editable: false,
					missingMessage:'必填字段', 
					width:260
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目计划名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="taskName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目计划描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="taskRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>