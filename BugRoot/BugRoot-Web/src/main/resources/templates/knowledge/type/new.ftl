<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		 <tr>
			<td align="center" class="l-table-edit-td">所属分类:</td>
			<td class="l-table-edit-td">		
				<input class="easyui-combotree" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
					required: false,
					editable: false,
					missingMessage:'必填字段', 
					width: 260,
					url: '${request.contextPath}/knowledge/type/listAll.htm'
					
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">知识分类名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="typeName" data-options="
					required: true,
					missingMessage: '必填字段', 
					width: 260, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">分类图片:</td>	
			<td class="l-table-edit-td">
				<input name="imageUrl" class="easyui-euploadify" type="text" data-options="
					required: false,
					width: 260, 
					multi: false,
					auto: true,
					
					fileType: '*.jpg,*.png',
					
					uploader: '${request.contextPath}/uploadImage.jsn',
					onUploadSuccess: function (file, data, response) {
						var respObj = eval('(' + data + ')');
						if(respObj.success) {
								
								// 设置文件ID
								$(this).euploadify('setValue', respObj.data.imageUrl);
							} 
					}
				" />
			</td>
		</tr>
		<tr>
			<td align="center" class="l-table-edit-td">知识分类描述:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="typeRemark" data-options="
					multiline: true, 
					width: 260,
					height: 60, 
					validType:'length[0, 128]'" 
				/>
			</td>
		</tr>
	</table>
</form>