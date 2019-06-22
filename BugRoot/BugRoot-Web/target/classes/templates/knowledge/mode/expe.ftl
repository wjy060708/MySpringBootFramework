<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/modules/main.css" />
  <link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
   
  <script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo" style="font-weight: bolder">
       		   当前缺陷模式--${knowMode.modeName}
        </h1>
      </div>
    </div>
  </div>


  <div class="content content-nav-base information-content">
    <div class="info-list-box">
      <div class="info-list w1200">
        <div class="item-box layui-clear" id="list-cont">
          <div class="item">
            <div class="text">
              <h4 style="font-weight: bold">缺陷引入原因</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont" style="overflow-y:scroll">
              	<ol>
					<#list listModeReason as listModeReason>
						<li>${listModeReason.reasonContent}</li><br>	
					</#list>
              	</ol>
			  </p>
            </div>
          </div>
          <div class="item">
            <div class="text">
              <h4 style="font-weight: bold">缺陷引发后果</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">
				 <ol>
					<#list listModeConsequence as listModeConsequence>
						<li>${listModeConsequence.consequenceContent}</li><br>	
					</#list>
              	</ol>
			  </p>
            </div>
          </div>
          <div class="item">
            <div class="text">
              <h4 style="font-weight: bold">缺陷预防措施</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">
              	<ol>
					<#list listModePrevention as listModePrevention>
						<li>${listModePrevention.preventionContent}</li><br>	
					</#list>
              	</ol>
              </p>
            </div>
          </div>
          <div class="item">
            <div class="text">
              <h4 style="font-weight: bold">缺陷经验之谈(相关资源)<br/>详情见《经验准则》</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">
              	<ol>
					<#list listModeRule as listModeRule>
						<li>${listModeRule.ruleContent}</li><br>	
					</#list>
              	</ol>
              </p>
            </div>
          </div>   
        </div>     
      </div>
    </div>
  </div>
</body>
</html>