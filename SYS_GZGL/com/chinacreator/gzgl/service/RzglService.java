package com.chinacreator.gzgl.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.OrganizationBean;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.UserBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.business.OrgUserbusiness;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.RizhiBean;
import com.chinacreator.gzgl.bean.RzhzBean;
import com.chinacreator.gzgl.dao.RizhiDao;
import com.chinacreator.gzgl.query.RizhiQuery;
import com.chinacreator.gzgl.util.GZGLCommonStatuts;

/**
 * 日志管理Service
 * @author zhujiaojie
 * @date 2013/03/20
 *
 */
public class RzglService
{
	public static final String OP_ADD = "_insert";
	
	public static final String OP_DEL = "_delete";
	
	public static final String OP_UPDATE = "_update";
	
	public static final String OP_DEFAULT = "_default";
	
	protected static final String SEQ_NAME = "SEQ_GZGL_GZRZ";
	/**
	 * 查询日志数据集合
	 * @param condQuery	查询条件
	 * @return	查询结果集
	 */
	public List<RizhiBean> getRizhiList(RizhiQuery condQuery)
	{
		List<RizhiBean> rizhiList = null;
		try
		{
			rizhiList = RizhiDao.getRizhiList(condQuery);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return rizhiList;
	}
	
	public RizhiBean queryGzRzBeanByMjjhAndGzrq(String username, String gzrq)
	{
		try
		{
			return RizhiDao.queryGzRzBeanByMjjhAndGzrq(username, gzrq);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 分页查询日志数据集合
	 * @param	page	分页条件
	 * @param condQuery	查询条件
	 * @return	分页查询结果
	 */
	public PageResultInfo<RizhiBean> getRizhiListPage(PageInfo page, RizhiQuery condQuery)
	{
		PageResultInfo<RizhiBean> pageResult = null;
		try
		{
			pageResult = RizhiDao.getRizhiPageResultInfo(condQuery, page);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return pageResult;
	}
	
	/**
	 * 对单个日志bean对象进行状态及其他数据属性进行修改更新
	 * @param rizhiBean	待操作的日志bean
	 */
	public boolean submitRizhi(RizhiBean rizhiBean, String op)
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		boolean flag = false;
		String gxsj = DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss");
		rizhiBean.setGxsj(gxsj);
		try
		{
			if (OP_DEL.equals(op))
			{
				if (ValidateHelper.isEmptyString(rizhiBean.getRzbh()))
				{
					//抛业务异常
					throw new NullPointerException("rzbh is null");
				}
				rizhiBean.setCzbz(GZGLCommonStatuts.CZBZ_DEL);
				RizhiBean rizhi = RizhiDao.queryRizhiBean(rizhiBean.getRzbh());
				rizhi.setGxsj(gxsj);
				rizhi.setCzbz(GZGLCommonStatuts.CZBZ_DEL);
				RizhiDao.delRizhiBean(rizhi);
				flag = true;
			}
			else if (ValidateHelper.isEmptyString(rizhiBean.getRzbh()))
			{
				String rzbh = loginInfo.getOrgcode().substring(0, 4) + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, SEQ_NAME);
				rizhiBean.setRzbh(rzbh);
				rizhiBean.setCzbz(GZGLCommonStatuts.CZBZ_ADD);
				rizhiBean.setDjrsfzh(loginInfo.getSfzh());
				RizhiDao.insertRizhiBean(rizhiBean);
				flag = true;
			}
			else if (ValidateHelper.isNotEmptyString(rizhiBean.getRzbh()))
			{
				if (ValidateHelper.isEmptyString(rizhiBean.getRzbh()))
				{
					//抛业务异常
					throw new NullPointerException("rzbh is null");
				}
				rizhiBean.setCzbz(GZGLCommonStatuts.CZBZ_UPDATE);
				RizhiDao.updateRizhiBean(rizhiBean);
				flag = true;
			}
			rizhiBean.setOp(OP_DEFAULT);//重置操作标示
		}
		catch (SQLException e)
		{
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 对批量日志bean数据进行操作
	 * @param rizhiList
	 */
	public void batchSubmitRizhis(List<RizhiBean> rizhiList)
	{
		try
		{
			RizhiDao.batchDelRizhiBeans(rizhiList);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public RizhiBean getRizhiBeanByRzbh(String rzbh) throws SQLException {
		return RizhiDao.getRizhiBeanByRzbh(rzbh);
	}
	
	public  List<RizhiBean> queryRiZhiListByRzbh(String rzbhs) throws Exception{
		return RizhiDao.queryRiZhiListByRzbh(rzbhs);
	}

	
	/**
	 * 查询日志汇总
	 * @return
	 */
	public RzhzBean queryRzhz(RizhiQuery query){
		RzhzBean rzhz = new RzhzBean();
		try {
			List<RizhiBean> rzlist = RizhiDao.getRizhiList(query);
			List<Map<String,String>> rzs = new ArrayList<Map<String,String>>();
			if(rzlist != null){
				String hzsj = "";
				if(ValidateHelper.isNotEmptyString(query.getBeginDate()) && ValidateHelper.isNotEmptyString(query.getEndDate())){
					hzsj = query.getBeginDate().replaceFirst("-", "年");
					hzsj = hzsj.replaceFirst("-", "月");
					hzsj += "日至" + query.getEndDate().replaceFirst("-", "年");
					hzsj = hzsj.replaceFirst("-", "月") + "日";
				}else if(ValidateHelper.isEmptyString(query.getBeginDate()) && ValidateHelper.isEmptyString(query.getEndDate())){
					hzsj = "历史以来至今";
				}else if(ValidateHelper.isNotEmptyString(query.getBeginDate()) && ValidateHelper.isEmptyString(query.getEndDate())){
					hzsj = query.getBeginDate().replaceFirst("-", "年");
					hzsj = hzsj.replaceFirst("-", "月") + "日至今";
				}else if(ValidateHelper.isEmptyString(query.getBeginDate()) && ValidateHelper.isNotEmptyString(query.getEndDate())){
					hzsj = "历史以来至" + query.getEndDate().replaceFirst("-", "年");
					hzsj = hzsj.replaceFirst("-", "月") + "日";
				}
				rzhz.setHzsj(hzsj);
				rzhz.setGzmjjh(query.getMjjh());
				
				OrgUserbusiness orgbusiness = new OrgUserbusiness();
				OrganizationBean org = orgbusiness.queryOrgByUser(query.getMjjh());
				UserBean user = orgbusiness.queryUserByUserName(query.getMjjh());
				if(org != null){
					rzhz.setHzdw(org.getOrgname());
				}
				if(user != null){
					rzhz.setGzmjxm(user.getRealname());
				}
				
				if(rzlist.size() == 0){
					rzhz.setRzList(null);
				}else if(rzlist.size() == 1){
					Map<String,String> rzMap = new HashMap<String,String>();
					String gzrq = rzlist.get(0).getGzrq();
					gzrq.replaceFirst("-", "年");
					gzrq.replaceFirst("-", "月");
					gzrq = gzrq + "日";
					rzMap.put("gzrq", gzrq);
					rzMap.put("week", rzlist.get(0).getWeek());
					
					String gznr = rzlist.get(0).getGznrms();
					if(rzlist.get(0).getCljgms() != null){
						gznr += rzlist.get(0).getCljgms();
					}
					rzMap.put("gznr",gznr);
					rzs.add(rzMap);
					rzhz.setRzList(rzs);
				}else{
					Map<String,String> rzMap = new HashMap<String,String>();
					String rznr = "";
					for(int i = 0 ; i<rzlist.size() ; i++){
						if(i == 0){
							String gzrq = rzlist.get(0).getGzrq();
							gzrq = gzrq.replaceFirst("-", "年");
							gzrq = gzrq.replaceFirst("-", "月") + "日";
							rzMap.put("gzrq", gzrq);
							rzMap.put("week", rzlist.get(0).getWeek());
							rznr = rzlist.get(0).getGznrms();
						}else{
							if(rzlist.get(i).getGzrq().equals(rzlist.get(i - 1).getGzrq())){
								rznr += rzlist.get(i).getGznrms();
								if(rzlist.get(i).getCljgms() != null){
									rznr += "<br/>";
									rznr += rzlist.get(i).getCljgms();
								}
							}else{
								if(rzlist.get(i).getCljgms() != null){
									rznr += "<br/>";
									rznr += rzlist.get(i).getCljgms();
								}
								rzMap.put("gznr",rznr);
								rzs.add(rzMap);
								
								rznr = "";
								rzMap = new HashMap<String,String>();
								String gzrq = rzlist.get(i).getGzrq();
								gzrq = gzrq.replaceFirst("-", "年");
								gzrq = gzrq.replaceFirst("-", "月") + "日";
								rzMap.put("gzrq", gzrq);
								rzMap.put("week", rzlist.get(i).getWeek());
								rznr = rzlist.get(i).getGznrms();
							}
							
							if(i == rzlist.size() - 1){
								rzMap.put("gznr", rznr);
								rzs.add(rzMap);
							}
						}
					}
					rzhz.setRzList(rzs);
				}
			}else{
				rzhz.setRzList(null);
			}
			
		} catch (SQLException e) {
			rzhz = null;
			e.printStackTrace();
		}
		return rzhz;
	}
}
