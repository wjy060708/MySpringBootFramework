<form method="post">
	<table cellpadding="5" cellspacing="1" class="l-table-edit">
		<tr>
			<td align="right" class="l-table-edit-td">类别名称:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="categoryName" data-options="
					required: true,
					prompt: '请填写数据字典类别名称',
					missingMessage: '数据字典类别名称必须填写', 
					width: 330, 
					validType:'length[1, 64]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">类别编码:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" type="text" name="categoryCode" data-options="
					prompt: '请填写数据字典类别编码',
					width: 330, 
					validType:'length[0, 16]'" 
				/>
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">上级类别:</td>
			<td class="l-table-edit-td">
				<input class="easyui-combotree" name="parentId" data-options="
					lines: true,
					dataPlain: true,
					parentField: 'parentId', 
					
					editable: false,
					prompt: '请填写上级数据字典类别',
					width: 330,
					url: '${request.contextPath}/sys/dict/category/listAll.htm'
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">类别序号:</td>
			<td class="l-table-edit-td">
				<input class="easyui-numberspinner" name="categoryOrder" data-options="
					required: true, 
					width: 330, 
					min: 1, 
					max: 999, 
					value: 1,
					prompt: '请填写数据字典类别序号',
					missingMessage: '数据字典类别序号必须填写'
				" />
			</td>
		</tr>
		<tr>
			<td align="right" class="l-table-edit-td">类别备注:</td>
			<td class="l-table-edit-td">
				<input class="easyui-textbox" name="categoryRemark" data-options="
					multiline: true, 
					width: 330,
					height: 60, 
					prompt: '请填写数据字典类别备注', 
					validType:'length[0, 256]'" 
				/>
			</td>
		</tr>
	</table>
</form>