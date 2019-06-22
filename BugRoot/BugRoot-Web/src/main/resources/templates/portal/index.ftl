<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>[基于缺陷模式知识库管理系统]</title>
		<!-- 系统图标 -->
		<link href="${request.contextPath}/images/favicon.ico" rel="icon" type="image/x-icon" />
		
		<!-- jquery -->
		<script src="${request.contextPath}/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.utils.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-extensions/jquery.json-2.4.min.js" type="text/javascript"></script>
		
		<!-- jquery-easyui -->
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/bootstrap/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/styles/icons/icon-all.css" />
		
		<script src="${request.contextPath}/plugins/jeasyui-1.5/jquery.easyui.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-1.5/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	    
	    <!-- jquery-plugins -->
	    <script src="${request.contextPath}/plugins/jquery-plugins/uploadifive/jquery.uploadifive.min.js" type="text/javascript"></script>
	    <script src="${request.contextPath}/plugins/jquery-plugins/download/download.min.js" type="text/javascript"></script>
	    
	    <!-- jquery-easyui-extensions -->
		<link href="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.css" rel="stylesheet" type="text/css" />
		
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.messager.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.form.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.tree.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.panel.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.dialog.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.datagrid.min.js" type="text/javascript"></script>
		
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.menu.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.toolbar.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.tabs.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.tabs.contextMenu.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.layout.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.combotree.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.gridselector.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.comboselector.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.progressbar.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.euploadify.min.js" type="text/javascript"></script>
		 
	    <link href="${request.contextPath}/styles/index.css" rel="stylesheet" />
	    
	    <script src="${request.contextPath}/scripts/index.js" type="text/javascript"></script>
	    <script src="${request.contextPath}/scripts/index-startup.js" type="text/javascript"></script>
	</head>
	<body>
		<div id="maskContainer">
	        <div class="datagrid-mask" style="display: block;"></div>
	        <div class="datagrid-mask-msg" style="display: block; left: 50%; margin-left: -52.5px;">加载数据中,请稍后...</div>
	    </div>

	    <div id="mainLayout" class="easyui-layout hidden" data-options="fit: true">
	        <div id="northPanel" data-options="region: 'north', border: false, split: false" style="height: 50px; padding: 0; margin:0; overflow: hidden; background: #f2f2f2;">
	            <div class="top-bar">
	                <div class="top-bar-left"></div>
	                <div class="top-bar-right">
						<a href="#" class="easyui-menubutton" data-options="plain: true, menu:'#sysMenu', iconCls:'icon-standard-user'">${userinfo.trueName}</a>
						<a href="#" id="logout" class="easyui-linkbutton" data-options="plain: true, iconCls:'icon-standard-logout'">注销</a>
						<div id="sysMenu" style="width:100px;">
					    	<!-- <div id="viewUserInfo" data-options="iconCls:'icon-standard-user-info'">个人信息</div> -->
							<div id="editPassword" data-options="iconCls:'icon-standard-key'">修改密码</div>
							<div id="loginOut" data-options="iconCls:'icon-standard-logout'">退出登录</div>
						</div>
	                </div>
	            </div>
	        </div>
	
	        <div data-options="region: 'west', title: '菜单导航栏', iconCls: 'icon-standard-map', split: true, minWidth: 200, maxWidth: 200" style="width: 200px; padding: 1px;">
	            <div id="navTabs_tools" class="tabs-tool">
	                <table>
	                    <tr>
	                        <td><a id="navMenu_refresh" class="easyui-linkbutton easyui-tooltip" title="刷新该选项卡及其导航菜单" data-options="plain: true, iconCls: 'icon-standard-refresh'"></a></td>
	                    </tr>
	                </table>
	            </div>
	            <div id="navTabs" class="easyui-tabs" data-options="fit: true, border: false, tools: '#navTabs_tools'">
	                <div data-options="title: '导航菜单', iconCls: 'icon-standard-application-view-tile', refreshable: false, selected: true">
	                    <div id="westLayout" class="easyui-layout" data-options="fit: true">
	                        <div data-options="region: 'center', border: false">
	                        	<div id="westCenterLayout" class="easyui-layout" data-options="fit: true">
		                            <div data-options="region: 'center', border: false">
	                                    <ul id="navMenu_Tree" style="padding: 5px"></ul>
	                                </div>
                                </div>
	                        </div>
	                        <div id="westSouthPanel" data-options="region: 'south', border: false, split: false, minHeight: 32, maxHeight: 275" style="height: 275px; border-top-width: 1px;">
	                            <ul id="navMenu_list"></ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <div data-options="region: 'center'" style="padding: 1px;">
	            <div id="mainTabs_tools" class="tabs-tool">
	                <table>
	                    <tr>
	                        <td><a id="mainTabs_jumpHome" class="easyui-linkbutton easyui-tooltip" title="主页选项卡" data-options="plain: true, iconCls: 'icon-standard-home'"></a></td>
	                        <td><div class="datagrid-btn-separator"></div></td>
	                        <td><a id="mainTabs_toggleAll" class="easyui-linkbutton easyui-tooltip" title="选项卡最大化" data-options="plain: true, iconCls: 'icon-standard-arrow-inout'"></a></td>
	                        <td><div class="datagrid-btn-separator"></div></td>
	                        <td><a id="mainTabs_closeTab" class="easyui-linkbutton easyui-tooltip" title="关闭当前选项卡" data-options="plain: true, iconCls: 'icon-standard-application-form-delete'"></a></td>
	                        <td><a id="mainTabs_closeOther" class="easyui-linkbutton easyui-tooltip" title="关闭其他选项卡" data-options="plain: true, iconCls: 'icon-standard-cancel'"></a></td>
	                        <td><div class="datagrid-btn-separator"></div></td>
	                        <td><a id="mainTabs_closeLeft" class="easyui-linkbutton easyui-tooltip" title="关闭左侧选项卡" data-options="plain: true, iconCls: 'icon-standard-tab-close-left'"></a></td>
	                        <td><a id="mainTabs_closeRight" class="easyui-linkbutton easyui-tooltip" title="关闭右侧选项卡" data-options="plain: true, iconCls: 'icon-standard-tab-close-right'"></a></td>
	                        <td><div class="datagrid-btn-separator"></div></td>
	                        <td><a id="mainTabs_closeAll" class="easyui-linkbutton easyui-tooltip" title="关闭所有选项卡" data-options="plain: true, iconCls: 'icon-standard-cross'"></a></td>
	                    </tr>
	                </table>
	            </div>
	            
	            <div id="mainTabs" class="easyui-tabs" data-options="fit: true, border: false, tools: '#mainTabs_tools'">
	                <div data-options="
	                	title: '主页', 
	                	iconCls: 'icon-standard-home', 
	                	refreshable: false,
	                	iniframe : true,
	                	refreshable: true,
	                	href: '${request.contextPath}/main.htm'
	                ">
	                </div>
	            </div>
	        </div>
	        
	        <div data-options="region:'south',border:false" style="height: 24px;">
				<div class="footer">
					BugRoot v1.0.1  版权所有 &copy; 2012 - ${.now?string("yyyy")}. 保留一切权利.推荐使用Chrome或Firefox浏览器.
				</div>
			</div>
	    </div>
	    
		<script type="text/javascript">
			$(function() {
				$.ajaxSetup({
                	complete: function(XMLHttpRequest, textStatus) {
						var ajaxResponseHeader = XMLHttpRequest.getResponseHeader("Ajax-Response-Header");
						if(ajaxResponseHeader == 'timeout') {
							$.easyui.messager.alert('提示', '尚未登录或登录超时,请重新登录!','info', function() {
								top.location = '${request.contextPath}/login.htm';	
							});
						} else if(ajaxResponseHeader == 'unAuthorized') {
							$.easyui.messager.alert('提示', '很抱歉,您未授权进行该操作!','info');
						}
					}
            	});
				
				$('#editPassword').click(function() {
					$.easyui.showDialog({
						title: '修改密码',
						width: 325,
					    height: 200, 
	                    topMost: false,
	                    enableApplyButton: false,
	                    resizable: false,
	                    href:'${request.contextPath}/sys/user/editpwd.htm',
	                    
	                    onSave: function (d) {
	                    	var validate = d.form("validate");
	                    	if(validate) {
	                    		d.form('submit', {
	                    				url: '${request.contextPath}/sys/user/modifyPassword.jsn',
	                    				success: function(response) {
	                    					if(response) {
	                    						if(response.success) {
		    										$.easyui.messager.alert('提示', '修改密码成功，请重新登录!', 'info', function() {
		    											location.href = "${request.contextPath}/logout.htm";
		    										});
		    									} else {
		    										$.easyui.messager.alert('提示', response.message, 'info');
		    									}
	                    					}
	                    				}
	                    			}
	                    		);
	                    	} else {
	                    		return false;
	                    	}
	                    }
	                });
				});

				$('#logout').click(function() {
					logout();
				});
				
				$('#loginOut').click(function() {
					logout();
				});
			});
			
			function logout() {
				$.easyui.messager.confirm('确认对话框', '您确定要退出本次登录吗?', function(ret) {
					if (ret) {
						location.href = "${request.contextPath}/logout.htm";
					}
				});
			}
		</script>
	</body>
</html>