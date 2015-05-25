package com.chinacreator.zagl.services.impl;

import java.io.File;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import org.springframework.beans.BeanUtils;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.DzxxBean;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.cps.dao.CommonDzxxDao;
import com.chinacreator.common.cps.dao.impl.CommonDzxxDaoImpl;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dwdj.bean.WbdwShBean;
import com.chinacreator.dwdj.service.WbdwManagerService;
import com.chinacreator.dwdj.service.WbdwManagerServiceImpl;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.dao.LsglFwJbxxDao;
import com.chinacreator.lsgl.dao.LsglRkJbxxDao;
import com.chinacreator.lsgl.dao.impl.LsglFwJbxxDaoImpl;
import com.chinacreator.lsgl.dao.impl.LsglRkJbxxDaoImpl;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;
import com.chinacreator.zagl.bean.AqyhBean;
import com.chinacreator.zagl.bean.BadysBean;
import com.chinacreator.zagl.bean.BwjgBean;
import com.chinacreator.zagl.bean.BwjysBean;
import com.chinacreator.zagl.bean.BwzdBean;
import com.chinacreator.zagl.bean.CyryPfBean;
import com.chinacreator.zagl.bean.CyryPfListBean;
import com.chinacreator.zagl.bean.CyrytjBean;
import com.chinacreator.zagl.bean.DwAqsbBean;
import com.chinacreator.zagl.bean.DwBean;
import com.chinacreator.zagl.bean.DwabryBean;
import com.chinacreator.zagl.bean.DwabssBean;
import com.chinacreator.zagl.bean.DwaqjcBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.bean.DwfwglBean;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.chinacreator.zagl.bean.DwjcBean;
import com.chinacreator.zagl.bean.DwzpxxBean;
import com.chinacreator.zagl.bean.GgcsBean;
import com.chinacreator.zagl.bean.JfdwBean;
import com.chinacreator.zagl.bean.JfdwNsxxBean;
import com.chinacreator.zagl.bean.NbDwTjBean;
import com.chinacreator.zagl.bean.NbdwBean;
import com.chinacreator.zagl.bean.OperateBean;
import com.chinacreator.zagl.bean.SwdwBean;
import com.chinacreator.zagl.bean.SwfwcsBean;
import com.chinacreator.zagl.bean.TfsjyaBean;
import com.chinacreator.zagl.bean.ThksyBean;
import com.chinacreator.zagl.bean.ThlgyBean;
import com.chinacreator.zagl.bean.TzhyBean;
import com.chinacreator.zagl.bean.WxwpdwBean;
import com.chinacreator.zagl.bean.YaylBean;
import com.chinacreator.zagl.bean.ZdyhbwBean;
import com.chinacreator.zagl.bean.ZdyhbwZpBean;
import com.chinacreator.zagl.bean.ZhsgBean;
import com.chinacreator.zagl.dao.DwDao;
import com.chinacreator.zagl.dao.impl.DwDaoImpl;
import com.chinacreator.zagl.query.CyryQueryBean;
import com.chinacreator.zagl.query.DwQueryBean;
import com.chinacreator.zagl.services.DwService;
import com.frameworkset.orm.transaction.TransactionManager;

public class DwServiceImpl implements DwService 
{
	private static final long serialVersionUID = -8254398045389122029L;

	private DwDao dao = new DwDaoImpl();

	private LsglFwJbxxDao fwDao = new LsglFwJbxxDaoImpl();
	
	private LsglRkJbxxDao rkDao = new LsglRkJbxxDaoImpl();
	
	LoginInfo login = ActionContextHelper.getLoginInfo();
	
	/**
	 * 根据机构编号查询单位信息
	 */
	public DwBean queryDwByJgbh(String jgbh) throws Exception 
	{
		DwBean dw = new DwBean();
		// 单位基本信息
		dw = queryDwJbxxByJgbh(jgbh);
		DwjbxxBean dwjbxx = dw.getDwjbxx();
		dw.setDwjbxx(dwjbxx);
		
		String dwsx = "";
		if(dwjbxx != null){
			dwsx = dwjbxx.getHylb();
			if(ValidateHelper.isNotEmptyString(dwsx)){
				for(String sx : dwsx.split(",")){
					if("01".equals(sx)){
						// 特种行业
						dw.setTzhy(dao.queryTzhyByJgbh(jgbh));
					}else if("02".equals(sx)){
						// 公共场所
						dw.setGgcs(dao.queryGgcsByJgbh(jgbh));
					}else if("03".equals(sx)){
						// 内保单位
						dw.setNbdw(dao.queryNbdwByJgbh(jgbh));
					}else if("04".equals(sx)){
						//危险物品单位
						dw.setWxwpdwBean(dao.queryWxwpdwBean(jgbh));
					}else if("05".equals(sx)){
						//上网服务场所
						dw.setSwfwcs(dao.querySwfwcsByJgbh(jgbh));
					}else if("06".equals(sx)){
						//涉外单位
						dw.setSwdwBean(dao.querySwdwBeanByJgbh(jgbh));
					}else if("07".equals(sx)){
						//特行旅馆业
						dw.setThlgy(dao.queryThlgyByJgbh(jgbh));
					}else if("08".equals(sx)){
						//开锁业
						dw.setThksyBean(dao.queryThksyBean(jgbh));
					}else if("09".equals(sx)){
						//技防单位
						dw.setJfdw(dao.queryJfdwByJgbh(jgbh));
					}
				}
			}
		}
		return dw;
	}

	/**
	 * 保存单位信息
	 */
	public DwBean saveDw(DwBean bean) throws Exception 
	{
		TransactionManager tr = new TransactionManager();
		try 
		{
			tr.begin();
			if (bean.getDwdz() != null && bean.getDwjbxx() != null) 
			{
				String jgbh = "";
				DwjbxxBean dwjbxx = bean.getDwjbxx();

				CommonDzxxDao dzxxDao = new CommonDzxxDaoImpl();
				// 新增单位地址,新增地址必然新增单位基本信息
				if (ValidateHelper.isEmptyString(bean.getDwdz().getDzid())) 
				{
					// 新增单位地址
					DzxxBean dzxx = dzxxDao.insertDzxxBean(bean.getDwdz());
					bean.setDwdz(dzxx);

					// 新增单位基本信息
					dwjbxx.setDzid(bean.getDwdz().getDzid());
					dwjbxx = dao.insertDwjbxx(dwjbxx);
					bean.setDwjbxx(dwjbxx);
					jgbh = dwjbxx.getJgbh();

					// 特种行业信息不为空 则新增特种行业信息
					if (bean.getTzhy() != null) {
						TzhyBean tzhy = bean.getTzhy();
						tzhy.setJgbh(jgbh);
						bean.setTzhy(dao.insertTzhy(tzhy));

						// 特行类别为旅馆业 保存特行旅馆
						if ("100".equals(tzhy.getThlb())) {
							bean.setThlgy(saveThlg(bean.getThlgy(), jgbh, bean
									.getTzhy().getThbh()));
						}
					}

					// 内保单位不为空则新增内保单位
					if (bean.getNbdw() != null) {
						NbdwBean nbdw = bean.getNbdw();
						nbdw.setJgbh(jgbh);
						bean.setNbdw(dao.insertNbdw(nbdw));
					}

					// 公共场所信息不为空则新增公共场所
					if (bean.getGgcs() != null) {
						GgcsBean ggcs = bean.getGgcs();
						ggcs.setJgbh(jgbh);
						bean.setGgcs(dao.insertGgcs(ggcs));
					}

					// 上网服务场所
					if (bean.getSwfwcs() != null) {
						SwfwcsBean swfwcs = bean.getSwfwcs();
						swfwcs.setJgbh(jgbh);
						bean.setSwfwcs(dao.insertSwfwcs(swfwcs));
					}
				} else {// 修改单位地址,必然伴随着修改单位基本信息

					// 修改单位地址
					bean.setDwdz(dzxxDao.updateDzxxBean(bean.getDwdz()));
					
					if(ValidateHelper.isNotEmptyString(dwjbxx.getJgbh())){
						// 修改单位基本信息
						bean.setDwjbxx(dao.updateDwjbxx(dwjbxx));
					}else{
						//新增单位基本信息
						bean.setDwjbxx(dao.insertDwjbxx(dwjbxx));
					}

					jgbh = bean.getDwjbxx().getJgbh();

					// 特种行业
					if(bean.getTzhy() != null){
						if (ValidateHelper.isEmptyString(bean.getTzhy()
								.getThbh())) {
							// 新增特种行业
							TzhyBean tzhy = bean.getTzhy();
							tzhy.setJgbh(jgbh);
							bean.setTzhy(dao.insertTzhy(tzhy));
							if ("100".equals(bean.getTzhy().getThlb())) {
								bean.setThlgy(saveThlg(bean.getThlgy(), jgbh, bean
										.getTzhy().getThbh()));
							}
						} else {
							// 修改特种行业
							bean.setTzhy(dao.updateTzhy(bean.getTzhy()));
							if ("100".equals(bean.getTzhy().getThlb())) {
								bean.setThlgy(saveThlg(bean.getThlgy(), jgbh, bean
										.getTzhy().getThbh()));
							}
						}
					}

					// 公共场所
					if(bean.getGgcs() != null){
						if (ValidateHelper
								.isEmptyString(bean.getGgcs().getGgcsbh())) {
							GgcsBean ggcs = bean.getGgcs();
							ggcs.setJgbh(jgbh);
							bean.setGgcs(dao.insertGgcs(ggcs));
						} else {
							bean.setGgcs(dao.updateGgcs(bean.getGgcs()));
						}
					}

					// 内保单位
					if(bean.getNbdw() != null){
						if (ValidateHelper
								.isEmptyString(bean.getNbdw().getNbdwbh())) {
							NbdwBean nbdw = bean.getNbdw();
							nbdw.setJgbh(jgbh);
							bean.setNbdw(dao.insertNbdw(nbdw));
						} else {
							bean.setNbdw(dao.updateNbdw(bean.getNbdw()));
						}
					}

					// 上网服务场所
					if(bean.getSwfwcs() != null){
						if (ValidateHelper.isEmptyString(bean.getSwfwcs().getJlbh())) {
							SwfwcsBean swfwcs = bean.getSwfwcs();
							swfwcs.setJgbh(jgbh);
							bean.setSwfwcs(dao.insertSwfwcs(swfwcs));
						} else {
							bean.setSwfwcs(dao.updateSwfwcs(bean.getSwfwcs()));
						}
					}
				}
			}

			// 安保人员
			if (bean.getAbry() != null) {
				if (ValidateHelper.isEmptyString(bean.getAbry().getBh())) {
					bean.setAbry(dao.insertDwabry(bean.getAbry()));
				} else {
					bean.setAbry(dao.updateDwabry(bean.getAbry()));
				}
			}

			// 安保设施
			if (bean.getAbss() != null) {
				if (ValidateHelper.isEmptyString(bean.getAbss().getSsbh())) {
					bean.setAbss(dao.insertDwabss(bean.getAbss()));
				} else {
					bean.setAbss(dao.updateDwabss(bean.getAbss()));
				}
			}

			// 从业人员
			if (bean.getCyry() != null) {
				if (ValidateHelper.isEmptyString(bean.getCyry().getCyrybh())) {
					bean.setCyry(dao.insertDwcyry(bean.getCyry()));
				} else {
					bean.setCyry(dao.updateDwcyry(bean.getCyry()));
				}
			}

			// 安全检查
			if (bean.getAqjc() != null) {
				if (ValidateHelper.isEmptyString(bean.getAqjc().getJlbh())) {
					bean.setAqjc(dao.insertDwaqjc(bean.getAqjc()));
				} else {
					bean.setAqjc(dao.updateDwaqjc(bean.getAqjc()));
				}
			}

			// 单位奖罚
			if (bean.getDwjc() != null) {
				if (ValidateHelper.isEmptyString(bean.getDwjc().getBh())) {
					bean.setDwjc(dao.insertDwjc(bean.getDwjc()));
				} else {
					bean.setDwjc(dao.updateDwjc(bean.getDwjc()));
				}
			}

			// 重点要害部位
			if (bean.getZdyhbw() != null) {
				if (ValidateHelper.isEmptyString(bean.getZdyhbw().getYhbwbh())) {
					bean.setZdyhbw(dao.insertZdyhbw(bean.getZdyhbw()));
				} else {
					bean.setZdyhbw(dao.updateZdyhbw(bean.getZdyhbw()));
				}
			}
			//单位照片
			if(bean.getDwzp() != null){
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				List<DwzpxxBean> zps = new ArrayList<DwzpxxBean>();
				if(bean.getDwzp().getZps().length > 0 ){
					for(int i = 0 ; i < bean.getDwzp().getZps().length; i++){
						DwzpxxBean zp = new DwzpxxBean();
						zp.setJgbh(bean.getDwzp().getJgbh());
						zp.setZp(bean.getDwzp().getZps()[i]);
						zp.setMs(bean.getDwzp().getZpsFileName()[i]);
						zp.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
						zp.setDjrxm(loginInfo.getRealname());
						zp.setDjdwmc(loginInfo.getOrgname());
						zp.setDjdwdm(loginInfo.getOrgcode());
						
						zps.add(zp);
					}
				}else{
					return null;
				}
				dao.insertDwzp(zps);
			}
			tr.commit();
		} catch (Exception e) {
			try
			{
				tr.rollback();
			}
			catch(RollbackException e1)
			{
			}
			e.printStackTrace();
			throw new Exception("保存单位信息失败.");
		}
		return bean;
	}

