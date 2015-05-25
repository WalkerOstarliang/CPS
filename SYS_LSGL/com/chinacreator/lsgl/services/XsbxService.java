package com.chinacreator.lsgl.services;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.RkgxrxxBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryXsbxBean;
import com.chinacreator.lsgl.dao.XsbxDao;
import com.chinacreator.lsgl.services.impl.LsglZdryServiceImpl;



public class XsbxService {
	
	private LsglZdryService zdryService=new LsglZdryServiceImpl();

	public ZdryXsbxBean saveXsbxBean(ZdryXsbxBean xsbsBean) throws SQLException {
		LoginInfo login = ActionContextHelper.getLoginInfo();
		xsbsBean.setCzdwdm(login.getOrgcode());
		xsbsBean.setCzdwmc(login.getOrgname());
		xsbsBean.setCzrxm(login.getRealname());
		xsbsBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));	
		xsbsBean.setCzrsfzh(login.getSfzh());
		if(ValidateHelper.isNotEmptyString(xsbsBean.getJlbh())){
			xsbsBean.setCzbs("1");//更新
			XsbxDao.updateXsbxBean(xsbsBean);
			
			//更新工作对象表的时间
			zdryService.updateZdryGzdxBgsj(xsbsBean.getSfzh());
		}else{
			String jlbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDRY_XSBX");
			xsbsBean.setJlbh(jlbh);
			xsbsBean.setDjrsfzh(login.getSfzh());
			xsbsBean.setCzbs("0");//新增
			XsbxDao.saveXsbxBean(xsbsBean);
		}
		return xsbsBean;
	}

	public ZdryXsbxBean queryXsbxBeansBySfzh(String sfzh) throws SQLException {
		return XsbxDao.queryXsbxBeansBySfzh(sfzh);
	}
	
	public List<ZdryXsbxBean> queryXsbxListBySfzh(String sfzh) {
		try {
			return XsbxDao.queryXsbxListBySfzh(sfzh);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	} 

	public List<RkgxrxxBean> queryGxrBeansByRybh(String rybh) throws SQLException {
		return XsbxDao.queryGxrBeansByRybh(rybh);
	}

	public ZdryGzdxBean queryGzdxBeanBySfzh(String sfzh) throws SQLException {
		return XsbxDao.queryGzdxBeanBySfzh(sfzh);
	}

}
