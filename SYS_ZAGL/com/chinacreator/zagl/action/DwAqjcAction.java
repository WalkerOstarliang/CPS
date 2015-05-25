package com.chinacreator.zagl.action;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.zagl.bean.NbdwaqjcBean;
import com.chinacreator.zagl.services.DwAqjcService;
import com.chinacreator.zagl.services.impl.DwAqjcServiceImpl;

public class DwAqjcAction extends CPSBaseAction{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7639349610296839635L;
	private NbdwaqjcBean nbAqjcBean;
	private DwAqjcService aqjcService;
	
	public DwAqjcAction(){
		nbAqjcBean =  new NbdwaqjcBean();
		aqjcService =  new DwAqjcServiceImpl();
	}
	
	/**
	 * 跳转到内保单位
	 * @return
	 */
	public String toNbDWAqjcPage(){
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		nbAqjcBean.setDjrjh(loginInfo.getUsername());
		nbAqjcBean.setDjrxm(loginInfo.getRealname());
		nbAqjcBean.setDjdwdm(loginInfo.getOrgcode());
		nbAqjcBean.setDjdwmc(loginInfo.getOrgname());
		nbAqjcBean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		nbAqjcBean.setCzrjh(loginInfo.getUsername());
		nbAqjcBean.setCzrxm(loginInfo.getRealname());
		nbAqjcBean.setCzdwdm(loginInfo.getOrgcode());
		nbAqjcBean.setCzdwmc(loginInfo.getOrgname());
		nbAqjcBean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		return "toNbDWAqjcPage";
	}

	/**
	 * 保存数据
	 * @return
	 */
	public void saveNbDwAqjcInfo(){
		if(ValidateHelper.isEmptyString(nbAqjcBean.getId())){
			aqjcService.insertAqjcBean(nbAqjcBean);
			responseWrite(true);
		}else{
			aqjcService.updateAqjcBean(nbAqjcBean);
			responseWrite(true);
		}
	}
	
	/**
	 * 根据检查单位分页查询安全检查
	 */
	public void queryNbDwAqjcList(){
		PageResultInfo<NbdwaqjcBean> list = aqjcService.queryNbAqjcPageInfoByJcdwdm(nbAqjcBean.getJcdwdm(), getPageInfo());
		responseWrite(list);
	}
	
	public NbdwaqjcBean getNbAqjcBean() {
		return nbAqjcBean;
	}

	public void setNbAqjcBean(NbdwaqjcBean nbAqjcBean) {
		this.nbAqjcBean = nbAqjcBean;
	}
	
}
