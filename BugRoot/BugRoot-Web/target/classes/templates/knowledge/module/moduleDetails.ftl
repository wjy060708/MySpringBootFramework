<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="keywords" content="缺陷模式  知识库  首页 ">
		<meta name="description" content="基于缺陷模式知识库管理系统,解决知识的模块化管理">
		<title>[BUG-缺陷模式知识库管理系统]</title>
	
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_20_common.css?aWH" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_20_portal_index.css?aWH" />
	    
	    <link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
	    
	    <script src="${request.contextPath}/useit/js/common.js?HMW" type="text/javascript" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/portal.js?HMW" type="text/javascript" type="text/javascript"></script>
		
		<script src="${request.contextPath}/plugins/jquery/jquery.min.js" type="text/javascript" type="text/javascript"></script>
		
		<script type="text/javascript">
			var jq = jQuery.noConflict();
		</script>
		
		<script src="${request.contextPath}/plugins/jquery/jquery.easing.min.js"></script>
	    <script src="${request.contextPath}/styles/login/login.js"> </script>
		<script src="${request.contextPath}/useit/js/index.js" type="text/javascript" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/slides.js" type="text/javascript" type="text/javascript"></script>	
	      
	</head>
	
    <body id="nv_portal" class="pg_index">
	    <!--网站头部 -->
		<div id="hd">
			<div class="wp">
				<#include "${request.contextPath}/knowledge/nav/common.ftl">
			</div>
		</div>
		
		<div class="clear"></div>
		<!--导航栏 -->
		<div class="deanheader" id="deanheader">
			<div class="w1000">
				<#include "${request.contextPath}/knowledge/nav/head.ftl">
	
				<div class="deantopr" id="loginBtn">
					<div class="deanlogin">
						<ul class="deanunlogin">
							<li class="deanqqlogin"><a href="${request.contextPath}/knowledge/user/base.htm"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: white;"></i></a></li>
							<li class="deanblue"><a href="${request.contextPath}/knowledge/toRegPage.htm">登录/注册</a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
			
		<div class="clear"></div>
		<script src="${request.contextPath}/useit/js/nv.js" type="text/javascript"></script>
	
		<link rel="stylesheet" href="${request.contextPath}/useit/css/oculus.css?t=">
		<link rel="stylesheet" href="${request.contextPath}/useit/css/nc.css?t=">
		
		<script src="${request.contextPath}/useit/js/nc.js?t="></script>
		<script src="${request.contextPath}/useit/js/oculus_nc.js?t="></script>
		
        <!--内容部分 -->
		<div id="wp" class="wp" style="background: #fff;">
			<style id="diy_style" type="text/css">
	            #portal_block_1950 {
		        border-bottom-width: 1px !important;
		        border-bottom-style: dashed !important;
		        border-bottom-color: #cccccc !important;}
	
	           #frameHkb1o2 {
		       margin-top: 10px !important;
	           }
	         </style>
	         
		     <div class="wp h30" style="padding-bottom: 15px;">
				<div class="deanpartl">
					<div class="deanhot h30">
						<div class="clear"></div>
						<div class="deanartice">
							<ul>
								<div id="diydeanarticelist" class="area">
									<div id="framesQ3cKQ" class="frame move-span cl frame-1">
										<div class="title frame-title">
											<span class="titletext" style="color: rgb(255, 255, 255);">${knowType.typeName}--专题</span>
										</div>
	
										<div id="framesQ3cKQ_left" class="column frame-1-c">
											<div id="framesQ3cKQ_left_temp" class="move-span temp"></div>
											<div id="portal_block_1950" class="block move-span">
												<div id="portal_block_1950_content" class="dxb_bc">
	                                            	 <!--知识遍历 -->
													<#list listThirdAllModes as listThirdAllModes>
														<li class=" bgfff top15 ">
															<div class="deanarticec">
																<div class="deanarticel">
																	<a href="${request.contextPath}/knowledge/details.htm?modeId=${listThirdAllModes.modeId}">
																		<img src="${request.contextPath}/${listThirdAllModes.imgeUrl}" width="320" height="230"/>																			 
																	</a>				
																</div>
		
																<div class="deanarticer">
																	<div class="deanarticername">
																		<div class="top">
																			<span class="font">推荐</span><span class="tri"></span>
																		</div>
																		<a href="${request.contextPath}/knowledge/details.htm?modeId=${listThirdAllModes.modeId}">
																			${listThirdAllModes.modeName}
																		</a>	
																	</div>
																	<div class="clear"></div>
																	<div class="deanboxrsummary">${listThirdAllModes.modeRemark}</div>
																	<div class="deanarticertag">
																		<div class="deanarticerforum">
																			知识分类：<a href="${request.contextPath}/knowledge/box/index.htm?typeId=${listThirdAllModes.typeId}">${listThirdAllModes.typeName}</a>	
																		</div>
																		<div class="deanarticerauthor">
																			日期：${listThirdAllModes.createTime?date}</span>
																		</div>
																		<div class="clear"></div>
																	</div>
																</div>
																<div class="clear"></div>
															</div>
														</li> 
												 	</#list>
												</div>
											</div>
										</div>
									</div>													
								</div>
							</ul>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
    
	   <#include "${request.contextPath}/knowledge/nav/foot.ftl">
	

		<script src="${request.contextPath}/plugins/jquery/jquery.min.js"></script>
		<script src="${request.contextPath}/plugins/layui/layui.js"></script>
		
		<script>
			
			layui.use([ 'layer', 'form','carousel'], function() {
				var layer = layui.layer, $ = layui.jquery, form = layui.form, carousel = layui.carousel;
	
			    carousel.render({
			      elem: '#test1'
			      ,width: '100%' //设置容器宽度
			      ,arrow: 'always'
			      ,height:'315'
			     });
			    
			     $('.app-header-menuicon').on('click',function(){
			        $('.header-down-nav').toggleClass('down-nav')
			     })
			    var imgH = $('.imgbox div.layui-this').outerHeight();
			       $('.imgH').css('height',imgH+'px')
			       window.onresize = function () {
			       var imgH = $('.imgbox div.layui-this').outerHeight();
			       $('.imgH').css('height',imgH+'px')
			    };
							
			});
			
		</script>
		
	    		<!--cookie 及登陆 -->
	    <script src="${request.contextPath}/plugins/jquery-extensions/jquery.cookie.min.js"></script>
		<script>
			function checkForm() {
			   var username =jq("input[name='username']").val();
			   var password =jq("input[name='password']").val();
			   var rememberMe;
			   
			   document.getElementById("login_warning").style.display="none";
			   
			   if(username==""||username==null||username==undefined){
			      document.getElementById("login_warning").style.display="";
			      return false;
			   } else if(password==""||password==null||password==undefined) {
			      document.getElementById("login_warning").style.display="";
			      return false;
			   } else {
			      document.getElementById("login_warning").style.display="none";
			      
			      if(jq('form').find('input[type="checkbox"]')[0].checked){
			         rememberMe = true;
			      } else {
			         rememberMe = false;
			      }
			      
			     jq.cookie('QuickBoot.username', username, {expires: 30});

			       var url = '${request.contextPath}/login/main.json';
		            jq.post(url, 
		            {
		              username:username,
		              password:password,
		              rememberMe:rememberMe
		            
		            }, function(res) {
		                if(res.success){
		                    location.href = "${request.contextPath}/" + res.data.url;
		                }else{
		                    layer.msg(res.message);
		                }
		            });
			   }	
			}
		</script>
		
  </body>
</html>
