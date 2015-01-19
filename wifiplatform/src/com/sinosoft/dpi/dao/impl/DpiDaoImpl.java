package com.sinosoft.dpi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.sinosoft.base.dao.impl.BaseDaoImpl;
import com.sinosoft.dpi.bean.AppInfo;
import com.sinosoft.dpi.dao.DpiDao;



@Repository(value="DpiDao")
public class DpiDaoImpl extends BaseDaoImpl implements DpiDao {

	public List<HashMap> getAppinfo(Map map) {
		return getSqlMapClientTemplate().queryForList("getappinfo",map);
	}

	public DataSource  getSource(){
		return getSqlMapClientTemplate().getDataSource();
	}
			
}