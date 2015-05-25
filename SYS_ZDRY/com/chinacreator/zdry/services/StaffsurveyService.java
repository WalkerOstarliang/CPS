package com.chinacreator.zdry.services;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.zdry.bean.Gxr;
import com.chinacreator.zdry.bean.Gzxx;
import com.chinacreator.zdry.bean.Jjqk;
import com.chinacreator.zdry.bean.Keypersonnel;
import com.chinacreator.zdry.bean.Lxfs;
import com.chinacreator.zdry.bean.Wffzjl;
import com.chinacreator.zdry.bean.Xsbx;
import com.chinacreator.zdry.bean.Zpxx;
import com.chinacreator.zdry.dao.StaffsurveyDao;

/**   
 * @author 禹文超
 * @mail wenchao.yu@chinacreator.com
 * @Description: TODO(人员考察逻辑层类)
 * @date Mar 11, 2013 4:32:26 PM
 */
public class StaffsurveyService implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7358941032362493924L;
	
	public void saveShgxs(List<Gxr> gxrList,String sfzh) throws Exception {
		StaffsurveyDao.delShgxs(sfzh);
		StaffsurveyDao.insertShgxs(gxrList);
	}
	
	public void saveZpxxs(List<Zpxx> zpxxList,String sfzh) throws Exception{
		StaffsurveyDao.delZpxx(sfzh);
		StaffsurveyDao.insertZpxx(zpxxList);
	}
	
	public  void insertJbxx() throws Exception {
		
	}

	/**
	 * 插入工作信息
	 */
	public  Gzxx queryGzxx(String sfzh) throws Exception {
		return StaffsurveyDao.queryBySfzhGzxx(sfzh);
	}

	/**
	 * 插入违法经历
	 */
	public  PageResultInfo<Wffzjl> queryWfjlList(Wffzjl wffzjl, PageInfo pageInfo) throws Exception {
		return StaffsurveyDao.queryWfjlList(wffzjl, pageInfo);
	}

	/**
	 * 查询现实表现
	 */
	public PageResultInfo<Xsbx> queryXsbxList(String sfzh,PageInfo pageInfo) throws Exception {
		return StaffsurveyDao.queryBySfzhXsbxList(sfzh,pageInfo);
	}
	
	public Jjqk queryBySfzhJjqk(String sfzh) throws Exception{
		
		return StaffsurveyDao.queryBySfzhJjqk(sfzh);
	}
	
	/**
	 * 插入经济情况
	 */
	public  void saveJjqk(Jjqk jjqk) throws Exception {
		StaffsurveyDao.delJjqk(jjqk.getSfzh());
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		jjqk.setCzdwdm(loginInfo.getOrgcode());
		jjqk.setCzdwmc(loginInfo.getOrgcode());
		jjqk.setCzr(loginInfo.getRealname());
		StaffsurveyDao.insertJjqk(jjqk);
	}

	/**
	 * 保存联络方式
	 */
	public  void saveLlfs(Lxfs lxfs) throws Exception {
		Lxfs lf = StaffsurveyDao.queryLlfs(lxfs.getSfzh());
		if(lf == null){
			//插入
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			lxfs.setCzdwdm(loginInfo.getOrgcode());
			lxfs.setCzdwmc(loginInfo.getOrgname());
			lxfs.setCzrxm(loginInfo.getRealname());
			lxfs.setCzbs("1");
			lxfs.setDjdwdm(loginInfo.getOrgcode());
			lxfs.setDjdwmc(loginInfo.getOrgname());
			lxfs.setDjrxm(loginInfo.getRealname());
			StaffsurveyDao.insertLlfs(lxfs);
		}else {
			//修改
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			lxfs.setCzdwdm(loginInfo.getOrgcode());
			lxfs.setCzdwmc(loginInfo.getOrgname());
			lxfs.setCzrxm(loginInfo.getRealname());
			StaffsurveyDao.updateLlfs(lxfs);
		}
	}
	
	/**
	 * 保存关系人集合信息
	 * @param gxrList
	 * @throws Exception
	 */
	public  void saveGxrs(List<Gxr> gxrList) throws Exception {
		List<Gxr> insertGxrList = new ArrayList<Gxr>();
		List<Gxr> updateGxrList = new ArrayList<Gxr>();
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(gxrList != null && gxrList.size() >0){
			for(int i=0; i < gxrList.size(); i++){
				Gxr gxr = gxrList.get(i);
				List<Gxr> list = StaffsurveyDao.queryBySfzhShgxList(gxr);
				
				gxr.setCzdwdm(loginInfo.getOrgcode());
				gxr.setCzdwmc(loginInfo.getOrgname());
				gxr.setCzrxm(loginInfo.getRealname());
				
				if(null != list && list.size() > 0){
					updateGxrList.add(gxr);
				}else{
					gxr.setDjdwdm(loginInfo.getOrgcode());
					gxr.setDjdwmc(loginInfo.getOrgname());
					gxr.setDjrxm(loginInfo.getRealname());
					insertGxrList.add(gxr);
				}
			}
		}
		if(null != insertGxrList && insertGxrList.size() > 0){
			StaffsurveyDao.insertShgxs(insertGxrList);
		}
		
		if(null != updateGxrList && updateGxrList.size() > 0){
			StaffsurveyDao.updateShgxs(updateGxrList);
		}
	}
	
	/**
	 * 保存基本信息
	 * @param personnel
	 * @throws Exception
	 */
	public void saveJbxx(Keypersonnel personnel) throws Exception{
		StaffsurveyDao.updateJbxx(personnel);
	}
	
	/**
	 * 保存体貌特征
	 * @param personnel
	 * @throws Exception
	 */
	public void saveTmtz(Keypersonnel personnel) throws Exception{
		StaffsurveyDao.updateTmtz(personnel);
	}
	
	/**
	 * 保存工作信息
	 * @param gzxx
	 * @throws Exception
	 */
	public void saveGzxx(Gzxx gzxx) throws Exception{
		StaffsurveyDao.delGzxx(gzxx.getSfzh());
		StaffsurveyDao.insertGzxx(gzxx);
	}
	
	/**
	 * 保存违法犯罪经历
	 * @param wffzjl
	 * @throws Exception
	 */
	public void saveWffzjl(Wffzjl wffzjl) throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		wffzjl.setCzdwdm(loginInfo.getOrgcode());
		wffzjl.setCzdwmc(loginInfo.getOrgname());
		wffzjl.setCzrxm(loginInfo.getRealname());
		
		if(StringUtils.isNotBlank(wffzjl.getId())){
			//修改数据
			StaffsurveyDao.updateWfjl(wffzjl);
		}else{
			//插入数据
			wffzjl.setDjdwdm(loginInfo.getOrgcode());
			wffzjl.setDjdwmc(loginInfo.getOrgname());
			wffzjl.setDjrxm(loginInfo.getRealname());
			StaffsurveyDao.insertWfjl(wffzjl);
		}
	}
	
	public void saveXsbx(Xsbx xsbx) throws Exception{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		xsbx.setCzbs("1");
		xsbx.setCzdwdm(loginInfo.getOrgcode());
		xsbx.setCzdwmc(loginInfo.getOrgname());
		xsbx.setCzrxm(loginInfo.getRealname());
		
		if(StringUtils.isNotBlank(xsbx.getId())){
			//修改数据
			StaffsurveyDao.updateXsbx(xsbx);
		}else{
			//插入数据
			xsbx.setDjmjxm(loginInfo.getRealname());
			xsbx.setDjmjssgajgmc(loginInfo.getOrgname());
			xsbx.setDjmjssgajgdm(loginInfo.getOrgcode());
			StaffsurveyDao.insertXsbx(xsbx);
		}
	}
	/**
	 * 根据身份证查询联络方式
	 */
	public Lxfs queryLlfsInfo(String sfzh) throws Exception {
		
		return StaffsurveyDao.queryLlfs(sfzh);
	}
	
	
	
	/**
	 * 查询关系人集合
	 */
	public List<Gxr> queryShgxList(Gxr gxr) throws Exception {
		return StaffsurveyDao.queryBySfzhShgxList(gxr);
	}
	
	/**
	 * 查询照片信息
	 * @param zpxx
	 * @return
	 * @throws Exception
	 */
	public List<Zpxx> queryZpxxList(Zpxx zpxx) throws Exception{
		return StaffsurveyDao.queryBySfzhZpList(zpxx);
	}
	
	public Zpxx queryByIdZpxx(String id) throws Exception{
		return StaffsurveyDao.queryByIdZpList(id);
	}
	
	public void delWffzjl(String id) throws Exception{
		StaffsurveyDao.delWffzjl(id);
	}
	
	public void delXsbx(String id) throws Exception{
		StaffsurveyDao.delByIdXsbx(id);
	}
	
	public void delZpxx(String id) throws Exception{
		StaffsurveyDao.delByIdZpxx(id);
	}
 }
