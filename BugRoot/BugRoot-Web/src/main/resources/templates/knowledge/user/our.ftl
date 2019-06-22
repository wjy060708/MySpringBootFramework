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
	  <!-- 公有导航栏工具-->
			<ul class="layui-nav layui-nav-tree layui-inline layui-bg-blue" lay-filter="user">
				<li class="layui-nav-item layui-this">
			    	<a href="${request.contextPath}/knowledge/user/our.html">
			        	<i class="layui-icon">&#xe620;</i>
			      	  	基本设置
			      	</a>
			    </li>
			    <li class="layui-nav-item">
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
	        <li class="layui-this" lay-id="info">我的资料</li>
	        <li lay-id="avatar">头像</li>
	        <li lay-id="pass">密码</li>
	      </ul>
	      
	      <div class="layui-tab-content" style="padding: 20px 0;">
	        <div class="layui-form layui-form-pane layui-tab-item layui-show">
	          <form method="post">
	            <div class="layui-form-item">
	              <label for="L_email" class="layui-form-label">邮箱</label>
	              <div class="layui-input-inline">
	                <input type="text" id="L_email" name="email" required lay-verify="email" autocomplete="off" value="" class="layui-input">
	              </div>
	              <div class="layui-form-mid layui-word-aux">如果您在邮箱已激活的情况下，变更了邮箱，需<a href="activate.html" style="font-size: 12px; color: #4f99cf;">重新验证邮箱</a>。</div>
	            </div>
	            <div class="layui-form-item">
	              <label for="L_username" class="layui-form-label">昵称</label>
	              <div class="layui-input-inline">
	                <input type="text" id="L_username" name="username" required lay-verify="required" autocomplete="off" value="" class="layui-input">
	              </div>
	              <div class="layui-inline">
	                <div class="layui-input-inline">
	                  <input type="radio" name="sex" value="0" checked title="男">
	                  <input type="radio" name="sex" value="1" title="女">
	                </div>
	              </div>
	            </div>
	            <div class="layui-form-item">
	              <label for="L_city" class="layui-form-label">城市</label>
	              <div class="layui-input-inline">
	                <input type="text" id="L_city" name="city" autocomplete="off" value="" class="layui-input">
	              </div>
	            </div>
	            <div class="layui-form-item layui-form-text">
	              <label for="L_sign" class="layui-form-label">签名</label>
	              <div class="layui-input-block">
	                <textarea placeholder="随便写些什么刷下存在感" id="L_sign"  name="sign" autocomplete="off" class="layui-textarea" style="height: 80px;"></textarea>
	              </div>
	            </div>
	            <div class="layui-form-item">
	              <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
	            </div>
	            </form>
	          </div>
	          
              <!--上传头像-->
	          <div class="layui-form layui-form-pane layui-tab-item">
	            <div class="layui-form-item">
	              <div class="avatar-add">
	                <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
	                <button type="button" class="layui-btn" style="position:absolute; left:50%; top:35px; margin:0 0 0 -56px;" id="test">
	                  <i class="layui-icon">&#xe67c;</i>上传头像
	                </button>
	                <img src="${request.contextPath}/${userIcon}" class="layui-upload-img">
	                <span class="loading"></span>
	              </div>
	            </div>
	          </div>
	          
	          <div class="layui-form layui-form-pane layui-tab-item">
	            <form action="${request.contextPath}/sys/user/modifyPassword.htm" method="post">
	              <div class="layui-form-item">
	                <label for="L_nowpass" class="layui-form-label">当前密码</label>
	                <div class="layui-input-inline">
	                  <input type="password" id="L_nowpass" name="oldPassword" required lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
	              </div>
	              <div class="layui-form-item">
	                <label for="L_pass" class="layui-form-label">新密码</label>
	                <div class="layui-input-inline">
	                  <input type="password" id="L_pass" name="newPassword1" required lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
	                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
	              </div>
	              <div class="layui-form-item">
	                <label for="L_repass" class="layui-form-label">确认密码</label>
	                <div class="layui-input-inline">
	                  <input type="password" id="L_repass" name="newPassword2" required lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
	              </div>
	              <div class="layui-form-item">
	                <button class="layui-btn" lay-filter="*" lay-submit>确认修改</button>
	              </div>
	            </form>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
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
		  version: "2.0.0"
		  ,base: '../../res/mods/'
		}).extend({
		  fly: 'index'
		}).use('fly');
	</script>
	
	<script>
		layui.use(['upload'], function(){
		  var upload = layui.upload;
		   
		  //执行实例
		  var uploadInst = upload.render({
		    elem: '#test' //绑定元素
		    ,url: '/uploadUserIcon.htm' //上传接口
		    ,done: function(res){
		      if(res.code != 0) {
		           return layer.msg('上传失败');
		         } else {
		           jq("img").attr("src","${request.contextPath}/"+res.data.src);
		           return layer.msg('上传成功');
		         }
		    }
		    ,error: function(){
		    
		    }
		  });
		});
	 </script>
	</body>
	</html>