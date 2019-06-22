<form method="post">
	<input type="hidden" name="projectId" value="${projectInfo.projectId }" />
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">所属项目群:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" name="groupId" data-options="
					readonly: false,
					width: 260,
					valueField: 'groupId',
					textField: 'groupName',
					url: '${request.contextPath}/epm/project/group/listAll.htm',
					value: '${projectInfo.groupId }'
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">所属模板:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" name="templateId" data-options="
					readonly: false,
					width: 260,
					valueField: 'templateId',
					textField: 'templateName',
					url: '${request.contextPath}/epm/bom/template/listAll.htm',
					value: '${projectInfo.templateId }'
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">项目类型:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" name="typeId" data-options="
					readonly: false,
					width: 260,
					valueField: 'typeId',
					textField: 'typeName',
					url: '${request.contextPath}/epm/project/type/listAll.htm',
					value: '${projectInfo.typeId }'
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">项目名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="projectName" data-options="
					required: true,
					missingMessage:'必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
					value="${projectInfo.projectName }" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">项目序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="projectOrder" data-options="
					required: true, 
					width: 260, 
					min: 1, 
					max: 999,
					missingMessage: '必填字段'" 
					value="${projectInfo.projectOrder }" 
				/>
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
					value="${projectInfo.startTime }" 
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
					value="${projectInfo.endTime }" 
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
					}",	
					value="${projectInfo.departmentId }" 		
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
					textField: 'trueName'",

					value="${projectInfo.userId }" 	
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">项目描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="projectRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
					value="${projectInfo.projectRemark }" 
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
					value="${projectInfo.projectMonney }" 
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
					value="${projectInfo.projectGround }" 
				/>
			</td>
		</tr>		
	</table>
</form>