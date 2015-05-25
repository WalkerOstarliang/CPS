package com.chinacreator.zdry.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.remote.bean.CzrkInfoBean;
import com.chinacreator.zdry.bean.Gxr;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.bean.Lcsqxx;
import com.chinacreator.zdry.bean.Lksqlzxx;
import com.chinacreator.zdry.constant.ZdryConstant;
import com.chinacreator.zdry.dao.StaffsurveyDao;
import com.chinacreator.zdry.query.CrimePersonnelQueryBean;
import com.chinacreator.zdry.query.KeypersonnelQueryBean;
import com.chinacreator.zdry.services.CollectService;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(采集列管Action)
 * @date Mar 1, 2013 3:25:27 PM
 */
public class CollectingAction extends CPSBaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private KeypersonnelQueryBean key;
	
	private CrimePersonnelQueryBean crime;
	
	private Lcsqxx lcsqxx;
	
	private Lksqlzxx lksqllzxx;
	
	private List<Gxr> gxrList;
	
	/**
	 * 跳转列管(撤管)申请，并初始化数据
	 * @return
	 */
	public String toCollectZdryInfoPage()
	{
		if (lcsqxx == null)
		{
			lcsqxx = new Lcsqxx();
		}
		return "toCollectZdryInfoPage";
 	}
	
	/**
	 * 跳转流程界面
	 * @return
	 */
	public String toCollectLgsq(){
		String sqxxbh = this.getRequest().getParameter("sqxxbh");
		String lcgsqlx = this.getRequest().getParameter("lcgsqlx");
		String isck = this.getRequest().getParameter("isck");
		
		this.getRequest().setAttribute("sqxxbh", sqxxbh);
		this.getRequest().setAttribute("lcgsqlx", lcgsqlx);
		this.getRequest().setAttribute("isck", isck);
		return "toCollectLgsqPage";
	}
	
	/**
	 * 打开审批界面，并初始化数据
	 * @return
	 */
	public String toCollectSpPage(){
		String isck = this.getRequest().getParameter("isck");
		//获取需要审批列管申请信息编号
		if(lksqllzxx != null && StringUtils.isNotBlank(lksqllzxx.getSqxxbh())){
			PageInfo pageInfo = this.getPageInfo();
			
			//根据申请信息编号获取申请数据
			CollectService collectService = new CollectService();
			try {
				Lcsqxx resultInfo = collectService.queryLcsqxx(lksqllzxx, pageInfo);
				resultInfo.setLgsqlx(lksqllzxx.getLcgsqlx());
				this.getRequest().setAttribute("resultInfo", resultInfo);
				this.getRequest().setAttribute("isck", isck);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "toCollectSpPage";
	}
	
	/**
	 * 查询重点人员信息
	 */
	public void queryKeyPersonnel(){
		CollectService service = new CollectService();
		PageInfo pageInfo = getPageInfo();
		if(key == null){
			 key =  new KeypersonnelQueryBean();
		}
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		key.setSspcsdm(loginInfo.getOrgcode());
		try {
			PageResultInfo<Keypersonnel> pageResultInfo = service.queryKeyPersonnel(key, pageInfo);
			responseWrite(pageResultInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询列管信息
	 */
	public void queryLcsqxx(){
		CollectService service = new CollectService();
		PageInfo pageInfo = getPageInfo();
		if(lcsqxx == null){
			lcsqxx =  new Lcsqxx();
		}
		
		try {
			PageResultInfo<Lcsqxx> pageResultInfo = service.queryLcsqxx(lcsqxx, pageInfo);
			responseWrite(pageResultInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询列管流程
	 */
	public String queryLksqlzxx(){
		if(lksqllzxx != null && StringUtils.isNotBlank(lksqllzxx.getSqxxbh())){
			CollectService collectService = new CollectService();
			try {
				List<Lksqlzxx> list = collectService.queryLksqlzxx(lksqllzxx);
				this.getRequest().setAttribute("lzxxList", list);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "toCollectLzxxPage";
	}
	
	/**
	 * 撤管申请
	 */
	public void takeControl(){
		boolean flag = true;
		CollectService collectService = new CollectService();
		try {
			this.getLcgParameter();
			lcsqxx.setSqzt(ZdryConstant.ZDRY_SQZT_SQ);
			lcsqxx.setLgczt(ZdryConstant.ZDRY_LGZT_CGSPZ);
			
			lksqllzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_CBRTXSQB);
			collectService.ColumnPipeApproval(lcsqxx,lksqllzxx);
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		this.responseWrite(flag);
	}
	
	
	/**
	 * 列管申请
	 */
	public void insertLksqlzxx(){
		CollectService service = new CollectService();
		try {
			boolean flag = service.isLg(lcsqxx.getSfzh());
			
			if(flag){
				this.getGxrParameter();
				
				service.ColumnPipeApplication(lcsqxx,lksqllzxx);
				
				if(ValidateHelper.isNotEmptyCollection(gxrList)){
					StaffsurveyDao.insertShgxs(gxrList);
				}
			}
			
			this.responseWrite(flag);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void ckPcsApproval(){
		this.getLcgParameter();
		String isJb = this.getRequest().getParameter("isJb");
		CollectService collectService = new CollectService();
		boolean flag = true;
		try {
			
			//同意审批
			if(ZdryConstant.ZDRY_CLJG_TY.equals(lksqllzxx.getCljg())){
				//终级审批
				if(ZdryConstant.ZDRY_SP_ZJSPBZ.equals(isJb)){
					//撤管状态 
					lcsqxx.setLgczt(ZdryConstant.ZDRY_LGZT_YCG);
					lcsqxx.setSqzt(ZdryConstant.ZDRY_SQZT_JS);
					lksqllzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_FJLDSH);
					
				}else{
					lcsqxx.setLgczt(ZdryConstant.ZDRY_LGZT_CGSPZ);
					lcsqxx.setSqzt(ZdryConstant.ZDRY_SQZT_SP);
					String jbsj = this.getRequest().getParameter("jbsj");
					lcsqxx.setJbsj(DateTimeHelper.convertToDate(jbsj,"yyyy-MM-dd"));
					//设置流程表状态
					lksqllzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_PCSLDSH);
				}
			}else{ //不同意审批
				lcsqxx.setSqzt(ZdryConstant.ZDRY_SQZT_JS);
				lcsqxx.setLgczt(ZdryConstant.ZDRY_LGZT_LGZ);
				
				//终级审批
				if(ZdryConstant.ZDRY_SP_ZJSPBZ.equals(isJb)){
					lksqllzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_FJLDSH);
				}else{
					//设置流程表状态
					lksqllzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_PCSLDSH);
				}
			}
			
			collectService.ColumnPipeApproval(lcsqxx,lksqllzxx);
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}finally{
			this.responseWrite(flag);
		}
	}
	
	/**
	 * 列管审批
	 */
	public void pcsApproval(){
		this.getLcgParameter();
		String isJb = this.getRequest().getParameter("isJb");
		CollectService collectService = new CollectService();
		
		boolean flag = true;
		try {
			
			//同意审批
			if(ZdryConstant.ZDRY_CLJG_TY.equals(lksqllzxx.getCljg())){
				//终级审批
				if(ZdryConstant.ZDRY_SP_ZJSPBZ.equals(isJb)){
					//列管状态 
					lcsqxx.setLgczt(ZdryConstant.ZDRY_LGZT_LGZ);
					lcsqxx.setSqzt(ZdryConstant.ZDRY_SQZT_JS);
					lksqllzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_FJLDSH);
					//插入重点人员基本信息数据
					collectService.insertZdryjbxx(lcsqxx);
				}else{
					lcsqxx.setLgczt(ZdryConstant.ZDRY_LGZT_LGSPZ);
					lcsqxx.setSqzt(ZdryConstant.ZDRY_SQZT_SP);
					//设置流程表状态
					lksqllzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_PCSLDSH);
				}
			}else{ //不同意审批
				lcsqxx.setSqzt(ZdryConstant.ZDRY_SQZT_JS);
				lcsqxx.setLgczt(ZdryConstant.ZDRY_LGZT_SPBTG);
				
				//终级审批
				if(ZdryConstant.ZDRY_SP_ZJSPBZ.equals(isJb)){
					lksqllzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_FJLDSH);
				}else{
					//设置流程表状态
					lksqllzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_PCSLDSH);
				}
			}
			
			collectService.ColumnPipeApproval(lcsqxx,lksqllzxx);
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}finally{
			this.responseWrite(flag);
		}
	}
	
	private void getLcgParameter(){
		String sqxxbh = this.getRequest().getParameter("sqxxbh");
		String pcsshyear = this.getRequest().getParameter("pcsshyear");
		String pcsshmonth = this.getRequest().getParameter("pcsshmonth");
		String pcsshday = this.getRequest().getParameter("pcsshday");
		String lcgsqlx = this.getRequest().getParameter("lcgsqlx");
		
		if(lcsqxx == null){
			lcsqxx = new Lcsqxx();
		}
		
		if(lksqllzxx == null){
			lksqllzxx = new Lksqlzxx();
		}
		
		if(StringUtils.isNotBlank(pcsshyear) && StringUtils.isNotBlank(pcsshmonth) && StringUtils.isNotBlank(pcsshday)){
			String lcgrq = pcsshyear+"-"+pcsshmonth+"-"+pcsshday;
			lksqllzxx.setClsj(DateTimeHelper.convertToDate(lcgrq, "yyyy-MM-dd"));
		}
		lksqllzxx.setSqxxbh(sqxxbh);
		lcsqxx.setSqxxbh(sqxxbh);
		
		lksqllzxx.setLcgsqlx(lcgsqlx);
		lcsqxx.setLgsqlx(lcgsqlx);
	}
	
	private void getGxrParameter(){
		Integer gxrCount = Integer.parseInt(this.getRequest().getParameter("gxrCount"));
		
		String [] jtgx = this.getRequest().getParameterValues("jtgx");
		String [] xb = this.getRequest().getParameterValues("xb");
		String [] dhhm = this.getRequest().getParameterValues("dhhm");
		String [] xm = this.getRequest().getParameterValues("xm");
		String [] sfzh = this.getRequest().getParameterValues("sfzh");
		
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		
		List<Gxr> list = new ArrayList<Gxr>();
		
		for(int i=0; i < gxrCount; i++){
			boolean flag = false;
			
			Gxr gxr = new Gxr();
			if(xm != null && xm.length <= (i+1)){
				gxr.setGxrxm(xm[i]);
				if(gxrCount == 1 && StringUtils.isBlank(xm[i])){
					flag = true;
				}
			}
			if(sfzh != null && sfzh.length <= (i+1)){
				gxr.setGxrsfzh(sfzh[i]);
				if(gxrCount == 1 && StringUtils.isBlank(sfzh[i])){
					flag = true;
				}
			}
			if(dhhm != null && dhhm.length <= (i+1)){
				gxr.setGxrlxdh(dhhm[i]);
				if(gxrCount == 1 && StringUtils.isBlank(dhhm[i])){
					flag = true;
				}
			}
			if(jtgx != null && jtgx.length <= (i+1)){
				gxr.setYdsrgx(jtgx[i]);
				if(gxrCount == 1 && StringUtils.isBlank(jtgx[i])){
					flag = true;
				}
			}
			if(xb != null && xb.length <= (i+1)){
				gxr.setXb(xb[i]);
				if(gxrCount == 1 && StringUtils.isBlank(xb[i])){
					flag = true;
				}
			}
			
			gxr.setSfzh(lcsqxx.getSfzh());
			gxr.setCzrxm(loginInfo.getRealname());
			gxr.setCzdwdm(loginInfo.getOrgcode());
			gxr.setCzdwmc(loginInfo.getOrgname());
			
			if(!flag){
				list.add(gxr);
			}
		}
		this.setGxrList(list);
		
		String lgyear = this.getRequest().getParameter("lgyear");
		String lgmonth = this.getRequest().getParameter("lgmonth");
		String lgday = this.getRequest().getParameter("lgday");
		if(StringUtils.isNotBlank(lgyear) && StringUtils.isNotBlank(lgmonth) && StringUtils.isNotBlank(lgday)){
			String lcgrq = lgyear+"-"+lgmonth+"-"+lgday;
			lcsqxx.setLcgrq(DateTimeHelper.convertToDate(lcgrq, "yyyy-MM-dd"));
		}
		
		String clyear = this.getRequest().getParameter("clyear");
		String clmonth = this.getRequest().getParameter("clmonth");
		String clday = this.getRequest().getParameter("clday");
		if(StringUtils.isNotBlank(clyear) && StringUtils.isNotBlank(clmonth) && StringUtils.isNotBlank(clday)){
			lksqllzxx.setClsj(DateTimeHelper.convertToDate(clyear+"-"+clmonth+"-"+clday,"yyyy-MM-dd"));
		}
		
	}
	
	/**
	 * 根据输入的身份证号码调用常住人口接口初始化数据
	 */
	public void loadLksqlzxxInfo(){
		String sfzh = this.getRequest().getParameter("sfzh");
		CzrkInfoBean czrkInfoBean = null;
		
		//远程根据身份证号码调用接口查询常住人口数据
//		RemoteRequestService remote = new RemoteRequestService();
//		List<CzrkInfoBean> list = remote.queryCzrkInfoBySfzh(sfzh);
//		if(list != null && list.size()>0){
//			czrkInfoBean = list.get(0);
//		}
		
		//监测是否已经列管
		CollectService service = new CollectService();
		try {
			boolean flag = service.isLg(sfzh);
			if(flag){
				//调用测试方法(查询常住人口)
				//OrgUserbusiness user = new OrgUserbusiness();
				//czrkInfoBean = user.queryRyxxBean(sfzh);
				this.responseWrite(czrkInfoBean);
			}else{
				this.responseWrite(flag);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public KeypersonnelQueryBean getKey() {
		return key;
	}

	public void setKey(KeypersonnelQueryBean key) {
		this.key = key;
	}

	public CrimePersonnelQueryBean getCrime() {
		return crime;
	}

	public void setCrime(CrimePersonnelQueryBean crime) {
		this.crime = crime;
	}
	
	public Lcsqxx getLcsqxx() {
		return lcsqxx;
	}

	public void setLcsqxx(Lcsqxx lcsqxx) {
		this.lcsqxx = lcsqxx;
	}
	
	public Lksqlzxx getLksqllzxx() {
		return lksqllzxx;
	}

	public void setLksqllzxx(Lksqlzxx lksqllzxx) {
		this.lksqllzxx = lksqllzxx;
	}
	
	public List<Gxr> getGxrList() {
		return gxrList;
	}

	public void setGxrList(List<Gxr> gxrList) {
		this.gxrList = gxrList;
	}
}