	/**
	 * 保存特行旅馆
	 * 
	 * @param thlg
	 *            特行旅馆信息
	 * @param jgbh
	 *            机构编号
	 * @param thby
	 *            特行编号
	 * @return
	 * @throws SQLException
	 */
	protected ThlgyBean saveThlg(ThlgyBean thlg, String jgbh, String thbh)
			throws SQLException {
		if (ValidateHelper.isEmptyString(thlg.getLgbh())) {
			thlg.setThbh(thbh);
			thlg.setJgbh(jgbh);
			return dao.inserThlgy(thlg);
		} else {
			return dao.updateThlgy(thlg);
		}
	}

	/**
	 * 根据编号查询安保人员
	 */
	public DwabryBean queryAbryByBh(String bh) throws Exception {
		return dao.queryDwabryByBh(bh);
	}

	/**
	 * 根据机构编号查询单位安保人员
	 */
	public List<DwabryBean> queryAbryListByJgbh(String jgbh) throws Exception {
		return dao.queryDwabryListByJgbh(jgbh);
	}

	/**
	 * 根据设施编号查询安保设施
	 */
	public DwabssBean queryAbssBySsbh(String ssbh) throws Exception {
		return dao.queryDwabssBySsbh(ssbh);
	}

	/**
	 * 根据机构编号查询单位安保设施
	 */
	public List<DwabssBean> queryAbssListByjgbh(String jgbh) throws Exception {
		return dao.queryAbssListByJgbh(jgbh);
	}

	/**
	 * 根据编号查询安全检查
	 */
	public DwaqjcBean queryAqjcByJlbh(String jlbh) throws Exception {
		return dao.queryDwaqjcByJlbh(jlbh);
	}

	/**
	 * 根据机构编号查询单位安全检查
	 */
	public List<DwaqjcBean> queryAqjcListByJgbh(String jgbh) throws Exception {
		return dao.queryAqjcListByJgbh(jgbh);
	}

	/**
	 * 根据从业人员编号查询从业人员
	 */
	public DwcyryBean queryCyryByCyrybh(String cyrybh) throws Exception {
		//查询从业人员信息
		DwcyryBean cyry =  dao.queryDwcyryByCyrybh(cyrybh);
		if(cyry != null)
		{
			LsglRkJbxxDao rkDao = new LsglRkJbxxDaoImpl();
			//查询人口基本信息
			if(ValidateHelper.isNotEmptyString(cyry.getRybh()))
			{
				RkJbxxBean rkjbxx = rkDao.queryRkJbxxBeanByRybh(cyry.getRybh());
				if(rkjbxx != null)
				{
					BeanUtils.copyProperties(rkjbxx, cyry);
				}
			}
		}
		return cyry;
	}

	/**
	 * 根据条件查询从业人员
	 */
	public PageResultInfo<DwcyryBean> queryCyryPageResultInfo(PageInfo pageInfo, QueryBean bean) throws Exception 
	{
		return dao.queryDwCyryPageResultInfo(pageInfo, bean);
	}
	
	/**
	 * 分页查询单位基本信息
	 */
	public PageResultInfo<DwjbxxBean> queryDwjbxxPageResultInfo(
			PageInfo pageInfo, DwQueryBean bean) throws SQLException {
		PageResultInfo<DwjbxxBean> dwjbxx = null;
		//特种行业
		/*if("01".equals(bean.getHylb())){
			dwjbxx = dao.queryTzhy(pageInfo, bean);
		//公共场所	
		}else if("02".equals(bean.getHylb())){
			dwjbxx = dao.queryGgcs(pageInfo, bean);
		//企事业单位	
		}else*/ if("03".equals(bean.getHylb())){
			dwjbxx = dao.queryNbdw(pageInfo, bean);
		//危险物品单位	
		}/*else if("04".equals(bean.getHylb())){
			dwjbxx = dao.queryWxwpdw(pageInfo, bean);
		//上网服务场所	
		}else if("05".equals(bean.getHylb())){
			dwjbxx = dao.queryWb(pageInfo, bean);
		//涉外单位	
		}else if("06".equals(bean.getHylb())){
			dwjbxx = dao.querySwdw(pageInfo, bean);
		//所有单位	
		}*/
		else
		{
			dwjbxx = dao.queryDwjbxxPageResInfo(pageInfo, bean);
		}
		return dwjbxx;
	}

	public PageResultInfo<DwjbxxBean> queryNbdwPageResultInfo (PageInfo pageInfo , DwQueryBean bean) throws SQLException{
		return dao.queryNbdwPageResultInfo(bean, pageInfo);
	}
	
	/**
	 * 根据编号查询单位奖惩信息
	 */
	public DwjcBean queryDwjcByBh(String bh) throws Exception {
		return dao.queryDwjcByBh(bh);
	}

	/**
	 * 根据机构编号查询单位奖惩信息
	 */
	public List<DwjcBean> queryDwjcListByJgbh(String jgbh) throws Exception {
		return dao.queryDwJcListByJgbh(jgbh);
	}

	/**
	 * 根据要害部位编号查询重点要害部位
	 */
	public ZdyhbwBean queryZdthByYhbwbh(String yhbwbh) throws Exception {
		return dao.queryZdyhbwByYhbwbh(yhbwbh);
	}

	/**
	 * 根据机构编号查询单位重点要害部位
	 */
	public List<ZdyhbwBean> queryZdyhbwListByJgbh(String jgbh) throws Exception {
		return dao.queryZdyhbwListByJgbh(jgbh);
	}
	
	/**
	 * 根据照片ID查询照片
	 */
	public Blob queryDwzpById(String zpid) throws Exception{
		return dao.queryDwzpByZpid(zpid);
	}
	
	/**
	 * 删除单位照片
	 */
	public void deleteDwzp(String zpid) throws Exception{
		dao.deleteDwzpByZpid(zpid);
	}

	/**
	 * 根据机构编号查询单位照片
	 */
	public List<DwzpxxBean> queryDwzpByJgbh(String jgbh) throws Exception {
		return dao.queryDwzpByJgbh(jgbh);
	}
	
	/**
	 * 获取行业类别字典
	 * @return
	 * @throws SQLException
	 */
	public List<SystemDictionaryBean> getHylbZd() throws SQLException{
		return new DwDaoImpl().getHylbZd();
	}
	
	/**
	 * 根据地址id查询地址信息
	 */
	public DzxxBean queryDzxxByDzid(String dzid) throws Exception{
		CommonDzxxDao dzxxDao = new CommonDzxxDaoImpl();
		return dzxxDao.queryDzxxBeanByDzId(dzid);
	}

