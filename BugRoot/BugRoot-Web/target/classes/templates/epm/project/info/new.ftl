<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="center" class="l-table-edit-td">项目名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="projectName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="projectOrder" data-options="
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
			<td align="center" class="l-table-edit-td">项目经费:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="projectMonney" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目类型:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combobox" name="typeId" data-options="
					required: true, 
					editable: false,
					missingMessage: '必填字段', 
					width: 260,
					valueField: 'typeId',
					textField: 'typeName',
					url: '${request.contextPath}/epm/project/type/listAll.htm'
							
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">所用模板:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combobox" name="templateId" data-options="
					required: false, 
					editable: false,
					missingMessage: '必填字段', 
					width: 260,
					valueField: 'templateId',
					textField: 'templateName',
					url: '${request.contextPath}/epm/bom/template/listAll.htm'
							
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">所属项目群:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combobox" name="groupId" data-options="
					required: false, 
					editable: false,
					missingMessage: '必填字段', 
					width: 260,
					valueField: 'groupId',
					textField: 'groupName',
					url: '${request.contextPath}/epm/project/group/listAll.htm'
							
				" />
			</td>
	    </tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目开始时间</td>
			<td class="l-table-edit-td">
				<input class="easyui-datebox" type="text" name="startTime" data-options="
					required: true,
					editable: false,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 256]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目截止时间</td>
			<td class="l-table-edit-td">
				<input class="easyui-datebox" type="text" name="endTime" data-options="
					required: true,
					editable: false,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 256]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">责任单位:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combobox" name="departmentId" data-options="
					required: false, 
					editable: false,
					missingMessage: '必填字段', 
					width: 260,
					valueField: 'departmentId',
					textField: 'departmentName',
					url: '${request.contextPath}/sys/org/listOrg.htm', 
					onSelect: function(record) {
						var surl = '${request.contextPath}/sys/user/listUser.htm?departmentId=' + record.departmentId;
						$('#combobox').combobox('clear');
						$('#combobox').combobox('reload', surl);
					}	
							
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">责任人:</td>
			<td class="l-table-edit-td">		
				<input id="combobox" class="easyui-combobox" name="userId" data-options="
					required: false, 
					editable: false,
					missingMessage: '必填字段', 
					width: 260,
					valueField: 'userId',
					textField: 'trueName',
				
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="projectRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">项目背景:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="projectGround" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>		
	</table>
</form>