<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">	
		<tr>
			<td align="center" class="l-table-edit-td">缺陷模式标题:</td>
			<td class="l-table-edit-td">
				<input id="modeName" class="easyui-textbox" type="text" name="modeName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 350, 
					validType:'length[1, 128]'" 
				/>
			</td>
		</tr>

		<tr>
			<td align="center" class="l-table-edit-td">所属知识分类:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combotree" name="typeId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 			
					required: false,
					editable: false,
					missingMessage:'必填字段', 
					width: 350,
					url: '${request.contextPath}/knowledge/type/listAll.htm'	
				" />
			</td>
		</tr>
		
		 <tr>
			<td align="center" class="l-table-edit-td">编辑权限:</td>
			<td class="l-table-edit-td">
				<select id="isEdit" class="easyui-combobox" name="isEdit"  style="width: 350px;" required="true" editable="false">
				    <option value>~请选择~</option>
				    <option value="0">创建人</option>
				    <option value="1">分类</option>
				    <option value="2">小组</option>
				</select>
			</td>
		</tr>
		
		 <tr>
			<td align="center" class="l-table-edit-td">阅读权限:</td>
			<td class="l-table-edit-td">
				<select id="isEdit" class="easyui-combobox" name="isRead"  style="width: 350px;"  required="true" editable="false">
				    <option value>~请选择~</option>
				    <option value="0">创建人</option>
				    <option value="1">分类</option>
				    <option value="2">小组</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">成果文件:</td>	
			<td class="l-table-edit-td">
				<input name="resourceId" class="easyui-euploadify" type="text" data-options="
					required: true,
					width: 350, 
					multi: false,
					auto: true,
					
					fileType: '*.doc,*.docx,*.pdf',
					
					uploader: '${request.contextPath}/sys/file/uploadfile.jsn',
					onUploadSuccess: function (file, data, response) {
						var respObj = eval('(' + data + ')');
						if(respObj) {
							if(respObj.success) {
								// 设置文件ID
								$(this).euploadify('setValue', respObj.data.fileId);
								
								// 设置成果名称，如果已经设置了名称，则不填写，否则自动填写
								var title = $('#modeName').textbox('getValue');
								if(title) {
									// 什么都不干
								} else {
									$('#modeName').textbox('setValue', respObj.data.fileName);
								}
							} 
						}
					}
				" />
			</td>
		</tr>
	    <tr>
			<td align="center" class="l-table-edit-td">缺陷模式作者:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="author" data-options="
					width: 350, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		
		<tr>
			<td align="center" class="l-table-edit-td">缺陷模式描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="modeRemark" data-options="
					multiline: true, 
					width: 350,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>