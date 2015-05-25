package com.chinacreator.lsgl.services.impl;

import java.sql.SQLException;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.bean.RkJbxxBean;
import com.chinacreator.common.cps.helper.CommonSequenceHelper;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.bean.ZdryBean;
import com.chinacreator.lsgl.bean.ZdryGzdxBean;
import com.chinacreator.lsgl.bean.ZdryJbxxBean;
import com.chinacreator.lsgl.bean.ZdryJsjzBean;
import com.chinacreator.lsgl.bean.ZdryQbhsBean;
import com.chinacreator.lsgl.bean.ZdryQsBean;
import com.chinacreator.lsgl.bean.ZdrySqjdBean;
import com.chinacreator.lsgl.bean.ZdrySqkfBean;
import com.chinacreator.lsgl.dao.LsglZdryJbxxDao;
import com.chinacreator.lsgl.dao.ZdryQsDao;
import com.chinacreator.lsgl.dao.impl.LsglZdryJbxxDaoImpl;
import com.chinacreator.lsgl.dao.impl.ZdryQsDaoImpl;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.ZdryQsService;
import com.frameworkset.orm.transaction.TransactionManager;

public class ZdryQsServiceImlp implements ZdryQsService {

	private static final long serialVersionUID = -4961293595479338418L;
	
	private ZdryQsDao dao = new ZdryQsDaoImpl();

