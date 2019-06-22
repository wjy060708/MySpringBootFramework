<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>BUG-知识库总揽</title>
		<meta name="application-name" content="Useit 知识库" />
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_20_common.css?YcP" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_20_forum_index.css?YcP" />
		<link rel="archives" title="Useit 知识库" href="" />
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
		<link rel="stylesheet" href="${request.contextPath}/res/global.css">
		
		<script src="${request.contextPath}/useit/js/common.js?YcP" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/forum.js?YcP" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/jquery.js" type="text/javascript"></script>
		<script type="text/javascript">
	        var jq=jQuery.noConflict();
	    </script>
	    <script src="${request.contextPath}/useit/js/index.js" type="text/javascript" type="text/javascript"></script>
	    <script src="${request.contextPath}/useit/js/slides.js" type="text/javascript" type="text/javascript"></script>

		<script language="javascript" type="text/javascript">
			function killErrors() {
				return true;
			}
			window.onerror = killErrors;
		</script>
	</head>

	<body id="nv_forum" class="pg_index" onkeydown="if(event.keyCode==27) return false;">	
		<div id="hd">
			<div class="wp">
				<#include "${request.contextPath}/knowledge/nav/common.ftl">
			</div>
		</div>
		
	    <div class="deanheader" id="deanheader">
	        <div class="w1000"> 
	           <#include "${request.contextPath}/knowledge/nav/head.ftl">	           
	        </div>
	    </div>
	      
        <script src="${request.contextPath}/useit/js/nv.js" type="text/javascript"></script>
        <link rel="stylesheet" href="${request.contextPath}/useit/css/oculus.css?t=">
        <link rel="stylesheet" href="${request.contextPath}/useit/css/nc.css?t=">
        <script src="${request.contextPath}/useit/js/nc.js?t="></script>
        <script src="${request.contextPath}/useit/js/oculus_nc.js?t="></script>
        
		<div id="wp" class="wp" style="background:#fff;">
			<div id="pt" class="bm cl">
				<div class="z">
					<a href="./" class="nvhm" title="首页">Useit 知识库</a><em>&raquo;</em>					
					<a href="">知识库</a>
				</div>
			</div>
			<div id="ct" class="wp cl">
				<div id="chart" class="bm bw0 cl">
					<p class="chart z">今日: <em style="color:red">${countCur}</em><span class="pipe">|</span>昨日: <em style="color:blue">${countPre}</em><span class="pipe">|</span>知识: <em style="color:green">${countAll}</em><span class="pipe">|</span></p>
				</div>
				<div class="mn">
					<div class="fl bm"  style="margin-left:30px">
						<div class="bm bmw  flg cl">
							<div class="bm_h cl">
								<h2 style="margin-top:10px;margin-left:50px;">
									<a href="">知识一览</a>									
								</h2>
							</div>
							<!-- 主显示布局  -->
							<div id="threadlist" class="tl bm bmw">								
								<div class="bm_c">
									<!-- 遍历缺陷模式知识  -->
									<form method="post" autocomplete="off" name="moderate" id="moderate">	
										<ul id="waterfall" class="ml waterfall cl">
										
											 <#list listModes as listModes>
												<li style="width:533px">
													<div class="c cl">												
														<a
															href="${request.contextPath}/knowledge/details.htm?modeId=${listModes.modeId}"
															onclick="atarget(this)" title="${listModes.modeName}"
															class="z"> 
															<img src="${request.contextPath}/${listModes.imgeUrl}" alt="${listModes.modeName}" width="505px" height="250px" />	
														</a>									
													</div>
													<h3 class="xw0">
														<a
															href="${request.contextPath}/knowledge/detail.htm?modeId=${listModes.modeId}"
															onclick="atarget(this)" title="${listModes.modeName}">
															
															<strong>${listModes.modeName}</strong>
														</a>
														<br><br>
														<div>${listModes.modeRemark}</div>
														<div style="color:blue">
															<h1>知识分类：															
																<a href="" style="color:blue">${listModes.typeName}</a>			
															</h1>												
														</div>
													</h3>
													
													<div class="auth cl">
														<cite class="xg1 y"> 浏览量: ${listModes_index+48}</cite>
													</div>
												</li> 
											</#list>
										</ul>												
									</form>									
								</div>							
							</div>							
						</div>											
					</div>
					<div style="text-align: center">
			        	<div id="page"></div>
			    	</div>
				</div>
			</div>
		</div>	
		<input type="hidden" name="countAll" id ="countAll" value="${countAll}"/>
		<#include "${request.contextPath}/knowledge/nav/foot.ftl">	
		<script src="${request.contextPath}/plugins/layui/layui.js" type="text/javascript"></script>
		
		<script>				
			 layui.use('laypage',function(){
				var laypage = layui.laypage;	
				laypage.render({
					elem:'page'
					,count:14
					,limit:10
					,jump: function(obj,first) {
						if(!first) {
							var url = '${request.contextPath}/knowledge/mode/listPage1';
							jq.ajax({
								url: url
								,type:'get'
								,dataType: 'json'
								,data: {
									'async': 'true'
									,'page': obj.curr
									,'rows': obj.limit
								}
								,success: function(data){
									jq("#waterfall").html("");
									for(var i = 0;i < data.rows.length;i++) {
									   var html = '<li style="width:533px">'
									   +'<div class="c cl">'
									   +'<a href="${request.contextPath}/knowledge/details.htm?modeId='+data.rows[i].modeId+'"	title="'+data.rows[i].modeName+'" onclick="atarget(this)" class="z"> '
									   +'<img src="${request.contextPath}/'+data.rows[i].imgeUrl+'" alt="'+data.rows[i].modeName+'" width="505px" height="250px" />'
									   +'</a>'
									   +'</div>'
									   +'<h3 class="xw0">'
									   +'<a href="${request.contextPath}/knowledge/details.htm?modeId='+data.rows[i].modeId+'" onclick="atarget(this)" title="'+data.rows[i].modeName+'">'	
									   +'<strong>'+data.rows[i].modeName
									   +'</strong>'
                                       +'</a>'
                                       +' <br><br>'
                                       +'<div>'+data.rows[i].modeRemark
                                       +'</div>'
                                       +'<div style="color:blue">'
                                       +'<h1>知识分类：'
                                       + '<a href="" style="color:blue">'+data.rows[i].typeName
                                       +'</a>'
                                       +'</h1>'
                                       +'</div>'
									   +'</h3>'
									   +' <div class="auth cl">'
									   +'<cite class="xg1 y"> 浏览量:'+48 
									   +'</cite>'
									   +'</div>'
									   +'</li>'
									   jq("#waterfall").append(html);	
									}
								}						
							});
						}
					}	
				});
			 });
		</script>	
	</body>
</html>