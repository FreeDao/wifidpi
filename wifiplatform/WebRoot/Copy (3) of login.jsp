﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="display: block;">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<head>
<meta charset="utf-8">
<link rel="dns-prefetch" href="http://mimg.127.net">
<link rel="dns-prefetch" href="http://entry.mail.163.com">
<link rel="dns-prefetch" href="https://ssl.mail.163.com">
<link rel="dns-prefetch" href="http://iplocator.mail.163.com">
<title>云WIFI平台</title>
<link rel="shortcut icon" href="#">
<link href="${ctx}/source/css/yun_infocenter_min-local.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" charset="UTF-8"
	src="${ctx}/source/js/login_tangram.js"></script>
	<script type="text/javascript" src="${ctx}/source/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${ctx}/source/js/jquery.json-2.4.js"></script>
<style type="text/css">
/* css reset */
body {
	color: #000;
	background: #fff;
	font-size: 12px;
	line-height: 166.6%;
	text-align: center;
}

body.move {
	-webkit-transition: padding 0.3s ease;
	-moz-transition: padding 0.3s ease;
	-o-transition: padding 0.3s ease;
	-ms-transition: padding 0.3s ease;
	transition: padding 0.3s ease;
}

body, input, select, button {
	font-family: verdana
}

h1, h2, h3, select, input, button {
	font-size: 100%
}

body, h1, h2, h3, ul, li, form, p, img {
	margin: 0;
	padding: 0;
	border: 0
}

input, button, select, img {
	margin: 0;
	line-height: normal
}

select {
	padding: 1px
}

ul {
	list-style: none
}

select, input, button, button img, label {
	vertical-align: middle
}

header, footer, section, aside, nav, hgroup, figure, figcaption {
	display: block;
	margin: 0;
	padding: 0;
	border: none
}

a {
	text-decoration: none;
	color: #959595
}

a:hover {
	color: #626262
}

.fontWeight {
	font-weight: 700;
}
/* global */
.unvisi {
	visibility: hidden
}

.txt-suc {
	color: #22AC38
}

.txt-err {
	color: #e60012
}

.txt-yixin {
	color: #279C7B;
}
/* backgroundImage */
.themeCtrl a, .loginFormIpt, .headerIntro, .loginIcoCurrent,
	.loginIcoNew, .verify-input-line, .themeText li, .btn, .btn-moblogin,
	.ico, .locationTestTitle, .verSelected, .servSelected,
	.locationTestTitleClose, #extText li, #mobtips_arr, #mobtips_close {
	background-image: url(http://mimg.127.net/index/163/img/2013/bg_v3.png)
}

.headerLogo, .headerIntro, .headerNav, .footerLogo, .footerNav,
	.loginIcoCurrent, .loginIcoNew, .formIpt, .domain, #whatAutologinTip,
	#mobtips, #mobtips_arr, #mobtips_close {
	position: absolute
}
/* yixin */
#yxLoginEntry, #closeYxLogin, .ico-yxLogo, .loginByYX-refreshBtn {
	background-image: url(http://mimg.127.net/index/lib/img/yixin_ico.png);
	background-repeat: no-repeat;
}
/* ico */
.ico-uid {
	width: 14px;
	height: 16px;
	background-position: -154px -64px
}

.ico-pwd {
	width: 14px;
	height: 16px;
	background-position: -178px -64px
}

.ico-miniAlert {
	margin-right: 3px;
	display: inline-block;
	width: 14px;
	height: 14px;
	background-position: -132px -112px;
	vertical-align: top;
}

.ico-arr {
	display: inline-block;
	width: 7px;
	height: 12px;
	vertical-align: baseline;
	background-position: -160px -112px;
}

.ico-arr-d {
	background-position: -160px -110px;
}

.loginFormConf a:hover .ico-arr-d, .ico-arr-d-focus {
	background-position: -176px -110px;
}

*+html .ico-arr-d {
	background-position: -160px -112px;
}

*+html .loginFormConf a:hover .ico-arr-d, *+html .loginFormConf a:hover .ico-arr-d,
	*+html .ico-arr-d-focus {
	background-position: -176px -112px;
}

.ico-yxLogo {
	display: inline-block;
	margin-top: -3px;
	_margin-top: 0;
	width: 19px;
	height: 19px;
	background-position: -90px 0;
	vertical-align: middle;
}
/*.ico-android{display:inline-block;vertical-align:middle;width:17px;height:21px;background-position:0 0;_background-position: -40px 0;}
.ico-ios{display:inline-block;vertical-align:middle;width:15px;height:18px;background-position:-20px 0;_background-position: -60px 0;}*/
.ico-new {
	display: block;
	width: 19px;
	height: 12px;
	background: url('http://mimg.127.net/index/lib/img/new.png') no-repeat;
}
/* yixin */
.yxLink {
	margin: 0 5px;
	display: inline-block;
	font-size: 14px;
	line-height: 14px;
	font-weight: bold;
	color: #279C7B !important;
}

.yxLink .ico-yxLogo {
	margin-right: 3px;
}
/* header */
.header {
	width: 1000px;
	height: 64px;
	position: relative;
	margin: 0 auto;
	z-index: 2;
	overflow: hidden;
}

.headerLogo {
	top: 17px;
	left: 50px
}

.headerIntro {
	height: 28px;
	width: 144px;
	display: block;
	background-position: 0 -64px;
	top: 17px;
	left: 194px
}

.headerNav {
	top: 21px;
	right: 100px;
	text-align: right;
	color: #cfd0d0;
}

.headerNav a {
	padding-left: 13px;
	display: inline-block;
}

.headerNav .last {
	padding-left: 0;
}
/* main */
.main {
	height: 600px;
	background: #fff;
	position: relative;
	min-width: 1000px;
}

.main-inner-iframe {
	border: 0;
	width: 100%;
	height: 600px;
	overflow: hidden;
}

#mainCnt {
	width: 100%;
	height: 600px;
	position: relative;
	clear: both;
	background-repeat: no-repeat;
	background-position: center top;
}

#theme {
	margin: 0 auto;
	height: 600px;
	width: 1000px;
	overflow: hidden;
	position: relative;
}

.themeLink {
	height: 274px;
	width: 430px;
	display: block;
	outline: 0;
}

.themeText {
	margin-left: 26px;
}

.themeText li {
	line-height: 22px;
	-line-height: 24px;
	height: 24px;
	color: #858686;
	text-indent: 12px;
	background-position: -756px -72px;
	background-repeat: no-repeat
}

.themeText li a {
	color: #005590;
	text-decoration: underline;
}

.login {
	width: 295px;
	height: 460px;
	padding: 13px 14px 15px;
	top: 56px;
	left: 50%;
	margin-left: 90px;
	text-align: left;
	position: absolute;
	z-index: 2;
	background: url(http://mimg.127.net/index/163/img/2013/login_v4.png)
		no-repeat;
	-background-image:
		url(http://mimg.127.net/index/163/img/2013/login_ie6_v4.png);
}

.unishadow {
	box-shadow: 0px 1px 3px 0 rgba(0, 0, 0, 0.2);
	-webkit-box-shadow: 0px 1px 3px 0 rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 1px 3px 0 rgba(0, 0, 0, 0.2);
}

.loginFunc {
	width: 100%;
	height: 47px;
	overflow: hidden;
	clear: both;
}

.loginFuncNormal, .loginFuncDynPw {
	width: 148px;
	height: 100%;
	overflow: hidden;
	position: relative;
	line-height: 46px;
	float: left;
	font-size: 14px;
	text-align: center; +
	line-height: 48px;
	color: #626262;
	cursor: pointer;
}

.loginFuncDynPw {
	width: 147px;
	border-right: none;
}

.loginIcoCurrent {
	width: 24px;
	height: 24px;
	left: 26px;
	top: 9px;
	display: none;
}

.loginIcoNew {
	width: 21px;
	height: 10px;
	font-size: 0;
	background-position: -684px 0;
	left: 135px;
	top: 12px;
}

.tab-2 {
	background-position: -323px 0;
}

.tab-2 .loginFuncDynPw .loginIcoCurrent, .tab-1 .loginFuncNormal .loginIcoCurrent,
	.tab-11 #extVerSelect, .tab-1 #lfBtnReg1 {
	display: block;
}

.tab-11 #extText, .tab-2 #lfBtnReg {
	display: none;
}
/* form */
.loginForm {
	position: relative;
	padding-top: 40px;
}

#login163 {
	height: 310px;
}

.loginFormIpt {
	position: relative;
	width: 240px;
	height: 42px;
	line-height: 42px;
	margin: 0 0 20px 25px;
	padding-right: 5px;
	clear: both;
	background-position: 0 -352px;
	z-index: 2
}

.loginFormIpt .ico {
	position: absolute;
	left: 9px;
	top: 13px;
	z-index: 1;
}

.loginFormIpt-over {
	
}

.loginFormIpt-focus {
	box-shadow: 0 0 5px rgba(2, 145, 252, .5);
}

.loginFormIpt-focus .placeholder {
	color: #C9C9C9;
}

.loginFormBtn {
	position: relative;
	width: 245px;
	height: 38px;
	margin: 18px 0 0 25px
}

.formIpt {
	width: 205px;
	padding: 9px 0 10px;
	ime-mode: disabled;
	height: 21px;
	top: 1px;
	left: 28px;
	color: #333;
	font-size: 14px;
	font-weight: 700;
	border: none;
	font-family: verdana;
	line-height: 21px;
	background: transparent !important;
}

.formIpt:focus {
	outline: 0;
}

.showPlaceholder .placeholder {
	visibility: visible;
	cursor: text;
}

.placeholder {
	color: #C9C9C9;;
	font-size: 14px;
	position: absolute;
	left: 30px;
	top: 14px;
	line-height: 14px;
	visibility: hidden;
	background: none;
}

.domain {
	padding-left: 5px;
	width: 75px;
	height: 33px;
	line-height: 33px;
	color: #616161;
	font-size: 14px;
	overflow: hidden;
	display: block;
	right: 8px;
	top: 4px;
	white-space: nowrap;
}

#idInput::-ms-clear {
	display: none;
}

#idInputTest {
	visibility: hidden;
	position: absolute;
	font-size: 14px;
	font-weight: 700;
}

.loginFormCheck {
	height: 14px;
	line-height: 14px;
	color: #555;
	margin-left: 25px;
	clear: both;
	width: 245px;
	position: relative;
	z-index: 1;
}

.loginFormCheckInner {
	line-height: 13px;
	width: 150px;
	float: left;
	position: relative;
}

#dynPwInput {
	width: 110px;
}

#dynPwLoginHint {
	margin-left: 25px;
	height: 14px;
	line-height: 14px;
	color: #959595;
}

.forgetPwdLine {
	text-align: right
}

#capsLockHint {
	position: absolute;
	top: 42px;
	left: 0px;
	padding: 4px 8px;
	line-height: 12px;
	background-color: #ffffcc;
	border: 1px solid #d7d7d7;
	color: #555;
	z-index: 2;
}

#remAutoLogin {
	visibility: hidden;
	position: absolute;
	left: 0;
}

.ico-checkbox {
	display: inline-block;
	width: 13px;
	height: 13px;
	background-position: -40px -160px;
	vertical-align: middle;
	cursor: pointer;
}

.autoLogin-checked .ico-checkbox {
	background-position: -40px -180px;
}

#remAutoLoginTxt, .forgetPwd {
	color: #848585;
}

#remAutoLoginTxt:hover, .forgetPwd:hover {
	color: #626262;
}

.loginFormCbx {
	width: 13px;
	height: 13px;
	padding: 0;
	overflow: hidden;
	margin: 0;
	vertical-align: middle;
}

#whatAutologinTip {
	z-index: 9;
	width: 180px;
	height: 36px;
	background-color: #fffde4;
	border: 1px #dfb86d solid;
	left: 0px;
	top: 16px;
	text-align: left;
	padding: 5px 10px;
	line-height: 18px;
	color: #dc9632;
	display: none;
	border-radius: 4px
}

.btn {
	width: 110px;
	height: 38px;
	float: left;
	text-align: center;
	cursor: pointer;
	border: 0;
	padding: 0;
	font-weight: 700;
	font-size: 14px;
	display: inline-block;
	vertical-align: baseline;
	line-height: 38px;
	outline: 0;
	background-color: transparent;
}

.btn-main {
	color: #fff;
	box-shadow: 0 2px 5px rgba(0, 28, 88, .3);
}

.btn-side {
	color: #6d798c;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
}

.btn-login {
	background-position: 0 -208px;
}

.btn-login-hover {
	background-position: 0 -256px;
}

.btn-login-active {
	background-position: 0 -304px;
	color: #b5d1ee;
}

.btn-reg {
	background-position: -117px -208px;
	float: right;
}

.btn-reg-hover {
	background-position: -117px -256px;
	color: #347bc7;
}

.btn-reg-active {
	background-position: -117px -304px;
	color: #6d798c;
}

.btn-login2 {
	width: 245px;
	height: 38px;
	background-position: 0 -710px;
}

.btn-login2-hover {
	background-position: 0 -758px;
}

.btn-login2-active {
	background-position: 0 -806px;
	color: #b5d1ee;
}

.btn-showDynPwWrap {
	position: absolute;
	top: 0;
	right: 0;
	_right: -1px;
	display: block;
	width: 101px;
	height: 42px;
	font-size: 14px;
	font-weight: normal;
	text-align: center;
	line-height: 42px;
	color: #6d798c;
	background-position: -195px -405px;
}

.btn-showDynPwWrap-hover {
	color: #347bc7;
	background-position: -195px -455px;
}

.btn-showDynPwWrap-active {
	color: #6d798c;
	background-position: -195px -505px;
}

.btn-getDynPw {
	width: 150px;
	background-position: 0 -565px;
}

.btn-getDynPw-hover {
	background-position: 0 -613px;
}

.btn-getDynPw-active {
	background-position: 0 -661px;
}

.btn-cancel {
	width: 124px;
	background-position: -160px -565px;
}

.btn-cancel-hover {
	background-position: -160px -613px;
	color: #347bc7;
}

.btn-cancel-active {
	background-position: -160px -661px;
	color: #6d798c;
}

.loginFormConf {
	height: 14px;
	line-height: 14px;
	margin-left: 25px;
	margin-top: 18px;
	clear: both;
	width: 245px;
	position: relative;
	color: #848585;
	z-index: 1;
}

