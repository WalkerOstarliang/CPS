package com.chinacreator.lsgl.action;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.RollbackException;

import sun.misc.BASE64Encoder;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.business.OrgUserbusiness;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.JwrkxxBean;
import com.chinacreator.lsgl.bean.JzrkxxBean;
import com.chinacreator.lsgl.bean.LdrkxxBean;
import com.chinacreator.lsgl.bean.RkDzxxBean;
import com.chinacreator.lsgl.bean.RkJhsyBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.lsgl.bean.RkgxrxxBean;
import com.chinacreator.lsgl.bean.RklxfsxxBean;
import com.chinacreator.lsgl.bean.RktmtzxxBean;
import com.chinacreator.lsgl.bean.RkwlczhkBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.bean.RkzpxxBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.chinacreator.lsgl.services.LsglFwService;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.LsglZdryService;
import com.chinacreator.lsgl.services.impl.LsglFwServiceImpl;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;
import com.chinacreator.lsgl.services.impl.LsglZdryServiceImpl;
import com.chinacreator.remote.business.RemoteRequestService;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.services.CyryManageService;
import com.frameworkset.orm.transaction.TransactionManager;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 两实人口管理action
 * 
 * @filename LsglRkJbxxAction.java
 * @author mingchun.xiong
 * @date 2013-8-19
 *
 */
