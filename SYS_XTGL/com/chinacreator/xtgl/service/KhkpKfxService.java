package com.chinacreator.xtgl.service;

import java.io.Serializable;
import java.util.Map;

import com.chinacreator.xtgl.bean.KhkpParamBean;

public interface KhkpKfxService extends Serializable {
	
	//获取扣分结果
	public Map<String, ?> getResultMap(KhkpParamBean bean);
	
}
