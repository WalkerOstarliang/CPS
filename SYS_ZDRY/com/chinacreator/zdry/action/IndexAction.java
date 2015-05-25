package com.chinacreator.zdry.action;

import org.apache.commons.lang.StringUtils;
import com.chinacreator.common.action.PaginationAction;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.zdry.bean.Lcsqxx;
import com.chinacreator.zdry.query.LgdqtxQueryBean;
import com.chinacreator.zdry.query.StatisticsQueryBean;
import com.chinacreator.zdry.services.IndexService;

/**
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(首页Action类)
 * @date Mar 7, 2013 2:09:10 PM
 */
public class IndexAction extends PaginationAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5071883074642916971L;

	private LgdqtxQueryBean lgdqtx;
	
	private Lcsqxx lcsqxx;
	
	private StatisticsQueryBean statisticsQueryBean;
	
	/**
	 * 列管到期提醒
	 */
	public void queryLgdqtx() {
		// 获取参数type，无参数及显示最近五条数据，有参数则分页显示，每页显示10条。
		String type = this.getRequest().getParameter("type");
		PageInfo pageInfo = getPageInfo();

		if (StringUtils.isBlank(type)) {
			pageInfo.setPageSize(5);
		}
		IndexService indexService = new IndexService();

		try {
			PageResultInfo<LgdqtxQueryBean> pageResultInfo = indexService.queryLgdqtxList(lgdqtx, pageInfo);
			responseWrite(pageResultInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 列管审批提醒
	 */
	public void queryLgsqtx(){
		// 获取参数type，无参数及显示最近五条数据，有参数则分页显示，每页显示10条。
		String type = this.getRequest().getParameter("type");
		PageInfo pageInfo = getPageInfo();

		if (StringUtils.isBlank(type)) {
			pageInfo.setPageSize(5);
		}
		IndexService indexService = new IndexService();
		
		if(lcsqxx == null){
			lcsqxx = new Lcsqxx();
		}

		try {
			PageResultInfo<Lcsqxx> pageResultInfo = indexService.queryLgsqtxList(lcsqxx, pageInfo);
			responseWrite(pageResultInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public LgdqtxQueryBean getLgdqtx() {
		return lgdqtx;
	}

	public void setLgdqtx(LgdqtxQueryBean lgdqtx) {
		this.lgdqtx = lgdqtx;
	}
	
	public Lcsqxx getLcsqxx() {
		return lcsqxx;
	}

	public void setLcsqxx(Lcsqxx lcsqxx) {
		this.lcsqxx = lcsqxx;
	}

	public StatisticsQueryBean getStatisticsQueryBean() {
		return statisticsQueryBean;
	}

	public void setStatisticsQueryBean(StatisticsQueryBean statisticsQueryBean) {
		this.statisticsQueryBean = statisticsQueryBean;
	}


}
