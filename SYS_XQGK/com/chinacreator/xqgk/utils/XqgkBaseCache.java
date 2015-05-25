package com.chinacreator.xqgk.utils;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.xqgk.bean.XqgkQueryInfo;


public class XqgkBaseCache {

	private static XqgkBaseCache cache;
	public static XqgkBaseCache getInstance(){
		if(cache == null){
			cache = new XqgkBaseCache();
		}
		return cache;
	}
	
	private static Map<String, XqgkQueryInfo> map = new LinkedHashMap<String, XqgkQueryInfo>();
	
	public void addData2Cache(String key, XqgkQueryInfo obj){
		map.put(key, obj);
	}
	
	public XqgkQueryInfo getDataFromCache(String key){
		if(map.containsKey(key)){
			return map.get(key); 
		}
		return null;
	}
	
	public List<XqgkQueryInfo> getAllDataFromCache(){
		if(map.isEmpty()){
			return null;
		}
		return new ArrayList<XqgkQueryInfo>(map.values());
	}
	
}
