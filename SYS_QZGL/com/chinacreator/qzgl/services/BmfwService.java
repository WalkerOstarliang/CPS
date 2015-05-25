package com.chinacreator.qzgl.services;

import java.sql.SQLException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.qzgl.bean.BmfwxxBean;
import com.chinacreator.qzgl.dao.BmfwDao;
import com.chinacreator.qzgl.query.BmfwQueryBean;

public class BmfwService {

	public PageResultInfo<BmfwxxBean> getBmfwxx(BmfwQueryBean queryBean,
			PageInfo pageInfo) throws SQLException {
		return BmfwDao.getBmfwxx(queryBean,pageInfo);
	}

	public void updateBmfw(BmfwxxBean bmfwxxBean, String operType) throws SQLException {
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
			String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_QZGL_BMFW");
			bmfwxxBean.setBh(xzdm+bh);
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			bmfwxxBean.setDjrsfzh(loginInfo.getSfzh());
			BmfwDao.insertBmfw(bmfwxxBean);
		}
		else if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
			BmfwDao.updateGyhd(bmfwxxBean);
		}
		
	}

	public BmfwxxBean getBmfwByBh(String bh) throws SQLException {
		 return BmfwDao.getBmfwByBh(bh);
	}

	public Object deleteBmfw(String bh) throws SQLException {
		return BmfwDao.deleteBmfw(bh);
		
	}

	public void deleteBmfwxx(String bhs) throws SQLException {
		if (ValidateHelper.isNotEmptyString(bhs))
		{
			String[] sqbharr = bhs.split(",");
			for (String bh : sqbharr)
			{
				BmfwDao.deleteBmfwxxByBh(bh);
			}
		}
		
	}
	}
