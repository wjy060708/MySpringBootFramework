(function () {
    
    var list1 = [
        {title: "搜索结果", type: 0},
        {title: "其他功能", type: 1},
        {title: "页面性能", type: 2},
        {title: "优化建议", type: 3}
    ];
    
    var list2 = [
        ["搜索无结果或结果太少", "搜不到想要的结果", "搜索结果排序问题", "搜索结果内容问题", "筛选排序有问题", "出现乱码"],
        ["左上角logo", "页面顶部问题", "广告相关问题"],
        ["响应时间过长", "经常打不开"],
        ["优化建议"]
    ];
    
    function loadScript(url, callback, opt) {
        var script = document.createElement("script");
        var opt = opt || {};
        script.type = "text/javascript";
        if (opt.charset) {
            script.charset = opt.charset;
        }
        if (opt.id) {
            script.id = opt.id;
        }

        if (script.readyState) {
            script.onreadystatechange = function() {
                if (script.readyState === "loaded" || script.readyState === "complete") {
                    script.onreadystatechange = null;
                    callback();
                }
            };
        } else {
            script.onload = function() {
                callback();
            };
        }
        script.src = url;
        document.body.appendChild(script);
    }
    
    function init_feedback () {
        if (bds && bds.qa && bds.qa.ShortCut && bds.qa.ShortCut.initRightBar) {
            var fb_styles = {
                product_id: 137,
                issuePlaceholder: "请您详细描述您碰到的问题或宝贵建议（400字以内），感谢您对百度站内搜索的支持�?",
                plugintitle: "意见反馈",
                emailTips: "联系方式（建议填写邮箱）",
                onlyUpFile: true
            };
            
            bds.qa.ShortCut.initRightBar(fb_styles);
            var tipsDom = $(".fb-tips-block").clone(true);
            tipsDom.find(".fb-content-tips").html("反馈类型");
            var menuDOM = '<div class="fb-tips-menu">';
            menuDOM = menuDOM + '<select class="fb-tips-select-1">';
            for (var i = 0; i < list1.length; i++) {
                menuDOM = menuDOM + '<option value=' + list1[i]["type"] + '>' + list1[i]["title"] + '</option>';
            }
            menuDOM = menuDOM + '</select><select class="fb-tips-select-2">';
            for (var j = 0; j < list2[0].length; j++) {
                menuDOM = menuDOM + '<option value=' + list2[0][j] + '>' + list2[0][j] + '</option>';
            }
            menuDOM = menuDOM + '</select></div>';
            if ($(".fb-tips-menu").length === 0) {
                $(".fb-tips-block").before(tipsDom).before(menuDOM);
            }
            
            var fb_datas = {
                'fb_product': 137,
                'other': list1[$(".fb-tips-select-1").val()]["title"] + "-" + $(".fb-tips-select-2").val()
            };
            bds.qa.ShortCut._getProData(fb_datas);
            $(".fb-tips-select-1").on("change", function () {
                var index = $(".fb-tips-select-1").val();
                var dom = '';
                for (var i = 0; i < list2[index].length; i++) {
                    dom = dom + '<option value=' + list2[index][i] + '>' + list2[index][i] + '</option>';
                }
                $(".fb-tips-select-2").html(dom);
                fb_datas['other'] = list1[$(".fb-tips-select-1").val()]["title"] + "-" + $(".fb-tips-select-2").val();
                bds.qa.ShortCut._getProData(fb_datas);
            });
            $(".fb-tips-select-2").on("change", function () {
                fb_datas['other'] = list1[$(".fb-tips-select-1").val()]["title"] + "-" + $(".fb-tips-select-2").val();
                bds.qa.ShortCut._getProData(fb_datas);
            });
        }
    }
    
    function loadRightBar () {
        if (window.bds) {
            init_feedback();
        } else {
            loadScript('http://f3.baidu.com/feedback/js/feedback/feedback0.0.2.js', function() {
                init_feedback();
            }, {
                charset: 'utf-8',
                id: 'feedback_script'
            });
        }
        return false;
    }
    
    function bind () {
        $("#bd-feedback").on("click", function() {
            loadRightBar();
        });
    }
    
    function init () {
        bind();
    }
    
    init();
})();

