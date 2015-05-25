package com.chinacreator.afgl.action;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.afgl.bean.SqjwsxxBean;
import com.chinacreator.afgl.query.SqjwsxxQuery;
import com.chinacreator.afgl.services.SqjwsxxService;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;

/**
 * 社区警务室信息
 */
public class SqjwsxxAction extends CPSBaseAction{

	private static final long serialVersionUID = 7309901752134378580L;

	private SqjwsxxService sqjwsxxService;
	private SqjwsxxBean sqjwsxxBean;
	private SqjwsxxQuery sqjwsxxQuery;
	private List<SqjwsxxBean> sqjwsxxList;
	protected String operType;
	
	public SqjwsxxAction(){
		sqjwsxxService = new SqjwsxxService();
		sqjwsxxBean = new SqjwsxxBean();
		sqjwsxxQuery = new SqjwsxxQuery();
		sqjwsxxList = new ArrayList<SqjwsxxBean>();
	}
	
	/**
	 * 跳转到社区警务室信息列表
	 */
	public String toSqjwsxxList(){
		initQueryBean(sqjwsxxQuery);
		return "toSqjwsxxList";
	}
	
	/**
	 * 查询社区警务室信息列表并写到页面
	 */
	public void sqjwsxxList() throws Exception{
		PageResultInfo<SqjwsxxBean> sqjwsxxResultInfo= sqjwsxxService.sqjwsxxList(getPageInfo(), sqjwsxxQuery);
		responseWrite(sqjwsxxResultInfo);
	}
	
	/**
	 * 提交社区警务室表单
	 * @return
	 */
	public void addSqjwsxx() throws Exception{
		//sqjwsxxService.addSqjwsxx(sqjwsxxBean);
		sqjwsxxService.seveSqjwsxxBean(sqjwsxxBean, operType);
	}
	
	/**
	 * 跳转到修改社区警务室信息页面
	 * @return
	 */
	public String toAddSqjwsxx() throws Exception{
		System.out.print(operType);
		if(null != operType && !operType.equals("add")) {
			sqjwsxxBean = sqjwsxxService.getSqjwsxxByJwsdm(sqjwsxxQuery);
		}
		return "toUpdateSqjwsxxByJwsdm";
	}
	
	
	/**
	 * 查看社区警务室信息
	 * @return
	 */
	public String viewSqjwsxxByJwsdm() throws Exception{
		sqjwsxxBean = sqjwsxxService.getSqjwsxxByJwsdm(sqjwsxxQuery);
		return "viewSqjwsxxByJwsdm";
	}
	
	/**
	 * 得到社区警务室信息
	 * @return
	 */
	public void getSqjwsxxByJwsdm() throws Exception{
		sqjwsxxBean = sqjwsxxService.getSqjwsxxByJwsdm(sqjwsxxQuery);
		responseWrite(sqjwsxxBean);
	}

	/**
	 * 跳转到选择社区警务室信息列表
	 * @return
	 */
	public String toSelectSqjwsxx(){
		initQueryBean(sqjwsxxQuery);
		return "toSelectSqjwsxx";
	}
	
	/**
	 * 跳转到高级查询社区警务室信息列表
	 * @return
	 */
	public String toGjQuerySqjwsxx(){
		initQueryBean(sqjwsxxQuery);
		return "toGjQuerySqjwsxx";
	}

	public SqjwsxxBean getSqjwsxxBean() {
		return sqjwsxxBean;
	}

	public void setSqjwsxxBean(SqjwsxxBean sqjwsxxBean) {
		this.sqjwsxxBean = sqjwsxxBean;
	}

	public SqjwsxxQuery getSqjwsxxQuery() {
		return sqjwsxxQuery;
	}

	public void setSqjwsxxQuery(SqjwsxxQuery sqjwsxxQuery) {
		this.sqjwsxxQuery = sqjwsxxQuery;
	}

	public List<SqjwsxxBean> getSqjwsxxList() {
		return sqjwsxxList;
	}

	public void setSqjwsxxList(List<SqjwsxxBean> sqjwsxxList) {
		this.sqjwsxxList = sqjwsxxList;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}
	
	
}
