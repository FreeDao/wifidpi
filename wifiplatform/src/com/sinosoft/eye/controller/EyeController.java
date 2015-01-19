package com.sinosoft.eye.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.IOUtils;

import com.sinosoft.account.bean.Account;
import com.sinosoft.apmessage.bean.ApMessage;
import com.sinosoft.apmessage.service.ApMessageService;
import com.sinosoft.count.service.CountService;
import com.sinosoft.dataSource.DbContextHolder;
import com.sinosoft.eye.bean.ApType;
import com.sinosoft.eye.bean.Poi;
import com.sinosoft.eye.service.EyeService;
import com.sinosoft.util.RandomMac;
import com.sinosoft.util.WebContextArguments;

@Controller
public class EyeController {

	@Autowired
	private ApMessageService apMessageService;
	@Autowired
	private EyeService eyeService;

	/**
	 * 首页显示
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/mall!init.do", method = RequestMethod.GET)
	public ModelAndView searchmap(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		// 得到用户
		Account account = (Account) request.getSession().getAttribute("user");

		ModelAndView view = new ModelAndView("source/page/eye/index.jsp");

		return view;
	}

	@RequestMapping(value = "/mall!customer_portrait.do", method = RequestMethod.GET)
	public ModelAndView customer_portrait(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		if (storename != null) {
			try {
				storename = new String(storename.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		ModelAndView view = new ModelAndView(
				"source/page/eye/customer_portrait.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!flow_coming.do", method = RequestMethod.GET)
	public ModelAndView flow_coming(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		if (storename != null) {
			try {
				storename = new String(storename.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		ModelAndView view = new ModelAndView("source/page/eye/flow_coming.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!flow_going.do", method = RequestMethod.GET)
	public ModelAndView flow_going(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		if (storename != null) {
			try {
				storename = new String(storename.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		ModelAndView view = new ModelAndView("source/page/eye/flow_going.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!flow_customer.do", method = RequestMethod.GET)
	public ModelAndView flow_customer(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		if (storename != null) {
			try {
				storename = new String(storename.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		ModelAndView view = new ModelAndView(
				"source/page/eye/flow_customer.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!compare_portrait.do", method = RequestMethod.GET)
	public ModelAndView compare_portrait(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		ModelAndView view = new ModelAndView(
				"source/page/eye/compare_portrait.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!compare_customer.do", method = RequestMethod.GET)
	public ModelAndView compare_customer(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		ModelAndView view = new ModelAndView(
				"source/page/eye/compare_customer.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!near_customer.do", method = RequestMethod.GET)
	public ModelAndView near_customer(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		ModelAndView view = new ModelAndView(
				"source/page/eye/near_customer.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!near_poi.do", method = RequestMethod.GET)
	public ModelAndView near_poi(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		if (storename != null) {
			try {
				storename = new String(storename.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		ModelAndView view = new ModelAndView("source/page/eye/near_poi.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!flow_actual.do", method = RequestMethod.GET)
	public ModelAndView flow_actual(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		if (storename != null) {
			try {
				storename = new String(storename.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		ModelAndView view = new ModelAndView("source/page/eye/flow_actual.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!flow_all.do", method = RequestMethod.GET)
	public ModelAndView flow_all(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		if (storename != null) {
			try {
				storename = new String(storename.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		ModelAndView view = new ModelAndView("source/page/eye/flow_all.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!flow_storey.do", method = RequestMethod.GET)
	public ModelAndView flow_storey(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		if (storename != null) {
			try {
				storename = new String(storename.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		ModelAndView view = new ModelAndView("source/page/eye/flow_storey.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!mall_spread.do", method = RequestMethod.GET)
	public ModelAndView mall_spread(HttpServletRequest request) {
		DbContextHolder.clearDbType();
		ModelAndView view = new ModelAndView("source/page/eye/mall_spread.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!changecity.do", method = RequestMethod.GET)
	public ModelAndView changecity(HttpServletRequest request) {
		DbContextHolder.clearDbType();

		ModelAndView view = new ModelAndView("source/page/eye/changecity.jsp");
		return view;
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

	@ResponseBody
	@RequestMapping(value = "/mall!placepoi.do")
	public void placepoi(HttpServletRequest req, HttpServletResponse rep) {
		rep.setContentType("text/html;charset=utf-8");
		// 接收level和区域code
		String query = req.getParameter("query");
		try {
			query = new String(query.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String location = req.getParameter("location");
		String radius = req.getParameter("radius");
		String url = "http://api.map.baidu.com/place/v2/search?";
		url += "query=" + query;
		url += "&location=" + location;
		url += "&radius=" + radius;
		url += "&page_size=" + 20;
		url += "&url=" + url;
		url += "&output=json&ak=Q15HFmKZ9NEPV8UjvItUNLE2";
		String json = "";
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
			json = convertStreamToString(instreams);
			httpgets.abort();
		}
		// 将json数据传回

		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
	}

	@ResponseBody
	@RequestMapping(value = "/mall!getpoibyregion.do")
	public void getpoibyregion(HttpServletRequest req, HttpServletResponse rep) {
		rep.setContentType("text/html;charset=utf-8");
		// 接收level和区域code
		String query = req.getParameter("query");
		try {
			query = new String(query.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String region = req.getParameter("region");
		try {
			region = new String(region.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String page_num = req.getParameter("page_num");
		String url = "http://api.map.baidu.com/place/v2/search?";
		url += "query=" + query;
		url += "&region=" + region;
		url += "&page_num=" + page_num;
		url += "&page_size=" + 20;
		url += "&url=" + url;
		url += "&output=json&ak=Q15HFmKZ9NEPV8UjvItUNLE2";
		String json = "";
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
			json = convertStreamToString(instreams);
			httpgets.abort();
		}
		// 将json数据传回

		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
	}

	@RequestMapping(value = "/mall!awifi.do", method = RequestMethod.GET)
	public ModelAndView awifi(HttpServletRequest request) {
		// 创建HttpClient实例

		ModelAndView view = new ModelAndView("source/page/eye/awifi.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!eye.do", method = RequestMethod.GET)
	public ModelAndView eye(HttpServletRequest request) {
		// 创建HttpClient实例

		ModelAndView view = new ModelAndView("source/page/eye/eye.jsp");
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		try {
			storename = new String(storename.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		return view;
	}

	@RequestMapping(value = "/mall!trail.do", method = RequestMethod.GET)
	public ModelAndView usertrace(HttpServletRequest request) {
		// 创建HttpClient实例

		ModelAndView view = new ModelAndView("source/page/eye/user_trace.jsp");
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		try {
			storename = new String(storename.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		return view;
	}

	@RequestMapping(value = "/mall!customerinfo.do", method = RequestMethod.GET)
	public ModelAndView customerinfo(HttpServletRequest request) {
		// 创建HttpClient实例

		ModelAndView view = new ModelAndView("source/page/eye/customerinfo.jsp");
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		try {
			storename = new String(storename.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);

		String driver = "com.mysql.jdbc.Driver";

		// URL指向要访问的数据库名scutcs
		String url = "jdbc:mysql://42.123.76.25:3306/terminal";

		// MySQL配置时的用户名
		String user = "root";

		// MySQL配置时的密码
		String password = "admin";

		String sql = "select cf.name_cn ,TR.*    from terminal.terminalRecord as TR  ,config.appconfig as cf     where cf.app_id = TR.dev_type ";
		Connection conn = null;
		String datauser = "";
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

				// 遍历每一列
				datauser += "<tr>";
				datauser += "<td><span class=\"font14\">在线</span></td>";
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rset.getString(columnName);
					// jsonObj.put(columnName, value);
					if (columnName.equals("name_cn")) {
						datauser += "<td><span class=\"font14\">" + value
								+ "</span></td>";
					} else if (columnName.equals("mac")) {
						datauser += "<td><span class=\"font14\">" + value
								+ "</span></td>";
					} else if (columnName.equals("dev_name")) {
						datauser += "<td><span class=\"font14\">" + value
								+ "</span></td>";
					} else if (columnName.equals("login_time")) {
						long l = Long.parseLong(value);
						SimpleDateFormat sf = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						Date date = new Date(l);
						// datauser+="<td><span class=\"font14\">"+sf.format(date)+"</span></td>";
					} else if (columnName.equals("report_time")) {
						long l = Long.parseLong(value);
						SimpleDateFormat sf = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						Date date = new Date(l);
						// datauser+="<td><span class=\"font14\">"+sf.format(date)+"</span></td>";
					}

				}
				datauser += "</tr>";

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
		request.setAttribute("datauser", datauser);
		return view;
	}

	@RequestMapping(value = "/mall!store_ap.do", method = RequestMethod.GET)
	public ModelAndView getap(HttpServletRequest request) {
		// 创建HttpClient实例

		ModelAndView view = new ModelAndView("source/page/eye/store_ap.jsp");
		String storename = "北研";
		storename = request.getParameter("name");
		String uid = request.getParameter("uid");
		try {
			storename = new String(storename.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.setAttribute("name", storename);
		request.setAttribute("uid", uid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);

		String dataSourceName = DbContextHolder.getDataSourceName("10000");
		DbContextHolder.setDbType(dataSourceName);

		List<ApMessage> apMessageList = apMessageService.searchbyuid(map);
		view.addObject(apMessageList);
		DbContextHolder.clearDbType();
		return view;
	}

	// 管理员登陆省初始化(只查询默认管理省)
	@ResponseBody
	@RequestMapping(value = "/mall!GetCity")
	public List GetCity(HttpServletRequest req, HttpServletResponse rep) {
		rep.setContentType("text/html;charset=utf-8");
		String pid = req.getParameter("pid");
		String json = "";
		String url = "http://www.nuomi.com/pcindex/main/cityajax?";
		url += "pid=" + pid;

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
			json = convertStreamToString(instreams);
			httpgets.abort();
		}
		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
		return null;
	}

	// 管理员登陆省初始化(只查询默认管理省)
	@ResponseBody
	@RequestMapping(value = "/mall!addnodes")
	public List addnodes(HttpServletRequest req, HttpServletResponse rep) {
		rep.setContentType("text/html;charset=utf-8");
		String pid = req.getParameter("pid");
		String json = "";
		String URL = "http://42.123.76.18/addnodes";
		URL url = null;
		try {
			url = new URL(URL);
		} catch (MalformedURLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		URLConnection urlCon = null;
		try {
			urlCon = url.openConnection();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		urlCon.setDoOutput(true);
		urlCon.setDoInput(true);
		urlCon.setUseCaches(false);
		urlCon.setRequestProperty("Content-Type", "application/json");

		String jsonnode = "{";
		jsonnode += "\"username\":\"admin\",";
		jsonnode += "\"password\":\"ctbri@2014\",";
		jsonnode += "\"AP\":[";
		jsonnode += "		    {";
		jsonnode += "\"address\":{";
		jsonnode += "\"province\": \"330000\",";
		jsonnode += "\"city\": \"330300\",";
		jsonnode += "\"district\": \"330302\",";
		jsonnode += "\"detail\": \"鹿城路34号\"";
		jsonnode += "      },";
		jsonnode += "\"contact\":{";
		jsonnode += "\"merchant\":\"土豆心愿快餐店\",";
		jsonnode += "\"name\":\"王一\",";
		jsonnode += "\"phonenum\":\"18900403344\",";
		jsonnode += "\"telephonenum\":\"43343222\",";
		jsonnode += "\"email\":\"wangyi@sina.com\",";
		jsonnode += "\"weixin\":\"tudou\"";
		jsonnode += " },";
		jsonnode += "\"data\":{";
		jsonnode += "\"name\":\"ap122test\",";
		jsonnode += "\"mac\":\"E00696C98F19\",";
		jsonnode += "\"redirect_url\":\"http://x.x.x.x/xx\",";
		jsonnode += "\"portal_url\":\"http://x.x.x.x/xx\"";
		jsonnode += "	    }";
		jsonnode += "	   }";
		jsonnode += "	]";
		jsonnode += "	}";

		DataOutputStream printout;
		InputStream instr = null;
		try {
			printout = new DataOutputStream(urlCon.getOutputStream());
			// printout.write(jsonnode);
			printout.flush();
			printout.close();
			instr = urlCon.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String ResponseString = convertStreamToString(instr);
		if ((ResponseString == null) || ("".equals(ResponseString.trim()))) {
			System.out.println("返回空");
		}
		System.out.println("返回数据为:" + ResponseString);
		return null;
	}

	@ResponseBody
	@RequestMapping(value = "/eye!getApType.do")
	public void getApType(HttpServletRequest req, HttpServletResponse rep) {
		rep.setContentType("text/html;charset=utf-8");
		// 接收level和区域code
		String level = req.getParameter("level");
		if (level == null) {
			level = "";
		}
		int le = -1;
		if (!level.trim().equals("")) {
			le = Integer.parseInt(level);
		}
		String province = req.getParameter("province");
		if (province == null) {
			province = "";
		}
		String city = req.getParameter("city");
		if (city == null) {
			city = "";
		}
		String borough = req.getParameter("borough");
		if (borough == null) {
			borough = "";
		}
		String business = req.getParameter("business");
		if (business == null) {
			business = "";
		}
		String type = req.getParameter("type");
		try {
			province = new String(province.getBytes("ISO-8859-1"), "utf-8");
			city = new String(city.getBytes("ISO-8859-1"), "utf-8");
			borough = new String(borough.getBytes("ISO-8859-1"), "utf-8");
			business = new String(business.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Map map = new HashMap();
		map.put("province", province);
		map.put("city", city);
		map.put("business", business);
		map.put("borough", borough);
		map.put("type", type);
		if (le != -1) {
			map.put("level", level);
		}
		String dataSourceName = DbContextHolder.getDataSourceName("10000");
		DbContextHolder.setDbType(dataSourceName);
		List<ApType> countList = eyeService.getApType(map);
		DbContextHolder.clearDbType();
		// 将json数据传回
		String json = JSONArray.fromObject(countList).toString();
		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
	}

	public void getAreaPoi(HttpServletRequest req, HttpServletResponse rep) {
		rep.setContentType("text/html;charset=utf-8");
		// 接收level和区域code
		String level = req.getParameter("level");
		if (level == null) {
			level = "";
		}
		int le = -1;
		if (!level.trim().equals("")) {
			le = Integer.parseInt(level);
		}
		String province = req.getParameter("province");
		if (province == null) {
			province = "";
		}
		String city = req.getParameter("city");
		if (city == null) {
			city = "";
		}
		String borough = req.getParameter("borough");
		if (borough == null) {
			borough = "";
		}
		String business = req.getParameter("business");
		if (business == null) {
			business = "";
		}
		String type = req.getParameter("type");
		try {
			province = new String(province.getBytes("ISO-8859-1"), "utf-8");
			city = new String(city.getBytes("ISO-8859-1"), "utf-8");
			borough = new String(borough.getBytes("ISO-8859-1"), "utf-8");
			business = new String(business.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Map map = new HashMap();
		map.put("province", province);
		map.put("city", city);
		map.put("business", business);
		map.put("borough", borough);
		map.put("type", type);
		if (le != -1) {
			map.put("level", level);
		}
		String dataSourceName = DbContextHolder.getDataSourceName("10000");
		DbContextHolder.setDbType(dataSourceName);
		List<Poi> countList = eyeService.getPoi(map);
		DbContextHolder.clearDbType();
		JSONObject outJSON = new JSONObject();
		JSONObject group = new JSONObject();
		JSONObject activeFilters = new JSONObject();
		JSONArray refinements = new JSONArray();
		activeFilters.put("refinements", refinements);
		group.put("activeFilters", activeFilters);

		// 将json数据传回
		JSONArray results = new JSONArray();
		String strjson = "";
		// strjson+="{\"group\" : {\"activeFilters\" : {\"refinements\" : []},";
		// strjson+="\"results\" : [";
		for (int i = 0; i < countList.size(); i++) {
			Poi poi = countList.get(i);
			JSONObject result = new JSONObject();
			JSONObject venue = new JSONObject();
			String macclient = RandomMac.createRandomMacAddress("");
			venue.put("id", poi.getData_id());
			venue.put("name", poi.getName());

			JSONObject location = new JSONObject();
			location.put("address", poi.getAddress());
			location.put("lat", Float.valueOf(poi.getLan()).floatValue());
			location.put("lng", Float.valueOf(poi.getLng()).floatValue());
			location.put("distance", 10396715);
			location.put("cc", "CN");
			location.put("city", "CN");
			location.put("state", "CN");
			location.put("country", "CN");
			location.put("contextLine", "CN");
			JSONObject formattedAddress = new JSONObject();
			JSONArray jsonStrs = new JSONArray();
			String span = "<span itemprop=\"streetAddress\">7 Xiama Ling<\\/span>";
			jsonStrs.add(0, span);
			jsonStrs.add(1,
					"<span itemprop=\"addressLocality\">&#35199;&#23433;</span>");
			jsonStrs.add(0,
					"<span itemprop=\"addressRegion\">&#38485;&#35199;</span>");
			jsonStrs.add(0, "&#20013;&#22269;");
			location.put("formattedAddress", jsonStrs);
			venue.put("location", location);

			venue.put("canonicalUrl",
					"mall!foursqure_place.do?openPhotoId=51af6baa8bbd58e1e86315a7");
			venue.put("canonicalPath", "");

			JSONArray categories = new JSONArray();
			JSONObject categorie = new JSONObject();
			String cat = RandomMac.createRandomMacAddress("");
			categorie.put("id", cat);
			categorie.put("name", poi.getCategory_name());
			categorie.put("pluralName", poi.getCategory_name());
			categorie.put("shortName", poi.getCategory_name());

			JSONObject icon = new JSONObject();
			icon.put("prefix",
					"https://ss3.4sqi.net/img/categories_v2/food/default_");
			icon.put("mapPrefix",
					"https://ss3.4sqi.net/img/categories_map/food/default");
			icon.put("suffix", ".png");
			categorie.put("icon", icon);
			categories.add(categorie);
			venue.put("categories", categories);

			venue.put("verified", false);
			venue.put("restricted", true);

			JSONObject stats = new JSONObject();
			stats.put("checkinsCount", 1497);
			stats.put("usersCount", 1023);
			stats.put("tipCount", 34);
			venue.put("stats", stats);

			venue.put("urlSig", "koB58OhvZUmX6TjIjpkU5CZkcq8=");
			venue.put("rating", poi.getRating());
			venue.put("ratingColor", poi.getRatingColor());
			venue.put("ratingSignals", 75);

			JSONObject hereNow = new JSONObject();
			hereNow.put("count", 0);
			hereNow.put("summary", "Nobody here");
			hereNow.put("groups", new JSONArray());
			venue.put("hereNow", hereNow);

			JSONObject saves = new JSONObject();
			saves.put("count", 0);
			saves.put("groups", new JSONArray());
			venue.put("saves", saves);
			result.put("venue", venue);

			JSONObject photo = new JSONObject();
			photo.put("id", "51af6baa8bbd58e1e86315a7");
			photo.put("createdAt", 1370450858);
			photo.put("prefix", "https://irs3.4sqi.net/img/general/");
			photo.put("suffix",
					"/40558089_S3Qre8ct-uLnsab1hDvKJzVAcTq6r3WOOcFwsY5qX1A.jpg");
			photo.put("width", 802);
			photo.put("height", 533);

			JSONObject user = new JSONObject();
			user.put("id", "40558089");
			user.put("firstName", "Konrad");
			user.put("lastName", "Stefanowicz");
			user.put("gender", "male");
			user.put("canonicalUrl", "https://foursquare.com/user/40558089");
			user.put("canonicalPath", "/user/40558089");
			JSONObject photosub = new JSONObject();
			photosub.put("prefix", "https://irs3.4sqi.net/img/user/");
			photosub.put("suffix", "/WYGHH50J3JZI0FSA.jpg");
			user.put("photo", photosub);

			photo.put("user", user);
			photo.put("visibility", "public");
			result.put("photo", photo);
			// venue.put("photo", photo);

			// strjson+="{\"venue\" : {";
			// strjson+="\"id\":"+"\""+macclient;

			JSONObject snippets = new JSONObject();
			snippets.put("count", 1);
			JSONArray items = new JSONArray();
			JSONObject item = new JSONObject();
			JSONObject detail = new JSONObject();
			detail.put("type", "tip");
			JSONObject object = new JSONObject();
			object.put("id", "54237c23498ee3cbbcd9dcc1");
			object.put("createdAt", 1411611683);
			object.put("text", "Good for morning walk, biking as there are b");
			object.put("type", "user");
			object.put("canonicalUrl",
					"https://foursquare.com/item/54237c23498ee3cbbcd9dcc1");
			object.put("canonicalPath", "/item/54237c23498ee3cbbcd9dcc1");
			object.put("logView", true);
			JSONObject object_user = new JSONObject();
			object_user.put("id", "1115041");
			object_user.put("firstName", "Betty");
			object_user.put("lastName", "Leo");
			object_user.put("gender", "female");
			object_user.put("canonicalUrl",
					"https://foursquare.com/user/1115041");
			object_user.put("canonicalPath", "/user/1115041");
			JSONObject object_user_photo = new JSONObject();
			object_user_photo.put("prefix", "https://irs3.4sqi.net/img/user/");
			object_user_photo.put("suffix", "/WYGHH50J3JZI0FSA.jpg");
			object_user.put("photo", object_user_photo);
			detail.put("object", object);
			item.put("detail", detail);
			items.add(item);
			snippets.put("items", items);
			result.put("snippets", snippets);
			results.add(result);

		}
		group.put("results", results);
		group.put("totalResults", countList.size());
		outJSON.put("group", group);

		JSONObject context = new JSONObject();
		JSONObject currentLocation = new JSONObject();
		currentLocation.put("what", "");
		currentLocation.put("where", "xian shaanxi china");
		JSONObject feature = new JSONObject();
		feature.put("cc", "");
		feature.put("name", "Xi'an");
		feature.put("displayName", "Xi'an, Shaanxi, China");
		feature.put("matchedName", "Xi'an, Shaanxi, China");
		feature.put("highlightedName",
				"<b>Xi'an</b>, <b>Shaanxi</b>, <b>China</b>");
		feature.put("woeTypehighlightedName", 7);
		feature.put("slug", "xian");
		feature.put("id", "geonameid:1790630");
		feature.put("longId", "72057594039718566");
		JSONObject geometry = new JSONObject();
		JSONObject center = new JSONObject();
		center.put("lat", 34.25833);
		center.put("lng", 108.92861);
		geometry.put("center", center);

		JSONObject bounds = new JSONObject();
		JSONObject gne = new JSONObject();
		gne.put("lat", 34.29601660867529);
		gne.put("lng", 108.96609684726546);
		bounds.put("ne", gne);
		JSONObject gsw = new JSONObject();
		gsw.put("lat", 34.212866396769115);
		gsw.put("lng", 108.88953845779155);
		bounds.put("sw", gsw);
		geometry.put("bounds", bounds);
		feature.put("geometry", geometry);

		currentLocation.put("feature", feature);
		currentLocation.put("parents", new JSONArray());
		context.put("currentLocation", currentLocation);
		context.put("relatedNeighborhoods", new JSONArray());

		outJSON.put("context", context);

		outJSON.put("headerFullLocation", "Xi'an");
		outJSON.put("headerLocationGranularity", "city");

		JSONObject suggestedBounds = new JSONObject();
		JSONObject ne = new JSONObject();
		ne.put("lat", 34.29601660867529);
		ne.put("lng", 108.96609684726546);
		suggestedBounds.put("ne", ne);
		JSONObject sw = new JSONObject();
		sw.put("lat", 34.212866396769115);
		sw.put("lng", 108.88953845779155);
		suggestedBounds.put("sw", sw);
		outJSON.put("suggestedBounds", suggestedBounds);
		String json = outJSON.toString();
		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
	}

	@ResponseBody
	@RequestMapping(value = "/eye!getPoi.do")
	public void getPoi(HttpServletRequest req, HttpServletResponse rep) {
		rep.setContentType("text/html;charset=utf-8");
		// 接收level和区域code
		String level = req.getParameter("level");
		if (level == null) {
			level = "";
		}
		int le = -1;
		if (!level.trim().equals("")) {
			le = Integer.parseInt(level);
		}
		String province = req.getParameter("province");
		if (province == null) {
			province = "";
		}
		String city = req.getParameter("city");
		if (city == null) {
			city = "";
		}
		String borough = req.getParameter("borough");
		if (borough == null) {
			borough = "";
		}
		String business = req.getParameter("business");
		if (business == null) {
			business = "";
		}
		String type = req.getParameter("type");
		try {
			province = new String(province.getBytes("ISO-8859-1"), "utf-8");
			city = new String(city.getBytes("ISO-8859-1"), "utf-8");
			borough = new String(borough.getBytes("ISO-8859-1"), "utf-8");
			business = new String(business.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Map map = new HashMap();
		map.put("province", province);
		map.put("city", city);
		map.put("business", business);
		map.put("borough", borough);
		map.put("type", type);
		if (le != -1) {
			map.put("level", level);
		}
		String dataSourceName = DbContextHolder.getDataSourceName("10000");
		DbContextHolder.setDbType(dataSourceName);
		List<Poi> countList = eyeService.getPoi(map);
		DbContextHolder.clearDbType();
		JSONObject outJSON = new JSONObject();
		JSONObject group = new JSONObject();
		JSONObject activeFilters = new JSONObject();
		JSONArray refinements = new JSONArray();
		activeFilters.put("refinements", refinements);
		group.put("activeFilters", activeFilters);

		// 将json数据传回
		JSONArray results = new JSONArray();
		String strjson = "";
		// strjson+="{\"group\" : {\"activeFilters\" : {\"refinements\" : []},";
		// strjson+="\"results\" : [";
		for (int i = 0; i < countList.size(); i++) {
			Poi poi = countList.get(i);
			JSONObject result = new JSONObject();
			JSONObject venue = new JSONObject();
			String macclient = RandomMac.createRandomMacAddress("");
			venue.put("id", poi.getData_id());
			venue.put("name", poi.getName());

			JSONObject location = new JSONObject();
			location.put("address", poi.getAddress());
			location.put("lat", Float.valueOf(poi.getLan()).floatValue());
			location.put("lng", Float.valueOf(poi.getLng()).floatValue());
			location.put("distance", 10396715);
			location.put("cc", "CN");
			location.put("city", "CN");
			location.put("state", "CN");
			location.put("country", "CN");
			location.put("contextLine", "CN");
			JSONObject formattedAddress = new JSONObject();
			JSONArray jsonStrs = new JSONArray();
			String span = "<span itemprop=\"streetAddress\">7 Xiama Ling<\\/span>";
			jsonStrs.add(0, span);
			jsonStrs.add(1,
					"<span itemprop=\"addressLocality\">&#35199;&#23433;</span>");
			jsonStrs.add(0,
					"<span itemprop=\"addressRegion\">&#38485;&#35199;</span>");
			jsonStrs.add(0, "&#20013;&#22269;");
			location.put("formattedAddress", jsonStrs);
			venue.put("location", location);

			venue.put("canonicalUrl",
					"mall!foursqure_place.do?openPhotoId=51af6baa8bbd58e1e86315a7");
			venue.put("canonicalPath", "");

			JSONArray categories = new JSONArray();
			JSONObject categorie = new JSONObject();
			String cat = RandomMac.createRandomMacAddress("");
			categorie.put("id", cat);
			categorie.put("name", poi.getCategory_name());
			categorie.put("pluralName", poi.getCategory_name());
			categorie.put("shortName", poi.getCategory_name());

			JSONObject icon = new JSONObject();
			icon.put("prefix",
					"https://ss3.4sqi.net/img/categories_v2/food/default_");
			icon.put("mapPrefix",
					"https://ss3.4sqi.net/img/categories_map/food/default");
			icon.put("suffix", ".png");
			categorie.put("icon", icon);
			categories.add(categorie);
			venue.put("categories", categories);

			venue.put("verified", false);
			venue.put("restricted", true);

			JSONObject stats = new JSONObject();
			stats.put("checkinsCount", 1497);
			stats.put("usersCount", 1023);
			stats.put("tipCount", 34);
			venue.put("stats", stats);

			venue.put("urlSig", "koB58OhvZUmX6TjIjpkU5CZkcq8=");
			venue.put("rating", poi.getRating());
			venue.put("ratingColor", poi.getRatingColor());
			venue.put("ratingSignals", 75);

			JSONObject hereNow = new JSONObject();
			hereNow.put("count", 0);
			hereNow.put("summary", "Nobody here");
			hereNow.put("groups", new JSONArray());
			venue.put("hereNow", hereNow);

			JSONObject saves = new JSONObject();
			saves.put("count", 0);
			saves.put("groups", new JSONArray());
			venue.put("saves", saves);
			result.put("venue", venue);

			JSONObject photo = new JSONObject();
			photo.put("id", "51af6baa8bbd58e1e86315a7");
			photo.put("createdAt", 1370450858);
			photo.put("prefix", "https://irs3.4sqi.net/img/general/");
			photo.put("suffix",
					"/40558089_S3Qre8ct-uLnsab1hDvKJzVAcTq6r3WOOcFwsY5qX1A.jpg");
			photo.put("width", 802);
			photo.put("height", 533);

			JSONObject user = new JSONObject();
			user.put("id", "40558089");
			user.put("firstName", "Konrad");
			user.put("lastName", "Stefanowicz");
			user.put("gender", "male");
			user.put("canonicalUrl", "https://foursquare.com/user/40558089");
			user.put("canonicalPath", "/user/40558089");
			JSONObject photosub = new JSONObject();
			photosub.put("prefix", "https://irs3.4sqi.net/img/user/");
			photosub.put("suffix", "/WYGHH50J3JZI0FSA.jpg");
			user.put("photo", photosub);

			photo.put("user", user);
			photo.put("visibility", "public");
			result.put("photo", photo);
			// venue.put("photo", photo);

			// strjson+="{\"venue\" : {";
			// strjson+="\"id\":"+"\""+macclient;

			JSONObject snippets = new JSONObject();
			snippets.put("count", 1);
			JSONArray items = new JSONArray();
			JSONObject item = new JSONObject();
			JSONObject detail = new JSONObject();
			detail.put("type", "tip");
			JSONObject object = new JSONObject();
			object.put("id", "54237c23498ee3cbbcd9dcc1");
			object.put("createdAt", 1411611683);
			object.put("text", "Good for morning walk, biking as there are b");
			object.put("type", "user");
			object.put("canonicalUrl",
					"https://foursquare.com/item/54237c23498ee3cbbcd9dcc1");
			object.put("canonicalPath", "/item/54237c23498ee3cbbcd9dcc1");
			object.put("logView", true);
			JSONObject object_user = new JSONObject();
			object_user.put("id", "1115041");
			object_user.put("firstName", "Betty");
			object_user.put("lastName", "Leo");
			object_user.put("gender", "female");
			object_user.put("canonicalUrl",
					"https://foursquare.com/user/1115041");
			object_user.put("canonicalPath", "/user/1115041");
			JSONObject object_user_photo = new JSONObject();
			object_user_photo.put("prefix", "https://irs3.4sqi.net/img/user/");
			object_user_photo.put("suffix", "/WYGHH50J3JZI0FSA.jpg");
			object_user.put("photo", object_user_photo);
			detail.put("object", object);
			item.put("detail", detail);
			items.add(item);
			snippets.put("items", items);
			result.put("snippets", snippets);
			results.add(result);

		}
		group.put("results", results);
		group.put("totalResults", countList.size());
		outJSON.put("group", group);

		JSONObject context = new JSONObject();
		JSONObject currentLocation = new JSONObject();
		currentLocation.put("what", "");
		currentLocation.put("where", "xian shaanxi china");
		JSONObject feature = new JSONObject();
		feature.put("cc", "");
		feature.put("name", "Xi'an");
		feature.put("displayName", "Xi'an, Shaanxi, China");
		feature.put("matchedName", "Xi'an, Shaanxi, China");
		feature.put("highlightedName",
				"<b>Xi'an</b>, <b>Shaanxi</b>, <b>China</b>");
		feature.put("woeTypehighlightedName", 7);
		feature.put("slug", "xian");
		feature.put("id", "geonameid:1790630");
		feature.put("longId", "72057594039718566");
		JSONObject geometry = new JSONObject();
		JSONObject center = new JSONObject();
		center.put("lat", 34.25833);
		center.put("lng", 108.92861);
		geometry.put("center", center);

		JSONObject bounds = new JSONObject();
		JSONObject gne = new JSONObject();
		gne.put("lat", 34.29601660867529);
		gne.put("lng", 108.96609684726546);
		bounds.put("ne", gne);
		JSONObject gsw = new JSONObject();
		gsw.put("lat", 34.212866396769115);
		gsw.put("lng", 108.88953845779155);
		bounds.put("sw", gsw);
		geometry.put("bounds", bounds);
		feature.put("geometry", geometry);

		currentLocation.put("feature", feature);
		currentLocation.put("parents", new JSONArray());
		context.put("currentLocation", currentLocation);
		context.put("relatedNeighborhoods", new JSONArray());

		outJSON.put("context", context);

		outJSON.put("headerFullLocation", "Xi'an");
		outJSON.put("headerLocationGranularity", "city");

		JSONObject suggestedBounds = new JSONObject();
		JSONObject ne = new JSONObject();
		ne.put("lat", 34.29601660867529);
		ne.put("lng", 108.96609684726546);
		suggestedBounds.put("ne", ne);
		JSONObject sw = new JSONObject();
		sw.put("lat", 34.212866396769115);
		sw.put("lng", 108.88953845779155);
		suggestedBounds.put("sw", sw);
		outJSON.put("suggestedBounds", suggestedBounds);
		String json = outJSON.toString();
		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
	}

	@ResponseBody
	@RequestMapping(value = "/eye!getHtmlPoi.do")
	public void getHtmlPoi(HttpServletRequest req, HttpServletResponse rep) {
		rep.setContentType("text/html;charset=utf-8");
		// 接收level和区域code
		String level = req.getParameter("level");
		if (level == null) {
			level = "";
		}
		int le = -1;
		if (!level.trim().equals("")) {
			le = Integer.parseInt(level);
		}
		String province = req.getParameter("province");
		if (province == null) {
			province = "";
		}
		String city = req.getParameter("city");
		if (city == null) {
			city = "";
		}
		String borough = req.getParameter("borough");
		if (borough == null) {
			borough = "";
		}
		String business = req.getParameter("business");
		if (business == null) {
			business = "";
		}
		String type = req.getParameter("type");
		try {
			province = new String(province.getBytes("ISO-8859-1"), "utf-8");
			city = new String(city.getBytes("ISO-8859-1"), "utf-8");
			borough = new String(borough.getBytes("ISO-8859-1"), "utf-8");
			business = new String(business.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Map map = new HashMap();
		map.put("province", province);
		map.put("city", city);
		map.put("business", business);
		map.put("borough", borough);
		map.put("type", type);
		if (le != -1) {
			map.put("level", level);
		}
		String dataSourceName = DbContextHolder.getDataSourceName("10000");
		DbContextHolder.setDbType(dataSourceName);
		List<Poi> countList = eyeService.getPoi(map);
		DbContextHolder.clearDbType();

		String strjson = "";
		// strjson+="{\"group\" : {\"activeFilters\" : {\"refinements\" : []},";
		// strjson+="\"results\" : [";
		for (int i = 0; i < countList.size(); i++) {
			Poi poi = countList.get(i);
			strjson += "<li class=\"card singleRecommendation hasPhoto tipWithLogging\"";
			strjson += "		data-id=\"" + poi.getData_id() + "\"";
			strjson += "		data-tipid=\"54237c23498ee3cbbcd9dcc1\"><div";
			strjson += "			class=\"indexCol\">";
			strjson += "				<span class=\"venueIndex\">" + (i + 1) + ".</span>";
			strjson += "			<div class=\"outOfBoundsContainer\"></div>";
			strjson += "</div>";
			strjson += "<div class=\"contentHolder\">";
			strjson += "<div class=\"infoCol\">";
			strjson += "<div class=\"venueBlock\">";
			strjson += "<div class=\"venueDetails\">";
			strjson += "<div class=\"venueName\">";
			strjson += "<h2>";
			strjson += "<a ";
			strjson += " href=\"mall!foursqure_place.do?data_id="+poi.getData_id()+"\"";
			strjson += "target=\"_blank\">" + poi.getName() + "</a>";
			strjson += "</h2>";
			strjson += "</div>";
			strjson += "<div class=\"venueMeta\">";
			strjson += "<div class=\"venueScore positive\" title=\"\">"
					+ poi.getRating() + "</div>";
			strjson += "<div class=\"venueAddressData\">";
			strjson += "<div class=\"venueAddress\">" + poi.getAddress()
					+ "</div>";
			strjson += "<div class=\"venueData\">";
			strjson += "<span class=\"venueDataItem\"><span";
			strjson += "class=\"categoryName\">" + poi.getCategory_name()
					+ "</span><span";
			strjson += "class=\"delim\"> • </span></span>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "<div class=\"detail tips \" style=\"display: none\">";
			strjson += "<ul class=\"tips\">";
			strjson += "<li class=\"tip\"><div class=\"avatar\">";
			strjson += "<img";
			strjson += "src=\"${ctx}/source/js/foursqure/AIGGM5IFNTOP14PZ.jpg\"";
			strjson += "alt=\"Betty L.\" class=\"avatar \" width=\"64\" height=\"64\"";
			strjson += "title=\"Betty L.\"";
			strjson += "data-retina-url=\"https://irs0.4sqi.net/img/user/128x128/AIGGM5IFNTOP14PZ.jpg\">";
			strjson += "</div>";
			strjson += "<p class=\"tipText\" style=\"display: none\">";
			strjson += "<span class=\"tipAuthor \"><a class=\"userName\"";
			strjson += "href=\"https://foursquare.com/user/1115041\"";
			strjson += "	target=\"_blank\">Betty L.</a> • September 25, 2014</span>Good";
			strjson += "for morning walk, biking as there are bicycles for rent!";
			strjson += "Rmb54 per entry per person.";
			strjson += "</p></li>";
			strjson += "</ul>";
			strjson += "</div>";
			strjson += "<div class=\"resultFooter\" style=\"display: none\">";
			strjson += "<div class=\"buttons\">";
			strjson += "<div class=\"save-button  inactive\">";
			strjson += "<span class=\"icon\"></span><span class=\"label\">Save</span>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "<div class=\"photoCol\">";
			strjson += "<div class=\"photoContainer\">";
			strjson += "<img class=\"photo\"";
			strjson += "src=\"" + poi.getImg() + "\"";
			;
			strjson += "photo-id=\"51af6baa8bbd58e1e86315a7\" width=\"300\"";
			strjson += "height=\"300\" alt=\"\"";
			strjson += "data-retina-url=\"https://irs3.4sqi.net/img/general/600x600/40558089_S3Qre8ct-uLnsab1hDvKJzVAcTq6r3WOOcFwsY5qX1A.jpg\">";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div></li>";

		}
		String json = strjson;
		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
	}

	public String geAreatHtml(String level, String province, String city,
			String borough, String business, String type) {

		if (level == null) {
			level = "";
		}
		int le = -1;
		if (!level.trim().equals("")) {
			le = Integer.parseInt(level);
		}

		if (province == null) {
			province = "";
		}

		if (city == null) {
			city = "";
		}

		if (borough == null) {
			borough = "";
		}

		if (business == null) {
			business = "";
		}

		try {
			province = new String(province.getBytes("ISO-8859-1"), "utf-8");
			city = new String(city.getBytes("ISO-8859-1"), "utf-8");
			borough = new String(borough.getBytes("ISO-8859-1"), "utf-8");
			business = new String(business.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Map map = new HashMap();
		map.put("province", province);
		map.put("city", city);
		map.put("business", business);
		map.put("borough", borough);
		map.put("type", type);
		if (le != -1) {
			map.put("level", level);
		}
		String dataSourceName = DbContextHolder.getDataSourceName("10000");
		DbContextHolder.setDbType(dataSourceName);
		List<Poi> countList = eyeService.getPoi(map);
		DbContextHolder.clearDbType();

		String strjson = "";
		// strjson+="{\"group\" : {\"activeFilters\" : {\"refinements\" : []},";
		// strjson+="\"results\" : [";
		for (int i = 0; i < countList.size(); i++) {
			Poi poi = countList.get(i);
			strjson += "<li class=\"card singleRecommendation hasPhoto tipWithLogging\"";
			strjson += "		data-id=\"" + poi.getData_id() + "\"";
			strjson += "		data-tipid=\"54237c23498ee3cbbcd9dcc1\"><div";
			strjson += "			class=\"indexCol\">";
			strjson += "				<span class=\"venueIndex\">" + (i + 1) + ".</span>";
			strjson += "			<div class=\"outOfBoundsContainer\"></div>";
			strjson += "</div>";
			strjson += "<div class=\"contentHolder\">";
			strjson += "<div class=\"infoCol\">";
			strjson += "<div class=\"venueBlock\">";
			strjson += "<div class=\"venueDetails\">";
			strjson += "<div class=\"venueName\">";
			strjson += "<h2>";
			strjson += "<a ";
			strjson += " href=\"mall!foursqure_place.do?data_id="+poi.getData_id()+"\"";
			strjson += " target=\"_blank\">" + poi.getName() + "</a>";
			strjson += "</h2>";
			strjson += "</div>";
			strjson += "<div class=\"venueMeta\">";
			strjson += "<div class=\"venueScore positive\" title=\"\">"
					+ poi.getRating() + "</div>";
			strjson += "<div class=\"venueAddressData\">";
			strjson += "<div class=\"venueAddress\">" + poi.getAddress()
					+ "</div>";
			strjson += "<div class=\"venueData\">";
			strjson += "<span class=\"venueDataItem\"><span";
			strjson += "class=\"categoryName\">" + poi.getCategory_name()
					+ "</span><span";
			strjson += "class=\"delim\"> • </span></span>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "<div class=\"detail tips \" style=\"display: none\">";
			strjson += "<ul class=\"tips\">";
			strjson += "<li class=\"tip\"><div class=\"avatar\">";
			strjson += "<img";
			strjson += "src=\"${ctx}/source/js/foursqure/AIGGM5IFNTOP14PZ.jpg\"";
			strjson += "alt=\"Betty L.\" class=\"avatar \" width=\"64\" height=\"64\"";
			strjson += "title=\"Betty L.\"";
			strjson += "data-retina-url=\"https://irs0.4sqi.net/img/user/128x128/AIGGM5IFNTOP14PZ.jpg\">";
			strjson += "</div>";
			strjson += "<p class=\"tipText\" style=\"display: none\">";
			strjson += "<span class=\"tipAuthor \"><a class=\"userName\"";
			strjson += "href=\"https://foursquare.com/user/1115041\"";
			strjson += "	target=\"_blank\">Betty L.</a> • September 25, 2014</span>Good";
			strjson += "for morning walk, biking as there are bicycles for rent!";
			strjson += "Rmb54 per entry per person.";
			strjson += "</p></li>";
			strjson += "</ul>";
			strjson += "</div>";
			strjson += "<div class=\"resultFooter\" style=\"display: none\">";
			strjson += "<div class=\"buttons\">";
			strjson += "<div class=\"save-button  inactive\">";
			strjson += "<span class=\"icon\"></span><span class=\"label\">Save</span>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "<div class=\"photoCol\">";
			strjson += "<div class=\"photoContainer\">";
			strjson += "<img class=\"photo\"";
			strjson += "src=\"" + poi.getImg() + "\"";
			;
			strjson += "photo-id=\"51af6baa8bbd58e1e86315a7\" width=\"300\"";
			strjson += "height=\"300\" alt=\"\"";
			strjson += "data-retina-url=\"https://irs3.4sqi.net/img/general/600x600/40558089_S3Qre8ct-uLnsab1hDvKJzVAcTq6r3WOOcFwsY5qX1A.jpg\">";
			strjson += "</div>";
			strjson += "</div>";
			strjson += "</div></li>";

		}
		return strjson;

	}

	@RequestMapping(value = "/mall!foursqure.do", method = RequestMethod.GET)
	public ModelAndView foursqure(HttpServletRequest request) {
		// 创建HttpClient实例

		ModelAndView view = new ModelAndView(
				"source/page/foursqure/foursqure.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!foursqure_city.do", method = RequestMethod.GET)
	public ModelAndView getfoursqurecity(HttpServletRequest request) {
		// 创建HttpClient实例

		ModelAndView view = new ModelAndView(
				"source/page/foursqure/city_index.jsp");
		return view;
	}

	@RequestMapping(value = "/mall!city.do", method = RequestMethod.GET)
	public ModelAndView getcity(HttpServletRequest request) {
		// 创建HttpClient实例

		ModelAndView view = new ModelAndView("source/page/foursqure/city.jsp");
		request.setAttribute("jsp", "alert(\"test\")");
		return view;
	}

	@RequestMapping(value = "/mall!foursqure_place.do", method = RequestMethod.GET)
	public ModelAndView getfoursqureplace(HttpServletRequest request) {
		// 创建HttpClient实例

		Map map = new HashMap();
		String data_id = request.getParameter("data_id");
		if (data_id == null) {
			data_id = "";
		}
		map.put("data_id", data_id);
		String dataSourceName = DbContextHolder.getDataSourceName("10000");
		DbContextHolder.setDbType(dataSourceName);
		List<Poi> countList = eyeService.getPoi(map);
		String photosHtml = "";
		String name="";
		String category="";
		String streetAddress="";
		int total_visitors=0;
		int total_visits=0;
		if (countList.size() > 0) {
			Poi poi = countList.get(0);
			name=poi.getName();
			category=poi.getCategory_name();
			streetAddress=poi.getAddress();
			String photos = poi.getPhotos();
			total_visits=poi.getTotal_visits();
			total_visitors=poi.getTotal_visitors();
			if (photos!=null && !"".equals(photos)) {
				String[] arrPhoto = photos.split(",");
				for (int i = 0; i < arrPhoto.length && i < 4; i++) {
					photosHtml += "<li class=\"photo photoWithContent\"";
					photosHtml += "		data-photoid=\"51af6baa8bbd58e1e86315a7\"><img";
					photosHtml += "		src=\"/wifiplatform/source/js/foursqure/40558089_S3Qre8ct-uLnsab1hDvKJzVAcTq6r3WOOcFwsY5qX1A.jpg\"";
					photosHtml += "		photo-id=\"51af6baa8bbd58e1e86315a7\" width=\"152\" height=\"152\"";
					photosHtml += "		alt=\"Photo taken at 西安城墙 Xi&amp;#39;an City Wall by Konrad S. on 6/5/2013\"";
					photosHtml += "		data-retina-url=\"https://irs3.4sqi.net/img/general/304x304/40558089_S3Qre8ct-uLnsab1hDvKJzVAcTq6r3WOOcFwsY5qX1A.jpg\"></li>";
				}
			}
		}
		DbContextHolder.clearDbType();
		request.setAttribute("photos", photosHtml);
		request.setAttribute("name", name);
		request.setAttribute("category", category);
		request.setAttribute("streetAddress", streetAddress);
		request.setAttribute("total_visitors", total_visitors);
		request.setAttribute("total_visits", total_visits);
		ModelAndView view = new ModelAndView("source/page/foursqure/place.jsp");
		return view;
	}

}
