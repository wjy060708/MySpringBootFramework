<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
	   <tr>
			<td align="center" class="l-table-edit-td">所属模板:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combobox" name="templateId" data-options="
					required: true, 
					editable: false,
					missingMessage: '必填字段', 
					width: 260,
					valueField: 'templateId',
					textField: 'templateName',
					url: '${request.contextPath}/epm/bom/template/listAll.htm',
					onSelect: function(record) {
						var surl = '${request.contextPath}/epm/bom/entry/listTemplateEntrys.htm?templateId=' + record.templateId;
						$('#combotree').combotree('clear');
						$('#combotree').combotree('reload', surl);
					}	
										
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">上级产品清单:</td>
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
			<td align="center" class="l-table-edit-td">产品清单名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="entryName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">产品清单描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="entryRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>