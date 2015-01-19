<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html id="myhtml" xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta content="网盘,百度网盘,百度云,网络U盘,网络硬盘,免费网盘,网盘下载,网盘资源,同步,云存储,外链分享,离线下载"
	name="keywords">
<meta
	content="百度网盘为您提供文件的网络备份、同步和分享服务。空间大、速度快、安全稳固，支持教育网加速，支持手机端。现在注册即有机会享受15G的免费存储空间"
	name="description">
<title>百度云 网盘-自由存，随心享</title>
<link href="/static/images/favicon.ico" rel="shortcut icon"
	type="images/x-icon">
<link href="${ctx}/source/css/yun_infocenter_min-local.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" charset="UTF-8"
	src="${ctx}/source/js/login_tangram.js"></script>
<script type="text/javascript" charset="utf-8"
	src="https://passport.baidu.com/v2/api/?getapi&amp;tpl=netdisk&amp;apiver=v3&amp;tt=1413163437761&amp;class=login&amp;logintype=basicLogin&amp;callback=bd__cbs__phihhq"></script>
<script type="text/javascript" charset="UTF-8"
	src="http://passport.baidu.com/phoenix/account/jsapi"></script>
<script async=""
	src="http://passport.baidu.com/static/phoenix/scripts/jssdk/all.js?v=08281021"
	charset="utf-8"></script>
<script async=""
	src="http://passport.baidu.com/phoenix/account/osavailable?callback=baidu.phoenix._setIconsStatus"
	charset="utf-8"></script>
<script type="text/javascript">
	/**
		window.onload=function(){
			alert(document.cookie);
			if(document.cookie.indexOf("username=", 0) >= 0){
				var a = document.cookie.substring(document.cookie.indexOf("username=", 0)+9,document.cookie.length);
	    		a = a.substring(0, a.indexOf(";", 0));
	    		$("#username").val(a);
			}
		};
	 */
	function login() {
		var u = $("#TANGRAM__PSP_4__userName").val();
		/**
		if(document.getElementById("cc").checked){
			var pos1 = document.cookie.substring(0,document.cookie.indexOf("username=", 0));
			var pos2 = document.cookie.substring(document.cookie.indexOf("username=", 0),document.cookie.length);
			var pos3 = pos2.substring(document.cookie.indexOf(";", 0)+1, document.cookie.length);
			document.cookie = pos1+"username="+u+";"+pos2;
		}
		 */
		var p = $("#TANGRAM__PSP_4__password").val();
		$.post("/wifiplatform/login!checkUser.do", "user.name=" + u
				+ "&user.pwd=" + p, function(res) {
			if (res.success == "success") {
				window.location = "login!index.do";
			} else {
				$("#TANGRAM__PSP_4__error").text(res.success);
			}
		}, "json");
	};
	/**回车登陆*/
	function keyBoard(va) {
		if (va == 13) {
			login();
		}
	};
