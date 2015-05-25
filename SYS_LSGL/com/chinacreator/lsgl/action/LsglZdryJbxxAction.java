package com.chinacreator.lsgl.action;
import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.constants.CommonFinalParams;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.CzrkxxBean;
import com.chinacreator.lsgl.bean.QGQLZdryInfoBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryJsbrzsxxBean;
import com.chinacreator.lsgl.bean.ZdryJsbxBean;
import com.chinacreator.lsgl.bean.ZdryPfxxBean;
import com.chinacreator.lsgl.bean.ZdrySwryBean;
import com.chinacreator.lsgl.bean.ZdrySwrysfjlBean;
import com.chinacreator.lsgl.bean.ZdryTgxxBean;
import com.chinacreator.lsgl.bean.ZdryThBean;
import com.chinacreator.lsgl.bean.ZdryWffzjlBean;
import com.chinacreator.lsgl.bean.ZdryXdchNjxxBean;
import com.chinacreator.lsgl.bean.ZdryXdryxxBean;
import com.chinacreator.lsgl.bean.ZdryXsbxBean;
import com.chinacreator.lsgl.query.RkQueryBean;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.LsglZdryService;
import com.chinacreator.lsgl.services.XsbxService;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;
import com.chinacreator.lsgl.services.impl.LsglZdryServiceImpl;
/**
 * 
 * @author zhun.liu
 *
 */
public class LsglZdryJbxxAction  extends CPSBaseAction{
	private static final long serialVersionUID = -7003208267955038289L;
	private RkxxBean rkBean;
	private RkQueryBean queryBean;
	private ZdryGzdxBean zdryBean;
	private ZdryXsbxBean xsbxBean;
	private QGQLZdryInfoBean qgzdryBean;
	private List<ZdryXsbxBean> xsbxList;
	private ZdryWffzjlBean wffzjlBean;
	private File[] zpUploads;
	private String[] zpUploadsFileName;
	private String jsppage;
	private String msgtype;
	private LsglRkService rkService;
	private LsglZdryService zdryService;
	private XsbxService xsbxService;
	private String zdrybh;
	private String sfzh;
	private String dxlb;
	
	private String rybh;
	private String operType;

	private String showtype;
	
	private String showMenu;
	
	//长沙电子档案URL
	private String csDzda_url;
	
	//省电子档案
	private String sDzda_url;

	//不电子档案
	private String bDzda_url;
	
	private List<ZdryGzdxBean> zdryList;
	
	

	public LsglZdryJbxxAction(){
		super();
		zdryBean = new ZdryGzdxBean(); 
		xsbxBean = new ZdryXsbxBean();
		wffzjlBean=new ZdryWffzjlBean();
		rkService = new LsglRkServiceImpl();
		zdryService = new LsglZdryServiceImpl();
		xsbxService = new XsbxService();
		queryBean=new RkQueryBean();
		xsbxList = new ArrayList<ZdryXsbxBean>();
		
		zdryList = new ArrayList<ZdryGzdxBean>();
	}
	
	
	public void initQueryBean()
	{
		super.initQueryBean(queryBean);
	}
	
	/**
	 *  跳转到重点人员列表
	 */
	public String toZdryListPage(){
		initQueryBean();
		queryBean.setSqdm("");
		return "toZdryListPage";
	}
	
