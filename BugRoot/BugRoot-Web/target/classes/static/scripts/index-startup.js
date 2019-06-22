(function($) {
	var startTimeMillis = new Date();
	
	$(function() {
		// 初始化导航菜单
		window.mainpage.initNavigationMenus();
		
		window.mainpage.bindNavTabsButtonEvent();
		window.mainpage.bindMainTabsButtonEvent();

		var layout = $("#mainLayout");

		$.util.delay(function() {
			layout.removeClass("hidden").layout("resize");

			$("#maskContainer").remove();

			var size = $.util.windowSize();
			//  判断当浏览器窗口宽度小于像素 1024时，右侧 region-panel 自动收缩
			if (size.width < 1024) {
				layout.layout("collapse", "west");
			}

			var endTimeMillis = new Date();
			
			$.messager.show({
				title: "操作提醒",
				msg : "页面加载耗时(毫秒)：" + $.date.diff(startTimeMillis, "ms", endTimeMillis),
				position : "bottomRight"
			});
		});
	});

})(jQuery);