	@Override
	public int ZdryQs(ZdryQsBean bean) {
		//错误代码 （-1：系统错误 0：操作成功  1：根据身份证找不到这个人   2:无法识别的接收状态）
		int error_code = -1;
		
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		
		bean.setCzdwid(loginInfo.getOrgid());
		bean.setCzdwmc(loginInfo.getOrgname());
		bean.setCzrid(loginInfo.getUserid());
		bean.setCzrxm(loginInfo.getRealname());
		
		//签收重点人员
		if("1".equals(bean.getJszt())){
			//重点人员工作对象DAO
			LsglZdryJbxxDao zdryDao = new LsglZdryJbxxDaoImpl();
			//人口service
			LsglRkService rkService = new LsglRkServiceImpl();
			
			TransactionManager tr = null;
			String sfzh = bean.getSfzh();
			try {
				tr = new TransactionManager();
				tr.begin();
				
				//根据身份证查询重点人员是否存在
				ZdryGzdxBean gzdx = zdryDao.queryZdryGzdxBysfzh(sfzh);
				if(gzdx == null){    //重点人员不存在 需要新增重点人员
					//查询是否存在人员信息
					RkJbxxBean rkjbxx =  rkService.queryRkJbxxBeanBySfzh(sfzh);
					
					if(rkjbxx ==  null){//本地库不存在人口基本信息 请求公安部服务
						rkjbxx = rkService.queryCzrkInfoStBeanBySfzh(sfzh);
						
						if(rkjbxx == null){//公安部服务请求不到人员 返回错误代码1：根据身份证号找不到此人
							error_code = 1;
						}else{ //请求公安部服务  找到人口则保存人口到本地
							RkxxBean rkBean = new RkxxBean();
							rkBean.setJbxxBean(rkjbxx);
							rkService.saveRkJbxxBean(rkBean);
							
							rkjbxx =  rkService.queryRkJbxxBeanBySfzh(sfzh);
						}
					}
					
					if(rkjbxx != null){
						//新增重点人员工作对象
						gzdx = new ZdryGzdxBean();
						gzdx.setRybh(rkjbxx.getRybh());
						gzdx.setSfzh(sfzh);
						
						String gzdxbh = CommonSequenceHelper.getZdrybh(loginInfo.getOrgcode());
						gzdx.setGzdxbh(gzdxbh);
						
						String zdrybh = loginInfo.getCitydm().substring(0,4) + DateTimeHelper.getNowDateStr("yyyyMM") 
						+ CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_ZDY_ZDRYBH");
						gzdx.setZdrybh(zdrybh);
						//重点人员类别标记
						String zdrylbbj = "0000000000000000000000000000";
						//重点人员细类
						String zdryxl = "";
						if("1".equals(bean.getRylx())){
							zdrylbbj = zdrylbbj + "0001";
							zdryxl = "320000000000";
						}else if("2".equals(bean.getRylx())){
							zdrylbbj = zdrylbbj + "0010";
							zdryxl = "310000000000";
						}else if("3".equals(bean.getRylx())){
							zdrylbbj = zdrylbbj + "0100";
							zdryxl = "300000000000";
						}else if("4".equals(bean.getRylx())){
							zdrylbbj = zdrylbbj + "1000";
							zdryxl = "290000000000";
						}
						gzdx.setZdrylbbj(zdrylbbj);
						gzdx.setZdryxl(zdryxl);
						//***************************
						
						gzdx.setDxlb("02");
						
						gzdx.setLadw(bean.getLadw());
						gzdx.setFlwsmc(bean.getFlws());
						gzdx.setQfjg(bean.getQfjg());
						gzdx.setQfsj(bean.getQfsj());
						
						gzdx.setSsxzsq(bean.getSssqdm());
						gzdx.setSsxzsqmc(bean.getSssqmc());
						gzdx.setSszrdwdm(bean.getSsjwqdm());
						gzdx.setSszrdwmc(bean.getSsjwqmc());
						dao.insertZdry(gzdx);
					}
				}else{//重点人员存在 更新重点人员信息
					String zdrylbbj = gzdx.getZdrylbbj();
					String zdryxl = gzdx.getZdryxl();
					
					if("1".equals(bean.getRylx())){
						zdrylbbj = zdrylbbj.substring(0,28) + "0001";
						if(ValidateHelper.isEmptyString(zdryxl)){
							zdryxl = "320000000000";
						}else{
							boolean flag = true;
							for(String str:zdryxl.split(",")){
								if("320000000000".equals(str)){
									flag = false;
									break;
								}
							}
							if(flag){
								zdryxl += "320000000000";
							}
						}
					}else if("2".equals(bean.getRylx())){
						zdrylbbj = zdrylbbj.substring(0,28) + "0010";
						if(ValidateHelper.isEmptyString(zdryxl)){
							zdryxl = "310000000000";
						}else{
							boolean flag = true;
							for(String str:zdryxl.split(",")){
								if("310000000000".equals(str)){
									flag = false;
									break;
								}
							}
							if(flag){
								zdryxl += "310000000000";
							}
						}
						
					}else if("3".equals(bean.getRylx())){
						zdrylbbj = zdrylbbj.substring(0,28) + "0100";
						if(ValidateHelper.isEmptyString(zdryxl)){
							zdryxl = "300000000000";
						}else{
							boolean flag = true;
							for(String str:zdryxl.split(",")){
								if("300000000000".equals(str)){
									flag = false;
									break;
								}
							}
							if(flag){
								zdryxl += "300000000000";
							}
						}
					}else if("4".equals(bean.getRylx())){
						zdrylbbj = zdrylbbj.substring(0,28) + "1000";
						if(ValidateHelper.isEmptyString(zdryxl)){
							zdryxl = "290000000000";
						}else{
							boolean flag = true;
							for(String str:zdryxl.split(",")){
								if("290000000000".equals(str)){
									flag = false;
									break;
								}
							}
							if(flag){
								zdryxl += "290000000000";
							}
						}
					}
					
					if(ValidateHelper.isEmptyString(gzdx.getDxlb())){
						gzdx.setDxlb("02");
					}
					
					gzdx.setZdrylbbj(zdrylbbj);
					gzdx.setZdryxl(zdryxl);
					
					gzdx.setLadw(bean.getLadw());
					gzdx.setFlwsmc(bean.getFlws());
					gzdx.setQfjg(bean.getQfjg());
					gzdx.setQfsj(bean.getQfsj());
					
					gzdx.setSsxzsq(bean.getSssqdm());
					gzdx.setSsxzsqmc(bean.getSssqmc());
					gzdx.setSszrdwdm(bean.getSsjwqdm());
					gzdx.setSszrdwmc(bean.getSsjwqmc());
					
					dao.updateZdry(gzdx);
				}
				
				//保存反馈给执法办案的信息
				dao.insertZfbaFk(bean);
				tr.commit();
				error_code = 0;
			} catch (Exception e) {
				error_code = -1;
				
				try {
					tr.rollback();
				} catch (RollbackException re) {
					re.printStackTrace();
				}
				
				e.printStackTrace();
			}
		}else if("0".equals(bean.getJszt())){ //重点人员退回
			try {
				dao.insertZfbaFk(bean);
				error_code = 0;
			} catch (SQLException e) {
				error_code = -1;
				e.printStackTrace();
			}
		}else{//接收状态无法识别  返回错误代码2：无法识别的接收状态
			error_code = 2;
		}
		return error_code;
	}

