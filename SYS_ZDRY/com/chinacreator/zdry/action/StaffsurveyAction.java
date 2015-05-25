package com.chinacreator.zdry.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.action.CommonLoadDataAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.zdry.bean.Gxr;
import com.chinacreator.zdry.bean.Gzxx;
import com.chinacreator.zdry.bean.Jjqk;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.bean.Lcsqxx;
import com.chinacreator.zdry.bean.Lxfs;
import com.chinacreator.zdry.bean.Wffzjl;
import com.chinacreator.zdry.bean.Xsbx;
import com.chinacreator.zdry.bean.Zpxx;
import com.chinacreator.zdry.services.CollectService;
import com.chinacreator.zdry.services.StaffsurveyService;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(人员考察Action类)
 * @date Mar 8, 2013 4:30:15 PM
 */
public class StaffsurveyAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3004711091063950512L;
	
	private StaffsurveyService service = new StaffsurveyService();
	
	private Lxfs lxfs;
	private Gxr  gxr;
	private Keypersonnel personnel;
	private Zpxx zpxx;
	private String modth;
	private File[] upload;
	private Xsbx xsbx;
	private Jjqk jjqk;
	private Gzxx gzxx;
	private Wffzjl wffzjl;

	public String toStaffsurveyPage(){
		String sfzh = this.getRequest().getParameter("sfzh");
		try {
			if(StringUtils.isNotBlank(modth) && modth.equals("toStaffsurveyLlfsPage")){
				//联系方式
				Lxfs lxfs = service.queryLlfsInfo(sfzh);
				this.getRequest().setAttribute("lxfs", lxfs);
			}else if(StringUtils.isNotBlank(modth) && modth.equals("toStaffsurveyJjqkPage")){
				//经济情况
				Jjqk jjqk = service.queryBySfzhJjqk(sfzh);
				this.getRequest().setAttribute("jjqk", jjqk);
				
			}else if(StringUtils.isNotBlank(modth) && modth.equals("toStaffsurveyShgxPage")){
				//社会关系
				if(gxr == null){
					gxr = new Gxr();
					gxr.setSfzh(sfzh);
				}
				List<Gxr> gxrList = service.queryShgxList(gxr);
				this.getRequest().setAttribute("gxrList", gxrList);
				
			}else if(StringUtils.isNotBlank(modth) && modth.equals("toStaffsurveyTmtzPage")){
				//体征表现
				CollectService collectService = new CollectService();
				Keypersonnel keypersonnel = collectService.queryBySfzhPersonnel(sfzh);
				this.getRequest().setAttribute("personnel", keypersonnel);
				
			}else if(StringUtils.isNotBlank(modth) && modth.equals("toStaffsurveyXsbxPage")){
				//现实表现
				//List<Xsbx> xsbxList = service.queryXsbxList(sfzh);
				//this.getRequest().setAttribute("xsbxList", xsbxList);
				
			}else if(StringUtils.isNotBlank(modth) && modth.equals("toStaffsurveyWfjlPage")){
				//违法经历	
			
			}else if(StringUtils.isNotBlank(modth) && modth.equals("toStaffsurveyGzxxPage")){
				//工作信息
				gzxx = service.queryGzxx(sfzh);
			
			}else if(StringUtils.isNotBlank(modth) && modth.equals("toStaffsurveyZpxxPage")){
				//照片信息
				if(zpxx == null){
					zpxx = new Zpxx();
					zpxx.setSfzh(sfzh);
				}
				List<Zpxx> zpxxList = service.queryZpxxList(zpxx);
				this.getRequest().setAttribute("zpxxList", zpxxList);
				
			}else if(StringUtils.isNotBlank(modth) && modth.equals("toStaffsurveyJbxxPage")){
				//基本信息
				CollectService collectService = new CollectService();
				Keypersonnel keypersonnel = collectService.queryBySfzhPersonnel(sfzh);
				//Lcsqxx lcsqxx = collectService.queryLcsqxx(keypersonnel.getBm());
				Lcsqxx lcsqxx = new Lcsqxx();
				lcsqxx.setLcgly("ddd");
				this.getRequest().setAttribute("personnel", keypersonnel);
				this.getRequest().setAttribute("lcsqxx", lcsqxx);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.getRequest().setAttribute("sfzh", sfzh);
		return modth;
	}
	
	public void saveStaffsurvey(){
		boolean flag = true;
		try {
			if(StringUtils.isNotBlank(modth) && modth.equals("llfs")){
				service.saveLlfs(lxfs);
			
			}else if(StringUtils.isNotBlank(modth) && modth.equals("jbxx")){
				service.saveJbxx(personnel);
			
			}else if(StringUtils.isNotBlank(modth) && modth.equals("tmtz")){
				service.saveTmtz(personnel);
			
			}else if(StringUtils.isNotBlank(modth) && modth.equals("shgx")){
				List<Gxr> gxrList = getGxrParameter();
				service.saveShgxs(gxrList,gxr.getSfzh());
				
			}else if(StringUtils.isNotBlank(modth) && modth.equals("zpxx")){
				List<Zpxx> zpxxList = getZpxxParameter();
				service.saveZpxxs(zpxxList,zpxx.getSfzh());
			
			}else if(StringUtils.isNotBlank(modth) && modth.equals("jjqk")){
				service.saveJjqk(jjqk);
				
			}else if(StringUtils.isNotBlank(modth) && modth.equals("gzxx")){
				service.saveGzxx(gzxx);
				
			}else if(StringUtils.isNotBlank(modth) && modth.equals("wffzjl")){
				service.saveWffzjl(wffzjl);
				
			}else if(StringUtils.isNotBlank(modth) && modth.equals("xsbx")){
				service.saveXsbx(xsbx);
			}
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}finally{
			this.responseWrite(flag);
		}
	}
	
	public void delStaffsurvey(){
		boolean flag = true;
		try {
			String id = this.getRequest().getParameter("id");
			if(StringUtils.isNotBlank(modth) && modth.equals("wffzjl")){
				service.delWffzjl(id);
			}else if(StringUtils.isNotBlank(modth) && modth.equals("xsbx")){
				service.delXsbx(id);
			}else if(StringUtils.isNotBlank(modth) && modth.equals("delZpxx")){
				service.delZpxx(id);
			}
		}catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}finally{
			this.responseWrite(flag);
		}
	}
	
	/**
	 * 查询违法犯罪集合
	 */
	public void queryWfjlList(){
		PageInfo pageInfo = this.getPageInfo();
		try {
			PageResultInfo<Wffzjl> resultInfo = service.queryWfjlList(wffzjl, pageInfo);
			this.responseWrite(resultInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void queryBySfzhXsbxList(){
		String sfzh = this.getRequest().getParameter("sfzh");
		PageInfo pageInfo = this.getPageInfo();
		try {
			PageResultInfo<Xsbx> resultInfo = service.queryXsbxList(sfzh,pageInfo);
			this.responseWrite(resultInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 初始化人员考察基本信息
	 * @return
	 */
	public String toStaffsurveyJbxxPage() {
		String sfzh = this.getRequest().getParameter("sfzh");
		
		CollectService collectService = new CollectService();
		try {
			Keypersonnel keypersonnel = collectService.queryBySfzhPersonnel(sfzh);
			this.getRequest().setAttribute("personnel", keypersonnel);
			this.getRequest().setAttribute("sfzh", sfzh);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "toStaffsurveyIndexPage";
	}
	
	private List<Zpxx> getZpxxParameter(){
		Integer gxrCount = Integer.parseInt(this.getRequest().getParameter("gxrCount"));
		
		String [] zpms = this.getRequest().getParameterValues("zpms");
		String [] pzrq = this.getRequest().getParameterValues("pzrq");
		
		List<Zpxx> list = new ArrayList<Zpxx>();
		
		for(int i=0; i < gxrCount; i++){
			boolean flag = false;
			
			Zpxx zpxxTemp = new Zpxx();
			if(zpms != null && zpms.length >= (i+1)){
				zpxxTemp.setZpms(zpms[i]);
				if(gxrCount == 1 && StringUtils.isBlank(zpms[i])){
					flag = true;
				}
			}
			if(pzrq != null && pzrq.length >= (i+1)){
				zpxxTemp.setPzrq(DateTimeHelper.convertToDate(pzrq[i], "yyyy-MM-dd"));
				if(gxrCount == 1 && StringUtils.isBlank(pzrq[i])){
					flag = true;
				}
			}
			
			
			zpxxTemp.setSfzh(zpxx.getSfzh());
			zpxxTemp.setUpload(upload[i]);
			if(!flag){
				list.add(zpxxTemp);
			}
		}
		return list;
	}
	
	private List<Gxr> getGxrParameter(){
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
			
			Gxr gxrTemp = new Gxr();
			if(xm != null && xm.length >= (i+1)){
				gxrTemp.setGxrxm(xm[i]);
				if(gxrCount == 1 && StringUtils.isBlank(xm[i])){
					flag = true;
				}
			}
			if(sfzh != null && sfzh.length >= (i+1)){
				gxrTemp.setGxrsfzh(sfzh[i]);
				if(gxrCount == 1 && StringUtils.isBlank(sfzh[i])){
					flag = true;
				}
			}
			if(dhhm != null && dhhm.length >= (i+1)){
				gxrTemp.setGxrlxdh(dhhm[i]);
				if(gxrCount == 1 && StringUtils.isBlank(dhhm[i])){
					flag = true;
				}
			}
			if(jtgx != null && jtgx.length >= (i+1)){
				gxrTemp.setYdsrgx(jtgx[i]);
				if(gxrCount == 1 && StringUtils.isBlank(jtgx[i])){
					flag = true;
				}
			}
			if(xb != null && xb.length >= (i+1)){
				gxrTemp.setXb(xb[i]);
				if(gxrCount == 1 && StringUtils.isBlank(xb[i])){
					flag = true;
				}
			}
			
			gxrTemp.setSfzh(gxr.getSfzh());
			gxrTemp.setDjdwdm(loginInfo.getOrgcode());
			gxrTemp.setDjdwmc(loginInfo.getOrgname());
			gxrTemp.setDjrxm(loginInfo.getRealname());
			gxrTemp.setCzrxm(loginInfo.getRealname());
			gxrTemp.setCzdwdm(loginInfo.getOrgcode());
			gxrTemp.setCzdwmc(loginInfo.getOrgname());
			
			if(!flag){
				list.add(gxrTemp);
			}
		}
		return list;
	}
	
	/**
	 * 查询照片信息 
	 */
	public void showZpxxImg(){
		try{	
			String id = this.getRequest().getParameter("id");
			Zpxx zp = service.queryByIdZpxx(id);
			
			InputStream is = null;
			if(null != zp){
				is = new BufferedInputStream(zp.getZp().getBinaryStream());
			}else{
				// 不存在照片显示默认照片
				is = CommonLoadDataAction.class.getResourceAsStream("/no_photo.jpg");
			}
			
			byte[] b = new byte[1024];
			while(is.read(b)>0){
				response.getOutputStream().write(b);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				response.getOutputStream().close();
			}catch (IOException e){
				e.printStackTrace();
			}
		}
	}
	
	public StaffsurveyService getService() {
		return service;
	}

	public void setService(StaffsurveyService service) {
		this.service = service;
	}

	public Lxfs getLxfs() {
		return lxfs;
	}

	public void setLxfs(Lxfs lxfs) {
		this.lxfs = lxfs;
	}
	
	public String getModth() {
		return modth;
	}

	public void setModth(String modth) {
		this.modth = modth;
	}

	public Gxr getGxr() {
		return gxr;
	}

	public void setGxr(Gxr gxr) {
		this.gxr = gxr;
	}

	public Keypersonnel getPersonnel() {
		return personnel;
	}

	public void setPersonnel(Keypersonnel personnel) {
		this.personnel = personnel;
	}

	public Zpxx getZpxx() {
		return zpxx;
	}

	public void setZpxx(Zpxx zpxx) {
		this.zpxx = zpxx;
	}

	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public Xsbx getXsbx() {
		return xsbx;
	}

	public void setXsbx(Xsbx xsbx) {
		this.xsbx = xsbx;
	}

	public Jjqk getJjqk() {
		return jjqk;
	}

	public void setJjqk(Jjqk jjqk) {
		this.jjqk = jjqk;
	}

	public Gzxx getGzxx() {
		return gzxx;
	}

	public void setGzxx(Gzxx gzxx) {
		this.gzxx = gzxx;
	}
	
	public Wffzjl getWffzjl() {
		return wffzjl;
	}

	public void setWffzjl(Wffzjl wffzjl) {
		this.wffzjl = wffzjl;
	}

}
