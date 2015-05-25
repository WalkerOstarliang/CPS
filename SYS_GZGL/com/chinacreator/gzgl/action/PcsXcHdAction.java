package com.chinacreator.gzgl.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.PcsXcHdBean;
import com.chinacreator.gzgl.bean.PcsXcHdTjBean;
import com.chinacreator.gzgl.query.PcsXcHdQuery;
import com.chinacreator.gzgl.service.PcsXcHdService;
import com.chinacreator.gzgl.service.impl.PcsXcHdServiceImpl;

/**
 * 派出所宣传活动
 *
 */
public class PcsXcHdAction extends CPSBaseAction {

	private static final long serialVersionUID = -720597524576790548L;
	
	
	private PcsXcHdBean xchd;
	
	private PcsXcHdQuery query;
	
	private PcsXcHdService service;
	
	private LoginInfo loginInfo;
	
	/**
	 * 派出所宣传统计
	 */
	private List<PcsXcHdTjBean> xchdTjList;
	
	/**
	 * 照片ID
	 */
	private String zpid;

	public PcsXcHdAction() {
		super();
		xchd = new PcsXcHdBean();
		query = new PcsXcHdQuery();
		service = new PcsXcHdServiceImpl();
		loginInfo = ActionContextHelper.getLoginInfo();
		
		xchdTjList = new ArrayList<PcsXcHdTjBean>();
	}

	/**
	 * 跳转到派出所宣传活动列表页面
	 * @return
	 */
	public String toPcsXcHdListPage(){
		initQueryBean(query);
		return "toPcsXcHdListPage"; 
	}
	
	/**
	 * 跳转到派出所宣传活动统计页面
	 * @return
	 */
	public String toPcsXcHdTjPage(){
		xchdTjList = service.queryPcsXcHdTj(query);
		return "toPcsXcHdTjPage";
	}
	
	/**
	 * 跳转到派出所宣传活动详细信息页面
	 * @return
	 */
	public String toPcsXcHdInfoPage(){
		if(ValidateHelper.isNotEmptyString(query.getId())){
			xchd = service.queryPcsXchdById(query.getId());
		}else{
			xchd = new PcsXcHdBean();
			xchd.setHdkzdwdm(loginInfo.getOrgcode());
			xchd.setHdkzdwmc(loginInfo.getOrgname());
			xchd.setHdkzmjjh(loginInfo.getUsername());
			xchd.setHdkzmjxm(loginInfo.getRealname());
		}
		
		return "toPcsXcHdInfoPage";
	}
	
	/**
	 * 保存派出所宣传活动
	 */
	public void savePcsXcHd(){
		responseWrite(service.saveXchd(xchd));
	}
	
	/**
	 * 注销派出所宣传活动
	 */
	public void deletePcsXcHd(){
		if(service.deletePcsXchd(xchd)){
			responseWrite("注销成功.");
		}else{
			responseWrite("注销失败");
		}
	}
	
	/**
	 * 查询宣传活动列表
	 */
	public void queryPcsXcHdList(){
		responseWrite(service.queryPcsXchdList(query, getPageInfo()));
	}
	
	/**
	 * 保存活动照片
	 */
	public void saveHdzp(){
		responseWrite(service.insertXchdZp(xchd));
	}
	
	/**
	 * 显示活动照片
	 */
	public void showHdZp(){
		InputStream is = null;
		OutputStream os = null;
		try {
			os = response.getOutputStream();
			Blob hdZp = service.queryHdZpById(zpid);
			if (hdZp != null)
			{
				is = hdZp.getBinaryStream();
				byte[] b = new byte[1024];
				while (is.read(b) > 0) 
				{
					os.write(b);
					os.flush();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
				os.close();
			} catch (IOException e) {
			}
		}
	}
	
	/**
	 * 根据照片ID删除照片
	 */
	public void deleteZpById(){
		responseWrite(service.deleteHdZpById(zpid));
	}
	/************************GETER AND SETER***************************/
	public PcsXcHdBean getXchd() {
		return xchd;
	}

	public void setXchd(PcsXcHdBean xchd) {
		this.xchd = xchd;
	}

	public PcsXcHdQuery getQuery() {
		return query;
	}

	public void setQuery(PcsXcHdQuery query) {
		this.query = query;
	}

	public String getZpid() {
		return zpid;
	}

	public void setZpid(String zpid) {
		this.zpid = zpid;
	}

	public List<PcsXcHdTjBean> getXchdTjList() {
		return xchdTjList;
	}

	public void setXchdTjList(List<PcsXcHdTjBean> xchdTjList) {
		this.xchdTjList = xchdTjList;
	}
}
