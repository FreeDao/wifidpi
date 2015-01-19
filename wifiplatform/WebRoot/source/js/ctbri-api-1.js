//API
function callback(result) {
	;
};
var API = function() {

	return {

		head : function() {
			var head = {
				"Api-Version" : "1.0",
				"Client-OS" : "3",
				"Client-Type" : "3",
				"Nonce" : Math.floor(10000000 + Math.random() * (89999999)),
				"Sign-Method" : "HMAC-SHA1",
				"TimeStamp" : new Date().getTime(),
			};
			return head;
		},
		sign : function(source) {
			return CryptoJS.HmacSHA1(source,
					"h2Yrr0tVrgPSw1AI8hwjpoh6KqSRfxWK&");
		},
		getRequestValue : function(key) {
			var url = window.location.search.substring(1);
			var par = url.split('&');
			for (i = 0; i < par.length; i++) {
				var code = par[i].split('=');
				if (key == code[0])
					return code[1];
			}
			return false;
		},
		captcha : function(e) {
			try {
				var reg = /^1[34578][0-9]\d{8}$/;
				if (!reg.test($('#mobile').val())) {
					alert("手机号码格式不正确");
					e.removeAttribute("disabled");
					return;
				}
				var h = API.head();
				var data = 'mobile=' + $('#mobile').val() + "&" + 'use_type=3'
						+ '&z=' + new Date().getTime();
				$.ajax({
					type : 'GET',
					url : 'getcaptcha',
					data : data,
					dataType : "json",
					success : function(response) {
						if (response.ret == '0') {
							time(e);
						} else {
							alert(response.desp);
							e.removeAttribute("disabled");
						}
					},
					error : function(response) {
						alert("请求错误，请稍后再试。");
						e.removeAttribute("disabled");
					}
				});
			} catch (ex) {
				alert("浏览器发生错误，请重启浏览器。");
				// location.href = "http://www.baidu.com";
			}
		},
		onValidatorOption : function(e) {
			var h = API.head();
			try {
				$
						.ajax({
							url : 'http://42.123.76.19/auth/login',
							type : 'GET',
							headers : h,
							dataType : "jsonp",
							jsonpCallback : "callback",
							jsonp : "callback",// 传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
							data : {
								mac : API.getRequestValue('client_mac')
										.replace(/:/g, "").toUpperCase(),
								auth_type : 'option',
								dev_id : API.getRequestValue('dev_id'),
								browser_type : "",
								terminal_type : "",
								gw_address : API.getRequestValue('gw_address'),
								gw_port : API.getRequestValue('gw_port')
							},
							success : function(data) {
								if (data.result == 'OK') {

									if (!API.getRequestValue('gw_address')
											|| API
													.getRequestValue('gw_address') == '') {
										location = 'http://'
												+ location.hostname + ':'
												+ location.port
												+ '/api10/portal/?'
												+ location.search.substr(1);
									} else {
										if (data.auth_url) {
											location = data.auth_url;
										} else {
											location = 'http://'
													+ API
															.getRequestValue('gw_address')
													+ ':'
													+ API
															.getRequestValue('gw_port')
													+ '/smartwifi/auth?token='
													+ data.token
													+ '&url='
													+ encodeURIComponent(API
															.getRequestValue('url'));
										}
									}
								} else {
									alert('用户验证失败，请重新验证');
								}
							},
							error : function(data) {
								alert('用户验证失败，请重新验证');
							}

						});
			} catch (ex) {
				alert("浏览器发生错误，请重启浏览器。");
				// location.href = "http://www.baidu.com";
			}
		},

		signIn : function(e) {
			try {
				var data = "ap_address=" + API.getRequestValue('gw_address')
						+ "&ap_mac="
						+ API.getRequestValue('gw_id').replace(/:/gm, '')
						+ "&captcha=" + $('#captcha').val() + "&client_mac="
						+ API.getRequestValue('mac').replace(/:/gm, '') + "&gw_port="
						+ API.getRequestValue('gw_port') + "&mobile="
						+ $('#mobile').val() + "&user_ip="
						+ API.getRequestValue('public_ip');
				$
						.ajax({
							type : 'GET',
							url : 'loginin',
							dataType : "json",
							data : data,
							success : function(response) {
								if (response.ret == '0') {
									var auth_url = response.data.auth_url;
									location.href = auth_url;
								} else {
									alert(response.desp);
									e.removeAttribute("disabled");
								}
							},
							error : function(response) {
								alert("请求错误，请稍后再试。");
								location.href = "http://www.baidu.com";
							}
						});
			} catch (ex) {
				alert("浏览器发生错误，请重启浏览器。");
				location.href = "http://www.baidu.com";
			}
		},

	};

}();