<!DOCTYPE html>
<html>
	<head>
		<title>检索-BUG缺陷模式知识管理系统</title>
		<meta name="description" content='WCP知识管理系统、用于创建知识库系统，知识创建、知识更新、知识推送、全文检索、附件预览 到 知识评价、知识激励、知识统计以及基于以上功能权限控制等功能，拥有免费版开源版和商业版'>	
		<meta name="keywords" content='知识库,知识管理,知识管理系统,开源知识库,开源知识管理系统,免费知识库,免费知识管理系统'>	
		<meta name="author" content='wcp知识管理系统'>
		<meta charset="utf-8">
		
		<link rel="icon" href="favicon.ico" mce_href="favicon.ico"
			type="image/x-icon">
		<link rel="shortcut icon" href="favicon.ico" mce_href="favicon.ico"
			type="image/x-icon">
		<script src="${request.contextPath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
			
		<script src="${request.contextPath}/plugins/bootstrap/bootstrap.min.js"></script>
		<script src="${request.contextPath}/useit/js/respond.min.js"></script>
		<link href="${request.contextPath}/useit/css/web-base.css" rel="stylesheet">
		<link href="${request.contextPath}/useit/css/web-black.css" rel="stylesheet">
		<link href="${request.contextPath}/useit/css/editInner.css" rel="stylesheet">
		
		
	</head>
	<body>
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
				
				<div class="clear"></div>
			</div>
		</div>

		<div>
			<div class="container">		
				<div class="row column_box" style="margin-top:100px;margin-left:100px;">
					<div class="col-lg-2">
						<img src="${request.contextPath}/useit/images/search.jpg" width="70px";height="30px"; style="position:absolute;left:110px;top:20px;"/>
					</div>
					<div class="col-lg-6" style="margin:0 auto;">
						<div class="row">
							<div class="col-sm-12 column_box">
								<script src="${request.contextPath}/useit/js/completer.min.js"></script>
								<link rel="stylesheet" href="${request.contextPath}/useit/css/completer.css">
								<div class="row">
									<div class="col-sm-12 ">
										<form action="${request.contextPath}/knowledge/box/searchDetails.htm" id="websearchpubdoId" method="post">
											<div class="input-group">
												<span class="input-group-addon" id="limitTypeTag">全部</span>
												<input type="text" class="form-control" name="word" value="" id="searchInput" placeholder="请输入关键字...">
												<!-- 结果类型 -->
												<input type="hidden" name="resultType" id="resultTypeInputId" value="all">
												<!-- 查询页数 -->
												<input type="hidden" name="pagenum" id="pagenumInputId" value="1">
												<!-- 条件类型 -->
												<input type="hidden" name="limitType" id="limitTypeInputId" value="ALL">
												<!-- 展示类型 -->
												<input type="hidden" name="showType" id="showTypeInputId" value="list">
												<div class="input-group-btn">
													<button class="btn btn-info" type="submit">
														<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
														&nbsp;
														<span id="resultTypeNameId">检索</span>
													</button>
													<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
														<span class="caret"></span>
													</button>
													<ul class="dropdown-menu dropdown-menu-right">
														<li>
															<a href="javascript:chooseResultTypeAll(0);">
																查找&nbsp;
																<b>全部</b>
															</a>
														</li>
														<li role="separator" class="divider"></li>
														<li>
															<a href="javascript:chooseResultTypeKnow(0);">
																查找&nbsp;
																<b>知识</b>
															</a>
														</li>
														
															<li>
																<a href="javascript:chooseResultTypeQuest(0);">
																	查找&nbsp;
																	<b>问答</b>
																</a>
															</li>
														
													</ul>
																					
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">									
										<a class="hotWordsearch">
											<span class="btn btn-secondary" style="cursor: pointer;"><strong >知识之星</strong></span>
										</a>
									
										<a class="hotWordsearch">
											<span class="btn btn-secondary" style="cursor: pointer;"><strong >软件开发</strong></span>
										</a>
									
										<a class="hotWordsearch">
											<span class="btn btn-secondary" style="cursor: pointer;"><strong >问题提问</strong></span>
										</a>
									
										<a class="hotWordsearch">
											<span class="btn btn-secondary" style="cursor: pointer;"><strong >最新发布</strong></span>
										</a>
									
										<a class="hotWordsearch">
											<span class="btn btn-secondary" style="cursor: pointer;"><strong >知识精选</strong></span>
										</a>
									
										<a class="hotWordsearch">
											<span class="btn btn-secondary" style="cursor: pointer;"><strong >缺陷模式</strong></span>
										</a>
									
										<a class="hotWordsearch">
											<span class="btn btn-secondary" style="cursor: pointer;"><strong >BUG缺陷模式库FAQ</strong></span>
										</a>			
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3"></div>
				</div>
				<!-- /.row -->
				
				<div class="row">
					<div style="width:900px;margin:0 auto;margin-top: 100px;">
						<div class="widget-box shadow-box" style="padding-bottom: 16px;">
							<div class="title" style="border-bottom-width:0px">
								<h3>
									<i class="glyphicon glyphicon-tree-conifer"></i> 知识专题
								</h3>
							</div>
							<div class="stream-list p-stream" style="margin-top: -10px;">
								<div class="col-sm-6 docTypeBox">
									<h1 style="font-style: oblique">
										<a href="webtype/view2c909b2b65e080b80165e09964f6019c/Pub1.html">需求分析 </a>																								
									</h1>
									<ul>
									
										<li><a href="">免费版</a></li>
										<li><a href="">开源版</a></li>
										<li><a href="">商业版</a></li>
										<li><a href="">WDA文档预览</a></li>
										<li><a href="">WTS在线答题</a></li>
										
										<li><a href="">知识管理</a></li>
										<li><a href="">开发工具</a></li>
										<li><a href="">知识演示</a></li>
										<li><a href="">其他</a></li>
									</ul>
								</div>
								<div class="col-sm-6 docTypeBox">
									<h1 style="font-style: oblique">
										<a href="webtype/view2c909b2b65e080b80165e09b631c01a7/Pub1.html">设计阶段 </a>										
																		
									</h1>
									<ul>
										
										<li><a href="">WCP开源版部署</a></li>
										<li><a href="">WCP免费版配置</a></li>
										<li><a href="">WDA配置及文件预览</a></li>
										<li><a href="">服务器配置</a></li>
										<li><a href="">数据库及SQL脚本</a></li>
										<li><a href="">tomcat配置</a></li>					
										<li><a href="">通用配置</a></li>		
									</ul>
								</div>
								<div class="col-sm-6 docTypeBox">
									<h1 style="font-style: oblique">
										<a href="">编码阶段 </a>									
																			
									</h1>
									<ul>
										<li><a href="">前台</a></li>			
										<li><a href="">后台</a></li>			
										<li><a href="">接口服务</a></li>		
										<li><a href="">学习其他</a></li>		
										<li><a href="">开发模板</a></li>
									</ul>
								</div>
								<div class="col-sm-6 docTypeBox">
									<h1 style="font-style: oblique">
										<a href="">测试阶段 </a>									
																		
									</h1>
									<ul>										
										<li><a href="">linux</a></li>		
										<li><a href="">windows</a></li>	
										<li><a href="">权限控制</a></li>			
										<li><a href="">页面样式</a></li>		
										<li><a href="">知识检索</a></li>			
										<li><a href="">服务报错</a></li>		
										<li><a href="">表单交互</a></li>	
										<li><a href="">异常恢复</a></li>				
										<li><a href="">IDE</a></li>									
										<li><a href="">其他</a></li>							
									</ul>
								</div>	
								<div class="col-sm-6 docTypeBox">
									<h1 style="font-style: oblique">
										<a href="">维护阶段 </a>									
																		
									</h1>
									<ul>										
										<li><a href="">linux</a></li>		
										<li><a href="">windows</a></li>	
										<li><a href="">权限控制</a></li>			
										<li><a href="">页面样式</a></li>		
										<li><a href="">知识检索</a></li>			
										<li><a href="">服务报错</a></li>		
										<li><a href="">表单交互</a></li>	
										<li><a href="">异常恢复</a></li>				
										<li><a href="">IDE</a></li>									
										<li><a href="">其他</a></li>							
									</ul>
								</div>
								<div class="col-sm-6 docTypeBox">
									<h1 style="font-style: oblique">
										<a href=""> 常见问题 </a>									
																			
									</h1>
									<ul>										
										<li><a href="">linux</a></li>		
										<li><a href="">windows</a></li>	
										<li><a href="">权限控制</a></li>			
										<li><a href="">页面样式</a></li>		
										<li><a href="">知识检索</a></li>			
										<li><a href="">服务报错</a></li>		
										<li><a href="">表单交互</a></li>	
										<li><a href="">异常恢复</a></li>				
										<li><a href="">IDE</a></li>									
										<li><a href="">其他</a></li>							
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#include "${request.contextPath}/knowledge/nav/foot.ftl">
	</body>
</html>
	
