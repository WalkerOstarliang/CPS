package com.chinacreator.xfdw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.PropertiesUtil;
import com.chinacreator.xfdw.bean.HzldBean;
import com.chinacreator.xfdw.bean.HzpfBean;
import com.chinacreator.xfdw.dao.HzglDao;
import com.chinacreator.xfdw.query.HzldQuery;
import com.frameworkset.orm.transaction.TransactionManager;


/**
 * @ClassName: HzglService
 * @author 禹文超
 * @mail wenchao.yu@163.com
 * @date Mar 19, 20153:48:12 PM
 * @Description: TODO 火灾管理逻辑处理类
 */
public class HzglService {

	private HzglDao hzglDao= new HzglDao(); 
	
	public PageResultInfo<HzldBean> queryHzldList(HzldQuery query, PageInfo pageinfo){
		try {
			return hzglDao.queryHzldList(query, pageinfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public PageResultInfo<HzpfBean> queryByHzpfInfo(HzldQuery query,PageInfo pageinfo){
		try {
			return hzglDao.queryByHzpfInfo(query, pageinfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public HzldBean queryByHzxhInfo(HzldQuery query){
		try {
			return hzglDao.queryByHzxhInfo(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String queryThDwdm(HzldBean hzldBean) throws SQLException{
		HzpfBean bean = hzglDao.queryHzpfInfo(hzldBean);
		if(bean == null){
			bean = new HzpfBean();
			bean.setCzrdwdm(PropertiesUtil.getValue("cssjdm"));
		}
		return bean.getCzrdwdm();
	}
	
	public void updateHzInfo(HzldBean hzldBean, HzpfBean hzpfBean)throws RollbackException{
		TransactionManager tm = new TransactionManager();
		try {
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			tm.begin();
			hzglDao.updateHzldInfo(hzldBean);
			hzglDao.insertHzpfInfo(hzpfBean);
			//--------------修改待办标记，插入新的待办消息.--zhao.luo
			updateHzldDb(hzldBean.getHzxh());
			if(hzpfBean.getClzt() != HzpfBean.HZPF_QS){
				insertHzldDb(loginInfo.getUsername(), hzldBean.getSsdwdm(), hzldBean.getHzxh(),hzpfBean.getClzt());
			}
			//--------------
			tm.commit();
		} catch (Exception e) {
			tm.rollback();
			e.printStackTrace();
		}
	}
	/**
	 * 插入火灾待办。。
	 * @param zrrjh
	 * @param org_id
	 * @param hzxh
	 * @param clzt
	 * @throws Exception
	 */
	public void insertHzldDb(String zrrjh,String org_id,String hzxh,String clzt) throws Exception{
		
		final String actFlag = "1";
		final String yxj = "1";
		
		String path = PropertiesUtil.getValue("SYSTEM.HZGLDETAIL");
		String ssmkbh = PropertiesUtil.getValue("SYSTEM.HZLZSSMKDM");
		
		if(clzt==HzpfBean.HZPF_PF){
			clzt = "派发";
		}else if(clzt == HzpfBean.HZPF_TH){
			clzt = "退回";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("zrrjh", zrrjh );//责任人警号
		map.put("org_id", org_id );
		map.put("ztxx", "火灾管理-"+clzt+"-"+hzxh);//主题信息
		map.put("ljdz",path );
		map.put("ssmkbh", ssmkbh );//所属模块编号
		map.put("yxj", yxj);//优先级
		map.put("actflag", actFlag);//待办标记；0已办，1未办
		map.put("remark", hzxh);
		
		hzglDao.insertHzldDb(map);
	}
	/**
	 * 修改火灾待办标识
	 * @param hzxh
	 * @throws Exception
	 */
	public void updateHzldDb(String hzxh) throws Exception{
		hzglDao.updateHzldDb(hzxh);
	}
}