</script>
</head>
<body>
	<div id="login-body" style="width: 100%">
		<div class="header-container">
			<div class="clearfix" id="login-header">
				<div class="logo">
					<a class="yun-logo" href="#" target="_blank" title="WIFI云">WIFI云</a>
				</div>
			</div>
			<div id="login-middle" >
				<div class="img-content">
					<a hidefocus="true" href="javascript:;"> <img
						class="index-slide-img" src="${ctx}/source/images/2Tspace.jpg"
						style="opacity: 0.1;">
					</a> <a hidefocus="true" href="javascript:;"> <img
						class="index-slide-img"
						src="${ctx}/source/images/multiterminal.jpg" style="opacity: 0.1;">
					</a> <a hidefocus="true" href="javascript:;"> <img
						class="index-slide-img" src="${ctx}/source/images/freeshare.jpg"
						style="opacity: 0.3;">
					</a> <a hidefocus="true" href="javascript:;"> <img
						class="index-slide-img current"
						src="${ctx}/source/images/antiyellow.jpg" style="opacity: 1;">
					</a>
				</div>
				<div class="yunbg">
					<ul class="focus-content clearfix">
						<li class="focus-content-item"><a class="focus-anchor"
							hidefocus="true" href="javascript:;" idx="0"></a></li>
						<li class="focus-content-item"><a class="focus-anchor"
							hidefocus="true" href="javascript:;" idx="1"></a></li>
						<li class="focus-content-item"><a class="focus-anchor"
							hidefocus="true" href="javascript:;" idx="2"></a></li>
						<li class="focus-content-item"><a
							class="focus-anchor current" hidefocus="true" href="javascript:;"
							idx="3"></a></li>
					</ul>
				</div>
				<div class="header-login">
					<div class="pass-login-title">
						<em class="bd-logo"></em>登录云平台帐号
					</div>
					<div class="tang-pass-login" id="netdisk_pass_login_form">
						<form id="TANGRAM__PSP_4__form" class="pass-form pass-form-normal"
							method="POST" autocomplete="off">
							<p id="TANGRAM__PSP_4__errorWrapper"
								class="pass-generalErrorWrapper">
								<span id="TANGRAM__PSP_4__error"
									class="pass-generalError pass-generalError-error"></span>
							</p>
							<p id="TANGRAM__PSP_4__hiddenFields" style="display: none">
								<input type="hidden" id="TANGRAM__PSP_4__codeString"
									name="codeString" value=""><input type="hidden"
									id="TANGRAM__PSP_4__safeFlag" name="safeFlag" value="0"><input
									type="hidden" id="TANGRAM__PSP_4__u" name="u"
									value="http://pan.baidu.com/"><input type="hidden"
									id="TANGRAM__PSP_4__isPhone" name="isPhone" value="false"><input
									type="hidden" id="TANGRAM__PSP_4__staticPage" name="staticPage"
									value="http://pan.baidu.com/res/static/thirdparty/pass_v3_jump.html"><input
									type="hidden" id="TANGRAM__PSP_4__quick_user" name="quick_user"
									value="0"><input type="hidden"
									id="TANGRAM__PSP_4__logintype" name="logintype"
									value="basicLogin"><input type="hidden"
									id="TANGRAM__PSP_4__logLoginType" name="logLoginType"
									value="pc_loginBasic"><input type="hidden"
									id="TANGRAM__PSP_4__subpro" name="subpro" value=""><input
									type="hidden" id="TANGRAM__PSP_4__idc" name="idc" value=""><input
									type="hidden" id="TANGRAM__PSP_4__loginMerge" name="loginMerge"
									value="true">
							</p>
							<p id="TANGRAM__PSP_4__userNameWrapper"
								class="pass-form-item pass-form-item-userName" style="display:">
								<label for="TANGRAM__PSP_4__userName"
									id="TANGRAM__PSP_4__userNameLabel"
									class="pass-label pass-label-userName">用户名</label><input
									id="TANGRAM__PSP_4__userName" type="text" name="userName"
									class="pass-text-input pass-text-input-userName"
									autocomplete="off" placeholder="用户名"><span
									id="TANGRAM__PSP_4__userName_clearbtn"
									class="pass-clearbtn pass-clearbtn-userName"
									style="display: block; visibility: visible; opacity: 1;"></span><span
									id="TANGRAM__PSP_4__userNameTip"
									class="pass-item-tip pass-item-tip-userName"
									style="display: none"><span
									id="TANGRAM__PSP_4__userNameTipText"
									class="pass-item-tiptext pass-item-tiptext-userName"></span></span>
							</p>
							<p id="TANGRAM__PSP_4__passwordWrapper"
								class="pass-form-item pass-form-item-password" style="display:">
								<label for="TANGRAM__PSP_4__password"
									id="TANGRAM__PSP_4__passwordLabel"
									class="pass-label pass-label-password">密码</label><input
									id="TANGRAM__PSP_4__password" type="password" name="password"
									class="pass-text-input pass-text-input-password"
									placeholder="密码"><span
									id="TANGRAM__PSP_4__password_clearbtn"
									class="pass-clearbtn pass-clearbtn-password"
									style="display: none;"></span><span
									id="TANGRAM__PSP_4__passwordTip"
									class="pass-item-tip pass-item-tip-password"
									style="display: none"><span
									id="TANGRAM__PSP_4__passwordTipText"
									class="pass-item-tiptext pass-item-tiptext-password"></span></span>
							</p>
							<p id="TANGRAM__PSP_4__verifyCodeImgWrapper"
								class="pass-form-item pass-form-item-verifyCode"
								style="display: none">
								<label for="TANGRAM__PSP_4__verifyCode"
									id="TANGRAM__PSP_4__verifyCodeLabel"
									class="pass-label pass-label-verifyCode">验证码</label><input
									id="TANGRAM__PSP_4__verifyCode" type="text" name="verifyCode"
									class="pass-text-input pass-text-input-verifyCode"
									maxlength="6" placeholder="验证码"><span
									id="TANGRAM__PSP_4__verifyCodeImgParent"
									class="pass-verifyCodeImgParent"><img
									id="TANGRAM__PSP_4__verifyCodeImg" class="pass-verifyCode"
									src="http://passport.bdimg.com/passApi/img/small_blank_9dbbfbb1.gif"></span><a
									id="TANGRAM__PSP_4__verifyCodeChange" href="#"
									class="pass-change-verifyCode">换一张</a><span
									id="TANGRAM__PSP_4__verifyCodeError"
									class="pass-error pass-error-verifyCode"></span><span
									id="TANGRAM__PSP_4__verifyCodeTip"
									class="pass-tip pass-tip-verifyCode"></span><span
									id="TANGRAM__PSP_4__verifyCodeSuccess"
									class="pass-success pass-success-verifyCode"></span>
							</p>
							<p id="TANGRAM__PSP_4__memberPassWrapper"
								class="pass-form-item pass-form-item-memberPass">
								<input id="TANGRAM__PSP_4__memberPass" type="checkbox"
									name="memberPass"
									class="pass-checkbox-input pass-checkbox-memberPass"
									checked="checked"><label
									for="TANGRAM__PSP_4__memberPass"
									id="TANGRAM__PSP_4__memberPassLabel" class="">下次自动登录</label>
							</p>
							<p id="TANGRAM__PSP_4__submitWrapper"
								class="pass-form-item pass-form-item-submit">
								<input id="TANGRAM__PSP_4__submit" type="button" value="登录" onclick="login()"
									class="pass-button pass-button-submit"><a
									class="pass-reglink"
									href="https://passport.baidu.com/v2/?reg&amp;tpl=netdisk&amp;u=http%3A%2F%2Fpan.baidu.com%2F"
									target="_blank" style="display: none">立即注册</a>
							</p>
						</form>
					</div>


				</div>
			</div>
		<div class="footer">
			<div xmlns="http://www.w3.org/1999/xhtml">
				©2014 北京研究院 <a class="b-lnk-gy" href="#" target="_blank">版本更新</a> |
				<a class="b-lnk-gy" href="#" target="_blank">帮助中心</a> | <a
					class="b-lnk-gy" href="#" target="_blank">问题反馈</a>
			</div>
		</div>
	</div>
	<div style="display: none">
		<script type="text/javascript">
			var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
					: " http://");
			document
					.write(unescape("%3Cscript src='"
							+ _bdhmProtocol
							+ "hm.baidu.com/h.js%3F773fea2ac036979ebb5fcc768d8beb67' type='text/javascript'%3E%3C/script%3E"));
			document
					.write(unescape("%3Cscript src='"
							+ _bdhmProtocol
							+ "hm.baidu.com/h.js%3Fb181fb73f90936ebd334d457c848c8b5' type='text/javascript'%3E%3C/script%3E"));
		</script>
		<script
			src=" http://hm.baidu.com/h.js?773fea2ac036979ebb5fcc768d8beb67"
			type="text/javascript"></script>
		<script
			src=" http://hm.baidu.com/h.js?b181fb73f90936ebd334d457c848c8b5"
			type="text/javascript"></script>
		<a
			href="http://tongji.baidu.com/hm-web/welcome/ico?s=b181fb73f90936ebd334d457c848c8b5"
			target="_blank"><img border="0"
			src="http://eiv.baidu.com/hmt/icon/21.gif" width="20" height="20"></a>
	</div>
	<script src="${ctx}/source/js/infocenter-all-min-local.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		/*<![CDATA[*/if (location.search.indexOf("sr=fc") !== -1) {
			$(".link-create")
					.attr(
							"href",
							"https://passport.baidu.com/v2/?reg&u=http%3A%2F%2Fpan.baidu.com%2F%3Fsr%3Dfc&regType=1");
		}/*]]>*/
	</script>

</body>
</html>
