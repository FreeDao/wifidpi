<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="display: block;">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<meta name="msapplication-config" content="none">
<title>云WIF平台</title>
<meta name="description"
	content="">
<meta name="keywords" content="">
<script type="text/javascript"
	src="${ctx}/source/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="${ctx}/source/css/app-g.css"
	type="text/css" media="all">
<link rel="stylesheet"
	href="${ctx}/source/css/login.css"
	type="text/css" media="all">
<link rel="stylesheet"
	href="${ctx}/source/css/animation.css"
	type="text/css" media="all">

<script language="javascript">
	if (typeof hiui === "undefined")
		hiui = {};
	hiui.webSite = hiui.webSite || {};
	hiui.webSite.getRootDomain = function() {
		return 'hiwifi.com';
	};
	hiui.webSite.getWebDomain = function() {
		return 'http://www.hiwifi.com/';
	};
	hiui.webSite.getBbsDomain = function() {
		return 'http://bbs.hiwifi.com/';
	};
	hiui.webSite.getStoreDomain = function() {
		return 'http://store.hiwifi.com/';
	};
	hiui.webSite.getUserDomain = function() {
		return 'https://user.hiwifi.com/';
	};
	hiui.webSite.getSDomain = function() {
		return 'http://s.hiwifi.com/';
	};
	hiui.webSite.getAppDomain = function() {
		return 'https://app.hiwifi.com/';
	};
	hiui.webSite.getStaticDomain = function() {
		return 'http://static.hiwifi.com/';
	};
	
	function userlogin() {
		var u = $("#user_id").val();
		/**
		if(document.getElementById("cc").checked){
			var pos1 = document.cookie.substring(0,document.cookie.indexOf("username=", 0));
			var pos2 = document.cookie.substring(document.cookie.indexOf("username=", 0),document.cookie.length);
			var pos3 = pos2.substring(document.cookie.indexOf(";", 0)+1, document.cookie.length);
			document.cookie = pos1+"username="+u+";"+pos2;
		}
		 */
		var p = $("#passwd_id").val();
		$.post("/wifiplatform/login!checkUser.do", "user.name=" + u
				+ "&user.pwd=" + p, function(res) {
			if (res.success == "success") {
				window.location = "login!index.do";
			} else {
				$("#_msg").text(res.success);
			}
		}, "json");
	};
	/**回车登陆*/
	function keyBoard(va) {
		if (va == 13) {
			userlogin();
		}
	};
</script>



</head>


<body>
	<div class="" style="display: none; position: absolute;">
		<div class="aui_outer">
			<table class="aui_border">
				<tbody>
					<tr>
						<td class="aui_nw"></td>
						<td class="aui_n"></td>
						<td class="aui_ne"></td>
					</tr>
					<tr>
						<td class="aui_w"></td>
						<td class="aui_c"><div class="aui_inner">
								<table class="aui_dialog">
									<tbody>
										<tr>
											<td colspan="2" class="aui_header"><div
													class="aui_titleBar">
													<div class="aui_title" style="cursor: move;"></div>
													<a class="aui_close" href="javascript:/*artDialog*/;">×</a>
												</div></td>
										</tr>
										<tr>
											<td class="aui_icon" style="display: none;"><div
													class="aui_iconBg" style="background: none;"></div></td>
											<td class="aui_main" style="width: auto; height: auto;"><div
													class="aui_content" style="padding: 20px 25px;"></div></td>
										</tr>
										<tr>
											<td colspan="2" class="aui_footer"><div
													class="aui_buttons" style="display: none;"></div></td>
										</tr>
									</tbody>
								</table>
							</div></td>
						<td class="aui_e"></td>
					</tr>
					<tr>
						<td class="aui_sw"></td>
						<td class="aui_s"></td>
						<td class="aui_se" style="cursor: se-resize;"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--header-->
	<div class="g-header">
		<div class="header-main">
			<div class="header-top">
				
			</div>
		</div>
	</div>
	<!--header end-->
	<!--bd-->
	<div class="G-bd">
		<div class="bg">
			<div class="main-wrap clearfix">
				<div class="login-pic">
					<div class="item yun-big animatedS shake" style=""></div>
					<div class="item yun animated fadeIn"></div>
					<div class="item app1 animated zoomInDown" style=""></div>
					<div class="item app2 animated zoomInDown" style=""></div>
					<div class="item app3 animated zoomInDown" style=""></div>
					<div class="item app4 animated zoomInDown" style=""></div>
					<div class="item app5 animated fadeInUp" style=""></div>
				</div>
				<div class="login-box" id="login-box">
					<div style="display: none">
						<iframe src="javascript:false;" name="loginframe" width="0"
							height="0"></iframe>
					</div>
					<div>
						<form method="post" >
							<input type="hidden" value="0" name="persistentcookie">
							<p class="error-info" id="_msg">&nbsp;</p>
							<div class="form-bar">
								<input type="text" name="userid" class="user J_input" id="user_id"
									autocomplete="off" placeholder="用户名" maxlength="64">
							</div>
							<div class="form-bar">
								<input type="password" name="passwd" id="passwd_id" class="pw J_input"
									autocomplete="off" placeholder="密码" maxlength="64">
							</div>
							<button type="button" class="button" onclick="userlogin()">登 录</button>
						</form>
				
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--bd end-->
	<!--footer-->
	<div class="g-footer">
		<div class="footer-main">
			<p>
				<a href="#">关于云WIFI</a><span class="pipe">|</span><a
					href="#" target="_blank">京ICP备13025326号-2</a><span
					class="pipe">|</span><a href="#">联系我们</a>
			</p>
			<p>Copyright© 2012-2014 ctbri.com</p>
		</div>
	</div>

	<script type="text/javascript"
		src="${ctx}/source/js/pp.min.js
