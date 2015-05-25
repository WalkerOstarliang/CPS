package com.chinacreator.afgl.zaxl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.zaxl.bean.ZaxlBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlPcdxBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlQueryBean;
import com.chinacreator.afgl.zaxl.bean.ZaxlRyBean;
import com.chinacreator.afgl.zaxl.service.ZaxlService;
import com.chinacreator.afgl.zaxl.service.impl.ZaxlServiceImpl;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 治安巡逻
 */
public class ZaxlAction extends CPSBaseAction {
	private static final long serialVersionUID = -6861161262119680086L;
	
	private ZaxlBean zaxl;
	private ZaxlRyBean zaxlry ;
	private ZaxlPcdxBean zaxlpcdx ;
	private List<ZaxlRyBean> zaxlrymjlist ;
	private ZaxlQueryBean query;
	
	private ZaxlService service;
	
	public ZaxlAction(){
		super();
		zaxl = new ZaxlBean();
		zaxlry = new ZaxlRyBean();
		zaxlpcdx = new ZaxlPcdxBean();
		zaxlrymjlist = new ArrayList<ZaxlRyBean>();
		query = new ZaxlQueryBean();
		service = new ZaxlServiceImpl();
	}
	
	/**
	 * 保存治安巡逻
	 */
	public void saveZaxl(){
		responseWrite(service.saveZaxl(zaxl, operType));
	}
	
	/**
	 * 跳转到治安巡逻详细信息页面
	 */
	public String toZaxlInfoPage(){
		if(ValidateHelper.isNotEmptyString(query.getId())){
			zaxl = service.queryZaxlBeanById(query.getId());
		}
		return "toZaxlInfoPage";
	}
	
	/**
	 * 跳转到治安巡逻列表页面
	 */
	public String toZaxlListPage(){
		initQueryBean(query);
		return "toZaxlListPage";
	}
	
	/**
	 * 分页查询治安巡逻列表
	 */
	public void queryZaxlList(){
		responseWrite(service.queryZaxlList(query, getPageInfo()));
	}

	/**
	 * 分页查询治安巡逻人员列表
	 */
	public void queryZaxlryList(){
		query.setId(zaxl.getId());
		responseWrite(service.queryZaxlryList(query, getPageInfo()));
	}
	/**
	 * 保存治安巡逻民警信息
	 */
	public void saveZaxlryMj(){
		if(zaxlrymjlist != null){
			service.saveZaxlryMjlist(zaxlrymjlist);
		}
	}
	/**
	 * 根据ID注销巡逻人员信息
	 */
	public void cancelZaxlryById(){
		service.cancelZaxlryById(query);
	}
	
	/**
	 * 弹出选择巡逻民警信息列表页面
	 * @return
	 */
	public String toOpenXlMjSelectPage(){
		initQueryBean(query);
		return "toOpenXlMjSelectPage";
	}
	
	/**
	 * 分页查询巡逻民警列表
	 */
	public void queryXlmjPageResult(){
		initQueryBean(query);
		responseWrite(service.queryXlmjlList(query, getPageInfo()));
	}
	/**
	 * 保存治安巡逻-巡逻民警信息
	 */
	public void saveXlMjxx(){
		zaxlry.setZw("2") ;
		zaxlrymjlist.add(zaxlry);
		service.saveZaxlryMjlist(zaxlrymjlist);
	}
	/**
	 * 保存治安巡逻-社区干部
	 */
	public void saveSqgbxx(){
		zaxlry.setZw("3") ;
		zaxlrymjlist.add(zaxlry);
		service.saveZaxlryMjlist(zaxlrymjlist);
	}
	/**
	 * 跳转到社区干部选择
	 * @return
	 */
	public String toOpenSqgbSelectPage(){
		initQueryBean(query);
		return "toOpenSqgbSelectPage";
	}
	
	/**
	 * 分页查询社区干部
	 */
	public void queryXlsqgbPageResult(){
		initQueryBean(query);
		responseWrite(service.querySqgblList(query, getPageInfo()));
	}
	/**
	 * 弹出巡逻人员登记
	 * @return
	 */
	public String toOpenZaxlryInfo(){
		zaxlry.initDjxx();
		zaxlry.initCzxx();
		return "toOpenZaxlryInfo" ;
	}
	/**
	 * 保存巡逻人员信息
	 */
	public void saveXlryxxInfoBean(){
		zaxlry.setZw("4");
		zaxlrymjlist.add(zaxlry);
		service.saveZaxlryMjlist(zaxlrymjlist);
	}
	
	/**
	 * 分页查询治安巡逻--盘查人员列表
	 */
	public void queryZaxlpcryList(){
		query.setId(zaxl.getId());
		responseWrite(service.queryZaxlpcryList(query, getPageInfo()));
	}
	/**
	 * 弹出治安盘查-- 盘查人员登记页面
	 * @return
	 */
	public String toOpenZaxlpcryInfo(){
		zaxlpcdx.initCzxx();
		zaxlpcdx.initDjxx();
		return "toOpenZaxlpcryInfo";
	}
	/**
	 * 保存治安盘查--盘查人员信息
	 */
	public void saveXlpcryxxInfoBean(){
		service.saveXlpcryxxInfoBean(zaxlpcdx);
	}
	/**
	 * 注销盘查人员
	 */
	public void cancelZaxlrpcryById(){
		service.cancelZaxlrpcryById(query);
	}
	
	public ZaxlBean getZaxl() {
		return zaxl;
	}

	public void setZaxl(ZaxlBean zaxl) {
		this.zaxl = zaxl;
	}

	public ZaxlQueryBean getQuery() {
		return query;
	}

	public void setQuery(ZaxlQueryBean query) {
		this.query = query;
	}

	public ZaxlRyBean getZaxlry() {
		return zaxlry;
	}

	public void setZaxlry(ZaxlRyBean zaxlry) {
		this.zaxlry = zaxlry;
	}

	public ZaxlPcdxBean getZaxlpcdx() {
		return zaxlpcdx;
	}

	public void setZaxlpcdx(ZaxlPcdxBean zaxlpcdx) {
		this.zaxlpcdx = zaxlpcdx;
	}

	public List<ZaxlRyBean> getZaxlrymjlist() {
		return zaxlrymjlist;
	}

	public void setZaxlrymjlist(List<ZaxlRyBean> zaxlrymjlist) {
		this.zaxlrymjlist = zaxlrymjlist;
	}
}