.loginFormVer {
	float: left;
	width: 160px;
}

.loginFormService {
	float: right;
	text-align: right;
}

.loginFormVerList {
	width: 140px;
	position: absolute;
	padding: 1px;
	background: #fff;
	border: 1px solid #b7c2c9;
	top: -5px;
	top: -4px\9;
	left: 33px;
	display: none;
}

.loginFormVerList li a {
	height: 22px;
	line-height: 22px;
	width: 140px;
	overflow: hidden;
	color: #848585;
	display: block;
	text-indent: 22px;
}

.loginFormVerList li a:hover {
	background-color: #eef3f8;
}

.loginFormVerList li a.verSelected {
	color: #5B8CCA;
	background-position: -250px -58px;
	background-repeat: no-repeat;
}
/* app */
.mailApp {
	margin: 36px 0 0 20px;
}

.mailApp-logo {
	display: block;
	width: 256px;
	height: 32px;
	background: url('http://mimg.127.net/index/lib/img/mailapp_logo.png')
		no-repeat;
	_background-image:
		url('http://mimg.127.net/index/lib/img/mailapp_logo_ie6.png');
}
/* ext */
#extVerSelect {
	display: none;
}

.ext {
	padding: 13px 55px 13px 25px;
	height: 38px;
	overflow: hidden;
}

#extText {
	line-height: 20px;
}

#extText li {
	padding-left: 7px;
	background-position: -240px -118px;
	background-repeat: no-repeat;
}

#extText li a {
	color: #9bacc6;
}

#extText li a:hover {
	color: #5B8CCA;
}

#extVerSelect {
	line-height: 40px;
	font-size: 12px;
	font-weight: 700;
}

#extVerSelect a {
	color: #005590;
	text-decoration: underline;
}
/* tab-2 */
.tab-2 .ico-mob {
	top: 12px;
	width: 13px;
	height: 18px;
	background-position: -200px -64px;
}
/* footer */
.footer {
	height: 65px;
	margin: 0 auto;
}

.footer-inner {
	width: 1000px;
	height: 63px;
	overflow: visible;
	margin: 0 auto;
	color: #848585;
	position: relative;
}

.footerLogo {
	top: 11px;
	left: 35px
}

.footerNav {
	top: 25px;
	right: 123px;
}

.footerNav a {
	margin-left: 12px
}

.copyright {
	margin-left: 12px
}
/* noscript */
.noscriptTitle {
	line-height: 32px;
	font-size: 24px;
	color: #d90000;
	padding-top: 60px;
	font-weight: 700;
	background: #fff;
}

.noscriptLink {
	text-decoration: underline;
	color: #005590;
	font-size: 14px;
}
/* mobtips */
#mobtips {
	height: 18px;
	border: 1px solid #c6c6a8;
	top: 41px;
	left: 30px;
	line-height: 18px;
	background: #ffffe1;
	padding-left: 6px;
	padding-right: 20px;
	display: none;
	color: #565656;
	zoom: 1;
}

#mobtips_arr {
	width: 9px;
	height: 9px;
	background-position: -684px -72px;
	top: -5px;
	left: 15px;
}

#mobtips_close {
	background-position: -715px -68px;
	top: 2px;
	width: 16px;
	height: 14px;
	right: 0px;
}

#mobtips em {
	font-style: normal;
	color: #328721;
}

#mobtips a {
	text-decoration: underline;
	color: #005590;
}
/* mask */
.mask {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: #000;
	filter: alpha(opacity = 30);
	-moz-opacity: 0.3;
	opacity: 0.3;
	z-index: 998
}
/* 加密http登录弹窗 */
.enhttp .topborder, .enhttp .bottomborder, .enhttp .ct, .enhttp .cldenhttp,
	.enhttp .ct .inner .httplogin {
	background-image:
		url(http://mimg.127.net/index/lib/img/bg_httplogin.gif);
	background-color: transparent;
	background-repeat: no-repeat;
	text-decoration: none;
}

.enhttp {
	width: 420px;
	height: 270px;
	position: absolute;
	z-index: 999;
	overflow: hidden;
	top: 0;
	left: 50%;
	margin-left: -210px;
	top: 50%;
	margin-top: -135px;
}

.enhttp .topborder {
	width: 418px;
	height: 2px;
	font-size: 1px;
	overflow: hidden;
	margin: 0 auto;
	background-position: 0 -108px;
}

.enhttp .bottomborder {
	width: 418px;
	height: 2px;
	font-size: 1px;
	overflow: hidden;
	margin: 0 auto;
	background-position: 0 -110px;
}

.enhttp .ct {
	width: 418px;
	height: 266px;
	background-position: 0 -134px;
	background-color: #fff;
	border-left: 1px solid #82aecd;
	border-right: 1px solid #82aecd;
	position: relative;
	overflow: hidden;
}

.enhttp .ct .inner {
	padding-top: 40px;
	margin: 0 auto;
	text-align: left;
}

.enhttp .ct .inner p {
	font-size: 14px;
}

.enhttp .ct .inner .txt-tips {
	color: #737373;
	line-height: 30px;
	width: 325px;
	margin-left: 46px;
	display: inline;
}

.enhttp .ct .inner .txt-normal {
	line-height: 30px;
	width: 325px;
	margin: 10px 0 0 46px;
}

.enhttp .ct .inner .httplogin {
	font-size: 14px;
	height: 34px;
	width: 120px;
	display: block;
	background-position: -432px -108px;
	line-height: 34px;
	text-align: center;
	color: #fff;
	font-weight: 700;
	background-color: #3486cc;
}

.enhttp .ct .inner .txt-line {
	width: 325px;
	margin-left: 46px;
	background: #b6cad9;
	height: 1px;
	overflow: hidden;
	font-size: 1px;
	margin-top: 24px;
}

.enhttp .ct .inner .txt-advice {
	line-height: 60px;
	width: 325px;
	color: #8d8d8d;
	margin-left: 46px;
}

.enhttp .ct .inner .txt-advicelink {
	margin-left: 20px;
	font-size: 14px;
}

.enhttp .cldenhttp {
	height: 22px;
	width: 22px;
	overflow: hidden;
	position: absolute;
	right: 8px;
	top: 6px;
	background-position: 0 -112px;
	text-indent: -9999px;
}

.enhttp .cldenhttp:hover {
	background-position: -22px -112px;
}

.enhttp .enhttpbox {
	position: absolute;
	z-index: 2;
	left: 0;
}

.enhttp .httploginframe {
	width: 100%;
	height: 200px;
	position: absolute;
	top: 2px;
	z-index: 1;
	left: 0;
}
/* 测速 */
#locationTest {
	position: absolute;
	width: 255px;
	top: -2px;
	left: 0px;
	height: 88px;
	background: #fff;
	border: 1px solid #b7c2c9;
	display:;
	margin-bottom: 200px;
	height: 79px;
	overflow: hidden;
	display: none;
}

.locationTestTitle {
	width: 255px;
	height: 26px;
	line-height: 26px;
	position: relative;
	color: #555;
	text-indent: 10px;
	background-position: 0 -10px;
	border-bottom: 1px solid #f1f3f5;
}

.locationTestTitle h3 {
	font-size: 12px;
}

.locationTestTitleClose {
	height: 8px;
	width: 8px;
	overflow: hidden;
	display: block;
	position: absolute;
	right: 6px;
	top: 7px;
	background-position: -224px -112px
}

.locationTestTitleClose:hover {
	background-position: -208px -112px
}

.locationTestEach {
	display: inline-block;
	width: 5em;
	font-family: verdana;
	color: #848585;
}

.locationTestList li {
	padding: 2px;
	float: left;
	display: inline-block;
}

.locationTestList .servSelected {
	background-position: -248px -50px;
	background-repeat: no-repeat;
}

.locationTestList li a {
	height: 38px;
	width: 80px;
	display: block;
	line-height: 16px;
	padding-top: 10px;
	overflow: hidden;
	text-align: center;
	color: #000;
}

.locationTestList li a:hover {
	background-color: #eef3f8;
}

#selectLocation {
	text-align: center;
}

#locationTestCur {
	width: 3em;
}

#selectLocationTipsDone {
	display: none;
}

.locationTestBest {
	display: none;
	color: green;
}

.locationChoose {
	text-decoration: underline;
	color: #005590;
}

/* 主题控制栏 */
.themeCtrl {
	position: absolute;
	right: 50%;
	bottom: 12px;
	margin-right: -405px;
	text-align: right;
}

.themeCtrl a {
	float: left;
	display: inline;
}

#musicLink, #prevTheme, #nextTheme {
	width: 25px;
	height: 25px;
	margin-right: 7px;
	display: none;
}

#musicLink {
	background-position: -161px -457px;
}

#musicLink:hover {
	background-position: -161px -492px;
}

#prevTheme {
	background-position: 0 -457px;
}

#prevTheme:hover {
	background-position: 0 -492px;
}

#nextTheme {
	margin-right: 0;
	background-position: -35px -457px;
}

#nextTheme:hover {
	background-position: -35px -492px;
}
/* 首页评分 */
#scoreIndex {
	margin: 1px 10px 0 0;
	width: 73px;
	height: 24px;
	background-position: -70px -457px;
	font-size: 12px;
	color: #fff;
	line-height: 24px;
	text-align: center;
	display: none;
}

#scoreIndex:hover {
	background-position: -70px -492px;
}

#scoreIndexPop {
	left: 50%;
	top: 50%;
	margin-left: -231px;
	margin-top: -115px;
	width: 462px;
	position: absolute;
	z-index: 999;
	overflow: hidden;
	display: none;
	height: 229px;
	background: #fff;
}

#scoreIndexPopIfm {
	width: 462px;
	height: 229px;
}

/* ie6 */
#musicLink, #musicLink:hover, #prevTheme, #prevTheme:hover, #nextTheme,
	#nextTheme:hover, #scoreIndex, #scoreIndex:hover {
	-height: 24px;
	-background-position-y: -527px;
}

/* 云音乐 */
#yunMusic {
	width: 329px;
	height: 162px;
	border-radius: 3px;
	position: absolute;
	z-index: 999;
	left: 50%;
	top: 50%;
	margin-left: -450px;
	overflow: hidden;
	color: #626262;
	margin-top: -122px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, .6);
	display: none;
}

#yunMusicBackground {
	width: 329px;
	height: 162px;
	position: absolute;
	left: 0;
	top: 0;
	background: #fff;
	filter: alpha(opacity = 90);
	opacity: 0.9;
	z-index: 0;
}

#yunMusicText1 {
	position: absolute;
	z-index: 1;
	line-height: 22px;
	vertical-align: baseline;
	left: 21px;
	top: 24px;
	text-align: left;
	width: 290px;
}

#yunMusicText1 img {
	position: relative;
	top: 2px;
}

#yunMusicText2 {
	position: absolute;
	z-index: 1;
	left: 21px;
	top: 80px;
	width: 290px;
	text-align: left;
}

#yunMusicConfirm {
	position: absolute;
	z-index: 1;
	height: 25px;
	line-height: 25px;
	width: 86px;
	display: block;
	border: 1px solid #459830;
	border-radius: 3px;
	background: #59b045;
	color: #fff;
	left: 120px;
	top: 120px;
	background: -moz-linear-gradient(top, #6bbb59 0%, #459830 100%);
	/* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #6bbb59),
		color-stop(100%, #459830)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #6bbb59 0%, #459830 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #6bbb59 0%, #459830 100%);
	/* Opera 11.10+ */
	background: -ms-linear-gradient(top, #6bbb59 0%, #459830 100%);
	/* IE10+ */
	background: linear-gradient(to bottom, #6bbb59 0%, #459830 100%);
	/* W3C */
}

#yunMusicClose {
	height: 14px;
	width: 14px;
	right: 0;
	top: 0;
	line-height: 14px;
	left: auto;
	font-size: 12px;
	text-align: center;
	background: #ccc;
	border-color: #b8b8b8;
	color: #fff;
	font-family: Verdana;
	position: absolute;
	border-radius: 3px;
}

#yunMusicClose:hover {
	background: #c2c2c2;
	border-color: #aaa9a9;
}

/* 气泡提示 */
.layer-hd, .layer-mid, .layer-ft, .layer-arrow, .error-tt p {
	background-image:
		url("http://mimg.127.net/index/163/img/2013/error_bg.png");
	_background-image:
		url("http://mimg.127.net/index/163/img/2013/error_bg_ie6.png");
}

.layer {
	position: absolute;
	width: 347px;
	top: 0;
	left: 50%;
	margin-left: -265px;
	color: #434343;
	text-align: left;
	z-index: 1000;
	display: none;
}

.layer.bubbleLayer-show {
	display: block;
	-webkit-animation: shake 0.6s ease-in-out 0.3s;
	-moz-animation: shake 0.6s ease-in-out 0.3s;
	-o-animation: shake 0.6s ease-in-out 0.3s;
	animation: shake 0.6s ease-in-out 0.3s;
}

.layer-hd, .layer-ft {
	overflow: hidden;
	font-size: 0;
	line-height: 0;
}

.layer-hd {
	height: 8px;
	background-position: -10px 0;
	background-repeat: no-repeat;
}

.layer-ft {
	height: 10px;
	background-position: -10px -8px;
	background-repeat: no-repeat;
}

.layer-mid {
	padding: 5px 20px 7px;
	background-position: -357px 0;
	background-repeat: repeat-y;
}

.layer-arrow {
	position: absolute;
	top: 35px;
	right: -6px;
	width: 10px;
	height: 19px;
	background-position: 0 0;
	background-repeat: no-repeat;
}
/* 错误提示 */
.layer .error-tt a {
	color: #5B8CCA;
	font-family: simsun;
}

.layer .error-tt p {
	padding: 10px 10px 8px 50px;
	line-height: 22px;
	font-weight: bold;
	font-size: 14px;
	background-position: -714px -4px;
	background-repeat: no-repeat;
}

.layer .error-detail {
	margin-top: 2px;
	padding: 8px 12px 5px;
	color: #7d7d7d;
	line-height: 18px;
	border-top: 1px solid #e1e1e1;
}

.layer .error-detail a {
	color: #4e90e2;
	text-decoration: underline;
}
/* 输入验证码获取动态密码 */
.verify {
	padding: 10px;
}

.verify-wrap {
	height: 70px;
}

.verify-tt {
	margin-bottom: 10px;
	font-size: 14px;
	font-weight: bold;
}

