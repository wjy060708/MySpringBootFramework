<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<title>[综合信息管理系统]</title>
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_21_common.css?r72" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/global.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_21_forum_viewthread.css?r72" />
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
	
		<script src="${request.contextPath}/useit/js/common.js?r72" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/forum.js?r72" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery/jquery-2.1.1.min.js"></script>
		
		<script src="${request.contextPath}/plugins/jquery-plugins/jquery-media/jquery.media.js"></script>
		<script src="${request.contextPath}/res/layui/layui.js"></script>
	    <script type="text/javascript">
           var jq=jQuery.noConflict();
        </script>
		  
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
						<a href="${request.contextPath}/knowledge/type/module.htm">返回列表</a>
					</span>
					<span class="y pgb01 favorite">
						<a href="javascript:void(0)" onclick="KnowPrivate('${knowMode.modeId}','${userId}')"  onmouseover="this.title = $('favoritenumber').innerHTML + ' 人收藏'" title="收藏本知识">
							<i class="layui-icon layui-icon-star-fill"></i>收藏
						</a>
					</span>
					<span class="y pgb01">
						<a id="post_reply"  href="javascript:;" title="回复">
							<i class="layui-icon layui-icon-add-1" style="color:green"></i>回复
						</a> 
					</span>	
					<span class="y pgb01 notlike">
						<a href="javascript:void(0)" onclick="KnowBad('${knowMode.modeId}','${userId}')" onmouseover="this.title = $('favoritenumber').innerHTML + ' 人差评'">
							<i class="layui-icon layui-icon-tread" style="color:red"></i>没用 							
						</a>
					</span>
					<span class="y pgb01 like">
						<a href="javascript:void(0)" onclick="KnowGreat('${knowMode.modeId}','${userId}')" onmouseover="this.title = $('favoritenumber').innerHTML + ' 人点赞'">
							<i class="layui-icon layui-icon-praise" style="color:green"></i>有用
						</a>
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
														<div class="ptg mbm mtn">知识标签
														    <#list keyWords as keyWords>
															  <a title="知识标签" href="#" target="_blank">${keyWords}</a>,
															 </#list>
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
																								<a href="#" onclick="resourecDown('${listRules.resourceId}')">${listRules.ruleContent}</a>
																					
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
																				    <li>${listReasons_index+1}.&nbsp;&nbsp;&nbsp;&nbsp${listReasons.reasonContent}</li>
																				</#list>
																			</ol>
																		</div><br/>
		
																		<hr>
																		<img src="${request.contextPath}/useit/images/consequence.png" height="80px" border="0" title="缺陷后果">
																		<strong>缺陷后果</strong><br />
																					
																		<div align="left">
																			<ol start="20">
																				<#list listConsequences as listConsequences>
																				    <li>${listConsequences_index+1}.&nbsp;&nbsp;&nbsp;&nbsp${listConsequences.consequenceContent}</li>
																				</#list>
																			</ol>
																		</div><br />
		
																		<hr>
																		<img src="${request.contextPath}/useit/images/prevention.png" height="80px" border="0" title="缺陷预防">
																		<strong>缺陷预防</strong><br />
																	
																		<div align="left">
																			<ol start="20">
																				<#list listPreventions as listPreventions>
																				    <li>${listPreventions_index+1}.&nbsp;&nbsp;&nbsp;&nbsp${listPreventions.preventionContent}</li>
																				</#list>
																			</ol>
																		</div><br/>
			
																		<hr>
																		
																		<img src="${request.contextPath}/useit/images/rule.png" height="80px" border="0" title="缺陷规则">
																		<strong>缺陷规则</strong><br/>
																		<div align="left">
																			<ol start="20">
																				<#list listRules as listRules>
																				    <li>${listRules_index+1}.&nbsp;&nbsp;&nbsp;&nbsp${listRules.ruleContent}</li>
																				</#list>
																			</ol>
																		</div>
																		<hr>
																	
																	 <!--评论区-->
																	 <div class="fly-panel detail-box">
																	        <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
																	          <legend id="flyReply">回帖</legend>
																	        </fieldset>
																	        
																	        <div class="layui-form layui-form-pane">
																	          <form action="" method="post" id="knowModeRemark">
																	            <div class="layui-form-item layui-form-text">
																	              <a name="comment"></a>
																	              <div class="layui-input-block">
																	                <textarea id="content" name="content" required lay-verify="content" placeholder="请输入内容"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
																	              </div>
																	            </div>
																	            <div class="layui-form-item">
																	              <input type="hidden" name="userId" value="${sysUser.userId}">
																	              <input type="hidden" name="userName" value="${sysUser.trueName}">
																	              <input type="hidden" name="modeId" value="${knowMode.modeId}">
																	              <button class="layui-btn" lay-filter="formSubmit" lay-submit>提交评论</button>
																	            </div>
																	          </form>
																	        </div>
																	      </div>
																	      
																	        <ul class="jieda" id="jieda">
																	         <#list listRemarks as listRemarks>
																	          <li data-id="111" class="jieda-daan">
																	            <a name="item-1111111111"></a>
																	            <div class="detail-about detail-about-reply">
																	              <a class="fly-avatar" href="">
																	                <img src="${request.contextPath}/${sysUser.userIcon}" alt="${sysUser.trueName}">
																	              </a>
																	              <div class="fly-detail-user">
																	                <a href="" class="fly-link">
																	                  <cite>${listRemarks.userName}</cite>
																	                </a>
																	                <span>(楼主)</span>
																	              </div>
																	
																	              <div class="detail-hits">
																	                <span>2017-11-30</span>
																	              </div>
																	              <i class="iconfont icon-caina" id="accept" style="display:none" title="最佳答案"></i> 
																	            </div>
																	            <div class="detail-body jieda-body photos">
																	              <p>${listRemarks.content}</p>
																	            </div>
																	            <div class="jieda-reply">
																	              <span class="jieda-zan zanok" type="zan">
																	                <i class="iconfont icon-zan"></i>
																	                <em>66</em>
																	              </span>
																	              <span type="reply">
																	                <i class="iconfont icon-svgmoban53"></i> 回复
																	              </span>
																	              <div class="jieda-admin">
																	                 <em><a style="margin-right:130px" class="mine-edit" href="#" onclick="del('${listRemarks.remarkId}','${listRemarks.userId}')">删除</a></em>
																	                 <em><a style="margin-right:130px" class="mine-edit" href="#" onclick="accept('${listRemarks.remarkId}')">采纳</a></em> 
																	              </div>
																	            </div>
																	          </li>
																	          </#list>
																	        </ul>
																	   </div>
																	</td>
																</tr>
															</table>
														</div>
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
														    <#list list2 as list>
															  <li><a href="${request.contextPath}/knowledge/details.htm?modeId=${list.modeId}" title="${list.modeName}"><font color="#0054A6" size="-1">${list.typeName}：${list.modeName}</font></a></li><hr>
															</#list>
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
			</div>
		  </div>
				<#include "${request.contextPath}/knowledge/nav/foot.ftl">
				<script src="${request.contextPath}/plugins/layui/lay/modules/layer.js"></script>
				<script> 
				    jq(function(){
				        jq("#post_reply").click(function(){
				               var scroll_offest = jq("#flyReply").offset();
				                jq("body,html").animate({
				                  scrollTop:scroll_offest.top
				               },0);				        
				        })
				    });
				
				    function KnowPrivate(modeId,userId){
				        jq.ajax({
				          type:"post",
				          url:'${request.contextPath}/knowledge/mode/private.htm',
				          data:{
				            modeId:modeId,
				            userId:userId
				          } 
				        })
				      };
				      function KnowBad(modeId,userId){
				        jq.ajax({
				          type:"post",
				          url:'${request.contextPath}/knowledge/mode/bad.htm',
				          data:{
				            modeId:modeId,
				            userId:userId
				          } 
				        })
				      };
				      
				      function KnowGreat(modeId,userId){
				        jq.ajax({
				          type:"post",
				          url:'${request.contextPath}/knowledge/mode/great.htm',
				          data:{
				            modeId:modeId,
				            userId:userId
				          } 
				        })
				      };
				      
				        function resourecDown(resourceId){
				        jq.ajax({
				          type:"post",
				          url:'${request.contextPath}/knowledge/mode/downFile.htm',
				          data:{
				            resourceId:resourceId
				          } 
				        })
				      };
				      
				      
				      
				      //弹出评论框
				       function del(remarkId,userId){
					        jq.ajax({
					          url:'${request.contextPath}/knowledge/mode/remark/delete.htm',	
							  method:'POST',
							  
					         data:{
							    userId:userId,
							    remarkIds:remarkId
							      },
							    success:function(response) {
							       //layer.alert('删除成功',{icon:1,time:10000});
							       //setTimeout("window.lacation.reload()",2000);
							    
							      window.alert('删除成功');
							      window.location.href=window.location.href;
							      window.location.reload();
							    }
					        });				     
					     };
					     function accept(remarkId){ 
					        jq("#accept").removeAttr("style");
					        return false;
					     }
					     
				</script>
				
				<script src="${request.contextPath}/plugins/layui/layui.js"></script>
				<script>
				    layui.use(['upload','layedit','form','layer'], function () {
	                 var  $ = layui.jquery,form = layui.form,upload = layui.upload, layedit = layui.layedit,layer = layui.layer;

					    //富文本上传图片
					   layedit.set({
					     uploadImage:{
					       url:'${request.contextPath}/uploadImages2',
					       type:'post',
					       success:function(data){
					         alert(data);
					       }
					     }
					   });
					   
					   var index = layedit.build('content',{
					     height:150
					   });
					   
					   //将内容同步到textArea中
					   form.verify({
					     content:function(value){
					        return layedit.sync(index);
					     }
					   });
				
					  form.on('submit(formSubmit)',function(data){
				         $.ajax({
				             url:'${request.contextPath}/knowledge/mode/remark/save.htm',
				             data:data.field,
				             method:'post',
				             success:function(result){
				                layer.open({
				                  type:0,
				                  content:"评论成功"
				                });
				                window.location.reload();
				                
				                var scroll_offest = $("#flyReply").offset();
				                $("body,html").animate({
				                  scrollTop:scroll_offest.top()
				                },0);
				             }
				          });
				          return false;
		              });
					})
				</script>
	</body>
</html>
