<!DOCTYPE html>
<html>
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		
		<title>[综合信息管理系统]</title>
		
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
		<link href="${request.contextPath}/useit/css/box.css" rel="stylesheet">
		<link href="${request.contextPath}/useit/css/checkbox.css" rel="stylesheet">
		
		<script src="${request.contextPath}/plugins/jquery/jquery-2.1.1.min.js"></script>
		<script src="${request.contextPath}/plugins/bootstrap/bootstrap.min.js"></script>	
		
		
		<style type="text/css">
			a{
				color:black;
				cursor:pointer;
			}
			
			a:hover {
				text-decoration: none;
			}
			
			.bgc-w {
				background-color: #fff;
			}
			
			.block{
				display: inline-block;
				width:20px;
			}
			
			.col-md-4 h4,.col-md-4 h5{
				display:inline-block;
				margin-left: 10px;
			}
			
			.col-md-4 h4{
				margin-top: 40px;
				margin-bottom: 1px;
			}
			
			.col-dm-4{
				-webkit-box-shadow: #666 0px 0px 100px;
				-moz-box-shadow: #666 0px 0px 100px;
				box-shadow: #666 0px 0px 10px;
				border-radius: 5px;
				margin-right: 48px;
				margin-left: 27px;
				padding-top: 20px;
				padding-bottom: 20px;
				padding-left: 20px;
			}
			
			.me .form-group{
				margin-bottom: 48px;
			}
			
			.me img{
				border-radius: 15px;
				cursor: pointer;
			}
		</style>
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
				
				<div class="clear"></div>
			</div>
		</div>

		<div class="row" style="padding-top: 80px;padding-left: 250px;padding-right: 250px;">
			<div class="row" style="padding-bottom: 30px;">
				<div class="col-md-12">
					<h1 style="font-size:48px;text-align:center;">知识专题</h1>
				</div>
			</div>
			<div class="col-md-12">
				<div class="bgc-w box">
					<div class="box-body no-padding">
						<div class="box-body">
							<div class="row me" style="padding-top: 40px;padding-left: 40px;">
								<#list listFirstTypes as listFirstTypes>
									<a href="${request.contextPath}/knowledge/moduleDetails.htm?typeId=${listFirstTypes.typeId}"">
										<div class="col-md-4 form-group">
											<label class="control-label" style="float:left;"><img src="${request.contextPath}/${listFirstTypes.imageUrl}" style="width:100px;height:100px;"></label>
											<div>
												<h4>${listFirstTypes.typeName}</h4><br>
												<h5>${listFirstTypes.typeRemark}</h5>
											</div>
										</div>
									</a>
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

