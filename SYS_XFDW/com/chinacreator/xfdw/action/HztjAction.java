package com.chinacreator.xfdw.action;

import java.sql.SQLException;
import java.util.List;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.xfdw.bean.HzldBean;
import com.chinacreator.xfdw.bean.QueryBean;
import com.chinacreator.xfdw.service.HztjService;

public class HztjAction  extends CPSBaseAction{

	private static final long serialVersionUID = 1L;

	private QueryBean tjBean;
	private HzldBean hzBean;
	
	public HztjAction(){
		tjBean = new QueryBean();
		hzBean = new HzldBean();
	}
	
	/**
	 * 火灾统计
	 * @return
	 */
	public String toHztjList(){
		try {
			List<HzldBean> resultInfo = HztjService.getInstance().queryHztj(tjBean);
			if(resultInfo.size()>3){
				request.setAttribute("hztjList", resultInfo);
				request.setAttribute("leve", (Integer.parseInt(tjBean.getLeve())+1)+"");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "toHztjList";
	}
	/**
	 * 火灾统计详情
	 * @return
	 */
	public String toHzxqList(){
		return "toHzxqList";
	}
	
	public void queryHzxqList(){
		try {
			responseWrite(HztjService.getInstance().queryHzxq(tjBean, getPageInfo()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public QueryBean getTjBean() {
		return tjBean;
	}

	public void setTjBean(QueryBean tjBean) {
		this.tjBean = tjBean;
	}

	public HzldBean getHzBean() {
		return hzBean;
	}

	public void setHzBean(HzldBean hzBean) {
		this.hzBean = hzBean;
	}
	
}
