package com.chinacreator.xqgk.business;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.chinacreator.xqgk.bean.base.DeptRelationOrg;
import com.chinacreator.xqgk.bean.base.UserRelationOrg;
import com.chinacreator.xqgk.dao.XqgkBaseDao;

public class UserRelaDeptBusiness {
	
	private static final Logger log = LoggerFactory.getLogger(UserRelaDeptBusiness.class);
	
	
	public static UserRelaDeptBusiness getInstance(){
		return new UserRelaDeptBusiness();
	}
	
	/**
	 * 获取用户查看数据时的实际机构代码
	 * @param userId
	 * @param deptCode
	 * @return
	 */
	public String getUserDataDept(String userId, String deptCode){
		return getRelaDeptCodeOfUser(userId, deptCode, "data");
	}
	
	/**
	 * 获取用户勤务值班时的实际机构代码
	 * @param userId
	 * @param deptCode
	 * @return
	 */
	public String getUserDutyDept(String userId, String deptCode){
		return getRelaDeptCodeOfUser(userId, deptCode, "duty");
	}
	
	/**
	 * 获取用户对应不同工作时的实际机构代码
	 * @param userId
	 * @param deptCode
	 * @param type
	 * @return
	 */
	private String getRelaDeptCodeOfUser(String userId, String deptCode, String type){
		String dataDeptCode = deptCode;
		String dutyDeptCode = deptCode;
		
		UserRelationOrg userRela = null;
		DeptRelationOrg deptRela = null;
		
		try {
			userRela = XqgkBaseDao.getInstance().getRelaUserDeptCode(userId);//用户对应关系
			if(userRela != null){//有用户对应关系
				dataDeptCode = userRela.getDataDeptCode();
				dutyDeptCode = userRela.getDutyDeptCode();
			}else{//没有用户对应关系
				deptRela = XqgkBaseDao.getInstance().getRelaDeptCode(deptCode);//单位对应关系
				if(deptRela != null){//有单位对应关系
					dataDeptCode = deptRela.getDataDeptCode();
					dutyDeptCode = deptRela.getDutyDeptCode();
				}
			}
			
			if("data".equals(type)){//查看数据需求
				return dataDeptCode;
			}else if("duty".equals(type)){//值班需求
				return dutyDeptCode;
			}else{//其他
				return deptCode;
			}
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return deptCode;
	}
	
}
