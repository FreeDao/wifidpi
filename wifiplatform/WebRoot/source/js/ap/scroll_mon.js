$(document).ready(function() {
	$("#up_div").scroll(function() {
		var scrollTop = parseInt($("#scroll_top").val());
		var stop = $("#up_div").scrollTop();
		var sheight = document.getElementById("up_div").scrollHeight;
		var height = $("#up_div").height();
		var num = parseInt($("#scroll_num").val());
		//当最大高度小于滚动的高度，重新赋值
		if(scrollTop < stop){
			$("#scroll_top").val(stop);
		}else{
			//大于的时候，说明已经完成加载过，直接返回
			return;
		}
		if ((stop + height) / (sheight - (stop + height)) >= 5) {
//			加载数据
			openLoadDataGif();
			num++;
			$("#scroll_num").val(num);
			var data = "pagenum="+num;
			var url = "apmController!querybylimit";
			if(query_content != ""){
				data +=("&"+query_content);
				url = "apmController!highranksearch";
			}
			$.post(url,data,function(res){
			var json = eval(res);
			if(json.length == 0){
				closeLoadDataGif();
				return;
			}
			var htmlStr = "";
			for ( var i = 0; i < json.length; i++) {
				if(json[i].isonLine){
					htmlStr += "<tr style='background:#FCFDFD' ondblclick=attrLook("+json[i].id+");>"
					htmlStr += "<td width='4%' style='color:red'><div align='center'>"
						    + "在线"
						    + "</div></td>";
				}else{
					htmlStr += "<tr style='background:#FCFDFD' ondblclick=attrLook("+json[i].id+");>"
					htmlStr += "<td width='4%'><div align='center'>"
					+ "离线"
					+ "</div></td>";
				}
				htmlStr += "<td width='10%'><div align='left'   title='"+json[i].name+"'>"
				+ ((json[i].name==null)?'':(json[i].name.length>15?json[i].name.substring(0,15)+"...":json[i].name))
				+ "</div></td>";
				
				htmlStr += "<td width='7%'><div align='center'>"
						+ json[i].mac
						+ "</div></td>";
				
				
				htmlStr += "<td width='7%'><div align='center'>"
						+ ((json[i].province=='北京市')?'北京市':json[i].province)+""
						+ "</div></td>";
				
				htmlStr += "</tr>";
			}
			htmlStr += "</table>";
			$("#data_table").append(htmlStr);
			},"json");
			closeLoadDataGif();
		}
	});
});
