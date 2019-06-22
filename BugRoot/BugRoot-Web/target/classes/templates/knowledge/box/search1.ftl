<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>_搜索 - Useit 知识库站内搜索</title>
	
	    <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_20_common.css?aWH" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_20_portal_index.css?aWH" />
		<link href="${request.contextPath}/useit/search/css/default.css?v=0.9" rel="stylesheet" type="text/css" />
	
		<script src="${request.contextPath}/plugins/jquery/jquery-2.1.1.min.js"></script>
		<script type="text/javascript">
			var jq = jQuery.noConflict();
		</script>
		<script src="${request.contextPath}/useit/js/index.js" type="text/javascript" type="text/javascript"></script>
	    <script src="${request.contextPath}/useit/js/slides.js" type="text/javascript" type="text/javascript"></script>
	
		<script type="text/javascript" src="${request.contextPath}/useit/search/js/baidu-ajax.js"></script>	
		<script type="text/javascript" src="${request.contextPath}/useit/search/js/static.js"></script>	
	</head>
	
	<body>
	    <!--网站头部 -->
		<div id="hd">
			<div class="wp">			
				<div class="hdc cl">
					<h2>
						<a href="${request.contextPath}/knowledge/box/index.htm" title="Useit 知识库">
							<img src="${request.contextPath}/useit/images/logo.png" height="100px" border="0" title="Useit 知识库">
						</a>
					</h2>
				</div>
			</div>
			<!--导航栏 -->
			<div class="deanheader" id="deanheader">
				<div class="w1000">
					<#include "${request.contextPath}/knowledge/nav/head.ftl">				
				</div>
			</div>
		</div>
		
		<!--搜索框 -->
	    <div id="wrap" style="position: relative;margin-left:280px;">
			<div id="head" style="" class="clearfix">
				<div class="s_nav" style="">
					<a href="${request.contextPath}/knowledge/index.htm" class="s_logo"> 
					  <img src="${request.contextPath}/useit/images/logo.png" border="0" id="logo">
					</a>
				</div>
				
				<div class='fl mt45'>
					<form name="f" action="search" class="fm">
						<span class="s_ipt_wr_pre">
						  <input name="q" id="kw" class="s_ipt" value="" maxlength="100" autocomplete="off" style=""> 
						</span> 
						
						<span class="s_btn_wr_after">
							<input type="button" id="baidusu" value="开始检索" class="s_btn_after" onmousedown="this.className = 's_btn_after s_btn_h'" onmouseout="this.className = 's_btn_after'" onclick="baidusearch('kw');">
						</span>
					</form>
				</div>
			</div>
		
			<script type="text/javascript">
                document.getElementById('logo').onload = function() {
           			var w = this.offsetWidth,
                    h = this.offsetHeight;
                    
           			if (w > 160 || h > 50) {
                		if (w / h > 3.2) {
                   			this.width = 160;
               			}   else {
                   			 this.height = 50;
               			    }
           			}
        		}
	        </script>
	        <div id="pt" class="bm cl">
				<div class="z">
					<a href="" class="nvhm" title="首页">Useit 知识库</a><em>&raquo;</em>
					<a href="javascript:cse.util.select('stp','1','type')">标题搜索</a><em>&rsaquo;</em>					
					<a href="javascript:void(0)">全部时间</a><em>&rsaquo;</em>
					<a href="javascript:cse.util.select('sti','4320','time')">72小时内</a><em>&rsaquo;</em>
					<a href="javascript:cse.util.select('sti','43200','time')">30天内</a><em>&rsaquo;</em>
					<a href="javascript:cse.util.select('sti','80640','time')">8周内</a><em>&rsaquo;</em>
					<a href="javascript:cse.util.select('sti','345600','time')">8个月内</a>
				</div>
			</div>
			<br>
			<div id="container" class="clearfix">
				<div id="center" class="content" style="">
					<div id="results" class="content-main" style="">
						<span class="support-text-top">为您找到相关结果<strong style="color:red;">${count}</strong>个</span>
                     
                   		<!-- 主显示布局  -->
							<div id="framesQ3cKQ" class="frame move-span cl frame-1">								
								<div id="framesQ3cKQ_left" class="column frame-1-c">
									<div id="framesQ3cKQ_left_temp" class="move-span temp"></div>
									<div id="portal_block_1950" class="block move-span">
										<div id="portal_block_1950_content" class="dxb_bc">
                                        	<ul>
												<li class=" bgfff top15 ">
													<div class="deanarticec">
														<div class="deanarticer">
															<div class="deanarticername">
																<div class="top">
																	<span class="font">推荐</span><span class="tri"></span>
																</div>
																<a
																	href="1"
																	target="_blank">麦肯锡：中国银行业CEO季刊——2018年冬季刊</a>
															</div>
															<div class="clear"></div>
															<div class="deanboxrsummary">本期季刊是专为踏上数字化创新之路的国内银行量</div>
															<div class="deanarticertag">
																<div class="deanarticerforum">
																	知识分类：<a
																		href="https://www.useit.com.cn/forum-274-1.html"
																		target="_blank">需求分析阶段</a>
																</div>
																<div class="clear"></div>
															</div>
														</div>
														<div class="clear"></div>
													</div>
												</li> 
												<hr>
												<li class=" bgfff top15 ">
													<div class="deanarticec">
														<div class="deanarticer">
															<div class="deanarticername">
																<div class="top">
																	<span class="font">推荐</span><span class="tri"></span>
																</div>
																<a
																	href="1"
																	target="_blank">麦肯锡：中国银行业CEO季刊——2018年冬季刊</a>
															</div>
															<div class="clear"></div>
															<div class="deanboxrsummary">本期季刊是专为踏上数字化创新之路的国内银行量</div>
															<div class="deanarticertag">
																<div class="deanarticerforum">
																	知识分类：<a
																		href="https://www.useit.com.cn/forum-274-1.html"
																		target="_blank">需求分析阶段</a>
																</div>
																<div class="clear"></div>
															</div>
														</div>
														<div class="clear"></div>
													</div>
												</li>
												<hr> 
												<li class=" bgfff top15 ">
													<div class="deanarticec">
														<div class="deanarticer">
															<div class="deanarticername">
																<div class="top">
																	<span class="font">推荐</span><span class="tri"></span>
																</div>
																<a
																	href="1"
																	target="_blank">麦肯锡：中国银行业CEO季刊——2018年冬季刊</a>
															</div>
															<div class="clear"></div>
															<div class="deanboxrsummary">本期季刊是专为踏上数字化创新之路的国内银行量</div>
															<div class="deanarticertag">
																<div class="deanarticerforum">
																	知识分类：<a
																		href="https://www.useit.com.cn/forum-274-1.html"
																		target="_blank">需求分析阶段</a>
																</div>
																<div class="clear"></div>
															</div>
														</div>
														<div class="clear"></div>
													</div>
												</li><hr>
												<li class=" bgfff top15 ">
													<div class="deanarticec">
														<div class="deanarticer">
															<div class="deanarticername">
																<div class="top">
																	<span class="font">推荐</span><span class="tri"></span>
																</div>
																<a
																	href="1"
																	target="_blank">麦肯锡：中国银行业CEO季刊——2018年冬季刊</a>
															</div>
															<div class="clear"></div>
															<div class="deanboxrsummary">本期季刊是专为踏上数字化创新之路的国内银行量</div>
															<div class="deanarticertag">
																<div class="deanarticerforum">
																	知识分类：<a
																		href="https://www.useit.com.cn/forum-274-1.html"
																		target="_blank">需求分析阶段</a>
																</div>
																<div class="clear"></div>
															</div>
														</div>
														<div class="clear"></div>
													</div>
												</li>									 
											</ul>
										</div>
									</div>
								</div>
							</div>
					</div>
				</div>
			
				<div class="extra">
					<div id="right">
						<div class="eRight">
							<div id="cpro_u2971587_2">
								<script type="text/javascript" src="http://pos.baidu.com/acom?di=u2971587&dtm=BAIDU_CPRO_SETJSONADSLOT&dcb=union_set_client"></script>
								<script type="text/javascript" src="http://cpro.baidustatic.com/cpro/ui/cse.js"></script>
									
								<script type="text/javascript">
					                var dpClient = {};
					                var dpClientDomain = "www.useit.com.cn"; // 需要加上domain
					                var tempData = {
					                    n: union_client,    // 增加计费名
					                    tu: "u2971587_2",
					                    tn: "template_inlay_all_normal",
					                    //只显示图片
					                    at: "image",
					                    //广告高度
					                    conH: 250, //容器高度, 可以随便改变
					                    rsi1: 250, //物料的高度, 不可以随便改变
					                    //广告宽度
					                    conW: 300, //容器宽度, 可以随便改变            
					                    rsi0: 300, //物料的宽度, 不可以随便改变
					                    //广告数量
					                    adn: 1,
					                    hn: 1,
					                    wn: 1
					                };
					                custInlayRender(tempData);
					                tempData = null;
					            </script>
						 	</div>
					   </div>
					</div>
				</div>
			</div>
	    </div>
		
		<div id="footer" class="clearfix" style="margin-left:430px;">
			<div class="pager clearfix" id="pageFooter">
				<strong>
					<span class="fk fk_cur"><i class="c-icon c-icon-bear-p"></i></span> 
					<span class="pager-current-foot">1</span>
				</strong>
				
				<a href="search?q=&p=1&s=7114562753949710140">
					<span class="fk fkd"><i class="c-icon c-icon-bear-pn"></i></span>
					<span class="pager-normal-foot">2</span>
				</a> 
				
				<a href="search?q=&p=2&s=7114562753949710140">
					<span class="fk"><i class="c-icon c-icon-bear-pn"></i></span> 
					<span class="pager-normal-foot">3</span>
				</a>
				
				<a href="search?q=&p=3&s=7114562753949710140"> 
					<span class="fk fkd"> <i class="c-icon c-icon-bear-pn"></i> </span>
					<span class="pager-normal-foot">4</span>
				</a> 
				<a href="search?q=&p=4&s=7114562753949710140"> 
					<span class="fk"><i class="c-icon c-icon-bear-pn"></i></span> 
					<span class="pager-normal-foot">5</span>
				</a> 
				
				<a href="search?q=&p=5&s=7114562753949710140">
					<span class="fk fkd"> <i class="c-icon c-icon-bear-pn"></i></span>
					<span class="pager-normal-foot">6</span>
				</a> 
				
				<a href="search?q=&p=6&s=7114562753949710140"> 
					<span class="fk"><i class="c-icon c-icon-bear-pn"></i></span> 
					<span class="pager-normal-foot">7</span>
				</a> 
				<a href="search?q=&p=7&s=7114562753949710140"> 
					<span class="fk fkd"> <i class="c-icon c-icon-bear-pn"></i></span> 
					<span class="pager-normal-foot">8</span>
				</a> 
				
				<a href="search?q=&p=8&s=7114562753949710140"> 
					<span class="fk"><i class="c-icon c-icon-bear-pn"></i></span> 
					<span class="pager-normal-foot">9</span>
				</a> 
				
				<a href="search?q=&p=9&s=7114562753949710140"> 
					<span class="fk fkd"> <i class="c-icon c-icon-bear-pn"></i> </span> 
					<span class="pager-normal-foot">10</span>
				</a> 
				
				<a href="search?q=&p=1&s=7114562753949710140" class="pager-next-foot n">下一页&gt;</a>
				
			</div>
		</div>
		
		<#include "${request.contextPath}/knowledge/nav/foot.ftl">
		
		<script type="text/javascript">
			(function () {
			    $("#kw2").focus(function () {
			        $(".bottom-box-tips").hide();
			    });
			    
			    $("#kw2").blur(function () {
			        $(".bottom-box-tips").show();
			    });
			    
			})();
       </script>

	   <script type="text/javascript" src="${request.contextPath}/useit/search/js/feedback.js"></script>
	   <script>
			var cse = cse || {};		
			cse.param = {
				'filters' : [] || {},
				'sorts' : "" || "",
				'searchType' : 0 || "",
				'searchTimeRange' : 0 || "",
				'nsid': "0",
				'inurl':null || "",
	            'cid':null || "",
	            'wt': null || "",
	            'ht': null || "",
	            'pn': null || ""
			};		
			cse.util = {
				'makeParam' : function(arr){
					var sb = [];
					for(var key in arr){
						if (arr[key] && typeof(arr[key])!="function"){
							sb.push(key+"="+encodeURIComponent(arr[key]));
						}
					}
					return sb.join("&");
				},
				'addParam' : function(dom,key,value){
					if(dom && key && value){
						var ipt = document.createElement("input");
						ipt.type = "hidden";
						ipt.name = key;
						ipt.value = value;
						dom.appendChild(ipt);
					}
				},				
				'select' : function(k,v,action){				
					if (action == "filter") {
						cse.param.filters[k] = v;
					}else if(action == "sort") {
						cse.param.sorts = v;
					}else if(action == "type") {
						cse.param.searchType = v;
					}else if(action == "time") {
						cse.param.searchTimeRange = v;
					}
					var filterValue = cse.util.makeParam(cse.param.filters);
					var f3 = document.getElementById("f3");
					cse.util.addParam(f3,"flt",filterValue);
					cse.util.addParam(f3,"srt",cse.param.sorts);
					cse.util.addParam(f3,"stp",cse.param.searchType);
					cse.util.addParam(f3,"sti",cse.param.searchTimeRange);
					cse.util.addParam(f3,"nsid",cse.param.nsid);
					cse.util.addParam(f3,"inurl",cse.param.inurl);
	                cse.util.addParam(f3,"cid",cse.param.cid);
	                cse.util.addParam(f3,"wt",cse.param.wt);
	                cse.util.addParam(f3,"ht",cse.param.ht);
	                cse.util.addParam(f3,"pn",cse.param.pn);
									f3.submit();
				},
				'switchFilter':function(obj){
					var id = obj.getAttribute("data-for"),
						exp = (obj.getAttribute("data-exp")=="0"),
						con = document.getElementById("flt-"+id),
						flts = con.getElementsByTagName("DD");
					for (var i=0,len=flts.length;i<len;i++){
					var flt = flts[i];
						if (exp) {
							flt.style.display = "block";
						}else {
							if (flt.getAttribute("data-limit")=="1"){
								flt.style.display = "none";
							}
						}	
					}
					obj.setAttribute("data-exp",exp?"1":"0");
					obj.className = exp?"filterLimitExp":"filterLimit";
				}
			};
	
	        function calcPageHeight(doc) {
	            var cHeight = Math.max(doc.body.clientHeight, doc.documentElement.clientHeight);
	            var sHeight = Math.max(doc.body.scrollHeight, doc.documentElement.scrollHeight);
	            var height  = Math.max(cHeight, sHeight);
	            return height.toString();
	        };
	
			window.onload = function(){
			
	            document.forms[0].reset();
	            document.forms[document.forms.length-1].reset();
	            if (top && top.location !== self.location) {
	                if ((navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE7.0") ||
	                        (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion .split(";")[1].replace(/[ ]/g,"")=="MSIE6.0")) {
	                    if (top.name) {
	                        top.name = calcPageHeight(document);
	                    }
	                }
	                else {
	                    if (top.postMessage) {
	                        window.attachEvent ? window.attachEvent('onmessage', function (event) {
	                            top.postMessage(calcPageHeight(document), '*');
	                        }) : window.addEventListener('message', function (event) {
	                            top.postMessage(calcPageHeight(document), '*');
	                        }, false);
	                        top.postMessage(0, '*');
	                    }
	                    else if (top.name) {
	                        top.name = calcPageHeight(document);
	                    }
	                }
	            }
	
	            if ($('.iframe-result').length > 0) {
	                var pageLog = {};
	                log.send("/api/customsearch/click", pageLog, {
	                    logType: 'framerec-show',
	                    queryType: '',
	                    resultNum: $('.iframe-result').length,
	                    imgNum: $('.iframe-image').length,
	                    q: ''
	                });
	            }
	        };
	        $('.iframe-result a').on('click', function () {
	            var pageLog = {};
	            log.send("/api/customsearch/click", pageLog, {
	                logType: 'framerec-click',
	                queryType: '',
	                hasImg: $(this).parents('.iframe-result').find('.iframe-image').length > 0 ? 1 : 0,
	                q: ''
	            });
	        });
	        $('.iframe-container').ready(function () {
	            if ($('.iframe-content-image').length > 0) {
	                $('.iframe-content-image').width($('.iframe-container').width() - 122);
	            }
	        });
	        $(".result a").click(function () {
	            var pageLog = {};
	                            pageLog["s"] = "7114562753949710140";
	                            pageLog["isNeedCheckDomain"] = "1";
	                        log.send("/api/customsearch/click", pageLog, {
	                rpos: parseInt($(this).parents(".result").index(".result"))+1,
	                uid: encodeURIComponent($(this).attr("href")),
	                tid: "0",
	                cpos: $(this).attr("cpos"),
	                cc: 'useit.com.cn',
	                from: 'normal'
	            });
	        });
		</script>
 	</body>	
</html>
