<!DOCTYPE html>
<html>
	<head>
		<title>检索-BUG缺陷模式知识管理系统</title>
		<meta name="description" content='缺陷模式知识库管理系统'>		
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
										<form id="knowledgeSearchForm" action="${request.contextPath}/knowledge/solr/search.htm" method="post">
											<div class="input-group">
												<span class="input-group-addon" id="limitTypeTag">全部</span>
												<input type="text" class="form-control" id="keyWord" name="keyWord" value="${word}" placeholder="请输入关键字..."/>
												<div class="input-group-btn">
													<input class="btn  btn-danger" type="submit" value="检索"/>
													<a id="miniSearchPlusButtonId" class="btn btn-danger" href="${request.contextPath}/knowledge/solr/advancedSearch.htm">高级检索</a>																												
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
								<#list map?keys as key>
									<div class="col-sm-6 docTypeBox">
										<h1 style="font-style: oblique">
											<a href="">${key}</a>																								
										</h1>
										
										<ul>
											<#assign listAllType = map[key]>
											<#list listAllType as listAllType>
												<li><a href="${request.contextPath}/knowledge/box/index.htm?parentId=${listAllType.typeId}&typeId=${listAllType.typeId}">${listAllType.typeName}</a></li>	
											</#list>																
										</ul>
									</div>
								</#list>		
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#include "${request.contextPath}/knowledge/nav/foot.ftl">
	</body>
</html>