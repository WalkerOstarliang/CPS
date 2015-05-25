package com.chinacreator.xqgk.action;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.chinacreator.common.action.BaseAction;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.xqgk.bean.SqDetailColumnInfo;
import com.chinacreator.xqgk.bean.SqDetailQueryInfo;
import com.chinacreator.xqgk.bean.XqgkQueryInfo;
import com.chinacreator.xqgk.bean.XqgkShowInfo;
import com.chinacreator.xqgk.bean.base.OrgBean;
import com.chinacreator.xqgk.bean.query.SqmjQueryBean;
import com.chinacreator.xqgk.bean.query.XqfaQueryBean;
import com.chinacreator.xqgk.bean.query.XqgjQueryBean;
import com.chinacreator.xqgk.bean.query.XqgkQueryBean;
import com.chinacreator.xqgk.bean.show.CyryBean;
import com.chinacreator.xqgk.bean.show.JsjzBean;
import com.chinacreator.xqgk.bean.show.QbhsBean;
import com.chinacreator.xqgk.bean.show.SqjdBean;
import com.chinacreator.xqgk.bean.show.SqkfBean;
import com.chinacreator.xqgk.bean.show.SydwBean;
import com.chinacreator.xqgk.bean.show.SyfwBean;
import com.chinacreator.xqgk.bean.show.SyjzBean;
import com.chinacreator.xqgk.bean.show.SyrkBean;
import com.chinacreator.xqgk.bean.show.XqzaBean;
import com.chinacreator.xqgk.bean.show.ZdryBean;
import com.chinacreator.xqgk.business.UserRelaDeptBusiness;
import com.chinacreator.xqgk.business.XqgkService;
import com.chinacreator.xqgk.dao.SqDetailDao;
import com.chinacreator.xqgk.dao.XqgkBaseDao;
import com.chinacreator.xqgk.dao.XqgkDataDao;
import com.chinacreator.xqgk.utils.DateUtils;
import com.chinacreator.xqgk.utils.DeptUtils;