.verify-input {
	float: left;
}

.verify-img {
	margin-left: 156px;
}

.verify-input-line {
	width: 150px;
	height: 42px;
	background-position: 0 -405px;
	position: relative;
}

.verify-input-line .formIpt {
	left: 7px;
	width: 135px;
}

.verify-img-btn {
	float: right;
	color: #4E90E2;
	line-height: 22px;
}

.verify-img-btn:hover {
	color: #4E90E2;
	text-decoration: underline;
}

.verify-img-btn img {
	vertical-align: top;
}

.verify .btn-getDynPw {
	margin-right: 12px;
}

.verify-opt {
	height: 42px;
}

.verify-err {
	line-height: 22px;
}
/* 易信安装 */
.yxInstall {
	padding: 10px 40px;
}

.yxInstall-tt {
	margin-bottom: 15px;
	font-size: 14px;
	font-weight: bold;
}

.yxInstall-code {
	float: left;
}

.yxInstall-txt {
	margin-left: 100px;
	padding: 10px 0;
	line-height: 30px;
	color: #959595;
}

@
-webkit-keyframes shake { 0%{
	margin-left: -265px;
}

25%{
margin-left


:

 

-262
px


;
}
50%{
margin-left


:

 

-265
px


;
}
75%{
margin-left


:

 

-262
px


;
}
100%{
margin-left


:

 

-265
px


;
}
}
@
-moz-keyframes shake { 0%{
	margin-left: -265px;
}

25%{
margin-left


:

 

-262
px


;
}
50%{
margin-left


:

 

-265
px


;
}
75%{
margin-left


:

 

-262
px


;
}
100%{
margin-left


:

 

-265
px


;
}
}
@
-o-keyframes shake { 0%{
	margin-left: -265px;
}

25%{
margin-left


:

 

-262
px


;
}
50%{
margin-left


:

 

-265
px


;
}
75%{
margin-left


:

 

-262
px


;
}
100%{
margin-left


:

 

-265
px


;
}
}
@
keyframes shake { 0%{
	margin-left: -265px;
}

25%{
margin-left


:

 

-262
px


;
}
50%{
margin-left


:

 

-265
px


;
}
75%{
margin-left


:

 

-262
px


;
}
100%{
margin-left


:

 

-265
px


;
}
}
#mainMask {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 600px;
	background: #000;
	opacity: 0.2;
	filter: alpha(opacity = 20);
	z-index: 1;
}

/* 易信二维码登录 */
#yxLoginEntry, #closeYxLogin {
	position: absolute;
	display: block;
	width: 64px;
	height: 64px;
}

#yxLoginEntry {
	background-position: 0 -75px;
	right: 14px;
	bottom: 15px;
	_right: 13px;
	_bottom: 14px
}

#yxLoginEntry:hover {
	background-position: -65px -75px;
}

#closeYxLogin {
	background-position: 0 -140px;
	right: 0;
	_right: -1px;
	bottom: 0;
	_bottom: -1px
}

#closeYxLogin:hover {
	background-position: -65px -140px;
}

#loginByYX {
	position: absolute;
	right: 14px;
	_right: 13px;
	bottom: 15px;
	overflow: hidden;
	padding: 70px 25px 0;
	width: 0;
	height: 0;
	line-height: 24px;
	font-size: 14px;
	text-align: center;
	display: none;
	z-index: 10;
	background: url(http://mimg.127.net/index/lib/img/yxlogin_bg.v1.png)
		no-repeat;
	_background-image:
		url(http://mimg.127.net/index/lib/img/yxlogin_bg_ie6.v1.png);
}

#loginByYX a {
	color: #279c7b
}

#yxCode {
	display: block;
	margin: 35px auto 0;
}

#loginByYX h3 {
	line-height: 20px;
	color: #626262;
	font-weight: bold;
}

.loginByYX-txt, .loginByYX-txt-err {
	height: 20px;
	font-size: 12px;
	line-height: 20px;
	color: #279c7b;
	font-weight: bold;
}

.loginByYX-install {
	margin-top: 20px;
	color: #959595;
}

.loginByYX-install a {
	text-decoration: underline;
}

#yxCodeRefresh {
	position: absolute;
	top: 104px;
	left: 65px;
	width: 165px;
	height: 165px;
}

.loginByYX-mask {
	height: 100%;
	background: #fff;
	opacity: 0.9;
	filter: alpha(opacity = 90);
}

.loginByYX-refreshWrap {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	padding-top: 48px;
	text-align: center;
}

.loginByYX-refreshBtn {
	margin: 0 auto 7px;
	display: block;
	width: 90px;
	height: 36px;
	line-height: 36px;
	background-position: 0 0;
	color: #fff !important;
	text-align: center;
	font-weight: bold;
}

.loginByYX-btn:hover {
	background-position: 0 -36px;
}

.loginByYX-refreshHint {
	color: #279c7b;
	line-height: 22px;
}
</style>

<script id="jsOption" type="text/javascript">
//当前域名配置
var gOption = {
	"sDomain" : "163.com",
	"sCookieDomain" : "mail.163.com",
	"sAutoLoginUrl" : "http://entry.mail.163.com/coremail/fcg/ntesdoor2?lightweight=1&verifycookie=1&language=-1&from=web&df=webmail163",
	"sSslAction" : "https://ssl.mail.163.com/entry/coremail/fcg/ntesdoor2?",
	"product" : "mail163",
	"url" : "http://entry.mail.163.com/coremail/fcg/ntesdoor2?",
	"url2" : "http://mail.163.com/errorpage/error163.htm",
	"gad" : "mail.163.com"
};
</script>
<script id="jsBase" type="text/javascript"
	src="http://mimg.127.net/index/lib/scripts/base_v5.min.js"></script>
<script id="jsInit" type="text/javascript">
fSetCookie("starttime",'',false); // starttime 登录时间统计
fCheckCookie();
fCheckAutoLogin();
if(!fGetQuery('errorType')){ // 有错误信息时不自动登录
	fAutoLogin();
}
fCheckBrowser();
fHtml5Tag();
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

<body class=" move" style="padding-top: 0px;">
	<header class="header">
		<h1 class="headerLogo">
			<a href="#" target="_blank"
				title="云WIFI"><img src="${ctx}/source/images/yunwifi.jpg"
				alt="云WIFI"></a>
		</h1>
	</header>

	<section class="main" id="mainBg"
		style="background-image: url(http://mimg.127.net/m/lc/img/LoginBackgroundPic/20/0/bgPic.jpg); background-color: rgb(34, 62, 79);">
		<div class="main-inner" id="mainCnt"
			style="background-image: url(http://mimg.127.net/m/lc/img/LoginBackgroundPic/20/0/promPic.jpg);">
			
		</div>
		<!--气泡浮层遮罩-->
		<div id="mainMask" style="display: none;"></div>
		<!--通用气泡浮层-->
		<div id="bubbleLayer" class="layer">
			<div class="layer-hd"></div>
			<div id="bubbleLayerWrap" class="layer-mid"></div>
			<div class="layer-ft"></div>
			<div id="layerArr" class="layer-arrow"></div>
		</div>
		<!--登录框-->
		<div id="loginBlock" class="login tab-1">
			<div >
					<div class="pass-login-title">
						<em class="bd-logo"></em>登录平台帐号
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
	</section>

	<footer id="footer" class="footer">
		<div class="footer-inner" id="footerInner">
			
			<nav class="footerNav">
				<a href="#" target="_blank">关于北研究院</a>|<span class="copyright">北研究院版权所有©1997-2014</span>
			</nav>
		</div>
	</footer>
	<!--遮罩-->
	<div id="mask" class="mask" style="display: none; height: 729px;"></div>
	<!--登录提示弹框-->
	<div class="enhttp" style="display: none" id="enhttpblock">
		<div class="enhttpbox">
			<div class="topborder"></div>
			<div class="ct">
				<div class="inner">
					<p class="txt-tips">登录过程有点慢哦，可能是由于网络问题造成的。</p>
					<p id="enhttpTips" class="txt-normal">
						<span id="backwards">3</span>&nbsp;秒后自动尝试普通加密方式登录
					</p>
					<p class="txt-normal">
						<a id="idLoginBtn" class="httplogin" href="javascript:void(0)">确&nbsp;&nbsp;定</a>
					</p>
					<p class="txt-line"></p>
					<p class="txt-advice">
						无法登录邮箱？<a class="txt-advicelink"
							href="http://help.mail.163.com/feedback.do?m=add&amp;categoryName=%e7%99%bb%e5%bd%95"
							target="_blank">意见反馈&gt;&gt;</a>
					</p>
				</div>
			</div>
			<div class="bottomborder"></div>
		</div>
		<iframe class="httploginframe" src="about:blank" id="frameforlogin"
			name="frameforlogin" style="overflow: hidden; border: 0">登录iframe</iframe>
	</div>
	<!--首页评分弹框-->
	<div id="scoreIndexPop">
		<iframe id="scoreIndexPopIfm" src="about:blank" frameborder="0"
			scrolling="no" allowtransparency="allowtransparency"></iframe>
	</div>
	

	<script id="jsExec" type="text/javascript">
/* 全局变量 */
// 保存UD数据，用于缓存
var gAdUserPropertyData;
// 定义广告素材全局变量
var gAdResData = {
	// 1、手机号码
	mobile : function(){
		return nRandom = 0;
	},
	// 2、易信
	yixin : function(){
		return nRandom = 1;
	},
	// 3、云音乐
	music : function(){
		return nRandom = 3;
	},
	// 4、云阅读
	read : function(){
		return nRandom = 4;
	},
	// 5、新闻客户端
	news : function(){
		return nRandom = 5;
	}
};

//错误提示语
var gErrorInfo = {
	'noId' : {
		'title' : '请先输入您的邮箱帐号'
	},
	'noPhone' : {
		'title' : '请先输入您的手机号码邮箱帐号'
	},
	'noPw' : {
		'title' : '请输入您的密码'
	},
	'noDynPw' : {
		'title' : '请输入动态密码'
	},
	'noDynPwByMob' : {
		'title' : '请输入手机短信中的动态密码'
	},
	'noDynPwByYX' : {
		'title' : '请输入易信接收到的动态密码'
	},
	'dynPwWrong' : {
		'title' : '您输入的动态密码错误，请重新输入'
	},
	'noBindingMob' : {
		'title' : '该邮箱帐号未绑定手机号码，需绑定才能使用动态密码功能 <a id="bindMobileBtn" href="http://shouji.mail.163.com/?from=dtmm" target="_blank">立即绑定>></a>'
	},
	'dynPwd2Much' : {
		'title' : '您今天使用动态密码登录次数太多了，请用普通密码登录吧'
	},
	'mobLoginWrongDomain' : {
		'title' : '这个帐号请到<a href="http://mail.126.com">126邮箱</a>进行登录'
	},
	'inputWrong' : {
		'title' : '帐号或密码错误',
		'info' 	: '1. 请检查帐号拼写，是否输入有误<br />2. 若帐号长期未登录，可能已被注销，请<a href="http://reg.email.163.com/unireg/call.do?cmd=register.entrance&from=163mail_right" target="_blank">重新注册</a><br />3. 若您忘记密码，请<a href="http://reg.163.com/getpasswd/RetakePassword.jsp?from=mail163" target="_blank">找回密码</a><br/>4. 若您需要锁定此帐号，请<a href="http://reg.163.com/lockuser/LockUserByPingma_0.jsp" target="_blank">点击这里</a><br/>5. 若手机号码邮箱的手机号已更换，可<a href="http://reg.163.com/mobilealias/findBindHistoryIndex.do" target="_blank">找回原帐号</a>'
	},
	'idLocked' : {
		'title' : '抱歉！您的帐号已被锁定，<br />暂时无法登录。'
	},
	'systemBusy' : {
		'title' : '繁忙的系统暂时需要停下歇歇，请您稍后再试。'
	},
	'loginWrong' : {
		'title' : '您的登录过于频繁，请稍后再试。'
	},
	'loginTimeout' : {
		'title' : '登录超时！',
		'info' 	: '当前邮箱登录状态已失效, 请重新登录。'
	}
};

var oStyle = {
	value	:	'-1'
};

