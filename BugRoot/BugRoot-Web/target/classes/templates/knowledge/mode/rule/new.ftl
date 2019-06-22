<form method="post">
	<input type="hidden" name="entryId" value="${epmBOMEntry.entryId }" />
	<input type="hidden" name="projectId" value="${epmProjectInfo.projectId }" />
	
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="center" class="l-table-edit-td">缺陷分类:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combotree" name="typeId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
					required: false,
					editable: false,
					missingMessage:'必填字段', 
					width: 400,
					url: '${request.contextPath}/knowledge/type/listAll.htm',
					onSelect: function(record) {
						var surl = '${request.contextPath}/knowledge/mode/listAll1.htm?typeId=' + record.typeId;
						$('#combobox').combobox('clear');
						$('#combobox').combobox('reload', surl);
					}	
					
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">缺陷模式:</td>
			<td class="l-table-edit-td">
				<input id="combobox" class="easyui-combobox" name="modeId" data-options="
					lines: true,
					dataPlain: true,
			
					valueField: 'modeId',
					textField: 'modeName',			
					required:false,
					editable: false,
					missingMessage:'必填字段', 
					width:400
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">规则标题:</td>
			<td class="l-table-edit-td">
				<input id="ruleTitle" class="easyui-textbox" type="text" name="ruleTitle" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 400, 
					validType:'length[1, 128]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">规则文件:</td>	
			<td class="l-table-edit-td">
				<input name="resourceId" class="easyui-euploadify" type="text" data-options="
					required: true,
					width: 400, 
					multi: false,
					auto: true,
					
					fileType: '*.doc,*.docx,*.pdf',
					
					uploader: '${request.contextPath}/sys/file/upload.jsn',
					onUploadSuccess: function (file, data, response) {
						var respObj = eval('(' + data + ')');
						if(respObj) {
							if(respObj.success) {
								
								// 设置文件ID
								$(this).euploadify('setValue', respObj.data.fileId);
								
								// 设置成果名称，如果已经设置了名称，则不填写，否则自动填写
								var title = $('#ruleTitle').textbox('getValue');
								if(title) {
									// 什么都不干
								} else {
									$('#ruleTitle').textbox('setValue', respObj.data.fileName);
								}
							} 
						}
					}
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">缺陷规则:</td>
			<td class="l-table-edit-td">
				<input id="achieTitle" class="easyui-textbox" type="text" name="ruleContent" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 400, 
					height: 150,
					multiline: true, 
					validType:'length[1, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>