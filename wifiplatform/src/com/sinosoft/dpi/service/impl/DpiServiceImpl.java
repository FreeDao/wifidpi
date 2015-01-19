package com.sinosoft.dpi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sinosoft.base.dao.impl.BaseDaoImpl;
import com.sinosoft.dpi.bean.AppInfo;
import com.sinosoft.dpi.dao.DpiDao;
import com.sinosoft.dpi.service.DpiService;
import com.sinosoft.onclien.dao.OnclienDao;
@Component
@Transactional
@Service(value="DpiService")
public class DpiServiceImpl extends BaseDaoImpl implements DpiService{
	@Autowired
	private DpiDao dpiDao;
	/**
	 * 查询用户最高级区域 
	 * @param id
	 * @return
	 */
	public List<HashMap> getAppinfo(Map map)
	{
	   return  dpiDao.getAppinfo(map);
	}
	public DataSource  getSource(){
		return dpiDao.getSource();
	}
}
