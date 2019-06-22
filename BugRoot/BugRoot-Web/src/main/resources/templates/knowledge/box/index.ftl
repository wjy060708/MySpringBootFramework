<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>BUG-知识库</title>

	    <meta name="application-name" content="缺陷模式 知识库" />
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
	
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/knowdetail.css" />
		
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
		
	  	<!--ztree css-->   
	    <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/css/zTreeStyle/zTreeStyle.css" />
	    
		<script src="${request.contextPath}/plugins/jquery/jquery-2.1.1.min.js"></script>
		<script src="${request.contextPath}/useit/js/common.js?r72" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/kym_list.js"  type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/forum.js?r72" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/jquery.js" type="text/javascript"></script>
	
		<script src="${request.contextPath}/useit/js/index.js" type="text/javascript" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/slides.js" type="text/javascript" type="text/javascript"></script>
		
		<script language="javascript" type="text/javascript">
			function killErrors() {
				return true;
			}
			
			window.onerror = killErrors;
		</script>
	</head>

   	<body id="nv_forum" class="pg_forumdisplay">
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

		<link rel="stylesheet" href="${request.contextPath}/useit/css/oculus.css?t=">
		<link rel="stylesheet" href="${request.contextPath}/useit/css/nc.css?t=">
		
		<script src="${request.contextPath}/useit/js/nv.js" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/nc.js?t="></script>
		<script src="${request.contextPath}/useit/js/oculus_nc.js?t="></script>
	
		<div id="wp" class="wp" style="background: #fff;">
	
			<!-- 界面索引-->
			<div id="pt" class="bm cl">
				<div class="z">
					<a href="" class="nvhm" title="首页">缺陷模式 知识库</a><em>&raquo;</em>
					<a href="">知识库</a><em>&rsaquo;</em>					
					<a href="">缺陷模式</a><em>&rsaquo;</em>
					<a href="">软件缺陷分类</a>
				</div>
			</div>
		
			<div class="boardnav">
				<!-- 界面左边知识分类部分-->
				<div id="ct" class="wp cl" style="margin-left: 180px">
					<div class="bdl" onmouseover="showMenu({'ctrlid':this.id, 'pos':'dz'});" style="width: 165px; margin-left: -180px">
					
					<TABLE border=0 height=600px align=left>
						<TR>
							<TD width=260px align=left valign=top style="BORDER-RIGHT: #999999 1px dashed">
								<ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
							</TD>
						</TR>
	     			</TABLE>	 
				</div>
				
				<div class="mn">
					<!-- 分页上部导航工具条-->
					<div class="bm bml pbn">
						<div class="bm_h cl">
							<h1 class="xs2">
								<a href="">缺陷模式知识库</a>
							</h1>
						</div>
					</div>
                    <IFRAME ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO width=100% SRC="${request.contextPath}/knowledge/mode/listAll.html"></IFRAME> 
                    
                    <#include "${request.contextPath}/knowledge/nav/foot.ftl">        			
				</div>				
			</div>
			
			<input type="hidden" name="typeId" id="typeId" value="${typeId}"/>
			<input type="hidden" name="parentId" id="parentId" value="${parentId}"/>
		</div>
		
		<!-- 知识分类 树依赖的外部资源-->
		<script src="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/js/jquery-1.4.4.min.js" type="text/javascript"></script>
		<script src="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/js/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>	
		
		<!-- 动态加载知识分类 -->
		<SCRIPT type="text/javascript" >
			var zTree;
			var demoIframe;
		
			var setting = {		
				view: {
					dblClickExpand: false,
					showLine: true,
					selectedMulti: false
				},
				data: {
				    key:{
				      name:"typeName"
				    },
				    
					simpleData: {
						enable:true,
						idKey: "typeId",
						pIdKey: "parentId",					
						rootPId: ""
					}
				},
				edit:{
				  drag:{
				    showIcon:true,
				    expandSpeed: "slow"
				  }
				},
				callback: {
					onClick: function(event,treeId, treeNode) {
						var zTree = $.fn.zTree.getZTreeObj("tree");
						var typeId = treeNode.typeId;
						if (treeNode.isParent) {
							zTree.expandNode(treeNode);
							return false;
						} else {
							demoIframe.attr("src","${request.contextPath}/knowledge/mode/listAll.html?typeId="+typeId);	
							
							return true;
						}
					}
				}
			};
			
			var zNodes;
		
			$(document).ready(function(){	
			   var typeId =$("#typeId").val();
			   var parentId = $("#parentId").val();
			   
			   demoIframe = $("#testIframe");
				$.ajax({  
					async : false,  
					cache:false,  
					type: 'POST',  
					dataType : "json",  
					url: "${request.contextPath}/knowledge/type/listAll.html",//请求的action路径  
					error: function () {//请求失败处理函数  
					    alert('请求失败');  
					},  
					success:function(data){ //请求成功后处理函数。     
					    zNodes = data;   //把后台封装好的简单Json格式赋给treeNodes  
					    demoIframe.attr("src","${request.contextPath}/knowledge/mode/listAll.html?typeId="+typeId);
					}  
				}); 
				demoIframe.bind("load", loadReady);
				var t = $("#tree");
				t = $.fn.zTree.init(t, setting, zNodes);
				
				var node = t.getNodeByParam("id",typeId);
				t.selectNode(node,true);
				t.expandNode(node,true,false);
				
			});
		
			function loadReady() {
				var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
				htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
				maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
				h = demoIframe.height() >= maxH ? minH:maxH ;
				if (h < 530) h = 530;
				demoIframe.height(h);
			}
			
	 	 </SCRIPT>	
	</body>
</html>
