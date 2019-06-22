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
	</head>
	
	<body>
		 <!-- 公有导航栏工具-->
		<div class="hdc cl">
			<h2>
				<a href="${request.contextPath}/knowledge/box/index.htm" title="Useit 知识库">
				<img src="${request.contextPath}/useit/images/logo.png" height="100px" border="0" title="知识库"></a>
			</h2>
			
			<div class="" id="loginBtn" >
				<div class="deanlogin">
					<form action="${request.contextPath}/knowledge/box/search.htm" method="post" id="lucenesearchFormId" style="margin-top: 35px;" class="navbar-form navbar-right hidden-xs hidden-sm " role="search">
						<div class="form-group">
							<div class="input-group" style="max-width: 160px;">
								<input type="text" name="word" id="wordId" value="" class="form-control" placeholder="检索词...">
								<input type="hidden" id="pageNumId" name="pagenum">
							
								<span class="input-group-btn">						
									<button type="submit" class="btn btn-default">
										<span class="glyphicon glyphicon-search" aria-hidden="true"></span>检索
									</button>
								</span>
							</div>
						</div>
						<a id="miniSearchPlusButtonId" class="btn btn-danger btn-sm" href="${request.contextPath}/knowledge/solr/advancedSearch.htm">高级检索</a>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
