package com.chinacreator.dwdj.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.StringArrayListHelper;
import com.chinacreator.dwdj.bean.DwBaseBean;
import com.chinacreator.dwdj.bean.DwOpLogBean;
import com.chinacreator.dwdj.bean.DwQsBean;
import com.chinacreator.dwdj.bean.DwtbBean;
import com.chinacreator.dwdj.bean.SssqdmBean;
import com.chinacreator.dwdj.query.DwOpQueryBean;
import com.chinacreator.dwdj.query.SssqQuery;
import com.chinacreator.dwdj.service.DwOpManagerService;
import com.chinacreator.zagl.query.DwQueryBean;

/**
 * 单位操作管理（单位派发 签收 退回）
 */
public class DwOpManagerAction extends CPSBaseAction {

	private static final long serialVersionUID = -2869811861503461380L;

	private DwBaseBean dwxx;
	private DwOpLogBean log;
	private DwOpQueryBean query;
	private DwOpManagerService service;
	
	private DwQueryBean dwcx;
	
	//单位签收信息
	private DwQsBean dwqs;
	
	// 危爆单位信息
	private DwtbBean wbdw;
	// 查询所属社区字典
	private SssqQuery sqquery;
	//社区代码
	private SssqdmBean sssqdm;
	private List<SssqdmBean> sssqlist;
	private	LoginInfo login = ActionContextHelper.getLoginInfo();
	
	private  List<SystemDictionaryBean> wxpdwflList;
	
	public List<SssqdmBean> getSssqlist() {
		return sssqlist;
	}

	public void setSssqlist(List<SssqdmBean> sssqlist) {
		this.sssqlist = sssqlist;
	}

	public List<SystemDictionaryBean> getWxpdwflList() {
		wxpdwflList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_WXPDWFL");
		return wxpdwflList;
	}

	public void setWxpdwflList(List<SystemDictionaryBean> wxpdwflList) {
		this.wxpdwflList = wxpdwflList;
	}

	public LoginInfo getLogin() {
		return login;
	}

	public void setLogin(LoginInfo login) {
		this.login = login;
	}

	public DwOpManagerAction(){
		super();
		dwxx = new DwBaseBean();
		log = new DwOpLogBean();
		query = new DwOpQueryBean();
		service = new DwOpManagerService();
		dwcx = new DwQueryBean();
		dwqs = new DwQsBean();
		wbdw = new DwtbBean();
		sqquery = new SssqQuery();
		sssqdm = new SssqdmBean();
		sssqlist = new ArrayList<SssqdmBean>();
	}
	
	/**
	 * 跳转到单位列表页面
	 * @return
	 */
	public String toDwOpListPage(){
		initQueryBean(query);
		return "toDwOpListPage";
	}
	
	/**
	 * 查询单位列表
	 */
	public void queryDwOpList(){
		responseWrite(service.queryDwOpList(query, getPageInfo()));
	}
	
	/**
	 * 跳转到单位操作页面（派发、签收、退回）
	 * @return
	 */
	public String toDwOpPage(){
		dwxx = service.queryDwxxByIdAndLx(query.getDwid(),query.getLx());
		log = new DwOpLogBean();
		if(CommonConstant.OPERTYPE_DETAIL.equals(operType)){
			log = service.queryNewDwOpLog(query);
		}else{
			log.setCzzt(query.getCzzt());
			if(CommonConstant.DW_OP_CZZT_PF.equals(query.getCzzt())){ //派发
				log.setYwxtzj(dwxx.getYwzjid());
				log.setYwxtlx(dwxx.getYwxtdwlx());
			}else if(CommonConstant.DW_OP_CZZT_TH.equals(query.getCzzt())){ //退回
				//点击退回时 先查询派发信息
				query.setCzzt(CommonConstant.DW_OP_CZZT_PF);
				log = service.queryNewDwOpLog(query);
				if(log == null){
					log = new DwOpLogBean();
					log.setYwxtlx(query.getLx());
					log.setYwxtzj(query.getDwid());
				}
				log.setCzzt(CommonConstant.DW_OP_CZZT_TH);
			}else if(CommonConstant.DW_OP_CZZT_QS.equals(query.getCzzt())){ //签收
				dwqs = new DwQsBean();
				dwqs.setDwxx(dwxx);
				dwqs.setLog(log);
			}
		}
		return "toDwOpPage";
	}
	
	/**
	 * 单位派发
	 */
	public void dwpf(){
		responseWrite(service.dwpf(log));
	}
	
	/**
	 * 单位签收
	 */
	public void dwqs(){
		responseWrite(service.dwqs(dwqs));
	}
	
	/**
	 * 单位退回
	 */
	public void dwth(){
		responseWrite(service.dwth(log));
	}
	
	/**
	 * 单位锁定管理（包含锁定于撤销）
	 */
	public void dwsdGl(){
		responseWrite(service.dwSdGl(query.getSdzt(), query.getDwid(), query.getLx()));
	}
	
