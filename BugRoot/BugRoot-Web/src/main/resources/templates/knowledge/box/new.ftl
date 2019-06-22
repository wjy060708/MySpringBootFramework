<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">缺陷模式名称:</td>
			<td class="l-table-edit-td">
				<input id="achieTitle" class="easyui-textbox" type="text" name="modeName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 480, 
					validType:'length[1, 128]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">缺陷模式作者:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="author" data-options="
					required: false, 
					width: 480,
					validType: 'length[0, 64]'"
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">开发准则文档:</td>	
			<td class="l-table-edit-td">
				<input name="resourceId" class="easyui-euploadify" type="text" data-options="
					required: true,
					width: 480, 
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
								var title = $('#achieTitle').textbox('getValue');
								if(title) {
									// 什么都不干
								} else {
									$('#achieTitle').textbox('setValue', respObj.data.fileName);
								}
							} 
						}
					}
				" />
			</td>
		</tr>
		
		<tr>
			<td align="right" class="l-table-edit-td">缺陷模式描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="achieRemark" data-options="
					multiline: true, 
					width: 480,
					height: 165, 
					validType:'length[0, 256]'" 
				/>
			</td>
		</tr>
	</table>
</form>