	/**
	 * 保存单位基本信息
	 */
	public DwBean saveDwJbxxBean(DwBean dwBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			DwjbxxBean dwjbxx = dwBean.getDwjbxx();
			String jgbh = "";
			initCzxx(dwjbxx);
			if (ValidateHelper.isNotEmptyString(dwjbxx.getJgbh()))
			{
				dwjbxx.setCzbs(CommonConstant.CZBZ_UPDATE);//修改
				//更新单位基本信息
				dao.updateDwjbxx(dwBean.getDwjbxx());
				
				if(ValidateHelper.isNotEmptyString(dwBean.getDwfwglBean().getDwfwglid())){
					if (!dwBean.getFwBean().getFwid().equals(dwBean.getDwfwglBean().getFwid())){
						dao.zxDwfwglBean(dwBean.getDwfwglBean().getDwfwglid());
						
						// 插入单位房屋关联表
						String dwfwglid = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm") + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
						DwfwglBean glBean = new DwfwglBean();
						glBean.setDwfwglid(dwfwglid);
						glBean.setJgbh(dwBean.getDwjbxx().getJgbh());
						glBean.setFwid(dwBean.getFwBean().getFwid());
						glBean.setDzid(dwBean.getFwBean().getDzid());
						glBean.setZxbs("0");
						dao.insertDwFwglBean(glBean);
					}
				}
				
				jgbh = dwjbxx.getJgbh();
				String hylbNew = dwjbxx.getHylb();
				String hylbOld = dwjbxx.getHylb_old();
				
				//修改前为空修改后不为空新增
				if("null".equals(hylbOld) && ValidateHelper.isNotEmptyString(hylbNew)){
					for(String hylb : hylbNew.split(",")){
						if("01".equals(hylb) || "07".equals(hylb) || "08".equals(hylb)){
							TzhyBean tzhy = dwBean.getTzhy();
							tzhy.setJgbh(jgbh);
							tzhy.setThmc(dwjbxx.getDwmc());
							saveTzhyBean(dwBean);
							dwBean.setTzhy(tzhy);
						}else if("02".equals(hylb)){
							GgcsBean ggcs = dwBean.getGgcs();
							ggcs.setJgbh(jgbh);
							ggcs.setCsmc(dwjbxx.getDwmc());
							saveGGCSBean(dwBean);
							dwBean.setGgcs(ggcs);
						}else if("03".equals(hylb)){
							NbdwBean nbdw = dwBean.getNbdw();
							nbdw.setJgbh(jgbh);
							saveNbdwBean(dwBean);
							dwBean.setNbdw(nbdw);
						}else if("04".equals(hylb)){
							WxwpdwBean wxwp = dwBean.getWxwpdwBean();
							wxwp.setJgbh(jgbh);
							dwBean.setWxwpdwBean(wxwp);
							saveWxwpdwBean(dwBean);
						}else if("05".equals(hylb)){
							SwfwcsBean wb = dwBean.getSwfwcs();
							wb.setJgbh(jgbh);
							saveSwfwcsBean(dwBean);
							dwBean.setSwfwcs(wb);
						}else if("06".equals(hylb)){
							SwdwBean swdw = dwBean.getSwdwBean();
							swdw.setJgbh(jgbh);
							saveSwdwBean(dwBean);
							dwBean.setSwdwBean(swdw);
						}else if("09".equals(hylb)){
							JfdwBean jfdw = dwBean.getJfdw();
							jfdw.setJgbh(jgbh);
							saveJfdw(jfdw);
							dwBean.setJfdw(jfdw);
						}
					}
				//修改前不为空 修改后为空  删除	
				}else if(ValidateHelper.isNotEmptyString(hylbOld) && ValidateHelper.isEmptyString(hylbNew)){
					for(String hylb : hylbOld.split(",")){
						if("01".equals(hylb)){
							dao.deleteTzhy(jgbh);
							dao.deleteThKs(jgbh);
							dao.deleteThlg(jgbh);
							dwBean.setTzhy(null);
							dwBean.setThlgy(null);
							dwBean.setThksyBean(null);
						}else if("02".equals(hylb)){
							dao.deleteGgcs(jgbh);
							dwBean.setGgcs(null);
						}else if("03".equals(hylb)){
							dao.deleteNbdw(jgbh);
							dwBean.setNbdw(null);
						}else if("04".equals(hylb)){
							dao.deleteWxwpdw(jgbh);
							dwBean.setWxwpdwBean(null);
						}else if("05".equals(hylb)){
							dao.deleteSwfwcs(jgbh);
							dwBean.setSwfwcs(null);
						}else if("06".equals(hylb)){
							dao.deleteSwdw(jgbh);
							dwBean.setSwdwBean(null);
						}else if("07".equals(hylb)){
							dao.deleteThlg(jgbh);
							dwBean.setThlgy(null);
						}else if("08".equals(hylb)){
							dao.deleteThKs(jgbh);
							dwBean.setThksyBean(null);
						}
						else if("09".equals(hylb)){
							dao.delJfwdw(jgbh);
							dwBean.setJfdw(null);
						}
					}
				//修改前与修改后不同且都不为空	
				}else if(ValidateHelper.isNotEmptyString(hylbOld) && ValidateHelper.isNotEmptyString(hylbNew)){
					//修改前存在修改后不存在  删除
					for(String hylb : hylbOld.split(",")){
						if(!hylbNew.contains(hylb)){
							if("01".equals(hylb)){
								dao.deleteTzhy(jgbh);
								dao.deleteThKs(jgbh);
								dao.deleteThlg(jgbh);
							}else if("02".equals(hylb)){
								dao.deleteGgcs(jgbh);
							}else if("03".equals(hylb)){
								dao.deleteNbdw(jgbh);
							}else if("04".equals(hylb)){
								dao.deleteWxwpdw(jgbh);
							}else if("05".equals(hylb)){
								dao.deleteSwfwcs(jgbh);
							}else if("06".equals(hylb)){
								dao.deleteSwdw(jgbh);
							}else if("07".equals(hylb)){
								dao.deleteThlg(jgbh);
							}else if("08".equals(hylb)){
								dao.deleteThKs(jgbh);
							}else if("09".equals(hylb)){
								dao.delJfwdw(jgbh);
							}
						}
					}
					
					//修改前不存在修改后存在 新增
					for(String hylb : hylbNew.split(",")){
						if(!hylbOld.contains(hylb)){
							if("01".equals(hylb) || "07".equals(hylb) || "08".equals(hylb)){
								TzhyBean tzhy = dwBean.getTzhy();
								tzhy.setJgbh(jgbh);
								tzhy.setThmc(dwjbxx.getDwmc());
								saveTzhyBean(dwBean);
								dwBean.setTzhy(tzhy);
							}else if("02".equals(hylb)){
								GgcsBean ggcs = dwBean.getGgcs();
								ggcs.setJgbh(jgbh);
								ggcs.setCsmc(dwjbxx.getDwmc());
								saveGGCSBean(dwBean);
								dwBean.setGgcs(ggcs);
							}else if("03".equals(hylb)){
								NbdwBean nbdw = dwBean.getNbdw();
								nbdw.setJgbh(jgbh);
								saveNbdwBean(dwBean);
								dwBean.setNbdw(nbdw);
							}else if("04".equals(hylb)){
								WxwpdwBean wxwp = dwBean.getWxwpdwBean();
								wxwp.setJgbh(jgbh);
								saveWxwpdwBean(dwBean);
								dwBean.setWxwpdwBean(wxwp);
							}else if("05".equals(hylb)){
								SwfwcsBean wb = dwBean.getSwfwcs();
								wb.setJgbh(jgbh);
								saveSwfwcsBean(dwBean);
								dwBean.setSwfwcs(wb);
							}else if("06".equals(hylb)){
								SwdwBean swdw = dwBean.getSwdwBean();
								swdw.setJgbh(jgbh);
								saveSwdwBean(dwBean);
								dwBean.setSwdwBean(swdw);
							}else if("09".equals(hylb)){
								JfdwBean jfdw = dwBean.getJfdw();
								jfdw.setJgbh(jgbh);
								saveJfdw(jfdw);
								dwBean.setJfdw(jfdw);
							}
						}
					}
					
					//修改前与修改后相同 更新
					for(String hylb : hylbNew.split(",")){
						if(hylbOld.contains(hylb)){
							if("01".equals(hylb) || "07".equals(hylb) || "08".equals(hylb)){
								TzhyBean tzhy = dwBean.getTzhy();
								dwBean.setTzhy(tzhy);
								saveTzhyBean(dwBean);
							}else if("02".equals(hylb)){
								GgcsBean ggcs = dwBean.getGgcs();
								dwBean.setGgcs(ggcs);
								saveGGCSBean(dwBean);
							}else if("03".equals(hylb)){
								NbdwBean nbdw = dwBean.getNbdw();
								dwBean.setNbdw(nbdw);
								saveNbdwBean(dwBean);
							}else if("04".equals(hylb)){
								WxwpdwBean wxwp = dwBean.getWxwpdwBean();
								dwBean.setWxwpdwBean(wxwp);
								saveWxwpdwBean(dwBean);
							}else if("05".equals(hylb)){
								SwfwcsBean wb = dwBean.getSwfwcs();
								dwBean.setSwfwcs(wb);
								saveSwfwcsBean(dwBean);
							}else if("06".equals(hylb)){
								SwdwBean swdw = dwBean.getSwdwBean();
								dwBean.setSwdwBean(swdw);
								saveSwdwBean(dwBean);
							}else if("09".equals(hylb)){
								JfdwBean jfdw = dwBean.getJfdw();
								jfdw.setJgbh(jgbh);
								saveJfdw(jfdw);
								dwBean.setJfdw(jfdw);
							}
						}
					}
					
					
				}
				
			}
			else
			{
				dwjbxx.setCzbs(CommonConstant.CZBZ_ADD);//新增
				initDjxx(dwjbxx);
				initCzxx(dwjbxx);
				
				// 插入单位基本信息
				jgbh = CommonSequenceHelper.getJGBH(ActionContextHelper.getLoginInfo().getOrgcode(), "JG");
				dwBean.getDwjbxx().setJgbh(jgbh);
				dao.insertDwjbxx(dwBean.getDwjbxx());
				
				if(ValidateHelper.isNotEmptyString(dwBean.getFwBean().getFwid())){
					// 插入单位房屋关联表
					String glbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
					DwfwglBean glBean = new DwfwglBean();
					glBean.setDwfwglid(glbh);
					glBean.setJgbh(dwBean.getDwjbxx().getJgbh());
					glBean.setFwid(dwBean.getFwBean().getFwid());
					glBean.setDzid(dwBean.getFwBean().getDzid());
					glBean.setZxbs("0");
					dao.insertDwFwglBean(glBean);
				}
				
				/**
				 * 根据行业类别新增单位特性信息
				 * 01 特种行业
				 * 02 公共场所
				 * 03 企事业单位
				 * 04 危险物品单位
				 * 05 上网服务场所
				 * 06 涉外单位
				 */
				if(ValidateHelper.isNotEmptyString(dwjbxx.getHylb())){
					String [] hylbarry = dwjbxx.getHylb().split(",");
					for(String hylb : hylbarry){
						if("01".equals(hylb)){
							TzhyBean tzhy = dwBean.getTzhy();
							tzhy.setJgbh(jgbh);
							tzhy.setThmc(dwjbxx.getDwmc());
							dwBean.setTzhy(tzhy);
							saveTzhyBean(dwBean);
						}else if("02".equals(hylb)){
							GgcsBean ggcs = dwBean.getGgcs();
							ggcs.setJgbh(jgbh);
							ggcs.setCsmc(dwjbxx.getDwmc());
							dwBean.setGgcs(ggcs);
							saveGGCSBean(dwBean);
						}else if("03".equals(hylb)){
							NbdwBean nbdw = dwBean.getNbdw();
							nbdw.setJgbh(jgbh);
							dwBean.setNbdw(nbdw);
							saveNbdwBean(dwBean);
						}else if("04".equals(hylb)){
							WxwpdwBean wxwp = dwBean.getWxwpdwBean();
							wxwp.setJgbh(jgbh);
							dwBean.setWxwpdwBean(wxwp);
							saveWxwpdwBean(dwBean);
						}else if("05".equals(hylb)){
							SwfwcsBean wb = dwBean.getSwfwcs();
							wb.setJgbh(jgbh);
							dwBean.setSwfwcs(wb);
							saveSwfwcsBean(dwBean);
						}else if("06".equals(hylb)){
							SwdwBean swdw = dwBean.getSwdwBean();
							swdw.setJgbh(jgbh);
							dwBean.setSwdwBean(swdw);
							saveSwdwBean(dwBean);
						}else if("09".equals(hylb)){
							JfdwBean jfdw = dwBean.getJfdw();
							jfdw.setJgbh(jgbh);
							saveJfdw(jfdw);
							dwBean.setJfdw(jfdw);
						}
					}
					
				}
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
			throw new Exception("保存单位信息失败");
		}
		return dwBean;
	}

