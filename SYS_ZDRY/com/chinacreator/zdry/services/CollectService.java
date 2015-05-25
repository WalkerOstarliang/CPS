package com.chinacreator.zdry.services;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.remote.bean.CzrkInfoBean;
import com.chinacreator.remote.business.RemoteRequestService;
import com.chinacreator.zdry.bean.Gxr;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.bean.Lcsqxx;
import com.chinacreator.zdry.bean.Lksqlzxx;
import com.chinacreator.zdry.bean.Spdwzdpz;
import com.chinacreator.zdry.constant.ZdryConstant;
import com.chinacreator.zdry.dao.CollectDao;
import com.chinacreator.zdry.dao.StaffsurveyDao;
import com.chinacreator.zdry.query.KeypersonnelQueryBean;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(采集列管逻辑层类)
 * @date Mar 4, 2013 12:53:50 PM
 */
public class CollectService  implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2888584925430044604L;

	public PageResultInfo<Keypersonnel> queryKeyPersonnel(KeypersonnelQueryBean personnel,PageInfo pageInfo) throws Exception{
		return CollectDao.queryKeyPersonnelList(personnel, pageInfo);
	}
	
	public PageResultInfo<Lcsqxx> queryLcsqxx(Lcsqxx lcsqxx,PageInfo pageInfo) throws Exception{
		return CollectDao.queryLcsqxxList(lcsqxx, pageInfo);
	}
	
	public Lcsqxx queryLcsqxx(String sqxxbh) throws Exception{
		return CollectDao.queryLcsqxx(sqxxbh);
	}
	
	public Lcsqxx queryLcsqxx(Lksqlzxx lksqlzxx,PageInfo pageInfo) throws Exception{
		Lcsqxx lcsqxx = CollectDao.queryLcsqxx(lksqlzxx.getSqxxbh());
		
		Gxr gxr = new Gxr();
		gxr.setSfzh(lcsqxx.getSfzh());
		
		PageResultInfo<Gxr> gxrList = StaffsurveyDao.queryShgxList(gxr,pageInfo);
		lcsqxx.setGxrList(gxrList.getDatas());
		
		List<Lksqlzxx> lksqlzxxList = CollectDao.queryLksqlzxx(lksqlzxx);
		lcsqxx.setLksqlzxxList(lksqlzxxList);
		return lcsqxx;
	}
	
	public void insertLksqlzxx(Lksqlzxx lksqlzxx) throws Exception{
		 CollectDao.insertLksqlzxx(lksqlzxx);
	}
	
	/**
	 * 列管审批
	 * @param lksqlzxx
	 */
	public void ColumnPipeApproval(Lcsqxx lcsqxx, Lksqlzxx lksqlzxx) throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		//设置审批单位
		Spdwzdpz spdwzdpz = this.getSpdwzd();
		lcsqxx.setJbshdwdm(spdwzdpz.getZdCode());
		lcsqxx.setJbshdwmc(spdwzdpz.getZdCodeName());
		
		//修改申请状态
		CollectDao.updateLcsqxx(lcsqxx);
		
		//插入流程表
		lksqlzxx.setClrxm(loginInfo.getRealname());
		lksqlzxx.setCldwdm(loginInfo.getOrgcode());
		lksqlzxx.setCldwmc(loginInfo.getOrgname());
		
		this.insertLksqlzxx(lksqlzxx);
	}
	
	public void insertZdryjbxx(Lcsqxx lcsqxx) throws Exception{
		Keypersonnel keypersonnel = new Keypersonnel();
		lcsqxx = CollectDao.queryLcsqxx(lcsqxx.getSqxxbh());
		keypersonnel.setRylx(lcsqxx.getZdrklx());
		keypersonnel.setSfzh(lcsqxx.getSfzh());
		keypersonnel.setXm(lcsqxx.getXm());
		keypersonnel.setXb(lcsqxx.getXb());
		keypersonnel.setSspcsdm(lcsqxx.getSqdwdm());
		keypersonnel.setSspcsmc(lcsqxx.getSqdwmc());
		keypersonnel.setXzdxz(lcsqxx.getJtzz());
		keypersonnel.setIsgk(ZdryConstant.ZDRY_ISGK_YLG);
		
		CollectDao.insertZdryjbxx(keypersonnel);
	}
	
	/**
	 * 列管申请
	 * @param lcsqxx
	 * @param lksqlzxx
	 * @throws Exception
	 */
	public void ColumnPipeApplication(Lcsqxx lcsqxx, Lksqlzxx lksqlzxx) throws Exception{
		//插入列管申请表
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String sqxxbh = CommonSequenceHelper.getLGSQXXBH(loginInfo.getOrgcode());
		
		lcsqxx.setSqxxbh(sqxxbh);
		lcsqxx.setSqrxm(loginInfo.getRealname());
		lcsqxx.setSqdwdm(loginInfo.getOrgcode());
		lcsqxx.setSqdwmc(loginInfo.getOrgname());
		
		//设置列管申请类型
		lcsqxx.setLgsqlx(ZdryConstant.ZDRY_LGSQLX_SQLG);
		lcsqxx.setSqzt(ZdryConstant.ZDRY_SQZT_SQ);
		lcsqxx.setLgczt(ZdryConstant.ZDRY_LGZT_LGSPZ);
		
		//设置审批单位
		Spdwzdpz spdwzdpz = this.getSpdwzd();
		lcsqxx.setJbshdwdm(spdwzdpz.getZdCode());
		lcsqxx.setJbshdwmc(spdwzdpz.getZdCodeName());
		
		CollectDao.insertLcsqxx(lcsqxx);
		
		//插入流程表
		lksqlzxx.setSqxxbh(sqxxbh);
		lksqlzxx.setClrxm(loginInfo.getRealname());
		lksqlzxx.setCldwdm(loginInfo.getOrgcode());
		lksqlzxx.setCldwmc(loginInfo.getOrgname());
		
		//设置处理单位类型
		lksqlzxx.setCldwlx(ZdryConstant.ZDRY_CLDWLX_CBRTXSQB);
		lksqlzxx.setLcgsqlx(ZdryConstant.ZDRY_LGSQLX_SQLG);
		
		CollectDao.insertLksqlzxx(lksqlzxx);
		
	}
	
	/**
	 * 判断是否已经列管 
	 * @param sfzh
	 * @return 1. 已列管 2. 列管审核中
	 */
	public boolean isLg(String sfzh) throws Exception{
		List<Lcsqxx> list = CollectDao.querySfzhLgInfo(sfzh);
		boolean flag = true;
		if(ValidateHelper.isNotEmptyCollection(list)){
			flag = false;
		}
		
		return flag;
	}
	
	public Keypersonnel getKeypersonnel(String sfzh){
		Keypersonnel keypersonnel = new Keypersonnel();
		//调用常住人口接口转为重点人员实体
		RemoteRequestService service = new RemoteRequestService();
		
		List<CzrkInfoBean> listCzList = service.queryCzrkInfoBySfzh(sfzh);
		CzrkInfoBean  czrkInfoBean = new CzrkInfoBean();
		if(listCzList != null && listCzList.size() > 0){
			czrkInfoBean = listCzList.get(0);
		}
		
		keypersonnel.setXm(czrkInfoBean.getXm());
		keypersonnel.setCsrq(DateTimeHelper.convertToDate(czrkInfoBean.getCsrq(), "yyyy-MM-dd"));
		return keypersonnel;
	}
	
	@SuppressWarnings("unused")
	private Lksqlzxx getLoginByLksqlzxx(){
		Lksqlzxx lksqlzxx = new Lksqlzxx();
		LoginInfo logininfo = ActionContextHelper.getLoginInfo();
		lksqlzxx.setCldwdm(logininfo.getOrgcode());
		lksqlzxx.setCldwlx("");
		lksqlzxx.setCldwmc(logininfo.getOrgname());
		lksqlzxx.setCljg("");
		lksqlzxx.setCljgyj("");
		lksqlzxx.setClrxm(logininfo.getUsername());
		lksqlzxx.setSqxxbh("");
		return lksqlzxx;
	}
	
	public List<Lksqlzxx> queryLksqlzxx(Lksqlzxx lksqlzxx) throws Exception{
		return CollectDao.queryLksqlzxx(lksqlzxx);
	}
	
	public Keypersonnel queryBySfzhPersonnel(String sfzh) throws Exception{
		return CollectDao.queryBySfzhPersonnel(sfzh);
	}
	
	/**
	 * 获取指定审批单位
	 * @return
	 * @throws Exception
	 */
	public Spdwzdpz getSpdwzd() throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		String code = "";
		if(loginInfo.getLeve() == CommonConstant.DLYHDJ_SQ){
			code = loginInfo.getOrgcode().substring(0,8) + "0000";
		
		}else if(loginInfo.getLeve() == CommonConstant.DLYHDJ_PCS){
			code = loginInfo.getOrgcode().substring(0,6) + "000000";
			
		}else if(loginInfo.getLeve() == CommonConstant.DLYHDJ_XJ){
			code = loginInfo.getOrgcode().substring(0,4) + "00000000";
			
		}
		Spdwzdpz spdwzdpz = CollectDao.queryByCodeSpdwzdpc(code);
		
		if(null == spdwzdpz || StringUtils.isBlank(spdwzdpz.getZdCode())){
			spdwzdpz = new Spdwzdpz();
			//设置默认上报审批单位
			spdwzdpz.setZdCode(code);
			spdwzdpz.setZdCodeName(DictionaryCacheHellper.getOrganizationOrgNameByCode(code));
		}
		return spdwzdpz;
	}
}	
