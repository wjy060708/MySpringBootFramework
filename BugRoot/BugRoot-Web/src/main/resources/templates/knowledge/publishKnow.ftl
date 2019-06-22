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
			<li class="layui-nav-item">
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
		    <li class="layui-nav-item layui-this">
		      	<a href="${request.contextPath}/knowledge/toPublishKnow.htm">
		        	<i class="layui-icon">&#xe611;</i>
		     	  	创建知识
		      	</a>
		    </li>
		</ul>
  
  		<div class="fly-panel fly-panel-user" pad20 >
     		<div class="layui-container">
	  			<div class="fly-panel">
	    			<div class="layui-form layui-form-pane">
	      				<div class="layui-tab layui-tab-card" lay-filter="user">
					        <ul class="layui-tab-title">
					        	<li class="layui-this" lay-id="111">上传知识<span class="layui-badge">1</span> </li>
					          	<li class="" lay-id="222">完善知识<span class="layui-badge layui-bg-green">2</span></li>
					        </ul>
	        				<div class="layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
	          					<div class="layui-tab-item layui-show">            
						            <form action=""  id="knowModeForm" class="layui-form">
						            	<div class="layui-row layui-col-space15 layui-form-item">
						                	<div class="layui-col-md7">
						                    	<label class="layui-form-label">所在专栏</label>
						                  	    <div id="demo2" class="select-tree layui-form-select layui-input-block"></div>
						                	</div>
						                </div> 
						              	<div class="layui-row layui-col-space15 layui-form-item">
							            	<div class="layui-col-md7">
										    	<label class="layui-form-label">模式标题</label>
											  	<div class="layui-input-block">
											     	<input type="text" id="L_title" name="modeName" required lay-verify="required" autocomplete="off" class="layui-input">
											  	</div>
										  	</div>
									     	<div class="layui-col-md7">
											  	<label class="layui-form-label">模式描述</label>
											  	<div class="layui-input-block">
											     	<input type="text" id="L_title" name="modeRemark" required lay-verify="required" autocomplete="off" class="layui-input">
											  	</div>
										   	</div> 
									   	</div>
									   	
									 	<label id="add" class="layui-form-label">添加标签<i class="layui-icon layui-icon-add-circle "></i></label>
									 	<label id="delete" class="layui-form-label">删除标签<i class="layui-icon layui-icon-close"></i></label>
									 	<span id="optips"style="color:red">最多可添加5条标签<span>
									 	
									   	<div class="layui-row layui-col-space15 layui-form-item">
							            	<div class="layui-col-md7">
										    	<table class="layui-table">
													  <tbody>
													    <tr id= "opts">
													    </tr>
													  </tbody>
													</table>
										  	</div>
									   	</div>  
									   	
									   	<hr>
									    <input type="hidden" id="image" name="imgeUrl"  autocomplete="off" class="layui-input">
									   	<div class="layui-upload">
									   	  <button type="button" class="layui-btn" id="test">上传图片</button> 
									   	  <div class="layui-upload-list">
									   	    <img class="layui-upload-img" id="demo1" style="width:300px;height:300px;">
									   	    <p id="demoText"></p>
									   	  </div>
									   	</div>
									   	
							            <div class="layui-form-item">
							            	<button class="layui-btn" lay-filter="formSubmit" lay-submit="">进入下一步</button>
							            </div>
						            </form>
	        					</div>	
	        					
	        					<div class="layui-tab-item">            
						            <form action="" method="post" id="knowModeDetailsForm">
						            	<div class="layui-row layui-col-space7 layui-form-item">
						                	<div class="layui-col-md7">
										    	<label class="layui-form-label">缺陷名称</label>
											  	<div class="layui-input-block">
											  	    <input type="hidden" id="modeId1" name="modeId1"  autocomplete="off" class="layui-input">
											  	    <input type="hidden" id="typeId" name="typeId"  autocomplete="off" class="layui-input">
											     	<input type="text" id="modeName1" name="modeName1"  autocomplete="off" class="layui-input" disabled>
											  	</div>
										  	</div>
						                </div> 
						                
						              	<div class="layui-row layui-col-space15 layui-form-item">
							            	<div class="layui-col-md7">
										    	<label class="layui-form-label"  style="height:100px">缺陷原因</label>
											  	<div class="layui-input-block">
											  	    <textarea name ="reasonContent" id="reasonContent" placeholder="请输入内容"  class="layui-textarea"></textarea>
											  	</div>
										  	</div>
										  	
									     	<div class="layui-col-md7">
											  	<label class="layui-form-label" style="height:100px">缺陷后果</label>
											  	<div class="layui-input-block">
											     	 <textarea name ="consequenceContent" id="consequenceContent" placeholder="请输入内容" class="layui-textarea"></textarea>
											  	</div>
										   	</div> 
										   	
										   	<div class="layui-col-md7">
											  	<label class="layui-form-label" style="height:100px">缺陷预防</label>
											  	<div class="layui-input-block">
											     	 <textarea name ="preventionContent" id="preventionContent" placeholder="请输入内容" class="layui-textarea"></textarea>
											  	</div>
										   	</div> 
									   	</div>
						           
						            	<div class="layui-upload">
										  	<button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
										  	<div class="layui-upload-list">
										    	<table class="layui-table" style="width:670px;" >
										      		<thead>
												        <tr>
												        	<th>文件名</th>
												          	<th>大小</th>
												          	<th>状态</th>
												          	<th>操作</th>
												        </tr>
										      		</thead>
										      		<tbody id="demoList"></tbody>
										    	</table>
										  	</div>
										</div> 	
										
										<div class="layui-form-item">
							            	<button  data-method="offset" data-type="auto" class="layui-btn" lay-filter="formSubmit123" lay-submit="">提交知识</button>
							            </div>				
							            	
						            </form>
	        					</div>	           
	     					</div>
	  					</div>
					</div>
				</div>	  
			</div>
  		</div>
	</div>
	<#include "${request.contextPath}/knowledge/nav/foot.ftl">

	<script src="${request.contextPath}/plugins/layui/layui.js"></script>
	<script src="${request.contextPath}/plugins/layui/lay/modules/layer.js"></script>

	<script src="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/js/jquery-1.4.4.min.js" type="text/javascript"></script>
	<script src="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>
	<script src="${request.contextPath}/plugins/jquery-plugins/jquery-ztree/js/selectTree.js" type="text/javascript"></script>

	<!--文件上传-->
	<script>
    	layui.use(['form', 'element','upload','layedit','layer'], function () {
	       var $ = layui.jquery, upload = layui.upload, layedit = layui.layedit, form = layui.form,layer = layui.layer,element = layui.element;
           var arr = [];
	       //多文件列表示例
	       var demoListView = $('#demoList'),
	       uploadListIns = upload.render({
		       elem: '#testList'
		       ,url: '${request.contextPath}/sys/file/upload.jsn'
		       ,accept: 'file'
		       ,multiple: true
		       ,auto: true
		       ,choose: function(obj){   
		   			var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
	      			//读取本地文件
	     			obj.preview(function(index, file, result){
				        var tr = $(['<tr id="upload-'+ index +'">'
				          ,'<td>'+ file.name +'</td>'
				          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
				          ,'<td>等待上传</td>'
				          ,'<td>'
				          ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
				          ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
				          ,'</td>'
				          ,'</tr>'].join(''));
	        
			        //单个重传
			        tr.find('.demo-reload').on('click', function(){
			          obj.upload(index, file);
			        });
	        
			        //删除
			        tr.find('.demo-delete').on('click', function(){
			          delete files[index]; //删除对应的文件
			          tr.remove();
			          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
			        });
			        
			        demoListView.append(tr);
			      });
				    }
				    ,done: function(res, index, upload){
				      var fileId = res.data.fileId;
				      var fileName = res.data.fileName;
				      $.ajax({  
							type: 'POST',   
							url: "${request.contextPath}/knowledge/mode/rule/save.htm",//请求的action路径  
							data:{
							  resourceId:fileId,
							  ruleContent:fileName,
							  modeId:$("#modeId1").val(),
							  typeId:$("#modeId1").val()
							}
						}); 
				      if(res.success){ //上传成功
				        var tr = demoListView.find('tr#upload-'+ index),tds = tr.children();
				       
				        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
				        tds.eq(3).html(''); //清空操作
				        
				        return delete this.fileData[index]; //删除文件队列已经上传成功的文件
				      }
				      this.error(index, upload);
					    }
					    ,error: function(index, upload){
					      var tr = demoListView.find('tr#upload-'+ index)
					      ,tds = tr.children();
					      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
					      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
					    }
					   });
	   
					   //富文本上传图片
					   layedit.set({
					     uploadImage:{
					       url:'${request.contextPath}/uploadImages',
					       type:'post'
					     }
					   });
					   
					   layedit.build('L_content',{
					     height:150
					   });
					   
					   layedit.build('L_content2',{
					     height:150
					   });
					   
					   layedit.build('L_content3',{
					     height:150
					   });
					   
					});
				    <!--树形下拉框 -->
				    var demo2;
				    
				    var zNodes;
			
				    $(document).ready(function () {
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
							}  
						}); 
								
				        initSelectTree("demo2", false);
				        $(".layui-nav-item a").bind("click", function () {
				            if (!$(this).parent().hasClass("layui-nav-itemed") && !$(this).parent().parent().hasClass("layui-nav-child")) {
				                $(".layui-nav-tree").find(".layui-nav-itemed").removeClass("layui-nav-itemed")
				            }
				        });
				        
				   $("#add").click(function(){
		   	            if($("#opts td").size()<6){
		   	               $("#opts").append("<td><input class='layui-input' style='width:50px' name='keyWord'></input></td>");
		   	            }
		   	        });
		   	        
		   	        $("#delete").click(function(){
		   	           $("#opts>td").last().remove();
		   	        });
				  });
		</script>
		
		<script>
		   layui.use(['form','element','layer'],function(){
		      var $ = layui.jquery, form = layui.form,element = layui.element,layer = layui.layer;

		      form.on('submit(formSubmit)',function(data){
		          $.ajax({
		             url:'${request.contextPath}/knowledge/mode/save.htm',
		             data:$("#knowModeForm").serialize(),
		             method:'post',
		             success:function(result){
		                $("#typeId").val(result.data.typeId);
		                $("#modeId1").val(result.data.modeId);
		                $("#modeName1").val(result.data.modeName);
		                element.tabChange('user','222'); 
		                
		             }
		          });
		          return false;
		      });
		      
		      form.on('submit(formSubmit123)',function(data){
		          $.ajax({
		             url:'${request.contextPath}/knowledge/mode/saveKnowMode.htm',
		             data:data.field,
		             method:'post',
		             success:function(result){
		                $("#reasonContent").val("");
		                $("#consequenceContent").val("");
		                $("#preventionContent").val("");	
		              /*  layer.open({
				              type:0,
				              content:"添加成功"
				         });	  */       
		             }
		          });
		          return false;
		      });
		   });
		</script>
		
		<script>
		   layui.use(['form','layer','upload'],function(){

		      var $ = layui.jquery,layer = layui.layer,upload = layui.upload;

		      var uploadInst = upload.render({
		      elem:'#test'
		      ,url:'/uploadImages.htm'
		      ,before:function(obj) {
		        //预读本地文件示例
		        obj.preview(function(index,file,result){
		          $("#demo1").attr('src',result);
		        });
		       }
		       ,done: function(res){
		         //如果上传成功
		         if(res.code != 0) {
		           return layer.msg('上传失败');
		         } else {
		           $('#image').val(res.data.src);
		         }
		       }
		       ,error: function(){
		         var demoText = $("#demoText");
		         demoText.html('<span style="color:#FF5722">上传失败</span><a class="layui-btn layui-btn-xs demo-reload">重试</a>');
		         demoText.find('.demo-reload').on(click,function(){
		           uploadInst.upload();
		         });
		       }
		      });
		});
		</script>
	</body>
</html>