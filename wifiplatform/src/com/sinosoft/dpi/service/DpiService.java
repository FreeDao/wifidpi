package com.sinosoft.dpi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import com.sinosoft.dpi.bean.AppInfo;
import com.sinosoft.onclien.bean.Connections;

public interface DpiService {
	/**
	 * 查询在线客户
	 * @param map
	 * @return
	 */
	public List<HashMap> getAppinfo(Map map);
	public DataSource  getSource();
}
