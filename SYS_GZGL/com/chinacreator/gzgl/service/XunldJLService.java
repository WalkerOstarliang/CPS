package com.chinacreator.gzgl.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.AfXldxxBean;
import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.XunldJLBean;
import com.chinacreator.gzgl.dao.XunldDao;
import com.chinacreator.gzgl.dao.XunldJLDao;
import com.chinacreator.gzgl.util.GZGLCommonStatuts;

public class XunldJLService extends BaseValue {

	private static final long serialVersionUID = 2447170733384995631L;
	
	/**
	 * 保存巡逻队奖励
	 * @param bean
	 * @return
	 */
	public boolean save(XunldJLBean bean){
		boolean flag = true;
		if(ValidateHelper.isEmptyString(bean.getOp())){
			throw new NullPointerException("操作异常!");
		}else{
			try {
				String gxsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
				bean.setGxsj(gxsj);
				
				if(CommonConstant.OPERTYPE_ADD.equals(bean.getOp())){             //新增巡逻队奖励
					String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW,"SEQ_GZGL_XLDJL");
					bean.setBh(bh);
					bean.setCzbs(GZGLCommonStatuts.CZBZ_ADD);
					LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
					bean.setDjrsfzh(loginInfo.getSfzh());
					XunldJLDao.addXunldJL(bean);
				}else if(CommonConstant.OPERTYPE_UPDATE.equals(bean.getOp())){    //修改巡逻队奖励
					bean.setCzbs(GZGLCommonStatuts.CZBZ_UPDATE);
					XunldJLDao.updateXunldJL(bean);
				}else{
					flag = false;
				}
			} catch (SQLException e) {
				flag = false;
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	/**
	 * 批量删除巡逻队奖励
	 * @param bhs 巡逻队奖励编号 （多个编号之间用逗号隔开）
	 * @return
	 */
	public boolean batchDelXunldJL(String bhs){
		boolean flag = false;
		
		String gxsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
		String czbs_del = GZGLCommonStatuts.CZBZ_DEL;
		
		List<XunldJLBean> list = new ArrayList<XunldJLBean>();
		for(String bh : bhs.split(",")){
			XunldJLBean bean = new XunldJLBean();
			bean.setBh(bh);
			bean.setGxsj(gxsj);
			bean.setCzbs(czbs_del);
			
			list.add(bean);
		}
		
		try {
			XunldJLDao.batchDelXunldJL(list);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/**
	 * 根据主键查询巡逻队奖励
	 * @param bean
	 * @return
	 */
	public XunldJLBean queryXunldJLByPK(XunldJLBean bean){
		try {
			return XunldJLDao.queryXunldJLByPK(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 分页查询巡逻队奖励
	 * @param bean
	 * @param page 分页信息
	 * @return
	 */
	public PageResultInfo<XunldJLBean> queryXunldJL(XunldJLBean bean,PageInfo page){
		try {
			return XunldJLDao.queryXunldJL(bean, page);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据orgCode 查询巡逻队
	 * @param orgCode
	 * @return
	 */
	public List<AfXldxxBean> queryXldsByOrgCode(String orgCode){
		try {
			return XunldDao.queryXldsByOrgCode(orgCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
