//处理分类展示
//加载id为typeid的两层子分类到jqueryDom元素下[isLoadsub:是否继续加载子节炄1�7,currentLeveNum当前层级数]
	function loadTypes(jqueryDom,typeid,isLoadsub,currentLeveNum){
		var opentypes = new Array();
		//第一屄1�7 
		var html = new Array();
		$(types).each(function(i, obj) {
			if (obj.parentid == typeid) {
				html.push('<li><h5 class="showLableType'+obj.type+'"><a class="linkTitle linklevel'+currentLeveNum+'" id="'+obj.id+'"   onclick="clickType(this,'+obj.type+')">' + obj.name + '</a>');
				if (obj.num > 0) {
					html.push('<span class="farm_tree_num">',obj.num,'</span>');
				}
				//if(type_collapse_level<=currentLeveNum){
				if(isHaveSubType(obj.id)){
					html.push('<a class="glyphicon glyphicon-chevron-down farm_tree_flag ',obj.id,'" onclick="clickTreeFlag(this,'+currentLeveNum+',\''+obj.id+'\')"></a>');
					if(type_collapse_level>currentLeveNum){
						opentypes.push(obj.id);
					}
				}
				html.push('</h5><ul id="doc'+obj.id+'typeUl"></ul></li>');
			}
		});
		$('#loadingDivId').html("");
		$(jqueryDom).html("");
		$(jqueryDom).append(html.join(""));
		//--------------
		$(opentypes).each(function(i, obj) {
			$('.'+obj).click();
		});
	}
	//判断丢�个分类是否有子节炄1�7
	function isHaveSubType(typeId){
		var isHave=false;
		$(types).each(function(i, obj) {
			if (obj.parentid == typeId) {
				isHave=true;
				return false;
			}
		});
		return isHave;
	}
	//点击分类执行的事仄1�7
	function clickType(obj,type){
		if ($(obj).attr('id')) {
			window.location = basePath + "webtype/view"+ $(obj).attr('id') + "/Pub1.html";
		}
	}
	//点击折叠树的按钮
	function clickTreeFlag(obj,currentLeveNum,typeid){
		if ($(obj).parent().next().children().size() <= 0) {
			var jqueryDom = '#doc' + typeid + 'typeUl';
			loadTypes(jqueryDom, typeid, true, currentLeveNum+1);
			$(obj).parent().next().show();
			$(obj).removeClass("farm_tree_s");
			$(obj).addClass("farm_tree_h");
			$(obj).removeClass("glyphicon-chevron-down");
			$(obj).addClass("glyphicon-chevron-up");
		}else{
			var ul = $(obj).parent().next();
			if ($(ul).is(':hidden')) {
				$(obj).parent().next().show();
				$(obj).removeClass("farm_tree_s");
				$(obj).addClass("farm_tree_h");
				$(obj).removeClass("glyphicon-chevron-down");
				$(obj).addClass("glyphicon-chevron-up");
			} else {
				$(obj).parent().next().hide();
				$(obj).removeClass("farm_tree_h");
				$(obj).addClass("farm_tree_s");
				$(obj).removeClass("glyphicon-chevron-up");
				$(obj).addClass("glyphicon-chevron-down");
			}
		}
	}
	//折叠丢�个树节点 obj :class为farm_tree_flag的收缩按钄1�7
	function collapseTreeNode(obj){
		$(obj).parent().next().hide();
		$(obj).removeClass("farm_tree_h");
		$(obj).addClass("farm_tree_s");
		$(obj).removeClass("glyphicon-chevron-up");
		$(obj).addClass("glyphicon-chevron-down");
	}
	
	//默认打开的分类（初始化页面时打开的1�7,注意这里传入的是type的id＄1�7
	function clickOpenTreeFlag(typeId){
	    $('#'+typeId).addClass("active");
		$('.'+typeId).parent().next().show();
		$('.'+typeId).removeClass("farm_tree_s");
		$('.'+typeId).addClass("farm_tree_h");
		$('.'+typeId).removeClass("glyphicon-chevron-down");
		$('.'+typeId).addClass("glyphicon-chevron-up");
	}