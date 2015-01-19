package com.sinosoft.dpi.controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sinosoft.account.bean.Account;
import com.sinosoft.account.bean.AccountDistrictRel;
import com.sinosoft.account.bean.GrowthTotal;
import com.sinosoft.base.controller.BaseController;
import com.sinosoft.dataSource.DbContextHolder;
import com.sinosoft.dpi.dao.DpiDao;
import com.sinosoft.dpi.service.DpiService;
import com.sinosoft.onclien.service.OnclienService;

@Controller
public class DpiController  extends BaseController {
	@Autowired
	private DpiService dpiService;
	/**
	 * 首页显示
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/app!application.do",method=RequestMethod.GET)
	public ModelAndView homePage(HttpServletRequest request){
		DbContextHolder.clearDbType();
		//得到用户
		Account account = (Account) request.getSession().getAttribute("user");
		List<GrowthTotal> gTs = new ArrayList<GrowthTotal>();
		List<GrowthTotal> growthTotals = new ArrayList<GrowthTotal>();
		//AP数
		long apTotal = 0l;
		//在线数
		long onLineNum = 0l;
		//客户数
		long customerNum = 0l;
		
		
		ModelAndView view = new ModelAndView("source/page/appstatistics.jsp");
		//在线比
		int onLineRes = apTotal == 0l ? 0 : (int) ((onLineNum*100)/apTotal);
		view.addObject("apTotal",apTotal );
		view.addObject("customerNum",customerNum);
		view.addObject("onLineRes",onLineRes);
		view.addObject("adrs",growthTotals);
		return view;
	}
	
	/**
	 * 首页显示
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/app!searchmap.do",method=RequestMethod.GET)
	public ModelAndView searchmap(HttpServletRequest request){
		DbContextHolder.clearDbType();
		//得到用户
		Account account = (Account) request.getSession().getAttribute("user");
		List<GrowthTotal> gTs = new ArrayList<GrowthTotal>();
		List<GrowthTotal> growthTotals = new ArrayList<GrowthTotal>();
		//AP数
		long apTotal = 0l;
		//在线数
		long onLineNum = 0l;
		//客户数
		long customerNum = 0l;
		
		
		ModelAndView view = new ModelAndView("source/page/dpi/searchmap.jsp");
		//在线比
		int onLineRes = apTotal == 0l ? 0 : (int) ((onLineNum*100)/apTotal);
		view.addObject("apTotal",apTotal );
		view.addObject("customerNum",customerNum);
		view.addObject("onLineRes",onLineRes);
		view.addObject("adrs",growthTotals);
		return view;
	}
	
	/**
	 * 首页显示
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/app!usertrace.do",method=RequestMethod.GET)
	public ModelAndView usertrace(HttpServletRequest request){
		DbContextHolder.clearDbType();
		//得到用户
		Account account = (Account) request.getSession().getAttribute("user");
		List<GrowthTotal> gTs = new ArrayList<GrowthTotal>();
		List<GrowthTotal> growthTotals = new ArrayList<GrowthTotal>();
		//AP数
		long apTotal = 0l;
		//在线数
		long onLineNum = 0l;
		//客户数
		long customerNum = 0l;
		
		
		ModelAndView view = new ModelAndView("source/page/dpi/usertrace.jsp");
		//在线比
		int onLineRes = apTotal == 0l ? 0 : (int) ((onLineNum*100)/apTotal);
		view.addObject("apTotal",apTotal );
		view.addObject("customerNum",customerNum);
		view.addObject("onLineRes",onLineRes);
		view.addObject("adrs",growthTotals);
		return view;
	}
	
	

	/**
	 * 首页显示
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/app!hotspot.do",method=RequestMethod.GET)
	public ModelAndView hotspot(HttpServletRequest request){
		DbContextHolder.clearDbType();
		//得到用户
		Account account = (Account) request.getSession().getAttribute("user");
		List<GrowthTotal> gTs = new ArrayList<GrowthTotal>();
		List<GrowthTotal> growthTotals = new ArrayList<GrowthTotal>();
		//AP数
		long apTotal = 0l;
		//在线数
		long onLineNum = 0l;
		//客户数
		long customerNum = 0l;
		
		
		ModelAndView view = new ModelAndView("source/page/dpi/hotspot.jsp");
		//在线比
		int onLineRes = apTotal == 0l ? 0 : (int) ((onLineNum*100)/apTotal);
		view.addObject("apTotal",apTotal );
		view.addObject("customerNum",customerNum);
		view.addObject("onLineRes",onLineRes);
		view.addObject("adrs",growthTotals);
		return view;
	}
	
	/**
	 * 图表初始化AP总数
	 * @param req
	 * @param rep
	 */
	@ResponseBody
	@RequestMapping(value = "/dpi!initAPChart.do")
	public void initDpiChart(HttpServletRequest req, HttpServletResponse rep) {
		rep.setContentType("text/html;charset=utf-8");
		List<HashMap> resultList = new ArrayList<HashMap>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("apdatabase", "gateway_2");
		DbContextHolder.setDbType("dataSource_dpi");
		String json ="";
	
		//dpiDao
		// 驱动程序名
        String driver = "com.mysql.jdbc.Driver";

        // URL指向要访问的数据库名scutcs
        String url = "jdbc:mysql://42.123.76.25:3306/gateway_2";

        // MySQL配置时的用户名
        String user = "root"; 

        // MySQL配置时的密码
        String password = "admin";
        
		String sql = "select app.app_id,cf.name_cn ,app.group_id ,count(*) as num    from gateway_2.terminalAppRecord as app  ,config.appconfig as cf     where cf.app_id = app.app_id GROUP by app.app_id";
        Connection  conn = null;        
        try {
        	try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	conn = DriverManager.getConnection(url, user, password);
			
			PreparedStatement ps = conn.prepareStatement(sql);  
			ResultSet rset= ps.executeQuery();  
			json = resultSetToJson(rset);
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
		//resultList = dpiService.getAppinfo(map);
		DbContextHolder.clearDbType();
		
		
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
    public String resultSetToJson(ResultSet rs) throws SQLException,JSONException
    {
       // json数组
       JSONArray array = new JSONArray();
      
       // 获取列数
       ResultSetMetaData metaData = rs.getMetaData();
       int columnCount = metaData.getColumnCount();
      
       // 遍历ResultSet中的每条数据
        while (rs.next()) {
            JSONObject jsonObj = new JSONObject();
           
            // 遍历每一列
            for (int i = 1; i <= columnCount; i++) {
                String columnName =metaData.getColumnLabel(i);
                String value = rs.getString(columnName);
                jsonObj.put(columnName, value);
            } 
            array.add(jsonObj); 
        }
      
       return array.toString();
    }

}