(function(window){
	window.indexLogin = {
		init 					: fInit,
		setUserInfo 			: fSetUserInfo,
		// 输入相关
		initInputBox 			: fInitInputBox,
		focusInputBox 			: fFocusInputBox,
		idInputEvent 			: fIdInputEvent,
		checkPw 				: fCheckPw,
		checkDynPw 				: fCheckDynPw,
		checkInputAlways 		: fCheckInputAlways,
		handleString 			: fHandleString,
		// tab切换相关
		switchTab 				: fSwitchTab,
		switchTabTimeout 		: fSwitchTabTimeout,
		setbSwitchTabTimeout 	: fSetbSwitchTabTimeout,
		// 登录相关
		setStyle 				: fSetStyle,
		submitForm 				: fSubmitForm,
		showTheHttpLogin 		: fShowTheHttpLogin,
		showError 				: fShowError,
		showLayer 				: fShowLayer,
		hideLayer 				: fHideLayer,
		yxLogin 				: fInitYxLogin,
		zoomWrap 				: fZoomWrap,
		vericalAlignBody 		: fVericalAlignBody,
		// 其它
		KX 						: fKX,
		tmpSwitchLog 			: fTmpSwitchLog
	};

	var oId, oIdL, oPw, oPwL, oDynPw, oDynPwL;
	var nDomainWidth = 75;
	var tab1Cls = 'login tab-1',
		tab2Cls = 'login tab-2';
	var ntabOn = 1,
		sTmpPwd = '',
		sTmpDynPwd = '';
	var bSwitchTabTimeout = true;

	//登录流程
	var sLoginFunc = 'ssl',
		bIsFirstLog = true,
		sCoremailCookie = '';

	// starttime 登录时间统计
	var bStartTime = true;

	var fScaleInterval = null,
		bStartScale = false;

	function fInit(){
		var me = this;

		oId = $id('idInput');
		oIdL = $id('idInputLine');
		oPw = $id('pwdInput');
		oPwL = $id('pwdInputLine');
		oDynPw = $id('dynPwInput');
		oDynPwL = $id('dynPwInputLine');

		window.frames['frameforlogin'].location.href = 'about:blank';
		// 读取url判断是否有错误信息
		var sErrKey = 'errorType';
		if(window.location.href.indexOf('?' + sErrKey) > -1){
			var sErrorCode = fGetQuery(sErrKey);
			me.showError(sErrorCode);
		}

		// tab控制
		if(gbForcepc){
			tab1Cls = 'login tab-1 tab-11';
		}
		$id('loginBlock').className = tab1Cls;

		var oTab2 = $id('lbDynPw');
		fEventListen(oTab2, 'mouseover', me.switchTabTimeout);
		fEventListen(oTab2, 'mouseout', me.setbSwitchTabTimeout);

		if((window.location.href.indexOf('tab2') > -1) || fGetQueryHash('tab') == '2'){
			me.switchTab(); // 手机号码邮箱
			me.tmpSwitchLog(); // 临时统计
		}

		me.focusInputBox();

		me.setUserInfo();
		me.initInputBox();

		// 绑定提交表单事件
		// fEventListen($id('login163'), 'submit', me.submitForm);
		$id('login163').onsubmit = function(){
			return me.submitForm();
		};

		// 大写锁定开启判断
		var oCapsLockTest = new CapsLock({
			el : oPw,
			change : function(bFlag){
				var oHint = $id('capsLockHint');
				if(bFlag){
					oHint.style.display = 'block';
				}else{
					oHint.style.display = 'none';
				}
			}
		});
		
		me.yxLogin();
		me.KX(); // 可信标识
	}

	/**
	 * 根据cookie预设用户信息
	 */
	function fSetUserInfo(){
		var me = this;
		// 邮箱版本设定
		var sLogType = fGetCookie('logType');
		if(sLogType == '' || sLogType == null){
			sLogType = gUserInfo.style;
		}
		switch(sLogType){
			case '7':
				fSetStyle(7); // js6
				break;
			case '6':
				fSetStyle(6); // jy6
				break;
			case '5':
				me.setStyle(5); // js5
				break;
			case 'jy5':
			case '3':
				me.setStyle(3); // jy5
				break;
			default :
				me.setStyle(-1);
		}
		// 兼容logType并清除
		fSetCookie('logType' , '' , false);

		// 用户名设定
		var sUser = gUserInfo.username,
			sUid = fGetQueryHash('uid'),
			sErrorUsername = fGetQuery('errorUsername', true),
			sResult;
		if(sUser != null){
			oId.autocomplete='on';
		}else{
			oId.autocomplete='off';
		}
		try{ oId.focus(); }catch(e){}
		if((sUser != '' && sUser != null) || sErrorUsername != null){
			sResult = sUser;
			if( sUid != null ){
				sResult = fCheckAccount(sUid);
			}
			// 错误页跳转参数
			if(sErrorUsername != null){
				sResult = fCheckAccount(sErrorUsername);
			}
			oId.value = sResult;
			fCls(oIdL, 'showPlaceholder', 'remove');
			me.idInputEvent();
			//gMobileNumMail.getNumFromMail(oId.value);
			try{ oPw.focus(); }catch(e){}
		}
	}

	/**
	 * 绑定输入框事件
	 */
	function fInitInputBox(){
		var me = this;
		var oLo = $id('loginBtn'),
			oLo2 = $id('loginBtn2'),
			oRg = $id('lfBtnReg'),
			oIdLabel = $id('idPlaceholder'),
			oPwLabel = $id('pwdPlaceholder'),
			oDynPwLabel = $id('dynPwPlaceholder'),
			oAutoTips = $id('whatAutologinTip'),
			oAutoLoginWrap = $id('lfAutoLogin'),
			oAutoLoginCheckbox = oAutoLoginWrap.getElementsByTagName('b')[0],
			oRemAutoLogin = $id('remAutoLogin'),
			oAutoLoginTxt = $id('remAutoLoginTxt'),
			oStyleConf = $id('styleConf'),
			oStyleConfBlk = $id('styleConfBlock'),
			oShowDynPwWrap = $id('showDynPwWrap');
		var oBubbleLayer = $id('bubbleLayer');
		//帐号
		fEventListen(oIdL, 'mouseover', function(){
			fCls(oIdL, 'loginFormIpt-over', 'add');
		});
		fEventListen(oIdL, 'mouseout', function(){
			fCls(oIdL, 'loginFormIpt-over', 'remove');
		});
		fEventListen(oId, 'focus', function(){
			fCls(oId, 'formIpt-focus', 'add');
			fCls(oIdL, 'loginFormIpt-focus', 'add');
		});
		fEventListen(oId, 'blur', function(){
			fCls(oIdL, 'loginFormIpt-focus', 'remove');	
			if(oId.value == ''){
				fCls(oIdL, 'showPlaceholder', 'add');
				fCls(oId, 'formIpt-focus', 'remove');
			}else{
				oId.value = fCheckAccount(oId.value);
			}
		});

		var sEventName = '';
		var bIsIe = false;
		if(document.body.onpropertychange === null){
			sEventName = 'propertychange';
			var bIsIe = true;
		}else{
			sEventName = 'input';
			me.checkInputAlways();
		}
		var el = document.createElement('div');
		el.setAttribute('oninput', 'return;')
		if(typeof el.oninput === 'function'){
			sEventName = 'input';
			if(bIsIe){
				me.checkInputAlways();
			}
		}
		fEventListen(oId, sEventName, me.idInputEvent);
		//点击双击文字
		fEventListen(oIdLabel, 'dbclick', function(){
			oId.focus();
		});
		fEventListen(oIdLabel, 'click', function(){
			oId.focus();
		});

		//密码
		fEventListen(oPwL, 'mouseover', function(){
			fCls(oPwL, 'loginFormIpt-over', 'add');
		});
		fEventListen(oPwL, 'mouseout', function(){
			fCls(oPwL, 'loginFormIpt-over', 'remove');
		});
		fEventListen(oPw, 'focus', function(){
			fCls(oPw, 'formIpt-focus', 'add');
			fCls(oPwL, 'loginFormIpt-focus', 'add');
		});
		fEventListen(oPw, 'blur', function(){
			fCls(oPwL, 'loginFormIpt-focus', 'remove');
			if(oPw.value == ''){
				fCls(oPwL, 'showPlaceholder', 'add');
				fCls(oPwL, 'formIpt-focus', 'remove');
			}
		});
		fEventListen(oPw, sEventName, me.checkPw);
		//点击双击文字
		fEventListen(oPwLabel, 'dbclick', function(){
			oPw.focus();
		});
		fEventListen(oPwLabel, 'click', function(){
			oPw.focus();
		});
		//十天自动登录checkbox
		fEventListen(oAutoLoginCheckbox, 'click', function(){
			if(oRemAutoLogin.checked){
				fCls(oAutoLoginWrap, 'autoLogin-checked', 'remove');
				oRemAutoLogin.checked = false;
			}else{
				fCls(oAutoLoginWrap, 'autoLogin-checked', 'add');
				oRemAutoLogin.checked = true;
			}
		});
		fEventListen(oAutoLoginTxt, 'click', function(){
			if(oRemAutoLogin.checked){
				fCls(oAutoLoginWrap, 'autoLogin-checked', 'remove');
				oRemAutoLogin.checked = false;
			}else{
				fCls(oAutoLoginWrap, 'autoLogin-checked', 'add');
				oRemAutoLogin.checked = true;
			}
		});
		//十天自动登录文字提示
		fEventListen(oAutoLoginTxt, 'mouseover', function(){
			oAutoTips.style.display = 'block';
		});
		fEventListen(oAutoLoginTxt, 'mouseout', function(){
			oAutoTips.style.display = 'none';
		});
		//登录按钮
		fEventListen(oLo, 'mouseover', function(){
			fCls(oLo, 'btn-login-hover', 'add');
		});
		fEventListen(oLo, 'mouseout', function(){
			oLo.className = 'btn btn-main btn-login';
		});
		fEventListen(oLo, 'mousedown', function(){
			fCls(oLo, 'btn-login-active', 'add');
		});
		//注册按钮
		fEventListen(oRg, 'mouseover', function(){
			fCls(oRg, 'btn-reg-hover', 'add');
		});
		fEventListen(oRg, 'mouseout', function(){
			oRg.className = 'btn btn-side btn-reg';
		});
		fEventListen(oRg, 'mousedown', function(){
			fCls(oRg, 'btn-reg-active', 'add');
		});
		fEventListen(oRg, 'mouseup', function(){
			oRg.className = 'btn btn-side btn-reg';
		});
		//动态密码tab登录按钮
		fEventListen(oLo2, 'mouseover', function(){
			fCls(oLo2, 'btn-login2-hover', 'add');
		});
		fEventListen(oLo2, 'mouseout', function(){
			oLo2.className = 'btn btn-main btn-login2';
		});
		fEventListen(oLo2, 'mousedown', function(){
			fCls(oLo2, 'btn-login2-active', 'add');
		});
		//动态密码输入框
		fEventListen(oDynPwL, 'mouseover', function(){
			fCls(oPwL, 'loginFormIpt-over', 'add');
		});
		fEventListen(oDynPwL, 'mouseout', function(){
			fCls(oPwL, 'loginFormIpt-over', 'remove');
		});
		fEventListen(oDynPw, 'focus', function(){
			fCls(oDynPw, 'formIpt-focus', 'add');
			fCls(oDynPwL, 'loginFormIpt-focus', 'add');
		});
		fEventListen(oDynPw, 'blur', function(){
			fCls(oDynPwL, 'loginFormIpt-focus', 'remove');
			if(oDynPw.value == ''){
				fCls(oDynPwL, 'showPlaceholder', 'add');
				fCls(oDynPwL, 'formIpt-focus', 'remove');
			}
		});
		fEventListen(oDynPw, sEventName, me.checkDynPw);
		//获取动态密码按钮
		fEventListen(oShowDynPwWrap, 'mouseover', function(){
			fCls(oShowDynPwWrap, 'btn-showDynPwWrap-hover', 'add');
		});
		fEventListen(oShowDynPwWrap, 'mouseout', function(){
			oShowDynPwWrap.className = 'btn btn-showDynPwWrap';
		});
		fEventListen(oShowDynPwWrap, 'mousedown', function(){
			fCls(oShowDynPwWrap, 'btn-showDynPwWrap-active', 'add');
		});
		fEventListen(oShowDynPwWrap, 'mouseup', function(){
			oShowDynPwWrap.className = 'btn btn-showDynPwWrap';
		});
		//版本选择
		fEventListen(oStyleConf, 'click', function(){
			oStyleConfBlk.style.display = 'block';
		});
		oStyleConfBlk.onmouseout = function(e){
			var oE = e || window.event;
			var that = this;
			_fE(function(){
				oStyleConfBlk.style.display = 'none';
			}, oE, that);
		};
		//线路选择
		$id('locationTest').onmouseout = function(e){
			var oE = e || window.event;
			var that = this;
			_fE(function(){
				$id('locationTest').style.display = 'none';
			}, oE, that);
		};
		//阻止事件触发
		function _fE(fFunc, oE, oThat){
			var e = oE,
			relatedTarget = e.toElement || e.relatedTarget;
			while(relatedTarget && relatedTarget != oThat){
				relatedTarget = relatedTarget.parentNode;
			}
			if(!relatedTarget){
				fFunc();
			}
		}
	}

	/**
	 * 输入框聚焦
	 */
	function fFocusInputBox(){
		try{
			if(oId.value != ''){
				/*if(ntabOn == 1){
					gMobileNumMail.getNumFromMail(oId.value);
				}else{
					gMobileNumMail.getMailFromNum(oId.value);
				}*/
				fCls(oIdL, 'showPlaceholder', 'remove');
				fCls(oId, 'formIpt-focus', 'add');
				if(ntabOn == 1){
					oPw.focus();
					fCls(oPwL, 'loginFormIpt-focus', 'add');
				}else{
					oDynPw.focus();
					fCls(oDynPwL, 'loginFormIpt-focus', 'add');
				}
			}else{
				oId.focus();
			}
		}catch(e){}
	}

	/**
	 * 输入超长时隐藏后缀显示区
	 */
	function fIdInputEvent(){
		var oShowDomain = $id('showdomain'),
			oInputTest = $id('idInputTest');
		if(oId.value == ''){
			fCls(oIdL, 'showPlaceholder', 'add');
			if(oInputTest.innerText != undefined){
				oInputTest.innerText = '';
			}else{
				oInputTest.innerHTML = '';
			}
			oShowDomain.style.width = nDomainWidth + 'px';
		}else{
			fCls(oIdL, 'showPlaceholder', 'remove');
			fCls(oId, 'formIpt-focus', 'add');
			if(oInputTest.innerText != undefined){
				oInputTest.innerText = oId.value;
			}else{
				oInputTest.innerHTML = oId.value;
			}
			var tmpWidth = oInputTest.offsetWidth;
			if(tmpWidth - 130 >= 0 && tmpWidth - 130 <= nDomainWidth){
				oShowDomain.style.width = nDomainWidth - (tmpWidth - 130) + 'px';
			}else if(tmpWidth - 130 < 0){
				oShowDomain.style.width = nDomainWidth + 'px';
			}else{
				oShowDomain.style.width = '0px';
			}
		}
	}

	/**
	 * 检查密码输入框状态
	 */
	function fCheckPw(){
		if(oPw.value != ''){
			fCls(oPwL, 'showPlaceholder', 'remove');
			fCls(oPw, 'formIpt-focus', 'add');
		}else{
			fCls(oPwL, 'showPlaceholder', 'add');
		}
	}

	/**
	 * 检查动态密码输入状态
	 */
	function fCheckDynPw(){
		if(oDynPw.value != ''){
			fCls(oDynPwL, 'showPlaceholder', 'remove');
			fCls(oDynPw, 'formIpt-focus', 'add');
		}else{
			fCls(oDynPwL, 'showPlaceholder', 'add');
		}
	}

	/**
	 * 持续检查输入框状态
	 */
	function fCheckInputAlways(){
		var me = this;
		window.oIntervalCheckInputAlways = setInterval(function(){
			if(oId.value != ''){
				fCls(oIdL, 'showPlaceholder', 'remove');
				fCls(oId, 'formIpt-focus', 'add');
			}else{
				fCls(oIdL, 'showPlaceholder', 'add');
			}
			me.idInputEvent();
			me.checkPw();
			me.checkDynPw();
		},500);
	}

	/**
	 * 字符转换（全角转半角，中文逗号转英文逗号）
	 * @param  {[type]} s [description]
	 * @return {[type]}   [description]
	 */
	function fHandleString(s){ 
		var result = "";
		for(var i = 0; i < s.length; i++){
			if(s.charCodeAt(i)==12288){
				result += String.fromCharCode(s.charCodeAt(i)-12256);
				continue;
			}
			if(s.charCodeAt(i)>65280 && s.charCodeAt(i)<65375){
				result += String.fromCharCode(s.charCodeAt(i)-65248);
			}else{
				result += String.fromCharCode(s.charCodeAt(i));
			}
		}
		result.replace(/。/g, '.');
		return result;
	}

	/**
	 * 绑定tab事件
	 */
	function fSwitchTab(){
		var me = this;
		var oTab = $id('loginBlock'),
			oTab1 = $id('lbNormal'),
			oTab2 = $id('lbDynPw'),
			oIdLabel = $id('idPlaceholder'),
			oNormalLg = $id('normalLogin'),
			oDynPwLg = $id('dynPwLogin');
		var oInputTest = $id('idInputTest');
		me.hideLayer();

		if(ntabOn == 1){
			// 加载动态密码登录js
			var oDynPwConf = {
				domain: '163.com'
			};
			if(!window.DynamicPassword){
				fGetScript('http://mimg.127.net/index/lib/scripts/dynamicpassword.js', function(){
					new DynamicPassword(oDynPwConf);
				});
			}
			oPw.name = '';
			oDynPw.name = 'password';
			sTmpPwd = oPw.value;
			oNormalLg.style.display = 'none';
			oDynPwLg.style.display = 'block';
			oTab.className = tab2Cls;
			ntabOn = 2;
			fEventUnlisten(oTab2, 'mouseover', me.switchTabTimeout);
			fEventUnlisten(oTab2, 'mouseout', me.setbSwitchTabTimeout);
			fEventListen(oTab1, 'mouseover', me.switchTabTimeout);
			fEventListen(oTab1, 'mouseout', me.setbSwitchTabTimeout);
			oPw.value = sTmpDynPwd;
			if( sTmpDynPwd == '' ){
				fCls(oPwL, 'showPlaceholder', 'add');
			}else{
				fCls(oPwL, 'showPlaceholder', 'remove');
			}
			if(window.bHTTPSDisabled){
				// 浏览器禁止了ssl
				alert('由于您在浏览器设置中禁止使用了ssl，所以无法使用动态密码登录！');
			}
		}else{
			oPw.name = 'password';
			oDynPw.name = '';
			sTmpDynPwd = oPw.value;
			oDynPwLg.style.display = 'none';
			oNormalLg.style.display = 'block';
			oTab.className = tab1Cls;
			ntabOn = 1;
			fEventUnlisten(oTab1, 'mouseover', me.switchTabTimeout);
			fEventUnlisten(oTab1, 'mouseout', me.setbSwitchTabTimeout);
			fEventListen(oTab2, 'mouseover', me.switchTabTimeout);
			fEventListen(oTab2, 'mouseout', me.setbSwitchTabTimeout);
			oPw.value = sTmpPwd;
			if(sTmpPwd == ''){
				fCls(oPwL, 'showPlaceholder', 'add');
			}else{
				fCls(oPwL, 'showPlaceholder', 'remove');
			}
		}
		me.idInputEvent();
		me.focusInputBox();
	}

	function fSwitchTabTimeout(){
		setTimeout(function(){
			if(bSwitchTabTimeout){
				indexLogin.switchTab();
			}else{
				bSwitchTabTimeout = true;
			}
		}, 300);
	}

	function fSetbSwitchTabTimeout(){
		bSwitchTabTimeout = false;
	}

	/**
	 * 设置版本
	 * @param  {Number} n 版本号
	 */
	function fSetStyle(n){
		var oStyleConfBlk = $id('styleConfBlock');
		var aVers = oStyleConfBlk.getElementsByTagName('a');
		for(var i=0, l=aVers.length; i<l; i++){
			aVers[i].className = '';
		}
		oStyle.value = n;
		$id('styleconf' + n).className = 'verSelected';
		$id('styleConf').innerHTML = $id('styleconf' + n).innerHTML + ' <b class="ico ico-arr ico-arr-d"></b>';
		oStyleConfBlk.style.display = 'none';
		// 判断是否全程ssl
		if(n == 3 || n == 6){
			// 简约5\简约6 显示全程ssl
			$id('loginSSL').style.display = 'none';
			$id('AllSSL').style.display = 'block';
		}else{
			$id('loginSSL').style.display = 'block';
			$id('AllSSL').style.display = 'none';
			$id('AllSSLCkb').checked = false;
		}
	}

	/**
	 * 登录提交
	 * @return {Boolean}
	 */
	function fSubmitForm(){
		var me = this;

		var bDyn = ntabOn == 2;
		// 浏览器禁止了ssl
		if(window.bHTTPSDisabled && bDyn){
			alert('由于您在浏览器设置中禁止使用了ssl，所以无法使用动态密码登录！');
			return false;
		}

		// 检查输入
		oId.value = fTrim(oId.value);
		if(oId.value == ''){
			oId.focus();
			me.showError(1);
			return false;
		}
		if(ntabOn == 1){
			if(oPw.value.length == ''){
				oPw.focus();
				me.showError(3);
				return false;
			}else if(!fTrim(oPw.value)){ // 特殊处理密码全空格
				me.showError(460);
				return false;
			}
		}else{
			if(oDynPw.value.length == ''){
				oDynPw.focus();
				if(window.DynamicPassword){
					if(DynamicPassword.sms){
						me.showError(5);
					}else if(DynamicPassword.yixin){
						me.showError(6);
					}else{
						me.showError(4);
					}
				}else{
					me.showError(4);
				}
				return false;
			}else if(!fTrim(oDynPw.value)){ // 特殊处理密码全空格
				me.showError(460);
				return false;
			}
		}

		// starttime 登录时间统计
		if(bStartTime){
			var sNow = new Date().getTime();
			fSetCookie("starttime", sNow, false);
			bStartTime = false;
		}

		//用户名、密码不标准字符处理
		oId.value = me.handleString(oId.value);
		oPw.value = me.handleString(oPw.value);
		oDynPw.value = me.handleString(oDynPw.value);

		//16位密码截断
		if(oPw.value.length > 16){
			oPw.value = oPw.value.substr(0,16);
		}
		//保存十天免登录
		if($id('remAutoLogin').checked){
			$id('savelogin').value = 1;
		}else{
			$id('savelogin').value = 0;
		}
		//登陆后锁定tab
		var oTabDisabled;
		if( ntabOn == 1 ){
			oTabDisabled = $id('lbDynPw');
		}else{
			oTabDisabled = $id('lbNormal');
		}
		fEventUnlisten(oTabDisabled, 'mouseover', me.switchTabTimeout);
		fEventUnlisten(oTabDisabled, 'mouseout', me.setbSwitchTabTimeout);

		var fReBindSwitchTab = setInterval(function(){
			try{
				//若有错误提示，则重新绑定切换tab事件
				if(window.frames["frameforlogin"].document.body.className == 'error'){
					fEventListen(oTabDisabled, 'mouseover', me.switchTabTimeout);
					fEventListen(oTabDisabled, 'mouseout', me.setbSwitchTabTimeout);
					clearInterval(fReBindSwitchTab);
				}
			}catch(e){}
		},500);

		//锁定登录键
		$id('loginBtn').disabled = true;
		$id('loginBtn2').disabled = true;

		//储存登录信息
		gUserInfo.username = oId.value;
		gUserInfo.style = oStyle.value;
		if(bIsFirstLog){
			//if($id('SslLogin').checked){
				gUserInfo.safe = 1;
				sLoginFunc = 'ssl';
			/*}else{
				gUserInfo.safe = 0;
				sLoginFunc = 'http';
			}*/
		}else{
			if(sLoginFunc == 'ssl'){
				gUserInfo.safe = 1;
			}else{
				gUserInfo.safe = 0;
			}
		}
		gVisitorCookie.saveInfo();
		//弹出超时对话框
		if(bIsFirstLog){
			sCoremailCookie = fGetCookie('Coremail');
			setTimeout(function(){
				//若无错误提示，则判断为登录超时
				try{
					if(window.frames["frameforlogin"].document.body.className != 'error'){
						me.showTheHttpLogin();
					}
				}catch(e){
					me.showTheHttpLogin();
				}
			},5000);
		}
		//判断登录来源
		var sUrlRace = aSpdResult[1]+'_'+aSpdResult[0]+'_'+aSpdResult[2]+'_'+aSpdResult[3],
			sUrlDf = (function(){
				var sDf = fGetQueryHash('df');
				if(sDf == null){
					// 判断不同tab
					//var bIsMobile = ntabOn == 2;
					//if(bIsMobile){
					//	sDf = 'mail163_mobile';
					//}else{
						sDf = 'mail163_letter';
					//}
				}
				fSetCookie('df',sDf,false);
				return sDf;
			})(),
			sUrlUid = oId.value + '@' + gOption.sDomain;
		// 全程SSL
		var sAllSSL = ($id('AllSSLCkb').checked ? fUrlP('allssl', 'true') : '');
		//选择登录方式
		switch(sLoginFunc){
			case 'ssl' :
				var oForm = $id('login163');
				oForm.action = gOption.sSslAction
				+ fUrlP('df',sUrlDf,true)
				+ fUrlP('from','web')
				+ fUrlP('funcid','loginone')
				+ fUrlP('iframe','1')
				+ fUrlP('language','-1')
				+ fUrlP('passtype','1')
				+ fUrlP('product','mail163')
				+ fUrlP('net',sLocationInfo)
				+ fUrlP('style', oStyle.value)
				+ fUrlP('race',sUrlRace)
				+ fUrlP('uid', sUrlUid)
				+ (bDyn ? fUrlP('passAuthType', '1'):'')
				+ sAllSSL;
				if(bIsFirstLog){
					bIsFirstLog = false;
					return true;
				}else{
					oForm.submit();
				}
				break;
			case 'http' :
				window.sHttpAction  = gOption.url
				+ fUrlP('df',sUrlDf,true)
				+ fUrlP('from','web')
				+ fUrlP('language','-1')
				+ fUrlP('net',sLocationInfo)
				+ fUrlP('race',sUrlRace)
				+ fUrlP('style', oStyle.value)
				+ fUrlP('uid', sUrlUid)
				+ (bDyn ? fUrlP('passAuthType', '1'):'')
				+ sAllSSL;
				loginRequest('fEnData');
				return false;
				break;
			default :;
		}
		return false;
	}

	/**
	 * 登录超时弹框
	 * @return {Boolean}
	 */
	function fShowTheHttpLogin(){
		var me = this;
		var oIdLoginBtn = $id('idLoginBtn'),
			oHttpTips = $id('enhttpTips');
		fResize();
		window.frames['frameforlogin'].location.href = 'about:blank';
		$id('enhttpblock').style.display = 'block';
		$id('mask').style.display = 'block';
		$id('enhttpblock').focus();
		if(sLoginFunc == 'ssl'){
			var sCoremailCookieNew = fGetCookie('Coremail');
			if( sCoremailCookieNew != sCoremailCookie ){
				oHttpTips.innerHTML = '登录成功..等待跳转..';
				oIdLoginBtn.style.display = 'none';
				return false;
			}else{
				var nCount = 3;
				oHttpTips.innerHTML = '<span id="backwards">' + nCount +'</span>&nbsp;秒后自动重试';
				oIdLoginBtn.innerHTML = '立刻登录';
				fEventUnlisten(oIdLoginBtn, 'click', _fLoginFunc);
				fEventListen(oIdLoginBtn, 'click', _fLoginFunc1);
				window.gBackwards = setInterval(function(){
					nCount = nCount - 1;
					$id('backwards').innerHTML = nCount;
					if(nCount == 0){
						clearInterval(window.gBackwards);
						sLoginFunc = 'http';
						me.submitForm();
						me.showTheHttpLogin();
					}
				},1000);
				return false;
			}
		}else{
			oHttpTips.innerHTML = '点击重新尝试普通加密方式登录';
			oIdLoginBtn.innerHTML = '重试';
			fEventUnlisten(oIdLoginBtn, 'click', _fLoginFunc1);
			fEventListen(oIdLoginBtn, 'click', _fLoginFunc);
		}

		// 登录函数引用
		function _fLoginFunc(){
			me.submitForm();
		}
		function _fLoginFunc1(){
			me.submitForm();
			oHttpTips.innerHTML ='点击重新尝试https登录';
			oIdLoginBtn.innerHTML = '重试';
			clearInterval(window.gBackwards);
			fEventUnlisten(oIdLoginBtn, 'click', _fLoginFunc1);
			fEventListen(oIdLoginBtn, 'click', _fLoginFunc);
		}
	}

	/**
	 * 错误信息提示
	 * @param  {Number} nCode 错误代码
	 */
	function fShowError(nCode){
		var me = this;
		var sErrType = '',
			nTarget = 0;
		var sTitle = '',
			sInfo = '',
			sTpl = '';

		if(!isNaN(nCode)){
	    	nCode = nCode - 0;
	    }
		switch(nCode){
			case 'Login_Timeout':
				sErrType = 'loginTimeout';
				nTarget = 0;
				break;
			case 1:
				sErrType = 'noId';
				nTarget = 1;
				break;
			case 2:
				sErrType = 'noPhone';
				nTarget = 1;
				break;
			case 3:
				sErrType = 'noPw';
				nTarget = 2;
				break;
			case 4:
				sErrType = 'noDynPw';
				nTarget = 2;
				break;
			case 5:
				sErrType = 'noDynPwByMob';
				nTarget = 2;
				break;
			case 6:
				sErrType = 'noDynPwByYX';
				nTarget = 2;
				break;
			case 1000:
				sErrType = 'noBindingMob';
				nTarget = 1;
				break;
			case 1001:
				sErrType = 'dynPwWrong';
				nTarget = 2;
				break;
			case 1002:
				sErrType = 'dynPwd2Much';
				nTarget = 0;
				break;
			case 1003:
				sErrType = 'mobLoginWrongDomain';
				nTarget = 1;
				break;
			case 460:
			case 420:
				$id('dynPwInput').value = '';
				sErrType = 'inputWrong';
				nTarget = 0;
				break;
			case 422:
				sErrType = 'idLocked';
				nTarget = 1;
				break;
			case 414:
			case 415:
			case 416:
			case 417:
			case 418:
			case 419:
				sErrType = 'loginWrong';
				nTarget = 0;
				break;
			/*case 412:
				//已单独处理
				break;*/
			default:
				sErrType = 'systemBusy';
				nTarget = 0;
		}
		sTitle = gErrorInfo[sErrType].title,
		sInfo = gErrorInfo[sErrType].info,
		sTpl = [
			'<div class="error-tt">',
				'<p>' + sTitle + '</p>',
			'</div>',
			sInfo && sInfo != '' ?  
			['<div id="errorDetail" class="error-detail">',
				'<p>提示：</p>',
				'<p class="error-info">' + sInfo + '</p>',
			'</div>'].join('') : ''
		].join('');
		me.showLayer(sTpl, nTarget);

		//恢复登录键
		$id('loginBtn').disabled = false;
		$id('loginBtn2').disabled = false;
	}

	/**
	 * 显示气泡浮层
	 * @param  {String} sHtml 浮层内容
	 * @param  {Number} nTarget 浮层指向 0-通用 1-账号 2-密码
	 */
	function fShowLayer(sHtml, nTarget){
		var me = this;
		var oLayer = $id('bubbleLayer'),
			oLayerWrap = $id('bubbleLayerWrap'),
			oArr = $id('layerArr');
		var nBasePoint = 215;
		if(nTarget == 1){
			nBasePoint -= 30;
		}else if(nTarget == 2){
			nBasePoint += 30;
		}
		oLayerWrap.innerHTML = sHtml;
		$id('mainMask').style.display = 'block';
		fCls(oLayer, 'bubbleLayer-show', 'add');
		oLayer.style.top = nBasePoint - oLayer.offsetHeight/2 + 'px';
		oArr.style.top = (oLayer.offsetHeight - oArr.offsetHeight)/2 + 'px';

		fEventListen(document, 'click', me.hideLayer);
		if(!oLayer.__bindClick){
			fEventListen(oLayer, 'click', function(oEvt){
				try {
					oEvt.stopPropagation();
				} catch (e) {
					oEvt.cancelBubble = true;
				}
				oLayer.__bindClick = true;
			});
		}

		// 绑定手机号码增加参数
		var oBindMobBtn = $id('bindMobileBtn');
		if(oBindMobBtn){
			oBindMobBtn.href += '&username=' + oId.value + '&domain=' + gOption.sDomain;
			fEventListen(oBindMobBtn, 'click', indexLogin.hideLayer);
		}
	}

	/**
	 * 隐藏气泡浮层
	 */
	function fHideLayer(){
		fCls($id('bubbleLayer'), 'bubbleLayer-show', 'remove');
		$id('mainMask').style.display = 'none';
		fEventUnlisten(document, 'click', indexLogin.hideLayer);
	}

	/**
	 * 显示易信二维码登录
	 */
	function fInitYxLogin(){
		var me = this;
		var oEntryBtn = $id('yxLoginEntry'),
			oCloseEntryBtn = $id('closeYxLogin'),
			oYixinWrap = $id('loginByYX');
		fEventListen(oEntryBtn, 'click', function(){
			if(window.yixinLogin){
				_fShow();
			}else{
				fGetScript("http://mimg.127.net/index/lib/scripts/yxlogin_v2.js", function(){
					_fShow();
				});
			}
			return false;
		});

		fEventListen(oCloseEntryBtn, 'click', function(){
			window.yixinLogin && yixinLogin.clearPoll();
			me.zoomWrap(oYixinWrap, 'zoomOut', 245, 390);
		});

		function _fShow(){
			yixinLogin.init();
			me.zoomWrap(oYixinWrap, 'zoomIn', 245, 390);
		}
	}

	/**
	 * 放大缩小容器
	 */
	function fZoomWrap(oObj, sMethod, sWidth, sHeight){
		var n = 0,
			nOpa = 0,
			nMeasure = 35;
			nRatio = sHeight/sWidth,
			nOpaRatio = 1/(sWidth/nMeasure);
		if(bStartScale){
			return
		}
		fScaleInterval && clearInterval(fScaleInterval);
		switch(sMethod){
			case 'zoomIn' :
				bStartScale = true;
				oObj.style.display = 'block';
				fScaleInterval = setInterval(function(){
					if(n < sWidth){
						n = n + nMeasure;
						nOpa = nOpa + 1 * nOpaRatio;
						oObj.style.width = n + 'px';
						oObj.style.height = n * nRatio + 'px';
						oObj.style.opacity = nOpa;
					}else{
						clearInterval(fScaleInterval);
						bStartScale = false;
					}
				}, 30);
				break;
			case 'zoomOut' :
				bStartScale = true;
				n = sWidth;
				nOpa = 1;
				fScaleInterval = setInterval(function(){
					if(n > 0){
						n = n - nMeasure;
						nOpa = nOpa - 1 * nOpaRatio;
						oObj.style.width = n + 'px';
						oObj.style.height = n * nRatio + 'px';
						oObj.style.opacity = nOpa;
					}else{
						clearInterval(fScaleInterval);
						bStartScale = false;
						oObj.style.display = 'none';
					}
				}, 30);
				break;
		}
	}

	/**
	 * 设置垂直居中
	 */
	function fVericalAlignBody(){
		var nBodyHeight = 730;
		var nClientHeight = document.documentElement.clientHeight;
		if(nClientHeight >= nBodyHeight + 2){
			var nDis = (nClientHeight - nBodyHeight)/2;
			document.body.style.paddingTop = nDis + 'px';
		}else{
			document.body.style.paddingTop = '0px';
		}
	}

	/**
	 * 重写可信标识
	 */
	function fKX(){
		function RndNum_CNNIC(k){
			for (var rnd = "", i = k; i--; ){
				rnd += Math.floor( Math.random() * 10 );
			}
			return rnd;
		}
		var oKX = $id('KX_IMG');
		var oKXimg = oKX.getElementsByTagName('img')[0];
		var sHref = 'https://ss.knet.cn/verifyseal.dll?sn=e12051044010020841301459&ct=df&pa=';
		var sPa = RndNum_CNNIC(6);
		oKX.href = sHref + sPa;
	}

	/**
	 * 临时统计
	 */
	function fTmpSwitchLog(){
		var sJsLogUrl = 'http://count.mail.163.com/beacon/webmail.gif?product=mail163tab2&type=from163com';
		sJsLogUrl = sJsLogUrl + '&rnd=' + (new Date()).getTime();
		var oJsLogImg = $id('jslogimg');
		if(!oJsLogImg){
			oJsLogImg = document.createElement("IMG");
			oJsLogImg.style.display = 'none';
			oJsLogImg.alt = '';
		}
		oJsLogImg.setAttribute("src", sJsLogUrl);
		if(oJsLogImg.alt == ''){
			document.body.appendChild(oJsLogImg);
			oJsLogImg.alt = 'set';
		}
		return;
	}
})(window);

