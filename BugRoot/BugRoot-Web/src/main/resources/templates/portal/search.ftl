<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>基于缺陷模式知识库管理系统</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
  <link rel="stylesheet" href="${request.contextPath}/res/global.css">
  <link rel="stylesheet" href="${request.contextPath}/styles/main.css">
  
</head>
<body>
<div class="fly-header layui-bg-black fly-panel fly-column">
  <div class="layui-container">
    <ul class="layui-clear">
      <li class="layui-hide-xs layui-this"><a href="${request.contextPath}/search.htm">首页</a></li> 
      <li class="layui-hide-xs layui-this"><a href="jie/index.html">共享 <span class="layui-badge-dot"></span></a></li> 
      <li class="layui-hide-xs layui-this"><a href="${request.contextPath}/knowledge/box/list.htm">知识库</a></li> 
      <li class="layui-hide-xs layui-this"><a href="${request.contextPath}/knowledge/community/default.htm">知识社区</a></li> 
      <li class="layui-hide-xs layui-this"><a href="jie/index.html">个人中心</a></li> 
    </ul> 
    
    <div class="fly-column-right layui-hide-xs"> 
      <span class="fly-search"><i class="layui-icon"></i></span> 
      <a href="jie/add.html" class="layui-btn">发表知识</a> 
    </div> 
  </div>
</div>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8">
      <div class="fly-panel">
	     <div class="layui-carousel imgbox"  id="test1">
	       <div carousel-item  class="imgH">
	         <div><img style="width: 100%" src="${request.contextPath}/images/Product_img3.jpg"></div>
	         <div><img style="width: 100%" src="${request.contextPath}/images/us_img3.jpg"></div>
	         <div><img style="width: 100%" src="${request.contextPath}/images/us_img1.jpg"></div>
	       </div>
	     </div>
	  </div>
    	
      <div class="fly-panel">
        <div class="fly-panel-title fly-filter layui-bg-black ">
          <a class="layui-hide-xs layui-this">本周热门知识</a>
          <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin" style="color: #FF5722;">去签到</a>
        </div>
        <ul class="fly-list">
        	<#list listModes as listModes>
		          <li style="height:auto;">
		            <a href="user/home.html" class="fly-avatar">
		              <img src="${request.contextPath}/images/Product_img3.jpg" alt="贤心">
		            </a>
		            <h2>
		              <a class="layui-badge">高频</a>
		              <a href="${request.contextPath}/knowledge/details.html?modeId=${listModes.modeId}">${listModes.modeName}</a>
		        
		            </h2>
		            <div class="fly-list-badge">
             
		              <span class="layui-badge layui-bg-black">分类版块:</span>
		              <a href="" class="layui-badge layui-bg-red">${listModes.typeName}</a>
             
            		</div>
		            <p>${listModes.modeRemark}</p>
		            
		            <div class="fly-list-info">
		              <a href="user/home.html" link>
		                <cite>${listModes.author}</cite>
		                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>		               
		              </a>
		              <span>${listModes.createTime?datetime}</span>
		              
		              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
		             
		              <span class="fly-list-nums"> 
		                <i class="iconfont icon-pinglun1" title="反馈"></i> 66
		              </span>
		            </div>
		            <div class="fly-list-badge">
		              <!--
		              <span class="layui-badge layui-bg-black">置顶</span>
		              <span class="layui-badge layui-bg-red">精帖</span>
		              -->
		            </div>
		          </li>
		     </#list>
        </ul>
      </div>
    </div>
    <div class="layui-col-md4">

      <div class="fly-panel" style="height:150px;">
        <h3 class="fly-panel-title">快捷通道</h3>
       
	    <label class="layui-form-label"><a href="${request.contextPath}/knowledge/box/list.htm">知  识  库</a></label>
	    <label class="layui-form-label">模式集锦</label>
	    <label class="layui-form-label">经验准则</label>
	    <label class="layui-form-label">知识热议</label>
	    <label class="layui-form-label">知识交流</label>
        
      </div>

      <div class="fly-panel fly-signin" style="height:150px;">
		<h3 class="fly-panel-title">知识分类</h3>
		
        <label class="layui-form-label">分析阶段</label>
	    <label class="layui-form-label">设计阶段</label>
	    <label class="layui-form-label">编码阶段</label>
	    <label class="layui-form-label">测试阶段</label>

      </div>
      
      <dl class="fly-panel fly-list-one">
        <dt class="fly-panel-title">高频缺陷模式</dt>
	    	<#list listModes as listModes>
		        <dd>
		          <a href="${request.contextPath}/knowledge/details.html?modeId=${listModes.modeId}">${listModes_index+1}.${listModes.modeName}</a>
		          <span><i class="iconfont icon-pinglun1"></i> 16</span>
		        </dd>
		    </#list>
      </dl>

      <div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
        <h3 class="fly-panel-title">用户反馈</h3>
        <dl>
          <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
          <dd>
            <a href="user/home.html">
              <img src="${request.contextPath}/images/Product_img3.jpg"><cite>贤心</cite><i>106次反馈</i>
            </a>
          </dd>
        </dl>
      </div>

      <div class="fly-panel">
        <div class="fly-panel-title">
          这里可作为广告区域
        </div>
        <div class="fly-panel-main">
          <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu" time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;">LayIM 3.0 - layui 旗舰之作</a>
        </div>
      </div>
      
      <div class="fly-panel fly-link">
        <h3 class="fly-panel-title">友情链接</h3>
        <dl class="fly-panel-main">
          <dd><a href="http://www.layui.com/" target="_blank">layui</a><dd>
          <dd><a href="http://layim.layui.com/" target="_blank">WebIM</a><dd>
          <dd><a href="http://layer.layui.com/" target="_blank">layer</a><dd>
          <dd><a href="http://www.layui.com/laydate/" target="_blank">layDate</a><dd>
          <dd><a href="mailto:xianxin@layui-inc.com?subject=%E7%94%B3%E8%AF%B7Fly%E7%A4%BE%E5%8C%BA%E5%8F%8B%E9%93%BE" class="fly-link">申请友链</a><dd>
        </dl>
      </div>

    </div>
  </div>
</div>

<div class="fly-footer">
  <p><a href="http://fly.layui.com/" target="_blank">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">layui.com 出品</a></p>
  <p>
    <a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
    <a href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
    <a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
  </p>
</div>
 
<script src="${request.contextPath}/plugins/layui/layui.js"></script>
<script>
layui.cache.page = '';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '${request.contextPath}/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "3.0.0"
  ,base: '${request.contextPath}/res/mods/'
}).extend({
  fly: 'index'
}).use('fly');

layui.use(['carousel','jquery','element'],function(){
    var carousel = layui.carousel,$ = layui.$;
    //建造实例
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

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>