	/**
	 * 跳转到单位选择页面
	 * @return
	 */
	public String toDwSelectPage(){
		initQueryBean(dwcx);
		return "toDwSelectPage";
	}
	/**
	 * 弹出新增危爆单位登记页面
	 * @return
	 */
	public String toAddWbdwPage(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){//操作类型为新增
			if(wbdw == null){
				wbdw = new DwtbBean();
			}
			//保存登记人信息
			wbdw.setDjrxm(login.getRealname());
			wbdw.setDjrjh(login.getUsername());
			wbdw.setDjdwdm(login.getOrgcode());
			wbdw.setDjdwmc(login.getOrgname());
			//登记时间
			wbdw.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));	
			// 1：省级用户 2：市级用户 3：县级用户 4：派出所用户  5：社区民警
			if(login.getLeve() == 1){
				wbdw.setDwdm(login.getOrgcode().substring(0, 2)+"0000000000");
			};
			if(login.getLeve() == 2){
				wbdw.setDwdm(login.getOrgcode().substring(0, 4)+"00000000");
			};
			if(login.getLeve() == 3){
				wbdw.setDwdm(login.getOrgcode().substring(0, 6)+"000000");
			};
			if(login.getLeve() == 4){
				wbdw.setDwdm(login.getOrgcode().substring(0, 8)+"0000");
			};
			if(login.getLeve() == 5){
				wbdw.setDwdm(login.getOrgcode());
			};
		}
		else				//修改信息或者查看信息
		{	//根据编号，获得该编号明细
			try {
				// 预留
				//wbdw = service.queryBeanById(DwtbBean.class, id, "queryDwtbBeanBYIdSQL");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "toAddWbdwPage";
	}
	/**
	 * 保存危爆单位信息
	 */
	public void saveWbdwBean(){
		boolean msgss = false ; //标志是否保存成功
		try {
			String sql = "";
			if (!"".equals(wbdw.getYwzjid()) ){
				// 修改
				if (CommonConstant.OPERTYPE_UPDATE.equals(operType)){
					sql = "updateWbdwSQL";
				}
			}else{
				// 新增
				sql ="insertWbdwSQL";
				// 获得主键id
				StringBuffer sbf = new StringBuffer();
				sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
				sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
				sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_WBDWID"));
				wbdw.setYwzjid(sbf.toString());
				wbdw.setJlbh("WP"+sbf.toString());
				wbdw.setDwfl(StringArrayListHelper.converStringArrayToStr(wbdw.getDwfls(), ","));
				
				/**
				 *  wbdw.setDjdwdm(login.getOrgcode());
					wbdw.setDjdwmc(login.getOrgname());
					wbdw.setDjrxm(login.getRealname());
					wbdw.setDjrjh(login.getUsername());
					wbdw.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				 */
				wbdw.setZxbs("0");
			}	
			msgss = service.saveBean(wbdw, sql, operType);
			if(!msgss){
				wbdw.setYwzjid("");
			}
			responseWrite(wbdw);
		} catch (Exception e) {
			responseWrite(msgss);
			e.printStackTrace();
		}
	}
	/**
	 * 选择所属社区字典
	 */
	public void querySssqlist(){
		sqquery.setPcsdm(wbdw.getSszrdwdm());
		if(!"0000".equals(sqquery.getPcsdm().substring(8, 12))){
			sqquery.setSssqdm(sqquery.getPcsdm());
		};
		sssqlist = service.querySssqByPcsdm(sqquery);
		this.responseWrite(sssqlist);
	}
	
/*********************** GETER AND SETER *****************************/	
	public DwBaseBean getDwxx() {
		return dwxx;
	}
	
	public void setDwxx(DwBaseBean dwxx) {
		this.dwxx = dwxx;
	}

	public DwOpLogBean getLog() {
		return log;
	}

	public void setLog(DwOpLogBean log) {
		this.log = log;
	}

	public DwOpQueryBean getQuery() {
		return query;
	}

	public void setQuery(DwOpQueryBean query) {
		this.query = query;
	}

	public DwQueryBean getDwcx() {
		return dwcx;
	}

	public void setDwcx(DwQueryBean dwcx) {
		this.dwcx = dwcx;
	}

	public DwQsBean getDwqs() {
		return dwqs;
	}

	public void setDwqs(DwQsBean dwqs) {
		this.dwqs = dwqs;
	}

	public DwtbBean getWbdw() {
		return wbdw;
	}

	public void setWbdw(DwtbBean wbdw) {
		this.wbdw = wbdw;
	}

	public SssqQuery getSqquery() {
		return sqquery;
	}

	public void setSqquery(SssqQuery sqquery) {
		this.sqquery = sqquery;
	}

	public SssqdmBean getSssqdm() {
		return sssqdm;
	}

	public void setSssqdm(SssqdmBean sssqdm) {
		this.sssqdm = sssqdm;
	}
}