/**
 * 头图接入个性化后台广告
 */
(function(window){
    window.themeHandler = {
        isOpen              : true,
        init                : fInit,
        initData            : fInitData,
        getData             : fGetData,
        callback            : fCallback,
		adGetUdData 		: fAdGetUdData,
		showThemes			: fShowThemes,
		showNext			: fShowNext,
		showPrev 			: fShowPrev,
		themeShowLog 		: fThemeShowLog,
		scoreIndex 			: fScoreIndex,
        _data               : {},
        _interface          : 'http://ir3.mail.163.com/get.do',
        _param              : {
        	prod : 'wmail_lbp',
	        ver : 1,
	       	uid : (gUserInfo.username ? gUserInfo.username : 'nt') + '@' + gOption.sDomain,
	        domain : gOption.sDomain,
	        mobUser : 0, // temp
	        callback : 'themeHandler.callback'
        },
        _dftMaterial : [{
        	type : 0,
            bgColor : "2F3034",
            bgCnt : "http://mimg.127.net/index/163/themes/140919_mailapp_cnt.jpg",
            bInitLink : true,
            bgLink : "http://mail.163.com/client/dl.html?from=mail6"
        }],
		_bSuc 			: false,
		_currIndex		: 0
    };

    function fInit(){
        var me = this;
        me.initData();
        me.getData(); 
    }

    function fInitData(){
        var me = this;

        me._data = {
            // 个性化后台开关
            switcher : true,
            // 默认数据
            materials : me._dftMaterial,
            pid : 0
        };

        // 3秒后判断广告返回，仍无返回，则出容灾推广
		setTimeout(function(){
			if(me._bSuc){
				return;
			}else{
		        if(me._data.materials.length > 1){
		        	$id('prevTheme').style.display = 'block';
		        	$id('nextTheme').style.display = 'block';
		        }
		        me._currIndex = me._data.pid;
		        me.showThemes(me._data.materials[me._data.pid]); 
			}
		}, 3000);
    }

    function fGetData(){
        var me = this;
        if(!me.isOpen){
            me.callback();
            return;
        }
        if(me._data.switcher){
            fJSONP(me._interface, me._param);
        }else{
            me.callback();
        }
    }

    function fCallback(o){
        var me = this;
        me._bSuc = true;

        try{
        	var oData = window.gAdTemplate_lbp.parse(o);
        }catch(e){}

    	if(oData && oData.lbp){
            // 调用js转化广告模板
            me._data.materials = oData.lbp.material || me._dftMaterial;
            me._data.pid = oData.lbp.pid;
        }
        if(me._data.materials.length > 1){
        	$id('prevTheme').style.display = 'block';
        	$id('nextTheme').style.display = 'block';
        }
        me._currIndex = me._data.pid;
        me.showThemes(me._data.materials[me._data.pid]);
    }

	/**
	 * 获取个性化用户数据
	 * @return {Object} 个性化数据标志位组合对象
	 */
	function fAdGetUdData(){
		try {
			var oData = gAdUserPropertyData;
			if(oData){
				return oData;
			}else{
				oData = {};
			}
			// 读取cookie
			oData['all'] = fGetCookie('_mail_userattr_');
			if(oData['all'] && oData['all'].length > 0){
				oData['mobile'] = oData['all'].split("/")[0] - 0;
				oData['yixin'] = oData['all'].split("/")[1] - 0;
				oData['news'] = oData['all'].split("/")[2] - 0;
				oData['music'] = oData['all'].split("/")[3] - 0;
				oData['read'] = oData['all'].split("/")[4] - 0;
			}
			gAdUserPropertyData = oData;
			return oData;
		} catch (e) {return false;}
	}

	/**
	 * 主题图显示
	 * @param  {Object} oMaterial 素材对象
	 */
	function fShowThemes(oMaterial){
		var me = this;
		var oThemeWrap = $id('theme'),
			oBg = $id('mainBg'),
			oCnt = $id('mainCnt');
		// 重置oMaterial
		oThemeWrap.innerHTML = '';
		oThemeWrap.style.cssText = '';
		oBg.style.cssText = '';
		oCnt.style.cssText = '';
		if($id('themeIframe')){
			oCnt.removeChild($id('themeIframe'));
		}

		oMaterial.tempBgLink = oMaterial.bgLink || '';
		oMaterial.tempShowLink = oMaterial.showLink || '';
		
		// 为推广平台提供uid
		var sUid = (gUserInfo.username ? gUserInfo.username : 'nt') + '@' + gOption.sDomain;

		if(!oMaterial.bInitLink && oMaterial.bgLink && oMaterial.bgLink != ''){
			oMaterial.tempBgLink = oMaterial.bgLink + '&_r_ignore_uid=' + sUid;
			if(oMaterial.needUrs){
				oMaterial.tempBgLink += '&irurs=' + sUid;
			}
		}
		if(!oMaterial.bInitShowLink && oMaterial.showLink && oMaterial.showLink != ''){
			oMaterial.tempShowLink = oMaterial.showLink + '&uid=' + sUid;
		}

		// 展示数据统计
		if(oMaterial.tempShowLink != ''){
			me.themeShowLog(oMaterial.tempShowLink);
		}

		// 第三方自定义iframe
		if(oMaterial.type == 2){
			var oThemeIframe = document.createElement("iframe");
			oThemeIframe.id = 'themeIframe';
			oThemeIframe.className = 'main-inner-iframe';
			oThemeIframe.src = oMaterial.iframeUrl;
			oThemeIframe.setAttribute('scrolling', 'no');
			oCnt.insertBefore(oThemeIframe, oThemeWrap);
			oThemeWrap.style.display = 'none';
			return
		}

		// 图片显示处理
		if(oMaterial.bgColor){
			oBg.style.backgroundColor = '#' + oMaterial.bgColor;
		}else{
			oBg.style.backgroundColor = '#fff';
		}
		if(oMaterial.bgCnt && oMaterial.bgCnt != ''){
			_fImgLoader(oMaterial.bgCnt, function(){
				oCnt.style.backgroundImage = 'url(' + oMaterial.bgCnt + ')';
			});
		}
		if(oMaterial.bgSrc && oMaterial.bgSrc != ''){
			_fImgLoader(oMaterial.bgSrc, function(){
				oBg.style.backgroundImage = 'url(' + oMaterial.bgSrc + ')';
			});
		}

		// 首页评分
		if(oMaterial.scoreIndex){
			$id('scoreIndex').style.display = "block";
			window.oScoreIndex = oMaterial;
		}else{
			$id('scoreIndex').style.display = "none";
		}

		// 云音乐播放
		if(oMaterial.musicLink && oMaterial.musicLink !=''){
			$id('musicLink').style.display = "block";
			$id('musicLink').href = oMaterial.musicLink;
		}else{
			$id('musicLink').style.display = "none";
		}

		// 带链接主题图
		if(oMaterial.tempBgLink != ''){
			var oLink = document.createElement('a');
			oLink.style.cssText = 'position:absolute;width:605px;height:600px;left:0;top:0;cursor:pointer';
			oLink.href = oMaterial.tempBgLink;
			oLink.target = "_blank";
			oThemeWrap.appendChild(oLink);
			oLink.setAttribute('hideFocus', true);
		}

		// 带视频播放主题图
		if(oMaterial.type == 1 && oMaterial.video != ''){
			var aVideoPlayer = document.createElement('div');
			aVideoPlayer.style.cssText = 'position:absolute;overflow:hidden;width:'+oMaterial.videoWd+'px;height:'+oMaterial.videoHt+'px;top:'+oMaterial.videoTop+'px;left:'+oMaterial.videoLeft+'px';
			aVideoPlayer.innerHTML = '<embed width="' + oMaterial.videoWd + '" height="' + oMaterial.videoHt + '" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" src="' + oMaterial.video + '" allowScriptAccess="always" />';
			oThemeWrap.appendChild(aVideoPlayer);
		}

		function _fImgLoader(imgSrc, fSuccCallBack, fErrorCallBack, nTimeout){
			window.bImgLoaderIsLoaded = false;
			var oImg = document.createElement('IMG');
			if(fSuccCallBack){
				oImg.onload = function(){
					fSuccCallBack();
					window.bImgLoaderIsLoaded = true;
				};
			}
			if(fErrorCallBack){
				oImg.onerror = function(){
					fErrorCallBack();
				};
			}
			var nTime = 0;
			if(nTimeout){
				nTime = nTimeout;
			}
			setTimeout(function(){
				oImg.src = imgSrc;
			}, nTime);
		}
	}

	function fShowNext(n){
		var me = this;
		n = n || 1;
		me._currIndex += n;

		if(me._currIndex < 0){
			me._currIndex = me._data.materials.length - 1;
		}else if(me._currIndex >= me._data.materials.length){
			me._currIndex = 0;
		}

		me.showThemes(me._data.materials[me._currIndex]);
	}

	function fShowPrev(){
		this.showNext(-1);
	}

	/**
	 * 主题图广告展现统计
	 * @param  {String} sLink 展示统计链接url
	 */
	function fThemeShowLog(sLink){
		var oImg = document.getElementById("AD__IMG");
		if(!oImg){
			oImg = document.createElement("IMG");
			oImg.id = 'AD__IMG';
			oImg.width = "1px";
			oImg.height = "1px";
			oImg.style.position = 'absolute';
			oImg.style.left = '-100px';
			oImg.style.top = '-100px';
			document.body.appendChild(oImg);
		}
		oImg.src = sLink + '&rnd=' + Math.random();
	}

	/**
	 * 首页评分
	 * @return {Object} 首页评分方法对象
	 */
	function fScoreIndex(){
		var o = {
			 open : fScoreIndexOpen
			,close : fScoreIndexClose
		};

		function fScoreIndexOpen(){
			if(oScoreIndex){
				fResize();
				$id('mask').style.display = 'block';
				$id('scoreIndexPop').style.display = 'block';
				$id('scoreIndexPopIfm').src = '/scoreindex.htm';
			}else{
				return;
			}
		}

		function fScoreIndexClose(){
			$id('mask').style.display = 'none';
			$id('scoreIndexPop').style.display = 'none';
		}

		return o;
	}
})(window);

