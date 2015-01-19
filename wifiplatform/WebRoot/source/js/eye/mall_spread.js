define("home:widget/coming/mall_spread.js",function(o,n,e)
{
	function t(o)
      {s=[],p=[],g=0,i=[],r=[];for(var n=0;n<o.length;n++)s.push(o[n].community),g+=0|o[n].num,i.push([o[n].loc_x,o[n].loc_y]);
console.log(i.length);for(var n=0;n<o.length;n++)p.push((o[n].num/g*100).toFixed(2));
i.length<=0?$(".coming_village_tips").show().html("该日期暂无数据"):$(".coming_village_tips").hide();
var e={color:["#4cb8eb","#ff524f"],tooltip:{trigger:"axis",formatter:"{b}<br/>{a}:{c}%<br/>点击查看位置"},toolbox:{show:!0,feature:{mark:{show:!0},dataView:{show:!0,readOnly:!1},magicType:{show:!0,type:["line","bar"]},restore:{show:!0},saveAsImage:{show:!0}}},calculable:!0,xAxis:[{axisLabel:{formatter:"{value}%"},type:"value",boundaryGap:[0,.01]}],yAxis:[{axisLabel:{clickable:!0},type:"category",data:s}],
series:[{name:"来源比例",type:"bar",data:p}],grid:{x:"180px"}};m.clear(),m.setOption(e),c()}
function c(o)
{
	function n(o,n)
    {
		var e=new BMap.Pixel(o,n),t=w.getMapType().getProjection().pointToLngLat(e);
        return t
     }
     function e(o,n,e)
     {
        var n="来源比例 "+n+"%";
        e.addEventListener("click",function(e)
        { var t=e.target,c=new BMap.Point(t.getPosition().lng,t.getPosition().lat),
          a=new BMap.InfoWindow(n,{width:150,height:20,title:o,enableCloseOnClick:!0,enableMessage:!0});
w.openInfoWindow(a,c)})}if(w.closeInfoWindow(),o)w.centerAndZoom(n(o.center[0],o.center[1]),15);
else{w.clearOverlays();for(var t=0;t<i.length;t++){var c=(i.length-t-1,new BMap.Marker(n(i[t][0],i[t][1]),{icon:u}));
e(s[t],p[t],c),w.addOverlay(c),r.push(c)}w.centerAndZoom(_,15),w.addControl(new BMap.NavigationControl),
w.addControl(new BMap.MapTypeControl({mapTypes:[BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]})),w.setMinZoom(10),w.setCurrentCity("北京"),
w.enableScrollWheelZoom(!0)}}
var a=o("common:static/js/BaseObject.js"),
l=document.getElementById("comming_village_left"),m=echarts.init(l),i=[],r=[],
u=new BMap.Icon("http://webmap1.map.bdimg.com/newmap/static/common/images/markers_new_653df87.png",new BMap.Size(21,33));
u.imageOffset=new BMap.Size(-104,-113);
var y=new BMap.Icon("http://webmap1.map.bdimg.com/newmap/static/common/images/markers_new_653df87.png",new BMap.Size(21,33));
y.imageOffset=new BMap.Size(-104,-165);
var _;

m.on("click",function(o)
{for(var n=0,e=0,t=0,a=s.length;a>t;t++)if(s[t]==o.name)
{e=t,n=s.length-t-1;break}for(var t=0,a=r.length;a>t;t++)r[t].setIcon(e==t?y:u);c({center:i[e]})});


var s=[],p=[],g=0,w=new BMap.Map("comming_village_right"),f=new a({url:"/huiyan/api/customer?callback=?",params:{type:"village"},callback:function(o)
{if(true){var o=[{community:"商户A",loc_x:"12977900",loc_y:"4831040",num:"5"},{community:"商户B",loc_x:"12981100",loc_y:"4829560",num:"5"},
{community:"商户C",loc_x:"12982000",loc_y:"4831150",num:"5"},{community:"商户D",loc_x:"12975500",loc_y:"4829450",num:"5"},
{community:"商户E",loc_x:"12979100",loc_y:"4832090",num:"5"},{community:"商户F",loc_x:"12980400",loc_y:"4827960",num:"5"},
{community:"商户G",loc_x:"12980100",loc_y:"4831830",num:"5"},{community:"商户H",loc_x:"12982300",loc_y:"4829740",num:"5"},
{community:"商户I",loc_x:"12982100",loc_y:"4829900",num:"5"},{community:"商户J",loc_x:"12978300",loc_y:"4370460",num:"5"},
{community:"商户K",loc_x:"12983600",loc_y:"4831030",num:"6"},{community:"商户L",loc_x:"12967800",loc_y:"4834650",num:"6"},
{community:"商户M",loc_x:"12979900",loc_y:"4840670",num:"6"},{community:"商户N",loc_x:"12982100",loc_y:"4839980",num:"6"},
{community:"商户O",loc_x:"12980600",loc_y:"4831300",num:"6"},{community:"商户P",loc_x:"12981200",loc_y:"4830300",num:"6"},
{community:"商户Q",loc_x:"12983700",loc_y:"4806200",num:"6"},{community:"商户R",loc_x:"12981400",loc_y:"4830120",num:"7"},
{community:"商户S",loc_x:"12981100",loc_y:"4829400",num:"7"},{community:"商户T",loc_x:"12982000",loc_y:"4829410",num:"7"}];
_=new BMap.Point(116.60457,39.940764)}else _=new BMap.Point(116.24457,40.217764);t(o)}});e.exports=f});;
