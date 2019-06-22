<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		 <tr>
			<td align="center" class="l-table-edit-td">所属项目:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combobox" name="projectId" data-options="
					required: true, 
					editable: false,
					missingMessage: '必填字段', 
					width: 260,
					valueField: 'projectId',
					textField: 'projectName',
					url: '${request.contextPath}/epm/project/info/listAll.htm',
					onSelect: function(record) {
						var surl = '${request.contextPath}/epm/task/info/listProjectTasks.htm?projectId=' + record.projectId;
						$('#combotree').combotree('clear');
						$('#combotree').combotree('reload', surl);
					}	
										
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">上级项目计划:</td>
			<td class="l-table-edit-td">
				<input id="combotree" class="easyui-combotree" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
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