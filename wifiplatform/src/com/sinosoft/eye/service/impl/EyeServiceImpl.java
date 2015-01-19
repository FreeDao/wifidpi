package com.sinosoft.eye.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sinosoft.eye.bean.ApType;
import com.sinosoft.eye.bean.Poi;
import com.sinosoft.eye.dao.EyeDao;
import com.sinosoft.eye.service.EyeService;

@Component
@Transactional
@Service(value="eyeService")
public class EyeServiceImpl implements EyeService{
	@Autowired
	private EyeDao eyeDao;
	public List<ApType> getApType(Map map){
		return eyeDao.getApType(map);
	}
	public List<Poi> getPoi(Map map){
		return eyeDao.getPoi(map);
	}
}
