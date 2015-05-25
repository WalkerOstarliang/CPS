package com.chinacreator.zagl.services.impl;

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
import com.chinacreator.zagl.bean.DdcBean;
import com.chinacreator.zagl.bean.OperateBean;
import com.chinacreator.zagl.dao.DdcDao;
import com.chinacreator.zagl.dao.impl.DdcDaoimpl;
import com.chinacreator.zagl.services.DdcService;

public class DdcServiceimpl implements DdcService {

	private static final long serialVersionUID = 5269540358716743529L;
	
	private DdcDao dao = new DdcDaoimpl();
	
	
	@Override
	public DdcBean queryDdcInfoById(String id) {
		try {
			return dao.queryDdcById(id);
		} catch (SQLException e) {
			System.out.println("根据ID查询电动车失败.");
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<DdcBean> queryDdcList(QueryBean query,
			PageInfo pageInfo) {
		try {
			return dao.queryDdcList(query, pageInfo);
		} catch (SQLException e) {
			System.out.println("分页查询电动车失败.");
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public DdcBean saveDdc(DdcBean bean) {
		if(bean != null){
			if(ValidateHelper.isEmptyString(bean.getDdcid())){
				try {
					String ddcId = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_DDC_ID");
					bean.setDdcid(ddcId);
					initCzxx(bean);
					bean.setCzbs(CommonConstant.CZBZ_ADD);
					bean.setZxbs(CommonConstant.ZX_DIC_ZC);
					dao.insertDdc(bean);
				} catch (Exception e) {
					bean = null;
					System.out.println("新增电动车失败.");
					e.printStackTrace();
				}
				
			}else{
				try {
					initCzxx(bean);
					bean.setCzbs(CommonConstant.CZBZ_UPDATE);
					dao.updateDdc(bean);
				} catch (Exception e) {
					bean = null;
					System.out.println("修改电动车信息失败.");
					e.printStackTrace();
				}
			}
			
			return bean;
		}else{
			return null;
		}
	}
	
	/**
	 * 初始化操作信息
	 * @param bean
	 * @throws Exception
	 */
	private void initCzxx(OperateBean bean) throws Exception{
		if(bean != null ){
			LoginInfo login = ActionContextHelper.getLoginInfo();
			bean.setCzrxm(login.getRealname());
			bean.setCzdwmc(login.getOrgname());
			bean.setCzdwdm(login.getOrgcode());
			bean.setCzrjh(login.getUsername());
			bean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			bean.setCzrsfzh(login.getSfzh());
		}else{
			throw new Exception("对象为空，无法初始化操作信息!");
		}
	}

	@Override
	public List<DdcBean> dowloadExcel(QueryBean query) {
		try {
			return dao.queryDdcList(query);
		} catch (SQLException e) {
			System.out.println("导出电动车失败.");
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<DdcBean> downloadDdccjxzExcel(String v_ddcid) {
		try {
			return dao.queryDdcListByINDdcid(v_ddcid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
