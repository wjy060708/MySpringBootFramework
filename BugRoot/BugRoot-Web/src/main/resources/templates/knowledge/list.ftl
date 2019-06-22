<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>数字/互联网经济-Useit 知识库</title>

	    <meta name="application-name" content="缺陷模式 知识库" />
		<meta name="msapplication-tooltip" content="缺陷模式 知识库" />
		<meta name="keywords" content="知识库，缺陷模式 缺陷" />
		<meta name="description" content="知识库，缺陷模式 缺陷  基于缺陷模式的知识库管理 " />
		<meta name="copyright" content="2001-2013 Useit Inc." />
		<meta name="MSSmartTagsPreventParsing" content="True" />
		<meta http-equiv="MSThemeCompatible" content="Yes" />
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_21_common.css?r72" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_21_forum_forumdisplay.css?r72" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jquery-plugins/jquery-pagination/style/pagination.css" />
		
	    <!--ztree css-->   
	    <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/css/zTreeStyle/zTreeStyle.css" />
	    
		<script src="${request.contextPath}/plugins/jquery/jquery-2.1.1.min.js"></script>
		<script src="${request.contextPath}/useit/js/common.js?r72" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/kym_list.js"  type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/forum.js?r72" type="text/javascript"></script>
	
	    <script type="text/javascript">
            var jq=jQuery.noConflict();
        </script>
        
        <script src="${request.contextPath}/plugins/jquery-plugins/jquery-pagination/jquery.pagination.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/index.js" type="text/javascript" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/slides.js" type="text/javascript" type="text/javascript"></script>
		
		<script language="javascript" type="text/javascript">
			function killErrors() {
				return true;
			}
			
			window.onerror = killErrors;
		</script>
	</head>
	
	<body>
		<!-- 主显示布局  -->
		<div id="threadlist" class="tl bm bmw" >
			<div class="th" >
				<table cellspacing="0" cellpadding="0">
					<tr>
						<th colspan="2">
							<div class="tf">							
								<a id="filter_special" href="javascript:;" class="showmenu xi2" onclick="showMenu()">全部知识</a>&nbsp; 
								<span id="clearstickthread" style="display: none;"> 
									<span class="pipe">|</span> 
									<a href="javascript:;" onclick="clearStickThread()" class="xi2" title="显示置顶">显示置顶</a>
								</span>
							</div>
						</th>					
					</tr>
				</table>
			</div>
			
			<div>
				<!-- 遍历缺陷模式知识  -->
				<form method="post" autocomplete="off" name="moderate" id="moderate">	
					<ul id="waterfall" class="ml waterfall cl">
						<#list listModes as listModes>
							<li style="width: 454px">
								<div class="c cl">
									<a
										href="${request.contextPath}/knowledge/details.htm?modeId=${listModes.modeId}" target="_blank"
										onclick="atarget(this)" title="${listModes.modeName}"
										class="z"> 
										<img src="${request.contextPath}/${listModes.imgeUrl}" alt="${listModes.modeName}" width="430px" height="232px" />	
									</a>
								</div>
								<h3 class="xw0">
									<a
										href="${request.contextPath}/knowledge/detail.htm?modeId=${listModes.modeId}" target="_blank"
										onclick="atarget(this)" title="${listModes.modeName}"><strong>${listModes.modeName}</strong></a>
								</h3>
								<div class="auth cl">
									<cite class="xg1 y">${listModes.createTime?date}</cite>
								</div>
							</li> 
						</#list>
					</ul>												
				</form>
				
				 <div class="M-box"></div>
                <p class="tips">当前是第<span class="now"></span>页</p>
			</div>
		</div>
		
		 <script type="text/javascript">
		    jq(function(){
		   
		     jq.ajax({
		         url:"${request.contextPath}/knowledge/mode/listPage1.html",
		         type:'post',
		         data:{
		           rows:10,
		           page:1
		         },
		         success:function(data) {
		            var total = data.total;
		            var pageCount = Math.ceil(total/10); 
		             jq('.M-box').pagination({
			            pageCount:pageCount,
			            coping:true,
			            homePage:'首页',
			            endPage:'末页',
			            prevContent:'上页',
			            nextContent:'下页',
			            current:1,
	                    callback:function(index){
	                       jq.ajax({
	                           url:"${request.contextPath}/knowledge/mode/listPage1.html",
	                           type:'post',
	                            data:{
		                            rows:2,
		                            page:index
		                           },
		                         success:function(data) {
		                            console.log(data);
		                         }
	                       });
                    }
                },function(api){
                    //jq('.now').text(api.getCurrent());
                });
		          }
		       });
		    });
        </script>
	</body>
</html>
