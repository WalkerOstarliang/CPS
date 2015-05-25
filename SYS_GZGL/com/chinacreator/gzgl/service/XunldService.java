package com.chinacreator.gzgl.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.AfXldRyxxBean;
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
import com.chinacreator.gzgl.bean.XunldBean;
import com.chinacreator.gzgl.dao.XunldDao;
import com.chinacreator.gzgl.query.XunldRwQueryBean;
import com.chinacreator.gzgl.util.GZGLCommonStatuts;

public class XunldService extends BaseValue{

	private static final long serialVersionUID = 6411691981998509776L;
	
	/**
	 * 保存巡逻队任务
	 * @param bean
	 * @return
	 */
	public boolean saveXunldRW(XunldBean bean) throws NullPointerException{
		boolean flag = true;
		if(ValidateHelper.isEmptyString(bean.getOp())){
			throw new NullPointerException("操作异常!");
		}else{
			String gxsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
			bean.setGxsj(gxsj);
			
			try {
				if(CommonConstant.OPERTYPE_ADD.equals(bean.getOp())){     		/*新增巡逻队任务*/
					String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW,"SEQ_GZGL_XLDRW");
					bean.setBh(bh);
					bean.setCzbz(GZGLCommonStatuts.CZBZ_ADD);
					LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
					bean.setDjrsfzh(loginInfo.getSfzh());
					XunldDao.addXunldRW(bean);
				}else if(CommonConstant.OPERTYPE_UPDATE.equals(bean.getOp())){ 	/*修改巡逻队任务*/
					bean.setCzbz(GZGLCommonStatuts.CZBZ_UPDATE);
					XunldDao.updateXunldRW(bean);
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
	 * 批量删除巡逻队任务
	 * @param bhs
	 * @return
	 */
	public boolean batchDelXunldRW(String bhs){
		boolean flag = false;
		if(ValidateHelper.isEmptyString(bhs) || "".equals(bhs)){
			flag = false;
		}else{
			List<XunldBean> list = new ArrayList<XunldBean>();
			for(String str : bhs.split(",")){
				XunldBean bean = new XunldBean();
				String gxsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
				bean.setGxsj(gxsj);
				bean.setBh(str);
				bean.setCzbz(GZGLCommonStatuts.CZBZ_DEL);
				list.add(bean);
			}
			try {
				XunldDao.batchDelXunldRW(list);
				flag = true;
			} catch (SQLException e) {
				flag = false;
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	/**
	 * 根据主键查询巡逻队任务
	 * @param bean
	 * @return
	 */
	public XunldBean queryXunldRWByPK(XunldRwQueryBean bean){
		try {
			return XunldDao.queryXunldRWByPK(bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询巡逻队任务列表
	 * @param bean
	 * @return
	 */
	public PageResultInfo<XunldBean> queryXunldRWForList(PageInfo page,XunldRwQueryBean bean){
		try{
			return XunldDao.queryXunldRW(page, bean);
		}catch (SQLException e) {
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
	
	/**
	 * 根据巡逻队编号查询巡逻队队员
	 * @param bh 巡逻队编号
	 * @return
	 */
	public List<AfXldRyxxBean> queryXldyByBh(String bh){
		try{
			return XunldDao.queryXldyByBh(bh);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 安防巡逻队查询
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @throws Exception
	 */
	public PageResultInfo<AfXldxxBean> queryAfxldxxListByQueryBean(PageInfo pageInfo, XunldRwQueryBean queryBean) throws Exception
	{
		return XunldDao.queryAfxldxxListByQueryBean(pageInfo, queryBean);
	}
	
}
