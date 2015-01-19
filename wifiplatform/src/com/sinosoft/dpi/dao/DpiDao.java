package com.sinosoft.dpi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import com.sinosoft.dpi.bean.AppInfo;

public interface DpiDao {

	/**
	 * 查询在线客户
	 * @param account
	 * @return
	 */	
	public List<HashMap> getAppinfo(Map map);
	public DataSource  getSource();

}