	@Override
	public PageResultInfo<ZdryJbxxBean> queryZdryJsList(QueryBean query,
			PageInfo pageinfo) {
		try 
		{
			return dao.queryZdryQsList(query,pageinfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ZdryBean queryZdryxxByRybh(String rybh) {
		ZdryBean zdry = new ZdryBean();
		try {
			ZdryJbxxBean jbxx = dao.queryZdryJbxx(rybh);
			
			if(jbxx != null){
				if("1".equals(jbxx.getRylxflag())){
					ZdryQbhsBean qbhs = dao.queryZdryQbhs(rybh);
					zdry.setQbhs(qbhs);
					
					jbxx.setXingbie(qbhs.getXingbie());
					jbxx.setShenfenzhenghao(qbhs.getShenfenzhenghao());
					jbxx.setChushengriqi(qbhs.getChushengriqi());
					jbxx.setNianling(qbhs.getNianling());
					jbxx.setGongzuodanwei(qbhs.getGongzuodanwei());
					jbxx.setZhuzhidizhi(qbhs.getZhuzhidizhi());
					jbxx.setGonganmingcheng(qbhs.getGonganmingcheng());
					jbxx.setPizhunriqi(qbhs.getPizhunriqi());
					jbxx.setWenshuwenhao(qbhs.getWenshuwenhao());
					jbxx.setBanandanweimc(qbhs.getBanandanweimc());
					
				}else if("2".equals(jbxx.getRylxflag())){
					ZdryJsjzBean jsjz = dao.queryZdryJsjz(rybh);
					zdry.setJsjz(jsjz);
					
					jbxx.setXingbie(jsjz.getXingbie());
					jbxx.setShenfenzhenghao(jsjz.getShenfenzhenghao());
					jbxx.setChushengriqi(jsjz.getChushengriqi());
					jbxx.setNianling(jsjz.getNianling());
					jbxx.setGongzuodanwei(jsjz.getGongzuodanwei());
					jbxx.setZhuzhidizhi(jsjz.getXianzhuzhi());
					jbxx.setGonganmingcheng(jsjz.getGonganmingcheng());
					jbxx.setPizhunriqi(jsjz.getPizhunriqi());
					jbxx.setWenshuwenhao(jsjz.getWenshuwenhao());
					jbxx.setBanandanweimc(jsjz.getBanandanweimc());
					
				}else if("3".equals(jbxx.getRylxflag())){
					ZdrySqjdBean sqjd = dao.queryZdrySqjd(rybh);
					zdry.setSqjd(sqjd);
					
					jbxx.setXingbie(sqjd.getXingbie());
					jbxx.setShenfenzhenghao(sqjd.getZhenjianhaoma());
					jbxx.setChushengriqi(sqjd.getChushengriqi());
					jbxx.setNianling(sqjd.getNianling());
					jbxx.setGongzuodanwei(sqjd.getGongzuodanwei());
					jbxx.setZhuzhidizhi(sqjd.getZhuzhidizhi());
					jbxx.setWenshuwenhao(sqjd.getWenshuwenhao());
					
				}else if("4".equals(jbxx.getRylxflag())){
					ZdrySqkfBean sqkf = dao.queryZdrySqkf(rybh);
					zdry.setSqkf(sqkf);
					
					jbxx.setXingbie(sqkf.getXingbie());
					jbxx.setShenfenzhenghao(sqkf.getZhenjianhaoma());
					jbxx.setChushengriqi(sqkf.getChushengriqi());
					jbxx.setNianling(sqkf.getNianling());
					jbxx.setGongzuodanwei(sqkf.getGongzuodanwei());
					jbxx.setZhuzhidizhi(sqkf.getZhuzhidizhi());
					jbxx.setWenshuwenhao(sqkf.getWenshuwenhao());
				}
			}
			zdry.setJbxx(jbxx);
		} catch (SQLException e) {
			zdry = null;
			e.printStackTrace();
		}
		
		return zdry;
	}

}
