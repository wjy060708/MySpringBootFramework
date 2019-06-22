<!DOCTYPE html>
<html>
	<head>
	  <meta charset="utf-8">
		<title>用户中心</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		  
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" href="${request.contextPath}/res/global.css">
		<link rel="stylesheet" href="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/css/index.css">
		<link rel="stylesheet" href="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/css/metroStyle.css">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link href="${request.contextPath}/plugins/bootstrap/bootstrap-theme.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/jeasyui-1.5/themes/default/easyui.css" />
		
		<link href="${request.contextPath}/plugins/jeasyui-extensions/jeasyui.css" rel="stylesheet" type="text/css" />
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
		<br><br>

	  <div class="layui-container fly-marginTop fly-user-main">
		<ul class="layui-nav layui-nav-tree layui-inline layui-bg-blue" lay-filter="user">
			<li class="layui-nav-item">
		    	<a href="${request.contextPath}/knowledge/user/our.html">
		        	<i class="layui-icon">&#xe620;</i>
		      	  	基本设置
		      	</a>
		    </li>
		    <li class="layui-nav-item layui-this">
		      	<a href="${request.contextPath}/knowledge/user/base.html">
		        	<i class="layui-icon">&#xe612;</i>
		       		 用户中心
		      	</a>
		    </li>
		    <li class="layui-nav-item">
		      	<a href="${request.contextPath}/knowledge/toPublishKnow.htm">
		        	<i class="layui-icon">&#xe611;</i>
		     	  	创建知识
		      	</a>
		    </li>
		</ul>
		
		  <div class="fly-panel fly-panel-user" pad20>
		    <div class="layui-tab layui-tab-card" lay-filter="user">
		      <ul class="layui-tab-title" id="LAY_mine">
		        <li data-type="mine-jie" lay-id="index" class="layui-this">我创建的知识（<span>${countMyModes}</span>）</li>
		        <li data-type="collection" data-url="/collection/find/" lay-id="collection">我收藏的知识（<span>16</span>）</li>
		        <li data-type="collection" data-url="/collection/find/" lay-id="collection">我的文件资源（<span>16</span>）</li>
		      </ul>
		      
		      <div class="layui-tab-content" style="padding: 20px 0;">
		        <div class="layui-tab-item layui-show" >
		        <div id ="myKnow">
		        <#list knowModes as knowModes>
		          <ul class="mine-view jie-row">
		            <li>
		              <a class="jie-title" href="${request.contextPath}/knowledge/details.htm?modeId=${knowModes.modeId}" target="_blank">${knowModes.modeName}</a>
		              <i>${knowModes.createTime?datetime}</i>
		              <em><a style="margin-right:130px" class="mine-edit" href="#" onclick="MyKnow('${knowModes.modeId}')">删除</a></em>
		              <em><i style="color:orange;">审核中</i></a>
		                661阅/10答</em>
		            </li>
		          </ul>
		          </#list>
		          </div>
		          <div style="text-align: left">
		              <div id="page"></div>
		          </div>
		        </div>
		
		        <div class="layui-tab-item">
		          <div id ="myPrivate">
		          <#list knowModePrivates as knowModePrivates>
		          <ul class="mine-view jie-row">
		            <li>
		               <a class="jie-title" href="${request.contextPath}/knowledge/details.htm?modeId=${knowModePrivates.modeId}" target="_blank">${knowModePrivates.modeName}</a>
		              <i>收藏于${knowModePrivates.createTime?datetime}</i>
		               <em><a style="margin-left:130px" class="mine-edit" href="#" onclick="PrivateDelete('${knowModePrivates.privateId}')">删除</a></em>
		              </li>
		          </ul>   
		          </#list>  
		         </div>
		         <div style="text-align: left">
		              <div id="page2"></div>
		          </div>
		        </div>
		        
		        <div class="layui-tab-item">
		          <ul class="mine-view jie-row">
		            <li>
		              <a href=""><img src="${request.contextPath}/useit/images/e068a9c861c0656ee44869af6314d63.png" border="0" style="height:30px" alt="" /></a>
		              <a class="jie-title" href="../jie/detail.html" target="_blank">McK_Banking_CEO_Quarterly_2018_4.pdf</a>
		              <i>23.71 MB, 11人喜欢 , 75人浏览</i> 
		              <em>收藏于23小时前</em>
		            </li>
		            <li>
		              <a href=""><img src="${request.contextPath}/useit/images/e068a9c861c0656ee44869af6314d63.png" border="0" style="height:30px" alt="" /></a>
		              <a class="jie-title" href="../jie/detail.html" target="_blank">McK_Banking_CEO_Quarterly_2018_4.pdf</a>
		              <i>23.71 MB, 11人喜欢 , 75人浏览</i> 
		              <em>收藏于23小时前</em>
		            </li>
		            <li>
		              <a href=""><img src="${request.contextPath}/useit/images/e068a9c861c0656ee44869af6314d63.png" border="0" style="height:30px" alt="" /></a>
		              <a class="jie-title" href="../jie/detail.html" target="_blank">McK_Banking_CEO_Quarterly_2018_4.pdf</a>
		              <i>23.71 MB, 11人喜欢 , 75人浏览</i> 
		              <em>收藏于23小时前</em>
		            </li>
		            <li>
		              <a href=""><img src="${request.contextPath}/useit/images/e068a9c861c0656ee44869af6314d63.png" border="0" style="height:30px" alt="" /></a>
		              <a class="jie-title" href="../jie/detail.html" target="_blank">McK_Banking_CEO_Quarterly_2018_4.pdf</a>
		              <i>23.71 MB, 11人喜欢 , 75人浏览</i> 
		              <em>收藏于23小时前</em>
		            </li>
		            <li>
		              <a href=""><img src="${request.contextPath}/useit/images/e068a9c861c0656ee44869af6314d63.png" border="0" style="height:30px" alt="" /></a>
		              <a class="jie-title" href="../jie/detail.html" target="_blank">McK_Banking_CEO_Quarterly_2018_4.pdf</a>
		              <i>23.71 MB, 11人喜欢 , 75人浏览</i> 
		              <em>收藏于23小时前</em>
		            </li>
		          </ul>       
		        </div>
		      </div>    
		    </div>     
		  </div>
	  <input type="hidden" id="countMyModes" value="${countMyModes}">
	  <input type="hidden" id="countMyPrivate" value="${countMyPrivate}">
	</div>
	
		<#include "${request.contextPath}/knowledge/nav/foot.ftl">
		<script src="${request.contextPath}/plugins/layui/layui.js"></script>
		<script>
		layui.cache.page = 'user';
		layui.cache.user = {
		  username: '游客'
		  ,uid: -1
		  ,avatar: '../../res/images/avatar/00.jpg'
		  ,experience: 83
		  ,sex: '男'
		};
		layui.config({
		  version: "3.0.0"
		  ,base: '../../res/mods/'
		}).extend({
		  fly: 'index'
		}).use('fly');
		</script>
		
		<script>
			 function PrivateDelete(privateId){
		        jq.ajax({
		          type:"post",
		          url:'${request.contextPath}/knowledge/mode/private/delete.htm',
		          data:{
		            privateId:privateId
		          },
		           success:function(data) {
		               location.reload(true);
		            }
		        });
		     };
		     
		      function MyKnow(modeId){
		        jq.ajax({
		          type:"post",
		          url:'${request.contextPath}/knowledge/mode/delete.htm',
		          data:{
		            modeIds:modeId
		          },
		           success:function(data) {
		               location.reload(true);
		            }
		        });
		     };
		</script>		  
		
		<script>				
			 layui.use('laypage',function(){
			    var total = jq("#countMyModes").val();
				var laypage = layui.laypage;	
				laypage.render({
					elem:'page'
					,count:total
					,limit:10
					,jump: function(obj,first) {
						if(!first) {
							var url = '${request.contextPath}/knowledge/user/listPage';
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
									jq("#myKnow").html("");
									for(var i = 0;i<data.rows.length;i++) {
									var html = '<ul class="mine-view jie-row">'
									+'<li>'
									+'<a class="jie-title" href="${request.contextPath}/knowledge/details.htm?modeId='+data.rows[i].modeId+'" target="_blank">'+ data.rows[i].modeName
									+'</a>'
									+'<i>'+data.rows[i].createTime
									+'</i>'
									+'<em>'
									+'<a style="margin-right:130px" class="mine-edit" href="#" onclick="MyKnow('+data.rows.modeId+')">删除'
									+'</a>'
									+'</em>'
									+' <em><i style="color:orange;">审核中</i>661阅/10答</em>'
	                                +'</em>'
									+'</li>'
									+' </ul>'
									
									jq("#myKnow").append(html);
									}
								}						
							});
						}
					}	
				});
			 });
		 </script>	
		 
		 <script>				
			 layui.use('laypage',function(){
			    var total = jq("#countMyPrivate").val();
				var laypage = layui.laypage;	
				laypage.render({
					elem:'page2'
					,count:total
					,limit:10
					,jump: function(obj,first) {
						if(!first) {
							var url = '${request.contextPath}/knowledge/user/listPagePrivate';
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
								   console.log(data);
									jq("#myPrivate").html("");
									for(var i = 0;i<data.rows.length;i++) {
									var html = '<ul class="mine-view jie-row">'
									+'<li>'
									+'<a class="jie-title" href="${request.contextPath}/knowledge/details.htm?modeId='+data.rows[i].modeId+'" target="_blank">'+ data.rows[i].modeName
									+'</a>'
									+'<i>收藏于'+data.rows[i].createTime
									+'</i>'
									+'<em>'
									+'<a style="margin-right:130px" class="mine-edit" href="#" onclick="PrivateDelete('+data.rows[i].privateId+')">删除'
									+'</a>'
									+'</em>'
									+'</li>'
									+' </ul>'
									
									jq("#myPrivate").append(html);
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