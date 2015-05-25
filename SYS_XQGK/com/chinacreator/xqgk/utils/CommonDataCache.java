package com.chinacreator.xqgk.utils;

import java.util.HashMap;
import java.util.Map;

import com.chinacreator.xqgk.bean.base.DeptRelationOrg;
import com.chinacreator.xqgk.bean.base.UserRelationOrg;

public class CommonDataCache {

	private static CommonDataCache cache;
	public static CommonDataCache getInstance(){
		if(cache == null){
			cache = new CommonDataCache();
		}
		return cache;
	}
	
	private static Map<Integer, UserRelationOrg> user_relation_orgMap = new HashMap<Integer, UserRelationOrg>();
	private static Map<String, DeptRelationOrg> dept_relation_orgMap = new HashMap<String, DeptRelationOrg>();
	
	public void addUserRela2Cache(UserRelationOrg rela){
		user_relation_orgMap.put(rela.getUserId(), rela);
	}
	
	public void addDeptRela2Cache(DeptRelationOrg rela){
		dept_relation_orgMap.put(rela.getDeptCode(), rela);
	}
	
	public UserRelationOrg getUserRelaFromCache(String userId){
		if(user_relation_orgMap.containsKey(userId)){
			return user_relation_orgMap.get(userId);
		}
		return null;
	}
	
	public DeptRelationOrg getDeptRelaFromCache(String deptCode){
		if(dept_relation_orgMap.containsKey(deptCode)){
			return dept_relation_orgMap.get(deptCode);
		}
		return null;
	}
	
}
