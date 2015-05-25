package com.chinacreator.zdry.action;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.zdry.bean.CrimePersonnel;
import com.chinacreator.zdry.query.CrimePersonnelQueryBean;
import com.chinacreator.zdry.services.CrimeService;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(犯罪人员Action类)
 * @date Mar 18, 2013 9:52:35 AM
 */
public class CrimeAction extends CPSBaseAction{

	private static final long serialVersionUID = 3204363054122471734L;
	
	private CrimePersonnelQueryBean crime;

	/**
	 * 打开犯罪人员详情页面
	 */
	public String toCrimeDetailsPage(){
		String bh = this.getRequest().getParameter("bh");
		CrimeService crimeService = new CrimeService();
		try {
			CrimePersonnel crimePersonnel = crimeService.queryByIdCrimeDetails(bh);
			this.getRequest().setAttribute("crimePersonnel", crimePersonnel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toCrimeDetailsPage";
	}
	
	/**
	 * 查询认罪人员信息
	 */
	public void queryCrimePersonnel(){
		CrimeService service = new CrimeService();
		PageInfo pageInfo = getPageInfo();
		
		if(crime == null){
			crime =  new CrimePersonnelQueryBean();
		}
		
		try {
			PageResultInfo<CrimePersonnel> pageResultInfo = service.queryCrimePersonnel(crime, pageInfo);
			responseWrite(pageResultInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳转犯罪人员认领，并初始化数据
	 * @return
	 */
	public String toCrimeFzryInfoPage()
	{
		if (crime == null)
		{
			crime = new CrimePersonnelQueryBean();
		}
		return "toCrimeFzryInfoPage";
 	}
	
	/**
	 * 犯罪人员信息提取
	 */
	public void crimeTqInfo(){
		String bh = this.getRequest().getParameter("bh");
		CrimeService crimeService = new CrimeService();
		boolean flag = true;
		try {
			crimeService.crimeTqInfo(bh);
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}finally{
			this.responseWrite(flag);
		}
	}
	
	public CrimePersonnelQueryBean getCrime() {
		return crime;
	}

	public void setCrime(CrimePersonnelQueryBean crime) {
		this.crime = crime;
	}
	
}
