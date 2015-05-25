package com.chinacreator.nbgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.nbgl.bean.AjtjByDwflBean;
import com.chinacreator.nbgl.bean.NbdwfaQueryBean;
import com.chinacreator.nbgl.bean.NbfatjBean;
import com.chinacreator.nbgl.service.NbdwtjService;
import com.chinacreator.nbgl.service.impl.NbdwtjServiceImpl;
/**
 * 内保单位发案统计
 * @author Administrator
 *
 */
public class NbfatjAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8148030698987554612L;

	private NbdwfaQueryBean query ;  //    统计条件
	private List<NbfatjBean> fatjlist ; // 统计结果集
	private NbdwtjService  service ; 
	
	private List<AjtjByDwflBean> ajtj_dwfl;
	
	public NbfatjAction(){
		super();
		query = new NbdwfaQueryBean();
		fatjlist = new ArrayList<NbfatjBean>();
		service = new NbdwtjServiceImpl();
		
		ajtj_dwfl = new ArrayList<AjtjByDwflBean>();
	}
	/**
	 * 跳转到内保单位发案统计页面
	 * @return
	 */
	public String toNbdwfaTjListPage(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		query.setDjdwdm(loginInfo.getCitygajgdm());
		return  "toNbdwfaTjListPage" ;
	}
	/**
	 * 内保单位发案统计结果
	 */
	public void queryNbdwfaTjList(){
		fatjlist = service.queryNbdwfatjlist(query);
		this.responseWrite(fatjlist);
	}
	/**
	 * 导出内保单位发案统计结果
	 * @return
	 */
	public String toExportExcelNbdwfatjInfoPage(){
		fatjlist = service.queryNbdwfatjlist(query);
		return "toExportExcelNbdwfatjInfoPage" ;
	}

	/**
	 * 根据单位分类统计案件
	 * @return
	 */
	public String toAjtjByDwfl(){
		return "toAjtjByDwfl";
	}
	
	public String toAjtjByDwflData(){
		ajtj_dwfl = service.queryAjtjByDwfl(query);
		return "toAjtjByDwflData";
	}
	
	public NbdwfaQueryBean getQuery() {
		return query;
	}

	public void setQuery(NbdwfaQueryBean query) {
		this.query = query;
	}

	public List<NbfatjBean> getFatjlist() {
		return fatjlist;
	}

	public void setFatjlist(List<NbfatjBean> fatjlist) {
		this.fatjlist = fatjlist;
	}
	public List<AjtjByDwflBean> getAjtj_dwfl() {
		return ajtj_dwfl;
	}
	public void setAjtj_dwfl(List<AjtjByDwflBean> ajtjDwfl) {
		ajtj_dwfl = ajtjDwfl;
	}
}
