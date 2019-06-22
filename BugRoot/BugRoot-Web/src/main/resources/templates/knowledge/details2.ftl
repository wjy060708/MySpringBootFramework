<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	    <meta name="application-name" content="Useit 知识库" />
		<meta name="msapplication-tooltip" content="Useit 知识库" />
		<meta name="msapplication-task" content="name=首页;action-uri=https://www.useit.com.cn/portal.php;icon-uri=https://www.useit.com.cn/https://img.useit.com.cn/temcdn/static/image/common/portal.ico" /><meta name="msapplication-task" content="name=知识库;action-uri=https://www.useit.com.cn/forum.php;icon-uri=https://www.useit.com.cn/https://img.useit.com.cn/temcdn/static/image/common/bbs.ico" />
		<meta name="msapplication-task" content="name=;action-uri=https://www.useit.com.cn/home.php;icon-uri=https://www.useit.com.cn/https://img.useit.com.cn/temcdn/static/image/common/home.ico" /><link rel="archives" title="知识库" href="https://www.useit.com.cn/archiver/" />
		<title>[综合信息管理系统]</title>
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_21_common.css?r72" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_21_forum_viewthread.css?r72" />
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
			
		<script src="${request.contextPath}/useit/js/common.js?r72" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/forum.js?r72" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery/jquery-2.1.1.min.js"></script>
		<script src="${request.contextPath}/plugins/jquery-plugins/jquery-media/jquery.media.js"></script>
	    <script type="text/javascript">
           var jq=jQuery.noConflict();
        </script>
        
        <style>
           li img{      
			padding: 2px;
			width:100%;
			height:100%;
			background: #FFF;
			border: 1px solid;
			border-color: #F2F2F2 #E1E1E1 #E1E1E1 #F2F2F2;
}
        </style>
		<script language="javascript" type="text/javascript">
			function killErrors() {
				return true;
			}
			window.onerror = killErrors;
		</script>
		
		<script type="text/javascript">  
		        jq(function() {  
		        jq('a.media').media({width:750, height:1000});  
		        jq('a.mediase').media({width:750, height:1000});  
		    });  
        </script> 
		         
	    <script src="${request.contextPath}/useit/js/index.js" type="text/javascript" type="text/javascript"></script>
	    <script src="${request.contextPath}/useit/js/slides.js" type="text/javascript" type="text/javascript"></script>
	     <script>
		   layui.config({
		      base: '${request.contextPath}/res/static/js/' 
		    }).use('blog');
	    </script>
	</head>
	
	
	<body id="nv_forum" class="pg_viewthread">
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
	   <script src="${request.contextPath}/useit/js/forum_viewthread.jsr72.js?r72" type="text/javascript"></script>
	             
	   <div id="wp" class="wp" style="background:#fff;">
	   
	  	   <!-- 当前界面路径 -->
	       <div id="pt" class="bm cl">
	   	       <div class="z">
	  		       <a href="" class="nvhm" title="首页">Useit 知识库</a><em>&raquo;</em><a href="">知识库</a> <em>&rsaquo;</em> <a href="">互联网-行业</a> <em>&rsaquo;</em> <a href="">科技金融</a> <em>&rsaquo;</em> <a href="">麦肯锡：中国银行业CEO季刊——2018年冬季刊</a>
	   		   </div>
	 	   </div>
			
		   <div id="ct" class="wp cl">
				
				<!-- 点评栏 -->
				<div id="pgt" class="pgs mbm cl ">
					<span class="y pgb" id="visitedforums" onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id,'pos':'34'})">
					<a href="${request.contextPath}/knowledge/type/module.htm">返回列表</a></span>
					
					<span class="y pgb01 favorite">
						<a href="${request.contextPath}/knowledge/mode/private?modeId=${knowMode.modeId}&userId=${userId}" id="k_favorite" onclick="return false" onmouseover="this.title = $('favoritenumber').innerHTML + ' 人收藏'" title="收藏本知识">
						  <i class="layui-icon layui-icon-star-fill"></i>收藏
						</a>
					</span>
					
					<span class="y pgb01"><a id="post_reply" onclick="showWindow('reply', 'forum.php?mod=post&action=reply&fid=274&tid=21643')" href="javascript:;" title="回复"><i class="layui-icon layui-icon-add-1" style="color:green"></i> 回复</a></span>	
					<span class="y pgb01"><a id="recommend_subtract" href="${request.contextPath}/knowledge/mode/bad?modeId=${knowMode.modeId}&userId=${userId}" onclick="return false;" onmouseover="this.title = $('recommendv_subtract').innerHTML + ' 人没用'" title="踩一下">
					  <i class="layui-icon layui-icon-tread" style="color:red"></i> 没用 <span id="recommendv_subtract" style="display:none"> 0</span></a></span>
					
					<span class="y pgb01">
					<a id="recommend_add" href="${request.contextPath}/knowledge/mode/great.htm?modeId=${knowMode.modeId}&userId=${userId}" onclick="ajaxmenu(this, 3000, 1, 0, '43', 'recommendupdate(1)');return false;" onmouseover="this.title = $('recommendv_add').innerHTML + ' 人有用'" title="顶一下"><i class="layui-icon layui-icon-praise" style="color:green"></i> 有用<span id="recommendv_add" style="display:none"> 0</span></a>
					
					</span>			
				</div>
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
				   		<td width="70%" align="left" valign="top">
							<div id="postlist" class="pl bmC01">
								<table cellspacing="0" cellpadding="0">
									<tr>
										<td class="plc ptm pbn vwthd">			
											<h1 class="ts">
												<span id="thread_subject" style="font-size:large">缺陷模式：${knowMode.modeName}</span>
												<span id="thread_subject" style="float:right;color:green"><a style="color:green" href="/yulan.pdf"><i class="layui-icon layui-icon-read">  文件预览</i></a></span>					
											</h1>
										</td>
									</tr>
								</table>
								<div id="post_22820" >
									<table id="pid22820" class="plhin" summary="pid22820" cellspacing="0" cellpadding="0">
										<tr>
											<td class="plc" style="width:100%">
												<div class="">
													<div class="pti">												
														<div class="authi">
															<em id="authorposton22820">发布时间： ${knowMode.createTime?datetime}</em>
														</div>
													</div>
												</div>
												<div class="pct">
													<style type="text/css">.pcb{margin-right:0}</style>									
													<div class="pcb">				
														<div class="ptg mbm mtn">热点搜索
															<a title="麦肯锡" href="" target="_blank">麦肯锡</a>, 
															<a title="中国银行业CEO季刊" href="" target="_blank">中国银行业CEO季刊</a>,
			 												<a title="2018年冬季刊" href="" target="_blank">2018年冬季刊</a>, 
			 												<a title="全球数字化银行" href="" target="_blank">全球数字化银行</a>, 
			 												<a title="数字化银行" href="" target="_blank">数字化银行</a>
			 											</div>
														
														<!-- 知识关联文件部分 -->
														<table summary="分类信息" cellpadding="0" cellspacing="0" class="cgtl mbm">
															<caption>知识文档-点击下载</caption>
															<tbody>
																<tr>
																	<td>
																		<div class="pattl">
																			<#list listRules as listRules>
																				<ignore_js_op>
																					<dl class="tattl">
																						<dt>
																							<img src="${request.contextPath}/useit/images/e068a9c861c0656ee44869af6314d63.png" border="0" class="vm" alt="" />
																						</dt>
																				
																						<dd>
																							<p class="attnm">
																								<a href="${request.contextPath}/knowledge/mode/downFile.htm?resourceId=${listRules.resourceId}">${listRules.ruleContent}</a>
																					
																								<div style="display: none" disautofocus="true">
																									<div class="tip_c">
																										<p class="y">2018-12-20 21:24 上传</p>
																										<p>点击文件名下载附件</p>
																										<p class="xg2">172页 PDF 中文版</p>
																									</div>																				
																								</div>
																							</p>
																							<p>23.71 MB, 11人喜欢 , 75人浏览</p>
																							<p>所需积分: <strong>5 积分</strong>
																								[<a href="" onclick="showWindow('attachpay', this.href)">未支付</a>]						        
																								[<a href="" target="_blank">我的积分</a>]		    
																							</p>																					
																						</dd>																				
																					</dl>
																				</ignore_js_op>
																			</#list>	
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>	

														<div class="t_fsz">
															
															<!-- 缺陷知识详情 -->
			 												<table cellspacing="0" cellpadding="0">
			    												<tr>
			     													<td class="t_f" id="postmessage_22820">
			     														${knowMode.modeRemark}<br/> <br/>
			     														
																		<img src="${request.contextPath}/useit/images/reson.png" height="80px" border="0" title="缺陷原因">
																		<strong>缺陷原因</strong><br />
				
																		<div align="left">
																			<ol start="20">
																				<#list listReasons as listReasons>
																				    <li style="margin-left:50px;margin-right:50px;">${listReasons_index+1}.&nbsp;&nbsp;&nbsp;&nbsp${listReasons.reasonContent}</li>
																				</#list>
																			</ol>
																		</div><br/>
		
																		<hr>
																		<img src="${request.contextPath}/useit/images/consequence.png" height="80px" border="0" title="缺陷后果">
																		<strong>缺陷后果</strong><br />
																					
																		<div align="left">
																			<ol start="20">
																				<#list listConsequences as listConsequences>
																				    <li>${listReasons_index+1}.&nbsp;&nbsp;&nbsp;&nbsp${listConsequences.consequenceContent}</li>
																				</#list>
																			</ol>
																		</div><br />
		
																		<hr>
																		<img src="${request.contextPath}/useit/images/prevention.png" height="80px" border="0" title="缺陷预防">
																		<strong>缺陷预防</strong><br />
																	
																		<div align="left">
																			<ol start="20">
																				<#list listPreventions as listPreventions>
																				    <li>${listReasons_index+1}.&nbsp;&nbsp;&nbsp;&nbsp${listPreventions.preventionContent}</li>
																				</#list>
																			</ol>
																		</div><br/>
			
																		<hr>
																		<img src="${request.contextPath}/useit/images/rule.png" height="80px" border="0" title="缺陷规则">
																		<strong>缺陷规则</strong><br />
																		<div align="left">
																			<ol start="20">
																				<#list listRules as listRules>
																				    <li>${listRules_index+1}.&nbsp;&nbsp;&nbsp;&nbsp${listRules.ruleContent}</li>
																				</#list>
																			</ol>
																		</div>
																	</td>
																</tr>
															</table>
														</div>
													</div>
												</div>
											</td>
										</tr>
		
										<tr>
											<td class="plc" style="overflow:visible;--> width:100%">
												<div class="po hin">
													<div class="pob cl">
														<em>
															<a class="fastre" href="forum.php?mod=post&amp;action=reply&amp;fid=274&amp;tid=21643&amp;reppost=22820&amp;extra=page%3D1&amp;page=1" onclick="showWindow('reply', this.href)"><i class="layui-icon layui-icon-add-1"></i>回复</a>
														</em>
													</div>
												</div>
											</td>
										</tr>
									</table>								
								</div>							
							</div>							
						</td>
		   				<td width="30%" align="right" valign="top">
							<table width="95%" border="1" cellpadding="8" cellspacing="0" bordercolor="#ccc">
			 					<tr>
			    					<td>													
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="30px">相关知识</td>
											</tr>
			   								<tr>
			    								<td height="1px" bgcolor="#C2D5E3"></td>
			  								</tr>
		  									<tr>
		    									<td>
													<div class="module cl xl xl1">
														<ul style="margin-left:5px">
															<li><a href="" title="麦肯锡：协同和破坏——金融科技的十大趋势" target="_blank"><font color="#0054A6" size="-1">麦肯锡：协同和破坏——金融科技的十大趋势</font></a></li><hr>
															<li><a href="" title="中国药学会&amp;麦肯锡：2018中国医院药品报告" target="_blank"><font color="#0054A6" size="-1">中国药学会&amp;麦肯锡：2018中国医院药品报告</font></a></li><hr>
															<li><a href="" title="BoF&amp;麦肯锡：2019全球时尚业态报告" target="_blank"><font color="#0054A6" size="-1">BoF&amp;麦肯锡：2019全球时尚业态报告</font></a></li><hr>
															<li><a href="" title="麦肯锡：设计的商业价值" target="_blank"><font color="#0054A6" size="-1">麦肯锡：设计的商业价值</font></a></li><hr>
															<li><a href="" title="麦肯锡：服装制造业回家了吗？" target="_blank"><font color="#0054A6" size="-1">麦肯锡：服装制造业回家了吗？</font></a></li><hr>
															<li><a href="" title="麦肯锡：想象未来的城市" target="_blank"><font color="#0054A6" size="-1">麦肯锡：想象未来的城市</font></a></li><hr>
															<li><a href="" title="麦肯锡：设计的商业价值" target="_blank"><font color="#0054A6" size="-1">麦肯锡：设计的商业价值</font></a></li><hr>
															<li><a href="" title="麦肯锡：服装制造业回家了吗？" target="_blank"><font color="#0054A6" size="-1">麦肯锡：服装制造业回家了吗？</font></a></li><hr>
															<li><a href="" title="麦肯锡：想象未来的城市" target="_blank"><font color="#0054A6" size="-1">麦肯锡：想象未来的城市</font></a></li><hr>
															<li><a href="" title="麦肯锡：设计的商业价值" target="_blank"><font color="#0054A6" size="-1">麦肯锡：设计的商业价值</font></a></li><hr>
															<li><a href="" title="麦肯锡：服装制造业回家了吗？" target="_blank"><font color="#0054A6" size="-1">麦肯锡：服装制造业回家了吗？</font></a></li><hr>
															<li><a href="" title="麦肯锡：想象未来的城市" target="_blank"><font color="#0054A6" size="-1">麦肯锡：想象未来的城市</font></a></li><hr>
															<li><a href="" title="麦肯锡：设计的商业价值" target="_blank"><font color="#0054A6" size="-1">麦肯锡：设计的商业价值</font></a></li><hr>
															<li><a href="" title="麦肯锡：服装制造业回家了吗？" target="_blank"><font color="#0054A6" size="-1">麦肯锡：服装制造业回家了吗？</font></a></li><hr>
															<li><a href="" title="麦肯锡：想象未来的城市" target="_blank"><font color="#0054A6" size="-1">麦肯锡：想象未来的城市</font></a></li>
														</ul>
													</div>		
												</td>
			  								</tr>	
										</table>	
									</td>
		 				 		</tr>
							</table>							
						</td>						
		  			</tr>		
				</table>
				<#include "${request.contextPath}/knowledge/nav/foot.ftl">
			</div>
		</div>
	</body>
</html>