/**
 * 添加删除classname
 * @param  {Object} o     修改对象dom元素
 * @param  {String} sCls  classname
 * @param  {String} sFunc 修改classname方式：add/remove
 */
function fCls(o, sCls, sFunc){
	var oTar = o;
	var nRes = oTar.className.indexOf(sCls);
	if(sFunc == 'add'){
		if(nRes == -1){
			oTar.className = oTar.className + ' ' + sCls;
		}else{
			return;
		}
	}
	if(sFunc == 'remove'){
		if(nRes != -1){
			var sCls = '\\s' + sCls
			var rCls = new RegExp(sCls, 'g');
			oTar.className = oTar.className.replace(rCls, '');
		}else{
			return;
		}
	}
}

/**
 * 测速+定位服务
 */
//电信t:0,联通c:1,教育网e:2
var oSpdTestPosition = {
	 gz : ['gzt', 'gzc', 'gze']
	,hz : ['hz']
	,bj : ['t', 'c', 'e']
};
var aSpdResult = [-2,-2,-2,'db'],
	aSpdStartTime = [],
	aSpdEndTime = [],
	aSpdTmpTime = [],
	aSpdQueue = ['t','c','e'];
var bSpdAuto = true;
var sLocationInfo = 'failed';
var fSpeedTestPre = function(sArea){
	var nSpdRndPosition = Math.random() * 100;
	// 默认机率
	aSpdQueue = oSpdTestPosition.gz;
	aSpdResult[3] = 'gz';
	if(nSpdRndPosition <= 33){
		aSpdQueue = oSpdTestPosition.hz;
		aSpdResult[3] = 'hz';
	}
	if(nSpdRndPosition >33 && nSpdRndPosition <= 66){
		aSpdQueue = oSpdTestPosition.bj;
		aSpdResult[3] = 'bj';
	}

	if(sArea){
		aSpdQueue = oSpdTestPosition[sArea];
		aSpdResult[3] = sArea;
	}
	try{
		for(i=0;i<aSpdQueue.length;i++){
			var sLoca = aSpdQueue[i];
			fGetScript('http://'+ sLoca +'p.127.net/cte/' + sLoca + 'test?' + (new Date()).getTime());
		}
	}catch(e){
		fNetErrDebug('ErrfSpeedTestPre');
	}
};
var fSpeedTest = function(nCount){
	try{
		var nRnd;
		if(bSpdAuto){
			fNetErrDebug('fSpeedTest' + nCount);
			aSpdStartTime[nCount] = (new Date()).getTime();
			nRnd = aSpdStartTime[nCount];
		}else{
			aSpdStartTimeUser[nCount] = (new Date()).getTime();
			nRnd = aSpdStartTimeUser[nCount];
		}
		var sLoca = aSpdQueue[nCount];
		fGetScript('http://'+ sLoca +'p.127.net/cte/' + sLoca +'p?' + nRnd);
		if(bSpdAuto){
			aSpdResult[nCount] = -1;
		}
	}catch(e){
		fNetErrDebug('ErrfSpeedTest' + nCount);
	}
};
var fSpd = function(nCount){
	try{
		if(bSpdAuto){
			fNetErrDebug('Spd' + nCount);
			aSpdEndTime[nCount] = (new Date()).getTime();
			aSpdResult[nCount] = aSpdEndTime[nCount] - aSpdStartTime[nCount];
		}else{
			aSpdEndTimeUser[nCount] = (new Date()).getTime();
			aSpdResultUser[nCount] = aSpdEndTimeUser[nCount] - aSpdStartTimeUser[nCount];
			var sIdTmp = 'locationTest';
			var oTar = $id(sIdTmp + nCount);
			var nResult = Number(aSpdResultUser[nCount]);
			/*if(nResult < 100){
				oTar.style.color = "green";
			}else if(nResult < 300 && nResult > 100 ){
				oTar.style.color = "#ff7200";
			}else{
				oTar.style.color = "red";
			}*/
			oTar.innerHTML = '<span class="fontWeight">' + nResult + '</span>ms';
		}
	}catch(e){
		fNetErrDebug('ErrSpd' + nCount);
	}
};

