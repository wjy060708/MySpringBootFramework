
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>发表问题 编辑问题 公用</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
  <link rel="stylesheet" href="${request.contextPath}/res/global.css">
</head>
<body>
 <!-- nav部分 -->
 <div class="fly-header layui-bg-black fly-panel fly-column">
  <div class="layui-container">
     <ul class="layui-clear">
      <li class="layui-hide-xs layui-this"><a href="${request.contextPath}/search.htm">首页</a></li> 
      <li class="layui-hide-xs layui-this"><a href="jie/index.html">共享 <span class="layui-badge-dot"></span></a></li> 
      <li class="layui-hide-xs layui-this"><a href="${request.contextPath}/knowledge/community/default.htm">知识库</a></li> 
      <li class="layui-hide-xs layui-this"><a href="${request.contextPath}/knowledge/community/default.htm">知识社区</a></li> 
      <li class="layui-hide-xs layui-this"><a href="jie/index.html">个人中心</a></li> 
    </ul>  
    
    <div class="fly-column-right layui-hide-xs"> 
      <span class="fly-search"><i class="layui-icon"></i></span> 
      <a href="jie/add.html" class="layui-btn">发表知识</a> 
    </div> 
  </div>
</div>

<div class="layui-container fly-marginTop">
  <div class="fly-panel" pad20 style="padding-top: 5px;">
    <!--<div class="fly-none">没有权限</div>-->
    <div class="layui-form layui-form-pane">
      <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title">
          <li class="layui-this">发表新帖<!-- 编辑帖子 --></li>
        </ul>
        <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
          <div class="layui-tab-item layui-show">
            <form action="${request.contextPath}/knowledge/publishResult.htm" method="post">
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md3">
                  <label class="layui-form-label">所在专栏</label>
                  <div class="layui-input-block">
                    <select lay-verify="required" name="class" lay-filter="column"> 
                      <option></option> 
                      <option value="0">提问</option> 
                      <option value="99">分享</option> 
                      <option value="100">讨论</option> 
                      <option value="101">建议</option> 
                      <option value="168">公告</option> 
                      <option value="169">动态</option> 
                    </select>
                  </div>
                </div>
                <div class="layui-col-md9">
                  <label for="L_title" class="layui-form-label">标题</label>
                  <div class="layui-input-block">
                    <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
                    <!-- <input type="hidden" name="id" value="{{d.edit.id}}"> -->
                  </div>
                </div>
              </div>
              <div class="layui-row layui-col-space15 layui-form-item layui-hide" id="LAY_quiz">
                <div class="layui-col-md3">
                  <label class="layui-form-label">所属产品</label>
                  <div class="layui-input-block">
                    <select name="project">
                      <option></option>
                      <option value="layui">layui</option>
                      <option value="独立版layer">独立版layer</option>
                      <option value="独立版layDate">独立版layDate</option>
                      <option value="LayIM">LayIM</option>
                      <option value="Fly社区模板">Fly社区模板</option>
                    </select>
                  </div>
                </div>
                <div class="layui-col-md3">
                  <label class="layui-form-label" for="L_version">版本号</label>
                  <div class="layui-input-block">
                    <input type="text" id="L_version" value="" name="version" autocomplete="off" class="layui-input">
                  </div>
                </div>
                <div class="layui-col-md6">
                  <label class="layui-form-label" for="L_browser">浏览器</label>
                  <div class="layui-input-block">
                    <input type="text" id="L_browser"  value="" name="browser" placeholder="浏览器名称及版本，如：IE 11" autocomplete="off" class="layui-input">
                  </div>
                </div>
              </div>
              <div class="layui-form-item layui-form-text">
                <div class="layui-input-block">
                  <textarea id="L_content" name="content" required lay-verify="required" placeholder="详细描述" class="layui-textarea fly-editor" style="height: 260px;"></textarea>
                </div>
              </div>
              <div class="layui-form-item">
                <div class="layui-inline">
                  <label class="layui-form-label">悬赏飞吻</label>
                  <div class="layui-input-inline" style="width: 190px;">
                    <select name="experience">
                      <option value="20">20</option>
                      <option value="30">30</option>
                      <option value="50">50</option>
                      <option value="60">60</option>
                      <option value="80">80</option>
                    </select>
                  </div>
                  <div class="layui-form-mid layui-word-aux">发表后无法更改飞吻</div>
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_vercode" class="layui-form-label">人类验证</label>
                <div class="layui-input-inline">
                  <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">
                  <span style="color: #c00;">1+1=?</span>
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" lay-filter="*" lay-submit>立即发布</button>
              </div>
            </form>
          </div>
        </div>
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
layui.cache.page = 'jie';
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
</script>

</body>
</html>