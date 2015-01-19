import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;

import sun.misc.BASE64Decoder;

import com.sinosoft.util.RandomMac;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;


public class addnode {
	public static int onlineuser=0;
	public static int offlineuser=0;
	public static void main(String[] args) throws Exception{
		//city("美食","南京市",0);
		//江苏
		offlineuser=1606525/20289;
		onlineuser=195996/16333;
		for(int i=0;i<16333;i++){
		  node2("320000",1);
		}
		for(int i=0;i<3956;i++){
			  node2("320000",0);
		}
		
		
	}
	public static void adduser(String mac,int online){
		String URL = "http://42.123.76.19/authenticate";
		URL url=null;
		try {
			url = new URL(URL);
		} catch (MalformedURLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		
		String macclient=RandomMac.createRandomMacAddress("");
		macclient=macclient.replace(":","");
		macclient=macclient.toUpperCase();
		mac=mac.replace(":","");
		mac=mac.toUpperCase();
		String jsonnode = "{";
		jsonnode += "\"gw_id\":\""+mac+"\",";
		jsonnode += "\"gw_address\":\"192.168.1.1\",";
		jsonnode += "\"gw_port\":\"80\",";
		jsonnode += "\"url\":\"baidu.com\",";
		jsonnode += "\"client_MAC\":\""+macclient+"\",";
		jsonnode += "\"online\":"+online+",";
		jsonnode += "\"username\":\""+macclient+"\"";
		jsonnode += "	}";

		HttpClient httpclient = new DefaultHttpClient();
		// 创建Get方法实例
		HttpPost httppost = new HttpPost(URL);
		httppost.setHeader("Content-type", "application/json");
		
		
		StringEntity sentity = new StringEntity(jsonnode,"UTF-8");
		httppost.setEntity(sentity);
		//		entity.setChunked(true);
		HttpResponse response = null;
		try {
			response = httpclient.execute(httppost);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (response==null){
			httppost.abort();
			return;
		}
		HttpEntity entity = response.getEntity();
		if (entity != null) {
			InputStream instreams = null;
			try {
				instreams = entity.getContent();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String json = convertStreamToString(instreams);
			//System.out.println(json); 
			String token=json.trim();
			connect(macclient,token,mac);
			httppost.abort();
		}
	}
	
	public static void connect(String mac,String token,String gw_id){
		String url = "http://42.123.76.19/auth?";
		url += "token=" + token;
		url += "&mac=" + mac;
		url += "&gw_id=" + gw_id;
		url += "&ip=" + "192.168.0.1";
		url += "&incoming=" + 2333;
		url += "&outgoing=" + 234;
		url += "&stage=" + "login";
		
		HttpClient httpclient = new DefaultHttpClient();
		// 创建Get方法实例
		HttpGet httpgets = new HttpGet(url);
		HttpResponse response = null;
		try {
			response = httpclient.execute(httpgets);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		HttpEntity entity = response.getEntity();
		if (entity != null) {
			InputStream instreams = null;
			try {
				instreams = entity.getContent();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String jsonString = convertStreamToString(instreams);
			
			httpgets.abort();
		}
	}
	public static void node2(String code,int online){
		String URL = "http://42.123.76.19/addnodes";
		URL url=null;
		try {
			url = new URL(URL);
		} catch (MalformedURLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		String address="";
		String name="";
		
		String telephone ="";
		
		String uid ="";
	
		float lan=0;
		float lng=0;
		
		String province=code;
		String city="";
		String district="";
		
		String mac=RandomMac.createRandomMacAddress("");
		String jsonnode = "{";
		jsonnode += "\"username\":\"admin\",";
		jsonnode += "\"password\":\"ctbri@2014\",";
		jsonnode += "\"AP\":[";
		jsonnode += "		    {";
		jsonnode += "\"address\":{";
		jsonnode += "\"province\": \""+province+"\",";
		jsonnode += "\"city\": \""+city+"\",";
		jsonnode += "\"district\": \""+district+"\",";
		jsonnode += "\"detail\": \""+address+"\"";
		jsonnode += "      },";
		jsonnode += "\"contact\":{";
		jsonnode += "\"merchant\":\""+name+"\",";
		jsonnode += "\"name\":\"王一\",";
		jsonnode += "\"phonenum\":\""+telephone+"\",";
		jsonnode += "\"telephonenum\":\"\",";
		jsonnode += "\"email\":\"wangyi@sina.com\",";
		jsonnode += "\"weixin\":\"tudou\"";
		jsonnode += " },";
		jsonnode += "\"data\":{";
		jsonnode += "\"name\":\""+mac+"\",";
		jsonnode += "\"mac\":\""+mac+"\",";
		jsonnode += "\"lat\":"+lan+",";
		jsonnode += "\"online\":"+online+",";
		jsonnode += "\"long\":"+lng+",";
		jsonnode += "\"uid\":\""+uid+"\",";
		jsonnode += "\"virtual\":\"1\",";
		jsonnode += "\"redirect_url\":\"http://x.x.x.x/xx\",";
		jsonnode += "\"portal_url\":\"http://x.x.x.x/xx\"";
		jsonnode += "	    }";
		jsonnode += "	   }";
		jsonnode += "	]";
		jsonnode += "	}";

		HttpClient httpclient = new DefaultHttpClient();
		// 创建Get方法实例
		HttpPost httppost = new HttpPost(URL);
		httppost.setHeader("Content-type", "application/json");
		
		
		StringEntity sentity = new StringEntity(jsonnode,"UTF-8");
		httppost.setEntity(sentity);
		//		entity.setChunked(true);
		HttpResponse response = null;
		try {
			response = httpclient.execute(httppost);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpEntity entity = response.getEntity();
		if (entity != null) {
			InputStream instreams = null;
			try {
				instreams = entity.getContent();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String json = convertStreamToString(instreams);
			System.out.println(json);  
			httppost.abort();
		}
		if (online==1)
		for(int i=0;i<onlineuser;i++){
			adduser(mac,1);
		}
		for(int i=0;i<offlineuser;i++){
			adduser(mac,0);
		}
	}
	public static void node(JSONObject obj){
		String URL = "http://42.123.76.19/addnodes";
		URL url=null;
		try {
			url = new URL(URL);
		} catch (MalformedURLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		String address=obj.getString("address");
		String name=obj.getString("name");
		obj.containsKey("telephone");
		String telephone ="";
		if (obj.containsKey("telephone")){
			telephone=obj.getString("telephone");
		}
		String uid =obj.getString("uid");
		JSONObject lobj=obj.getJSONObject("location");
		String lan=lobj.getString("lat");
		String lng=lobj.getString("lng");
		String loction=lobj.getString("lat");
		loction+=",";
		loction+=lobj.getString("lng");
		Map<String ,String> map=geocoder(loction);
		String province="";
		String city="";
		String district="";
		if (map.get("code")!=null){
			district=map.get("code");
		}
		if (map.get("city_code")!=null){
			city=map.get("city_code");
		}
		if (map.get("province_code")!=null){
			province=map.get("province_code");
		}
		String mac=RandomMac.createRandomMacAddress("");
		String jsonnode = "{";
		jsonnode += "\"username\":\"admin\",";
		jsonnode += "\"password\":\"ctbri@2014\",";
		jsonnode += "\"AP\":[";
		jsonnode += "		    {";
		jsonnode += "\"address\":{";
		jsonnode += "\"province\": \""+province+"\",";
		jsonnode += "\"city\": \""+city+"\",";
		jsonnode += "\"district\": \""+district+"\",";
		jsonnode += "\"detail\": \""+address+"\"";
		jsonnode += "      },";
		jsonnode += "\"contact\":{";
		jsonnode += "\"merchant\":\""+name+"\",";
		jsonnode += "\"name\":\"王一\",";
		jsonnode += "\"phonenum\":\""+telephone+"\",";
		jsonnode += "\"telephonenum\":\"\",";
		jsonnode += "\"email\":\"wangyi@sina.com\",";
		jsonnode += "\"weixin\":\"tudou\"";
		jsonnode += " },";
		jsonnode += "\"data\":{";
		jsonnode += "\"name\":\""+name+"\",";
		jsonnode += "\"mac\":\""+mac+"\",";
		jsonnode += "\"lat\":"+lan+",";
		jsonnode += "\"long\":"+lng+",";
		jsonnode += "\"uid\":\""+uid+"\",";
		jsonnode += "\"virtual\":\"1\",";
		jsonnode += "\"redirect_url\":\"http://x.x.x.x/xx\",";
		jsonnode += "\"portal_url\":\"http://x.x.x.x/xx\"";
		jsonnode += "	    }";
		jsonnode += "	   }";
		jsonnode += "	]";
		jsonnode += "	}";

		HttpClient httpclient = new DefaultHttpClient();
		// 创建Get方法实例
		HttpPost httppost = new HttpPost(URL);
		httppost.setHeader("Content-type", "application/json");
		
		
		StringEntity sentity = new StringEntity(jsonnode,"UTF-8");
		httppost.setEntity(sentity);
		//		entity.setChunked(true);
		HttpResponse response = null;
		try {
			response = httpclient.execute(httppost);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpEntity entity = response.getEntity();
		if (entity != null) {
			InputStream instreams = null;
			try {
				instreams = entity.getContent();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String json = convertStreamToString(instreams);
			System.out.println(json);  
			httppost.abort();
		}
	}
	
	public static void city(String query,String region,int page_num){
		String url = "http://api.map.baidu.com/place/v2/search?";
		url += "query=" + query;
		url += "&region=" + region;
		url += "&page_num=" + page_num;
		url += "&page_size=" + 20;
		url += "&url=" + url;
		url += "&output=json&ak=Q15HFmKZ9NEPV8UjvItUNLE2";
		String jsonString = "";
		HttpClient httpclient = new DefaultHttpClient();
		// 创建Get方法实例
		HttpGet httpgets = new HttpGet(url);
		HttpResponse response = null;
		try {
			response = httpclient.execute(httpgets);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpEntity entity = response.getEntity();
		if (entity != null) {
			InputStream instreams = null;
			try {
				instreams = entity.getContent();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			jsonString = convertStreamToString(instreams);
			JSONObject json= JSONObject.fromObject(jsonString); 
			int total = json.getInt("total");
			if (total!=0){
				JSONArray array=json.getJSONArray("results");
				for (int i = 0; i < array.size(); i++) {   
					node(array.getJSONObject(i)); 
				}
				
				city( query,region,  page_num+1);
			}
			httpgets.abort();
		}
	}
	
	
	public static Map<String ,String> geocoder(String location){
		String url = "http://api.map.baidu.com/geocoder/v2/?";
		url += "location=" + location;
		url += "&callback=renderReverse";
		url += "&output=json&ak=Q15HFmKZ9NEPV8UjvItUNLE2";
		String jsonString = "";
		HttpClient httpclient = new DefaultHttpClient();
		// 创建Get方法实例
		HttpGet httpgets = new HttpGet(url);
		HttpResponse response = null;
		try {
			response = httpclient.execute(httpgets);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpEntity entity = response.getEntity();
		if (entity != null) {
			InputStream instreams = null;
			try {
				instreams = entity.getContent();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			jsonString = convertStreamToString(instreams);
			jsonString = jsonString.replace("renderReverse&&renderReverse(", "");
			jsonString = jsonString.substring(0, jsonString.length()-1);
			JSONObject json= JSONObject.fromObject(jsonString); 
			json=json.getJSONObject("result");
			JSONObject addressComponent = json.getJSONObject("addressComponent");
			
			httpgets.abort();
			return code(addressComponent);
		}
		return null;
	}
	public static Map<String ,String> code(JSONObject addressComponent){
		String driver = "com.mysql.jdbc.Driver";

		// URL指向要访问的数据库名scutcs
		String url = "jdbc:mysql://127.0.0.1:3306/cloudwifi_manage";

		// MySQL配置时的用户名
		String user = "root";

		// MySQL配置时的密码
		String password = "ctbri@2014";

		String sql = "";
		sql ="select d.code , c.province_code,d.city_code from addr_city c , addr_province p , addr_district d where c.name='";
		sql +=addressComponent.getString("city"); 
		sql +="' and c.province_code=p.code and p.name='";
		sql +=addressComponent.getString("province");
		sql +="' and d.name='";
		sql +=addressComponent.getString("district");
		sql +="' and d.city_code=c.code";
		Connection conn = null;
		String datauser = "";
		Map<String ,String> map = new HashMap<String,String>();  
		try {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn = DriverManager.getConnection(url, user, password);

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rset = ps.executeQuery();
			// json = resultSetToJson(rset);
			ResultSetMetaData metaData = rset.getMetaData();
			int columnCount = metaData.getColumnCount();

			// 遍历ResultSet中的每条数据
			while (rset.next()) {

				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rset.getString(columnName);
					// jsonObj.put(columnName, value);
					if (columnName.equals("code")) {
						map.put("code", value);
					} else if (columnName.equals("province_code")) {
						map.put("province_code", value);
					}else if (columnName.equals("city_code")) {
						map.put("city_code", value);
					}

				}

			}
			ps.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return map;
	}
	public static String convertStreamToString(InputStream is) {
		StringBuilder sb1 = new StringBuilder();
		byte[] bytes = new byte[4096];
		int size = 0;

		try {
			while ((size = is.read(bytes)) > 0) {
				String str = new String(bytes, 0, size, "UTF-8");
				sb1.append(str);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb1.toString();
	}
}
