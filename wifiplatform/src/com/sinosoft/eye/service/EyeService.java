package com.sinosoft.eye.service;

import java.util.List;
import java.util.Map;

import com.sinosoft.eye.bean.ApType;
import com.sinosoft.eye.bean.Poi;

public interface EyeService {
	public List<ApType> getApType(Map map);
	public List<Poi> getPoi(Map map);
}