@SuppressWarnings("unchecked")
public class XqgkAction extends XqgkBaseAction {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -5844981377104148001L;
	private static final Logger log = LoggerFactory.getLogger(BaseAction.class);
	
	
	/**
	 * 显示辖区概况
	 * @return
	 */
	public String showXqgk(){
		try {
			String deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			
			XqgkBaseDao baseDao = XqgkBaseDao.getInstance();
			XqgkDataDao dataDao = XqgkDataDao.getInstance();
			
			//单位名
			OrgBean org = dataDao.getOrgBeanByCode(deptCode);
			request.getSession().setAttribute("userDeptName", org.getOrgJc());
			request.getSession().setAttribute("userCode", super.getLoginUser().getUsername());
			request.getSession().setAttribute("userDeptCode", deptCode);
			
			request.getSession().setAttribute("userDeptLevel", (DeptUtils.getLevel(deptCode) - 1));//用于机构钻取导航，首页默认级别-1
			
			//辖区内社区数量
			String sqNum = dataDao.getNumOfAllChildSQ(deptCode);
			request.getSession().setAttribute("sqNum", sqNum);
			
			//辖区内警务区数量
			String jwqNum = dataDao.getNumOfAllChildJWQ(deptCode);
			request.getSession().setAttribute("jwqNum", jwqNum);
			
			//辖区内民警数量
			String mjNum = baseDao.queryMjNumByOrgCode(DeptUtils.getLevelCode(deptCode) + "%");
			request.getSession().setAttribute("mjNum", mjNum);
			
			//辖区内社区民警数量
			SqmjQueryBean queryBean = new SqmjQueryBean(deptCode);
			String sqmjNum = baseDao.querySqmjNumByOrgCode(queryBean);
			request.getSession().setAttribute("sqmjNum", sqmjNum);
			
			request.getSession().setAttribute("fjNum", "--");//TODO	辖区内辅警数量
			
			//zhangyixiang 20140211 去掉重点人员轨迹
			/*
			//重点人员日均轨迹(截至当日0时的当年日均)
			int gjTotal = dataDao.getGjCountOfYear(deptCode);
			int dayNum = Calendar.getInstance().get(Calendar.DAY_OF_YEAR) - 1;
			String rjgj = NumberFormat.getNumberInstance().format(((double)gjTotal / dayNum));
			request.getSession().setAttribute("rjgj", rjgj);
			*/
			
			//zhangyixiang 20140212 去掉本年/去年日均发案
			/*
			//去年刑事案件日均发案
			XqfaQueryBean sumQueryL = new XqfaQueryBean();
			sumQueryL.setQueryCode(deptCode);
			sumQueryL.setStartTime(DateUtils.getDateTime("yyyyMMddHHmmss", DateUtils.getFirstTimeYear(-1)));//去年1月1日00:00:00
			sumQueryL.setEndTime(DateUtils.getDateTime("yyyyMMddHHmmss", DateUtils.getLastTimeOfLastYear(-1)));//去年12月31日23:59:59
			String sumL = dataDao.queryYearXqzaInfoOfDept(sumQueryL);
			String rjfaqn = NumberFormat.getNumberInstance().format(((Double.parseDouble(sumL) / DateUtils.getDayNumOfLastYear())));
			request.getSession().setAttribute("rjfaqn", rjfaqn);
			
			//今年刑事案件日均发案
			XqfaQueryBean sumQueryC = new XqfaQueryBean();
			sumQueryC.setQueryCode(deptCode);
			sumQueryC.setStartTime(DateUtils.getDateTime("yyyyMMddHHmmss", DateUtils.getFirstTimeYear(0)));//今年1月1日00:00:00
			sumQueryC.setEndTime(DateUtils.getDateTime("yyyyMMddHHmmss", DateUtils.getLastTimeBeforeToday(-1)));//昨日23:59:59
			String sumC = dataDao.queryYearXqzaInfoOfDept(sumQueryC);
			String rjfajn = NumberFormat.getNumberInstance().format((Double.parseDouble(sumC) / DateUtils.getToDayNumOfYear(-1)));
			request.getSession().setAttribute("rjfajn", rjfajn);		
			*/
			//统计时间
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -1);
			String tjDate = DateUtils.getDateTime("yyyy-MM-dd", cal.getTime());
			request.getSession().setAttribute("tjDate", tjDate.split("-"));
			
			//辖区基本信息数据
			request.getSession().setAttribute("syrk", dataDao.getXqgkBean(new XqgkQueryBean("syrk", deptCode, tjDate)));//实有人口
			request.getSession().setAttribute("czrk", dataDao.getXqgkBean(new XqgkQueryBean("czrk", deptCode, tjDate)));//常住人口
			request.getSession().setAttribute("ldrk", dataDao.getXqgkBean(new XqgkQueryBean("ldrk", deptCode, tjDate)));//流动人口
			request.getSession().setAttribute("zdry", dataDao.getXqgkBean(new XqgkQueryBean("zdry", deptCode, tjDate)));//重点人员
			request.getSession().setAttribute("czfw", dataDao.getXqgkBean(new XqgkQueryBean("czfw", deptCode, tjDate)));//出租房屋
			request.getSession().setAttribute("lgcs", dataDao.getXqgkBean(new XqgkQueryBean("lgcs", deptCode, tjDate)));//旅馆
			request.getSession().setAttribute("swfwcs", dataDao.getXqgkBean(new XqgkQueryBean("swfwcs", deptCode, tjDate)));//上网服务场所
			
			//基本信息展示对象
			List<XqgkQueryInfo> list = dataDao.getAllQuery();
			request.getSession().setAttribute("dataInfoList", list);
			
			//近期发案（取前5条）
			XqfaQueryBean query = new XqfaQueryBean();
			query.setQueryCode(DeptUtils.getLevelCode(deptCode));
			query.setStartTime(DateUtils.getDateTime("yyyyMMdd", DateUtils.getFirstTimeOfDayNumBeforeToday(-7)));
			query.setEndTime(DateUtils.getDateTime("yyyyMMdd", DateUtils.getLastTimeBeforeToday(0)));
			
			List<HashMap> ajInfoList = XqgkService.getInstance().getLatestAJInfo(query);
			request.getSession().setAttribute("ajNum", ajInfoList.size());
			
			if(ajInfoList.size() > 5){
				ajInfoList = ajInfoList.subList(0, 5);
			}
			request.getSession().setAttribute("ajInfoList", ajInfoList);
			
			//本月待接收
			
			List<JsjzBean> jsjzList = dataDao.getJsjzOfDept(deptCode);
			int jsjzNum = jsjzList.size();
			request.getSession().setAttribute("jsjzNum", jsjzNum);
			List<QbhsBean> qbhsList = dataDao.getQbhsOfDept(deptCode);
			int qbhsNum = qbhsList.size();
			request.getSession().setAttribute("qbhsNum", qbhsNum);
			
			List<SqjdBean> sqjdList = dataDao.getSqjdOfDept(deptCode);
			int sqjdNum = sqjdList.size();
			request.getSession().setAttribute("sqjdNum", sqjdNum);
			
			List<SqkfBean> sqkfList = dataDao.getSqkfOfDept(deptCode);
			int sqkfNum = sqkfList.size();
			request.getSession().setAttribute("sqkfNum", sqkfNum);			

			/*
			request.getSession().setAttribute("jsjzNum", 0);
			request.getSession().setAttribute("qbhsNum", 0);
			request.getSession().setAttribute("sqjdNum", 0);
			request.getSession().setAttribute("sqkfNum", 0);
			*/
			//重点人员轨迹
			XqgjQueryBean gjQuery = new XqgjQueryBean();
			gjQuery.setQueryCode(DeptUtils.getLevelCode(deptCode));
			gjQuery.setStartTime(DateUtils.getDateTime("yyyy-MM-dd HH:mm:ss", DateUtils.getFirstDateOfMonth()));
			gjQuery.setEndTime(DateUtils.getDateTime("yyyy-MM-dd HH:mm:ss", DateUtils.getLastTimeOfToday()));
			PageInfo pi = new PageInfo();
			pi.setCurrentPage(1);
			pi.setPageSize(5);
			List<HashMap> gjInfoList = dataDao.getLatestRYInfo(pi, gjQuery);
			request.getSession().setAttribute("gjInfoList", gjInfoList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区基本信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_xqgk";
	}
	
	/**
	 * 查询辖区概况具体数值
	 */
	public void getDataOfQueryInfo(){
		XqgkShowInfo showInfo = null;
		try {
			String code = request.getParameter("code");
			
			String deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			
			showInfo = XqgkService.getInstance().getDataOfQueryInfo(deptCode, code);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			responseErrorInfo(new HashMap<String, String>(), "读取辖区基本信息时发生错误。");
			return;
		}
		responseObject(showInfo);
	}	
	
	
	/**
	 * 获取辖区内近期发案(带翻页)
	 */
	public String getLatestAJInfo(){
		try {
			String deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			
			XqfaQueryBean query = new XqfaQueryBean();
			query.setQueryCode(DeptUtils.getLevelCode(deptCode));
			query.setStartTime(DateUtils.getDateTime("yyyyMMdd", DateUtils.getFirstTimeOfDayNumBeforeToday(-7)));
			query.setEndTime(DateUtils.getDateTime("yyyyMMdd", DateUtils.getLastTimeBeforeToday(0)));
			
			List<HashMap> ajInfoList = XqgkService.getInstance().getLatestAJInfo(query);
			request.getSession().setAttribute("ajInfoList", ajInfoList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区实有人口信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_xqfa";
	}
	
	/**
	 * 获取辖区内7日重点人员活动情况(带翻页)
	 */
	public String getLatestGJInfo(){
		try {
			String deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			
			XqgjQueryBean query = new XqgjQueryBean();
			query.setQueryCode(DeptUtils.getLevelCode(deptCode) + "%");
			query.setStartTime(DateUtils.getDateTime("yyyy-MM-dd HH:mm:ss", DateUtils.getFirstTimeOfDayNumBeforeToday(-7)));
			query.setEndTime(DateUtils.getDateTime("yyyy-MM-dd HH:mm:ss", DateUtils.getLastTimeBeforeToday(0)));
			
			List<HashMap> gjInfoList = XqgkDataDao.getInstance().getLatestRYInfo(null, query);
			request.getSession().setAttribute("gjInfoList", gjInfoList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区重点人员轨迹信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_xqgj";
	}
	
	
	/**
	 * 辖区实有人口情况表
	 * @return
	 */
	public String getDeptInfoOfSyrk(){
		try {
			String deptCode = request.getParameter("deptCode");
			if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
				deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			}
			
			//单位名
			OrgBean org = XqgkDataDao.getInstance().getOrgBeanByCode(deptCode);
			request.getSession().setAttribute("userDeptName", org.getOrgJc());
			request.getSession().setAttribute("userDeptLevel", DeptUtils.getLevel(deptCode));//用于机构钻取导航
			
			List<SyrkBean> syrkList = XqgkService.getInstance().querySyrkInfoOfDept(deptCode);
			
			SyrkBean total = new SyrkBean();
			total.setDeptName("合计");
			for(SyrkBean syrk : syrkList){
				total.setCzrk(total.getCzrk() + syrk.getCzrk());
				total.setLdrk(total.getLdrk() + syrk.getLdrk());
				total.setJzrk(total.getJzrk() + syrk.getJzrk());
				total.setWlhrk(total.getWlhrk() + syrk.getWlhrk());
				total.setJwry(total.getJwry() + syrk.getJwry());
			}
			syrkList.add(total);
			
			request.getSession().setAttribute("syrkList", syrkList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区实有人口信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_syrk";
	}
	
	/**
	 * 辖区实体信息情况表
	 * @return
	 */
	public String getDeptInfoOfSyjz(){
		try {
			String deptCode = request.getParameter("deptCode");
			if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
				deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			}
			
			//单位名
			OrgBean org = XqgkDataDao.getInstance().getOrgBeanByCode(deptCode);
			request.getSession().setAttribute("userDeptName", org.getOrgJc());
			request.getSession().setAttribute("userDeptLevel", DeptUtils.getLevel(deptCode));//用于机构钻取导航
			
			List<SyjzBean> syjzList = XqgkService.getInstance().querySyjzInfoOfDept(deptCode);
			
			SyjzBean total = new SyjzBean();
			total.setDeptName("合计");
			for(SyjzBean syjz : syjzList){
				total.setStjz(total.getStjz() + syjz.getStjz());
			}
			syjzList.add(total);
			
			request.getSession().setAttribute("syjzList", syjzList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区实有建筑信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_syjz";
	}
	
	/**
	 * 查询辖区概况从业人员数据
	 */
	public String getDeptInfoOfCyry(){
		try {
		String deptCode = request.getParameter("deptCode");
		if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
			deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
		}
		//单位名
		OrgBean org = null;
		
			org = XqgkDataDao.getInstance().getOrgBeanByCode(deptCode);
		
		request.getSession().setAttribute("userDeptName", org.getOrgJc());
		request.getSession().setAttribute("userDeptLevel", DeptUtils.getLevel(deptCode));//用于机构钻取导航
		
			List<CyryBean> cyryList = XqgkService.getInstance().queryCyryInfoOfDept(deptCode);
		
		CyryBean total = new CyryBean();
		total.setDeptName("合计");
		for(CyryBean cyrys :cyryList){
			total.setCyrys(total.getCyrys()+cyrys.getCyrys());
		}
		cyryList.add(total);
		request.getSession().setAttribute("cyryList", cyryList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区实有从业人员信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_cyry";
	}
	
	/**
	 * 辖区实有房屋情况表
	 * @return
	 */
	public String getDeptInfoOfSyfw(){
		try {
			String deptCode = request.getParameter("deptCode");
			if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
				deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			}
			
			//单位名
			OrgBean org = XqgkDataDao.getInstance().getOrgBeanByCode(deptCode);
			request.getSession().setAttribute("userDeptName", org.getOrgJc());
			request.getSession().setAttribute("userDeptLevel", DeptUtils.getLevel(deptCode));//用于机构钻取导航
			
			List<SyfwBean> syfwList = XqgkService.getInstance().querySyfwInfoOfDept(deptCode);
			
			SyfwBean total = new SyfwBean();
			total.setDeptName("合计");
			for(SyfwBean syfw : syfwList){
				total.setStjz(total.getStjz() + syfw.getStjz());
				total.setFw(total.getFw() + syfw.getFw());
				total.setCzfw(total.getCzfw() + syfw.getCzfw());
			}
			syfwList.add(total);
			
			request.getSession().setAttribute("syfwList", syfwList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区实有房屋信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_syfw";
	}
	
	/**
	 * 辖区实有单位情况表
	 * @return
	 */
	public String getDeptInfoOfSydw(){
		try {
			String deptCode = request.getParameter("deptCode");
			if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
				deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			}
			
			//单位名
			OrgBean org = XqgkDataDao.getInstance().getOrgBeanByCode(deptCode);
			request.getSession().setAttribute("userDeptName", org.getOrgJc());
			request.getSession().setAttribute("userDeptLevel", DeptUtils.getLevel(deptCode));//用于机构钻取导航
			
			List<SydwBean> sydwList = XqgkService.getInstance().querySydwInfoOfDept(deptCode);
			
			SydwBean total = new SydwBean();
			total.setDeptName("合计");
			for(SydwBean sydw : sydwList){
				total.setTzhy(total.getTzhy() + sydw.getTzhy());
				total.setGgcs(total.getGgcs() + sydw.getGgcs());
				total.setQsydw(total.getQsydw() + sydw.getQsydw());
				total.setSwdw(total.getSwdw() + sydw.getSwdw());
				total.setSwfwdw(total.getSwfwdw() + sydw.getSwfwdw());
				total.setWxpdw(total.getWxpdw() + sydw.getWxpdw());
				total.setKsy(total.getKsy() + sydw.getKsy());
				total.setJfdw(total.getJfdw() + sydw.getJfdw());
				total.setLgy(total.getLgy() + sydw.getLgy());
				total.setQtdw(total.getQtdw() + sydw.getQtdw());
			}
			sydwList.add(total);
			
			request.getSession().setAttribute("sydwList", sydwList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区实有单位信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_sydw";
	}
	
	/**
	 * 辖区重点人员情况表
	 * @return
	 */
	public String getDeptInfoOfZdry(){
		try {
			String deptCode = request.getParameter("deptCode");
			if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
				deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			}
			
			//单位名
			OrgBean org = XqgkDataDao.getInstance().getOrgBeanByCode(deptCode);
			request.getSession().setAttribute("userDeptName", org.getOrgJc());
			int leve = DeptUtils.getLevel(deptCode);
			
			request.getSession().setAttribute("userDeptLevel", leve);//用于机构钻取导航
			
			List<ZdryBean> zdryList = new ArrayList<ZdryBean>();
			if(leve == 5){
				zdryList = XqgkService.getInstance().querySelfZdryOfDept(deptCode);
			}else{
				zdryList = XqgkService.getInstance().queryZdryInfoOfDept(deptCode);
			}
			
			if(leve <= 4){
				ZdryBean total = new ZdryBean();
				total.setDeptName("合计");
				for(ZdryBean zdry : zdryList){
					total.setSkry(total.getSkry() + zdry.getSkry());
					total.setSwry(total.getSwry() + zdry.getSwry());
					total.setZtry(total.getZtry() + zdry.getZtry());
					total.setSdry(total.getSdry() + zdry.getSdry());
					total.setQkry(total.getQkry() + zdry.getQkry());
					total.setJsbr(total.getJsbr() + zdry.getJsbr());
					total.setSfry(total.getSfry() + zdry.getSfry());
				}
				zdryList.add(total);
			}
			request.getSession().setAttribute("zdryList", zdryList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区重点人员信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_zdry";
	}

	/**
	 * 辖区治安情况表
	 * @return
	 */
	public String getDeptInfoOfXqza(){
		try {
			String deptCode = request.getParameter("deptCode");
			if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
				deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			}
			
			//单位名
			OrgBean org = XqgkDataDao.getInstance().getOrgBeanByCode(deptCode);
			request.getSession().setAttribute("userDeptName", org.getOrgJc());
			request.getSession().setAttribute("userDeptLevel", DeptUtils.getLevel(deptCode));//用于机构钻取导航
			
			//统计时间
			String tjDate = DateUtils.getDateTime("yyyy-MM-dd", new Date());
			request.getSession().setAttribute("tjDate", tjDate.split("-"));
			
			Date tjStartDate = DateUtils.getFirstTimeOfDayNumBeforeToday(-30);
			String tjDateStr = DateUtils.getDateTime("yyyy-MM-dd", tjStartDate);
			request.getSession().setAttribute("tjStartDate", tjDateStr.split("-"));
			
			//发案信息查询条件
			XqfaQueryBean query = new XqfaQueryBean();
			query.setQueryCode(deptCode);
			query.setStartTime(DateUtils.getDateTime("yyyyMMddHHmmss", tjStartDate));
			query.setEndTime(DateUtils.getDateTime("yyyyMMddHHmmss", DateUtils.getLastTimeBeforeToday(-1)));
			
			List<XqzaBean> xqzaInfoList = XqgkService.getInstance().queryXqzaInfo(deptCode);
			String zbStr = "--";
			String rjStr = "--";
			String qcajsStr = "--";
			String ajzsStr = "--";
			if(xqzaInfoList != null && !xqzaInfoList.isEmpty()){
				XqzaBean zaBean = xqzaInfoList.get(0);
				double qcajs = zaBean.getDfxqcsl() * 1d;
				double ajzs = zaBean.getZs() * 1d;
				if(ajzs == 0){
					zbStr = "--";	
				}else{
					zbStr = NumberFormat.getNumberInstance().format(((qcajs / ajzs) * 100d));
				}
				
				rjStr = NumberFormat.getNumberInstance().format(ajzs / 30);
				qcajsStr = NumberFormat.getNumberInstance().format(qcajs);
				ajzsStr = NumberFormat.getNumberInstance().format(ajzs);
			}
			Map xqzaInfo = new HashMap();
			xqzaInfo.put("AJZS", ajzsStr);
			xqzaInfo.put("QCAJS", qcajsStr);
			xqzaInfo.put("ZB", zbStr);
			xqzaInfo.put("RJ", rjStr);
			request.getSession().setAttribute("xqzaInfo", xqzaInfo);
			
			List<XqzaBean> xqzaDeptList = XqgkService.getInstance().queryXqzaInfoOfDept(deptCode);

			XqzaBean total = new XqzaBean();
			total.setDeptName("合计");
			for(XqzaBean xqfa : xqzaDeptList){
				total.setQjsl(total.getQjsl() + xqfa.getQjsl());
				total.setQdsl(total.getQdsl() + xqfa.getQdsl());
				total.setDqsl(total.getDqsl() + xqfa.getDqsl());
				total.setZpsl(total.getZpsl() + xqfa.getZpsl());
				total.setQtsl(total.getQtsl() + xqfa.getQtsl());
				total.setRsdqsl(total.getRsdqsl()+xqfa.getRsdqsl());
				total.setZs(total.getZs() + xqfa.getZs());
			}
			xqzaDeptList.add(total);
			
			request.getSession().setAttribute("xqzaList", xqzaDeptList);
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "的辖区治安信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_xqza";
	}
	
	@Override
	public PageInfo getPageInfo() {
		PageInfo pageInfo = super.getPageInfo();
		pageInfo.setPageSize(10);
		return pageInfo;
	}
	
	public String getSqDetailList(){
		try{
			String code = request.getParameter("code");
			String deptCode = request.getParameter("deptCode");
			
			request.getSession().setAttribute("code", code);
			request.getSession().setAttribute("deptCode", deptCode);
			
			
			SqDetailDao dao = SqDetailDao.getInstance();
			dao.getAllQuery();//加载所有查询信息
			SqDetailQueryInfo queryInfo = dao.getQueryByCode(code);

			request.getSession().setAttribute("typeName", queryInfo.getTypeName());
			
			List<Map<String, String>> thList = new LinkedList<Map<String, String>>();
			for(SqDetailColumnInfo columnInfo : queryInfo.getList()){
				Map map = new HashMap();
				map.put("width", columnInfo.getWidthNum());
				if(columnInfo.getIsParam() == 1){
					map.put("thName", "&nbsp;");
				}else{
					map.put("thName", columnInfo.getShowColName());
				}
				thList.add(map);
			}
			request.getSession().setAttribute("thList", thList);
			
			PageResultInfo res = XqgkService.getInstance().getDataOfQueryInfo(deptCode, queryInfo, getPageInfo());
			request.getSession().setAttribute("detail", res);
			
//			List detailList = XqgkService.getInstance().getDataOfQueryInfo(deptCode, queryInfo, getPageInfo());
			List detailList = res.getDatas();
			request.getSession().setAttribute("detailList", detailList);
		}catch(Exception e){
			log.error(e.getMessage(), e);
			return "error";
		}
		return "xqgk_sqdetail";
	}
	
	/**
	 * 辖区内重点人员信息
	 * @return
	 */
	/*
	public String showZdryInfoOfDept(){
		try {
			String deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
			Map resData = XqgkService.getInstance().getZdryInfoOfDept(deptCode);
			request.getSession().setAttribute("resData", resData);
			
			return "xqgk_zdry";
		} catch (Exception e) {
			log.error("读取用户：" + super.getLoginUser().getUsername() + "对应的辖区重点人员信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
	}
	*/
	
	/**
	 * 取保候审人员列表
	 */
	public String showQbhsDetail(){
		String deptCode = request.getParameter("deptCode");

		if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
			deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
		}
		
		LoginInfo loginInfo = super.getLoginUser();
		try {
			String type = request.getParameter("searchType");
			int sjyFlag = -1;
			if(StringUtils.isNotEmpty(type)){
				sjyFlag = Integer.parseInt(type);
			}
			request.getSession().setAttribute("searchType", sjyFlag);

			if(sjyFlag == -2){
				List<QbhsBean> list = new XqgkDataDao().getDclQbhsOfDept(deptCode);
				request.getSession().setAttribute("list", list);
			}else{
				List<QbhsBean> resList = new LinkedList<QbhsBean>();
				List<QbhsBean> list = new XqgkDataDao().getQbhsOfDept(deptCode);
				for(QbhsBean bean : list){
					if(sjyFlag == -1){
						resList.add(bean);
					}else if(bean.getJyflag() == sjyFlag){
						resList.add(bean);
					}
				}
				request.getSession().setAttribute("list", resList);
			}
			
			request.getSession().setAttribute("rysfzh", loginInfo.getSfzh());
			request.getSession().setAttribute("ryjh", loginInfo.getUsername());
			request.getSession().setAttribute("ryjs", "04");//TODO 如何确认角色
			
		} catch (Exception e) {
			log.error("读取用户：" + loginInfo.getUsername() + "的辖区取保候审人员信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_qbhs";
	}
	
	/**
	 * 监视居住人员列表
	 * @return
	 */
	public String showJsjzDetail(){
		String deptCode = request.getParameter("deptCode");
		if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
			deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
		}
		
		LoginInfo loginInfo = super.getLoginUser();
		try{
			String type = request.getParameter("searchType");
			int sjyFlag = -1;
			if(StringUtils.isNotEmpty(type)){
				sjyFlag = Integer.parseInt(type);
			}
			request.getSession().setAttribute("searchType", sjyFlag);

			if(sjyFlag == -2){
				List<JsjzBean> list = new XqgkDataDao().getDclJsjzOfDept(deptCode);
				request.getSession().setAttribute("list", list);
			}else{
				List<JsjzBean> resList = new LinkedList<JsjzBean>();
				List<JsjzBean> list = new XqgkDataDao().getJsjzOfDept(deptCode);
				for(JsjzBean bean : list){
					if(sjyFlag == -1){
						resList.add(bean);
					}else if(bean.getJyflag() == sjyFlag){
						resList.add(bean);
					}
				}
				request.getSession().setAttribute("list", resList);
			}
			
			request.getSession().setAttribute("rysfzh", loginInfo.getSfzh());
			request.getSession().setAttribute("ryjh", loginInfo.getUsername());
			request.getSession().setAttribute("ryjs", "04");//TODO 如何确认角色
		}catch (Exception e) {
			log.error("读取用户：" + loginInfo.getUsername() + "的辖区监视居住人员信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_jsjz";
	}
	
	/**
	 * 社区戒毒人员列表
	 * @return
	 */
	public String showSqjdDetail(){
		String deptCode = request.getParameter("deptCode");
		if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
			deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
		}
		
		LoginInfo loginInfo = super.getLoginUser();
		try{
			String type = request.getParameter("searchType");
			int sjyFlag = -1;
			if(StringUtils.isNotEmpty(type)){
				sjyFlag = Integer.parseInt(type);
			}
			request.getSession().setAttribute("searchType", sjyFlag);

			if(sjyFlag == -2){
				List<SqjdBean> list = new XqgkDataDao().getDclSqjdOfDept(deptCode);
				request.getSession().setAttribute("list", list);
			}else{
				List<SqjdBean> resList = new LinkedList<SqjdBean>();
				List<SqjdBean> list = new XqgkDataDao().getSqjdOfDept(deptCode);
				for(SqjdBean bean : list){
					if(sjyFlag == -1){
						resList.add(bean);
					}else if(bean.getJyflag() == sjyFlag){
						resList.add(bean);
					}
				}
				request.getSession().setAttribute("list", resList);
			}
			
			request.getSession().setAttribute("rysfzh", loginInfo.getSfzh());
			request.getSession().setAttribute("ryjh", loginInfo.getUsername());
			request.getSession().setAttribute("ryjs", "04");//TODO 如何确认角色
		}catch (Exception e) {
			log.error("读取用户：" + loginInfo.getUsername() + "的辖区社区戒毒人员信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_sqjd";
	}
	
	/**
	 * 社区康复人员列表
	 * @return
	 */
	public String showSqkfDetail(){
		String deptCode = request.getParameter("deptCode");
		if(StringUtils.isEmpty(deptCode)){//没有参数，取当前用户的机构
			deptCode = UserRelaDeptBusiness.getInstance().getUserDataDept(super.getLoginUser().getUserid(), super.getLoginUser().getOrgcode());
		}
		
		LoginInfo loginInfo = super.getLoginUser();
		try{
			String type = request.getParameter("searchType");
			int sjyFlag = -1;
			if(StringUtils.isNotEmpty(type)){
				sjyFlag = Integer.parseInt(type);
			}
			request.getSession().setAttribute("searchType", sjyFlag);

			if(sjyFlag == -2){
				List<SqkfBean> list = new XqgkDataDao().getDclSqkfOfDept(deptCode);
				request.getSession().setAttribute("list", list);
			}else{
				List<SqkfBean> resList = new LinkedList<SqkfBean>();
				
				List<SqkfBean> list = new XqgkDataDao().getSqkfOfDept(deptCode);
				for(SqkfBean bean : list){
					if(sjyFlag == -1){
						resList.add(bean);
					}else if(bean.getJyflag() == sjyFlag){
						resList.add(bean);
					}
				}
				request.getSession().setAttribute("list", resList);
			}
			
			request.getSession().setAttribute("rysfzh", loginInfo.getSfzh());
			request.getSession().setAttribute("ryjh", loginInfo.getUsername());
			request.getSession().setAttribute("ryjs", "04");//TODO 如何确认角色
		}catch (Exception e) {
			log.error("读取用户：" + loginInfo.getUsername() + "的辖区社区康复人员信息时发生错误:" + e.getMessage(), e);
			return "error";
		}
		return "xqgk_sqkf";
	}

}
