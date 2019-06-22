			jq(document).ready(function(){
			    
				var k=!0;
				jq(".loginmask").css("opacity",0.8);
				
				jq(".thirdlogin ul li:odd").css({marginRight:0});	
				
				
				jq(".thirdlogin ul li:odd").css({marginRight:0});	
				
				jq("#openlogin").click(function(){
					k&&"0px"!=jq("#loginalert").css("top")&& (jq("#loginalert").show(),jq(".loginmask").fadeIn(500),jq("#loginalert").animate({top:0},400,"easeOutQuart"))
				});
				
				jq(".loginmask,.closealert").click(function(){
					k&&(k=!1,jq("#loginalert").animate({top:-600},400,"easeOutQuart",function(){jq("#loginalert").hide();k=!0}),jq(".loginmask").fadeOut(500))
				});
				
				
				jq("#sigup_now,#reg a").click(function(){
					jq("#reg_setp,#setp_quicklogin").show();
					jq("#reg_setp").animate({left:0},500,"easeOutQuart")
				});																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																								
				
				jq(".back_setp").click(function(){
					"block"==jq("#setp_quicklogin").css("display")&&jq("#reg_setp").animate({left:"100%"},500,"easeOutQuart",function(){$("#reg_setp,#setp_quicklogin").hide()})
				});
				
			}); 
			
			
