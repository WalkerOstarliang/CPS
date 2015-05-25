package com.chinacreator.zdry.services;

import java.util.Date;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.zdry.bean.CrimePersonnel;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.constant.ZdryConstant;
import com.chinacreator.zdry.dao.CollectDao;
import com.chinacreator.zdry.dao.CrimeDao;
import com.chinacreator.zdry.query.CrimePersonnelQueryBean;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(犯罪人员逻辑层类)
 * @date Mar 18, 2013 9:54:35 AM
 */
public class CrimeService implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1319457394451387893L;
	
	public PageResultInfo<CrimePersonnel> queryCrimePersonnel(CrimePersonnelQueryBean personnel,PageInfo pageInfo) throws Exception{
		return CrimeDao.queryCrimePersonnelList(personnel, pageInfo);
	}
	
	public CrimePersonnel queryByIdCrimeDetails(String bh) throws Exception{
		return CrimeDao.queryByIdCrimeDetails(bh);
	}
	
	public void crimeTqInfo(String bh) throws Exception{
		//根据BH查询主键犯罪人员信息
		CrimePersonnel crimePersonnel = CrimeDao.queryByIdCrimeDetails(bh);
		
		Keypersonnel personnel = CollectDao.queryBySfzhPersonnel(crimePersonnel.getSfzh());
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		
		if(personnel == null){
			Keypersonnel keypersonnel = new Keypersonnel();
			keypersonnel.setSfzh(crimePersonnel.getSfzh());
			keypersonnel.setAjlx(crimePersonnel.getAjlb());
			Date csrq = DateTimeHelper.convertToDate(crimePersonnel.getCsrq(), "yyyy-MM-dd");
			keypersonnel.setCsrq(csrq);
			keypersonnel.setDjdwdm(loginInfo.getOrgcode());
			keypersonnel.setDjdwmc(loginInfo.getOrgname());
			keypersonnel.setDjrxm(loginInfo.getRealname());
			keypersonnel.setHjdxz(crimePersonnel.getHjdxz());
			keypersonnel.setHjdxzqh(crimePersonnel.getHjdqh());
			keypersonnel.setIsgk(ZdryConstant.ZDRY_ISGK_YLG);
			keypersonnel.setLgly(ZdryConstant.ZDRY_LGLY_FZRYRL);
			keypersonnel.setMz(crimePersonnel.getMz());
			keypersonnel.setPcsdm(crimePersonnel.getPcsdm());
			keypersonnel.setRylx(crimePersonnel.getRylx());
			keypersonnel.setSspcsdm(crimePersonnel.getSspcsdm());
			keypersonnel.setSspcsmc(crimePersonnel.getSspcsmc());
			keypersonnel.setWhcd(crimePersonnel.getWwcd());
			keypersonnel.setXb(crimePersonnel.getXb());
			keypersonnel.setXm(crimePersonnel.getXm());
			keypersonnel.setXzdqh(crimePersonnel.getHjdqh());
			keypersonnel.setXzdxz(crimePersonnel.getHjdxz());
			keypersonnel.setZrdwdm(loginInfo.getOrgcode());
			keypersonnel.setZrdwmc(loginInfo.getOrgname());
			keypersonnel.setZrrlxdh(loginInfo.getTelephone());
			keypersonnel.setZrrxm(loginInfo.getRealname());
			keypersonnel.setZzmh(crimePersonnel.getZzmm());
			
			//往重点人员信息表里面插入数据
			CollectDao.insertZdryjbxx(keypersonnel);
		}
		
		//更改认领状态
		crimePersonnel = new CrimePersonnel();
		crimePersonnel.setBh(bh);
		crimePersonnel.setIsrl(ZdryConstant.ZDRY_RLZT_YRL);
		crimePersonnel.setRlrxm(loginInfo.getRealname());
		crimePersonnel.setRldwdm(loginInfo.getOrgcode());
		crimePersonnel.setRldwmc(loginInfo.getOrgname());
		CrimeDao.updateCrimeInfo(crimePersonnel);
	}
}
