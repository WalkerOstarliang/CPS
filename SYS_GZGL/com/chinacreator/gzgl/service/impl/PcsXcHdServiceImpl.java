package com.chinacreator.gzgl.service.impl;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.PcsXcHdBean;
import com.chinacreator.gzgl.bean.PcsXcHdTjBean;
import com.chinacreator.gzgl.bean.PcsXcHdZpBean;
import com.chinacreator.gzgl.dao.PcsXcHdDao;
import com.chinacreator.gzgl.dao.impl.PcsXcHdDaoImpl;
import com.chinacreator.gzgl.service.PcsXcHdService;
import com.chinacreator.zagl.bean.OperateBean;

public class PcsXcHdServiceImpl implements PcsXcHdService {

	private static final long serialVersionUID = -5493207374804736906L;
	private PcsXcHdDao dao = new PcsXcHdDaoImpl();
	private LoginInfo loginInfo = ActionContextHelper.getLoginInfo();

	@Override
	public boolean deletePcsXchd(PcsXcHdBean bean) {
		boolean flag = false;
		try {
			bean.setCzbs(CommonConstant.CZBZ_UPDATE);
			bean.setZxbs(CommonConstant.ZX_DIC_ZX);
			initCzxx(bean);
			dao.DeletePcsXcHd(bean);
			flag = true;
		} catch (Exception e) {
			flag = false;
			System.out.println("注销派出所宣传活动失败");
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public String insertXchdZp(PcsXcHdBean bean) {
		if(bean.getZpList() != null){
			try {
				PcsXcHdZpBean zpBean =  bean.getZpList().get(0);
				String zpid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_PCSXCHDZPID");
				zpBean.setId(zpid);
				initDjxx(zpBean);
				dao.insertXcHdZp(zpBean);
				return zpid;
			}catch (Exception e) {
				System.out.println("保存活动照片失败");
				e.printStackTrace();
				return null;
			}
		}else{
			return null;
		}
	}

	@Override
	public PcsXcHdBean queryPcsXchdById(String id) {
		PcsXcHdBean pcshd = null;
		try {
			pcshd = dao.queryPcsXcHdById(id);
			//查询活动照片
			pcshd.setZpList(dao.queryZpByHdid(id));
			return pcshd;
		} catch (SQLException e) {
			System.out.println("根据ID查询派出所宣传活动失败");
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<PcsXcHdBean> queryPcsXchdList(QueryBean bean,
			PageInfo pageinfo) {
		try {
			return dao.queryPcsXcHdList(bean, pageinfo);
		} catch (SQLException e) {
			System.out.println("查询派出所宣传活动列表失败");
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean deleteHdZpById(String zpid) {
		boolean flag = false;
		try {
			dao.deleteXcHdZpById(zpid);
			flag = true;
		} catch (SQLException e) {
			System.out.println("删除活动照片失败");
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}	

	@Override
	public Blob queryHdZpById(String zpid) {
		try {
			return dao.queryHdZpById(zpid);
		} catch (SQLException e) {
			System.out.println("查询活动照片失败");
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PcsXcHdBean saveXchd(PcsXcHdBean bean) {
		if(bean != null){
			
			try {
				//新增派出所宣传活动
				if(ValidateHelper.isEmptyString(bean.getId())){
					String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_PCSXCHDID");
					bean.setId(id);
					bean.setCzbs(CommonConstant.CZBZ_ADD);
					initDjxx(bean);
					initCzxx(bean);
					dao.insertPcsXcHd(bean);
				}
				//修改派出所宣传活动
				else{
					bean.setCzbs(CommonConstant.CZBZ_UPDATE);
					initCzxx(bean);
					dao.updatePcsXcHd(bean);
				}
			} catch (Exception e) {
				bean = null;
				System.out.println("保存派出所宣传活动失败");
				e.printStackTrace();
				
			}
			return bean;
		}else{
			return null;
		}
	}
	
	@Override
	public List<PcsXcHdTjBean> queryPcsXcHdTj(QueryBean query) {
		try {
			return dao.queryPcsXcHdTj(query);
		} catch (SQLException e) {
			System.out.println("查询派出所宣传活动统计失败");
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 初始化登记信息
	 * @param bean
	 */
	private void initDjxx(OperateBean bean) throws Exception {
		if(bean != null){
			bean.setDjrxm(loginInfo.getRealname());
			bean.setDjdwmc(loginInfo.getOrgname());
			bean.setDjdwdm(loginInfo.getOrgcode());
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			bean.setDjrjh(loginInfo.getUsername());
			bean.setDjrsfzh(loginInfo.getSfzh());
		}else{
			throw new Exception("对象为空，无法初始化登记信息!");
		}
	}
	
	/**
	 * 初始化操作信息
	 * @param bean
	 */
	private void initCzxx(OperateBean bean) throws Exception{
		if(bean != null ){
			bean.setCzrxm(loginInfo.getRealname());
			bean.setCzdwmc(loginInfo.getOrgname());
			bean.setCzdwdm(loginInfo.getOrgcode());
			bean.setCzrjh(loginInfo.getUsername());
			bean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			bean.setCzrsfzh(loginInfo.getSfzh());
		}else{
			throw new Exception("对象为空，无法初始化操作信息!");
		}
	}

}
