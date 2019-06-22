(function($) {
	$.util.namespace("mainpage.navigation");
	$.util.namespace("mainpage.mainTabs");

	var homePageTitle = "主页";
	var navMenuList = "#navMenu_list";
	var navMenuTree = "#navMenu_Tree";
	var mainTabs = "#mainTabs";
	var mainLayout = "#mainLayout";
	var westLayout = "#westLayout";
	var westCenterLayout = "#westCenterLayout";
	/**
	 * 依据子系统ID加载子系统功能菜单
	 */
	window.mainpage.loadSystemNavigation = function(moduleId) {
		$(navMenuList).find("a").attr("disabled", true);
		$.easyui.loading({
			locale: westCenterLayout
		});
		
		var t = $(navMenuTree);
		
		var url = 'sys/navigation/listPages.jsn';
		$.get(url, {moduleId: moduleId}, function (menus) {
            t.tree("loadData", menus);
        }, "json");
	};

	/**
	 * 加载用户授权访问的子系统
	 */
	window.mainpage.loadSubSystems = function(callback) {
		var ul = $(navMenuList).empty();
		
		var url = 'sys/navigation/listModules.jsn';
		$.get(url, function(menus) {
			$.each(window.mainpage.navigationData = menus = $.array.filter(menus, function(item) {
					return item.disabled ? false : true;
				}), function(i, item) {
					var li = $("<li></li>").appendTo(ul);
					var pp = $("<div></div>").addClass("panel-header panel-header-noborder").appendTo(li);
					var a = $("<a></a>").attr({
						href : "javascript:void(0);",
						target : "_self"
					}).hover(
						function() {
							a.addClass("tree-node-selected");
						}, function() {
							if (!a.hasClass("selected")) {
								$(this).removeClass("tree-node-selected");
							}
						}).click(
							function() {
								if (a.is(".tree-node-selected.selected") || a.attr("disabled")) {
									return;
								}
								ul.find("a").removeClass("tree-node-selected selected");
								a.addClass("tree-node-selected selected");
								window.mainpage.loadSystemNavigation(item.moduleId);
							}
						).appendTo(pp);
					
						$.data(a[0], "menu-item", item);
					
						$("<span class=\"l-btn-left l-btn-icon-left nav-menu\">"
							+ "<span class=\"l-btn-text\">"
							+ (item.moduleName ? item.moduleName : "无标题菜单导航")
							+ "</span>"
							+ "<span class=\"l-btn-icon"
							+ (item.moduleIcon ? " " + item.moduleIcon : "")
							+ "\"></span></span>").appendTo(a);
				}
			);
			
			var layout = $(westLayout);
			var south = layout.layout("panel", "south");
			var southOpts = south.panel("options");
			var border = south.panel("panel").border("top");
			var navHeight = 29;
			
			southOpts.minHeight = border + Math.min(menus.length, 3) * navHeight;
			southOpts.maxHeight = border + menus.length * navHeight;
			
			layout.layout("resize");
			
			if ($.isFunction(callback)) {
				callback.call(ul, menus);
			}
		}, "json");
	};

	/**
	 * 初始化功能导航菜单树，不加载数据
	 */
	window.mainpage.initNavigationTree = function() {
		var t = $(navMenuTree);
		if (t.isEasyUiComponent("tree")) {
			return;
		}
		t.tree({
			lines : true,
			dataPlain: true,
			
			onClick : function(node) {
				window.mainpage.addModuleTab(node);
			},
			
			onLoadSuccess : function(node, data) {
				$(navMenuList).find("a").removeAttr("disabled");
				$.easyui.loaded(westCenterLayout);
			}
		});
	};

	/**
	 * 加载用户授权访问的功能菜单
	 */
	window.mainpage.initNavigationMenus = function() {
		window.mainpage.loadSubSystems(function() {
			window.mainpage.initNavigationTree();
			
			var selectId = 11;
			if (window.mainpage.navigationData.length) {
				var list = $(navMenuList).find("a");
				if (!list.length) {
					return;
				}
				var menu = list.filter(function() {
					var item = $.data(this, "menu-item");
					return item && item.id == selectId;
				}), target = menu.length ? menu : list.eq(0);
				target.click();
			}
		});
	};

	window.mainpage.bindMainTabsButtonEvent = function() {
		$("#mainTabs_jumpHome").click(function() {
			window.mainpage.mainTabs.jumpHome();
		});
		$("#mainTabs_toggleAll").click(function() {
			window.mainpage.togglePanels();
		});
		$("#mainTabs_closeTab").click(function() {
			window.mainpage.mainTabs.closeCurrentTab();
		});
		$("#mainTabs_closeOther").click(function() {
			window.mainpage.mainTabs.closeOtherTabs();
		});
		$("#mainTabs_closeLeft").click(function() {
			window.mainpage.mainTabs.closeLeftTabs();
		});
		$("#mainTabs_closeRight").click(function() {
			window.mainpage.mainTabs.closeRightTabs();
		});
		$("#mainTabs_closeAll").click(function() {
			window.mainpage.mainTabs.closeAllTabs();
		});
	};

	window.mainpage.bindNavTabsButtonEvent = function() {
		$("#navMenu_refresh").click(function() {
			window.mainpage.refreshNavTab();
		});
	};

	window.mainpage.togglePanels = function() {
		$(mainLayout).layout("toggleAll", "collapse");
	};

	window.mainpage.addModuleTab = function(node) {
		var n = node || {};
		var attrs = node.attributes || {};
		var opts = $.extend({}, n, {
			title : n.text,
			href: n.url,
			iniframe: true
		}, attrs);
		
		if (!opts.href) {
			return;
		}
		window.mainpage.mainTabs.addModule(opts);
	};

	/**
	 * 判断指定的选项卡是否存在于当前主页面的选项卡组中
	 */
	window.mainpage.mainTabs.isExists = function(title, href) {
		var t = $(mainTabs);
		var tabs = t.tabs("tabs");
		
		var panel = $.array.first(tabs, function(val) {
			var opts = val.panel("options");
			return opts.title == title && opts.href == href;
		});
		
		if (panel && panel.length) {
			return true;
		} else {
			return false;
		}
	};

	/**
	 * tab页默认属性
	 */
	window.mainpage.mainTabs.tabDefaultOption = {
		title : "新建选项卡",
		href : "",
		iniframe : true,
		closable : true,
		refreshable : true,
		iconCls : "icon-standard-application-form",
		selected : true
	};
	
	/**
	 * 解析创建Tab的属性
	 */
	window.mainpage.mainTabs.parseCreateTabArgs = function(args) {
		var ret = {};
		if (!args || !args.length) {
			$.extend(ret, window.mainpage.mainTabs.tabDefaultOption);
		} else if (args.length == 1) {
			$.extend(ret, window.mainpage.mainTabs.tabDefaultOption, typeof args[0] == "object" ? args[0] : {href : args[0]});
		} else if (args.length == 2) {
			$.extend(ret, window.mainpage.mainTabs.tabDefaultOption, {
				title : args[0], 
				href : args[1]
			});
		} else if (args.length == 3) {
			$.extend(ret, window.mainpage.mainTabs.tabDefaultOption, {
				title : args[0], 
				href : args[1], 
				iconCls : args[2]
			});
		} else if (args.length == 4) {
			$.extend(ret, window.mainpage.mainTabs.tabDefaultOption, {
				title : args[0],
				href : args[1],
				iconCls : args[2],
				iniframe : args[3]
			});
		} else if (args.length == 5) {
			$.extend(ret, window.mainpage.mainTabs.tabDefaultOption, {
				title : args[0],
				href : args[1],
				iconCls : args[2],
				iniframe : args[3],
				closable : args[4]
			});
		} else if (args.length == 6) {
			$.extend(ret, window.mainpage.mainTabs.tabDefaultOption, {
				title : args[0],
				href : args[1],
				iconCls : args[2],
				iniframe : args[3],
				closable : args[4],
				refreshable : args[5]
			});
		} else if (args.length >= 7) {
			$.extend(ret, window.mainpage.mainTabs.tabDefaultOption, {
				title : args[0],
				href : args[1],
				iconCls : args[2],
				iniframe : args[3],
				closable : args[4],
				refreshable : args[5],
				selected : args[6]
			});
		}
		return ret;
	};

	/**
	 * 创建Tab页
	 */
	window.mainpage.mainTabs.createTab = function(title, href, iconCls, iniframe, closable, refreshable, selected) {
		var t = $(mainTabs);
		var opts = window.mainpage.mainTabs.parseCreateTabArgs(arguments);
		t.tabs("add", opts);
	};

	/**
	 * 添加一个新的模块选项卡；该方法重载方式如下:
	 * function (tabOption)
	 * function (href)
	 * function (title, href)
	 * function (title, href, iconCls)
	 * function (title, href, iconCls, iniframe)
	 * function (title, href, iconCls, iniframe, closable)
	 * function (title, href, iconCls, iniframe, closable, refreshable)
	 * function (title, href, iconCls, iniframe, closable, refreshable, selected)
	 */
	window.mainpage.mainTabs.addModule = function(title, href, iconCls, iniframe, closable, refreshable, selected) {
		var opts = window.mainpage.mainTabs.parseCreateTabArgs(arguments);
		var isExists = window.mainpage.mainTabs.isExists(opts.title, opts.href);
		
		if(isExists) {
			window.mainpage.mainTabs.jumeTab(opts.title, opts.href);
		} else {
			window.mainpage.mainTabs.createTab(opts);
		}
	};

	/**
	 * Tab页面跳转
	 */
	window.mainpage.mainTabs.jumeTab = function(title, href) {
		var t = $(mainTabs);
		var tabs = t.tabs("tabs");
		
		var panel = $.array.first(tabs, function(val) {
			var opts = val.panel("options");
			return opts.title == title && opts.href == href;
		});
		
		if (panel && panel.length) {
			var index = t.tabs("getTabIndex", panel);
			t.tabs("select", index);
		}
	};

	/**
	 * 跳转到Home主页
	 */
	window.mainpage.mainTabs.jumpHome = function() {
		var t = $(mainTabs);
		var tabs = t.tabs("tabs");
		var panel = $.array.first(tabs, function(val) {
			var opts = val.panel("options");
			return opts.title == homePageTitle;
		});
		if (panel && panel.length) {
			var index = t.tabs("getTabIndex", panel);
			t.tabs("select", index);
		}
	};

	/**
	 * 跳转Tab页面
	 */
	window.mainpage.mainTabs.jumpTab = function(which) {
		$(mainTabs).tabs("jumpTab", which);
	};

	/**
	 * 关闭Tab页面
	 */
	window.mainpage.mainTabs.closeTab = function(which) {
		$(mainTabs).tabs("close", which);
	};

	/**
	 * 关闭当前Tab页面
	 */
	window.mainpage.mainTabs.closeCurrentTab = function() {
		var t = $(mainTabs), index = t.tabs("getSelectedIndex");
		return t.tabs("closeClosable", index);
	};

	/**
	 * 关闭其他Tab页面
	 */
	window.mainpage.mainTabs.closeOtherTabs = function(index) {
		var t = $(mainTabs);
		if (index == null || index == undefined) {
			index = t.tabs("getSelectedIndex");
		}
		return t.tabs("closeOtherClosable", index);
	};

	/**
	 * 关闭左边Tab页面
	 */
	window.mainpage.mainTabs.closeLeftTabs = function(index) {
		var t = $(mainTabs);
		if (index == null || index == undefined) {
			index = t.tabs("getSelectedIndex");
		}
		return t.tabs("closeLeftClosable", index);
	};

	/**
	 * 关闭右边Tab页面
	 */
	window.mainpage.mainTabs.closeRightTabs = function(index) {
		var t = $(mainTabs);
		if (index == null || index == undefined) {
			index = t.tabs("getSelectedIndex");
		}
		return t.tabs("closeRightClosable", index);
	};

	/**
	 * 关闭所有Tab页面，主页Tab除外
	 */
	window.mainpage.mainTabs.closeAllTabs = function() {
		return $(mainTabs).tabs("closeAllClosable");
	};

	window.mainpage.refreshNavTab = function() {
		window.mainpage.navigation.refreshNav();
	};

	window.mainpage.navigation.refreshNav = function() {
		window.mainpage.initNavigationMenus();
	};
})(jQuery);