	/**
	 * 根据机构编号查询单位信息
	 */
	public DwBean queryDwJbxxByJgbh(String jgbh) throws Exception
	{
		DwBean dw = new DwBean();
		// 单位基本信息
		DwjbxxBean dwjbxx = dao.queryDwjbxxByJgbh(jgbh);
		dw.setDwjbxx(dwjbxx);
		
		//房屋单位关联
		DwfwglBean glBean = dao.queryDwfwglBean(jgbh);
		dw.setDwfwglBean(glBean);
		if(glBean != null){
			//房屋对象
			FwJbxxBean fwBean = fwDao.queryFwJbxxBeanByFwid(glBean.getFwid(),"fwinfo");
			dw.setFwBean(fwBean);
		}
		
		return dw;
	}

	/**
	 * 保存特种行业对象
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-14 上午11:30:56
	 */
	public DwBean saveTzhyBean(DwBean dwBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String dwsx = dwBean.getDwjbxx().getHylb();
			TzhyBean tzhyBean = dwBean.getTzhy();
			tzhyBean.setJgbh(dwBean.getDwjbxx().getJgbh());
			//保存特种行业
			if (ValidateHelper.isEmptyString(dwBean.getTzhy().getThbh()))
			{
				String tzhybh = CommonSequenceHelper.getJGBH(ActionContextHelper.getLoginInfo().getOrgcode(), "TH");
				tzhyBean.setThbh(tzhybh);
				if(dwBean.getDwjbxx() != null){
					tzhyBean.setThmc(dwBean.getDwjbxx().getDwmc());
				}
				dao.insertTzhy(dwBean.getTzhy());
				dwBean.setTzhy(tzhyBean);
				
				for(String sx:dwsx.split(",")){
					if (CommonFinalParams.TZHYLB_LGY.equals(sx)){
						String lgbh = CommonSequenceHelper.getDWBH("LG");
						ThlgyBean thlgBean = dwBean.getThlgy();
						thlgBean.setLgbh(lgbh);
						thlgBean.setJgbh(tzhyBean.getJgbh());
						thlgBean.setThbh(tzhybh);
						dao.inserThlgy(thlgBean);
						dwBean.setThlgy(thlgBean);
					}
					if (CommonFinalParams.TZHYLB_KSY.equals(sx)){
						String ksbh =  CommonSequenceHelper.getDWBH("KS");
						ThksyBean thksyBean = dwBean.getThksyBean();
						thksyBean.setKsbh(ksbh);
						thksyBean.setThbh(tzhybh);
						thksyBean.setJgbh(tzhyBean.getJgbh());
						thksyBean.setJgmc(tzhyBean.getThmc());
						dao.insertThksyBean(thksyBean);
						dwBean.setThksyBean(thksyBean);
					}
				}
			}
			else
			{
				dao.updateTzhy(dwBean.getTzhy());
				dao.updateDwczlx(dwBean.getTzhy().getJgbh(),"2", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
				dwBean.setTzhy(tzhyBean);
				
				for(String sx:dwsx.split(",")){
					if ("07".equals(sx)){
						ThlgyBean thlg = dwBean.getThlgy();
						if(thlg != null){
							if(ValidateHelper.isEmptyString(thlg.getLgbh())){
								String lgbh = CommonSequenceHelper.getDWBH("LG");
								thlg.setLgbh(lgbh);
								thlg.setJgbh(tzhyBean.getJgbh());
								thlg.setThbh(tzhyBean.getThbh());
								dao.inserThlgy(thlg);
							}else{
								dao.updateThlgy(thlg);
							}
							dwBean.setThlgy(thlg);
						}
					}else if ("08".equals(sx)){
						ThksyBean ksy = dwBean.getThksyBean();
						if(ksy != null){
							if(ValidateHelper.isEmptyString(ksy.getKsbh())){
								String ksbh =  CommonSequenceHelper.getDWBH("KS");
								ksy.setKsbh(ksbh);
								ksy.setThbh(tzhyBean.getThbh());
								ksy.setJgbh(tzhyBean.getJgbh());
								ksy.setJgmc(tzhyBean.getThmc());
								dao.insertThksyBean(ksy);
							}else{
								dao.updateThksyBean(ksy);
							}
							dwBean.setThksyBean(ksy);
						}
					}
				}
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
			throw new Exception("保存特种行业信息失败");
		}
		return dwBean;
	}

	/**
	 * 通过机构编号查询行业信息
	 * @param jghb
	 * @param hylb
	 * @return
	 * @throws Exception
	 * @date 2013-10-14 下午03:24:06
	 */
	public DwBean queryDwHyInfo(String jgbh, String hylb) throws Exception
	{
		DwBean dwBean = new DwBean();
		dwBean.getDwjbxx().setJgbh(jgbh);
		dwBean.getDwjbxx().setHylb(hylb);
		dwBean.setDwjbxx(dao.queryDwjbxxByJgbh(jgbh));
		String dwsx = dwBean.getDwjbxx().getHylb();
		for(String sx : dwsx.split(",")){
			if("01".equals(sx)){
				dwBean.setTzhy(dao.queryTzhyByJgbh(jgbh));
			}
			if("02".equals(sx)){
				dwBean.setGgcs(dao.queryGgcsByJgbh(jgbh));			
			}
			if("03".equals(sx)){
				dwBean.setNbdw(dao.queryNbdwByJgbh(jgbh));
			}
			if("04".equals(sx)){
				dwBean.setWxwpdwBean(dao.queryWxwpdwBean(jgbh));
			}
			if("05".equals(sx)){
				dwBean.setSwfwcs(dao.querySwfwcsByJgbh(jgbh));
			}
			if("06".equals(sx)){
				dwBean.setSwdwBean(dao.querySwdwBeanByJgbh(jgbh));
			}
			if("07".equals(sx)){
				dwBean.setThlgy(dao.queryThlgyByJgbh(jgbh));
			}
			if("08".equals(sx)){
				dwBean.setThksyBean(dao.queryThksyBean(jgbh));
			}
			if("09".equals(sx)){
				dwBean.setJfdw(dao.queryJfdwByJgbh(jgbh));
			}
		}
		return dwBean;
	}

	/**
	 * 保存公共场所信息
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-15 下午01:45:07
	 */
	public DwBean saveGGCSBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		GgcsBean ggcsBean = dwBean.getGgcs();
		ggcsBean.setJgbh(dwBean.getDwjbxx().getJgbh());
		if (ValidateHelper.isNotEmptyString(ggcsBean.getJlbh()))
		{
			dao.updateGgcs(ggcsBean);
			dao.updateDwczlx(ggcsBean.getJgbh(),"2", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		else
		{
			String jlbh = CommonSequenceHelper.getDWBH("GG");
			ggcsBean.setJlbh(jlbh);
			dao.insertGgcs(ggcsBean);
			dao.updateDwczlx(ggcsBean.getJgbh(),"1", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		return dwBean;
	}
	
	/**
	 * 保存内保单位
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-15 下午04:30:10
	 */
	public DwBean saveNbdwBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		NbdwBean bean = dwBean.getNbdw();
		bean.setJgbh(dwBean.getDwjbxx().getJgbh());
		if (ValidateHelper.isNotEmptyString(bean.getNbdwbh()))
		{
			dao.updateNbdw(bean);
			dao.updateDwczlx(bean.getJgbh(),"2", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		else
		{
			String jlbh = CommonSequenceHelper.getDWBH("NB");
			bean.setNbdwbh(jlbh);
			dao.insertNbdw(bean);
			dao.updateDwczlx(bean.getJgbh(),"1", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		return dwBean;
	}
	
	/**
	 * 保存上网服务场所
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-15 下午05:57:59
	 */
	public DwBean saveSwfwcsBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		SwfwcsBean bean = dwBean.getSwfwcs();
		bean.setJgbh(dwBean.getDwjbxx().getJgbh());
		if (ValidateHelper.isNotEmptyString(bean.getJlbh()))
		{
			dao.updateSwfwcs(bean);
			dao.updateDwczlx(bean.getJgbh(),"2", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		else
		{
			String jlbh = CommonSequenceHelper.getJGBH(ActionContextHelper.getLoginInfo().getOrgcode(), "WB");
			bean.setJlbh(jlbh);
			
			dao.insertSwfwcs(bean);
			dao.updateDwczlx(bean.getJgbh(),"1", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		return dwBean;
	}

	/**
	 * 更新涉外单位
	 * @param swdwBean
	 * @throws Exception
	 * @date 2013-10-16 上午09:10:02
	 */
	public DwBean saveSwdwBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		SwdwBean bean = dwBean.getSwdwBean();
		bean.setJgbh(dwBean.getDwjbxx().getJgbh());
		if (ValidateHelper.isNotEmptyString(bean.getJlbh()))
		{
			dao.updateSwdwBean(bean);
			dao.updateDwczlx(bean.getJgbh(),"2", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		else
		{
			String jlbh = CommonSequenceHelper.getJGBH(ActionContextHelper.getLoginInfo().getOrgcode(), "SW");
			bean.setJlbh(jlbh);
			
			dao.insertSwdwBean(bean);
			dao.updateDwczlx(bean.getJgbh(),"1", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		return dwBean;
	}

	/**
	 * 保存危险物品单位
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-16 上午10:41:53
	 */
	public DwBean saveWxwpdwBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		WxwpdwBean bean = dwBean.getWxwpdwBean();
		bean.setJgbh(dwBean.getDwjbxx().getJgbh());
		if (ValidateHelper.isNotEmptyString(bean.getJlbh()))
		{
			dao.updateWxwpdwBean(bean);
			dao.updateDwczlx(bean.getJgbh(),"2", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		else
		{
			String jlbh = CommonSequenceHelper.getJGBH(ActionContextHelper.getLoginInfo().getOrgcode(), "SW");
			bean.setJlbh(jlbh);
		
			dao.insertWxwpdwBean(bean);
			dao.updateDwczlx(bean.getJgbh(),"1", loginInfo.getRealname(), loginInfo.getOrgcode(), loginInfo.getOrgname());
		}
		dwBean.setWxwpdwBean(bean);
		return dwBean;
	}

	/**
	 * 保存单位照片
	 * @param zps
	 * @param zpsFileName
	 * @return
	 * @date 2013-10-16 下午02:45:33
	 */
	public DwBean saveDwzpBean(DwBean dwBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (ValidateHelper.isNotEmptyArray(dwBean.getDwzp().getZps()))
		{
			List<DwzpxxBean> zpList = new ArrayList<DwzpxxBean>();
			DwzpxxBean zp = null;
			for(int i = 0 ; i < dwBean.getDwzp().getZps().length; i++)
			{
				zp = new DwzpxxBean();
				zp.setId(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_DWZP"));
				zp.setJgbh(dwBean.getDwjbxx().getJgbh());
				zp.setZp(dwBean.getDwzp().getZps()[i]);
				zp.setMs(dwBean.getDwzp().getZpsFileName()[i]);
				zp.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				zp.setDjrxm(loginInfo.getRealname());
				zp.setDjdwmc(loginInfo.getOrgname());
				zp.setDjdwdm(loginInfo.getOrgcode());
				zpList.add(zp);
			}
			dao.insertDwzp(zpList);
			dwBean.setDwzpList(zpList);
		}
		return dwBean;
	}

	/**
	 * 保存从业人员
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-16 下午04:12:23
	 */
	public DwBean saveCyryBean(DwBean dwBean,RkxxBean rkBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			DwcyryBean cyryBean = dwBean.getCyry();
			
			cyryBean.setSfabry(CommonConstant.FOU);
			
			if("".equals(cyryBean.getJgbh()) || cyryBean.getJgbh() == null){
				cyryBean.setJgbh(dwBean.getDwjbxx().getJgbh());
			}
			
			//职务类别的父代码为"abry" 标识此从业人员为安保人员
			if(ValidateHelper.isNotEmptyString(cyryBean.getZwlb())){
				SystemDictionaryBean dic = DictionaryCacheHellper.getSystemDictionaryBeanByZdlbAndDm("ZAGL_RY_ZW", cyryBean.getZwlb());
				if("abry".equals(dic.getParent_dm())){
					cyryBean.setSfabry(CommonConstant.SHI);
				}
			}
			
			if("".equals(cyryBean.getSfjwry()) || null == cyryBean.getSfjwry()){
				cyryBean.setSfjwry(CommonConstant.FOU);
			}
			
			
			/* ******************人口信息维护******************* */
			//不是境外人员
			if(CommonConstant.FOU.equals(cyryBean.getSfjwry())){
				//人员编号为空，新增人员基本信息
				RkJbxxBean rkjbxx = rkBean.getJbxxBean();
				if (ValidateHelper.isEmptyString(rkjbxx.getRybh()))
				{
					String rybh = CommonSequenceHelper.getRybh(loginInfo.getOrgcode());
					rkjbxx.setRybh(rybh);
					rkjbxx.setFwcs(dwBean.getCyry().getDwmc());
					rkDao.insertRkJbxxBean(rkjbxx);
				}
				else
				{
					rkjbxx.setFwcs(dwBean.getCyry().getDwmc());
					rkDao.updateRkJbxxBean(rkjbxx);
				}
				cyryBean.setRybh(rkjbxx.getRybh());
				
				
				/****人口房屋对应关系维护****/
				/**
				//存在对应关系
				if(ValidateHelper.isNotEmptyString(cyryBean.getRkfwglid()))
				{
					RkfwglBean rkfw = null;
					rkfw = rkDao.queryFwRkGlBeanByFwrkglid(cyryBean.getRkfwglid());
					//人口房屋对应关系不存在新增
					if(rkfw == null){
						RkfwglBean fwrkglBean = new RkfwglBean();
						String rkfwglid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
						fwrkglBean.setRkfwglid(rkfwglid);
						fwrkglBean.setFwid(cyryBean.getFwid());
						fwrkglBean.setDzid(cyryBean.getDzid());
						fwrkglBean.setRybh(cyryBean.getRybh());
						fwrkglBean.setSfzh(cyryBean.getSfzh());
						rkDao.insertFwRkGlBean(fwrkglBean);
						
						cyryBean.setRkfwglid(rkfwglid);
					//人口房屋对应关系存在，但与录入的房屋与查询的不同，修改对应关系
					}else if(!cyryBean.getFwid().equals(rkfw.getFwid())){
						RkfwglBean fwrkglBean = new RkfwglBean();
						fwrkglBean.setRkfwglid(cyryBean.getRkfwglid());
						fwrkglBean.setFwid(cyryBean.getFwid());
						fwrkglBean.setDzid(cyryBean.getDzid());
						rkDao.updateFwrkGlDzBean(fwrkglBean);
					}
				}else{
					//人员没有人口房屋对应关系，则对应新增关系
					if(ValidateHelper.isNotEmptyString(cyryBean.getFwid()) && ValidateHelper.isNotEmptyString(cyryBean.getDzid())){
						//新增人口房屋关联信息
						RkfwglBean fwrkglBean = new RkfwglBean();
						String rkfwglid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
						fwrkglBean.setRybh(cyryBean.getRybh());
						fwrkglBean.setRkfwglid(rkfwglid);
						fwrkglBean.setFwid(cyryBean.getFwid());
						fwrkglBean.setDzid(cyryBean.getDzid());
						fwrkglBean.setRybh(cyryBean.getRybh());
						fwrkglBean.setSfzh(cyryBean.getSfzh());
						rkDao.insertFwRkGlBean(fwrkglBean);
						cyryBean.setRkfwglid(rkfwglid);
					}
				}
				**/
				
			}else if(CommonConstant.SHI.equals(cyryBean.getSfjwry())){
				//维护境外人员信息
				LsglRkService rkService = new LsglRkServiceImpl();
				rkService.saveRkJbxxBean(rkBean);
				
				if(ValidateHelper.isNotEmptyString(rkBean.getJwrkBean().getJwbh())){
					rkDao.updateJwrkxxBean(rkBean.getJwrkBean());
				}else{
					String jwbh = CommonSequenceHelper.getJwbh(loginInfo.getOrgcode());
					JwrkxxBean jwrk = rkBean.getJwrkBean();
					jwrk.setJwbh(jwbh);
					jwrk.setRybh(rkBean.getJbxxBean().getRybh());
					jwrk.setCzbs(CommonConstant.CZBZ_ADD);
					
//					jwrk.setDjrxm(login.getRealname());
//					jwrk.setDjdwdm(login.getOrgcode());
//					jwrk.setDjrsfzh(login.getSfzh());
//					jwrk.setDjdwmc(login.getOrgname());
//					
//					jwrk.setCzdwdm(login.getOrgcode());
//					jwrk.setCzdwmc(login.getOrgname());
//					jwrk.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
//					jwrk.setCzrjh(login.getUsername());
//					jwrk.setCzrsfzh(login.getSfzh());
//					jwrk.setCzrxm(login.getRealname());
					
					
					rkDao.insertJwrkxxBean(jwrk);
				}
			}
			
			/* ****************从业人员信息维护******************/
			if (ValidateHelper.isNotEmptyString(cyryBean.getCyrybh()))
			{
				//更新
				cyryBean.setCzbs(CommonConstant.CZBZ_UPDATE);
				cyryBean.setCzrjh(loginInfo.getUsername());
				cyryBean.setCzdwdm(loginInfo.getOrgcode());
				cyryBean.setCzdwmc(loginInfo.getOrgname());
				cyryBean.setCzrxm(loginInfo.getRealname());
				cyryBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				cyryBean.setCzrsfzh(loginInfo.getSfzh());
				dao.updateDwcyry(cyryBean);
				
				//更新人员属性
				String rysx = CommonSequenceHelper.getRysx(dwBean.getCyry().getSfzh(), "18", "I");
				rkDao.updateRysxBySfzh(dwBean.getCyry().getSfzh(), rysx);
			}
			else
			{
				//先注销原从业人员信息
				//dao.zxDwCyryxx(cyryBean.getSfzh());
				
				String cyrybh = CommonSequenceHelper.getDWCYRYBH(ActionContextHelper.getLoginInfo().getOrgcode());
				cyryBean.setCyrybh(cyrybh);
				//新增
				cyryBean.setCzbs(CommonConstant.CZBZ_ADD);
				cyryBean.setCzdwdm(loginInfo.getOrgcode());
				cyryBean.setCzdwmc(loginInfo.getOrgname());
				cyryBean.setCzrxm(loginInfo.getRealname());
				cyryBean.setCzrjh(loginInfo.getUsername());
				cyryBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				cyryBean.setCzrsfzh(loginInfo.getSfzh());
				//登记
				cyryBean.setDjrjh(loginInfo.getUsername());
				cyryBean.setDjdwdm(loginInfo.getOrgcode());
				cyryBean.setDjdwmc(loginInfo.getOrgname());
				cyryBean.setDjrxm(loginInfo.getRealname());
				cyryBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				cyryBean.setDjrsfzh(loginInfo.getSfzh());
				
				//现住地警务区不为空  新增派发时间
				if(ValidateHelper.isNotEmptyString(cyryBean.getXzdjwq())){
					cyryBean.setPfsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				}
				
				dao.insertDwcyry(cyryBean);
				
				//更新人员属性
				String rysx = CommonSequenceHelper.getRysx(dwBean.getCyry().getSfzh(), "18", "I");
				rkDao.updateRysxBySfzh(dwBean.getCyry().getSfzh(), rysx);
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
			throw new Exception("保存从业人员信息失败.");
		}
		
		return dwBean;
	}
	
	
	public void saveCyryRkfwglBean(DwBean dwBean) throws Exception
	{
		RkfwglBean rkfwglBean = dwBean.getRkfwglBean();
		//存在先注销
		if (ValidateHelper.isNotEmptyString(rkfwglBean.getRkfwglid()))
		{
			rkDao.zxRkfwBean(rkfwglBean.getRkfwglid());
		}
		if (ValidateHelper.isNotEmptyString(dwBean.getFwBean().getFwid()))
		{
			String currentXzqh = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
			String rkfwglid = currentXzqh + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_lsgl_fwrkid");
			
			rkfwglBean.setRkfwglid(rkfwglid);
			rkfwglBean.setRybh(dwBean.getCyry().getRybh());
			rkfwglBean.setFwid(dwBean.getFwBean().getFwid());
			rkfwglBean.setDzid(dwBean.getFwBean().getDzid());
			rkfwglBean.setZxbs("0");
			
			rkDao.insertFwRkGlBean(rkfwglBean);
		}
	}

	/**
	 * 保存单位安全检查信息
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-17 上午09:28:41
	 */
	public DwBean saveDwAqjcBean(DwBean dwBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			DwaqjcBean bean = dwBean.getAqjc();
			bean.setJgbh(dwBean.getDwjbxx().getJgbh());
			if (ValidateHelper.isNotEmptyString(bean.getJlbh()))
			{
				//更新
				bean.setCzbs(CommonConstant.CZBZ_UPDATE);
				initCzxx(bean);
				dao.updateDwaqjc(bean);
			}
			else
			{
				String jlbh = CommonSequenceHelper.getDWAQJCXXBH();
				bean.setJlbh(jlbh);
				//更新
				bean.setCzbs(CommonConstant.CZBZ_ADD);
				initCzxx(bean);
				
				//登记
				initDjxx(bean);
				dao.insertDwaqjc(bean);
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
			throw new Exception("保存单位安全检查信息失败.");
		}
		return dwBean;
	}

	/**
	 * 分页查询单位安全检查信息
	 * @param pageInfo
	 * @param queryBean
	 * @return
	 * @date 2013-10-17 上午10:10:07
	 */
	public PageResultInfo<DwaqjcBean> queryDwAqjcPageResultInfoByJgbh(
			PageInfo pageInfo, DwQueryBean queryBean)
	{
		return dao.queryDwAqjcPageResultInfoByJgbh(pageInfo, queryBean);
	}

	/**
	 * 保存单奖惩信息
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-17 上午11:15:41
	 */
	public DwBean saveDwJcxxBean(DwBean dwBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			DwjcBean bean = dwBean.getDwjc();
			bean.setJgbh(dwBean.getDwjbxx().getJgbh());
			if (ValidateHelper.isNotEmptyString(bean.getBh()))
			{
				//更新
				bean.setCzbs(CommonConstant.CZBZ_UPDATE);
				initCzxx(bean);
				dao.updateDwjc(bean);
			}
			else
			{
				String jlbh = CommonSequenceHelper.getDWCFXXBH();
				bean.setBh(jlbh);
				//更新
				bean.setCzbs(CommonConstant.CZBZ_ADD);
				initCzxx(bean);
				
				//登记
				initDjxx(bean);
				dao.insertDwjc(bean);
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
			throw new Exception("保存单位奖惩信息失败.");
		}
		return dwBean;
	}

	/**
	 * 通过机构编号分页查询
	 * @param pageInfo
	 * @param jgbh
	 * @return
	 * @date 2013-10-17 上午11:20:41
	 */
	public PageResultInfo<DwjcBean> queryDwjcPageResultInfo(PageInfo pageInfo, String jgbh)
	{
		PageResultInfo<DwjcBean> pageResultInfo = new PageResultInfo<DwjcBean>();
		try
		{
			pageResultInfo = dao.queryDwjcPageResultInfoByJgbh(pageInfo, jgbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return pageResultInfo;
	}
	
	/**
	 * 保存重点要害部位
	 * @param dwBean
	 * @return
	 * @throws Exception
	 * @date 2013-10-17 下午02:59:36
	 */
	public DwBean saveZdyhbwBean(DwBean dwBean) throws Exception
	{
		TransactionManager tm = null;
		try
		{
			tm = new TransactionManager();
			tm.begin();
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			ZdyhbwBean bean = dwBean.getZdyhbw();
			bean.setJgbh(dwBean.getDwjbxx().getJgbh());
			if (ValidateHelper.isNotEmptyString(bean.getYhbwbh()))
			{
				//更新
				bean.setCzbs("2");
				bean.setCzdwdm(loginInfo.getOrgcode());
				bean.setCzdwmc(loginInfo.getOrgname());
				bean.setCzrxm(loginInfo.getRealname());
				bean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				bean.setCzrjh(loginInfo.getUsername());
				bean.setCzrsfzh(loginInfo.getSfzh());
				dao.updateZdyhbw(bean);
			}
			else
			{
				String jlbh = CommonSequenceHelper.getZDYHBWBH();
				bean.setYhbwbh(jlbh);
				//更新
				bean.setCzbs("1");
				bean.setCzdwdm(loginInfo.getOrgcode());
				bean.setCzdwmc(loginInfo.getOrgname());
				bean.setCzrxm(loginInfo.getRealname());
				bean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				bean.setCzrjh(loginInfo.getUsername());
				bean.setCzrsfzh(loginInfo.getSfzh());
				//登记
				bean.setDjdwdm(loginInfo.getOrgcode());
				bean.setDjdwmc(loginInfo.getOrgname());
				bean.setDjrxm(loginInfo.getRealname());
				bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				bean.setDjrjh(loginInfo.getUsername());
				bean.setDjrsfzh(loginInfo.getSfzh());
				dao.insertZdyhbw(bean);
			}
			tm.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			tm.rollback();
			throw new Exception("保存单位奖惩信息失败.");
		}
		return dwBean;
	}

	/**
	 * 查询重点要害部位分页
	 * @param pageInfo
	 * @param jgbh
	 * @return
	 * @date 2013-10-17 下午03:07:55
	 */
	public PageResultInfo<ZdyhbwBean> queryZdyhbwPageResultInfoByJgbh(
			PageInfo pageInfo, String jgbh)
	{
		PageResultInfo<ZdyhbwBean> pageResultInfo = new PageResultInfo<ZdyhbwBean>();
		try
		{
			pageResultInfo = dao.queryZdyhbwPageResultInfoByJgbh(pageInfo, jgbh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return pageResultInfo;
	}
	
	/**
	 * 注销单位
	 */
	public void delDwByJgbh(String jgbh) throws Exception{
		TransactionManager tr = null;
		try{
			List<DwjbxxBean> dwList = dao.queryDwjbxxBYJgbhs(jgbh); 
			WbdwManagerService wbdwService = new WbdwManagerServiceImpl();
			tr = new TransactionManager();
			tr.begin();
			for(DwjbxxBean dw : dwList)
			{
				//治安审核过的单位注销时需要审核
				if(login.getLeve() == 5 && (ValidateHelper.isNotEmptyString(dw.getHylb())) && dw.getHylb().contains("04") && "1".equals(dw.getSfzagl())){
					WbdwShBean wbdwsh = new WbdwShBean();
					wbdwsh.initTjr();
					wbdwsh.setJgbh(dw.getJgbh());
					wbdwsh.setCzlx(CommonConstant.CZBZ_ZX);
					wbdwsh.setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					wbdwService.insertWbdwsh(wbdwsh);
				}else{
					DwjbxxBean dwjbxx = new DwjbxxBean();
					LoginInfo login = ActionContextHelper.getLoginInfo();
					
					dwjbxx.setJgbh(dw.getJgbh());
					dwjbxx.setZxbs(CommonConstant.ZX_DIC_ZX);
					dwjbxx.setCzbs(CommonConstant.CZBZ_UPDATE);
					dwjbxx.setZxrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					
					dwjbxx.setCzrxm(login.getRealname());
					dwjbxx.setCzdwdm(login.getOrgcode());
					dwjbxx.setCzdwmc(login.getOrgname());
					dwjbxx.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					dao.deleteDwjbxx(dwjbxx);
				}
			}
			tr.commit();
		}catch (Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
		
	}
	
	@Override
	public void delDw(DwjbxxBean dw) throws Exception {
		dao.deleteDwjbxx(dw);
	}

	/**
	 * 恢复单位
	 */
	public void resetDwByJgbh(String jgbh) throws Exception {
		TransactionManager tr = null;
		try{
			List<DwjbxxBean> dwList = dao.queryDwjbxxBYJgbhs(jgbh); 
			WbdwManagerService wbdwService = new WbdwManagerServiceImpl();
			tr = new TransactionManager();
			
			tr = new TransactionManager();
			tr.begin();
			for(DwjbxxBean dw : dwList){
				if(login.getLeve() == 5 && (ValidateHelper.isNotEmptyString(dw.getHylb())) && dw.getHylb().contains("04") && "1".equals(dw.getSfzagl())){
					WbdwShBean wbdwsh = new WbdwShBean();
					wbdwsh.initTjr();
					wbdwsh.setJgbh(dw.getJgbh());
					wbdwsh.setCzlx(CommonConstant.CZBZ_HF);
					wbdwService.insertWbdwsh(wbdwsh);
				}else{
				
					DwjbxxBean dwjbxx = new DwjbxxBean();
					LoginInfo login = ActionContextHelper.getLoginInfo();
					
					dwjbxx.setJgbh(dw.getJgbh());
					dwjbxx.setZxbs(CommonConstant.ZX_DIC_ZC);
					dwjbxx.setCzbs(CommonConstant.CZBZ_UPDATE);
					
					dwjbxx.setCzrxm(login.getRealname());
					dwjbxx.setCzdwdm(login.getOrgcode());
					dwjbxx.setCzdwmc(login.getOrgname());
					dwjbxx.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					dao.resetDw(dwjbxx);
				}
			}
			tr.commit();
		}catch (Exception e) {
			e.printStackTrace();
			tr.rollback();
		}
	}
	
	@Override
	public void resetDw(DwjbxxBean dw) throws Exception {
		dao.resetDw(dw);
	}

	/**
	 * 根据机构编号查询安全设备
	 */
	public DwAqsbBean queryDwAqsbByJgbh(String jgbh) throws Exception {
		return dao.queryDwAqsbByJgbh(jgbh);
	}

	/**
	 * 保存安全设备
	 */
	public DwBean saveDwAqsb(DwBean dw) throws Exception {
		if(dw != null){
			DwAqsbBean aqsb = dw.getAqsb();
			if(aqsb != null){
				initCzxx(aqsb);
				if(ValidateHelper.isEmptyString(aqsb.getSbbh())){
					String sbbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_DWAQSB");
					aqsb.setSbbh(sbbh);
					aqsb.setJgbh(dw.getDwjbxx().getJgbh());
					
					initDjxx(aqsb);
					aqsb.setCzbs(CommonConstant.CZBZ_ADD);
					dao.insertDwAqsb(aqsb);
					dw.setAqsb(aqsb);
				}else{
					aqsb.setCzbs(CommonConstant.CZBZ_UPDATE);
					dao.updateDwAqsb(aqsb);
				}
			}
		}
		return dw;
	}

	/**
	 * 注销从业人员
	 */
	public void delCyryByCyryBh(String cyrybh) throws Exception 
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tr = new TransactionManager();
		try {
			tr.begin();
			for(String str : cyrybh.split(","))
			{
				DwcyryBean cyry = new DwcyryBean();
				cyry.setCyrybh(str);
				cyry.setZxbs(CommonConstant.ZX_DIC_ZX);
				cyry.setLzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
				cyry.setZxrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
				cyry.setCzbs(CommonConstant.CZBZ_UPDATE);
				cyry.setCzrxm(loginInfo.getRealname());
				cyry.setCzdwdm(loginInfo.getOrgcode());
				cyry.setCzdwmc(loginInfo.getOrgname());
				cyry.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				dao.deleteDwcyry(cyry);
			}
			tr.commit();
		} catch (Exception e) {
			tr.rollback();
		}
	}

	/**
	 * 恢复从业人员
	 */
	public void resetCyryByCyryBh(String cyrybh) throws Exception {
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		TransactionManager tr = new TransactionManager();
		try {
			for(String str : cyrybh.split(",")){
				DwcyryBean cyry = new DwcyryBean();
				cyry.setCyrybh(str);
				cyry.setZxbs(CommonConstant.ZX_DIC_ZC);
				cyry.setCzbs(CommonConstant.CZBZ_UPDATE);
				cyry.setCzrxm(loginInfo.getRealname());
				cyry.setCzdwdm(loginInfo.getOrgcode());
				cyry.setCzdwmc(loginInfo.getOrgname());
				cyry.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				
				dao.deleteDwcyry(cyry);
			}
			tr.commit();
		} catch (Exception e) {
			tr.rollback();
		}
		
	}

	public void delAqyh(String bh) throws Exception {
		AqyhBean aqyh  = new AqyhBean();
		aqyh.setBh(bh);
		initCzxx(aqyh);
		aqyh.setCzbs(CommonConstant.CZBZ_DEL);
		dao.delAqyh(aqyh);
	}

	public void delBadys(String bh) throws Exception {
		BadysBean badys  = new BadysBean();
		badys.setBh(bh);
		initCzxx(badys);
		badys.setCzbs(CommonConstant.CZBZ_DEL);
		dao.delBadys(badys);
	}

	public void delBwjg(String bwjgbh) throws Exception {
		BwjgBean bwjg  = new BwjgBean();
		bwjg.setBwjgbh(bwjgbh);
		initCzxx(bwjg);
		bwjg.setCzbs(CommonConstant.CZBZ_DEL);
		dao.delBwjg(bwjg);
		
	}

	public void delBwjys(String jysbh) throws Exception {
		BwjysBean bwjys  = new BwjysBean();
		bwjys.setJysbh(jysbh);
		initCzxx(bwjys);
		bwjys.setCzbs(CommonConstant.CZBZ_DEL);
		dao.delBwjys(bwjys);
	}

	public void delBwzd(String zdbh) throws Exception {
		BwzdBean bwzd  = new BwzdBean();
		bwzd.setZdbh(zdbh);
		initCzxx(bwzd);
		bwzd.setCzbs(CommonConstant.CZBZ_DEL);
		dao.delBwzd(bwzd);
	}

	public void delTfsjya(String yabh) throws Exception {
		TfsjyaBean tfsjya  = new TfsjyaBean();
		tfsjya.setYabh(yabh);
		initCzxx(tfsjya);
		tfsjya.setCzbs(CommonConstant.CZBZ_DEL);
		dao.delTfsjya(tfsjya);
	}

	public void delYayl(String bh) throws Exception {
		YaylBean yayl  = new YaylBean();
		yayl.setBh(bh);
		initCzxx(yayl);
		yayl.setCzbs(CommonConstant.CZBZ_DEL);
		dao.delYayl(yayl);
		
	}

	public void delZhsg(String bh) throws Exception {
		ZhsgBean zhsg  = new ZhsgBean();
		zhsg.setBh(bh);
		initCzxx(zhsg);
		zhsg.setCzbs(CommonConstant.CZBZ_DEL);
		dao.delZhsg(zhsg);
		
	}

	public AqyhBean queryAqyhByBh(String bh) throws Exception {
		return dao.queryAqyhByBh(bh);
	}

	public List<AqyhBean> queryAqyhByJgbh(String jgbh) throws Exception {
		return dao.queryAqyhByJgbh(jgbh);
	}

	public BadysBean queryBadysByBh(String bh) throws Exception {
		return dao.queryBadysByBh(bh);
	}

	public List<BadysBean> queryBadysByJgbh(String jgbh) throws Exception {
		return dao.queryBadysByJgbh(jgbh);
	}

	public BwjgBean queryBwjgByBwjgbh(String bwjgbh) throws Exception {
		return dao.queryBwjgByBwjgbh(bwjgbh);
	}

	public List<BwjgBean> queryBwjgByJgbh(String jgbh) throws Exception {
		return dao.queryBwjgByJgbh(jgbh);
	}

	public List<BwjysBean> queryBwjysByJgbh(String jgbh) throws Exception {
		return dao.queryBwjysByJgbh(jgbh);
	}

	public BwjysBean queryBwjysByJysbh(String jysbh) throws Exception {
		return dao.queryBwjysByBwjysbh(jysbh);
	}

	public BwzdBean queryBwzdByBwzdbh(String zdbh) throws Exception {
		return dao.queryBwzdByBwzdbh(zdbh);
	}

	public List<BwzdBean> queryBwzdByJgbh(String jgbh) throws Exception {
		return dao.queryBwzdByJgbh(jgbh);
	}

	public List<TfsjyaBean> queryTfsjyaByJgbh(String jgbh) throws Exception {
		return dao.queryTfsjyaByJgbh(jgbh);
	}

	public TfsjyaBean queryTfsjyaByYabh(String yabh) throws Exception {
		TfsjyaBean tfsjya = dao.queryTfsjyaByYabh(yabh);
		if(tfsjya != null){
			tfsjya.setYaylList(dao.queryYaylByYabh(tfsjya.getYabh()));
		}
		return tfsjya;
	}

	public YaylBean queryYaylByBh(String bh) throws Exception {
		return dao.queryYaylByBh(bh);
	}

	public List<YaylBean> queryYaylByYabh(String yabh) throws Exception {
		return dao.queryYaylByYabh(yabh);
		
	}

	public ZhsgBean queryZhsgByBh(String bh) throws Exception {
		return dao.queryZhsgByBh(bh);
	}

	public List<ZhsgBean> queryZhsgByJgbh(String jgbh) throws Exception {
		return dao.queryZhsgByJgbh(jgbh);
	}

	public DwBean saveAqyh(DwBean dw) throws Exception {
		AqyhBean aqyh = dw.getAqyh();
		if(aqyh == null){
			throw new Exception("安全隐患信息为空，无法保存");
		}else{
			if(ValidateHelper.isEmptyString(aqyh.getBh())){
				//新增安全隐患
				String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_AQYH");
				aqyh.setBh(bh);
				initDjxx(aqyh);
				initCzxx(aqyh);
				aqyh.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertAqyh(aqyh);
			}else{
				//修改安全隐患
				initCzxx(aqyh);
				aqyh.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateAqyh(aqyh);
			}
			dw.setAqyh(aqyh);
		}
		return dw;
	}

	public DwBean saveBadys(DwBean dw) throws Exception {
		BadysBean badys = dw.getBadys();
		badys.setJgbh(dw.getDwjbxx().getJgbh());
		if(badys == null){
			throw new Exception("不安定信息为空，无法保存!");
		}else{
			if(ValidateHelper.isEmptyString(badys.getBh())){
				String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_BADYS");
				badys.setBh(bh);
				initDjxx(badys);
				initCzxx(badys);
				badys.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertBadys(badys);
			}else{
				initCzxx(badys);
				badys.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateBadys(badys);
			}
			dw.setBadys(badys);
		}
		return dw;
	}

	public DwBean saveBwjgBean(DwBean dw) throws Exception {
		BwjgBean bwjg = dw.getBwjg();
		if(bwjg == null){
			throw new Exception("保卫机构信息为空，无法保存!");
		}else{
			if(ValidateHelper.isEmptyString(bwjg.getBwjgbh())){
				String bwjgbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_BWJG");
				bwjg.setBwjgbh(bwjgbh);
				initDjxx(bwjg);
				initCzxx(bwjg);
				bwjg.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertBwjg(bwjg);
			}else {
				initCzxx(bwjg);
				bwjg.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateBwjg(bwjg);
			}
			dw.setBwjg(bwjg);
		}
		return dw;
	}

	public DwBean saveBwjys(DwBean dw) throws Exception {
		BwjysBean bwjys = dw.getBwjys();
		if(bwjys == null){
			throw new Exception("保卫建议书为空，无法保存!");
		}else{
			if(ValidateHelper.isEmptyString(bwjys.getJysbh())){
				String jysbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_BWJYS");
				bwjys.setJysbh(jysbh);
				initDjxx(bwjys);
				initCzxx(bwjys);
				bwjys.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertBwjys(bwjys);
			}else {
				initCzxx(bwjys);
				bwjys.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateBwjys(bwjys);
			}
			dw.setBwjys(bwjys);
		}
		return dw;
	}

	public DwBean saveBwzdBean(DwBean dw) throws Exception {
		BwzdBean bwzd = dw.getBwzd();
		if(bwzd == null){
			throw new Exception("保卫制度信息为空，无法保存!");
		}else{
			if(ValidateHelper.isEmptyString(bwzd.getZdbh())){
				String zdbh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_BWZD");
				bwzd.setZdbh(zdbh);
				initDjxx(bwzd);
				initCzxx(bwzd);
				bwzd.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertBwzd(bwzd);
			}else{
				initCzxx(bwzd);
				bwzd.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateBwzd(bwzd);
			}
			dw.setBwzd(bwzd);
		}
		return dw;
	}

	public DwBean saveTfsjya(DwBean dw) throws Exception {
		TfsjyaBean tfsj = dw.getTfsjya();
		if(tfsj == null){
			throw new Exception("突发事件预案信息为空，无法保存!");
		}else{
			if(ValidateHelper.isEmptyString(tfsj.getYabh())){
				String yabh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_TFSJYA");
				tfsj.setYabh(yabh);
				initDjxx(tfsj);
				initCzxx(tfsj);
				tfsj.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertTfsjya(tfsj);
			}else{
				initCzxx(tfsj);
				tfsj.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateTfsjya(tfsj);
			}
			dw.setTfsjya(tfsj);
		}
		return dw;
	}

	public DwBean saveYayl(DwBean dw) throws Exception {
		YaylBean yayl = dw.getTfsjya().getYayl();
		if(yayl == null){
			throw new Exception("预案演练信息为空，无法保存!");
		}else{
			if(ValidateHelper.isEmptyString(yayl.getBh())){
				String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_YAYL");
				yayl.setBh(bh);
				initDjxx(yayl);
				initCzxx(yayl);
				yayl.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertYayl(yayl);
			}else{
				initCzxx(yayl);
				yayl.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateYayl(yayl);
			}
			dw.getTfsjya().setYayl(yayl);
		}
		return dw;
	}

	public DwBean saveZhsg(DwBean dw) throws Exception {
		ZhsgBean zhsg = dw.getZhsg();
		zhsg.setJgbh(dw.getDwjbxx().getJgbh());
		if(zhsg == null){
			throw new Exception("灾害事故信息为空，无法保存!");
		}else{
			if(ValidateHelper.isEmptyString(zhsg.getBh())){
				String bh = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_ZHSG");
				zhsg.setBh(bh);
				initDjxx(zhsg);
				initCzxx(zhsg);
				zhsg.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertZhsg(zhsg);
			}else{
				initCzxx(zhsg);
				zhsg.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateZhsg(zhsg);
			}
			dw.setZhsg(zhsg);
		}
		return dw;
	}
	
	/**
	 * 初始化登记信息
	 * @param bean
	 */
	private void initDjxx(OperateBean bean) throws Exception {
		if(bean != null){
			LoginInfo login = ActionContextHelper.getLoginInfo();
			bean.setDjrxm(login.getRealname());
			bean.setDjdwmc(login.getOrgname());
			bean.setDjdwdm(login.getOrgcode());
			bean.setDjrjh(login.getUsername());
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			bean.setDjrsfzh(login.getSfzh());
		}else{
			throw new Exception("对象为空，无法初始化登记信息!");
		}
	}
	
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

	public PageResultInfo<YaylBean> queryYaylByYabh(String yabh,
			PageInfo pageinfo) throws Exception {
		return dao.queryYaylByYabh(yabh, pageinfo);
	}
	
	public DwBean saveAbssBean(DwBean dw) throws Exception{
		DwabssBean abss = dw.getAbss();
		if(abss == null ){
			throw new Exception("安保设施信息为空，无法保存！");
		}else{
			if(ValidateHelper.isEmptyString(abss.getSsbh())){
				String ssbh = CommonSequenceHelper.getABSSBH(login.getOrgcode());
				abss.setSsbh(ssbh);
				initDjxx(abss);
				initCzxx(abss);
				abss.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertDwabss(abss);
			}else{
				abss.setCzbs(CommonConstant.CZBZ_UPDATE);
				initCzxx(abss);
				dao.updateDwabss(abss);
			}
			dw.setAbss(abss);
		}
		return dw;
	}
	
	public void delAbss(String ssbh) throws Exception{
		DwabssBean abss = new DwabssBean();
		abss.setSsbh(ssbh);
		initCzxx(abss);
		abss.setCzbs(CommonConstant.CZBZ_DEL);
		dao.deleteDwabss(abss);
	}
	
	//保存技防单位
	protected JfdwBean saveJfdw(JfdwBean bean){
		if(bean == null){
			return null;
		}
		try {
			if(ValidateHelper.isEmptyString(bean.getId())){
				String id = CommonSequenceHelper.getDWBH("JF");
				bean.setId(id);
				dao.insertJfdw(bean);
			}else{
				dao.updateJfdw(bean);
			}
		} catch (SQLException e) {
			System.out.println("保存技防单位失败!");
			e.printStackTrace();
		}
		return bean;
	}
	
	//根据机构编号查询技防单位
	protected JfdwBean queryJfdwByJgbh(String jgbh){
		JfdwBean jfdw = null;
		try{
			jfdw = dao.queryJfdwByJgbh(jgbh);
		}catch(Exception e){
			e.printStackTrace();
		}
		return jfdw;
	}

	@Override
	public void saveCyryfkxx(DwcyryBean cyryBean) throws Exception 
	{
		dao.saveCyryfkxx(cyryBean);
	}

	/**
	 * 查询从业人员信息
	 * @param jgbh
	 * @param sfzh
	 * @return
	 * @date Feb 23, 2014 3:26:06 PM
	 */
	@Override
	public int queryCyryByJgbhAndSfzh(String jgbh, String sfzh)
	{
		try
		{
			return dao.queryCyryByJgbhAndSfzh(jgbh, sfzh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<ZdyhbwZpBean> saveZdyhbwZpBean(String yhbwbh, File[] uploads,
			String[] uploadsFileName)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		List<ZdyhbwZpBean> list = new ArrayList<ZdyhbwZpBean>();
		if (ValidateHelper.isNotEmptyArray(uploads))
		{
			ZdyhbwZpBean zpBean = null;
			for (int i=0;i<uploads.length;i++)
			{
				zpBean = new ZdyhbwZpBean();
				File upload = uploads[i];
				zpBean.setBh(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_zdry_zpxx"));
				zpBean.setYhbwbh(yhbwbh);
				zpBean.setZp(upload);
				zpBean.setZpmc(uploadsFileName[i]);
				zpBean.setDjdwdm(loginInfo.getOrgcode());
				zpBean.setDjdwmc(loginInfo.getOrgname());
				zpBean.setDjrxm(loginInfo.getRealname());
				list.add(zpBean);
			}
			dao.insertZdyhbwZpBean(list);
		}
		return list;
	}

	@Override
	public Blob queryYhbwzp(String bh)
	{
		return dao.queryYhbwzpxx(bh);
	}

	@Override
	public void deleteZdyhbwzpBean(String bh) throws Exception
	{
		dao.deleteZdyhbwzpBean(bh);
	}

	@Override
	public List<ZdyhbwZpBean> queryZdyhbwZpBeans(DwQueryBean queryBean)
	{
		return dao.queryZdyhbwZpBeans(queryBean);
	}
	
	@Override
	public void delteCyryByCyrybh(String cyrybh){
		DwcyryBean cyry = new DwcyryBean();
		cyry.setCzdwdm(login.getOrgcode());
		cyry.setCzdwmc(login.getOrgname());
		cyry.setCzrjh(login.getUsername());
		cyry.setCzrxm(login.getRealname());
		cyry.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		cyry.setCzbs(CommonConstant.CZBZ_DEL);
		cyry.setCyrybh(cyrybh);
		
		try {
			dao.deleteCyryByCyrybh(cyry);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public List<DwcyryBean> queryDwcyryList(String jgbh){
		try{
			return dao.queryCyryListByJgbh(jgbh);
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<DwcyryBean> queryDwCyryListByCyrybhs(String cyrybhs) {
		return dao.queryDwCyryListByCyrybhs(cyrybhs);
	}

	@Override
	public List<DwcyryBean> queryDwCyryListByQueryBean(CyryQueryBean queryBean) {
		return dao.queryDwCyryListByQueryBean(queryBean);
	}

	@Override
	public List<DwjbxxBean> queryDwListByDwQueryBean(DwQueryBean queryBean) {
		return dao.queryDwListByDwQueryBean(queryBean);
	}

	@Override
	public List<DwjbxxBean> queryDwListByJgbhs(String jgbhs) {
		return dao.queryDwListByJgbhs(jgbhs);
	}

	@Override
	public void cyrypf(CyryPfBean bean) {
		String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZA_CYRYPF_ID");
		bean.setId(id);
		
		TransactionManager tr = null;
		try {
			tr = new TransactionManager();
			
			LoginInfo login = ActionContextHelper.getLoginInfo();
			bean.setPfdwdm(login.getOrgcode());
			bean.setPfdwmc(login.getOrgname());
			bean.setPfrjh(login.getUsername());
			bean.setPfrsfzh(login.getSfzh());
			bean.setPfrxm(login.getRealname());
			bean.setPfsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			tr.begin();
			dao.insertCyryPfxx(bean);
			
			dao.updateCyryJzdsq(bean);
			
			tr.commit();
		} catch (Exception e) {
			try {
				tr.rollback();
			} catch (RollbackException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
	}

	@Override
	public PageResultInfo<JfdwNsxxBean> queryJfdwNsxxByJgbh(String jgbh,PageInfo page) {
		try {
			return dao.queryJfdwNsxxList(jgbh, page);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public JfdwNsxxBean saveJfwdwNsxx(JfdwNsxxBean bean) {
		if(ValidateHelper.isEmptyString(bean.getId())){
			String id = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_JFDW_NSID");
			bean.setId(id);
			try {
				initCzxx(bean);
				bean.setCzbs(CommonConstant.CZBZ_ADD);
				dao.insertJfdwNsxx(bean);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			try {
				initCzxx(bean);
				bean.setCzbs(CommonConstant.CZBZ_UPDATE);
				dao.updateJfdwNsxx(bean);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return bean;
	}

	@Override
	public List<JfdwNsxxBean> queryJfdwNsxx(DwQueryBean queryBean) {
		try {
			return dao.queryJfdwNsxx(queryBean);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<NbDwTjBean> queryNbdwlbtjPageResultInfo(
			PageInfo page, DwQueryBean dwcx,String dwtjjb) {
		
		return dao.queryNbdwlbtjPageResultInfo(page,dwcx,dwtjjb);
	}

	@Override
	public PageResultInfo<CyryPfListBean> queryCyryPfList(PageInfo pageinfo,
			CyryQueryBean bean) 
	{
		try
		{
			return dao.queryCyryPfList(pageinfo, bean);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageResultInfo<DwaqjcBean> queryAqjcList(QueryBean query,
			PageInfo pageinfo) {
		try {
			return dao.queryAqjcList(query, pageinfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<DwaqjcBean> queryAqjcList(QueryBean query) {
		try {
			return dao.queryAqjcList(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String checkDw(String jgbh) {
		//检查代码 0：存在从业人员   1：已提交审核
		String tipCode = "";
		List<DwcyryBean> cyryList = queryDwcyryList(jgbh);
		//存在从业人员
		if(!cyryList.isEmpty() && cyryList.size() > 0){
			tipCode = "0";
		}else{  //已经提交审核
			WbdwManagerService wbdwService = new WbdwManagerServiceImpl();
			List<WbdwShBean> wbdwshList = wbdwService.queryWbdwShByJgbh(jgbh);
			if(wbdwshList != null && wbdwshList.size() > 0){
				if("0".equals(wbdwshList.get(0).getShzt())){
					tipCode = "1";
				}
			}
		}
		return tipCode;
	}

	public List<CyrytjBean> queryCyryTjList(CyryQueryBean cyrycx) {
		try {
			return dao.queryCyryTjList(cyrycx);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
}