"></script>
	<script type="text/javascript">
		passportObj.drawUserPanel = function() {
					this.panelElement.innerHTML = '<p id="user-menu">'
							+ '<span><a href="'+offcial_url+'" target="_blank">官方网站</a></span>|<span><a href="'+bbs_url+'" target="_blank">极客社区</a></span>|<span><a href="'+services_url+'" target="_blank">服务中心</a></span>|<span>'
							+ this.cookie['username']
							+ '，<a href="'+site_url+'welcome" class="notice" target="_blank">设置</a>，<a href="'
							+ site_url
							+ 'index.php?m=feed&a=ls" class="notice" target="_blank">通知</a></span>|<span><a href="javascript: passportObj.doLogout()" class="exit">退出</a></span></p>';
				}, passportObj.appid = 1001;
		passportObj.drawPanel(passportObj.$('newcard'));
		passportObj.loginRedirectUrl = window.location.href;
		passportObj.logoutRedirectUrl = "https://app.hiwifi.com/";
	</script>



	<script type="text/javascript"
		src="${ctx}/source/js/app.min.js
"></script>
	<script type="text/javascript"
		src="${ctx}/source/js/app_operate.min.js
"></script>
	<script type="text/javascript"
		src="${ctx}/source/js/jquery.artDialog.min.js
"></script>
	<script type="text/javascript"
		src="${ctx}/source/js/iframeTools.min.js
"></script>
	<script type="text/javascript"
		src="${ctx}/source/js/cloud.min.js
"></script>
	<script>
		(function($) {
			$(function() {
				$('#bind_user').bind('click', function() {
					login();
				});
			});
		})(jQuery);
	</script>
	<!--footer end-->

	<script>
		passportObj.drawLoginPanel = function() {
			this.panelElement.innerHTML = '<form method="post" onSubmit="return passportObj.doLogin()"><input type="hidden" value="0" name="persistentcookie"><p class="error-info" id="_msg">&nbsp;</p><div class="form-bar"><input type="text" name="userid" class="user J_input"  autocomplete="off" placeholder="用户名" /></div><div class="form-bar"><input type="password" name="passwd" class="pw J_input" autocomplete="off" placeholder="密码" /></div><button type="submit" class="button">登 录</button></form></div>';
		}

		passportObj.autoFocus = true;
		passportObj.usePost = false;
		//passportObj.loginRedirectUrl = 'https://app.hiwifi.com/store.php';
		//passportObj.drawPanel(passportObj.$('login-box'));
	</script>



	<script type="text/javascript">
		$(function() {
			setTimeout(function() {
				$('.yun-big').show().addClass('fadeInRight')
			}, 300);
			setTimeout(function() {
				$('.yun-big').removeClass('fadeInRight animated').addClass(
						'animatedS shake')
			}, 1000);
			setInterval(function() {
				$('.yun-big').removeClass('fadeInRight animated')
				//$('.yun-big').addClass('animatedS shake')

			}, 7000);
			setTimeout(function() {
				$('.app1').show().addClass('zoomInDown')
			}, 1000);
			setTimeout(function() {
				$('.app2').show().addClass('zoomInDown')
			}, 10);
			setTimeout(function() {
				$('.app3').show().addClass('zoomInDown')
			}, 300);
			setTimeout(function() {
				$('.app4').show().addClass('zoomInDown')
			}, 600);
			setTimeout(function() {
				$('.app5').show().addClass('fadeInUp')
			}, 1300);

			$('.J_input').placeholder();

		})
	</script>




	<div
		style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
</body>
</html>