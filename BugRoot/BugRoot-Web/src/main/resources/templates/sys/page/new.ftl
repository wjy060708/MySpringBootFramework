<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">所属模块:</td>
			<td class="l-table-edit-td">
				
				<input class="easyui-combobox" name="moduleId" data-options="
					required: true, 
					editable: false,
					missingMessage: '必填字段', 
					width: 350,
					valueField: 'moduleId',
					textField: 'moduleName',
					url: '${request.contextPath}/sys/module/listAll.htm',
					onSelect: function(record) {
						var surl = '${request.contextPath}/sys/page/listModulePages.htm?moduleId=' + record.moduleId;
						$('#combotree').combotree('clear');
						$('#combotree').combotree('reload', surl);
					}
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">上级页面:</td>
			<td class="l-table-edit-td">
				<input id="combotree" class="easyui-combotree" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
					required:false,
					editable: false,
					missingMessage:'必填字段', 
					width:350
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="pageName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width:350, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面图标:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="pageIcon" data-options="
					required: true,
					missingMessage:'必填字段', 
					width:350, 
					validType:'length[1, 64]'" 
					value="icon-hamburg-docs" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="pageOrder" data-options="
					required: true, 
					width:350, 
					min: 1, 
					max: 999, 
					value: 1,
					missingMessage:'必填字段'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面URL:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="pageURL" data-options="
					required: false, 
					width: 350, 
					validType: 'length[1, 128]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面密钥:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="pageToken" data-options="
					required: false, 
					width:350, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">页面描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="pageRemark" data-options="
					multiline: true, 
					width: 350,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>