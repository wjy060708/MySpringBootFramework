<div class="easyui-layout" data-options="fit: true, border: false">
	<div data-options="region:'center', title: '${epmProjectAchie.achieTitle }', iconCls: 'icon-epm-document', border: false">
		<div id="achieViewer" class="easyui-panel" data-options="iniframe: true, fit: true, border: false,
			href: '${request.contextPath}/epm/project/achie/getViewer/${epmProjectAchie.achieId}.htm'
		">
		</div>
	</div>
	
    <div data-options="region:'east', collapsible: false, border: false" style="width: 250px;">
    	<div class="easyui-tabs" data-options="fit: true, border: false">
    		<div title="管理" data-options="iconCls: 'icon-epm-control-panel', fit: true, refreshable: false, border: false">
    			<div class="easyui-layout" data-options="fit: true">
					<div style="height: 210px;" data-options="region: 'north', title: '文档操作', border: false, iconCls: 'icon-epm-operation'">
    					<!-- 存储处理文档的ID号 -->
    					<input type="hidden" id="achieId" value="${epmProjectAchie.achieId }" />
    					
    					<!-- 下载原始文档 -->
						<div class="easyui-panel" data-options="border: false">
							<div class="easyui-menu" data-options="
								noline: true,
								inline: true,
								onClick: function(item) {
									var name = item.name;
									if(name) {
										if(name == 'fileDownload') {
											var achieId = $('#achieId').val();
											if(achieId) {
												var filename = '${epmProjectAchie.achieTitle }.${epmProjectAchie.documentExtension }';
												var sUrl = '${request.contextPath}/epm/project/achie/fileDownload/' + achieId + '.htm';
												download(sUrl, filename, 'application/x-msdownload');
											}
										} else if(name == 'pdfDownload') {
											var achieId = $('#achieId').val();
										
											var url = '${request.contextPath}/epm/project/achie/documentReady.jsn';
											$.get(url, {achieId: achieId}).done(function(responseData) {
												if(responseData.success) {
													var filename = '${epmProjectAchie.achieTitle }.pdf';
													var sUrl = '${request.contextPath}/epm/project/achie/pdfDownload/' + achieId + '.htm';
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