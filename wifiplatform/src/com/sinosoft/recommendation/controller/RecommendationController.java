package com.sinosoft.recommendation.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.util.JSONTokener;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HTTP;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sinosoft.base.controller.BaseController;
import com.sun.org.apache.xml.internal.security.utils.Base64;

@Controller
public class RecommendationController extends BaseController {
	private static final String HMAC_SHA1 = "HmacSHA1";
	private static final String Key = "h2Yrr0tVrgPSw1AI8hwjpoh6KqSRfxWK&";

	/**
	 * 生成签名数据
	 * 
	 * @param data
	 *            待加密的数据
	 * @param key
	 *            加密使用的key
	 * @return 生成MD5编码的字符串
	 * @throws InvalidKeyException
	 * @throws NoSuchAlgorithmException
	 */
	public static String getSignature(byte[] data, byte[] key)
			throws InvalidKeyException, NoSuchAlgorithmException {
		SecretKeySpec signingKey = new SecretKeySpec(key, HMAC_SHA1);
		Mac mac = Mac.getInstance(HMAC_SHA1);
		mac.init(signingKey);
		byte[] rawHmac = mac.doFinal(data);
		return Base64.encode(rawHmac);
	}

	public static String get_captcha(String url,String mobile) {

		HttpClient client = new DefaultHttpClient();
		String time1 = Long.toString(new Date().getTime());
		String data = "mobile="+mobile+"&use_type=3&z=" + time1;
		HttpGet get = new HttpGet(url + "?" + data);
		get.addHeader("Api-Version", "1.0");
		get.addHeader("Client-OS", "3");
		get.addHeader("Client-Type", "3");
		get.addHeader("Nonce", "1234");
		get.addHeader("Sign-Method", "HMAC-SHA1");
		get.addHeader("TimeStamp", time1);

		String params = "Api-Version=1.0&Client-OS=3&Client-Type=3&Nonce=1234&Sign-Method=HMAC-SHA1&TimeStamp="
				+ time1;
		params += "&" + data;
		String encode = URLEncoder.encode(params);
		String sig = "";
		try {
			sig = getSignature(encode.getBytes("UTF-8"), Key.getBytes("UTF-8"));
		} catch (InvalidKeyException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		get.addHeader("Sign", sig);
		params += "&Sign=" + sig;

		JSONObject json = null;
		String str = "";
		try {
			HttpResponse res = client.execute(get);
			if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				HttpEntity entity = res.getEntity();
				InputStreamReader inSm = new InputStreamReader(
						entity.getContent(), HTTP.UTF_8);
				Scanner inScn = new Scanner(inSm);
				while (inScn.hasNextLine()) {
					str += inScn.nextLine();
				}
				System.out.println(str);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			// 关闭连接 ,释放资源
			client.getConnectionManager().shutdown();
		}
		
		return str;
	}
	
	public static String Verification(String url,HttpServletRequest req) {

		HttpClient client = new DefaultHttpClient();
		String mobile=req.getParameter("mobile");
		String ap_address=req.getParameter("ap_address");
		String ap_mac=req.getParameter("ap_mac");
		String captcha=req.getParameter("captcha");
		String client_mac=req.getParameter("client_mac");
		String gw_port=req.getParameter("gw_port");
		String user_ip=req.getParameter("user_ip");
		String time1 = Long.toString(new Date().getTime());

		String data = "ap_address="+ap_address;
		data += "&ap_mac="+ap_mac;
		data += "&captcha="+captcha;
		data += "&client_mac="+client_mac;
		data += "&gw_port="+gw_port;
		data += "&mobile="+mobile;
		data += "&user_ip="+user_ip;
		data += "&z=" + time1;
		//data = "ap_address=192.168.1.1&ap_mac=808100673E88&captcha=5560&client_mac=A44E31B48B1C&gw_port=88&mobile=13810139056&user_ip=undefined&z=1416455037129";
		HttpGet get = new HttpGet(url + "?" + data);
		get.addHeader("Api-Version", "1.0");
		get.addHeader("Client-OS", "3");
		get.addHeader("Client-Type", "3");
		get.addHeader("Nonce", "61356783");
		get.addHeader("Sign-Method", "HMAC-SHA1");
		get.addHeader("TimeStamp", time1);

		String params = "Api-Version=1.0&Client-OS=3&Client-Type=3&Nonce=61356783&Sign-Method=HMAC-SHA1&TimeStamp="
				+ time1;
		params += "&" + data;
		//params = "Api-Version=1.0&Client-OS=3&Client-Type=3&Nonce=61356783&Sign-Method=HMAC-SHA1&TimeStamp=1416455036389&ap_address=192.168.1.1&ap_mac=808100673E88&captcha=5560&client_mac=A44E31B48B1C&gw_port=88&mobile=13810139056&user_ip=undefined&z=1416455037129";
		String encode = URLEncoder.encode(params);
		String sig = "";
		try {
			sig = getSignature(encode.getBytes("UTF-8"), Key.getBytes("UTF-8"));
		} catch (InvalidKeyException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		get.addHeader("Sign", sig);


		JSONObject json = null;
		String str = "";
		try {
			HttpResponse res = client.execute(get);
			if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				HttpEntity entity = res.getEntity();
				InputStreamReader inSm = new InputStreamReader(
						entity.getContent(), HTTP.UTF_8);
				Scanner inScn = new Scanner(inSm);
				while (inScn.hasNextLine()) {
					str += inScn.nextLine();
				}
				System.out.println(str);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			// 关闭连接 ,释放资源
			client.getConnectionManager().shutdown();
		}
		
		return str;
	}

	public static String getitems(String url,HttpServletRequest req) {

		HttpClient client = new DefaultHttpClient();
	
		String data = "tenantid=EASYREC_DEMO&itemid=43&apikey=8ab9dc3ffcdac576d0f298043a60517a";
		
		HttpGet get = new HttpGet(url + "?" + data);
		

		JSONObject json = null;
		String str = "";
		try {
			HttpResponse res = client.execute(get);
			if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				HttpEntity entity = res.getEntity();
				InputStreamReader inSm = new InputStreamReader(
						entity.getContent(), HTTP.UTF_8);
				Scanner inScn = new Scanner(inSm);
				while (inScn.hasNextLine()) {
					str += inScn.nextLine();
				}
				System.out.println(str);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally {
			// 关闭连接 ,释放资源
			client.getConnectionManager().shutdown();
		}
		
		return str;
	}
	
	@RequestMapping(value = "getcaptcha", method = RequestMethod.GET)
	public String getcaptcha(HttpServletRequest req,HttpServletResponse rep)
			throws InvalidKeyException, NoSuchAlgorithmException {
		rep.setContentType("textml;charset=utf-8");
		String mobile=req.getParameter("mobile");
		// 要传递的参数.
		String str = get_captcha("http://42.123.76.46/ctbri-api/csec/captcha.json", mobile);
		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
		return str;
	}
	
	
	@RequestMapping(value = "loginin", method = RequestMethod.GET)
	public String loginin(HttpServletRequest req,HttpServletResponse rep)
			throws InvalidKeyException, NoSuchAlgorithmException {
		rep.setContentType("textml;charset=utf-8");
		String mobile=req.getParameter("mobile");
		// 要传递的参数.
		String str = Verification("http://42.123.76.46/ctbri-api/ap/ctbri/sign_in_noad.json",req);
		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
		return str;
	}
	
	@RequestMapping(value = "items", method = RequestMethod.GET)
	public String items(HttpServletRequest req,HttpServletResponse rep)
			throws InvalidKeyException, NoSuchAlgorithmException {
		rep.setContentType("textml;charset=utf-8");
		// 要传递的参数.
		String str = getitems("http://42.123.76.22:8080/easyrec-web/api/1.0/json/otherusersalsoviewed",req);
		PrintWriter out = null;
		try {
			out = rep.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.close();
			}
		}
		return str;
	}

	/**
	 * 界面初始化
	 * 
	 * @param req
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeyException
	 */
	@RequestMapping(value = "recommendation", method = RequestMethod.GET)
	public ModelAndView recommendation(HttpServletRequest req)
			throws InvalidKeyException, NoSuchAlgorithmException {
		ModelAndView view = new ModelAndView(
				"/source/page/recommendation/index.jsp");
		return view;
	}
	
	@RequestMapping(value = "push", method = RequestMethod.GET)
	public ModelAndView push(HttpServletRequest req)
			throws InvalidKeyException, NoSuchAlgorithmException {
		ModelAndView view = new ModelAndView(
				"/source/page/recommendation/push.jsp");
		return view;
	}
	
	@RequestMapping(value = "item", method = RequestMethod.GET)
	public ModelAndView item(HttpServletRequest req)
			throws InvalidKeyException, NoSuchAlgorithmException {
		ModelAndView view = new ModelAndView(
				"/source/page/recommendation/item.jsp");
		return view;
	}
	
	@RequestMapping(value = "template", method = RequestMethod.GET)
	public ModelAndView template(HttpServletRequest req)
			throws InvalidKeyException, NoSuchAlgorithmException {
		ModelAndView view = new ModelAndView(
				"/source/page/recommendation/recd.jsp");
		return view;
	}


}
