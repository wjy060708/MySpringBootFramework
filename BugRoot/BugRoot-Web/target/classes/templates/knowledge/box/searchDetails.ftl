<!DOCTYPE html>
<html>
	<head>
		<title>检索-BUG知识库管理系统</title>
				
		<meta charset="utf-8">
		<link rel="icon" href="favicon.ico" mce_href="favicon.ico" type="image/x-icon">		
		
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
		<link href="${request.contextPath}/useit/css/web-base.css" rel="stylesheet">
		<link href="${request.contextPath}/useit/css/web-black.css" rel="stylesheet">
		<link href="${request.contextPath}/useit/css/editInner.css" rel="stylesheet">
		<link rel="stylesheet" href="${request.contextPath}/res/global.css">
		
		<script src="${request.contextPath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>		
		<script src="${request.contextPath}/plugins/bootstrap/bootstrap.min.js"></script>
		<script src="${request.contextPath}/useit/js/respond.min.js"></script>
		<script type="text/javascript" src="${request.contextPath}/useit/js/wcpTypes.js"></script>
	</head>
	<body>
	
	    <!--网站头部 -->
		<div id="hd">
			<div class="wp">
				<#include "${request.contextPath}/knowledge/nav/common.ftl">
			</div>
		</div>
		<!--导航栏 -->
		<div class="deanheader" id="deanheader">
			<div class="w1000">
				<#include "${request.contextPath}/knowledge/nav/head.ftl">
			</div>
		</div>
		<div id="ycf-alert" class="modal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title">
							<i class="fa fa-exclamation-circle"></i> [Title]
						</h5>
					</div>
					<div class="modal-body small">
						<p>[Message]</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary ok" data-dismiss="modal">[BtnOk]</button>				
						<button type="button" class="btn btn-default cancel" data-dismiss="modal">[BtnCancel]</button>					
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="container ">
				<div class="row column_box">
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
										<form id="knowledgeSearchForm" action="${request.contextPath}/knowledge/solr/search.htm" method="post">
											<div class="input-group">
												<span class="input-group-addon" id="limitTypeTag">全部</span>
												<input type="text" class="form-control" name="keyWord" value="${queryString}" placeholder="请输入关键字..."/>
												<div class="input-group-btn">
													<button class="btn btn-danger" type="submit">检索</button>																													
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12" style="margin-top:20px;">
										<#list listFirstTypes as listFirstTypes>								
											<a href="${request.contextPath}/knowledge/box/index.htm?typeId=${listFirstTypes.typeId}" style="margin-right:10px">
												<span class="btn btn-info" style="cursor: pointer;"><strong>${listFirstTypes.typeName}</strong></span>
											</a>
										</#list>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3"></div>
				</div>
			
				<div class="row">
					<div class="col-sm-8">
						<div class="panel panel-default" style="margin-top: 60px;">
							<div class="panel-body">
								<div class="row ">
									<div class="col-sm-12">
										<div style="margin-bottom: 16px;color:red">
											<span class="glyphicon glyphicon-fire column_title" style="color:black">&nbsp;检索到<p style="color:red;float:right">${count}</p>结果数量为： </span>				
										</div>
									</div>
								</div>
								<hr style="margin-left: -16px; margin-right: -16px;" />
								<#list results as results>
									<div class="row">
										<div class="col-sm-12">	
											<div class="col-sm-12 doc_node">
												<div class="media">				
													<div class="media-body">
														<div style="margin-left: 10px;" >
															<div class="doc_node_title_box">
																<a class="doc_node_title_min" href="${request.contextPath}/knowledge/details.htm?modeId=${results.modeId}">
																	<span class="glyphicon glyphicon-book"></span>
																	${results.modeName}							
																</a>								
															</div>
															<div class="doc_node_content_box">
																<p class="doc_node_content">${results.modeRemark}</p>													
															</div>
															<div class="side_unit_info side_unit_info_left_box">																
																<!-- 实名 -->
																<a href="${request.contextPath}/knowledge/user/base.html" style="margin-left:10px;margin-top:20px;" title="${results.author}">
																	<span title="" class="side_unit_info">${results.author}</span>
																</a>
																
																${results.createTime?datetime}	
																
																<a href="${request.contextPath}/knowledge/box/index.htm" style="margin-left:18px;margin-top:20px;color:orange">知识分类:${results.typeName}</a>				
															</div>
															
															<br/>
														</div>
													</div>
												</div>
											</div>
											<div class="col-sm-12">
												<hr class="hr_split" />
											</div>
										</div>
									</div>
								</#list>
							</div>
							<div style="text-align: center">
					         
					        </div>
						</div>
						
					</div>
					
					<div class="col-sm-4 hidden-xs">
						<div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
				        	<h3 class="fly-panel-title"><strong>收藏排行榜</strong></h3>
				       		<!-- 主显示布局  -->
							<div id="framesQ3cKQ" class="frame move-span cl frame-1">								
								<div id="framesQ3cKQ_left" class="column frame-1-c">
									<div id="framesQ3cKQ_left_temp" class="move-span temp"></div>
									<div id="portal_block_1950" class="block move-span">
										<div id="portal_block_1950_content" class="dxb_bc">
                                        	<ul>
                                        		<#list listPrivateRankModes as listPrivateRankModes>
													<li class=" bgfff top15 ">
														<div class="deanarticec">
															<div class="deanarticer">
																<div class="deanarticername">
																	<div class="top">
																		<span class="font">TOP${listPrivateRankModes_index+1}</span><span class="tri"></span>
																	</div>
																	<a
																		href="${request.contextPath}/knowledge/details.htm?modeId=${listPrivateRankModes.modeId}"
																		target="_blank">${listPrivateRankModes.modeName}</a>
																</div>
																<div class="clear"></div>
																<div class="deanboxrsummary">本期季刊是专为踏上数字化创新之路的国内银行量</div>
																<div class="deanarticertag">
																	<div class="deanarticerforum">
																		知识分类：
																		<a href="${request.contextPath}/knowledge/box/index.htm?typeId=${listPrivateRankModes.typeId}">
																			${listPrivateRankModes.typeName}
																		</a>	
																	</div>
																	<div class="clear"></div>
																</div>
															</div>
															<div class="clear"></div>
														</div>
													</li><hr> 
												</#list>							
											</ul>
										</div>
									</div>
								</div>
							</div>
				      	</div>
					</div>
					<#include "${request.contextPath}/knowledge/nav/foot.ftl">
				</div>
			</div>
		</div>
	</body>
</html>