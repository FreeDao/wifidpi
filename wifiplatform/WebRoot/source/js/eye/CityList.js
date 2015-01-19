var BMapLib = window.BMapLib = BMapLib || {};

(function() {

	var baidu = baidu || {
		guid : "$BAIDU$"
	};
	(function() {

		window[baidu.guid] = {};

		/**
		 * 
		 * @name baidu.extend
		 * @function
		 * @grammar baidu.extend(target, source)
		 * @param {Object}
		 *            target
		 * @param {Object}
		 *            source
		 * @returns {Object}
		 */
		baidu.extend = function(target, source) {
			for ( var p in source) {
				if (source.hasOwnProperty(p)) {
					target[p] = source[p];
				}
			}
			return target;
		};

		/**
		 * @ignore
		 * @namespace
		 * @baidu.lang
		 * @property guid
		 */
		baidu.lang = baidu.lang || {};

		/**
		 * 
		 * @function
		 * @grammar baidu.lang.guid()
		 * @returns {String}
		 */
		baidu.lang.guid = function() {
			return "TANGRAM__" + (window[baidu.guid]._counter++).toString(36);
		};

		window[baidu.guid]._counter = window[baidu.guid]._counter || 1;

		window[baidu.guid]._instances = window[baidu.guid]._instances || {};

		baidu.lang.Class = function(guid) {
			this.guid = guid || baidu.lang.guid();
			window[baidu.guid]._instances[this.guid] = this;
		};

		window[baidu.guid]._instances = window[baidu.guid]._instances || {};

		baidu.lang.isString = function(source) {
			return '[object String]' == Object.prototype.toString.call(source);
		};

		baidu.lang.isFunction = function(source) {
			return '[object Function]' == Object.prototype.toString
					.call(source);
		};

		baidu.lang.Class.prototype.toString = function() {
			return "[object " + (this._className || "Object") + "]";
		};

		baidu.lang.Event = function(type, target) {
			this.type = type;
			this.returnValue = true;
			this.target = target || null;
			this.currentTarget = null;
		};

		baidu.lang.Class.prototype.addEventListener = function(type, handler,
				key) {
			if (!baidu.lang.isFunction(handler)) {
				return;
			}
			!this.__listeners && (this.__listeners = {});
			var t = this.__listeners, id;
			if (typeof key == "string" && key) {
				if (/[^\w\-]/.test(key)) {
					throw ("nonstandard key:" + key);
				} else {
					handler.hashCode = key;
					id = key;
				}
			}
			type.indexOf("on") != 0 && (type = "on" + type);
			typeof t[type] != "object" && (t[type] = {});
			id = id || baidu.lang.guid();
			handler.hashCode = id;
			t[type][id] = handler;
		};

		baidu.lang.Class.prototype.removeEventListener = function(type, handler) {
			if (baidu.lang.isFunction(handler)) {
				handler = handler.hashCode;
			} else if (!baidu.lang.isString(handler)) {
				return;
			}
			!this.__listeners && (this.__listeners = {});
			type.indexOf("on") != 0 && (type = "on" + type);
			var t = this.__listeners;
			if (!t[type]) {
				return;
			}
			t[type][handler] && delete t[type][handler];
		};

		baidu.lang.Class.prototype.dispatchEvent = function(event, options) {
			if (baidu.lang.isString(event)) {
				event = new baidu.lang.Event(event);
			}
			!this.__listeners && (this.__listeners = {});
			options = options || {};
			for ( var i in options) {
				event[i] = options[i];
			}
			var i, t = this.__listeners, p = event.type;
			event.target = event.target || this;
			event.currentTarget = this;
			p.indexOf("on") != 0 && (p = "on" + p);
			baidu.lang.isFunction(this[p]) && this[p].apply(this, arguments);
			if (typeof t[p] == "object") {
				for (i in t[p]) {
					t[p][i].apply(this, arguments);
				}
			}
			return event.returnValue;
		};

		baidu.lang.inherits = function(subClass, superClass, className) {
			var key, proto, selfProps = subClass.prototype, clazz = new Function();
			clazz.prototype = superClass.prototype;
			proto = subClass.prototype = new clazz();
			for (key in selfProps) {
				proto[key] = selfProps[key];
			}
			subClass.prototype.constructor = subClass;
			subClass.superClass = superClass.prototype;

			if ("string" == typeof className) {
				proto._className = className;
			}
		};

		baidu.dom = baidu.dom || {};

		baidu.g = baidu.dom.g = function(id) {
			if ('string' == typeof id || id instanceof String) {
				return document.getElementById(id);
			} else if (id && id.nodeName
					&& (id.nodeType == 1 || id.nodeType == 9)) {
				return id;
			}
			return null;
		};

		baidu.browser = baidu.browser || {};

		if (/msie (\d+\.\d)/i.test(navigator.userAgent)) {

			baidu.browser.ie = baidu.ie = document.documentMode
					|| +RegExp['\x241'];
		}

		baidu.dom._NAME_ATTRS = (function() {
			var result = {
				'cellpadding' : 'cellPadding',
				'cellspacing' : 'cellSpacing',
				'colspan' : 'colSpan',
				'rowspan' : 'rowSpan',
				'valign' : 'vAlign',
				'usemap' : 'useMap',
				'frameborder' : 'frameBorder'
			};

			if (baidu.browser.ie < 8) {
				result['for'] = 'htmlFor';
				result['class'] = 'className';
			} else {
				result['htmlFor'] = 'for';
				result['className'] = 'class';
			}

			return result;
		})();

		baidu.getAttr = baidu.dom.getAttr = function(element, key) {
			element = baidu.dom.g(element);

			if ('style' == key) {
				return element.style.cssText;
			}

			key = baidu.dom._NAME_ATTRS[key] || key;
			return element.getAttribute(key);
		};

		baidu.event = baidu.event || {};

		baidu.event._listeners = baidu.event._listeners || [];

		baidu.on = baidu.event.on = function(element, type, listener) {
			type = type.replace(/^on/i, '');
			element = baidu.g(element);
			var realListener = function(ev) {
				// 1. 杩欓噷涓嶆敮鎸丒ventArgument, 鍘熷洜鏄法frame鐨勪簨浠舵寕杞�
				// 2. element鏄负浜嗕慨姝his
				listener.call(element, ev);
			}, lis = baidu.event._listeners, filter = baidu.event._eventFilter, afterFilter, realType = type;
			type = type.toLowerCase();
			// filter杩囨护
			if (filter && filter[type]) {
				afterFilter = filter[type](element, type, realListener);
				realType = afterFilter.type;
				realListener = afterFilter.listener;
			}
			// 浜嬩欢鐩戝惉鍣ㄦ寕杞�
			if (element.addEventListener) {
				element.addEventListener(realType, realListener, false);
			} else if (element.attachEvent) {
				element.attachEvent('on' + realType, realListener);
			}

			// 灏嗙洃鍚櫒瀛樺偍鍒版暟缁勪腑
			lis[lis.length] = [ element, type, listener, realListener, realType ];
			return element;
		};
	})();

	var DataMgr = {

		request : function(url, cbk) {
			if (cbk) {
				// 鐢熸垚闅忔満鏁�
				var timeStamp = (Math.random() * 100000).toFixed(0);
				// 鍏ㄥ眬鍥炶皟鍑芥暟
				BMap["_rd"]["_cbk" + timeStamp] = function(json) {
					cbk && cbk(json);
					delete BMap["_rd"]["_cbk" + timeStamp];
				};
				url += "&callback=BMap._rd._cbk" + timeStamp;
			}

			var script = document.createElement('script');
			script.setAttribute('src', url);
			document.body.appendChild(script);
			// 鑴氭湰鍔犺浇瀹屾垚鍚庤繘琛岀Щ闄�
			if (script.addEventListener) {
				script.addEventListener('load', function(e) {
					var t = e.target;
					t.parentNode.removeChild(t);
				}, false);
			} else if (script.attachEvent) {
				script
						.attachEvent(
								'onreadystatechange',
								function(e) {
									var t = window.event.srcElement;
									if (t
											&& (t.readyState == 'loaded' || t.readyState == 'complete')) {
										t.parentNode.removeChild(t);
									}
								});
			}

			setTimeout(function() {
				document.getElementsByTagName('head')[0].appendChild(script);
				script = null;
			}, 1);
		}
	};

	var config = {
		serviceUrl : "http://api.map.baidu.com"
	}

	function geoToPoint(geo) {
		var projection = BMAP_NORMAL_MAP.getProjection();
		var point = null;
		geo = geo.split('|')[2];
		geo = geo.substr(0, geo.length - 1);
		geo = geo.split(',');
		var point = projection.pointToLngLat(new BMap.Pixel(geo[0], geo[1]));
		return point;
	}

	function coordinateToPoints(coordinate) {
		var projection = BMAP_NORMAL_MAP.getProjection();
		var points = [];
		coordinate = coordinate.split(';');
		for (var i = 0, len = coordinate.length; i < len; i++) {
			var pos = coordinate[i].split(',');
			var point = projection
					.pointToLngLat(new BMap.Pixel(pos[0], pos[1]));
			points.push(point);
		}
		return points;
	}

	/**
	 * @exports CityList as BMapLib.CityList
	 */
	var CityList =

	BMapLib.CityList = function(opts) {

		opts = opts || {};
		this.pv = null;
		this.fr = null;
		this.borDom = null
		this._opts = baidu.extend(baidu.extend(this._opts || {}, {

			container : null,

			map : null
		}), opts);

		this._data = null;

		this._init();

	}

	var pv = null;
	var borDom = null;
	var AreaUrl = config.serviceUrl
			+ "/shangquan/forward/?qt=sub_area_list&ext=1&level=1";
	var provinceDom = document.createElement('select'), cityDom = document
			.createElement('select'), boroughDom = document
			.createElement('select'), businessDom = document
			.createElement('select');
	var polygon = new BMap.Polygon();
	
	function selectArea(areacode, id, level, isbusiness) {
		selectArea.id = id;
		selectArea.level = level;
		selectArea.pv = pv;
		var t = new Date().getTime();
		var url = AreaUrl + "&areacode=" + areacode;
		if (isbusiness) {
			url += "&business_flag=1";
		} else {
			url += "&business_flag=0";
		}
		DataMgr.request(url, getAreaData);
	}
	
	function selectBorough(areacode, id, level) {
		selectArea.id = id;
		selectArea.level = level;
		selectArea.pv = pv;
		var t = new Date().getTime();
		var url = AreaUrl + "&areacode=" + areacode;
		url += "&business_flag=1";
		
		DataMgr.request(url, getBoroughData);
	}
	
	function selectArea_ex(areacode, id, level,city,province,isbusiness) {
		selectArea.id = id;
		selectArea.level = level;
		selectArea.city=city;
		selectArea.province=province;
		var t = new Date().getTime();
		var url = AreaUrl + "&areacode=" + areacode;
		if (isbusiness) {
			url += "&business_flag=1";
		} else {
			url += "&business_flag=0";
		}
		DataMgr.request(url, getAreaP);
	}

	function getBoroughData(data) {
		getAreaData(data);
		var innerHTML="";
		for (var i = 0, len = businessDom.options.length; i < len; i++) {
			if(businessDom.options[i].value ==""){
				continue;
				
			}
			
			innerHTML+="<a ";
			innerHTML+=" id=\'id_"+businessDom.options[i].value+"\'";
			innerHTML+=" href=\"javascript:business(\'"+businessDom.options[i].title+"\',\'"+businessDom.options[i].value+"\')\" class=\"w-filter-item  \"";
			innerHTML+="mon=\"element=1500&amp;element_type=filter\">"+businessDom.options[i].title +" <span ";
			innerHTML+=" class=\"filter-count\"></span></a>";
		}
		document.getElementById("j-sub-filter-list").innerHTML=innerHTML;
	}
	function getAreaP(data) {
		getAreaData(data);
		if (selectArea.province !=""){
			var s_value = 0;
			
			for (var i = 0, len = provinceDom.options.length; i < len; i++) {
				if (provinceDom.options[i].title == selectArea.province) {
					s_value = provinceDom.options[i].value;
					
				}
			}
			cityDom.innerHTML = boroughDom.innerHTML = businessDom.innerHTML = "";
			if (s_value == 131 || s_value == 289
					|| s_value == 332 || s_value == 132) {
				var cityName = ""
				switch (s_value) {
				case "131":
					cityName = "北京市";
					break;
				case "289":
					cityName = "上海市";
					break;
				case "332":
					cityName = "天津市";
					break;
				case "132":
					cityName = "重庆市";
					break;
				}
				var fragment = document
						.createDocumentFragment();
				var o;
				o = document.createElement("option");
				o.innerHTML = cityName;
				o.value = s_value;
				o.title = cityName;
				fragment.appendChild(o);
				cityDom.appendChild(fragment)

				selectArea_ex(s_value, boroughDom, 12,"","");
			} else {
				selectArea_ex(s_value, cityDom, 12,selectArea.city,"");
			}	
		} else if (selectArea.city !=""){
			var s_value = 0;
			for (var i = 0, len = cityDom.options.length; i < len; i++) {
				if (cityDom.options[i].title == selectArea.city) {
					s_value = cityDom.options[i].value;
				}
			}
			selectArea_ex(s_value, boroughDom, 12,"","");
		}else{
			document.getElementById("j-sub-filter-list").innerHTML="";
			var innerHTML="";
			for (var i = 0, len = boroughDom.options.length; i < len; i++) {
				if(boroughDom.options[i].value ==""){
					continue;
				}
				innerHTML+="<a ";
				innerHTML+=" id=\'id_"+boroughDom.options[i].value+"\'";
				innerHTML+=" href=\"javascript:borough(\'"+boroughDom.options[i].title+"\',\'"+boroughDom.options[i].value+"\')\" class=\"w-filter-item  \"";
				innerHTML+="mon=\"element=1500&amp;element_type=filter\">"+boroughDom.options[i].title +" <span ";
				innerHTML+=" class=\"filter-count\"></span></a>";
			}
			document.getElementById("j-district-item-wrap").innerHTML=innerHTML;
		}
		
		
	}
	
	function getAreaData(data) {
		var subList = "";
		if (data.content) {
			var c = data.content;
			var html = [];
			var geo = execGeo(c.geo);
			var mp = new BMap.MercatorProjection();
			var po = mp.pointToLngLat(new BMap.Pixel(geo.x, geo.y))
			if (data.content.area_code == 1) {
				var point = new BMap.Point(116.403119, 39.92069);
				map.centerAndZoom(point, 12);
			} else {
				var point = new BMap.Point(po.lng, po.lat);
				map.centerAndZoom(point, selectArea.level);
			}
			/* 娓叉煋鍩庡競 */
			if (data.content.sub) {
				subList = c.sub;
				subList.splice(0, 0, {
					area_name : '请选择',
					area_code : ''
				});
				var fragment = document.createDocumentFragment();
				var o;
				var citycode = {
					131 : 1,
					289 : 2,
					332 : 3,
					132 : 4
				};
				for (var i = 0; i < subList.length; i++) {
					subList[i].sort = subList[i].area_code ? citycode[subList[i].area_code] || 5
							: 0;
				}
				subList.sort(function(a, b) {
					return a.sort - b.sort;
				});
				for (var i = 0; i < subList.length; i++) {
					o = document.createElement("option");
					o.innerHTML = subList[i].area_name;
					o.area_type = subList[i].area_type;
					o.geo = subList[i].geo;
					if (subList[i].business_geo) {
						o.business_geo = subList[i].business_geo;
					}
					o.value = subList[i].area_code;
					o.title = subList[i].area_name;
					fragment.appendChild(o);
				}
				subList.shift();
				if (selectArea.id) {
					selectArea.id.innerHTML = '';
					selectArea.id.appendChild(fragment);
					//document.getElementById("j-sub-filter-list").innerHTML="";

				}
			}
		}
	}

	function execGeo(str) {
		var reg = /([^\|;]*)(?=;)/;
		var myStr = reg.exec(str);
		var myArr_x = myStr[0].split(",")[0] * 1
		var myArr_y = myStr[0].split(",")[1] * 1
		var geo = {
			"x" : myArr_x,
			"y" : myArr_y
		}
		return geo;
	}

	baidu.lang.inherits(CityList, baidu.lang.Class, "CityList");

	CityList.prototype._init = function() {
		if (this._opts.container) {
			this._initContainer();
		}
	}

	CityList.prototype.getBusiness = function(business, cbk) {
		var url = config.serviceUrl + "/shangquan/reverse/?wd=" + business;
		DataMgr
				.request(
						url,
						function(json) {
							var result = null;
							if (json && json['error']
									&& json['error']['errno'] == "0") {
								result = json['content'];
							}

							for (var i = 0, len = result.length; i < len; i++) {
								result[i]['coordinate'] = coordinateToPoints(result[i]['coordinate']);
							}

							if (cbk) {
								cbk(result);
							}
						});
	}
	CityList.prototype.selectBorough = function(borough) {
		var s_value = 0;
		for (var i = 0, len = boroughDom.options.length; i < len; i++) {
			if (boroughDom.options[i].title == borough) {
				s_value = boroughDom.options[i].value;
			}
			
		}
		selectBorough(s_value, businessDom, 12, 1)
		//businessDom.innerHTML = "";
	}
	
	CityList.prototype.selectbusiness = function(business) {
		var s_value = 0;
		var option = null;
		for (var i = 0, len = businessDom.options.length; i < len; i++) {
			if (businessDom.options[i].title == business) {
				s_value = businessDom.options[i].value;
				option=businessDom.options[i];
			}
		}
	
		var geo = execGeo(option.geo);
		var mp = new BMap.MercatorProjection();
		var po = mp.pointToLngLat(new BMap.Pixel(geo.x, geo.y));
		var point = new BMap.Point(po.lng, po.lat);
		map.centerAndZoom(point, 16);
		var business_geo = option.business_geo;
		
		business_geo = business_geo.split(';');
		
		for (var i = 0, len = business_geo.length; i < len; i++) {
			var business_p = business_geo[i].split(',');
			business_geo[i] = mp.pointToLngLat(new BMap.Pixel(
					business_p[0], business_p[1]))
		}
		//polygon.show();
		//polygon.setPath(business_geo);
		//map.setViewport(business_geo);
		return po.lat+","+po.lng;
	}

	CityList.prototype.selectProvince = function(city,province) {
		selectArea_ex(1, provinceDom, 12,city,province);
	}

	CityList.prototype.getSubAreaList = function(areaCode, cbk) {
		var url = config.serviceUrl
				+ "/shangquan/forward/?qt=sub_area_list&ext=1&level=1&areacode="
				+ areaCode + "&business_flag=0";
		DataMgr.request(url, function(json) {
			var result = null;
			if (json && json['result'] && json['result']['error'] == "0") {
				result = json['content'];
			}

			result.geo = geoToPoint(result.geo);

			for (var i = 0, len = result.sub.length; i < len; i++) {
				result.sub[i]['geo'] = geoToPoint(result.sub[i]['geo']);
			}

			if (cbk) {
				cbk(result);
			}
		});
	}

	CityList.prototype._initContainer = function() {

		var me = this;

		/* 璇峰煄甯傚湴鍖� */

		var cssText = "width:70px;margin:0 5px;";
		var container = baidu.g(this._opts.container);
		provinceDom.style.cssText = cssText;
		pv = provinceDom;
		borDom = boroughDom;
		cityDom.style.cssText = cssText;
		boroughDom.style.cssText = cssText;
		businessDom.style.cssText = cssText;
		container.appendChild(provinceDom);
		container.appendChild(document.createTextNode('省'));
		container.appendChild(cityDom);
		container.appendChild(document.createTextNode('市'));
		container.appendChild(boroughDom);
		container.appendChild(document.createTextNode('区'));
		container.appendChild(businessDom);
		container.appendChild(document.createTextNode('商圈'));

		/* 绗竴姝� 琛ㄥ崟鎿嶄綔 */
		baidu
				.on(
						provinceDom,
						"change",
						function() {
							var s_value = provinceDom.value;
							cityDom.innerHTML = boroughDom.innerHTML = businessDom.innerHTML = "";
							if (s_value == 131 || s_value == 289
									|| s_value == 332 || s_value == 132) {
								var cityName = ""
								switch (s_value) {
								case "131":
									cityName = "北京市";
									break;
								case "289":
									cityName = "上海市";
									break;
								case "332":
									cityName = "天津市";
									break;
								case "132":
									cityName = "重庆市";
									break;
								}
								var fragment = document
										.createDocumentFragment();
								var o;
								o = document.createElement("option");
								o.innerHTML = cityName;
								o.value = s_value;
								o.title = cityName;
								fragment.appendChild(o);
								cityDom.appendChild(fragment)
								selectArea(s_value, boroughDom, 12);
							} else {
								selectArea(s_value, cityDom, 12);
							}
							dispatchCityClick(this.options[this.selectedIndex]);
						});
		baidu.on(cityDom, "change", function() {
			var s_value = cityDom.value;
			selectArea(s_value, boroughDom, 12);
			boroughDom.innerHTML = "";
			dispatchCityClick(this.options[this.selectedIndex]);
		});

		baidu.on(boroughDom, "change", function() {
			var s_value = boroughDom.value;
			selectArea(s_value, businessDom, 12, 1)
			businessDom.innerHTML = "";
			dispatchCityClick(this.options[this.selectedIndex]);
		});

		function dispatchCityClick(option) {

			me.dispatchEvent('cityclick', {
				area_code : option.value,
				area_type : option.area_type,
				geo : geoToPoint(option.geo),
				area_name : option.title
			});
		}

		map.addOverlay(polygon);
		polygon.hide();
		baidu.on(businessDom, "change", function(e) {
			var s_value = businessDom.value;
			var option = this.options[this.selectedIndex];
			var geo = execGeo(option.geo);
			var mp = new BMap.MercatorProjection();
			var po = mp.pointToLngLat(new BMap.Pixel(geo.x, geo.y));

			var business_geo = option.business_geo;
			business_geo = business_geo.split(';');
			for (var i = 0, len = business_geo.length; i < len; i++) {
				var business_p = business_geo[i].split(',');
				business_geo[i] = mp.pointToLngLat(new BMap.Pixel(
						business_p[0], business_p[1]))
			}
			polygon.show();
			polygon.setPath(business_geo);
			map.setViewport(business_geo);

			dispatchCityClick(this.options[this.selectedIndex]);

			// var point = new BMap.Point(po.lng, po.lat);
			// map.centerAndZoom(point, 14);
		});

		//selectArea(1, provinceDom, 12);
	}

})();