	/**
	 * 分页查询重点人员信息
	 * @throws Exception 
	 */
	public void queryZdryListPage()
	{
		PageResultInfo<ZdryGzdxBean> list = zdryService.queryZdryGzdxPageResult(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 分页查询未认领的重点人员
	 * @throws Exception
	 */
	public void queryWrlZdryListPage() throws Exception{
		PageResultInfo<ZdryGzdxBean> list=zdryService.queryWrlZdryGzdxPageResult(queryBean, getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 跳转到未认领重点人员页面
	 * @return
	 */
	public String toWrlZdryListPage(){
		initQueryBean();
		return "toWrlZdryListPage";
	}
	
	/**
	 * 重点人员认领
	 * @throws Exception
	 */
	public void zdryRl() throws Exception{
		zdryService.zdryRl(zdryBean.getGzdxbh());
	}
	
	/**
	 * 跳转到输入身份证界面
	 * @return
	 */
	public String toSFZHInfoPage(){	
		return "toSFZHInfoPage";
	}
	
	/**
	 *跳转至现实表现身份证验证界面
	 */
	public String toSfzhValidate(){
		return "toSfzhValidate";
	}
	/**
	 * 判断身份证是否登记
	 * @throws Exception
	 */
	public  void isExistSfzh() throws Exception{
		boolean flag=zdryService.isExistSfzhm(sfzh);
		responseWrite(flag);
	}
	
	public String toZdryDetailInfoPage() throws Exception
	{
		toZdryInfoPage();
		return "toZdryDetailInfoPage";
	}
	
	public String toQGQLZdryInfoPage()
	{
		qgzdryBean = zdryService.queryQGQLZdryInfoBeanByZdrybh(zdrybh);
		return "toQGQLZdryInfoPage";
	}
	
	/**
	 * 弹出  新增 修改 详情信息界面
	 * @return
	 * @throws Exception 
	 */
	public String toZdryInfoPage() throws Exception{
		if (ValidateHelper.isNotEmptyString(queryBean.getDxlb()))
		{
			rkBean.getJbxxBean().setSfzh(queryBean.getSfzh());
		}
		zdryBean =zdryService.queryGzdxBeanBySfzh(queryBean.getSfzh());
		if(zdryBean!=null){
			dxlb = zdryBean.getDxlb();
			if(CommonConstant.ZDRY_SDRY.equals(dxlb)){
				modename = "吸毒人员";
				ZdryXdryxxBean xdryxxBean = zdryService.queryXdryBeanByGzdxbh(zdryBean.getGzdxbh());
				zdryBean.setXdryBean(xdryxxBean);
			}else if(CommonConstant.ZDRY_JSBR.equals(dxlb)){
				modename = "精神病人";
				ZdryJsbxBean  jsbrBean=zdryService.queryJsbrBeanByGzdxbh(zdryBean.getGzdxbh());
				zdryBean.setJsbrBean(jsbrBean);
			}else if(CommonConstant.ZDRY_SWRY.equals(dxlb)){
				modename = "涉稳人员";
				ZdrySwryBean swryBean=zdryService.querySwryBeanBySfzh(zdryBean.getSfzh());
				zdryBean.setSwryBean(swryBean);
			}else if("1".equals(dxlb)){
				modename = "重点人员";
			}else if("2".equals(dxlb)){
				modename = "矫正对象";
			}else if("3".equals(dxlb)){
				modename = "关注对象";
			}
		}else{
			dxlb ="";
		}
		
		csDzda_url = DictionaryCacheHellper.getSystemParamenterValueByKey("csdzda_url");
		sDzda_url = DictionaryCacheHellper.getSystemParamenterValueByKey("sdzda_url");
		bDzda_url = DictionaryCacheHellper.getSystemParamenterValueByKey("bdzda_url");
		return "toZdryInfoPage";
	}

	
	/**
	 * 加载人口信息页面
	 * @return
	 * @date 2013-8-29 下午05:15:19
	 */
	public String loadRkInfoPage() throws Exception
	{
		if (ValidateHelper.isNotEmptyString(queryBean.getRybh()))
		{
			rkBean = rkService.queryRkxxBeanByRybh(queryBean.getRylb(), queryBean.getRybh(), msgtype, operType);
		}
		else
		{
			rkBean = rkService.queryRkxxBeanBySfzh(queryBean.getRylb(), queryBean.getSfzh(), msgtype);
		}
		
		if (ValidateHelper.isNotEmptyString(rkBean.getJbxxBean().getRybh()) 
				&& CommonFinalParams.RYLB_CZRK.equals(rkBean.getRylb()))
		{
			CzrkxxBean czrkBean = rkService.queryDqCzrkxxBeanByRybh(rkBean.getJbxxBean().getRybh());
			rkBean.setCzrkBean(czrkBean);
		}
		zdryBean=zdryService.queryZdryGzdxDetailInfoBySfzh(rkBean.getJbxxBean().getSfzh());
		
		if(zdryBean!=null){
			zdryBean=zdryService.queryZdryGzdxBeanByGzdx(zdryBean);
		}
		//	wffzjlBean=rkService
		//xsbxBean = xsbxService.queryXsbxBeansBySfzh(queryBean.getSfzh());
		if(ValidateHelper.isEmptyString(xsbxBean.getJlbh())){
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			xsbxBean.setDjrxm(loginInfo.getRealname());
			xsbxBean.setDjdwdm(loginInfo.getOrgcode());
			xsbxBean.setDjdwmc(loginInfo.getOrgname());
			xsbxBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			
			xsbxBean.setHsmjxm(loginInfo.getRealname());
			xsbxBean.setHsmjsfzh(loginInfo.getSfzh());
			xsbxBean.setHszrdwdm(loginInfo.getOrgcode());
			xsbxBean.setHszedwmc(loginInfo.getOrgname());
			xsbxBean.setHssj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			xsbxBean.setHsddqh(loginInfo.getOrgcode().substring(0,6));
			xsbxBean.setHsddqhmc(DictionaryCacheHellper.getXzqhmcByQhdm(loginInfo.getOrgcode().substring(0,6)));
		}
//		xsbxList = xsbxService.queryXsbxListBySfzh(queryBean.getSfzh());
		return jsppage;
	}
	
	/**
	 * 判断身份证是否存在重点人员关注对象表
	 * @throws Exception
	 */
	public void isExistSfzhInZdryGzdx() throws Exception{
		boolean flag = false;
		ZdryGzdxBean bean =zdryService.getExistSfzhInZdryGzdx(sfzh);
		if (bean != null)
		{
			flag = true;
		}
		responseWrite(flag);
	}
	
	
	/**
	 * 保存 重点人员基本信息
	 * @throws Exception 
	 * 
	 */
	public void saveZdryxxBean()
	{
		try
		{
			ZdryGzdxBean zdryGzdxBean=zdryService.insertZdryGzdxInfo(zdryBean);
			responseWrite(zdryGzdxBean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	/**
	 * 保存重点人员工作对象信息
	 * @throws Exception 
	 */
	public void saveZdryGzdx() throws Exception{
		ZdryGzdxBean gzdxBean = zdryService.saveZdryGzdx(zdryBean,dxlb);
		responseWrite(gzdxBean);
	}
	
	/**
	 * 保存重点人员工作对象的活动信息
	 * 
	 */
	public void savaZdryGzdxActivity() throws Exception{
	    zdryService.saveZdryGzdxActivityInfo(zdryBean,dxlb);
		responseWrite(true);
	}
	

	/**
	 * 分页查询违法犯罪记录
	 * @throws Exception 
	 * 
	 */
	public void queryZdryWffzjlListPage() throws Exception{
		PageResultInfo<ZdryWffzjlBean> list=zdryService.queryZdryWffzjlPageResult(wffzjlBean.getRybh(), getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 分页查询吸毒人员尿检信息
	 * @throws SQLException 
	 */
	public void queryZdryXdryhdListPage() throws SQLException{
		PageResultInfo<ZdryXdchNjxxBean> list=zdryService.queryZdryXdryhdPageResult(zdryBean.getXdchNjxxBean().getXdrybh(), getPageInfo());
		responseWrite(list);
	}
	/**
	 * 分页查询精神病人肇事信息
	 * @throws SQLException
	 */
	public  void  queryZdryJsbrzsListPage() throws Exception{
		PageResultInfo<ZdryJsbrzsxxBean>  list=zdryService.queryZdryJsbrzsxxPageResult(zdryBean.getJsbrzsBean().getJsbrbh(), getPageInfo());
		responseWrite(list);
	}
	
	/**
	 * 分页查询涉稳人员上访记录
	 * @throws SQLException
	 */
	public void  queryZdrySwrysfjlListPage() throws Exception {
		PageResultInfo<ZdrySwrysfjlBean> list =zdryService.queryZdrySwrysfjlPageResult(zdryBean.getSwrysfjlBean().getSwrybh(), getPageInfo());
		responseWrite(list);
	}
	
	
	/*
	 * 保存现实表现信息
	 */
	public void saveXsbxBean() throws SQLException{
		ZdryXsbxBean Zdryxsbxbean = xsbxService.saveXsbxBean(xsbxBean);
		responseWrite(Zdryxsbxbean);
	}

	
	
	/**
	 * 保存违法犯罪记录
	 * @throws Exception 
	 * 
	 */	
	public void saveZdryWffzjlBean() throws Exception{
		ZdryWffzjlBean zdryWffzjlBean=zdryService.insertZdryWffzjlInfo(wffzjlBean);
		responseWrite(zdryWffzjlBean);
	}
	
	
	/**
	 * 判断工作对象中是否存在该对象
	 */
	public void isExists() throws Exception{
		ZdryGzdxBean zdryGzdxBean = zdryService.queryGzdxBeanBySfzh(sfzh);
		responseWrite(zdryGzdxBean);
	}
	
	/**
	 * 重点人员派发
	 */
	public void zdrypf(){
		zdryService.zdryPf(zdryBean);
	}
	
	//跳转到派发界面
	public String toZdryPfPage(){
		try {
			rkBean = rkService.queryRkxxBeanByRybh(queryBean.getRylb(), queryBean.getRybh(),"1", operType);
			zdryBean=zdryService.queryZdryGzdxDetailInfoBySfzh(rkBean.getJbxxBean().getSfzh());
			if(!CommonConstant.OPERTYPE_ADD.equals(operType)){
				ZdryPfxxBean pfxx = zdryService.queryPfxx(zdryBean.getSfzh());
				if(pfxx != null){
					zdryBean.setSszrdwdm(pfxx.getMbdwdm());
					zdryBean.setSszrdwmc(pfxx.getMbdwmc());
					zdryBean.setSsxzsq(pfxx.getXzsqdm());
					zdryBean.setSsxzsqmc(pfxx.getXzsqmc());
				}
			}else{
				zdryBean.setSszrdwdm(null);
				zdryBean.setSszrdwmc(null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toZdryPfPage";
	}
	
	//退回界面
	public String toZdrythpage(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		try {
			ZdryThBean thxx = zdryBean.getThxx();
			rkBean = rkService.queryRkxxBeanByRybh(queryBean.getRylb(), queryBean.getRybh(),"1", operType);
			zdryBean=zdryService.queryZdryGzdxDetailInfoBySfzh(rkBean.getJbxxBean().getSfzh());
			if(CommonConstant.OPERTYPE_ADD.equals(operType)){
				thxx = new ZdryThBean();
				thxx.setThdwdm(loginInfo.getOrgcode());
				thxx.setThdwmc(loginInfo.getOrgname());
				thxx.setThrjh(loginInfo.getUsername());
				thxx.setThrlxfs(loginInfo.getMoblie());
				thxx.setThrxm(loginInfo.getRealname());
				thxx.setThsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			}else {
				thxx = zdryService.queryThxx(zdryBean.getSfzh(), loginInfo.getOrgcode());
			}
			if(zdryBean == null){
				zdryBean = new ZdryGzdxBean();
			}
			zdryBean.setThxx(thxx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toZdrythpage";
	}
	
	//退回
	public void zdryth(){
		zdryService.zdryth(zdryBean);
	}
	
	//托管界面
	public String toZdryTgPage(){
		try {
			ZdryTgxxBean wtxx = zdryBean.getTgxx();
			rkBean = rkService.queryRkxxBeanByRybh(queryBean.getRylb(), queryBean.getRybh(),"1", operType);
			zdryBean=zdryService.queryZdryGzdxDetailInfoBySfzh(rkBean.getJbxxBean().getSfzh());
			if(CommonConstant.OPERTYPE_ADD.equals(operType)){
				LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
				wtxx = new ZdryTgxxBean();
				wtxx.setWtrxm(loginInfo.getRealname());
				wtxx.setWtrjh(loginInfo.getUsername());
				wtxx.setWtdwdm(loginInfo.getOrgcode());
				wtxx.setWtdwmc(loginInfo.getOrgname());
				wtxx.setWtrlxfs(loginInfo.getMoblie());
				wtxx.setWtsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			}else{
				wtxx = zdryService.queryTgxx(zdryBean.getSfzh(), zdryBean.getWtdwdm());
			}
			if(zdryBean == null){
				zdryBean = new ZdryGzdxBean();
			}
			zdryBean.setTgxx(wtxx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toZdryTgPage";
	}
	
	//托管重点人员
	public void rytg(){
		ZdryTgxxBean tgxx = zdryBean.getTgxx();
		tgxx.setJgzt(CommonConstant.ZDRY_JGZT_WJG);
		tgxx.setSfzh(zdryBean.getSfzh());
		responseWrite(zdryService.zdryTg(zdryBean));
	}
	
	//接管重点人员
	public void ryjg(){
		ZdryTgxxBean tgxx = zdryBean.getTgxx();
		tgxx.setSfzh(zdryBean.getSfzh());
		tgxx.setJgzt(CommonConstant.ZDRY_JGZT_YJG);
		responseWrite(zdryService.zdryJg(zdryBean));
	}
	
	//退回委托重点人员
	public void wtzdryth(){
		ZdryTgxxBean tgxx = zdryBean.getTgxx();
		tgxx.setSfzh(zdryBean.getSfzh());
		tgxx.setJgzt(CommonConstant.ZDRY_JGZT_TH);
		responseWrite(zdryService.zdryJg(zdryBean));
	}
	
	//接管界面
	public String toZdryJgPage(){
		try {
			String tgxxId = zdryBean.getTgxxId();
			rkBean = rkService.queryRkxxBeanByRybh(queryBean.getRylb(), queryBean.getRybh(),"1", operType);
			zdryBean=zdryService.queryZdryGzdxDetailInfoBySfzh(rkBean.getJbxxBean().getSfzh());
			
			ZdryTgxxBean wtxx = zdryService.queryTgxxById(tgxxId);
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			if(wtxx == null){
				wtxx = new ZdryTgxxBean();
				wtxx.setJgrjh(loginInfo.getUsername());
				wtxx.setJgrxm(loginInfo.getRealname());
				wtxx.setJgdwdm(loginInfo.getOrgcode());
				wtxx.setJgdwmc(loginInfo.getOrgname());
				wtxx.setJgrlxfs(loginInfo.getMoblie());
				wtxx.setJgsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			}else{
				if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
					wtxx.setJgrjh(loginInfo.getUsername());
					wtxx.setJgrxm(loginInfo.getRealname());
					wtxx.setJgdwdm(loginInfo.getOrgcode());
					wtxx.setJgdwmc(loginInfo.getOrgname());
					wtxx.setJgrlxfs(loginInfo.getMoblie());
					wtxx.setJgsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				}
			}
			zdryBean.setTgxx(wtxx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toZdryJgPage";
	}
	
	//查询托管列表
	public void queryTgxxList(){
		responseWrite(zdryService.queryTgxxList(queryBean, this.getPageInfo()));
	}
	
	//接管查询页面
	public String toZdryJgListPage(){
		initQueryBean();
		return "toZdryJgListPage";
	}
	
	/**
	 * 是否托管
	 */
	public void sftg(){
		responseWrite(zdryService.queryTgxxBySfzh(zdryBean.getSfzh()));
	}
	
	//分页查询现实表现
	public void queryXsbxPageResultInfo(){
		responseWrite(zdryService.queryXsbxPageResultInfo(zdryBean.getSfzh(), getPageInfo()));
		
	}
	
	//导出在控登记信息
	public String downloadZkdj(){
		xsbxBean = zdryService.queryXsbxById(xsbxBean.getJlbh());
		if (ValidateHelper.isNotEmptyString(xsbxBean.getRybh()))
		{
			try {
				rkBean = rkService.queryRkxxBeanByRybh(null, xsbxBean.getRybh(), msgtype, operType);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else
		{
			try {
				rkBean = rkService.queryRkxxBeanBySfzh(null, xsbxBean.getSfzh(), msgtype);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "downloadZkdj";
	}
	
	/**
	 * 导出重点人员
	 */
	public String downloadZdry(){
		zdryList = zdryService.queryZdryList(queryBean);
		return "downloadZdry";
	}
	
	/**  GETTER  SETTER */
	public RkQueryBean getQueryBean() {
		return queryBean;
	}
	public void setQueryBean(RkQueryBean queryBean) {
		this.queryBean = queryBean;
	}
	public ZdryGzdxBean getZdryBean() {
		return zdryBean;
	}
	public void setZdryBean(ZdryGzdxBean zdryBean) {
		this.zdryBean = zdryBean;
	}
	public RkxxBean getRkBean() {
		return rkBean;
	}
	public void setRkBean(RkxxBean rkBean) {
		this.rkBean = rkBean;
	}
	public File[] getZpUploads() {
		return zpUploads;
	}
	public void setZpUploads(File[] zpUploads) {
		this.zpUploads = zpUploads;
	}
	public String[] getZpUploadsFileName() {
		return zpUploadsFileName;
	}
	public void setZpUploadsFileName(String[] zpUploadsFileName) {
		this.zpUploadsFileName = zpUploadsFileName;
	}
	public String getJsppage() {
		return jsppage;
	}
	public void setJsppage(String jsppage) {
		this.jsppage = jsppage;
	}
	public String getMsgtype() {
		return msgtype;
	}
	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public ZdryWffzjlBean getWffzjlBean() {
		return wffzjlBean;
	}
	public void setWffzjlBean(ZdryWffzjlBean wffzjlBean) {
		this.wffzjlBean = wffzjlBean;
	}

	public String getOperType() {
		return operType;
	}
	public void setOperType(String operType) {
		this.operType = operType;
	}
	public String getRybh() {
		return rybh;
	}
	public void setRybh(String rybh) {
		this.rybh = rybh;
	}
	public ZdryXsbxBean getXsbxBean() {
		return xsbxBean;
	}
	public void setXsbxBean(ZdryXsbxBean xsbxBean) {
		this.xsbxBean = xsbxBean;
	}

	public String getShowtype() {
		return showtype;
	}
	public void setShowtype(String showtype) {
		this.showtype = showtype;
	}
	public String getDxlb() {
		return dxlb;
	}
	public void setDxlb(String dxlb) {
		this.dxlb = dxlb;
	}
	public String getCsDzda_url() {
		return csDzda_url;
	}
	public void setCsDzda_url(String csDzda_url) {
		this.csDzda_url = csDzda_url;
	}
	public String getSDzda_url() {
		return sDzda_url;
	}
	public void setSDzda_url(String dzda_url) {
		sDzda_url = dzda_url;
	}
	public String getBDzda_url() {
		return bDzda_url;
	}
	public void setBDzda_url(String dzda_url) {
		bDzda_url = dzda_url;
	}
	public List<ZdryXsbxBean> getXsbxList() {
		return xsbxList;
	}
	public void setXsbxList(List<ZdryXsbxBean> xsbxList) {
		this.xsbxList = xsbxList;
	}
	public String getShowMenu() {
		return showMenu;
	}
	public void setShowMenu(String showMenu) {
		this.showMenu = showMenu;
	}


	public String getZdrybh()
	{
		return zdrybh;
	}


	public void setZdrybh(String zdrybh)
	{
		this.zdrybh = zdrybh;
	}


	public QGQLZdryInfoBean getQgzdryBean()
	{
		return qgzdryBean;
	}

	public void setQgzdryBean(QGQLZdryInfoBean qgzdryBean)
	{
		this.qgzdryBean = qgzdryBean;
	}


	public List<ZdryGzdxBean> getZdryList() {
		return zdryList;
	}


	public void setZdryList(List<ZdryGzdxBean> zdryList) {
		this.zdryList = zdryList;
	}
}
