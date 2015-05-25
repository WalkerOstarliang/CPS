package com.chinacreator.rhzf.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.rhzf.bean.ExpRhzfBean;
import com.chinacreator.rhzf.bean.RhzfBean;
import com.chinacreator.rhzf.bean.ZfryBean;
import com.chinacreator.rhzf.query.RhzfQuery;
import com.chinacreator.rhzf.service.RhzfService;
import com.chinacreator.rhzf.service.impl.RhzfServiceImpl;

/**
 * 入户走访管理Ation
 */
public class RhzfManageAction extends CPSBaseAction {

	private static final long serialVersionUID = 7444725592473656280L;
	
	/**
	 * 入户走访信息
	 */
	private RhzfBean zfxx;
	
	/**
	 * 走访人员
	 */
	private List<ZfryBean> zfryList;
	
	private RhzfQuery query;
	
	private RhzfService service;
	
	private List<ExpRhzfBean> expList;
	
	public RhzfManageAction(){
		super();
		zfxx = new RhzfBean();
		zfryList = new ArrayList<ZfryBean>();
		service = new RhzfServiceImpl();
		query = new RhzfQuery();
		expList = new ArrayList<ExpRhzfBean>();
	}

	/**
	 * 保存入户走访
	 */
	public void saveRhzf(){
		responseWrite(service.saveZfxx(zfxx, operType));
	}
	
	/**
	 * 刷新走访人员列表
	 */
	public void refreshZfryList(){
		if(ValidateHelper.isNotEmptyString(query.getId())){
			responseWrite(service.queryZfryListByZfid(query.getId()));
		}else{
			responseWrite(service.queryZfryListByDzid(query.getDzid()));
		}
	}
	
	/**
	 * 跳转到入户走访列表页面
	 * @return
	 */
	public String toRhzfListPage(){
		initQueryBean(query);
		return "toRhzfListPage";
	} 
	
	/**
	 * 跳转到入户走访详细信息页面
	 * @return
	 */
	public String toRhzfInfoPage(){
		if(ValidateHelper.isNotEmptyString(query.getId())){
			zfxx = service.queryZfxxBeanByZfid(query.getId());
		}else{
			LoginInfo loginUser = ActionContextHelper.getLoginInfo();
			zfxx.setZfrxm(loginUser.getRealname());
			zfxx.setZfrjh(loginUser.getUsername());
			zfxx.setZfsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		}
		return "toRhzfInfoPage";
	}
	
	public String expRgzf(){
		expList = service.excRhzf(query);
		return "expRgzf";
	}
	
	/**
	 * 分页查询入户走访
	 */
	public void queryRhzfList(){
		responseWrite(service.queryRhzfList(query, getPageInfo()));
	}
	
	public RhzfBean getZfxx() {
		return zfxx;
	}

	public void setZfxx(RhzfBean zfxx) {
		this.zfxx = zfxx;
	}

	public List<ZfryBean> getZfryList() {
		return zfryList;
	}

	public void setZfryList(List<ZfryBean> zfryList) {
		this.zfryList = zfryList;
	}

	public RhzfQuery getQuery() {
		return query;
	}

	public void setQuery(RhzfQuery query) {
		this.query = query;
	}

	public List<ExpRhzfBean> getExpList() {
		return expList;
	}

	public void setExpList(List<ExpRhzfBean> expList) {
		this.expList = expList;
	}
}
