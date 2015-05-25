package com.chinacreator.zdry.action;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.query.KeypersonnelQueryBean;
import com.chinacreator.zdry.services.ControlService;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(在控管理Action类)
 * @date Mar 6, 2013 10:47:35 AM
 */
public class ControlAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7912011908380982511L;
	
	private KeypersonnelQueryBean key;
	
	public String toControlZdryzkdjPage()
	{
		if (key == null)
		{
			key = new KeypersonnelQueryBean();
		}
		return "toControlZdryzkdjPage";
 	}
	
	/**
	 * 查询重点人员信息
	 */
	public void queryKeyPersonnel(){
		ControlService controlService = new ControlService();
		PageInfo pageInfo = getPageInfo();
		if(key == null){
			 key =  new KeypersonnelQueryBean();
		}
		try {
			PageResultInfo<Keypersonnel> pageResultInfo = controlService.queryKeyPersonnel(key, pageInfo);
			responseWrite(pageResultInfo);
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
}
