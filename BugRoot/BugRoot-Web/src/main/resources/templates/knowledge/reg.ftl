<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="keywords" content="知识库,layui,缺陷模式,登录">
		<meta name="description" content="基于缺陷模式的知识库管理系统，为开发和测试人员提供便利">
		<title>[知识库注册]</title>
		
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_20_portal_index.css?aWH" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/style_20_common.css?aWH" />
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/useit/css/loginPage.css" />
		<link rel="stylesheet" href="${request.contextPath}/styles/login/style.css"/>
		
		
		<script src="${request.contextPath}/useit/js/common.js?HMW" type="text/javascript" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/portal.js?HMW" type="text/javascript" type="text/javascript"></script>
		
		<script src="${request.contextPath}/plugins/jquery/jquery.min.js" type="text/javascript" type="text/javascript"></script>
		
		<script type="text/javascript">
			var jq = jQuery.noConflict();
		</script>
		
		<script src="${request.contextPath}/plugins/jquery/jquery.easing.min.js"></script>
	    <script src="${request.contextPath}/styles/login/login.js"> </script>
		<script src="${request.contextPath}/useit/js/index.js" type="text/javascript" type="text/javascript"></script>
		<script src="${request.contextPath}/useit/js/slides.js" type="text/javascript" type="text/javascript"></script>
		
		</head>

	   <body id="nv_member" class="pg_register" onkeydown="if(event.keyCode==27) return false;">
	      
        <!--登陆框 -->
		<div class="loginmask"></div>
		<div id="loginalert">
			<div class="pd20 loginpd">
				<h3><i class="closealert fr"></i><div class="clear"></div></h3>
				<div class="loginwrap">
					<div class="loginh">
						<div class="fl">用户登录</div>
						
						<div class="fr">还没有账号<a href="${request.contextPath}/knowledge/box/toRegPage.htm">立即注册</a></div>
					</div>
					
					<h3><span class="fl">账号登录</span>
					   <span class="login_warning" id ="login_warning" style="display:none;">用户名或密码错误</span>
					   <div class="clear"></div>
					</h3>
					<form action="" method="post" id="login_form">
						<div class="logininput">
							<input type="text" name="username" class="loginusername" value="" placeholder="邮箱/用户名" />
							<input type="password" name="password" class="loginuserpasswordp" placeholder="密码"/>
						</div>
						<div class="loginbtn">
							<div class="loginsubmit fl">
							
							<input type="button"  value="登录" class="btn" onclick="checkForm()" />
							</div> <div class="fl" style="margin:26px 0 0 0;">
							
							<input id="bcdl" name ="rememberMe" type="checkbox" checked="true" />记住我</div>
							<div class="fr" style="margin:26px 0 0 0;"><a href="http://www.17sucai.com/">忘记密码?</a></div>
							<div class="clear"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		
		<div id="reg_setp">
			<div class="back_setp">返回</div>
			<div class="blogo"></div>
			<div id="setp_quicklogin">
				<h3>您可以选择以下第三方帐号直接登录17素材网，一分钟完成注册</h3>
				<ul class="quicklogin_socical">
					<li class="quicklogin_socical_weibo"><a href="http://www.17sucai.com/oauth/weibo/login">微博帐号注册</a></li>
					<li class="quicklogin_socical_qq" style="margin:0;"><a href="http://www.17sucai.com/oauth/qq/login">QQ帐号注册</a></li>
				</ul>
			</div>
		</div>

		<!--网站头部 -->
		<div id="hd">
			<div class="wp">
				<div class="hdc cl">
					<h2>
						<a href="${request.contextPath}/knowledge/index.htm" title="知识库">
						<img src="${request.contextPath}/useit/images/logo.png" height="100px" border="0" title="知识库"></a>
					</h2>
					
					<!--搜索框 -->
					<div id="scbar" class="cl">
						<form id="scbar_form" method="post" autocomplete="off" onsubmit="searchFocus($('scbar_txt'))" action="${request.contextPath}/knowledge/box/search.htm" target="_blank">
							<input type="hidden" name="mod" id="scbar_mod" value="search" />
							<input type="hidden" name="formhash" value="c18b65fe" /> 
							<input type="hidden" name="srchtype" value="title" />
							<input type="hidden" name="srhfid" value="0" /> 
							<input type="hidden" name="srhlocality" value="portal::index" />
							
							<table cellspacing="0" cellpadding="0">
								<tr>
									<td><input type="text" name="srchtxt" id="scbar_txt" value="请输入搜索内容" autocomplete="off" x-webkit-speech speech /></td>																			
									<td><a href="javascript:;" id="scbar_type" class="xg1" onclick="showMenu(this.id)" hidefocus="true">搜索</a></td>										
									<td><button type="submit" name="searchsubmit" id="scbar_btn" sc="1" class="pn pnc" value="true"> <i class="layui-icon layui-icon-search"></i></button></td>
									
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="p_pop h_pop" id="mn_userapp_menu" style="display: none"></div>
				<div id="mu" class="cl"></div>
			</div>
		</div>
		
		<div class="clear"></div>
		<!--导航栏 -->
		<div class="deanheader" id="deanheader">
			<div class="w1000">
				<div class="deannav">
					<ul>
		            	<li id="mn_portal" ><a href="${request.contextPath}/index1.htm" hidefocus="true" title="Portal">首页<span>Portal</span></a></li>                                                   
		            	<li id="mn_F286" ><a href="${request.contextPath}/knowledge/box/index.htm" hidefocus="true" title="知识库"  >知识库<span>知识库</span></a></li>                                                   
		            	<li id="mn_N2945" ><a href="${request.contextPath}/knowledge/type/module" hidefocus="true" title="知识总览" >知识总览<span>知识总览</span></a></li>                                                 
		            	<li id="mn_Nf08d" ><a href="${request.contextPath}/knowledge/box/search.htm" hidefocus="true" title="知识查询" >知识检索<span>知识查询</span></a></li> 	
		            </ul> 
				</div>
	
				<div class="deantopr" id="loginBtn">
					<div class="deanlogin">
						<ul class="deanunlogin">
							<li class="deanqqlogin"><a href="#"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: white;"></i></a></li>
							<li class="deanblue" id="openlogin"><a href="javascript:void(0);">登录</a></li>
							<li class="deanblue"><a href="${request.contextPath}/knowledge/toRegPage.htm">注册</a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
			
		<div class="clear"></div>
		<script src="${request.contextPath}/useit/js/nv.js" type="text/javascript"></script>
	
		<link rel="stylesheet" href="${request.contextPath}/useit/css/oculus.css?t=">
		<link rel="stylesheet" href="${request.contextPath}/useit/css/nc.css?t=">
		
		<script src="${request.contextPath}/useit/js/nc.js?t="></script>
		<script src="${request.contextPath}/useit/js/oculus_nc.js?t="></script>
		
		
		<div id="wp" class="wp" style="background: #fff;">
			<script type="text/javascript">
				var strongpw = new Array();
				var pwlength = 6;
			</script>
	
			<script src="${request.contextPath}/useit/js/register.js?HMW" type="text/javascript"></script>
	
			<div id="ct" class="ptm wp cl">
				<div class="nfl" id="main_succeed" style="display: none">
					<div class="f_c altw">
						<div class="alert_right">
							<p id="succeedmessage"></p>
							<p id="succeedlocation" class="alert_btnleft"></p>
							<p class="alert_btnleft">
								<a id="succeedmessage_href">如果您的浏览器没有自动跳转，请点击此链接</a>
							</p>
						</div>
					</div>
				</div>
				<div class="mn">
	
					<div class="bm" id="main_message">
	
						<div class="bm_h bbs" id="main_hnav">
							<span class="y" id="openlogin"> <a href="javascript:void(0);">已有帐号？现在登录</a>
							</span>
							<h3 id="layer_reginfo_t" class="xs2">注册</h3>
						</div>
	
						<p id="returnmessage4"></p>
	
						<form method="post" autocomplete="off" name="register" id="registerform" enctype="multipart/form-data" onsubmit="checksubmit();return false;" action="${request.contextPath}/sys/user/saveRegUser.htm">
							<div id="layer_reg" class="bm_c">
								<input type="hidden" name="regsubmit" value="yes" /> 
								<input type="hidden" name="formhash" value="e5a7e452" /> 
								<input type="hidden" name="referer" value="https://www.useit.com.cn/./" />
								<input type="hidden" name="activationauth" value="" />
								<div class="mtw">
									<div id="reginfo_a">
										<div class="rfm">
											<table>
												<tr>
													<th><span class="rq">*</span><label for="n50068">用户名:</label></th>
													<td><input type="text" id="n50068" name="" class="px" tabindex="1" value="" autocomplete="off" size="25" maxlength="15" required /></td>
													<td class="tipcol"><i id="tip_n50068" class="p_tip">用户名由 3 到 15 个字符组成</i>
													<kbd id="chk_n50068" class="p_chk"></kbd></td>
												</tr>
											</table>
										</div>
	
										<div class="rfm">
											<table>
												<tr>
													<th><span class="rq">*</span><label for="AZ8iig">密码:</label></th>
													<td><input type="password" id="AZ8iig" name="" size="25" tabindex="1" class="px" required /></td>
													<td class="tipcol"><i id="tip_AZ8iig" class="p_tip">请填写密码,最小长度为 6 个字符</i>
													<kbd id="chk_AZ8iig" class="p_chk"></kbd></td>
												</tr>
											</table>
										</div>
	
										<div class="rfm">
											<table>
												<tr>
													<th><span class="rq">*</span><label for="kQch2K">确认密码:</label></th>
													<td><input type="password" id="kQch2K" name="" size="25" tabindex="1" value="" class="px" required /></td>
													<td class="tipcol">
													<i id="tip_kQch2K" class="p_tip">请再次输入密码</i>
													<kbd id="chk_kQch2K" class="p_chk"></kbd></td>
												</tr>
											</table>
										</div>
	
										<div class="rfm">
											<table>
												<tr>
													<th><span class="rq">*</span><label for="te2mSg">Email:</label></th>
													<td><input type="text" id="te2mSg" name="" autocomplete="off" size="25" tabindex="1" class="px" value="" required /><br />
													<em id="emailmore">&nbsp;</em></td>
													<td class="tipcol"><i id="tip_te2mSg" class="p_tip">请输入正确的邮箱地址</i>
													<kbd id="chk_te2mSg" class="p_chk"></kbd></td>
												</tr>
											</table>
										</div>
										
										<div id='oc_page_register_input' class='rfm'
											style='margin: 10px auto 10px auto'>
											<table>
												<tbody>
													<tr>
														<th><div>
																<span class="rq">*</span>&#28369;&#21160;&#39564;&#35777;:
															</div></th>
														<td><style>
																#conqu3r_oc_page_register_input .clickCaptcha {
																	top: -270px;
																}
																</style>
															<div id="_umfp"
																style="display: inline; width: 1px; height: 1px; overflow: hidden"></div>
															<div id="conqu3r_oc_page_register_input"></div></td>
													</tr>
												</tbody>
											</table>
										</div>
										
										<script type="text/javascript" reload="1" defer="true">
											paxmac_ready(function() {
												_nc_plugin_init(
														'PH0D',
														'conqu3r_oc_page_register_input',
														'conqu3r_oc_page_register_input',
														'oc_page_register_input_nc');
												oc_page_register_input_nc
														.on(
																'success',
																function() {
																	window
																			.oc_custom_ajax(true);
																});
											});
										</script>
										<span id="secqaa_qS"></span>
										<script type="text/javascript" reload="1">
											updatesecqaa(
													'qS',
													'<div class="rfm"><table><tr><th><span class="rq">*</span><sec>: </th><td><sec><br /><sec></td></tr></table></div>',
													'member::register');
										</script>
	
									</div>
	
								</div>
	
							</div>
	
							<div id="layer_reginfo_b">
								<div class="rfm mbw bw0">
									<table width="100%">
										<tr>
											<th>&nbsp;</th>
											<td><span id="reginfo_a_btn"> <em>&nbsp;</em>
												<button class="pn pnc" id="registerformsubmit" type="submit" name="regsubmit" value="true" tabindex="1">
														<strong>提交</strong>
												</button> 
												<input type="checkbox" class="pc" name="agreebbrule"value="bf032e06" id="agreebbrule" checked="checked" /> <label
													for="agreebbrule">同意<a href="javascript:;"
														onclick="showBBRule()">网站服务条款</a></label>
											</span></td>
											<td></td>
										</tr>
									</table>
								</div>
							</div>
						</form>
					</div>
					
					<div id="layer_regmessage" class="f_c blr nfl" style="display: none">
						<div class="c">
							<div class="alert_right">
								<div id="messageleft1"></div>
								<p class="alert_btnleft" id="messageright1"></p>
							</div>
						</div>
	
						<div id="layer_bbrule" style="">
							<div class="c" style="width: 700px; height: 350px; overflow: auto">
								<br /> 【导言】<br /> 欢迎您使用Useit知识库的服务！<br />
								为使用Useit知识库的服务，您应当阅读并遵守《Useit服务协议》（以下简称“本协议”）。请您务必审慎阅读、充分理解各条款内容。除非您已阅读并接受本协议所有条款，否则您无权使用Useit知识库提供的服务。您使用Useit知识库的服务即视为您已阅读并同意上述协议的约束。<br />
								【总则】<br /> （1）Useit知识库作为一家网络存储空间服务商，仅为用户提供信息存储空间服务。<br />
								（2）Useit知识库属于教育分享平台，属于非盈利教育平台，所有赞助资金用于设备与人员维护开支。<br />
								（3）Useit知识库所有权、经营权、管理权均属武汉优势优化营销有限公司。<br />
								（4）本协议最终解释权归属武汉优势优化营销有限公司。<br /> 【帐号和密码安全性】<br />
								用户在使用Useit知识库的服务时需要注册一个帐号，考虑到Useit所提供的网络服务的重要性，用户应同意：<br />
								（1）提供详尽、准确的个人资料。<br /> （2）如个人资料有任何变动，必须及时更新。<br />
								如果用户提供的资料不准确，不真实，不合法有效，Useit保留结束用户使用各项服务的权利。一旦注册成功，成为Useit的合法用户，将得到一个密码和用户名。如果您未保管好自己的帐号和密码而对您、Useit或第三方造成的损害，您将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时改变您的密码，也可以结束旧的帐户重开一个新帐户。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告Useit。<br />
								【用户个人信息保护】<br />
								尊重用户个人隐私是Useit的一项基本政策。Useit知识库将运用各种安全技术和程序建立完善的管理制度来保护您的个人信息，以免遭受未经授权的访问、使用或披露。<br />
								Useit一定不会在未经合法用户授权时公开、透露其注册资料及保存在Useit网中的非公开内容，除非Useit在诚信的基础上认为透露这些信息在以下四种情况是必要的：<br />
								（1）相关的法律法规及程序要求提供；<br /> （2）保持维护Useit的商标所有权；<br />
								（3）在紧急情况下竭力维护用户个人和社会大众的隐私安全；<br /> （4）符合其他相关的要求。<br />
								【网络服务内容的所有权】<br />
								Useit知识库作为一家网络存储空间服务商，仅为用户提供信息存储空间服务，用于学习使用，网站的文章均由用户发布，Useit对任何文章都不拥有所有权，Useit不修改或编辑用户的文章。Useit用户不得侵犯包括他人的著作权在内的知识产权以及其他合法权利。如果用户发布的文章未经著作权人同意擅自对他人的作品进行全部或部分复制、修改、改编、翻译、汇编等，有可能侵害到他人的著作权时，不得把相关内容发布到Useit。<br />
								对于用户发布的内容之真实性引发的全部责任，由用户自行承担。一旦由于用户发布的文章发生权利纠纷或侵犯了任何第三方的合法权益，其责任由用户本人承担，因此给Useit或任何第三方造成的损失，用户应负责全额赔偿；<br />
								如因Useit用户发布的内容侵犯了第三方的合法权利，第三方向Useit提出异议，Useit有权删除相关的内容。提出异议者和文章发布者之间的相关法律问题得到解决后，以此为依据，向Useit提出申请，Useit可以恢复被删除的内容。<br />
								当权利人发现Useit提供的信息存储空间服务中展示的内容侵犯其合法权益时，权利人应事先向Useit发出“权利通知”，
								Useit将根据中国法律法规和规范性文件的规定采取移除相关内容等合理措施。请按照公示的具体内容和步骤发出权利通知书。<br />
								收藏人有权删除文章或注销其在Useit的帐户。<br /> 【对信息的存储和限制】<br />
								Useit不对用户所发布信息的删除或储存失败负责。Useit有判定用户的行为是否符合Useit服务协议的权利，如果用户违背了服务协议的规定，Useit有中断对其提供网络服务的权利。Useit有权保留或删除会员发布的任意信息。<br />
								【用户行为管理】<br />
								（1）用户使用Useit各项服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体的商业性组织。用户不得在Useit内发布任何形式的广告，或进行销售等商业用途。<br />
								（2）用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于服务的地方法律、国家法律和国际法律标准的。用户若在Useit上散布和传播反动、色情或其他违反国家法律的信息，Useit的系统记录有可
								能作为用户违反法律的证据。用户承诺：
								在Useit的网页上发布信息不得违反《计算机信息网络国际联网安全保护管理办法》、《互联网信息服务管理办法》、《互联网电子公告服务管理规定》、《维护互联网安全的决定》、《互联网新闻信息服务管理规定》等相关法律规定，不得在Useit的网页上或者利用Useit的服务制作、复制、发布、传播以下信息：<br />
								a、 反对宪法所确定的基本原则的；<br /> b、 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br />
								c、 损害国家荣誉和利益的；<br /> d、 煽动民族仇恨、民族歧视，破坏民族团结的；<br /> e、
								破坏国家宗教政策，宣扬邪教和封建迷信的；<br /> f、 散布谣言，扰乱社会秩序，破坏社会稳定的；<br /> g、
								散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br /> h、侮辱或者诽谤他人，侵害他人合法权益的；<br />
								i、 含有法律、行政法规禁止的其他内容的。<br />
								（3）在Useit的网页上发布信息或者利用Useit的服务时还必须符合其他有关国家和地区的法律规定以及国际法的有关规定。<br />
								（4）不利用Useit的服务从事以下活动：<br /> a、 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；<br />
								b、 未经允许，对计算机信息网络功能进行删除、修改或者增加的；<br /> c、
								未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；<br /> d、
								故意制作、传播计算机病毒等破坏性程序的；<br /> e、 其他危害计算机信息网络安全的行为。<br />
								（5）不以任何方式干扰Useit的服务。<br /> （6）遵守Useit的所有其他规定和程序。<br />
								（7）用户使用Useit电子公告服务，包括电子布告牌、电子论坛和留言板等以交互形式为上网用户提供信息发布条件的行为，也须遵守本条的规定以及Useit专门发布的相关电子公告服务的规则，上段中描述的法律后果
								和法律责任同样适用于电子公告服务的用户。 若用户的行为不符合以上提到的服务协议，Useit将作出独立判断立即取消用户服务帐号。<br />
								（8）您违反本条约定，导致任何第三方的损害，您应当独立承担责任；Useit知识库因此遭受损失的，您也应当一并赔偿。<br />
								（9）任何用户发现Useit内容涉嫌侮辱或者诽谤他人、侵害他人合法权益的或违反Useit协议的，有权 联系Useit 进行投诉。<br />
								【处罚规则】<br />
								Useit郑重提醒用户，若出现下列情况任意一种或几种，将承担包括被关闭全部或者部分权限、被暂停或被删除其帐号的后果，情节严重的，还将承担相应的法律责任。<br />
								（1）使用不雅或不恰当ID和昵称；<br /> （2）多次涉及侵犯他人著作权、名誉权等合法权利；<br />
								（3）发表含有猥亵、色情、人身攻击和反政府言论等非法或侵权言论的；<br /> （4）从事非法商业活动；<br />
								（5）模仿Useit管理人员ID或者他人ID，用以假冒管理人员或破坏管理人员形象；<br />
								（6）其他Useit认为不恰当的情况。<br /> 【拒绝提供担保】<br />
								用户个人对网络服务的使用承担风险。Useit对此不作任何类型的担保，不论是明确的或隐含的。Useit不担保服务一定能满足用户的要求，也不担保服务不会中断，对服务的及时性，安全性，出错发生都不作担保。<br />
								【保障】<br />
								用户同意保障和维护Useit全体成员的利益，并负责支付由用户使用超出服务范围引起的律师费用，违反服务协议的损害补偿费用等。<br />
								【结束服务】<br />
								用户或Useit可随时根据实际情况中断一项或多项网络服务。Useit不需对任何个人或第三方负责而随时中断服务。用户对后来的协议修改有异议，或对Useit的服务不满，可以行使如下权利：<br />
								（1）停止使用Useit的网络服务；<br /> （2）通告Useit停止对该用户的服务。<br />
								结束用户服务后，用户使用网络服务的权利马上中止。从那时起，用户没有权利，Useit也没有义务传送任何未处理的信息或未完成的服务给用户或第三方。<br />
								【有限责任及免责事由】<br />
								（1）Useit对任何直接、间接、偶然、特殊及继起的损害不负责任，这些损害可能来自：不正当使用网络服务，在网上购买商品或进行同类型服务，在网上进行交易，非法使用网络服务或用户传送的信息有所变动。这些行为都有可能会导致Useit的形象受损，所以Useit事先提出这种损害的可能性。<br />
								（2）Useit如因系统维护或升级等而需暂停服务时，将事先公告。若因硬件故障或其它不可抗力而导致暂停服务，于暂停服务期间造成的一切不便与损失，Useit不负任何责任。
								由于Useit的调整导致信息丢失或储存失败或其他结果的，Useit不承担任何责任。<br />
								同时Useit对以下情形导致的服务中断或受阻也不承担责任：<br /> a、受到计算机病毒、木马或其他恶意程序、黑客攻击的破坏；<br />
								b、用户或Useit的电脑软件、系统、硬件和通信线路出现故障；<br /> c、用户操作不当；<br />
								d、用户通过非Useit授权的方式使用本服务；<br /> e、其他Useit无法控制或合理预见的情形。<br />
								（3）用户从Useit中获得的信息，未经事先许可，用户不得以盈利为目的，自己或提供给第三方进行使用（符合法律规定的“合理使用”条件的除外）。否则，一切法律后果由该用户或第三方自负，与Useit无关。<br />
								【不可抗力】<br />
								（1）您理解并同意，在使用本服务的过程中，可能会遇到不可抗力等风险因素，使本服务发生中断。不可抗力是指不能预见、不能克服并不能避免且对一方或双方造成重大影响的客观事件，包括但不限于自然灾害如洪水、地震、瘟疫流行和风暴等以及社会事件如战争、动乱、政府行为等。发生此类情况，Useit不承担任何责任；<br />
								（2）您理解并同意，在使用本服务的过程中，可能会遇到网络信息或其他用户行为带来的风险，Useit不对任何信息的真实性、适用性、合法性承担责任，也不对因侵权行为给您造成的损害负责。这些风险包括但不限于：<br />
								a、来自他人匿名或冒名的含有威胁、诽谤、令人反感或非法内容的信息；<br />
								b、因使用本协议项下的服务，遭受他人误导、欺骗或其他导致或可能导致的任何心理、生理上的伤害以及经济上的损失；<br />
								c、其他因网络信息或用户行为引起的风险。<br />
								（3）您理解并同意，本服务并非为某些特定目的而设计，包括但不限于核设施、军事用途、医疗设施、交通通讯等重要领域。如果因为软件或服务的原因导致上述操作失败而带来的人员伤亡、财产损失和环境破坏等，Useit不承担法律责任。<br />
								（4）Useit依据本协议约定获得处理违法违规内容的权利，该权利不构成Useit的义务或承诺，Useit不能保证及时发现违法行为或进行相应处理。<br />
								【通告】<br />
								所有发给用户的通告都可通过相关页面的公告或电子邮件或常规的信件等传送。服务协议的修改、服务变更、或其它重要事件的通告都会以此形式进行。<br />
								【服务协议的修改和服务修订】<br />
								Useit有权在必要时修改服务协议，Useit服务协议一旦发生变动，将会在相关页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的网络服务。如果用户继续享用网络服务，则视为接受服务协议的变动。<br />
								Useit保留随时修改或中断服务而不需个别知照用户的权利。Useit行使修改或中断免费服务的权利，不需对用户或第三方负责。<br />
								【其他】<br />
								未经Useit事先许可，禁止使用任何机器人、蜘蛛、其他自动设备，或手动程序来监视或复制Useit网页或其所包含的任何内容。否则，Useit有权依法追究法律责任。<br />
								【附则】<br />
								Useit有权根据中华人民共和国法律、法规及规范性文件的变化以及互联网及自身业务的发展情况，不断修改和完善Useit的相关协议。Useit保留随时修改Useit协议的权利。<br />
								本协议未涉及的问题参见国家有关法律法规，当本协议与国家法律法规冲突时，以国家法律法规为准。<br /> <br />
							</div>
							<p class="fsb pns cl hm">
								<button class="pn pnc"
									onclick="$('agreebbrule').checked = true;hideMenu('fwin_dialog', 'dialog');">
									<span>同意</span>
								</button>
								<button class="pn"
									onclick="location.href='https://www.useit.com.cn/'">
									<span>不同意</span>
								</button>
							</p>
						</div>
	
						<script type="text/javascript">
							var ignoreEmail = false;
							addFormEvent('registerform', 0);
							
							function showBBRule() {
							   
								showDialog(jq('layer_bbrule').innerHTML, 'info','知识库 网站服务条款');
								jq('fwin_dialog_close').style.display = 'none';
							}
						</script>
	
					</div>
				</div>
			</div>
		</div>
	
	    <#include "${request.contextPath}/knowledge/nav/foot.ftl">
		<div id="scrolltop">
			<span hidefocus="true"><a title="返回顶部"
				onclick="window.scrollTo('0','0')" class="scrolltopa"><b>返回顶部</b></a></span>
		</div>
		<script type="text/javascript">_attachEvent(window, 'scroll', function () { showTopLink(); });checkBlind();</script>
		
	    <script src="${request.contextPath}/plugins/jquery-extensions/jquery.cookie.min.js"></script>
		<script>
			function checkForm() {
			   var username =jq("input[name='username']").val();
			   var password =jq("input[name='password']").val();
			   var rememberMe;
			   
			   document.getElementById("login_warning").style.display="none";
			   
			   if(username==""||username==null||username==undefined){
			      document.getElementById("login_warning").style.display="";
			      return false;
			   } else if(password==""||password==null||password==undefined) {
			      document.getElementById("login_warning").style.display="";
			      return false;
			   } else {
			      document.getElementById("login_warning").style.display="none";
			      
			      if(jq('form').find('input[type="checkbox"]')[0].checked){
			         rememberMe = true;
			      } else {
			          rememberMe = false;
			      }
			      
			     jq.cookie('QuickBoot.username', username, {expires: 30});

			       var url = '${request.contextPath}/login/main.json';
		            jq.post(url, 
		            {
		              username:username,
		              password:password,
		              rememberMe:rememberMe
		            
		            }, function(res) {
		                if(res.success){
		                    location.href = "${request.contextPath}/" + res.data.url;
		                }else{
		                    layer.msg(res.message);
		                }
		            });
			   }	
			}
		</script>
	</body>
</html>