//locationDot
var fLocationDot = function(nCount){
	var sId = 'locationDot';
	var oTar = $id(sId + nCount);
	return setInterval(
		function(){
			if(oTar.innerHTML == '...'){
				oTar.innerHTML = '';
			}else{
				oTar.innerHTML += '.';
			}
		},200);
}

//测速弹框
var aLocationDot = [];
var fSelectLoaction = function(sFunc){
	var oDiv = $id('locationTest');
	var oExt = $id('loginExt');
	if(sFunc == 'show'){
		oDiv.style.display = 'block';
		var sIdTmp = 'locationTest';
		for( var i=0 ; i<=2 ; i++){
			$id(sIdTmp + i).innerHTML = '测速中<span id="locationDot'+ i +'"></span>';
			//$id('locationBest' + i).style.display = 'none';
			aLocationDot[i] = fLocationDot(i);
		}
		fSpdUserInit();
		fSpeedTestPre('bj');
		window.oSelectLoaction = setInterval(
			function(){
				var nBest = 4;
				aSpdResultUser[nBest] = 999;
				for( var i=0 ; i<=2 ; i++){
					clearInterval(aLocationDot[i]);
					var sTxt = $id(sIdTmp + i).innerHTML;
					if( sTxt.match('测速中') ){
						$id(sIdTmp + i).style.color = '#999';
						$id(sIdTmp + i).innerHTML = '超时';
					}
					if(aSpdResultUser[i] != -1){
						if(aSpdResultUser[nBest] > aSpdResultUser[i]){
							nBest = i;
						}
					}
				}
				if( nBest !=4 ){
					$id('locationTest' + nBest).style.color = '#22ac38';
				}
				clearInterval(oSelectLoaction);
			},1000)
	}else{
		clearInterval(oSelectLoaction);
		for( var i=0 ; i<=2 ; i++){
			clearInterval(aLocationDot[i]);
		}
		oDiv.style.display = 'none';
	}
},
fSpdUserInit = function(){
	bSpdAuto = false;
	window.aSpdResultUser = [-1,-1,-1];
	window.aSpdStartTimeUser = [];
	window.aSpdEndTimeUser = [];
	window.aSpdResult = [-3,-3,-3,'db'];
	var sIdTmp = 'locationTest';
	for( var i=0 ; i<=2 ; i++){
		$id(sIdTmp + i).style.color = '#848585';
	}
},
fLocationChoose = function(sOperator){
	clearInterval(oSelectLoaction);
	for( var i=0 ; i<=2 ; i++){
		clearInterval(aLocationDot[i]);
		$id('locationHref' + i).className = $id('locationHref' + i).className.replace(/\sservSelected/g, '');
	}
	$id('selectLocationTips').style.display = 'none';
	$id('selectLocationTipsDone').style.display = 'inline';
	$id('locationTest').style.display = 'none';
	var oOperators = {
		t : '电信',
		c : '联通',
		e : '教育网'
	};
	var sTmpSelect = 0;
	for( j in oOperators ){
		if( j == sOperator ){
			$id('locationHref' + sTmpSelect).className += ' servSelected';
			break;
		}
		sTmpSelect++;
	}
	$id('selectLocation').innerHTML = oOperators[sOperator];
	sLocationInfo = sOperator;
},
fSetLocation = function(data){
	var tmpData = '';
	var aData = data.split('&');
	for(var i = 0; i < aData.length; i++){
		var aParam = aData[i].split('=');
		if(aParam.length >= 2){
			if(aParam[0] == 'net'){
				tmpData = aParam[1];
				break;
			}
		}
	}
	if(tmpData == ''){
		sLocationInfo = 'err';
	}else{
		sLocationInfo = tmpData;
	}
	//使用此服务用户阀值
	var nPct = 100;// 0 - 100
	var rnd = Math.random()*100;
	if(rnd < nPct){
		fNetErrDebug('rnd' + ((rnd + '').split('.'))[0]);
		fSpeedTestPre();
	}else{
		bSpdAuto = false;
	}
};

function fNetErrDebug(sStep){
	try{
		if(sLocationInfo.match('err') != null){
			var sFlow = '-' + sStep;
			aSpdResult[3] += sFlow;
		}
	}
	catch(e){}
}

window.onload = function(){
	indexLogin.init();
	themeHandler.init();
	// fq统计
	fFQ();
	//启动定位访问
	fGetScript('http://iplocator.mail.163.com/iplocator?callback=fGetLocator');
	// 推广更新后台
	loginExtAD.init();
	// piwik 输出1%的日志
	if(fRandom(100) <= 1){
		var pkBaseURL = "http://pstat.mail.163.com/";
		fGetScript(pkBaseURL + 'piwik.js', function(){
			try{
				var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
				piwikTracker.trackPageView();
				piwikTracker.enableLinkTracking();
			}catch(err){}
		});
	}
};

// 设置内容垂直居中
indexLogin.vericalAlignBody();
fEventListen(window, 'resize', fResize);
fEventListen(window, 'resize', function(){
	indexLogin.vericalAlignBody();
	fCls(document.body, 'move', 'add');
});
</script>

	<script type="text/javascript">
