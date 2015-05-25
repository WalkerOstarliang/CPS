package com.chinacreator.lsgl.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.dzgl.bean.StxxBean;
import com.chinacreator.dzgl.service.DzxxService;
import com.chinacreator.lsgl.bean.CzfwJbxxBean;
import com.chinacreator.lsgl.bean.CzwxcdjxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.FwdzQyBean;
import com.chinacreator.lsgl.bean.FwzpxxBean;
import com.chinacreator.lsgl.bean.queryBean.LsfwQueryBean;
import com.chinacreator.lsgl.query.FwQueryBean;
import com.chinacreator.lsgl.services.LsglFwService;
import com.chinacreator.lsgl.services.impl.LsglFwServiceImpl;
import com.chinacreator.zagl.bean.DwjbxxBean;

/**
 * 两室房屋基本信息管理action
 * 
 * @author mingchun.xiong
 * @date 2013-8-6
 */
public class LsglFwJbxxAction extends CPSBaseAction
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= 8711959897006215089L;
	private Map<String, String> jcnfMap = new LinkedHashMap<String,String>();
	private LsglFwService fwService;
	private DzxxService dzService;
	private FwJbxxBean fwBean;
	private String existfwjbxx;
	private FwQueryBean queryBean;
	private File[] zpUploads;
	private String[] zpUploadsFileName;
	private String stid;
	private StxxBean stxxBean;
	
	private String operType;
	private String dyh;
	private String rybh;
	private List<FwJbxxBean> fwBeans;
	private String fwids;
	
	private String closeParentWin = "true";
	
	private FwdzQyBean fwdzqyBean;
	public LsglFwJbxxAction()
	{
		super();
		stxxBean = new StxxBean();
		queryBean = new FwQueryBean();
		fwService = new LsglFwServiceImpl();
		dzService = new DzxxService();
		fwBean = new FwJbxxBean();
		fwdzqyBean = new FwdzQyBean();
	}
	
	/**
	 * 页面调整到房屋列表信息
	 * @return
	 * @date 2013-8-7 下午03:30:17
	 */
	public String toFwJbxxListPage()
	{	
		initQueryBean();
		queryBean.setDjsj_start(DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), -31, "yyyy-MM-dd"));
		queryBean.setDjsj_end(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toFwJbxxListPage";
	}
	
	//页面跳转到出租房屋列表
	public String toCzFwJbxxListPage(){
		initQueryBean();
		queryBean.setDjsj_start(DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), -31, "yyyy-MM-dd"));
		queryBean.setDjsj_end(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toCzFwJbxxListPage";
	}
	
	/**
	 * 调整到房屋选择窗口
	 * @return
	 * @date 2013-8-22 下午02:30:02
	 */
	public String toSelectFwWin()
	{
//		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
//		queryBean.setSjxzqh(loginInfo.getCitydm());
//		queryBean.setXjxzqh(loginInfo.getCountrydm());
		initQueryBean();
		return "toSelectFwWin";
	}
	
	public String toSyrkDjFwSelectPage()
	{
		initQueryBean(queryBean);
		return "toSyrkDjFwSelectPage";
	}
	
	public String toSelectFwDzPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		queryBean.setSjxzqh(loginInfo.getCitydm());
		queryBean.setXjxzqh(loginInfo.getCountrydm());
		initQueryBean();
		return "toSelectFwDzPage";
	}
	
	public String loadFwInfoPage() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if (ValidateHelper.isNotEmptyString(queryBean.getFwid()))
		{
			fwBean = fwService.queryFwJbxxBeanByFwid(queryBean.getFwid(), queryBean.getJsppage());
			if (fwBean != null)
			{
				fwBean.setDzxxBean(dzService.queryDzxxBeanByDzid(fwBean.getDzid()));
				if (fwBean.getDzxxBean() != null)
				{
					fwBean.setStxxBean(dzService.queryStxxBeanByStId(fwBean.getDzxxBean().getStid()));
				}
			}
		}
		else
		{
			if (ValidateHelper.isNotEmptyString(queryBean.getStid()))
			{
				fwBean.setStxxBean(dzService.queryStxxBeanByStId(queryBean.getStid()));
			}
			if (ValidateHelper.isNotEmptyString(queryBean.getDzid()))
			{
				fwBean.setDzxxBean(dzService.queryDzxxBeanByDzid(queryBean.getDzid()));
			}
		}
		 
		//原房屋信息不是出租房屋，现在要把房屋信息登记为出租房屋信息
		if("1".equals(queryBean.getSfczw()) && "0".equals(fwBean.getSfczw()))
		{
			if ("1".equals(queryBean.getIsczfdj()))
			{
				CzfwJbxxBean czfwBean = fwService.queryCzfwBeanByfwid(queryBean.getFwid());
				if (czfwBean != null)
				{
					fwBean.setCzfwBean(czfwBean);
					fwBean.setSfczw(queryBean.getSfczw());
				}
				else
				{
					fwBean.setSfczw(queryBean.getSfczw());
					String czfwbh=CommonSequenceHelper.getCZFWBM(loginInfo.getOrgcode());
					fwBean.getCzfwBean().setCzfwbh(czfwbh);
					String bpbm = CommonSequenceHelper.getCzfwbpbm(loginInfo.getOrgcode(),czfwbh);
					fwBean.getCzfwBean().setCzfwbpbm(bpbm);
				}
			}
			else
			{
				fwBean.setSfczw(queryBean.getSfczw());
				String czfwbh=CommonSequenceHelper.getCZFWBM(loginInfo.getOrgcode());
				fwBean.getCzfwBean().setCzfwbh(czfwbh);
				String bpbm = CommonSequenceHelper.getCzfwbpbm(loginInfo.getOrgcode(),czfwbh);
				fwBean.getCzfwBean().setCzfwbpbm(bpbm);
			}
		}
		
		if(queryBean != null && "fwdzqy".endsWith(queryBean.getJsppage()))
		{
			initQueryBean(queryBean);
			queryBean.setOldfwid(fwBean.getFwid());
		}
		if (ValidateHelper.isNotEmptyString(queryBean.getLch()))
		{
			fwBean.getDzxxBean().setLch(queryBean.getLch());
		}
		if (ValidateHelper.isNotEmptyString(queryBean.getDyh()))
		{
			fwBean.getDzxxBean().setDyh(queryBean.getDyh());
		}
		return queryBean.getJsppage();
	}
	
	/**
	 * 跳转到房屋明细页面
	 * @return
	 * @date 2013-8-7 下午03:34:26
	 */
	public String toFwInfoPage() throws Exception
	{
		// 如果是更新则通过房屋编号查询出房屋信息
		if (CommonConstant.OPERTYPE_UPDATE.equals(operType) || CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			if (ValidateHelper.isNotEmptyString(queryBean.getFwid()))
			{
				fwBean = fwService.queryFwJbxxBeanByFwid(queryBean.getFwid(),queryBean.getJsppage());
				if (fwBean != null)
				{
					fwBean.setCzbs("2");	//修改
				}
			}
		}
		else if(CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			// 是否出租房屋
			fwBean.setSfczw(queryBean.getSfczw());
		}
		
		if (fwBean == null)
		{
			existfwjbxx = "false";
		}
		return "toFwInfoPage";
	}
	
	/**
	 * 房屋列表查询
	 * @throws Exception
	 * @date 2013-8-7 下午03:47:40
	 */
	public void queryFwPageResult() throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		queryBean.setOrgcode(loginInfo.getOrgcode());
		if (ValidateHelper.isNotEmptyString(queryBean.getStid()))
		{
			stxxBean.setId(queryBean.getStid());
			queryFwPageResultByStid();
		}
		else
		{
			PageResultInfo<FwJbxxBean> pageResult = fwService.queryFwBeanPageResultInfo(getPageInfo(), queryBean);
			responseWrite(pageResult);
		}
	}
	
	/**
	 * 出租房屋列表查询
	 * @throws Exception
	 */
	public void queryCzfwPageResult() throws Exception{
		PageResultInfo<FwJbxxBean> pageResult =  fwService.queryCzfwPageInfoByQueryBean(queryBean, getPageInfo());
		responseWrite(pageResult);
	}
	
	public void queryFwPageResultByQueryBean() throws Exception
	{
		PageResultInfo<FwJbxxBean> pageResultInfo = null;
		try
		{
			pageResultInfo = fwService.queryFwBeanPageResultInfoByQueryBean(getPageInfo(), queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<FwJbxxBean>();
		}
		responseWrite(pageResultInfo);
	}
	
	
	//根据stid 去查房屋
	public void queryFwPageResultByStid() throws Exception
	{
		PageResultInfo<FwJbxxBean> pageResult = fwService.queryFwBeanPageResultInfoByStid(getPageInfo(), stxxBean.getId());
		responseWrite(pageResult);
	}
	
	//根据stid 去查房屋
	public void queryFwPageResultByStidWithPicNum() throws Exception
	{
		String fjh = request.getParameter("searchFjh");
		String ssDate = request.getParameter("ssDate");
		String seDate = request.getParameter("seDate");
		String hasPic = request.getParameter("hasPic");
		LsfwQueryBean query = new LsfwQueryBean(fjh, ssDate, seDate, hasPic, stxxBean.getId());
		
		String pageNum = request.getParameter("pageNum");
		if(StringUtils.isEmpty(pageNum)){
			pageNum = "1";
		}
		PageInfo pg = getPageInfo();
		pg.setPageSize(12);
		pg.setCurrentPage(Integer.parseInt(pageNum));
		PageResultInfo<FwJbxxBean> pageResult = fwService.queryFwBeanPageResultInfoByStidWithPicNum(pg, stxxBean.getId(), query);
		responseWrite(pageResult);
	}
	
	public void queryFwPageResultByFwBean() throws Exception
	{
		PageResultInfo<FwJbxxBean> pageResult = fwService.queryFwBeanPageResultInfoByFwQueryBean(getPageInfo(), queryBean);
		responseWrite(pageResult);
	}
	
	public void queryFwxxBeanByDzid()
	{
		try
		{
			fwBean = fwService.queryFwxxBeanByDzid(queryBean.getDzid());
			responseWrite(fwBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite("error");
		}
	}
	
	/**
	 * 保存房屋信息
	 * @throws Exception
	 * @date 2013-8-14 上午08:09:12
	 */
	public void saveFwBean()
	{
		try
		{
			//表示是否存在  true  存在
			if (!isExistFwInStxx())
			{
				fwBean = fwService.saveFwJbxxBean(fwBean, queryBean.getMsgtype(), zpUploads, zpUploadsFileName);
				responseWrite(fwBean);
			}
			else
			{
				responseWrite(false);
			}
			 
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 保存房屋照片信息
	 * @date Mar 19, 2014 3:13:21 PM
	 */
	public void saveFwzpxx()
	{
		try
		{
			fwService.saveFwzpxx(fwBean, zpUploads, zpUploadsFileName);
			responseWrite(fwBean.getFwzpxxList());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	/**
	 * 保存巡查情况
	 * @throws Exception 
	 */
	public void savaFwxcBean() throws Exception
	{
		fwBean=fwService.saveFwJbxxBean(fwBean, "5");
		responseWrite(fwBean);
	}
	
	/**
	 * 删除房屋照片信息
	 * @throws Exception
	 * @date 2013-8-15 上午09:21:24
	 */
	public void deleteFwzpxx() throws Exception
	{
		fwService.deleteFwzpxxBeanByZpid(queryBean.getZpid());
		responseWrite(true);
	}
	
	/**
	 * 显示照片信息
	 * 
	 * @date 2013-8-15 上午09:59:48
	 */
	public void showFwzpImage()
	{
		InputStream is = null;
		OutputStream os = null;
		try
		{
			os = response.getOutputStream();
			Blob zpblob = fwService.getFwzpxxInputStream(queryBean.getZpid());
			if (zpblob != null)
			{
				is = zpblob.getBinaryStream();
				byte[] b = new byte[1024];
				while(is.read(b) > 0)
				{
					os.write(b);
					os.flush();
				}
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
	 * 房屋巡查登记   页面跳转
	 * 2013年9月27日17:31:41
	 * @return
	 */
	public String toFwxcdjPage(){
		initQueryBean();
		return "toFwxcdjPage";
	}
	/**
	 * 点击巡查登记  跳转的页面
	 * @return
	 * @throws Exception
	 */
	public String toFwxcInfoPage() throws Exception
	{
		// 如果是更新则通过房屋编号查询出房屋信息
		if (CommonConstant.OPERTYPE_UPDATE.equals(operType) || CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			fwBean = fwService.queryFwJbxxBeanByFwid(queryBean.getFwid(), queryBean.getJsppage());
			fwBean.setCzbs("2");	//修改
		}
		else if(CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			// 是否出租房屋
			fwBean.setSfczw(queryBean.getSfczw());
		}
		
		if(fwBean!=null){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			fwBean.getXcdjBean().setXcmjxm(loginInfo.getRealname());
			fwBean.getXcdjBean().setXcmjdwdm(loginInfo.getOrgcode());
			fwBean.getXcdjBean().setXcmjdwmc(loginInfo.getOrgname());
			fwBean.getXcdjBean().setXcsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		}
		return "toFwxcInfoPage";
	}
	/**
	 * 分页查询 出租房巡查登记信息
	 * @throws Exception
	 */
	public void queryFwJbxxBeansByFwid() throws Exception
	{	
		PageResultInfo<CzwxcdjxxBean> list = fwService.queryCzwxcdjxxPageResultInfo(getPageInfo(),fwBean.getFwid());
		responseWrite(list);
	}
	
	
	public void initQueryBean()
	{
		super.initQueryBean(queryBean);
	}
	
	/**
	 * 出租屋列表查询
	 * @return
	 * @throws Exception 
	 */
	public  void  queryCzfwListInfoPage() throws Exception{
		PageResultInfo<CzfwJbxxBean> list=fwService.queryCzfwPageInfo(queryBean,getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 出租记录跳转
	 * @return
	 * @throws Exception 
	 */
	public String toAddCzjlPage() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			
		}
		else
		{
			fwBean.setCzfwBean(fwService.queryCzfwBeanByCzfwbh(fwBean.getCzfwBean().getCzfwbh()));
		}
		return "toAddCzjlPage";
	}
	
	/**
	 * 根据fwid 查询出租屋记录信息
	 * @throws Exception
	 */
	public  void queryCzfwListPageByFwid() throws Exception{
		PageResultInfo<CzfwJbxxBean> list =  fwService.queryCzfwListPageByFwid(fwBean.getCzfwBean().getFwbh(), getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 保存房屋记录信息
	 * @return
	 * @throws Exception 
	 */
	public  void savaCzjlInfo() {
		try 
		{
			fwBean.setSfczw("1");
			fwBean=fwService.saveCzfwBean(fwBean);
			responseWrite(fwBean);
		} catch (Exception e) {
			e.printStackTrace();
			responseWrite(null);
		}
	}
	
	
	/**
	 * 判断房屋是否存在与某实体下
	 * @return
	 */
	
	public  boolean isExistFwInStxx()
	{
		boolean flag=false;
		try 
		{
			if (ValidateHelper.isEmptyString(fwBean.getFwid()))
			{
				fwBean.getDzxxBean().setStid(fwBean.getStxxBean().getId());
				flag= fwService.queryFwJbxxBeanByStidAndDyLcFj(fwBean.getDzxxBean());
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 房屋注销
	 * @return
	 * @throws Exception 
	 */
	public void deleteFwjbxx() throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(!fwService.queryRklistInFwxx(fwBean.getFwid()))
		{
			fwBean.setCzrxm(loginInfo.getRealname());
			fwBean.setCzdwdm(loginInfo.getOrgcode());
			fwBean.setCzdwmc(loginInfo.getOrgname());
			fwService.deleteFwJbxxBean(fwBean);
			responseWrite(true);
		}
		else
		{
			responseWrite(false);
		}
	}
	
	/**
	 * 出租房屋注销
	 */
	public void deleteCzFwInfo(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		fwBean.setCzrxm(loginInfo.getRealname());
		fwBean.setCzdwdm(loginInfo.getOrgcode());
		fwBean.setCzdwmc(loginInfo.getOrgname());
		try {
			fwService.deleteCzFwJbxxBean(fwBean);
			responseWrite(true);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	/**
	 * 关联单位信息查询
	 * 
	 * @date Feb 24, 2014 2:17:04 PM
	 */
	public void queryGldwxxPageResultInfo()
	{
		PageResultInfo<DwjbxxBean> pageResultInfo = null;
		try
		{
			pageResultInfo = fwService.queryGlDwxxPageResultInfo(getPageInfo(), queryBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResultInfo = new PageResultInfo<DwjbxxBean>();
		}
		responseWrite(pageResultInfo);
	}
	
	/**
	 * 根据身份证号
	 * @return
	 * @throws Exception 
	 */
	public void queryFwjbxxPageByHzsfzh() throws Exception{
		if(ValidateHelper.isNotEmptyString(rybh)){
			if(ValidateHelper.isNotEmptyString(CommonSequenceHelper.getSfzhByRybh(rybh))){
				fwBean.setHzsfzh(CommonSequenceHelper.getSfzhByRybh(rybh));
			}else{
				//查看房主详情时 需要.
				fwBean.setHzsfzh(rybh);
			}
		}
		PageResultInfo<FwJbxxBean>  list = fwService.queryFwInfoByHzsfzh(fwBean.getHzsfzh(),getPageInfo());
		responseWrite(list);
	}
	
	public void queryFwzpInfoByFwid() throws Exception{
		String fwid = request.getParameter("fwid");
		List<FwzpxxBean> list = fwService.queryFwzpxxListByFwid(fwid);
		responseWrite(list);
	}
	
	
	
	public String toExportExcelFwxxInfoPage() throws Exception{
		if(ValidateHelper.isNotEmptyString(fwids)){
			fwBeans = fwService.queryFwListByFwids(fwids);
		}else{
			fwBeans = fwService.queryFwlistByFwqueryBean(queryBean);
		}
		return "toExportExcelFwxxInfoPage";
	}
	
	
	public String toCzfwInfo() throws Exception{
		CzfwJbxxBean czfwBean = fwService.queryCzfwBeanByfwid(fwBean.getCzfwBean().getFwbh());
		if(czfwBean==null)
		{
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			String czfwbh=CommonSequenceHelper.getCZFWBM(loginInfo.getOrgcode());
			fwBean.getCzfwBean().setCzfwbh(czfwbh);
			String bpbm = CommonSequenceHelper.getCzfwbpbm(loginInfo.getOrgcode(),czfwbh);
			fwBean.getCzfwBean().setCzfwbpbm(bpbm);
		}
		else
		{
			fwBean.setCzfwBean(czfwBean);
		}
		return "toCzfwInfo";
	}
	/**
	 * dzfwqyupdate
	 * 房屋地址合并迁移
	 * @return
	 */
	public void dzfwqyupdate(){
		//  fwdzqyBean
		fwService.dzfwqyupdate(fwdzqyBean);
		responseWrite(true);
	}
	
	public LsglFwService getFwService()
	{
		return fwService;
	}

	public void setFwService(LsglFwService fwService)
	{
		this.fwService = fwService;
	}

	public FwJbxxBean getFwBean()
	{
		return fwBean;
	}

	public void setFwBean(FwJbxxBean fwBean)
	{
		this.fwBean = fwBean;
	}

	public FwQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(FwQueryBean queryBean)
	{
		this.queryBean = queryBean;
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

	public Map<String, String> getJcnfMap()
	{
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		for (int i=70;i>=1;i--)
		{
			jcnfMap.put(String.valueOf(year - i), String.valueOf(year - i));
		}
		jcnfMap.put(String.valueOf(year), String.valueOf(year));
		return jcnfMap;
	}

	public void setJcnfMap(Map<String, String> jcnfMap)
	{
		this.jcnfMap = jcnfMap;
	}

	public String getExistfwjbxx() {
		return existfwjbxx;
	}

	public void setExistfwjbxx(String existfwjbxx) {
		this.existfwjbxx = existfwjbxx;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public String getStid() {
		return stid;
	}

	public void setStid(String stid) {
		this.stid = stid;
	}

	public StxxBean getStxxBean() {
		return stxxBean;
	}

	public void setStxxBean(StxxBean stxxBean) {
		this.stxxBean = stxxBean;
	}

	public String getDyh() {
		return dyh;
	}

	public void setDyh(String dyh) {
		this.dyh = dyh;
	}

	public String getRybh() {
		return rybh;
	}

	public void setRybh(String rybh) {
		this.rybh = rybh;
	}

	public List<FwJbxxBean> getFwBeans() {
		return fwBeans;
	}

	public void setFwBeans(List<FwJbxxBean> fwBeans) {
		this.fwBeans = fwBeans;
	}

	public String getFwids() {
		return fwids;
	}

	public void setFwids(String fwids) {
		this.fwids = fwids;
	}

	public FwdzQyBean getFwdzqyBean() {
		return fwdzqyBean;
	}

	public void setFwdzqyBean(FwdzQyBean fwdzqyBean) {
		this.fwdzqyBean = fwdzqyBean;
	}

	public String getCloseParentWin()
	{
		return closeParentWin;
	}

	public void setCloseParentWin(String closeParentWin)
	{
		this.closeParentWin = closeParentWin;
	}	
	
	
}
