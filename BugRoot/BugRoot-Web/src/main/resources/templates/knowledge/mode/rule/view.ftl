<div class="easyui-layout" data-options="fit: true, border: false">
	<div data-options="region:'center', title: '${knowModeRule.modeName }', iconCls: 'icon-epm-document', border: false">
		<div id="ruleViewer" class="easyui-panel" data-options="iniframe: true, fit: true, border: false,
			href: '${request.contextPath}/knowledge/mode/rule/getViewer/${knowModeRule.ruleId}.htm'
		">
		</div>
	</div>
	
    <div data-options="region:'east', collapsible: false, border: false" style="width: 250px;">
    	<div class="easyui-tabs" data-options="fit: true, border: false">
    		<div title="管理" data-options="iconCls: 'icon-epm-control-panel', fit: true, refreshable: false, border: false">
    			<div class="easyui-layout" data-options="fit: true">
					<div style="height: 210px;" data-options="region: 'north', title: '文档操作', border: false, iconCls: 'icon-epm-operation'">
    					<!-- 存储处理文档的ID号 -->
    					<input type="hidden" id="ruleId" value="${knowModeRule.ruleId }" />
    					
    					<!-- 下载原始文档 -->
						<div class="easyui-panel" data-options="border: false">
							<div class="easyui-menu" data-options="
								noline: true,
								inline: true,
								onClick: function(item) {
									var name = item.name;
									if(name) {
										if(name == 'fileDownload') {
											var ruleId = $('#ruleId').val();

											if(ruleId) {
												var filename = '${knowModeRule.ruleTitle }.${knowModeRule.documentExtension }';
											
												var sUrl = '${request.contextPath}/knowledge/mode/rule/fileDownload/' + ruleId + '.htm';
												download(sUrl, filename, 'application/x-msdownload');
											}
										} else if(name == 'pdfDownload') {
											var ruleId = $('#ruleId').val();
										
											var url = '${request.contextPath}/knowledge/mode/rule/documentReady.jsn';
											$.get(url, {ruleId: ruleId}).done(function(responseData) {
												if(responseData.success) {
													var filename = '${knowModeRule.ruleTitle }.pdf';
													var sUrl = '${request.contextPath}/knowledge/mode/rule/pdfDownload/' + ruleId + '.htm';
													download(sUrl, filename, 'application/x-msdownload');
												} else {
													$.easyui.messager.alert('提示', '文档转换中,请您稍后下载!', 'info');
												}
											});
										}
									}
							    }
							" style="width:100%">
								<div data-options="name: 'fileDownload', iconCls:'icon-epm-download'">原始文档</div>
								<div data-options="name: 'pdfDownload', iconCls:'icon-download'">下载PDF文档</div>
							</div>
						</div>
	                </div>
                </div>
    		</div>
    	</div>
    </div>
</div>