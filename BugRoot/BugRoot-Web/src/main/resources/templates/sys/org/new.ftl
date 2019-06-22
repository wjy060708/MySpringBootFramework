<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">组织名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="departmentName" data-options="
					required: true,
					width: 330,
					missingMessage:'必填字段', 
					validType: 'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">组织类型:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combobox" type="text" name="departmentKind" data-options="
					required: true, 
					editable: false, 
					width: 330,
					valueField: 'id',
					textField: 'text',
					prompt: '请填写组织类型',
					missingMessage: '组织类型必须填写',
					value: 'ogn',
					data: [{
						id: 'ogn',
						text: '机构'
					}, {
						id: 'dpt',
						text: '部门'
					}],
					onSelect: function(record) {
						if(record.id == 'ogn') {	// 机构
							$.util.delay(function() {
								$('#parentId').combotree('clear');
								$('#parentId').combotree('disable');
							}, 100);
							
						} else {
							$.util.delay(function() {
								$('#parentId').combotree('enable');
							}, 100);
						}
					}
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">上级组织:</td>
			<td class="l-table-edit-td">
				<select class="easyui-combotree" id="parentId" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId',
					
					required: true,
					editable: false,
					missingMessage:'必填字段', 
					width: 330,
					url: '${ctx}/sys/org/listOrg.htm'
				">
				</select>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">组织排序:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="departmentOrder" data-options="
					required: true, 
					width: 330,
					min: 1, 
					max: 999, 
					value: 1,
					missingMessage:'必填字段'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">组织描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="departmentRemark" data-options="
					multiline: true,
					width: 330,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>