package com.chinacreator.dwdj.service;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dwdj.bean.WbdwJdhxBean;
import com.chinacreator.dwdj.bean.WbdwQzjcBean;
import com.chinacreator.dwdj.bean.WbdwShBean;
import com.chinacreator.dwdj.bean.WbdwWxhxBean;
import com.chinacreator.dwdj.dao.WbdwDao;
import com.chinacreator.dwdj.dao.WbdwDaoImpl;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.chinacreator.zagl.services.DwService;
import com.chinacreator.zagl.services.impl.DwServiceImpl;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * 危爆单位管理
 */
public class WbdwManagerServiceImpl implements WbdwManagerService {

	private static final long serialVersionUID = 8904795061457549192L;

	WbdwDao dao = new WbdwDaoImpl();

	LoginInfo login = ActionContextHelper.getLoginInfo();

	/**
	 * 危爆单位枪支检查新增或修改
	 * 
	 * @param qzjcBean
	 * @return
	 */
	public boolean insertQzjcBean(WbdwQzjcBean qzjcBean) {
		boolean flag = true;
		try {
			qzjcBean.initCzxx();
			if (ValidateHelper.isEmptyString(qzjcBean.getId())) {

				String id = DictionaryCacheHellper
						.getSystemParamenterValueByKey("current.xzdm")
						+ CommonDBBaseHelper.getSequence(
								CommonConstant.DBNAME_SQJW, "SEQ_WBDW_QZJC");
				qzjcBean.setId(id);
				qzjcBean.setCzbs(CommonConstant.CZBZ_ADD);

				qzjcBean.setJcdwdm(login.getOrgcode());
				qzjcBean.setJcdwmc(login.getOrgname());

				qzjcBean.initDjxx();
				dao.insertQzjcBean(qzjcBean);
			} else {
				qzjcBean.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateQzjcBean(qzjcBean);
			}
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
			qzjcBean.setId(null);
		}
		return flag;
	}

	/**
	 * 危爆单位枪支检查历史查询
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcResultInfoByJgbh(
			PageInfo pageInfo, WbdwQzjcBean queryBean) {
		return dao.queryWbdwQzjcPageResultInfo(pageInfo, queryBean);
	}

	public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcResultInfoById(
			PageInfo pageInfo, WbdwQzjcBean queryBean) {
		return dao.queryWbdwQzjcPageResultInfo(pageInfo, queryBean);
	}

	/**
	 * 危爆单位枪支检查历史查询
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwQzjcBean> queryWbdwQzjcPageResultInfoByJgbh(
			PageInfo pageInfo, WbdwQzjcBean queryBean) {
		return dao.queryWbdwQzjcPageResultInfoByJgbh(pageInfo, queryBean);
	}

	/**
	 * 危爆单位剧毒化学新增或修改
	 * 
	 * @param jdhxBean
	 * @return
	 */
	public boolean insertJdhxBean(WbdwJdhxBean jdhxBean) {
		boolean flag = true;
		try {
			jdhxBean.initCzxx();
			if (ValidateHelper.isEmptyString(jdhxBean.getId())) {

				String id = DictionaryCacheHellper
						.getSystemParamenterValueByKey("current.xzdm")
						+ CommonDBBaseHelper.getSequence(
								CommonConstant.DBNAME_SQJW, "SEQ_WBDW_JDHX");
				jdhxBean.setId(id);
				jdhxBean.setCzbs(CommonConstant.CZBZ_ADD);

				jdhxBean.initDjxx();
				dao.insertJdhxBean(jdhxBean);
			} else {
				jdhxBean.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateJdhxBean(jdhxBean);
			}
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
			jdhxBean.setId(null);
		}
		return flag;
	}

	/**
	 * 危爆单位剧毒化学历史查询通过机构编号
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwJdhxBean> queryWbdwJdhxPageResultInfoByJgbh(
			PageInfo pageInfo, WbdwJdhxBean queryBean) {
		return dao.queryWbdwJdhxPageResultInfoByJgbh(pageInfo, queryBean);
	}

	/**
	 * 危爆单位剧毒化学历史查询通过id
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwJdhxBean> queryWbdwJdhxPageResultInfoById(
			PageInfo pageInfo, WbdwJdhxBean queryBean) {
		return dao.queryWbdwJdhxPageResultInfoById(pageInfo, queryBean);
	}

	/**
	 * 危爆单位危险化学新增或修改
	 * 
	 * @param wxhxBean
	 * @return
	 */
	public boolean insertWxhxBean(WbdwWxhxBean wxhxBean) {
		boolean flag = true;
		try {
			wxhxBean.initCzxx();
			if (ValidateHelper.isEmptyString(wxhxBean.getId())) {

				String id = DictionaryCacheHellper
						.getSystemParamenterValueByKey("current.xzdm")
						+ CommonDBBaseHelper.getSequence(
								CommonConstant.DBNAME_SQJW, "SEQ_WBDW_WXHX");
				wxhxBean.setId(id);
				wxhxBean.setCzbs(CommonConstant.CZBZ_ADD);

				wxhxBean.initDjxx();
				dao.insertWxhxBean(wxhxBean);
			} else {
				wxhxBean.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateWxhxBean(wxhxBean);
			}
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
			wxhxBean.setId(null);
		}
		return flag;
	}

