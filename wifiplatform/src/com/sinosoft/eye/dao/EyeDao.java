package com.sinosoft.eye.dao;

import java.util.List;
import java.util.Map;

import com.sinosoft.eye.bean.ApType;
import com.sinosoft.eye.bean.Poi;

public interface EyeDao {
	public List<ApType> getApType(Map map);
	public List<Poi> getPoi(Map map);
}
