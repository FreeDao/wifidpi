function changestatistics(province,city,borough,business,type,level){
	var data = "province=" + province;
	data+="&city=" + city;
	data+="&borough=" + borough;
	data+="&business=" + business;
	data+="&type=" + type;
	data+="&level=" + level;
	$.ajax({
		type : "GET",
		dataType : "json",
		url : "eye!getApType.do",
		data : data,
		success : function(json) {
			changedraw(json);
		},
		error : function() {
			
			return null;

		}
	});
}