	/**
	 * 危爆单位危险化学历史查询通过机构编号
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwWxhxBean> queryWbdwWxhxPageResultInfoByJgbh(
			PageInfo pageInfo, WbdwWxhxBean queryBean) {
		return dao.queryWbdwWxhxPageResultInfoByJgbh(pageInfo, queryBean);
	}

	/**
	 * 危爆单位危险化学历史查询通过id
	 * 
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 */
	public PageResultInfo<WbdwWxhxBean> queryWbdwWxhxPageResultInfoById(
			PageInfo pageInfo, WbdwWxhxBean queryBean) {
		return dao.queryWbdwWxhxPageResultInfoById(pageInfo, queryBean);
	}

	@Override
	public boolean insertWbdwsh(WbdwShBean bean) throws Exception {
		boolean flag = false;
		String shid = DictionaryCacheHellper
				.getSystemParamenterValueByKey("current.xzdm")
				+ CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW,
						"seq_wbdwshid");
		bean.setId(shid);
		bean.setShzt("0");
		bean.setSfyx("0");
		try {
			dao.insertWbdwsh(bean);
			flag = true;
		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
			throw e;
		}
		return flag;
	}

	@Override
	public List<WbdwShBean> queryWbdwShByJgbh(String jgbh) {
		try {
			return dao.queryWbdwShByJgbh(jgbh);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<WbdwShBean> queryWbDwShList(PageInfo pageInfo,
			QueryBean query) {
		try {
			return dao.queryWbDwShList(pageInfo, query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public WbdwShBean queryWbdwShById(String shid) {
		try {
			return dao.queryWbdwShById(shid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean WbdwSh(WbdwShBean bean) throws Exception {
		boolean flag = false;
		TransactionManager tr = null;
		DwService dwService = new DwServiceImpl();
		try{
			tr = new TransactionManager();
			tr.begin();
			//更新审核信息
			bean.initShr();
			dao.updateWbdwShztById(bean);
			
			//审核通过
			if("1".equals(bean.getShzt())){
				//新增
				if("1".equals(bean.getCzlx())){
					//更新危爆单位管理状态
					dao.updateDwGlztByJgbh("1", bean.getJgbh());
				}
				//注销
				if("4".equals(bean.getCzlx())){
					//注销单位
					DwjbxxBean dw = new DwjbxxBean();
					dw.setJgbh(bean.getJgbh());
					dw.setZxbs(CommonConstant.ZX_DIC_ZX);
					dw.setZxrq(bean.getZxsj());
					dw.setZxyy(bean.getZxyy());
					
					dw.setCzbs(CommonConstant.CZBZ_UPDATE);
					dw.setCzsj(bean.getTjsj());
					dw.setCzrxm(bean.getTjrxm());
					dw.setCzrjh(bean.getTjrjh());
					dw.setCzrsfzh(bean.getTjrsfzh());
					dw.setCzdwdm(bean.getTjdwdm());
					dw.setCzdwmc(bean.getTjdwmc());
					dwService.delDw(dw);
				}
				//恢复
				if("5".equals(bean.getCzlx())){
					//恢复注销的单位
					DwjbxxBean dw = new DwjbxxBean();
					dw.setJgbh(bean.getJgbh());
					dw.setZxbs(CommonConstant.ZX_DIC_ZC);
					
					dw.setCzbs(CommonConstant.CZBZ_UPDATE);
					dw.setCzsj(bean.getTjsj());
					dw.setCzrxm(bean.getTjrxm());
					dw.setCzrjh(bean.getTjrjh());
					dw.setCzrsfzh(bean.getTjrsfzh());
					dw.setCzdwdm(bean.getTjdwdm());
					dw.setCzdwmc(bean.getTjdwmc());
					
					dwService.resetDw(dw);
				}
			}
			//审核不通过
			else{
				if("1".equals(bean.getCzlx())){
					//更新危爆单位管理状态
					dao.updateDwGlztByJgbh("0", bean.getJgbh());
				}
			}
			tr.commit();
			flag = true;
		}catch (Exception e) {
			flag = false;
			tr.rollback();
			e.printStackTrace();
		}
		return flag;
	}
}
