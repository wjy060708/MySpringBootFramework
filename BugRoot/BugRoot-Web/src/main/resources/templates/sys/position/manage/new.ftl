<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">岗位名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="positionName" data-options="
					required: true,
					missingMessage:'必填字段',
					width: 330, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">所属部门:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combotree" name="departmentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId',
					
					required: true,
					editable: false,
					missingMessage:'必填字段', 
					width: 330,
					lines: true,
					url: '${request.contextPath}/sys/org/listOrg.htm'
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">岗位描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="positionRemark" data-options="
					multiline: true, 
					width: 330, 
					height:80, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>