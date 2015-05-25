package com.chinacreator.tjbb.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.cps.bean.OrgJwsBean;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.JqtbBean;
import com.chinacreator.menu.bean.MhtjQueryBean;
import com.chinacreator.tjbb.bean.CzfwTjbbBean;
import com.chinacreator.tjbb.bean.DatalrtjBean;
import com.chinacreator.tjbb.bean.DwaqjctjbbBean;
import com.chinacreator.tjbb.bean.DwtjBean;
import com.chinacreator.tjbb.bean.GabzzrkTjbbBean;
import com.chinacreator.tjbb.bean.JdTbBean;
import com.chinacreator.tjbb.bean.JzztjbbBean;
import com.chinacreator.tjbb.bean.LdrkTjbbBean;
import com.chinacreator.tjbb.bean.PcsJbqkListBean;
import com.chinacreator.tjbb.bean.PcsJbqkTjBean;
import com.chinacreator.tjbb.bean.PcsJwqJbqkListBean;
import com.chinacreator.tjbb.bean.PcsjbqkhzBean;
import com.chinacreator.tjbb.bean.WeekTableTjbbBean;
import com.chinacreator.tjbb.bean.WeekTjbbBean;
import com.chinacreator.tjbb.dao.TjbbmanageDao;
import com.chinacreator.tjbb.query.DataLrthQueryBean;
import com.chinacreator.tjbb.query.JdTbQueryBean;
import com.chinacreator.tjbb.query.PcsTjqkQueryBean;
import com.chinacreator.xqgk.bean.base.OrgBean;

public class TjbbManageServices
{
	private TjbbmanageDao dao;
	
	public TjbbManageServices()
	{
		dao = new TjbbmanageDao();
	}
	
	public PcsJbqkTjBean queryPcsJbqkListByParentCode(String orgcode)
	{
		PcsJbqkTjBean bean = new PcsJbqkTjBean();
		bean.setOrgcode(orgcode);
		List<PcsJbqkListBean> list = dao.queryPcsJbqkListByParentCode(orgcode);
		if (ValidateHelper.isNotEmptyCollection(list))
		{
			bean.setPcsJbqkList(list);
		}
		return bean;
	}
	
	/**
	 * 查询派出所的基本情况
	 * @param queryBean
	 * @return
	 * @date Sep 15, 2014 10:20:19 AM
	 */
	public List<PcsJwqJbqkListBean> queryPcsJwqJbqkListByQueryBean(PcsTjqkQueryBean queryBean)
	{
		return dao.queryPcsJwqJbqkListByQueryBean(queryBean);
	}
	
	/**
	 * 派出所信息
	 * @param queryBean
	 * @return
	 * @date Sep 15, 2014 2:18:15 PM
	 */
	public PcsJbqkTjBean queryPcsxxsl(PcsTjqkQueryBean queryBean)
	{
		return dao.queryPcsxxsl(queryBean);
	}
	
