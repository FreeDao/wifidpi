function getpoi(query,location,radius,map) {
	data = "query=美食&location=39.947486,116.358716&radius=2000&output=xml&ak=Q15HFmKZ9NEPV8UjvItUNLE2";
	$.ajax({
		type : "get",		
		dataType : "json",
		url : "mall!placepoi.do",
		data : "query="+ query+"&location="+location+"&radius="+radius,
		success : function(json) {
			var results = json.results;
			map.clearOverlays();
			var bxjk=0;
			for ( var i = 0; i < results.length; i++) {
				var poi = results[i];
				var point = new BMap.Point(poi.location.lng,poi.location.lat);
				var marker = new BMap.Marker(point);  // 创建标注
				marker.addEventListener("mouseover",overlay_style);
				map.addOverlay(marker); 
				marker.setTitle(poi.name);
				function overlay_style(e){
					var label = new BMap.Label(this.getTitle(),{offset:new BMap.Size(20,-10)});
					this.setLabel(label);
					label.enableMassClear();
				}
				marker.addEventListener("mouseout",outlay_style);
				function outlay_style(e){
					map.removeOverlay(this.getLabel());
				}
				marker.addEventListener("dblclick",dbl_style);
				function dbl_style(e){
					window.location.href="mall!eye.do?name="+this.getTitle()+"&uid="+poi.uid;
				}
				if(poi.address.indexOf("新街口",0)>-1){
					bxjk=1;
				}
	            // 将标注添加到地图中
			}
			if(bxjk==1){
				var point = new BMap.Point(116.374483,39.946023);
				var marker = new BMap.Marker(point);  // 创建标注
				marker.addEventListener("mouseover",overlay_style);
				map.addOverlay(marker); 
				marker.setTitle("北研");
				function overlay_style(e){
					var label = new BMap.Label(this.getTitle(),{offset:new BMap.Size(20,-10)});
					this.setLabel(label);
					label.enableMassClear();
				}
				marker.addEventListener("mouseout",outlay_style);
				function outlay_style(e){
					map.removeOverlay(this.getLabel());
				}
				marker.addEventListener("dblclick",dbl_style);
				//function dbl_style(e){
				//	window.location.href="mall!eye.do?name="+this.getTitle()+"&uid=";
				//}
			}
			
			//function showInfo(e){
			//	alert(e.point.lng + ", " + e.point.lat);
			//}
			//map.addEventListener("click", showInfo);
			return (json);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			
		}
	}); 
    return ""
};

function getpoibyregion(query,region,page_num,map) {
	data = "query=美食&location=39.947486,116.358716&radius=2000&output=xml&ak=Q15HFmKZ9NEPV8UjvItUNLE2";
	$.ajax({
		type : "get",		
		dataType : "json",
		url : "mall!getpoibyregion.do",
		data : "query="+ query+"&region="+region+"&page_size=20&page_num="+page_num,
		success : function(json) {
			var results = json.results;
			var bxjk=0;
			for ( var i = 0; i < results.length; i++) {
				var poi = results[i];
				var point = new BMap.Point(poi.location.lng,poi.location.lat);
				var marker = new BMap.Marker(point);  // 创建标注
				marker.addEventListener("mouseover",overlay_style);
				map.addOverlay(marker); 
				marker.setTitle(poi.name);
				function overlay_style(e){
					var label = new BMap.Label(this.getTitle(),{offset:new BMap.Size(20,-10)});
					this.setLabel(label);
					label.enableMassClear();
				}
				marker.addEventListener("mouseout",outlay_style);
				function outlay_style(e){
					map.removeOverlay(this.getLabel());
				}
				marker.addEventListener("dblclick",dbl_style);
				function dbl_style(e){
					window.location.href="mall!eye.do?name="+this.getTitle()+"&uid="+poi.uid;
				}
				if(poi.address.indexOf("新街口",0)>-1){
					bxjk=1;
				}
	            // 将标注添加到地图中
			}
			if(bxjk==1){
				var point = new BMap.Point(116.374483,39.946023);
				var marker = new BMap.Marker(point);  // 创建标注
				marker.addEventListener("mouseover",overlay_style);
				map.addOverlay(marker); 
				marker.setTitle("北研");
				function overlay_style(e){
					var label = new BMap.Label(this.getTitle(),{offset:new BMap.Size(20,-10)});
					this.setLabel(label);
					label.enableMassClear();
				}
				marker.addEventListener("mouseout",outlay_style);
				function outlay_style(e){
					map.removeOverlay(this.getLabel());
				}
				marker.addEventListener("dblclick",dbl_style);
				//function dbl_style(e){
				//	window.location.href="mall!eye.do?name="+this.getTitle()+"&uid=";
				//}
			}
			
			//function showInfo(e){
			//	alert(e.point.lng + ", " + e.point.lat);
			//}
			//map.addEventListener("click", showInfo);
			return (json);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			
		}
	}); 
    return ""
};