(function(){window.gAdTemplate_lbp={parse:function(oDatas){try{var oData=this.getData(oDatas.userProperty,JSON.parse(oDatas.dataContext));}catch(e){var oData=this.getData(oDatas.userProperty,eval("("+oDatas.dataContext+")"));
}return oData;}};})();(function(){var d={FlowLimitType:{TOTAL_AMOUNT_LIMIT:1,DAILY_AMOUNT_LIMIT:2,TOTAL_EFFECT_LIMIT:3},Priority:{HIGHEST:0,NONE:8888,LOWEST:9999},MailRegTime:{IGNORE:-1,LATEST_30DAY:0,LATEST__60DAY:1,LATEST_180DAY:2},MailLiveness:{IGNORE:-1,LATEST_7DAY:0,LATEST__14DAY:1,LATEST_30DAY:2},WapUserType:{IGNORE:-1,ALL:"0",IPHONE:1,IPAD:2,ANDROID:3,OTHER_MOBILE:4},BrowserType:{IGNORE:-1,HIGH:0,LOW:1},Version:{JS5:0,JS6:1},Sex:{IGNORE:-1,UNKNOW:0,MALE:1,FEMALE:2}};
function h(o){if(o==null){return true;}return o.mailRegTime==d.MailRegTime.IGNORE&&o.mailLiveness==d.MailLiveness.IGNORE&&o.wapUserType==""&&o.browserType==d.BrowserType.IGNORE&&o.usedProdIds==""&&o.unusedProdIds==""&&o.interest==""&&o.lotteryType==""&&o.game==""&&o.bobo==""&&o.sex==""&&o.gameQnyh2==""&&o.gameWync==""&&o.gameWh==""&&o.gameDtws2==""&&o.gameTx3==""&&o.gameYxsg==""&&o.consumeLevel==""&&o.gameXdhxy2==""&&o.gameDhwzxp==""&&o.gameZgmh==""&&o.gameDhxy3Free==""&&o.gameMhxy==""&&o.gameDhxy3Clsc==""&&o.industry==""&&o.career==""&&o.loginCompany==""&&o.gameYzr==""&&o.emailUsage=="";
}var n=1;var c=1;window.gAdTemplate_lbp.getData=function(s,p){var o={};o.ver=c;var q=l(s,p._163LbpAdUnitsList,p._163LbpAnchorAdUnitsList,p._126LbpAdUnitsList,p._126LbpAnchorAdUnitsList,p._yeahLbpAdUnitsList,p._yeahLbpAnchorAdUnitsList,p._emailLbpAdUnitsList,p._emailLbpAnchorAdUnitsList);
if(q==null){return o;}var r={};r.pid=q.pid;r.material=b(s.mailVer,s.ver,s.uid,q.data);o.lbp=r;return o;};function l(A,w,p,r,D,F,o,C,u){var E={};var z=[];
var y=[];var q=""+A.domain;if(q=="163.com"){z=w;y=p;}else{if(q=="126.com"){z=r;y=D;}else{if(q=="yeah.net"){z=F;y=o;}else{if(q=="email.com"){z=C;y=u;}else{z=w;
y=p;}}}}var v=e(z,A);var s=y;if(v.length==0){if(s.length==0){return null;}else{E.pid=0;E.data=s;}}else{var t=v[0];for(var G in z){var B=z[G];if(B.taskLogic.number!=t.taskLogic.number){s=m(s,B);
}}var x=k(s,t);E.pid=x.pid;E.data=x.data;}return E;}function k(p,q){var s=[];var w=false;var u=0;var r=q.taskLogic.number;var t=0;for(;t<p.length;t++){var v=p[t];
if(v.taskLogic.number>=r){s.push(q);s=s.concat(p.slice(t));w=true;u=t;break;}else{s.push(v);}}if(!w){s.push(q);}var o={};o.pid=t;o.data=s;return o;}function m(s,p){var o=false;
for(var r=0;r<s.length;r++){if(s[r].taskLogic.number>=p.taskLogic.number){for(var q=s.length;q>r;q--){s[q]=s[q-1];}s[r]=p;o=true;break;}}if(!o){s.push(p);
}return s;}function g(q,r){var s=[];if(q==null||q.length==0){return s;}for(var p in q){var o=q[p];if(i(o.customConfig.taskCustProductProperty,r)){s.push(o);
}}return s;}function e(p,q){var r=[];var o=j(p,q);if(o==null){return r;}r.push(o);return r;}function b(q,t,s,w){var u=[];if(w==null||w.length==0){return u;
}for(var v in w){var r=w[v];var x=r.ad;var p=r.taskLogic;var o={};o.uid=""+s;o.openUrl=x.openCountUrl+"&rnd="+((new Date()).valueOf());if(x.promResType==4){o.type=2;
}else{if(x.flashTag==1){o.type=1;}else{o.type=0;}}o.flag=x.flag;o.bgColor=x.bgColor;o.bgCnt=x.promPicUrl;o.bgSrc=x.bgPicUrl;if(x.ursTag==0){o.needUrs=false;
}else{o.needUrs=true;}if(x.clickCountTag==0){o.bInitLink=true;o.bgLink=x.promPicClickUrl;}else{o.bInitLink=false;o.bgLink=x.promPicClickCountUrl;}if(x.showCountTag==0){o.bInitShowLink=true;
o.showLink=x.thirdpartyShowCountUrl;}else{o.bInitShowLink=false;o.showLink=x.openCountUrl;}if(x.bgMusicTag==1&&x.taskMusic!=null){o.musicLink=x.taskMusic.musicUrl;
}if(x.flashTag==1&&x.taskFlash!=null){o.video=x.taskFlash.flashUrl;o.videoWd=x.taskFlash.width;o.videoHt=x.taskFlash.height;o.videoTop=x.taskFlash.positionY;
o.videoLeft=x.taskFlash.positionX;}if(x.promResType==4){o.iframeUrl=x.iframeUrl;}o.name=x.name;u.push(o);}return u;}function j(w,C){if(w.length==1){return w[0];
}var o=[];var B=[];var q=[];var s=[];var v=[];var A=100;for(var z in w){var p=w[z];if(p.taskLogic.priority==d.Priority.LOWEST){v.push(p);continue;}if(p.taskLogic.priority==d.Priority.NONE){if(!h(p.customConfig.taskCustProductProperty)){q.push(p);
continue;}else{if(p.taskLogic.flowLimitType==d.FlowLimitType.TOTAL_EFFECT_LIMIT||p.taskLogic.flowLimitType==d.FlowLimitType.TOTAL_AMOUNT_LIMIT){s.push(p);
continue;}if(p.taskLogic.pvLimit!=0||p.taskLogic.uvLimit!=0){s.push(p);continue;}}B.push(p);continue;}if(h(p.customConfig.taskCustProductProperty)){if(p.taskLogic.flowLimitType==d.FlowLimitType.TOTAL_EFFECT_LIMIT||p.taskLogic.flowLimitType==d.FlowLimitType.TOTAL_AMOUNT_LIMIT){if(o.length>0){o.push(p);
continue;}else{return p;}}if(p.taskLogic.pvLimit!=0||p.taskLogic.uvLimit!=0){if(o.length>0){o.push(p);continue;}else{return p;}}if(p.taskLogic.idleFlowPercent>0){o.push(p);
continue;}if(o.length>0){o.push(p);continue;}else{var u=Math.max(p.taskLogic.totalFlowPercent,p.taskLogic.idleFlowPercent);if(u>0){if(A<=u){return p;}if(Math.floor(Math.random()*A)<u){return p;
}else{A-=u;}}}}else{if(i(p.customConfig.taskCustProductProperty,C)){return p;}}}if(o.length!=0){for(var z in o){var y=o[z];if(y.taskLogic.pvLimit!=0||y.taskLogic.uvLimit!=0){return y;
}var u=Math.max(y.taskLogic.idleFlowPercent,y.taskLogic.totalFlowPercent);if(A<=u){return y;}if(Math.floor(Math.random()*A)<u){return y;}else{A-=u;}}}if(q.length>0){var t=f(q,s,C);
if(t!=null){return t;}else{B=B.concat(s);}}else{B=B.concat(s);}if(B.length>0){var x=a(A,B);if(x!=null){return x;}}var r=v.length;if(r==0){return null;}else{if(r==1){return v[0];
}else{return v[Math.floor(Math.random()*r)];}}return null;}function f(t,r,v){if(t.length==0){return null;}var u=false;var s=[];for(var q in t){var p=t[q];
if(!h(p.customConfig.taskCustProductProperty)){if(i(p.customConfig.taskCustProductProperty,v)){u=true;s.push(p);}}}if(u){s=s.concat(r);var o=s.length;if(o==1){return s[0];
}if(o>1){return s[Math.floor(Math.random()*o)];}}else{}return null;}function a(x,u){if(u.length==0){return null;}var s=[];var r=[];var t=u.length;var q=x/t;
for(var w in u){var p=u[w];if(p.taskLogic.flowLimitType==d.FlowLimitType.TOTAL_EFFECT_LIMIT||p.taskLogic.flowLimitType==d.FlowLimitType.TOTAL_AMOUNT_LIMIT){r.push(p);
continue;}if(p.taskLogic.totalFlowPercent==0&&p.taskLogic.idleFlowPercent==0){r.push(p);continue;}if(Math.max(p.taskLogic.totalFlowPercent,p.taskLogic.idleFlowPercent)>q){r.push(p);
continue;}s.push(p);}if(s.length!=0){for(var w in s){var o=s[w];var v=Math.max(o.taskLogic.totalFlowPercent,o.taskLogic.idleFlowPercent);if(v>0){if(x<=v){return o;
}if(Math.floor(Math.random()*x)<v){return o;}else{x-=v;}}}return a(x,r);}else{return r[Math.floor(Math.random()*r.length)];}}function i(p,y){if(p.mailRegTime!=d.MailRegTime.IGNORE&&p.mailRegTime!=y.mailRegTime){return false;
}if(p.mailLiveness!=d.MailLiveness.IGNORE&&p.mailLiveness!=y.mailLiveness){return false;}if(p.usedProdIds!=""){var L=p.usedProdIds.split(",");for(var G=0;
G<L.length;++G){if(y.usedProdIds.indexOf(L[G])==-1){return false;}}}if(p.unusedProdIds!=""){var L=p.unusedProdIds.split(",");for(var G=0;G<L.length;++G){if(y.unusedProdIds.indexOf(L[G])==-1){return false;
}}}if(p.wapType!=-1){if((y.wapUserType&p.wapType)==0){return false;}}if(p.browserType!=d.BrowserType.IGNORE&&p.browserType!=y.browserType){return false;
}if(p.interest1!=0||p.interest2!=0||p.interest3!=0){var t=false;if(p.interest1!=0&&((p.interest1&y.interest1)!=0)){t=true;}if(p.interest2!=0&&((p.interest2&y.interest2)!=0)){t=true;
}if(p.interest3!=0&&((p.interest3&y.interest3)!=0)){t=true;}if(!t){return false;}}if(p.lotteryType!=""){if(p.lotteryType.indexOf(y.lotteryType+"")==-1){return false;
}}if(p.game1!=0){var I=false;if((p.game1&y.games)!=0){I=true;}if(!I){return false;}}var x=false;if(p.bobo1!=0){if((p.bobo1&y.bobos)!=0){x=true;}}if(!x){if(p.boboSelf>0&&(p.boboSelf!=y.boboSelf)){x=false;
}else{x=true;}}if(p.bobo1!=0||p.boboSelf>0){if(!x){return false;}}if(p.sex!=""){if(p.sex.indexOf(y.sex+"")==-1){return false;}}if(p.gameQnyh21!=0){var F=false;
if((p.gameQnyh21&y.gameQnyh2s)!=0){F=true;}if(!F){return false;}}if(p.gameWync1!=0){var r=false;if((p.gameWync1&y.gameWyncs)!=0){r=true;}if(!r){return false;
}}if(p.gameWh1!=0){var A=false;if((p.gameWh1&y.gameWhs)!=0){A=true;}if(!A){return false;}}if(p.gameDtws21!=0){var o=false;if((p.gameDtws21&y.gameDtws2s)!=0){o=true;
}if(!o){return false;}}if(p.gameTx31!=0){var J=false;if((p.gameTx31&y.gameTx3s)!=0){J=true;}if(!J){return false;}}if(p.gameYxsg1!=0){var z=false;if((p.gameYxsg1&y.gameYxsgs)!=0){z=true;
}if(!z){return false;}}if(p.consumeLevel!=""){var B=","+p.consumeLevel+",";if(B.indexOf(","+y.consumeLevel+",")==-1){return false;}}if(p.gameXdhxy21!=0){var H=false;
if((p.gameXdhxy21&y.gameXdhxy2s)!=0){H=true;}if(!H){return false;}}if(p.gameDhwzxp1!=0){var s=false;if((p.gameDhwzxp1&y.gameDhwzxps)!=0){s=true;}if(!s){return false;
}}if(p.gameZgmh1!=0){var K=false;if((p.gameZgmh1&y.gameZgmhs)!=0){K=true;}if(!K){return false;}}if(p.gameDhxy3Free1!=0){var M=false;if((p.gameDhxy3Free1&y.gameDhxy3Frees)!=0){M=true;
}if(!M){return false;}}if(p.gameMhxy1!=0){var D=false;if((p.gameMhxy1&y.gameMhxys)!=0){D=true;}if(!D){return false;}}if(p.gameDhxy3Clsc1!=0){var C=false;
if((p.gameDhxy3Clsc1&y.gameDhxy3Clscs)!=0){C=true;}if(!C){return false;}}if(p.gameYzr1!=0){var w=false;if((p.gameYzr1&y.gameYzrs)!=0){w=true;}if(!w){return false;
}}if(p.industry!=""){var u=","+p.industry+",";if(u.indexOf(","+y.industry+",")==-1){if(p.loginCompany1!=0){var q=false;if((p.loginCompany1&y.loginCompany)!=0){q=true;
}if(!q){return false;}}else{return false;}}}if(p.career!=""){var E=","+p.career+",";if(E.indexOf(","+y.career+",")==-1){return false;}}if(p.emailUsage1!=0){var v=false;
if((p.emailUsage1&y.emailUsages)!=0){v=true;}if(!v){return false;}}return true;}})();
</script>


	<!-- 预加载极速js -->
	<iframe src="http://mail.163.com/preload6.htm" style="display: none"
		id="frmJs6"></iframe>

	<!--ssl链接预加载-->
	<img src="https://ssl.mail.163.com/httpsEnable.gif" width="0"
		height="0" style="display: block;" alt="https preload"
		onerror="javascript:window.bHTTPSDisabled=true">

	<!-- Piwik -->
	<noscript>&lt;p&gt;&lt;img
		src="http://pstat.mail.163.com/piwik.php?idsite=16" style="border:0"
		alt="" /&gt;&lt;/p&gt;</noscript>
	<!-- End Piwik Tracking Code -->

	<!--反垃圾-->
	<a href="http://uinfo.mail.163.com/cgi-bin/hseed/two.pl"></a>

	<script type="text/javascript"
		src="http://ir3.mail.163.com/get.do?prod=wmail_lbp&amp;ver=1&amp;uid=chenfw0923@163.com&amp;domain=163.com&amp;mobUser=0&amp;callback=themeHandler.callback&amp;rnd=0.4755952733103186"
		defer="defer"></script>
	<script type="text/javascript"
		src="http://iplocator.mail.163.com/iplocator?callback=fGetLocator"
		defer="defer"></script>
	<script type="text/javascript"
		src="http://ir.mail.163.com/get.do?uid=chenfw0923@163.com&amp;domain=163.com&amp;ver=4&amp;ph=-1&amp;callback=loginExtAD.callback&amp;rnd=0.4952840586192906"
		defer="defer"></script>
	<script type="text/javascript"
		src="http://gztp.127.net/cte/gzttest?1413176774472" defer="defer"></script>
	<script type="text/javascript"
		src="http://gzcp.127.net/cte/gzctest?1413176774472" defer="defer"></script>
	<script type="text/javascript"
		src="http://gzep.127.net/cte/gzetest?1413176774473" defer="defer"></script>
	<script type="text/javascript"
		src="http://mimg.127.net/m/ir/8/bLoginTpl.js" defer="defer"></script>
	<img id="AD__IMG" width="0" height="0"
		src="http://irpmt.mail.163.com/ir/stat.gif?statId=1_16_5_20&amp;uid=chenfw0923@163.com&amp;rnd=0.025518302572891116"
		style="position: absolute; left: -100px; top: -100px;">
	<script type="text/javascript"
		src="http://gztp.127.net/cte/gztp?1413176774587" defer="defer"></script>
	<script type="text/javascript"
		src="http://gzep.127.net/cte/gzep?1413176774595" defer="defer"></script>
	<script type="text/javascript"
		src="http://gzcp.127.net/cte/gzcp?1413176774625" defer="defer"></script>
	<script type="text/javascript"
		src="http://mimg.127.net/index/lib/scripts/dynamicpassword.js"
		defer="defer"></script>
</body>
</html>