	/**
	 * 查询派出所基本情况汇总
	 * @param bean
	 * @return
	 */
	public PcsjbqkhzBean queryPcsjbqkhz(PcsTjqkQueryBean bean){
		try 
		{
			return dao.queryPcsjbqkhz(bean);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<PcsjbqkhzBean> queryPcsjbqkhzPageResult(PcsTjqkQueryBean bean)
	{
		List<PcsjbqkhzBean> list = new ArrayList<PcsjbqkhzBean>();
		List<OrgBean> orgList = dao.queryOrgBeansListByParentCode(bean);
		if (ValidateHelper.isNotEmptyCollection(orgList))
		{
			 PcsjbqkhzBean sumBean = new PcsjbqkhzBean();
			 PcsTjqkQueryBean queryBean = null;
			 PcsjbqkhzBean pcsBean = null;
			 
			 int syrs = 0;
			 int xjgajgzjls = 0;
			 int syjlzxjlbl = 0;
			 int cjpxmjs = 0;
			 int pcss = 0;
			 int cqhjs = 0;
			 int cqs = 0;
			 int zpcs1 = 0;
			 int zpcs2 = 0;
			 int xpcs = 0;
			 int xpcs2 = 0;
			 int zas = 0;
			 int sss = 0;
			 int yijs = 0;
			 int erjs = 0;
			 int sanjs = 0;
			 int sijs = 0;
			 int wujs = 0;
			 int qcs = 0;
			 int wcpcs = 0;
			 int jsjs = 0;
			 int wjsjs = 0;
			 int fdtks = 0;
			 int wfdtkpcss = 0;
			 int fdbxs = 0;
			 int wfdbxpcss = 0; 
			 int fcbxs = 0;
			 int wfcbxpcss = 0; 
			 int szs = 0;
			 int fkjyx = 0;
			 int fkj = 0;
			 int zkj = 0;
			 int fcj = 0;
			 int fcjys = 0;
			 int jljwqs = 0;
			 int sqmjs = 0;
			 int zzmjs = 0;
			 int sqs = 0;
			 int ncjwss = 0;
			 int zcmjs = 0;
			 int zczzmjs = 0;
			 int xzcs = 0;
			 int jwqs = 0;
			 
			 for (OrgBean orgBean : orgList)
			 {
				 queryBean = new PcsTjqkQueryBean();
				 queryBean.setOrgcode(orgBean.getOrgCode());
				 queryBean.setOrgLeve(Integer.parseInt(orgBean.getLeve()));
				 pcsBean = queryPcsjbqkhz(queryBean);
				 list.add(pcsBean);
				 
				 syrs += Integer.parseInt(pcsBean.getSyrs());
				 xjgajgzjls = xjgajgzjls + Integer.parseInt(pcsBean.getXjgajgzjls());
				 syjlzxjlbl += Integer.parseInt(pcsBean.getSyjlzxjlbl());
				 cjpxmjs += Integer.parseInt(pcsBean.getCjpxmjs());
				 pcss += Integer.parseInt(pcsBean.getPcss());
				 cqhjs += Integer.parseInt(pcsBean.getCqhjs());
				 cqs += Integer.parseInt(pcsBean.getCqs());
				 zpcs1 += Integer.parseInt(pcsBean.getZpcs1());
				 zpcs2 += Integer.parseInt(pcsBean.getZpcs2());
				 xpcs += Integer.parseInt(pcsBean.getXpcs());
				 xpcs2 += Integer.parseInt(pcsBean.getXpcs2());
				 zas += Integer.parseInt(pcsBean.getZas());
				 sss += Integer.parseInt(pcsBean.getSss());
				 yijs += Integer.parseInt(pcsBean.getYijs());
				 erjs += Integer.parseInt(pcsBean.getErjs());
				 sanjs += Integer.parseInt(pcsBean.getSanjs());
				 sijs += Integer.parseInt(pcsBean.getSijs());
				 wujs += Integer.parseInt(pcsBean.getWujs());
				 qcs += Integer.parseInt(pcsBean.getQcs());
				 wcpcs += Integer.parseInt(pcsBean.getWcpcs());
				 jsjs += Integer.parseInt(pcsBean.getJsjs());
				 wjsjs += Integer.parseInt(pcsBean.getWjsjs());
				 fdtks += Integer.parseInt(pcsBean.getFdtks());
				 wfdtkpcss += Integer.parseInt(pcsBean.getWfdtkpcss());
				 fdbxs += Integer.parseInt(pcsBean.getFdbxs());
				 wfdbxpcss += Integer.parseInt(pcsBean.getWfdbxpcss());
				 fcbxs += Integer.parseInt(pcsBean.getFcbxs());
				 wfcbxpcss += Integer.parseInt(pcsBean.getWfcbxpcss());
				 szs += Integer.parseInt(pcsBean.getSzs());
				 fkjyx += Integer.parseInt(pcsBean.getFkjyx());
				 fkj += Integer.parseInt(pcsBean.getFkj());
				 zkj += Integer.parseInt(pcsBean.getZkj());
				 fcj += Integer.parseInt(pcsBean.getFcj());
				 fcjys += Integer.parseInt(pcsBean.getFcjys());
				 jljwqs += Integer.parseInt(pcsBean.getJljwqs() != null ? pcsBean.getJljwqs() : "0");
				 sqmjs += Integer.parseInt(pcsBean.getSqmjs());
				 zzmjs += Integer.parseInt(pcsBean.getZzmjs());
				 sqs += Integer.parseInt(pcsBean.getSqs());
				 ncjwss += Integer.parseInt(pcsBean.getNcjwss());
				 zcmjs += Integer.parseInt(pcsBean.getZcmjs());
				 zczzmjs += Integer.parseInt(pcsBean.getZczzmjs());
				 xzcs += Integer.parseInt(pcsBean.getXzcs());
				 jwqs += Integer.parseInt(pcsBean.getJwqs());
			 }
			 sumBean.setSyrs(String.valueOf(syrs));
			 sumBean.setXjgajgzjls(String.valueOf(xjgajgzjls));
			 sumBean.setSyjlzxjlbl(String.valueOf(syjlzxjlbl));
			 sumBean.setCjpxmjs(String.valueOf(cjpxmjs));
			 sumBean.setPcss(String.valueOf(pcss));
			 sumBean.setCqhjs(String.valueOf(cqhjs));
			 sumBean.setCqs(String.valueOf(cqs));
			 sumBean.setZpcs1(String.valueOf(zpcs1));
			 sumBean.setZpcs2(String.valueOf(zpcs2));
			 sumBean.setXpcs(String.valueOf(xpcs));
			 sumBean.setXpcs2(String.valueOf(xpcs2));
			 sumBean.setZas(String.valueOf(zas));
			 sumBean.setSss(String.valueOf(sss));
			 sumBean.setYijs(String.valueOf(yijs));
			 sumBean.setErjs(String.valueOf(erjs));
			 sumBean.setSanjs(String.valueOf(sanjs));
			 sumBean.setSijs(String.valueOf(sijs));
			 sumBean.setWujs(String.valueOf(wujs));
			 sumBean.setQcs(String.valueOf(qcs));
			 sumBean.setWcpcs(String.valueOf(wcpcs));
			 sumBean.setJsjs(String.valueOf(jsjs));
			 sumBean.setWjsjs(String.valueOf(wjsjs));
			 sumBean.setFdtks(String.valueOf(fdtks));
			 sumBean.setWfdtkpcss(String.valueOf(wfdtkpcss));
			 sumBean.setFdbxs(String.valueOf(fdbxs));
			 sumBean.setWfdbxpcss(String.valueOf(wfdbxpcss ));
			 sumBean.setFcbxs(String.valueOf(fcbxs));
			 sumBean.setWfcbxpcss(String.valueOf(wfcbxpcss ));
			 sumBean.setSzs(String.valueOf(szs));
			 sumBean.setFkjyx(String.valueOf(fkjyx));
			 sumBean.setFkj(String.valueOf(fkj));
			 sumBean.setZkj(String.valueOf(zkj));
			 sumBean.setFcj(String.valueOf(fcj));
			 sumBean.setFcjys(String.valueOf(fcjys));
			 sumBean.setJljwqs(String.valueOf(jljwqs));
			 sumBean.setSqmjs(String.valueOf(sqmjs));
			 sumBean.setZzmjs(String.valueOf(zzmjs));
			 sumBean.setSqs(String.valueOf(sqs));
			 sumBean.setNcjwss(String.valueOf(ncjwss));
			 sumBean.setZcmjs(String.valueOf(zcmjs));
			 sumBean.setZczzmjs(String.valueOf(zczzmjs));
			 sumBean.setXzcs(String.valueOf(xzcs));
			 sumBean.setJwqs(String.valueOf(jwqs));
			 sumBean.setOrgcode("999999999999");
			 sumBean.setOrgname("合计");
			 list.add(sumBean);
		 }
		 return list;
	}
	
	
	public PageResultInfo<OrgJwsBean> queryPcsJwqJbqkListPageResult(PcsTjqkQueryBean pcstjQueryBean, PageInfo pageInfo)
	{
		return dao.queryPcsJwqJbqkListPageResult(pcstjQueryBean, pageInfo);
	}
	
	public List<OrgJwsBean> queryPcsjwqList(PcsTjqkQueryBean pcstjQueryBean)
	{
		return dao.queryPcsjwqList(pcstjQueryBean);
	}
	
	public PageResultInfo<JqtbBean> queryFaqktjPageResult(MhtjQueryBean queryBean, PageInfo pageInfo)
	{
		return dao.queryFaqktjPageResult(queryBean, pageInfo);
	}
	
	public PageResultInfo<JqtbBean> queryFaqktjYearHzPageResult(MhtjQueryBean queryBean, PageInfo pageInfo)
	{
		return dao.queryFaqktjYearHzPageResult(queryBean, pageInfo);
	}
	
	public List<JqtbBean> queryFaqktjPageList(MhtjQueryBean queryBean)
	{
		return dao.queryFaqktjPageList(queryBean);
	}
	
	public List<CzfwTjbbBean> queryCzfwTjbbBeans(CzfwTjbbBean czfwtjbean)
	{
		return dao.queryCzfwTjbbBeans(czfwtjbean);
	}
	
	public List<LdrkTjbbBean> queryLdrkTjbbBeans(LdrkTjbbBean ldrktjbbBean)
	{
		return dao.queryLdrkTjbbBeans(ldrktjbbBean);
	}
	
	public List<GabzzrkTjbbBean> queryGabzzrkTjbbBeans(GabzzrkTjbbBean gabzzrkBean)
	{
		return dao.queryGabzzrkTjbbBeans(gabzzrkBean);
	}
	
	public List<JzztjbbBean> queryJzztjbbBeans(JzztjbbBean jzztjbean)
	{
		return dao.queryJzztjbbBeans(jzztjbean);
	}
	
	public PageResultInfo<DatalrtjBean> queryDataLrtjBeans(DataLrthQueryBean queryBean, PageInfo pageInfo)
	{
		return dao.queryDataLrtjBeans(queryBean, pageInfo);
	}
	
	/**
	 * 查询单位统计
	 * @param query
	 * @return
	 */
	public List<DwtjBean> queryDwtjList(QueryBean query){
		try {
			return  dao.queryDwtjList(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 查询单位安全检查数据统计
	 * @param pageInfo
	 * @param aqjctjBean
	 * @return
	 * @date Jan 29, 2015 10:52:53 AM
	 */
	public PageResultInfo<DwaqjctjbbBean> queryDwaqjctjbbBeanPageResult(PageInfo pageInfo, DwaqjctjbbBean aqjctjBean)
	{
		return dao.queryDwaqjctjbbBeanPageResult(pageInfo, aqjctjBean);
	}
	
	
	public String loadFaqkXmlData(MhtjQueryBean queryBean)
	{
		try
		{
			StringBuffer sb = new StringBuffer();
			//xml公共头部
			StringBuffer headerxml = new StringBuffer();
			//xml category
			StringBuffer categorysb = new StringBuffer();
			//xml dataset 刑事案件
			StringBuffer xsajDataSet = new StringBuffer();
			//xml dataset 行政案件
			StringBuffer zaajDataSet = new StringBuffer();
			//xml dataset 抢劫案件
			StringBuffer qjajDataSet = new StringBuffer();
			//xml dataset 抢夺案
			StringBuffer qdajDataSet = new StringBuffer();
			//xml dataset 入室盗窃案
			StringBuffer rsdqDataSet = new StringBuffer();
			//xml dataset 盗抢机动车
			StringBuffer dqjdcDataSet = new StringBuffer();
			
			List<String> categoryyfs = new ArrayList<String>();
			String tjyf = queryBean.getTjyf() + "15";
			for (int i=11;i>=0;i--)
			{
				Date cdate = DateTimeHelper.addMonths(DateTimeHelper.convertToDate(tjyf, "yyyyMMdd"), -i);
				String cdatestr = DateTimeHelper.conver(cdate, "yyyyMM");
				categoryyfs.add(cdatestr);
			}
			Map<String, JqtbBean> jqtbBeanMap = dao.queryFaqktjBeans(queryBean);
			
			
			headerxml.append("<?xml version='1.0' encoding='GBK'?>");
			headerxml.append("<graph caption='" + queryBean.getOrgname() +
						"' subcaption='(从" +String.valueOf(categoryyfs.get(0)) +
						"到" + String.valueOf(categoryyfs.get(categoryyfs.size()-1)) + ")' hovercapbg='FFECAA' hovercapborder='F47E00' " +
						"formatNumberScale='0' decimalPrecision='0' showvalues='0' numdivlines='3' numVdivlines='0' " +
						"yaxisminvalue='1000' yaxismaxvalue='1800'  rotateNames='1'>");
			
			categorysb.append("<categories>");
			xsajDataSet.append("<dataset seriesName='刑事' color='1D8BD1' anchorBorderColor='1D8BD1' anchorBgColor='1D8BD1'>");
			zaajDataSet.append("<dataset seriesName='行政' color='F1683C' anchorBorderColor='F1683C' anchorBgColor='F1683C'>");
			qjajDataSet.append("<dataset seriesName='抢劫' color='2AD62A' anchorBorderColor='2AD62A' anchorBgColor='2AD62A'>");
			qdajDataSet.append("<dataset seriesName='抢夺' color='DBDC25' anchorBorderColor='DBDC25' anchorBgColor='DBDC25'>");
			rsdqDataSet.append("<dataset seriesName='入室盗窃' color='FF0000' anchorBorderColor='FF0000' anchorBgColor='FF0000'>");
			dqjdcDataSet.append("<dataset seriesName='盗抢机动车' color='FF00FF' anchorBorderColor='FF00FF' anchorBgColor='FF00FF'>");
			JqtbBean jqtbBean = null;
			for (int i=0;i<categoryyfs.size();i++)
			{
				String category = categoryyfs.get(i);
				categorysb.append("<category name='" + category + "'/>");
				jqtbBean = jqtbBeanMap.get(category);
				if (jqtbBeanMap.get(category) != null)
				{
					xsajDataSet.append("<set value='" + jqtbBean.getXsaj() + "'/>");
					zaajDataSet.append("<set value='" + jqtbBean.getZaaj() + "'/>");
					qjajDataSet.append("<set value='" + jqtbBean.getQjajs()+"'/>");
					qdajDataSet.append("<set value='" + jqtbBean.getQdajs() + "'/>");
					rsdqDataSet.append("<set value='" + jqtbBean.getRsdqaj() + "'/>");
					dqjdcDataSet.append("<set value='" + jqtbBean.getDqjdclaj() + "'/>");
				}
				else
				{
					xsajDataSet.append("<set value='0'/>");
					zaajDataSet.append("<set value='0'/>");
					qjajDataSet.append("<set value='0'/>");
					qdajDataSet.append("<set value='0'/>");
					rsdqDataSet.append("<set value='0'/>");
					dqjdcDataSet.append("<set value='0'/>");
				}
			}
			categorysb.append("</categories>");
			xsajDataSet.append("</dataset>");
			zaajDataSet.append("</dataset>");
			qjajDataSet.append("</dataset>");
			qdajDataSet.append("</dataset>");
			rsdqDataSet.append("</dataset>");
			dqjdcDataSet.append("</dataset>");
			
			sb.append(headerxml);
			sb.append(categorysb);
			sb.append(xsajDataSet);
			sb.append(zaajDataSet);
			sb.append(qjajDataSet);
			sb.append(qdajDataSet);
			sb.append(rsdqDataSet);
			sb.append(dqjdcDataSet);
			sb.append("</graph>");
			return sb.toString();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 
	 * @param tjbbBean
	 * @param pageInfo
	 * @return
	 * @date Feb 11, 2015 2:45:21 PM
	 */
	public PageResultInfo<WeekTjbbBean> queryWeekTjbbBeanPageResultInfo(WeekTjbbBean tjbbBean, PageInfo pageInfo)
	{
		try
		{
			return dao.queryWeekTjbbBeanPageResultInfo(tjbbBean, pageInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List<JdTbBean> queryJdTbList(JdTbQueryBean query){
		String jds = query.getJds();
		if(ValidateHelper.isNotEmptyString(jds)){
			if("1".equals(jds)){
				query.setTjsj_start(query.getTjnf() + "0101");
				query.setTjsj_end(query.getTjnf() + "0331");
			}else if("2".equals(jds)){
				query.setTjsj_start(query.getTjnf() + "0401");
				query.setTjsj_end(query.getTjnf() + "0630");
			}else if("3".equals(jds)){
				query.setTjsj_start(query.getTjnf() + "0701");
				query.setTjsj_end(query.getTjnf() + "0930");
			}else {
				query.setTjsj_start(query.getTjnf() + "1001");
				query.setTjsj_end(query.getTjnf() + "1231");
			}
		}
		try {
			return dao.queryJdTbList(query);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 查询周采集情况
	 * @param tjbbBean
	 * @return
	 * @date May 12, 2015 3:42:00 PM
	 */
	public List<WeekTableTjbbBean> queryWeekTableTjbbBeans(WeekTjbbBean tjbbBean)
	{
		return dao.queryWeekTableTjbbBeans(tjbbBean);
	}
}
