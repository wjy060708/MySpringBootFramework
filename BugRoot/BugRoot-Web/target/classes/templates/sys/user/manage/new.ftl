<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">登录账号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="userName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 330, 
					validType:'length[1, 32]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">用户姓名:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="trueName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 330, 
					validType:'length[1, 32]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">用户编码:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="userCard" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 330, 
					validType:'length[1, 32]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">用户部门:</td>
			<td class="l-table-edit-td">
				<select class="easyui-combotree" name="departmentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId',
					
					required: true,
					editable: false,
					missingMessage:'必填字段', 
					width: 330,
					lines: true,
					url: '${request.contextPath}/sys/org/listOrg.htm'
				">
				</select>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">备注信息:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="userRemark" data-options="
					multiline: true, 
					width: 330,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>