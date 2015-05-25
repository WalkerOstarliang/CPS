package com.chinacreator.xqgk.bean.base;

import java.util.Map;

import com.frameworkset.common.poolman.Record;
import com.frameworkset.common.poolman.handle.RowHandler;

@SuppressWarnings("unchecked")
public class MapHandler extends RowHandler<Map> {

	@Override
	public void handleRow(Map obj, Record record) throws Exception {
		Object[] keys = record.keySet().toArray();
		for(Object k : keys){
			obj.put(k, record.getString((String)k));
		}
	}

}
