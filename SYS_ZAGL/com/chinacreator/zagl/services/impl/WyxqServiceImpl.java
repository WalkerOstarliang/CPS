package com.chinacreator.zagl.services.impl;

import java.sql.SQLException;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.WyxqAqjcBean;
import com.chinacreator.zagl.bean.WyxqBean;
import com.chinacreator.zagl.dao.impl.WyxqDaoImpl;
import com.chinacreator.zagl.query.WyxqQuery;

public class WyxqServiceImpl extends BaseValue {

	private static final long serialVersionUID = 6513195135068892548L;

	/**
	 * 保存物业小区
	 * @return
	 */
	public WyxqBean saveWyxq(WyxqBean bean){
		if(ValidateHelper.isEmptyString(bean.getId())){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String id = loginInfo.getCountrygajgdm() + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZA_WYXQ_ID");
			bean.setId(id);
			bean.setCzbs(CommonConstant.CZBZ_ADD);
			try {
				WyxqDaoImpl.insertWyxq(bean);
			} catch (SQLException e) {
				bean = null;
				e.printStackTrace();
			}
		}else{
			try {
				bean.setCzbs(CommonConstant.CZBZ_UPDATE);
				WyxqDaoImpl.updateWyxq(bean);
			} catch (SQLException e) {
				bean = null;
				e.printStackTrace();
			}
		}
		return bean;
	}
	/**
	 * 保存物业小区安检信息
	 */
	public WyxqAqjcBean saveWyxqaJ(WyxqAqjcBean bean){
		if(ValidateHelper.isEmptyString(bean.getId())){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String id = loginInfo.getCountrygajgdm() + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_T_ZA_WYXQ_AQJCID");
			bean.setId(id);
			try {
				bean=WyxqDaoImpl.insertWyxqaJ(bean);
			} catch (SQLException e) {
				bean = null;
				e.printStackTrace();
			}
		}else{
			try {
				bean=WyxqDaoImpl.updateWyxqaJ(bean);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				bean = null;
				e.printStackTrace();
			}
		}
		return bean;
	}
	
	/**
	 * 注销物业小区
	 * @param bean
	 */
	public void zxWyxq(WyxqBean bean){
		try {
			bean.setZxbs(CommonConstant.ZX_DIC_ZX);
			bean.initCzxx();
			WyxqDaoImpl.zxWyxq(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 根据ID查询物业小区
	 * @param id
	 * @return
	 */
	public WyxqBean queryWyxqById(String id){
		WyxqBean bean = null;
		try {
			bean = WyxqDaoImpl.queryWyxqById(id);
		} catch (SQLException e) {
			bean = null;
			e.printStackTrace();
		}
		
		return bean;
	}
	
	public PageResultInfo<WyxqBean> queryWyxqResultPageInfo(WyxqQuery bean,PageInfo pageInfo){
		PageResultInfo<WyxqBean> list = null;
		try{
			list = WyxqDaoImpl.queryWyxqPageResultInfo(bean, pageInfo);
		}catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return list;
	}
	public PageResultInfo<WyxqAqjcBean> queryWyxqaJResultPageInfo(String beanid,PageInfo pageInfo){
		PageResultInfo<WyxqAqjcBean> list = null;
		try{
			list = WyxqDaoImpl.queryWyxqaJResultPageInfo(beanid, pageInfo);
		}catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return list;
	}
}
