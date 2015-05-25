package com.chinacreator.zagl.services.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.SqQQqBean;
import com.chinacreator.zagl.bean.SqltBean;
import com.chinacreator.zagl.bean.SqwzBean;
import com.chinacreator.zagl.bean.WlsqBean;
import com.chinacreator.zagl.dao.WlsqDao;
import com.chinacreator.zagl.dao.impl.WlsqDaoImpl;
import com.chinacreator.zagl.services.WlsqService;
import com.frameworkset.orm.transaction.TransactionManager;

public class WlsqServiceImpl implements WlsqService {

	private static final long serialVersionUID = 2464994409028608391L;
	private WlsqDao dao = new WlsqDaoImpl();
	private LoginInfo loginInfo = ActionContextHelper.getLoginInfo();

	public boolean deleteWlsqByWlsqbh(String wlsqbh) throws Exception {
		if (ValidateHelper.isEmptyString(wlsqbh)) {
			return false;
		}

		boolean flag = true;
		TransactionManager tr = new TransactionManager();
		try {
			tr.begin();
			for (String bh : wlsqbh.split(",")) {
				WlsqBean wlsq = new WlsqBean();
				wlsq.setWlsqbh(bh);
				wlsq.setCzbs(CommonConstant.CZBZ_DEL);
				wlsq.setCzrxm(loginInfo.getRealname());
				wlsq.setCzsj(DateTimeHelper
						.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				wlsq.setCzdwdm(loginInfo.getOrgcode());
				wlsq.setCzdwmc(loginInfo.getOrgname());
				wlsq.setCzrjh(loginInfo.getUsername());

				dao.deleteWlsqByWlsqbh(wlsq);
			}
			tr.commit();
			flag = true;
		} catch (Exception e) {
			flag = false;
			tr.rollback();
		}
		return flag;
	}

	public PageResultInfo<WlsqBean> queryWlsqByPageResultInfo(
			PageInfo pageInfo, QueryBean queryBean) throws Exception {
		if (pageInfo == null || queryBean == null) {
			return null;
		}

		return dao.queryWlsqByPageResultInfo(pageInfo, queryBean);
	}

	public WlsqBean queryWlsqByWlsqbh(String wlsqbh) throws SQLException {
		if (ValidateHelper.isEmptyString(wlsqbh)) {
			return null;
		}

		// 查询网络社区基本信息
		WlsqBean wlsqBean = dao.queryWlsqByWlsqbh(wlsqbh);
		// 查询社区论坛
		wlsqBean.setSqLtList(dao.querySqltByWlsqbh(wlsqbh));
		// 查询社区QQ群
		wlsqBean.setSqQQqList(dao.querySqQQqByWlsqbh(wlsqbh));
		// 查询社区网站
		wlsqBean.setSqwzList(dao.querySqwzByWlsqbh(wlsqbh));
		return wlsqBean;
	}

	public WlsqBean saveWlsq(WlsqBean bean) throws Exception {
		if (bean == null) {
			return null;
		}

		WlsqBean wlsq = null;
		bean.setCzrjh(loginInfo.getUsername());
		// 网络社区编号为空新增网络社区，不为空，修改网络社区
		if (ValidateHelper.isNotEmptyString(bean.getWlsqbh())) {
			TransactionManager tr = new TransactionManager();
			try {
				tr.begin();
				wlsq = dao.updateWlsq(bean);

				// 修改社区网站 (删除后重新新增)
				dao.deleteSqwzByWlsqbh(bean.getWlsqbh());
				if (bean.getSqwzList() != null) {
					List<SqwzBean> sqwzList = new ArrayList<SqwzBean>();
					for (SqwzBean sqwz : bean.getSqwzList()) {
						if (ValidateHelper.isEmptyString(sqwz.getId())) {
							sqwz.setId(CommonSequenceHelper.getAfbh(loginInfo
									.getOrgid(), "SEQ_ZA_WLSQ_SQWZ"));
							sqwz.setWlsqbh(bean.getWlsqbh());
						}
						sqwzList.add(dao.insertSqwz(sqwz));
					}
					wlsq.setSqwzList(sqwzList);
				}

				// 修改社区论坛 (删除后重新新增)
				dao.deleteSqltByWlsqbh(bean.getWlsqbh());
				if (bean.getSqLtList() != null) {
					List<SqltBean> sqltList = new ArrayList<SqltBean>();
					for (SqltBean sqlt : bean.getSqLtList()) {
						if (ValidateHelper.isEmptyString(sqlt.getId())) {
							sqlt.setId(CommonSequenceHelper.getAfbh(loginInfo
									.getOrgid(), "SEQ_ZA_WLSQ_SQLT"));
							sqlt.setWlsqbh(bean.getWlsqbh());
						}
						sqltList.add(dao.insertSqlt(sqlt));
					}
					wlsq.setSqLtList(sqltList);
				}

				// 修改社区QQ群(删除后重新新增)
				dao.deleteSqQQqByWlsqbh(bean.getWlsqbh());
				if (bean.getSqQQqList() != null) {
					List<SqQQqBean> sqQQqList = new ArrayList<SqQQqBean>();
					for (SqQQqBean sqQQq : bean.getSqQQqList()) {
						if (ValidateHelper.isEmptyString(sqQQq.getId())) {
							sqQQq.setId(CommonSequenceHelper.getAfbh(loginInfo
									.getOrgid(), "SEQ_ZA_WLSQ_SQQQQ"));
							sqQQq.setWlsqbh(bean.getWlsqbh());
						}
						sqQQqList.add(dao.insertSqQQq(sqQQq));
					}
					wlsq.setSqQQqList(sqQQqList);
				}

				tr.commit();
			} catch (Exception e) {
				tr.rollback();
			}
		} else {
			String wlsqbh = CommonSequenceHelper.getAfbh(loginInfo.getOrgid(),
					"seq_za_wlsq");
			bean.setWlsqbh(wlsqbh);
			TransactionManager tr = new TransactionManager();
			try {
				tr.begin();
				wlsq = dao.insertWlsq(bean);

				// 新增社区网站
				if (bean.getSqwzList() != null) {
					List<SqwzBean> sqwzList = new ArrayList<SqwzBean>();
					for (SqwzBean sqwz : bean.getSqwzList()) {
						sqwz.setWlsqbh(wlsqbh);
						sqwz.setId(CommonSequenceHelper.getAfbh(loginInfo
								.getOrgid(), "SEQ_ZA_WLSQ_SQWZ"));
						sqwzList.add(dao.insertSqwz(sqwz));
					}
					wlsq.setSqwzList(sqwzList);
				}

				// 新增社区论坛
				if (bean.getSqLtList() != null) {
					List<SqltBean> sqltList = new ArrayList<SqltBean>();
					for (SqltBean sqlt : bean.getSqLtList()) {
						sqlt.setWlsqbh(wlsqbh);
						sqlt.setId(CommonSequenceHelper.getAfbh(loginInfo
								.getOrgid(), "SEQ_ZA_WLSQ_SQLT"));
						sqltList.add(dao.insertSqlt(sqlt));
					}
					wlsq.setSqLtList(sqltList);
				}

				// 新增社区QQ群
				if (bean.getSqQQqList() != null) {
					List<SqQQqBean> sqQQqList = new ArrayList<SqQQqBean>();
					for (SqQQqBean sqQQq : bean.getSqQQqList()) {
						sqQQq.setWlsqbh(wlsqbh);
						sqQQq.setId(CommonSequenceHelper.getAfbh(loginInfo
								.getOrgid(), "SEQ_ZA_WLSQ_SQQQQ"));
						sqQQqList.add(dao.insertSqQQq(sqQQq));
					}
					wlsq.setSqQQqList(sqQQqList);
				}

				tr.commit();
			} catch (Exception e) {
				tr.rollback();
				e.printStackTrace();
			}
		}
		return wlsq;
	}
}
