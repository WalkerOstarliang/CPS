package com.chinacreator.xqgk.utils;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.xqgk.bean.SqDetailQueryInfo;


public class SqDetailQueryCache {

	private static SqDetailQueryCache cache;
	public static SqDetailQueryCache getInstance(){
		if(cache == null){
			cache = new SqDetailQueryCache();
		}
		return cache;
	}
	
	private static Map<String, SqDetailQueryInfo> map = new LinkedHashMap<String, SqDetailQueryInfo>();
	
	public void addData2Cache(String key, SqDetailQueryInfo obj){
		map.put(key, obj);
	}
	
	public SqDetailQueryInfo getDataFromCache(String key){
		if(map.containsKey(key)){
			return map.get(key); 
		}
		return null;
	}
	
	public List<SqDetailQueryInfo> getAllDataFromCache(){
		if(map.isEmpty()){
			return null;
		}
		return new ArrayList<SqDetailQueryInfo>(map.values());
	}
	
}