public class LsglRkJbxxAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -1424284124775872686L;
	
	private LsglRkService rkService;
	private LsglFwService fwService;
	private LsglZdryService zdryService;
	private CyryManageService cyryService;
	private RkQueryBean queryBean;
	private RkxxBean rkBean;
	private RkJhsyBean jhsyBean;  //计划生育Bean
	private OrgUserbusiness orgUserbusiness;
	private File[] zpUploads;
	private String[] zpUploadsFileName;
	private String jsppage;
	private String msgtype;
	private String zzbh;
	private String zdryDxlb;
	private String bhs;
	private String sfzh;  
	private String ldrkids;
	private String rkids;
	private List<SystemDictionaryBean> rylbList; 
	private List<SystemDictionaryBean> rytssxList;
	private Map<String, String> map;
	//联系方式ID
	private String lxfsId;
	
	private ZdryGzdxBean zdryBean;
	private String gender;
	
	private List<LdrkxxBean> ldrkBeans;
	
	private List<CzrkxxBean> czrkBeans;
	
	private List<JzrkxxBean> jzrkBeans;
	
	private List<RkJbxxBean> jbxxBeans;
	
	private String selectedrybhs;
	
	private String opentip = "false";
	
	/**
	 * 人员基本信息导出word
	 */
	private List<RkJbxxBean> rkjbxxList;
	private String rybhs ;
	
	/**
	 * 人口地址信息（用于从业人员）
	 */
	private RkDzxxBean rkdz;
	
	private String rylb ;
	private String rybh;
	public LsglRkJbxxAction()
	{
		rkService = new LsglRkServiceImpl();
		fwService = new LsglFwServiceImpl();
		zdryService = new LsglZdryServiceImpl();
		cyryService = new CyryManageService();
		rkBean = new RkxxBean();
		jhsyBean = new RkJhsyBean();
		queryBean = new RkQueryBean();
		rytssxList = new ArrayList<SystemDictionaryBean>();
		zdryBean = new ZdryGzdxBean();
		orgUserbusiness = new OrgUserbusiness();
	}
	
	public void initQueryBean()
	{
		super.initQueryBean(queryBean);
	}
	
	/**
	 * 跳转到人口列表查询业务
	 * @return
	 * @date 2013-8-19 上午08:24:51
	 */
	public String toRkListPage()
	{
		initQueryBean();
		return "toRkListPage";
	}
	
	public String toSyrkdjSelectPage()
	{
		return "toSyrkdjSelectPage";
	}
	
	/**
	 * 人员选择（用于从业人员）
	 * @return
	 */
	public String toRkSelectWin(){
		initQueryBean();
		return "toRkSelectWin";
	}
	
	public String toRyxglPageList()
	{
		super.initQueryBean(queryBean);
		return "toRyxglPageList";
	}
	
	public String toSyrkListPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(CommonFinalParams.RYLB_JWRK.equals(queryBean.getRylb())){
			queryBean.setZjzl("");
		}else{
			queryBean.setZjzl("111");
		}
		if (CommonFinalParams.RYLB_CZRK.equals(queryBean.getRylb()))
		{
			modename = "常住人口";
			initQueryBean();
		}
		else if (CommonFinalParams.RYLB_JWRK.equals(queryBean.getRylb()))
		{
			modename = "境外人口";
			initQueryBean();
		}
		else if (CommonFinalParams.RYLB_JZRK.equals(queryBean.getRylb()))
		{
			modename = "寄住人口";
			initQueryBean();
		}
		else if (CommonFinalParams.RYLB_LDRK.equals(queryBean.getRylb()))
		{
			modename = "流动人口";
			initQueryBean();
		}
		else if (CommonFinalParams.RYLB_WLHRK.equals(queryBean.getRylb()))
		{
			modename = "未落户常住人口";
			initQueryBean();
		}
		else if ("select".equals(queryBean.getRylb()))
		{
			modename = "实有人口";
			initQueryBean();
		}
		else 
		{
			modename = "实有人口";
			queryBean.setCitygajgjgdm(loginInfo.getCitygajgdm());
		}
		queryBean.setDjsj_start(DateTimeHelper.conver(DateTimeHelper.addDateTime(System.currentTimeMillis(), -31), "yyyy-MM-dd"));
		queryBean.setDjsj_end(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toSyrkListPage";
	}
	
	/**
	 * 实有人口登记查询页面
	 * @return
	 * @date Jul 12, 2014 3:11:51 PM
	 */
	public String toSyrkDjQueryPage()
	{
		return "toSyrkDjQueryPage";
	}
	
	public String toSyrkSelectListPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		queryBean.setCitygajgjgdm(loginInfo.getCitygajgdm());
	//	queryBean.setCountrygajgjgdm(loginInfo.getCountrygajgdm());
		if("4".equals(queryBean.getRylb())){
			queryBean.setZjzl("");
		}else{
			queryBean.setZjzl("111");
		}
		modename = "实有人口";
		return "toSyrkSelectListPage";
	}
	
	
	public String toSyrkInfoPage()
	{
		initQueryBean();
		return "toSyrkInfoPage";
	}
	
	/**
	 * 跳转到人口信息业务
	 * @return
	 * @date 2013-8-19 上午08:26:15
	 */
	public String toRkDetailInfoPage() throws Exception
	{
		toRkInfoPage();
		return "toRkDetailInfoPage";
	}
	
	/**
	 * 跳转到人口信息业务
	 * @return
	 * @date 2013-8-19 上午08:26:15
	 */
	public String toRkInfoPage() throws Exception
	{
		if (ValidateHelper.isNotEmptyString(queryBean.getRylb()))
		{
			rkBean.getJbxxBean().setSfzh(queryBean.getSfzh());
		}
		else
		{
			String rylb = CommonSequenceHelper.getRylb(queryBean.getSfzh(), queryBean.getFwid());
			queryBean.setRylb(rylb);
		}
		if ("1".equals(queryBean.getRylb()))
		{
			modename = "常住人口";
		}
		else if ("2".equals(queryBean.getRylb()))
		{
			modename = "流动人口";
		}
		else if ("3".equals(queryBean.getRylb()))
		{
			modename = "未落户人口";
		}
		else if ("4".equals(queryBean.getRylb()))
		{
			modename = "境外人口";
		}
		else if("5".equals(queryBean.getRylb()))
		{
			modename = "寄住人口";
		}
		if(ValidateHelper.isNotEmptyString(zdryDxlb)){
			if(CommonConstant.ZDRY_ZDRY.equals(zdryDxlb)){
				zdryDxlb="重点人员";
			}else if(CommonConstant.ZDRY_GZDX.equals(zdryDxlb)){
				zdryDxlb="工作对象";
			}
		}
		loadRkInfoPage();
		if("rydaxx".equals(operType)){
			return "toRydaRkInfoPage";
		}else{
			return "toRkInfoPage";
		}
	}
	
	/**
	 * 实有人口查询条件页面
	 * @return
	 * @date 2013-9-17 下午03:03:47
	 */
	public String toSyrkSelectPage()
	{
		return "toSyrkSelectPage";
	}
	
	
	/**
	 * 加载人口信息页面
	 * @return
	 * @date 2013-8-29 下午05:15:19
	 */
	public String loadRkInfoPage() throws Exception
	{
		RkJbxxBean jbxxBean = rkService.getExsitRkxxObject(queryBean.getSfzh(), queryBean.getRylb(), queryBean.getFwid());
		//如果人员已经存在则加载存在数据
		if (jbxxBean != null)
		{
			rkBean = rkService.queryRkxxBeanByRkid(queryBean.getRylb(), jbxxBean.getRkid(), jbxxBean.getRybh(), msgtype, CommonConstant.OPERTYPE_UPDATE);
		}
		else if (ValidateHelper.isNotEmptyString(queryBean.getRkid()))
		{
			rkBean = rkService.queryRkxxBeanByRkid(queryBean.getRylb(), queryBean.getRkid(), queryBean.getRybh(), msgtype, operType);
		}
		else if (ValidateHelper.isNotEmptyString(queryBean.getRybh()))
		{
			rkBean = rkService.queryRkxxBeanByRybh(queryBean.getRylb(), queryBean.getRybh(), msgtype, operType);
		}
		else if (ValidateHelper.isNotEmptyString(queryBean.getSfzh()))
		{
			if (CommonConstant.OPERTYPE_ADD.equals(operType))
			{
				jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
				if (jbxxBean != null)
				{
					rkBean.setJbxxBean(jbxxBean);
				}
			}
			else
			{
				rkBean = rkService.queryRkxxBeanBySfzh(queryBean.getRylb(), queryBean.getSfzh(), msgtype);
			}
		}
		if (rkBean.getJbxxBean() != null && ValidateHelper.isNotEmptyString(rkBean.getJbxxBean().getRybh())
				&&CommonFinalParams.RYLB_LDRK.equals(rkBean.getRylb())
				&& ValidateHelper.isEmptyString((rkBean.getLdrkBean().getCzbs())))
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			rkBean.getLdrkBean().setZrdwdm(loginInfo.getOrgcode());
			rkBean.getLdrkBean().setZrdwmc(loginInfo.getOrgname());
			rkBean.getLdrkBean().setZrmjjh(loginInfo.getUsername());
			rkBean.getLdrkBean().setZrmjxm(loginInfo.getRealname());
			rkBean.getLdrkBean().setZrmjlxdh(loginInfo.getMoblie());
		}
		if (ValidateHelper.isNotEmptyString(queryBean.getFwid()))
		{
			FwJbxxBean fwJbxxBean = fwService.queryFwJbxxBeanByFwid(queryBean.getFwid(),"fwinfo");
			rkBean.setFwxxBean(fwJbxxBean);
		}
		if (ValidateHelper.isEmptyString(rkBean.getJbxxBean().getSfzh()))
		{
			rkBean.getJbxxBean().setSfzh(queryBean.getSfzh());
		}
		if (CommonFinalParams.RYLB_JWRK.equals(queryBean.getRylb())){
			JwrkxxBean jwrkBean = rkService.queryJwrkJbxxByRybh(queryBean.getRybh());
			rkBean.setJwrkBean(jwrkBean);
		}
		
		//流动人口登记计划生育信息
		if("lkjbxx".equals(jsppage)){
			// 查询计划生育信息
			if(ValidateHelper.isNotEmptyString(rkBean.getJbxxBean().getRybh())){
				RkJhsyBean	jhsyBean = rkService.queryJhsyBeanByRybh(rkBean.getJbxxBean().getRybh());
				if(jhsyBean!=null){
					rkBean.setJhsyBean(jhsyBean);
				}
			}
			rkBean.getJhsyBean().setJlbh("JHSY"+rkBean.getJbxxBean().getSfzh());
		}
		return jsppage;
	}
	
	
	//点击详情 进入人员档案信息的方法 （rydaxx  ）
	public String rydaxxloadRkInfoPage() throws Exception
	{
		RkJbxxBean jbxxBean = rkService.getExsitRkxxObject(queryBean.getSfzh(), rylb, queryBean.getFwid());
		//如果人员已经存在则加载存在数据
		if (jbxxBean != null)
		{
			rkBean = rkService.queryRkxxBeanByRkid(rylb, jbxxBean.getRkid(), jbxxBean.getRybh(), msgtype, CommonConstant.OPERTYPE_UPDATE);
		}
		else if (ValidateHelper.isNotEmptyString(queryBean.getRkid()))
		{
			rkBean = rkService.queryRkxxBeanByRkid(rylb, queryBean.getRkid(), queryBean.getRybh(), msgtype, operType);
		}
		else if (ValidateHelper.isNotEmptyString(queryBean.getRybh()))
		{
			rkBean = rkService.queryRkxxBeanByRybh(rylb, queryBean.getRybh(), msgtype, operType);
		}
		else if (ValidateHelper.isNotEmptyString(queryBean.getSfzh()))
		{
			rkBean = rkService.queryRkxxBeanBySfzh(rylb, queryBean.getSfzh(), msgtype);
		}
		
		if (ValidateHelper.isNotEmptyString(rkBean.getJbxxBean().getRybh()) 
				&& CommonFinalParams.RYLB_CZRK.equals(rkBean.getRylb()))
		{
			CzrkxxBean czrkBean = rkService.queryDqCzrkxxBeanByRybh(rkBean.getJbxxBean().getRybh());
			rkBean.setCzrkBean(czrkBean);
		}
		
		if (ValidateHelper.isEmptyString(rkBean.getJbxxBean().getRybh()))
		{
			operType = "add";
		}
		if (ValidateHelper.isNotEmptyString(queryBean.getFwid()))
		{
			FwJbxxBean fwJbxxBean = fwService.queryFwJbxxBeanByFwid(queryBean.getFwid(),"fwinfo");
			rkBean.setFwxxBean(fwJbxxBean);
		}
		return jsppage;
	}
	
	
	private void setCsrqAndAge()
	{
		int age_start=0;
		int age_end=0;
		String nowStr=DateTimeHelper.getNowDateStr("yyyy").toString();
		int nowInt=Integer.parseInt(nowStr);
		if(ValidateHelper.isNotEmptyString(queryBean.getAge_start())){
			 age_start=Integer.parseInt(queryBean.getAge_start());
			 queryBean.setCsrq_end(String.valueOf(nowInt-age_start)+"-12-31");
		}else if(ValidateHelper.isNotEmptyString(queryBean.getAge_end())){
			 age_end =Integer.parseInt(queryBean.getAge_end());
			 queryBean.setCsrq_start(String.valueOf(nowInt-age_end)+"-01-01");
			 queryBean.setCsrq_end(String.valueOf(nowInt-age_end)+"-12-31");
		}
	    if(ValidateHelper.isNotEmptyString(queryBean.getAge_end())){
		     age_end =Integer.parseInt(queryBean.getAge_end());
			 queryBean.setCsrq_start(String.valueOf(nowInt-age_end)+"-01-01");
		}else if(ValidateHelper.isNotEmptyString(queryBean.getAge_start())){
			age_start=Integer.parseInt(queryBean.getAge_start());
			queryBean.setCsrq_start(String.valueOf(nowInt-age_start)+"-01-01");
			queryBean.setCsrq_end(String.valueOf(nowInt-age_start)+"-12-31");
		}
	}
	
	private void setHjdqh(){
		String hjdqh =queryBean.getHjdqh();
		if(ValidateHelper.isNotEmptyString(hjdqh)){
			if(hjdqh.endsWith("0000")){
				queryBean.setHjdqh(hjdqh.substring(0,2));
			}else if(hjdqh.endsWith("00")) {
				queryBean.setHjdqh(hjdqh.substring(0,4));
			}else{
				queryBean.setHjdqh(hjdqh);
			}
		}
	}
	
	/**
	 * 查询人口列表
	 * @throws Exception
	 * @date 2013-8-20 下午12:43:01
	 */
	public void queryRkPageResultInfo() throws Exception
	{
		try
		{
			setCsrqAndAge();
			setHjdqh();
			PageResultInfo<? extends RkJbxxBean> pageResult = rkService.queryRkPageResultInfo(getPageInfo(), queryBean);
			responseWrite(pageResult);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询人口信息通过身份证号
	 * @date Mar 28, 2014 9:46:26 AM
	 */
	public void queryRkInfoBySfzh()
	{
		try
		{
			PageResultInfo<RkJbxxBean> pageResult = rkService.queryCzrkInfoBeanBySfzh(getPageInfo(), queryBean);
			if (ValidateHelper.isEmptyCollection(pageResult.getDatas()))
			{
				OrgUserbusiness orgbusiness = new OrgUserbusiness();
				RkJbxxBean czrkBean = orgbusiness.queryRyxxBean(queryBean.getZjhm());
				if (czrkBean != null)
				{
					pageResult.getDatas().add(czrkBean);
				}
			}
			responseWrite(pageResult);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void queryRkZpSyrkPageResultInfo()
	{
		PageResultInfo<RkJbxxBean> pageResult = null;
		try
		{
			setCsrqAndAge();
			setHjdqh();
			pageResult = rkService.queryRkZpPageResultInfo(getPageInfo(), queryBean);
		}
		catch(Exception e)
		{
			pageResult = new PageResultInfo<RkJbxxBean>();
			e.printStackTrace();
		}
		responseWrite(pageResult);
	}
	
	/**
	 * 通过身份证号查询数据
	 * @throws Exception
	 * @date 2013-9-17 下午03:52:04
	 */
	public void queryRkJbxxBySfzh() throws Exception
	{
		RkJbxxBean jbxxBean = null;
		if (CommonFinalParams.RYLB_JWRK.equals(queryBean.getRylb()))
		{
			jbxxBean = rkService.queryRkJbxxBeanByGjAndZjzlAndZjhm(queryBean);
		}
		else
		{
			jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
		}
		PageResultInfo<RkJbxxBean> pageResultInfo = new PageResultInfo<RkJbxxBean>();
		if (jbxxBean != null)
		{
			pageResultInfo.addData(jbxxBean);
		}
		responseWrite(pageResultInfo);
	}
	
	/**
	 * 保存人口信息
	 * @throws Exception
	 * @date 2013-8-20 下午01:57:53
	 */
	public void saveRkxxBean() throws Exception
	{
		RkxxBean rkxxBean = rkService.saveRkxxBean(rkBean, msgtype, zpUploads, zpUploadsFileName);
		responseWrite(rkxxBean);
	}

	/**
	 * 删除人口照片
	 * @throws Exception
	 * @date 2013-8-30 下午03:11:52
	 */
	public void deleteRkzpImage() throws Exception
	{
		rkService.deleteRkzpImage(queryBean.getZpid());
		responseWrite(true);
	}
	
	/**
	 * 显示人口照片信息
	 * @return
	 * @throws Exception
	 * @date 2013-8-24 下午04:47:29
	 */
	public void showRkzpImage()throws Exception
	{
		InputStream is = null;
		OutputStream os = null;
		try
		{
			os = response.getOutputStream();
			Blob zpblob = rkService.getRkzpBlob(queryBean.getZpid());
			is = zpblob.getBinaryStream();
			if (is == null) return ;
			byte[] b = new byte[1024];
			while(is.read(b) > 0)
			{
				os.write(b);
			}
		}
		catch(Exception e)
		{
		}
		finally
		{
			try
			{
				is.close();
				os.close();
			}
			catch (IOException e)
			{
			}
			
		}
	}
	
	/**
	 * 根据人员编号查询地址
	 * @throws Exception
	 */
	public void queryRkDzByRybh() throws Exception{
		responseWrite(rkService.queryDzxxByRybh(rkdz.getRk().getRybh()));
	}
	
	/**
	 * 根据身份证查询人员地址
	 * @throws Exception
	 */
	public void queryRkDzBySfzh() throws Exception{
		responseWrite(rkService.queryDzxxBySfzh(rkdz.getRk().getSfzh()));
	}
	
	/**
	 * 判断身份证是否存在
	 * @throws Exception
	 */
	public void isExistSfzhInRkxx() throws Exception {
		boolean flag=rkService.isExistsSfzh(rkBean.getJbxxBean().getSfzh());
		responseWrite(flag);
	}
	
	/**
	 * 跳转到流动人口延期信息登记
	 * @return
	 * @throws Exception 
	 */
	public String toLdrkYanQi() throws Exception{
		if(ValidateHelper.isNotEmptyString(rkBean.getLdrkBean().getRybh())){
			rkBean = rkService.queryRkxxBeanByRybh("2", rkBean.getLdrkBean().getRybh(), "1", operType);
			//LdrkxxBean ldrkBean=rkService.queryLdrkBeanByZzbh(zzbh);
			rkBean.getLdrkBean().setZzzqfrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			rkBean.getLdrkBean().setZzbh(zzbh);
			//rkBean.setLdrkBean(ldrkBean);
		}
		return "toLdrkYanQi";
	}
	
	/**
	 * 跟新流动人口 居住时间信息
	 */
	public  void updateLdrkBean(){
		//修改信息  拟居日期 
		try
		{
			if (rkBean != null && rkBean.getLdrkBean() != null)
			{
				rkService.updateLdrkInfoBean(rkBean.getLdrkBean());
				responseWrite(true);
			}
			else
			{
				responseWrite(false);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	
	
	public void checkRKisExists()
	{
		String dzmc = rkService.getExistsRkBeanDzmc(queryBean.getSfzh());
		responseWrite(dzmc);
	}
	
	/**
	 * 删除人口信息（流动、寄住、境外）
	 * @throws Exception 
	 * @throws Exception 
	 */
	public void deleteRkxx() throws Exception{
		TransactionManager tm = null;
		try {
			
			tm = new TransactionManager();
			tm.begin();
			//流动
			if(CommonFinalParams.RYLB_LDRK.equals(rylb)){
				LdrkxxBean ldrkBean = rkService.queryLdrkBeanByZzbh(bhs);
				rkService.deleteLdrkInfo(bhs);
				if( ldrkBean !=null && ValidateHelper.isNotEmptyString(ldrkBean.getRkfwglid())){
					rkService.deleteRkfwInfo(ldrkBean.getRkfwglid());
				}
			}
			//寄住
			else if(CommonFinalParams.RYLB_JZRK.equals(rylb)){
				JzrkxxBean jzrkBean = rkService.queryJzrkInfoByJzbh(bhs);
				rkService.deleteJzrkInfo(bhs);
				if(jzrkBean != null && ValidateHelper.isNotEmptyString(jzrkBean.getRkfwglid())){
					rkService.deleteRkfwInfo(jzrkBean.getRkfwglid());
				}
			}
			//境外
			else if(CommonFinalParams.RYLB_JWRK.equals(rylb)){
				JwrkxxBean jwrkBean = rkService.queryJwrkInfoByJwbh(bhs);
				rkService.deleteJwrkInfo(bhs);
				if(jwrkBean != null && ValidateHelper.isNotEmptyString(jwrkBean.getRkfwglid())){
					rkService.deleteRkfwInfo(jwrkBean.getRkfwglid());
				}
			}
			//未落户
			else if(CommonFinalParams.RYLB_WLHRK.equals(rylb)){
				RkwlczhkBean rkwlhBean = rkService.queryWlhrkInfoByWlhbh(bhs);
				rkService.deleteWlhrkInfo(bhs);
				if(rkwlhBean !=null && ValidateHelper.isNotEmptyString(rkwlhBean.getRkfwglid())){
					rkService.deleteRkfwInfo(rkwlhBean.getRkfwglid());
				}
			}
			tm.commit();
		} catch (Exception e) {
			tm.rollback();
			e.printStackTrace();
			responseWrite(false);
		}
		responseWrite(true);
	}
	
	/**
	 * 注销人口信息 (常口、流动、寄住、境外)
	 * @return
	 * @throws RollbackException 
	 * @throws Exception 
	 */
	public void logoutRkxx() throws RollbackException{
		TransactionManager tm = null;
		RkfwglBean rkfwglBean = new RkfwglBean();
		LoginInfo loginInfo =  ActionContextHelper.getLoginInfo();
		try {
			tm = new TransactionManager();
			tm.begin();

			//常住
			if(CommonFinalParams.RYLB_CZRK.equals(rylb))
			{
				rkService.logoutCzrkInfo(rkBean.getCzrkBean());
				if(ValidateHelper.isNotEmptyString(rkBean.getCzrkBean().getCzrkbh())){
					CzrkxxBean czrkBean = rkService.queryCzrkFwglInfoByCzrkbh(rkBean.getCzrkBean().getCzrkbh());
					rkfwglBean.setRkfwglid(czrkBean.getRkfwglid());
					rkfwglBean.setRkfwglid(czrkBean.getRkfwglid());
					rkfwglBean.setZxdwdm(loginInfo.getOrgcode());
					rkfwglBean.setZxdwmc(loginInfo.getOrgname());
					rkfwglBean.setZxmjxm(loginInfo.getRealname());
					rkfwglBean.setZxyy(rkBean.getCzrkBean().getZxyy());
					rkService.updateRkfwInfo(rkfwglBean);
				}
			}
			//流动
			else if(CommonFinalParams.RYLB_LDRK.equals(rylb))
			{
				rkService.logoutLdrkInfo(rkBean.getLdrkBean());
				if(ValidateHelper.isNotEmptyString(rkBean.getLdrkBean().getZzbh()))
				{
					LdrkxxBean ldrkBean=rkService.queryLdrkBeanByZzbh(rkBean.getLdrkBean().getZzbh());
					rkfwglBean.setRkfwglid(ldrkBean.getRkfwglid());
					rkfwglBean.setZxdwdm(loginInfo.getOrgcode());
					rkfwglBean.setZxdwmc(loginInfo.getOrgname());
					rkfwglBean.setZxmjxm(loginInfo.getRealname());
					rkfwglBean.setZxyy(rkBean.getLdrkBean().getZxyy());
					rkService.updateRkfwInfo(rkfwglBean);
				}
			}
			//寄住
			else if(CommonFinalParams.RYLB_JZRK.equals(rylb))
			{
				rkService.logoutJzrkInfo(rkBean.getJzrkBean());
				if(ValidateHelper.isNotEmptyString(rkBean.getJzrkBean().getJzbh())){
					JzrkxxBean jzrkBean = rkService.queryJzrkInfoByJzbh(rkBean.getJzrkBean().getJzbh());
					rkfwglBean.setRkfwglid(jzrkBean.getRkfwglid());
					rkfwglBean.setZxdwdm(loginInfo.getOrgcode());
					rkfwglBean.setZxdwmc(loginInfo.getOrgname());
					rkfwglBean.setZxmjxm(loginInfo.getRealname());
					rkfwglBean.setZxyy(rkBean.getJzrkBean().getZxyy());
					rkService.updateRkfwInfo(rkfwglBean);
				}
			}
			//境外
			else if(CommonFinalParams.RYLB_JWRK.equals(rylb))
			{
				rkService.logoutJwrkInfo(rkBean.getJwrkBean());
				if(ValidateHelper.isNotEmptyString(rkBean.getJwrkBean().getJwbh())){
					JwrkxxBean jwrkBean = rkService.queryJwrkInfoByJwbh(rkBean.getJwrkBean().getJwbh());
					rkfwglBean.setRkfwglid(jwrkBean.getRkfwglid());
					rkfwglBean.setZxdwdm(loginInfo.getOrgcode());
					rkfwglBean.setZxdwmc(loginInfo.getOrgname());
					rkfwglBean.setZxmjxm(loginInfo.getRealname());
					rkfwglBean.setZxyy(rkBean.getJwrkBean().getZxyy());
					rkService.updateRkfwInfo(rkfwglBean);
				}
			}
			//未落户
			else if(CommonFinalParams.RYLB_WLHRK.equals(rylb))
			{
				rkService.logoutWlhrkInfo(rkBean.getWlhrkBean());
				if(ValidateHelper.isNotEmptyString(rkBean.getWlhrkBean().getWlhrkbh())){
					RkwlczhkBean rkwlhBean = rkService.queryWlhrkInfoByWlhbh(rkBean.getWlhrkBean().getWlhrkbh());
					rkfwglBean.setRkfwglid(rkwlhBean.getRkfwglid());
					rkfwglBean.setZxdwdm(loginInfo.getOrgcode());
					rkfwglBean.setZxdwmc(loginInfo.getOrgname());
					rkfwglBean.setZxmjxm(loginInfo.getRealname());
					rkfwglBean.setZxyy(rkBean.getWlhrkBean().getZxyy());
					rkService.updateRkfwInfo(rkfwglBean);
				}
			}
			tm.commit();
		} catch (Exception e) {
			tm.rollback();
			e.printStackTrace();
			responseWrite(false);
		}
		responseWrite(true);
	}
	
	/**
	 * 恢复人口数据
	 * @return
	 */
	public void recoveryRkInfo(){
		try {
			rkService.recoveryRkInfo(rkBean, rylb, bhs);
		} catch (Exception e) {
			e.printStackTrace();
			responseWrite(false);
		}
		responseWrite(true);
	}
	
	/**
	 * 跳转到注销界面
	 * @return
	 * @throws Exception
	 */
	public String toLogoutPage() throws Exception{
		if(ValidateHelper.isNotEmptyString(sfzh)){
			RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(sfzh);
			rkBean.setJbxxBean(jbxxBean);
		} 
		else if(ValidateHelper.isNotEmptyString(bhs)){
			rkBean = rkService.queryRkxxBeanByRkid(rylb, bhs, queryBean.getRybh(), "2", operType);
			if (CommonFinalParams.RYLB_JWRK.equals(rylb)){
				JwrkxxBean jwrkBean = rkService.queryJwrkJbxxByRybh(queryBean.getRybh());
				rkBean.setJwrkBean(jwrkBean);
			}
		}
		
		if(CommonFinalParams.RYLB_CZRK.equals(rylb)){
			modename = "常住人口";
			rkBean.getCzrkBean().setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		else if(CommonFinalParams.RYLB_LDRK.equals(rylb)){
			modename = "流动人口";
			rkBean.getLdrkBean().setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
		}
		else if(CommonFinalParams.RYLB_JWRK.equals(rylb)){
			modename = "境外人口";
			rkBean.getJwrkBean().setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		else if(CommonFinalParams.RYLB_JZRK.equals(rylb)){
			modename = "寄住人口";
			rkBean.getJzrkBean().setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		else if(CommonFinalParams.RYLB_WLHRK.equals(rylb)){
			modename = "未落户人口";
			rkBean.getWlhrkBean().setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		return "toLogoutPage"; 
	}
	
	/**
	 * 跳转到批量注销页面
	 * @return
	 */
	public String toBatchLogoutRkInfoPage(){
		
		if(CommonFinalParams.RYLB_LDRK.equals(rylb)){
			modename = "流动人口";
			rkBean.getLdrkBean().setZxsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		return "toBatchLogoutRkInfoPage";
	}
	
	/**
	 * 批量注销处理 (流口)
	 * @return
	 */
	public void batchLogoutRkInfo(){
		try {
			List<LdrkxxBean> ldrkList = new ArrayList<LdrkxxBean>();
			String []bh = rkBean.getLdrkBean().getZzbh().split(",");
			for (String strBh : bh) 
			{
				LdrkxxBean ldrkBean = new LdrkxxBean();
				ldrkBean.setZzbh(strBh);
				ldrkBean.setZxyy(rkBean.getLdrkBean().getZxyy());
				ldrkBean.setZxsj(rkBean.getLdrkBean().getZxsj());
				ldrkList.add(ldrkBean);
			}
			rkService.batchLogoutLdrkInfo(ldrkList);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
		responseWrite(true);
	}
	
	/**   计划生育管理  
	 * @throws Exception */
	public String toRkJhsyPage() throws Exception{
		if(ValidateHelper.isEmptyString(jhsyBean.getId())){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			jhsyBean.setDjrjh(loginInfo.getUsername());
			jhsyBean.setDjrxm(loginInfo.getRealname());
			jhsyBean.setDjdwdm(loginInfo.getOrgcode());
			jhsyBean.setDjdwmc(loginInfo.getOrgname());
			jhsyBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			jhsyBean.setJlbh("JHSY"+sfzh);
		}else{
			jhsyBean =  rkService.queryJhsyBeanByjlbh(jhsyBean.getId());
		}
		return "toRkJhsyPage";
	}
	
	/**  保存计划生育信息**/
	public void savaJhsyBean(){
		try {
			if(ValidateHelper.isEmptyString(jhsyBean.getId())){
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				jhsyBean.setDjrjh(loginInfo.getUsername());
				jhsyBean.setDjrxm(loginInfo.getRealname());
				jhsyBean.setDjdwdm(loginInfo.getOrgcode());
				jhsyBean.setDjdwmc(loginInfo.getOrgname());
				jhsyBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				rkService.insertRkJhsyBean(jhsyBean);
			}else{
				rkService.updateRkJhsyBean(jhsyBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
			responseWrite(false);
		}
		responseWrite(true);
	}
	
	/**
	 * 调整到计划生育list界面
	 */
	public String toJhsyListPage(){
		initQueryBean();
		return "toJhsyListPage";
	}
	
	/**
	 * 查询计划生育列表
	 * @throws Exception
	 */
	public void queryJhsyListInfoPage() throws Exception{
		PageResultInfo<RkJhsyBean> list = rkService.queryJhsyBeanPage(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 删除计划生育信息
	 */
	public void deleteJhsyBean(){
		try {
			rkService.deleteRkJhsyBean(jhsyBean.getId());
			responseWrite(true);
		} catch (Exception e) {
			e.printStackTrace();
			responseWrite(false);
		}
		
	}
	
	//删除关系人
	public void delGxr(){
		rkService.delGxr(rkBean.getGxrBean().getId());
		
	}
	
	//删除联系方式
	public void delLxfs(){
		rkService.delLxfs(lxfsId);
	}
	
	/**
	 * 房主详情时用到
	 * 本地没sfzh  远程调用然后返回sfzh
	 * @throws Exception
	 */
	public void queryRyJbxxInfoBysfzh() throws Exception{
		RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(sfzh);
		if(jbxxBean == null){
			CzrkxxBean czrkBean = orgUserbusiness.queryRyxxBean(sfzh);
			if(ValidateHelper.isEmptyString(czrkBean.getRylb())){
				jbxxBean = new RkJbxxBean();
				jbxxBean.setRylb("1"); 
				jbxxBean.setRybh(czrkBean.getRybh());
				jbxxBean.setSfzh(czrkBean.getSfzh());
				jbxxBean.setXm(czrkBean.getSfzh());
				jbxxBean.setXb(czrkBean.getXb());
				jbxxBean.setXzzxz(czrkBean.getXzzxz());
				jbxxBean.setFwcs(czrkBean.getFwcs());
				jbxxBean.setCsrq(czrkBean.getCsrq());
				jbxxBean.setZydm(czrkBean.getZydm());
				jbxxBean.setWhcd(czrkBean.getWhcd());
				jbxxBean.setHjdxz(czrkBean.getHjdxz());
				jbxxBean.setMz(czrkBean.getMz());
				
			}
		}
		responseWrite(jbxxBean);
	}
	
	public String openRkInfoBysfzh(){
		return "toRydaRkInfoPage";
	}
	
	public String toLdrkListExcelPage()
	{
		
		if (ValidateHelper.isNotEmptyString(ldrkids))
		{
			ldrkBeans = rkService.queryLdrkBeanListByLdrkids(ldrkids);
		}
		else
		{
			setCsrqAndAge();
			setHjdqh();
			ldrkBeans = rkService.queryLdrkAllListByRkQueryBean(queryBean);
		}
		return "toLdrkListExcelPage";
	}
	
	public String toLdrkListWordPage()
	{
	
		try
		{
			String[] selectedrybharr = selectedrybhs.split(",");
			for (String rybh : selectedrybharr)
			{
				RkxxBean rkb = rkService.queryRkxxBeanByRybh(rkBean.getRylb(), rybh, "1", CommonConstant.OPERTYPE_UPDATE);
				Map<String, String> map = converRkxxBeanToMap(rkb);
				Configuration configuration = new Configuration();
				configuration.setDefaultEncoding("utf-8");
				configuration.setClassForTemplateLoading(this.getClass(), "/");
				Template template = configuration.getTemplate("ldrkzzxxb.ftl");
				File outFile = new File(ActionContextHelper.getServletContext().getRealPath("/temp/images/ldrkxx.doc"));
		        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));
		        template.process(map, out);
		        out.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			
		}
		return "toLdrkExportWordPage";
	}
	
	private Map<String, String> converRkxxBeanToMap(RkxxBean rkb)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("xm", rkb.getJbxxBean().getXm()!=null?rkb.getJbxxBean().getXm():"");
		map.put("xbms", rkb.getJbxxBean().getXbms()!=null?rkb.getJbxxBean().getXbms() : "");
		map.put("mzms", rkb.getJbxxBean().getMzms()!=null?rkb.getJbxxBean().getMzms():"");
		map.put("cym", rkb.getJbxxBean().getBmch()!=null?rkb.getJbxxBean().getBmch() : "");
		map.put("csrq", rkb.getJbxxBean().getCsrq()!=null?rkb.getJbxxBean().getCsrq():"");
		map.put("sfzh", rkb.getJbxxBean().getSfzh()!=null?rkb.getJbxxBean().getSfzh():"");
		map.put("hyzkms", rkb.getJbxxBean().getHyzkms()!=null?rkb.getJbxxBean().getHyzkms():"");
		map.put("hjdxz", rkb.getJbxxBean().getHjdxz()!=null?rkb.getJbxxBean().getHjdxz():"");
		map.put("jg", rkb.getJbxxBean().getHjdqhmc()!=null?rkb.getJbxxBean().getHjdqhmc():"");
		map.put("hjdqhmc", rkb.getJbxxBean().getHjdqhmc()!=null?rkb.getJbxxBean().getHjdqhmc():"");
		map.put("csd", rkb.getJbxxBean().getHjdxz()!=null?rkb.getJbxxBean().getHjdxz():"");
		map.put("whcsms", rkb.getJbxxBean().getWhcdms()!=null?rkb.getJbxxBean().getWhcdms():"");
		map.put("zjxyms", rkb.getJbxxBean().getZzxyms()!=null?rkb.getJbxxBean().getZzxyms():"");
		map.put("jzsyms", rkb.getLdrkBean().getZzsyms()!=null?rkb.getLdrkBean().getZzsyms():"");
		map.put("lbdrq", rkb.getLdrkBean().getLbdrq()!=null?rkb.getLdrkBean().getLbdrq():"");
		map.put("jzcslbms", rkb.getLdrkBean().getZzcsms()!=null?rkb.getLdrkBean().getZzcsms():"");
		map.put("lxdh", rkb.getJbxxBean().getLxdh()!=null?rkb.getJbxxBean().getLxdh():"");
		map.put("dhbz", rkb.getJbxxBean().getLxdhbz()!=null?rkb.getJbxxBean().getLxdhbz():"");
		map.put("xzdxz", rkb.getJbxxBean().getXzzxz()!=null?rkb.getJbxxBean().getXzzxz():"");
		map.put("jzzbh", rkb.getLdrkBean().getZzzbh()!=null?rkb.getLdrkBean().getZzzbh():"");
		map.put("fzrq", rkb.getLdrkBean().getZzzqfrq()!=null?rkb.getLdrkBean().getZzzqfrq():"");
		map.put("yxqx", rkb.getLdrkBean().getNjzqxms()!=null?rkb.getLdrkBean().getNjzqxms():"");
		map.put("fwcs", rkb.getJbxxBean().getFwcs()!=null?rkb.getJbxxBean().getFwcs():"");
		map.put("zxrq", rkb.getLdrkBean().getZxsj()!=null?rkb.getLdrkBean().getZxsj():"");
		map.put("zxyy", rkb.getLdrkBean().getZxyy()!=null?rkb.getLdrkBean().getZxyy():"");
		map.put("qwhc", "");
		map.put("hdsj", "");
		map.put("bdsj", "");
		map.put("zylbms", rkb.getJbxxBean().getZyms()!=null?rkb.getJbxxBean().getZyms():"");
		map.put("fzxm", rkb.getLdrkBean().getFzxm()!=null? rkb.getLdrkBean().getFzxm():"");
		map.put("fzsfzh", rkb.getLdrkBean().getFzsfzh()!=null?rkb.getLdrkBean().getFzsfzh():"");
		map.put("fwlb", rkb.getFwxxBean().getFwlbms()!=null?rkb.getFwxxBean().getFwlbms():"");
		map.put("gzdwhzz", rkb.getJbxxBean().getXzzxz()!=null?rkb.getJbxxBean().getXzzxz():"");
		map.put("bz", rkb.getLdrkBean().getBz()!=null?rkb.getLdrkBean().getBz():"");
		//查询照片信息
		OrgUserbusiness business = new OrgUserbusiness();
		Blob blob = business.getRkzpBlob(rkb.getJbxxBean().getSfzh());
		if (blob != null)
		{
			RemoteRequestService remoteService = new RemoteRequestService();
			String xpStr = remoteService.queryXpBySfzh(rkb.getJbxxBean().getSfzh());
			map.put("image", xpStr);
		}
		else
		{
			try
			{
				byte[] data = blob.getBytes(0L, (int) blob.length());
	            BASE64Encoder encoder = new BASE64Encoder();
	            String xpStr = encoder.encode(data);
	            map.put("image", xpStr);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return map;
	}
	
	public String toExportExcelSyrkInfoPage()
	{
		try
		{
			//常口
			if ("1".equals(queryBean.getRylb()))
			{
				if (ValidateHelper.isNotEmptyString(rkids))
				{
					czrkBeans = rkService.queryCzrkBeansByczrkbhs(rkids);
				}
				else
				{
					czrkBeans = rkService.queryCzrkBeansByQueryBean(queryBean);
				}
				return "toCzrkExportExcelPage";
			}
			//寄口
			else if ("5".equals(queryBean.getRylb()))
			{
				if (ValidateHelper.isNotEmptyString(rkids))
				{
					jzrkBeans = rkService.queryJzrkBeansByczrkbhs(rkids);
				}
				else
				{
					jzrkBeans = rkService.queryJzrkBeansByQueryBean(queryBean);
				}
				return "toJzrkExportExcelPage";
			}
			
			//全部
			else if("select".equals(queryBean.getRylb()))
			{
				if(ValidateHelper.isNotEmptyString(rkids)){
					jbxxBeans = rkService.querySyrkBeanByrkids(rkids);
				}else{
					jbxxBeans = rkService.querySyrkBeansByQueryBean(queryBean);
				}
				return "toSyrkExportExcelPage";
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public String toExportPrintSyrkInfoPage()
	{
		try
		{
			if ("1".equals(queryBean.getRylb()))
			{
				rkBean = rkService.queryRkxxBeanByRkid(queryBean.getRylb(), rkids, selectedrybhs, "1", "detail");
				converRkBeanToCzrkMap(rkBean);
				return "toCzrkPrintPage";
			}
			else if ("5".equals(queryBean.getRylb()))
			{
				rkBean = rkService.queryRkxxBeanByRkid(queryBean.getRylb(), rkids, selectedrybhs, "5", "detail");
				return "toJzrkPrintPage";
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public void converRkBeanToCzrkMap(RkxxBean rkBean)
	{
		try
		{
			map = new HashMap<String, String>();
			map.put("hklbms", rkBean.getCzrkBean().getHklbmc());
			map.put("xm", rkBean.getJbxxBean().getXm());
			map.put("xbms", rkBean.getJbxxBean().getXbms());
			map.put("hzgxms", rkBean.getCzrkBean().getYhzgxmc());
			map.put("cym", rkBean.getJbxxBean().getBmch());
			map.put("mzms", rkBean.getJbxxBean().getMzms());
			map.put("csrq", DateTimeHelper.conver(DateTimeHelper.convertToDate(rkBean.getJbxxBean().getCsrq(), "yyyy-MM-dd"), "yyyy年MM月dd日"));
			map.put("jhr1", rkBean.getCzrkBean().getJhryxm());
			map.put("jhr1gx", rkBean.getCzrkBean().getYhzgxmc());
			map.put("jhr2", rkBean.getCzrkBean().getJhrexm());
			map.put("jhr2gx", rkBean.getCzrkBean().getYjhregx());
			map.put("csd", rkBean.getJbxxBean().getHjdqhmc());
			map.put("cszfzrq", "");
			map.put("xzzxz", rkBean.getJbxxBean().getXzzxz());
			map.put("xzzxz", rkBean.getJbxxBean().getXzzxz());
			map.put("qtzzxz", rkBean.getCzrkBean().getQtzzxz());
			map.put("jgms", rkBean.getJbxxBean().getHjdqhmc());
			map.put("zzxyms", rkBean.getJbxxBean().getZzxyms());
			map.put("sfzh", rkBean.getJbxxBean().getSfzh());
			map.put("sfzqfrq", "");
			map.put("whcsms", rkBean.getJbxxBean().getWhcdms());
			map.put("hyzkms", rkBean.getJbxxBean().getHyzkms());
			map.put("sg", rkBean.getJbxxBean().getSg() + "cm");
			map.put("xxms", rkBean.getJbxxBean().getXxms());
			map.put("byzkms", rkBean.getJbxxBean().getByzkms());
			map.put("zyms", rkBean.getJbxxBean().getZyms());
			map.put("fwcs", rkBean.getJbxxBean().getFwcs());
			String qrms = rkBean.getCzrkBean().getQrsj() != null ? rkBean.getCzrkBean().getQrsj() : "" +
						  "因[" + rkBean.getCzrkBean().getQryy()!=null?rkBean.getCzrkBean().getQryy() : "" + 
						  "]从[" + rkBean.getCzrkBean().getHdqrxz()!=null?rkBean.getCzrkBean().getHdqrxz():"" + 
						  "]迁入";
			map.put("qrms", qrms);
			
			String qcms =  rkBean.getCzrkBean().getBdsj()!= null ? rkBean.getCzrkBean().getBdsj() : "" + 
						  "因[" + rkBean.getCzrkBean().getBdyy()!= null?rkBean.getCzrkBean().getBdyy():""+
						  "迁往[" + rkBean.getCzrkBean().getBdxz() +"]";
			
		    map.put("qcms", qcms);
			
			String zxms = rkBean.getCzrkBean().getZxsj() != null ? rkBean.getCzrkBean().getZxsj():"";
			map.put("zxms", zxms);
			
			if ("1".equals(rkBean.getCzrkBean().getHklb()) || "2".equals(rkBean.getCzrkBean().getHklb()))
			{
				RkJbxxBean hzjbxxBean = rkService.queryHzRkJbxxByHH(rkBean.getCzrkBean().getHh());
				map.put("hzxm", hzjbxxBean.getXm());
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 根据人员编号 查询历史居住信息
	 * @throws Exception
	 */
	public void queryRkFwglInfoPageByRybh() throws Exception{
		if(ValidateHelper.isEmptyString(rybh)){
			rybh = CommonSequenceHelper.getRybhBySfzh(queryBean.getSfzh());
		}
		PageResultInfo<RkfwglBean> list  = rkService.queryRkfwglByRybh(rybh, getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 根据rkid rylb 查询各表的居住信息
	 * @throws Exception 
	 */
	public void queryLsJzxxPageByRkidAndRylb() throws Exception{
		if(CommonFinalParams.RYLB_CZRK.equals(rylb)){
			CzrkxxBean czrkBean = rkService.queryCzrkFwglInfoByCzrkbh(bhs);
			responseWrite(czrkBean);
		}
		else if(CommonFinalParams.RYLB_JWRK.equals(rylb)){
			JwrkxxBean jwrkBean = rkService.queryJwrkFwglInfoByJwbh(bhs);
			responseWrite(jwrkBean);
		}
		else if(CommonFinalParams.RYLB_JZRK.equals(rylb)){
			JzrkxxBean jzrkBean = rkService.queryJzrkFwglInfoByJzbh(bhs);
			responseWrite(jzrkBean);
		}
		else if(CommonFinalParams.RYLB_LDRK.equals(rylb)){
			LdrkxxBean ldrkBean = rkService.queryLdrkFwglBeanByZzbh(bhs);
			responseWrite(ldrkBean);
		}
		else if(CommonFinalParams.RYLB_WLHRK.equals(rylb)){
			RkwlczhkBean wlhBean = rkService.queryWlhrkFwglInfoByWlhbh(bhs);
			responseWrite(wlhBean);
		}
	}
	
	/**
	 * 跳转到查询居住历史界面
	 * 
	 */
	public String toSrykLsjzPage(){
		return "toSrykLsjzPage";
	}
	
	public void queryRkFwglInfoPageBySfzh() throws Exception
	{
		PageResultInfo<RkfwglBean> list  = rkService.queryRkfwglBySfzh(queryBean.getSfzh(), getPageInfo());
		responseWrite(list);
	}
	
	public String toRyInfoUpdatePage()
	{
		try
		{
			RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanByRybh(queryBean.getRybh());
			if (jbxxBean != null)
			{
				rkBean.setJbxxBean(jbxxBean);
				queryBean.setSfzh(jbxxBean.getSfzh());
			}
			if (ValidateHelper.isNotEmptyString(queryBean.getRkfwglid()))
			{
				String fwid = rkService.queryFwidByRkfwglid(queryBean.getRkfwglid());
				queryBean.setFwid(fwid);
			}
			//查询是否工作对象
			ZdryGzdxBean zdrybean = zdryService.getExistSfzhInZdryGzdx(queryBean.getSfzh());
			if (zdrybean != null)
			{
				rkBean.setZdryGzdxBean(zdrybean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "ryinfo_" + queryBean.getRylb();
	}
	
	public String toRyInfoPage()
	{
		try
		{
			//境外人口生成虚拟生分证号
			if(CommonFinalParams.RYLB_JWRK.equals(queryBean.getRylb()))
			{
				queryBean.setSfzh("XNSFHM" + CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "seq_xnsfzh", "left", 12, "0"));
			}
			if (ValidateHelper.isEmptyString(queryBean.getRylb()))
			{
				rylb = CommonSequenceHelper.getRylb(queryBean.getSfzh(), queryBean.getFwid());
				queryBean.setRylb(rylb);
				//查询是否工作对象
				ZdryGzdxBean zdrybean = zdryService.getExistSfzhInZdryGzdx(queryBean.getSfzh());
				if (zdrybean != null)
				{
					rkBean.setZdryGzdxBean(zdrybean);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "ryinfo_" + queryBean.getRylb();
	}
	
	private void queryLoadCzrkInfo() throws Exception
	{
		//查询人口基本信息 先查本地再查远程
		RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
		//RkJbxxBean jbxxBean = null;
		if (jbxxBean == null)
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzh(queryBean.getSfzh());
			if (czrkInfo != null)
			{
				rkBean.setJbxxBean(czrkInfo);
				rkBean.setCzrkBean(czrkInfo);
			}
			else
			{
				rkBean.getJbxxBean().setSfzh(queryBean.getSfzh());
			}
		}
		else
		{
			//st 远程 库
			CzrkxxBean stczrkInfo = rkService.queryCzrkInfoStBeanBySfzh(queryBean.getSfzh());
			//转化可变属性
			rkService.converCzrkInfoToRkJbxx(stczrkInfo, jbxxBean);
			rkBean.setJbxxBean(jbxxBean);
			//本地库
			CzrkxxBean bdczrkInfo = rkService.queryCzrkxxBeanByFwidAndSfzh(queryBean.getSfzh(), queryBean.getFwid());
			if (bdczrkInfo != null && stczrkInfo != null)
			{
				stczrkInfo.setCzrkbh(bdczrkInfo.getCzrkbh());
				stczrkInfo.setXzzqh(bdczrkInfo.getXzzqh());
				stczrkInfo.setZzxz(bdczrkInfo.getZzxz());
				
				stczrkInfo.setQtzzssxq(bdczrkInfo.getQtzzssxq());
				stczrkInfo.setQtzzxz(bdczrkInfo.getQtzzxz());
				stczrkInfo.setBz(bdczrkInfo.getBz());
			}
			rkBean.setCzrkBean(stczrkInfo);
		}
	}
	
	private void queryLoadLdrkInfo() throws Exception
	{
		//查询人口基本信息 先查本地再查远程
		RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
		if (jbxxBean == null)
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzh(queryBean.getSfzh());
			if (czrkInfo != null)
			{
				rkBean.setJbxxBean(czrkInfo);
			}
			else
			{
				rkBean.getJbxxBean().setSfzh(queryBean.getSfzh());
			}
		}
		else
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzh(queryBean.getSfzh());
			//转化可变属性
			rkService.converCzrkInfoToRkJbxx(czrkInfo, jbxxBean);
			rkBean.setJbxxBean(jbxxBean);
		}
		
		if (ValidateHelper.isNotEmptyString(queryBean.getRkid()))
		{
			LdrkxxBean ldrkBean = rkService.queryLdrkBeanByZzbh(queryBean.getRkid());
			if (ldrkBean != null)
			{
				rkBean.setLdrkBean(ldrkBean);
			}
		}
		else
		{
			LdrkxxBean ldrkBean = rkService.queryLdrkxxBeanBySfzhAndFwid(queryBean.getSfzh(), queryBean.getFwid());
			if (ldrkBean != null)
			{
				rkBean.setLdrkBean(ldrkBean);
			}
		}
		if (ValidateHelper.isNotEmptyString(rkBean.getJbxxBean().getSfzh()))
		{
			RkJhsyBean rkJhsyBean = rkService.queryJhsyBeanByRybh(rkBean.getJbxxBean().getRybh());
			if (rkJhsyBean != null)
			{
				rkBean.setJhsyBean(rkJhsyBean);
			}
			else
			{
				rkBean.getJhsyBean().setJlbh("JHSY" + rkBean.getJbxxBean().getSfzh());
			}
		}
	}
	
	public void queryLoadJzrkInfo() throws Exception
	{
		//查询人口基本信息 先查本地再查远程
		RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
		if (jbxxBean == null)
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzh(queryBean.getSfzh());
			if (czrkInfo != null)
			{
				rkBean.setJbxxBean(czrkInfo);
			}
			else
			{
				rkBean.getJbxxBean().setSfzh(queryBean.getSfzh());
			}
		}
		else
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzh(queryBean.getSfzh());
			//转化可变属性
			rkService.converCzrkInfoToRkJbxx(czrkInfo, jbxxBean);
			rkBean.setJbxxBean(jbxxBean);
		}
		JzrkxxBean jzrkBean = rkService.queryJzrkxxBeanBySfzhAndFwid(queryBean.getSfzh(), queryBean.getFwid());
		if (jzrkBean != null)
		{
			rkBean.setJzrkBean(jzrkBean);
		}
	}
	
	public void queryLoadWlhrkInfo() throws Exception
	{
		//查询人口基本信息 先查本地再查远程
		RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
		if (jbxxBean == null)
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzh(queryBean.getSfzh());
			if (czrkInfo != null)
			{
				rkBean.setJbxxBean(czrkInfo);
			}
			else
			{
				rkBean.getJbxxBean().setSfzh(queryBean.getSfzh());
			}
		}
		else
		{
			rkBean.setJbxxBean(jbxxBean);
		}
		RkwlczhkBean wlhrkBean = rkService.queryWlhrkxxBeanBySfzhAndFwid(queryBean.getSfzh(), queryBean.getFwid());
		if (wlhrkBean != null)
		{
			rkBean.setWlhrkBean(wlhrkBean);
		}
		
	}
	
	public void queryLoadJwrkInfo() throws Exception
	{
		 
		RkJbxxBean jbxxBean = rkService.queryJwrkJbxxByRybh(rybh);
		if (jbxxBean == null)
		{
			CzrkxxBean czrkInfo = rkService.queryCzrkInfoStBeanBySfzh(queryBean.getSfzh());
			if (czrkInfo != null)
			{
				rkBean.setJbxxBean(czrkInfo);
			}
		}
		else
		{
			rkBean.setJbxxBean(jbxxBean);
		}
		RkwlczhkBean wlhrkBean = rkService.queryWlhrkxxBeanBySfzhAndFwid(queryBean.getSfzh(), queryBean.getFwid());
		if (wlhrkBean != null)
		{
			rkBean.setWlhrkBean(wlhrkBean);
		}
	}
	
	public String toRkJbxxInfo()
	{
		try
		{
			FwJbxxBean fwJbxxBean = fwService.queryFwJbxxBeanByFwid(queryBean.getFwid());
			rkBean.setFwxxBean(fwJbxxBean);
			if (CommonFinalParams.RYLB_CZRK.equals(queryBean.getRylb()))
			{
				queryLoadCzrkInfo();
			}
			else if (CommonFinalParams.RYLB_LDRK.equals(queryBean.getRylb()))
			{
				queryLoadLdrkInfo();
			}
			else if (CommonFinalParams.RYLB_JZRK.equals(queryBean.getRylb()))
			{
				queryLoadJzrkInfo();
			}
			else if (CommonFinalParams.RYLB_WLHRK.equals(queryBean.getRylb()))
			{
				queryLoadWlhrkInfo();
			}
			else if (CommonFinalParams.RYLB_JWRK.equals(queryBean.getRylb()))
			{
				queryLoadJwrkInfo();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "toRkJbxxInfo_" + queryBean.getRylb();
	}
	
	public String toRkLsjzListPage()
	{
		try
		{
			RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
			if (jbxxBean != null)
			{
				rkBean.setRylb(queryBean.getRylb());
				if (ValidateHelper.isNotEmptyString(jbxxBean.getRybh()))
				{
					rkService.queryRklsjlBeans(rkBean, jbxxBean.getRybh());
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsppage;
	}
	
	public String toRkzpxxPage()
	{
		try
		{
			RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
			if (jbxxBean != null)
			{
				rkBean.setJbxxBean(jbxxBean);
				List<RkzpxxBean> zpxxBeans = rkService.queryRkzpxxBeansByRybh(jbxxBean.getRybh());
				if (ValidateHelper.isNotEmptyCollection(zpxxBeans))
				{
					rkBean.setZpxxBeans(zpxxBeans);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsppage;
	}
	
	public String toShgxxxPage()
	{
		try
		{
			RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
			if (jbxxBean != null)
			{
				rkBean.setJbxxBean(jbxxBean);
				List<RkgxrxxBean> gxrBeans = rkService.queryRkgxrBeansByRybh(jbxxBean.getRybh());
				if (ValidateHelper.isNotEmptyCollection(gxrBeans))
				{
					rkBean.setGxrBeans(gxrBeans);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsppage;
	}
	
	public void queryShgxxxPageResult()
	{
		PageResultInfo<RkgxrxxBean> pageResult =new PageResultInfo<RkgxrxxBean>();
		try
		{
			List<RkgxrxxBean> gxrBeans = rkService.queryRkgxrBeansByRybh(rkBean.getJbxxBean().getRybh());
			pageResult.setDatas(gxrBeans);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		responseWrite(pageResult);
	}
	
	public void queryGlgxrPageResult()
	{
		PageResultInfo<RkgxrxxBean>  pageResult = rkService.queryGlgxrPageResultBySfzh(sfzh, getPageInfo());
		responseWrite(pageResult);
	}
	
	public String toTmtzxxPage()
	{
		try
		{
			RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
			if (jbxxBean != null)
			{
				rkBean.setJbxxBean(jbxxBean);
				RktmtzxxBean tmtzBean = rkService.queryRktmtzBeanByRybh(jbxxBean.getRybh());
				if (tmtzBean != null)
				{
					rkBean.setTmtzBean(tmtzBean);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsppage;
	}
	
	public String toLxfsxxPage()
	{
		try
		{
			RkJbxxBean jbxxBean = rkService.queryRkJbxxBeanBySfzh(queryBean.getSfzh());
			if (jbxxBean != null)
			{
				rkBean.setJbxxBean(jbxxBean);
				List<RklxfsxxBean> lxfsBeans = rkService.queryRklxfsBeansByRybh(jbxxBean.getRybh());
				if (ValidateHelper.isNotEmptyCollection(lxfsBeans))
				{
					rkBean.setLxfsBean(lxfsBeans);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsppage;
	}
	
	public void saveGxrShxx()
	{
		try
		{
			rkService.saveGxrShxx(rkBean);
			responseWrite(rkBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void saveTmtzxxBean()
	{
		try
		{
			rkService.saveTmtzxx(rkBean);
			responseWrite(rkBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	
	
	public void saveLxfsxxBean()
	{
		try
		{
			rkService.saveLxfsxx(rkBean);
			responseWrite(rkBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void saveCzrkInfo()
	{
		try
		{
			rkBean.setRylb(CommonFinalParams.RYLB_CZRK);
			rkService.saveRkJbxxBean(rkBean);
			rkService.saveCzrkxxInfo(rkBean);
			
			//如果是从业人员核实，则系统自动反馈从业人员信息
			if (ValidateHelper.isNotEmptyString(queryBean.getCyrybh()))
			{
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				DwcyryBean cyryBean = new DwcyryBean();
				cyryBean.setCyrybh(queryBean.getCyrybh());
				cyryBean.setRybh(rkBean.getJbxxBean().getRybh());
				cyryBean.setRkfwglid(rkBean.getCzrkBean().getRkfwglid());
				cyryBean.setFkrxm(loginInfo.getRealname());
				cyryBean.setFkrjh(loginInfo.getUsername());
				cyryBean.setFkdwdm(loginInfo.getOrgcode());
				cyryBean.setFkdwmc(loginInfo.getOrgname());
				cyryBean.setFknr("完成登记实有人口时，系统自动反馈");
				cyryService.updateCyryDjFkxx(cyryBean);
			}
			
			responseWrite(rkBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void saveJwrkInfo()
	{
		try
		{
			rkBean.setRylb(CommonFinalParams.RYLB_JWRK);
			rkService.saveRkJbxxBean(rkBean);
			rkService.saveJwrkxxBean(rkBean);
			responseWrite(rkBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void saveWlhrkxxBean()
	{
		try
		{
			rkBean.setRylb(CommonFinalParams.RYLB_WLHRK);
			rkService.saveRkJbxxBean(rkBean);
			rkService.saveWlhrkxx(rkBean);
			
			//如果是从业人员核实，则系统自动反馈从业人员信息
			if (ValidateHelper.isNotEmptyString(queryBean.getCyrybh()))
			{
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				DwcyryBean cyryBean = new DwcyryBean();
				cyryBean.setCyrybh(queryBean.getCyrybh());
				cyryBean.setRybh(rkBean.getJbxxBean().getRybh());
				cyryBean.setRkfwglid(rkBean.getCzrkBean().getRkfwglid());
				cyryBean.setFkrxm(loginInfo.getRealname());
				cyryBean.setFkrjh(loginInfo.getUsername());
				cyryBean.setFkdwdm(loginInfo.getOrgcode());
				cyryBean.setFkdwmc(loginInfo.getOrgname());
				cyryBean.setFknr("完成登记实有人口时，系统自动反馈");
				cyryService.updateCyryDjFkxx(cyryBean);
			}
			
			responseWrite(rkBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	public void saveLdrkInfo()
	{
		try
		{
			rkBean.setRylb(CommonFinalParams.RYLB_LDRK);
			rkService.saveRkJbxxBean(rkBean);
			rkService.saveLdrkxx(rkBean);
			//保存计划生育信息
			if(ValidateHelper.isEmptyString(rkBean.getJhsyBean().getId()))
			{
				rkService.insertRkJhsyBean(rkBean.getJhsyBean());
			}
			else
			{
				rkService.updateRkJhsyBean(rkBean.getJhsyBean());
			}
			
			//如果是从业人员核实，则系统自动反馈从业人员信息
			if (ValidateHelper.isNotEmptyString(queryBean.getCyrybh()))
			{
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				DwcyryBean cyryBean = new DwcyryBean();
				cyryBean.setCyrybh(queryBean.getCyrybh());
				cyryBean.setRybh(rkBean.getJbxxBean().getRybh());
				cyryBean.setRkfwglid(rkBean.getCzrkBean().getRkfwglid());
				cyryBean.setFkrxm(loginInfo.getRealname());
				cyryBean.setFkrjh(loginInfo.getUsername());
				cyryBean.setFkdwdm(loginInfo.getOrgcode());
				cyryBean.setFkdwmc(loginInfo.getOrgname());
				cyryBean.setFknr("完成登记实有人口时，系统自动反馈");
				cyryService.updateCyryDjFkxx(cyryBean);
			}
			responseWrite(rkBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 保存寄住人口
	 * 
	 * @date Aug 23, 2014 5:19:12 PM
	 */
	public void saveJzrkInfo()
	{
		try
		{
			rkBean.setRylb(CommonFinalParams.RYLB_JZRK);
			rkService.saveRkJbxxBean(rkBean);
			rkService.saveJzrkxx(rkBean);
			
			//如果是从业人员核实，则系统自动反馈从业人员信息
			if (ValidateHelper.isNotEmptyString(queryBean.getCyrybh()))
			{
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				DwcyryBean cyryBean = new DwcyryBean();
				cyryBean.setCyrybh(queryBean.getCyrybh());
				cyryBean.setRybh(rkBean.getJbxxBean().getRybh());
				cyryBean.setRkfwglid(rkBean.getCzrkBean().getRkfwglid());
				cyryBean.setFkrxm(loginInfo.getRealname());
				cyryBean.setFkrjh(loginInfo.getUsername());
				cyryBean.setFkdwdm(loginInfo.getOrgcode());
				cyryBean.setFkdwmc(loginInfo.getOrgname());
				cyryBean.setFknr("完成登记实有人口时，系统自动反馈");
				cyryService.updateCyryDjFkxx(cyryBean);
			}
			
			responseWrite(rkBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	/**
	 * 通过人员编号查询人员基本信息，导入到word 打印
	 */
	public String queryRkjbxxByRybhs(){
		try {
			rkjbxxList = rkService.queryRkjbxxByRybhs(rybhs);
		} catch (Exception e) {
			rkjbxxList = null ;
			e.printStackTrace();
		}
		return "torkjbxxWordPage";
	}
	
	/**  getter  setter */
	public LsglRkService getRkService()
	{
		return rkService;
	}

	public void setRkService(LsglRkService rkService)
	{
		this.rkService = rkService;
	}
	

	public RkQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(RkQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public RkxxBean getRkBean()
	{
		return rkBean;
	}

	public void setRkBean(RkxxBean rkBean)
	{
		this.rkBean = rkBean;
	}

	public File[] getZpUploads()
	{
		return zpUploads;
	}

	public void setZpUploads(File[] zpUploads)
	{
		this.zpUploads = zpUploads;
	}

	public String[] getZpUploadsFileName()
	{
		return zpUploadsFileName;
	}

	public void setZpUploadsFileName(String[] zpUploadsFileName)
	{
		this.zpUploadsFileName = zpUploadsFileName;
	}

	public String getJsppage()
	{
		return jsppage;
	}

	public void setJsppage(String jsppage)
	{
		this.jsppage = jsppage;
	}

	public String getMsgtype()
	{
		return msgtype;
	}

	public void setMsgtype(String msgtype)
	{
		this.msgtype = msgtype;
	}

	public List<SystemDictionaryBean> getRylbList()
	{
		rylbList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_RYLB");
		return rylbList;
	}

	public void setRylbList(List<SystemDictionaryBean> rylbList)
	{
		this.rylbList = rylbList;
	}

	public String getZdryDxlb() {
		return zdryDxlb;
	}

	public void setZdryDxlb(String zdryDxlb) {
		this.zdryDxlb = zdryDxlb;
	}

	public String getRylb() {
		return rylb;
	}

	public void setRylb(String rylb) {
		this.rylb = rylb;
	}

	public RkDzxxBean getRkdz() {
		return rkdz;
	}

	public void setRkdz(RkDzxxBean rkdz) {
		this.rkdz = rkdz;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getZzbh() {
		return zzbh;
	}

	public void setZzbh(String zzbh) {
		this.zzbh = zzbh;
	}

	public LsglFwService getFwService() {
		return fwService;
	}

	public void setFwService(LsglFwService fwService) {
		this.fwService = fwService;
	}

	public String getBhs() {
		return bhs;
	}

	public void setBhs(String bhs) {
		this.bhs = bhs;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public RkJhsyBean getJhsyBean() {
		return jhsyBean;
	}

	public void setJhsyBean(RkJhsyBean jhsyBean) {
		this.jhsyBean = jhsyBean;
	}
	public List<SystemDictionaryBean> getRytssxList() {
		rytssxList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_RYTSSX");
		return rytssxList;
	}

	public void setRytssxList(List<SystemDictionaryBean> rytssxList) {
		this.rytssxList = rytssxList;
	}

	public void setZdryBean(ZdryGzdxBean zdryBean) {
		this.zdryBean = zdryBean;
	}

	public ZdryGzdxBean getZdryBean() {
		return zdryBean;
	}

	public String getLxfsId() {
		return lxfsId;
	}

	public void setLxfsId(String lxfsId) {
		this.lxfsId = lxfsId;
	}

	public String getLdrkids()
	{
		return ldrkids;
	}

	public void setLdrkids(String ldrkids)
	{
		this.ldrkids = ldrkids;
	}

	public List<LdrkxxBean> getLdrkBeans()
	{
		return ldrkBeans;
	}

	public void setLdrkBeans(List<LdrkxxBean> ldrkBeans)
	{
		this.ldrkBeans = ldrkBeans;
	}

	public String getSelectedrybhs()
	{
		return selectedrybhs;
	}

	public void setSelectedrybhs(String selectedrybhs)
	{
		this.selectedrybhs = selectedrybhs;
	}
	
	public OrgUserbusiness getOrgUserbusiness() {
		return orgUserbusiness;
	}

	public void setOrgUserbusiness(OrgUserbusiness orgUserbusiness) {
		this.orgUserbusiness = orgUserbusiness;
	}

	public String getRkids()
	{
		return rkids;
	}

	public void setRkids(String rkids)
	{
		this.rkids = rkids;
	}

	public Map<String, String> getMap()
	{
		return map;
	}

	public void setMap(Map<String, String> map)
	{
		this.map = map;
	}

	public List<CzrkxxBean> getCzrkBeans()
	{
		return czrkBeans;
	}

	public void setCzrkBeans(List<CzrkxxBean> czrkBeans)
	{
		this.czrkBeans = czrkBeans;
	}

	public List<JzrkxxBean> getJzrkBeans()
	{
		return jzrkBeans;
	}

	public void setJzrkBeans(List<JzrkxxBean> jzrkBeans)
	{
		this.jzrkBeans = jzrkBeans;
	}
	
	public String getRybh() {
		return rybh;
	}

	public void setRybh(String rybh) {
		this.rybh = rybh;
	}

	public List<RkJbxxBean> getJbxxBeans() {
		return jbxxBeans;
	}

	public void setJbxxBeans(List<RkJbxxBean> jbxxBeans) {
		this.jbxxBeans = jbxxBeans;
	}

	public String getOpentip()
	{
		return opentip;
	}

	public void setOpentip(String opentip)
	{
		this.opentip = opentip;
	}

	public List<RkJbxxBean> getRkjbxxList() {
		return rkjbxxList;
	}

	public void setRkjbxxList(List<RkJbxxBean> rkjbxxList) {
		this.rkjbxxList = rkjbxxList;
	}

	public String getRybhs() {
		return rybhs;
	}

	public void setRybhs(String rybhs) {
		this.rybhs = rybhs;
	}
	
}
