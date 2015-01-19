package com.sinosoft.eye.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sinosoft.base.dao.impl.BaseDaoImpl;
import com.sinosoft.eye.bean.ApType;
import com.sinosoft.eye.bean.Poi;
import com.sinosoft.eye.dao.EyeDao;
import com.sinosoft.onclien.bean.Connections;

@Repository(value="eyeDao")
public class EyeDaoImpl extends BaseDaoImpl implements EyeDao{
	public List<ApType> getApType(Map map) {
		return getSqlMapClientTemplate().queryForList("getApType",map);
	}
	public List<Poi> getPoi(Map map){
		return getSqlMapClientTemplate().queryForList("getPoi",map);
	}
}
