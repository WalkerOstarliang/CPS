package com.chinacreator.qzgl.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.qzgl.bean.MtryBean;
import com.chinacreator.qzgl.bean.QtfwBean;
import com.chinacreator.qzgl.bean.QtryBean;
import com.chinacreator.qzgl.bean.QtryqyBean;
import com.chinacreator.qzgl.bean.QyryBean;
import com.chinacreator.qzgl.bean.TgzmBean;
import com.chinacreator.qzgl.bean.ZapcTbBean;
import com.chinacreator.qzgl.query.MtryQueryBean;
import com.chinacreator.qzgl.query.QtfwQueryBean;
import com.chinacreator.qzgl.query.QtryQueryBean;
import com.chinacreator.qzgl.query.QtryqyQueryBean;
import com.chinacreator.qzgl.query.QyryQueryBean;
import com.chinacreator.qzgl.query.StZapcQueryBean;
import com.chinacreator.qzgl.query.TgzmQueryBean;
import com.chinacreator.qzgl.services.WmfwService;
import com.chinacreator.xqgk.utils.DateUtils;
/**
 * 为民服务
 * @author Administrator
 */
public class WmfwAction extends CPSBaseAction
{
	private static final long serialVersionUID = 1L;

	private TgzmQueryBean  querybean ; 
	private MtryQueryBean  mtryquery;
	private QyryQueryBean qyryquery;
	private QtryQueryBean qtryquery;
	private QtryqyQueryBean qtryqyquery;
	private QtfwQueryBean qtfwquery ;
	
	private String id;
	private WmfwService  service;
	private TgzmBean tgzmbean;
	private MtryBean mtrybean;
	private QyryBean qyrybean;
	private QtryBean qtrybean;
	private QtryqyBean qtryqybean;
	private QtfwBean qtfwbean;
	private	LoginInfo log;
	
	private File filezp;
	
	private ZapcTbBean stzapcbean;

	private String strtitle ; // 排查发现及时化解提前处置个人极端暴力犯罪工作情况201502月报表 标题
	
	private StZapcQueryBean zapcquery ;
	
	private List<ZapcTbBean> downloadZapctbList; // 结果集合
	private List<ZapcTbBean> mingxiZapctbList ; // 明细
	
	public List<ZapcTbBean> getDownloadZapctbList() {
		return downloadZapctbList;
	}

	public void setDownloadZapctbList(List<ZapcTbBean> downloadZapctbList) {
		this.downloadZapctbList = downloadZapctbList;
	}

	public StZapcQueryBean getZapcquery() {
		return zapcquery;
	}

	public void setZapcquery(StZapcQueryBean zapcquery) {
		this.zapcquery = zapcquery;
	}

	public String getStrtitle() {
		return strtitle;
	}

	public void setStrtitle(String strtitle) {
		this.strtitle = strtitle;
	}

	public File getFilezp() {
		return filezp;
	}

	public void setFilezp(File filezp) {
		this.filezp = filezp;
	}

	public LoginInfo getLog() {
		return log;
	}

	public void setLog(LoginInfo log) {
		this.log = log;
	}

	public WmfwAction(){
		super();
		service = new WmfwService();
		log = ActionContextHelper.getLoginInfo();
		zapcquery = new StZapcQueryBean();
	}
	
	public TgzmBean getTgzmbean() {
		return tgzmbean;
	}

	public void setTgzmbean(TgzmBean tgzmbean) {
		this.tgzmbean = tgzmbean;
	}

	public TgzmQueryBean getQuerybean() {
		return querybean;
	}

	public void setQuerybean(TgzmQueryBean querybean) {
		this.querybean = querybean;
	}

	/**
	 * 提供证明查询列表页面
	 * @return
	 */
	public String tgzmList(){
		if(querybean == null){
			querybean = new TgzmQueryBean();
		}
		initQueryBean(querybean);
		return "toTgzmListPage";
	}
	/**
	 * 迷途人员查询列表页面
	 * @return
	 */
	public String mtryList(){
		if(mtryquery == null){
			mtryquery = new MtryQueryBean();
		}
		initQueryBean(mtryquery);
		return "toMtryListPage";
	}
	/**
	 * 弃婴人员查询列表页面
	 * @return
	 */
	public String qyryList(){
		if(qyryquery == null){
			qyryquery = new QyryQueryBean();
		}
		initQueryBean(qyryquery);
		return "toQyryListPage";
	}
	/**
	 * 流浪乞讨人员查询列表页面
	 * @return
	 */
	public String qtryList(){
		if(qtryquery == null){
			qtryquery = new QtryQueryBean();
		}
		initQueryBean(qtryquery);
		return "toQtryListPage";
	}
	/**
	 * 其他服务查询列表页面
	 * @return
	 */
	public String qtfwList(){
		if(qtfwquery == null){
			qtfwquery = new QtfwQueryBean();
		}
		initQueryBean(qtfwquery);
		return "toQtfwListPage";
	}
	
	/***
	 * 查询提供证明列表
	 */
	public void queryTgzmListAction(){
		if(querybean == null){
			querybean = new TgzmQueryBean();
			initQueryBean(querybean);
		}
		PageResultInfo<TgzmBean> list;
		try {
			list = service.queryPageList(TgzmBean.class, querybean, "queryPageTgzmListSQL", getPageInfo());
			responseWrite(list);
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	/**
	 * 查询迷途人员列表
	 */
	public void queryMtryListAction(){
		if(mtryquery == null){
			mtryquery = new MtryQueryBean();
			initQueryBean(mtryquery);
		}
		PageResultInfo<MtryBean> list;
		try {
			list = service.queryPageList(MtryBean.class, mtryquery, "queryPageMtryListSQL", getPageInfo());
			responseWrite(list);
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	/**
	 * 查询其他服务列表
	 */
	public void queryQtfwListAction(){
		if(qtfwquery == null){
			qtfwquery = new QtfwQueryBean();
			initQueryBean(qtfwquery);
		}
		PageResultInfo<QtfwBean> list;
		try {
			list = service.queryPageList(QtfwBean.class, qtfwquery, "queryPageQtfwListSQL", getPageInfo());
			responseWrite(list);
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	/**
	 * 跳转弹出“其他服务”页面
	 * 新增、修改、查看详情
	 * @return
	 */
	public String toQtfwPage(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){//操作类型为新增
			if(qtfwbean == null){
				qtfwbean = new QtfwBean();
			}
			//保存登记人信息
			qtfwbean.setDjrxm(log.getRealname());
			qtfwbean.setDjrjh(log.getUsername());
			qtfwbean.setDjdwdm(log.getOrgcode());
			qtfwbean.setCzrjh(log.getUsername());
			qtfwbean.setDjdwmc(log.getOrgname());
			//登记时间
			qtfwbean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));			
		}
		else				//修改信息或者查看信息
		{	//根据编号，获得该编号的其他服务明细
			try {
				qtfwbean = service.queryBeanById(QtfwBean.class, id, "queryQtfwBeanBYIdSQL");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "toQtfwPage";
	}
	/**
	 * 保存其他服务信息(新增、修改,删除)
	 */
	public void saveQtfwBean(){
		boolean msgss = false ; //标志是否保存成功
		try {
			String sql = "";
			if (!"".equals(qtfwbean.getId()) ){
				// 修改或删除
				
				if (CommonConstant.OPERTYPE_UPDATE.equals(operType)){
					sql = "updateQtfwSQL";
					qtfwbean.setCzdwdm(log.getOrgcode());
					qtfwbean.setCzdwmc(log.getOrgname());
					qtfwbean.setCzrjh(log.getUsername());
					qtfwbean.setCzrxm(log.getRealname());
					qtfwbean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				}else if (CommonConstant.OPERTYPE_DELETE.equals(operType)){
					sql = "deleteQtfwSQL";
					qtfwbean.setZxbs("2");
					qtfwbean.setCzdwdm(log.getOrgcode());
					qtfwbean.setCzdwmc(log.getOrgname());
					qtfwbean.setCzrjh(log.getUsername());
					qtfwbean.setCzrxm(log.getRealname());
					qtfwbean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					qtfwbean.setScsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				};
			}else{
				// 新增
				sql ="insertQtfwSQL";
				// 获得主键id
				StringBuffer sbf = new StringBuffer();
				sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
				sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
				sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_QTFWID"));
				
				qtfwbean.setId(sbf.toString());
				
				qtfwbean.setCzdwdm(log.getOrgcode());
				qtfwbean.setCzdwmc(log.getOrgname());
				qtfwbean.setCzrjh(log.getUsername());
				qtfwbean.setCzrxm(log.getRealname());
				qtfwbean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				qtfwbean.setDjdwdm(log.getOrgcode());
				qtfwbean.setDjdwmc(log.getOrgname());
				qtfwbean.setDjrxm(log.getRealname());
				qtfwbean.setDjrjh(log.getUsername());
				qtfwbean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				qtfwbean.setZxbs("0");
			}
			msgss = service.saveBean(qtfwbean, sql, operType);
			responseWrite(qtfwbean);
		} catch (Exception e) {
			responseWrite(msgss);
			e.printStackTrace();
		}
	}
	/**
	 * 删除其他服务信息
	 */
	public void deleteQtfwBean(){
		if (id != null){
			try {
				qtfwbean = service.queryBeanById(QtfwBean.class, id, "queryQtfwBeanBYIdSQL");
				saveQtfwBean();
			} catch (Exception e) {
				qtfwbean = null;
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 跳转弹出“提供证明”页面
	 * 新增、修改、查看详情
	 * @return
	 */
	public String toTgzmPage(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){//操作类型为新增
			if(tgzmbean == null){
				tgzmbean = new TgzmBean();
			}
			//保存登记人信息
			tgzmbean.setDjrxm(log.getRealname());
			tgzmbean.setDjdwdm(log.getOrgcode());
			tgzmbean.setCzrjh(log.getUsername());
			tgzmbean.setDjdwmc(log.getOrgname());
			//登记时间
			tgzmbean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));			
		}
		else				//修改信息或者查看信息
		{	//根据编号，获得该编号的提供证明明细
			try {
				tgzmbean = service.queryBeanById(TgzmBean.class, id, "queryTgzmBeanBYIdSQL");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "toTgzmPage";
	}
	/**
	 *  跳转弹出“迷途人员”页面
	 * 新增、修改、查看详情
	 * @return
	 */
	public String toMtryPage(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){//操作类型为新增
			if(mtrybean == null){
				mtrybean = new MtryBean();
			}
			//保存登记人信息
			mtrybean.setDjrxm(log.getRealname());
			mtrybean.setDjdwdm(log.getOrgcode());
			mtrybean.setCzrjh(log.getUsername());
			mtrybean.setDjdwmc(log.getOrgname());
			//登记时间
			mtrybean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));			
		}
		else				//修改信息或者查看信息
		{	//根据编号，获得该编号的迷途人员明细
			try {
				mtrybean = service.queryBeanById(MtryBean.class, id, "queryMtryBeanBYIdSQL");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "toMtryPage";
	}
	/**
	 * 弹出迷途人员移送信息新增修改界面（新增也只是更新迷途人员表中相关字段）
	 * @return
	 */
	public String toMtryYsxxPage(){
		try {
			mtrybean = service.queryBeanById(MtryBean.class, id, "queryMtryBeanBYIdSQL");
			mtrybean.setMtryysdjdwdm(log.getOrgcode());
			mtrybean.setMtryysdjdwmc(log.getOrgname());
			mtrybean.setMtryysdjrjh(log.getUsername());
			mtrybean.setMtryysdjrxm(log.getRealname());
			mtrybean.setMtryysdjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toMtryYsxxPage";
	}
	/**
	 * 保存迷途人员移送信息
	 */
	public void saveMtryYsxxBean(){
		boolean msgss = false;
		String sql = "updateMtryYsxxSQL";
		try {
			msgss = service.saveBean(mtrybean, sql, "update");
			responseWrite(msgss);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除“提供证明信息”
	 */
	public void deleteTgzmBean(){
		if (id != null){
			try {
				tgzmbean = service.queryBeanById(TgzmBean.class, id, "queryTgzmBeanBYIdSQL");
				saveTgzmBean();
			} catch (Exception e) {
				tgzmbean = null;
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 保存提供证明信息(新增、修改)
	 */
	public void saveTgzmBean(){
		boolean msgss = false ; //标志是否保存成功
		try {
			String sql = "";
			if (!"".equals(tgzmbean.getId()) ){
				// 修改或删除
				
				if (CommonConstant.OPERTYPE_UPDATE.equals(operType)){
					sql = "updateTgzmSQL";
					tgzmbean.setCzdwdm(log.getOrgcode());
					tgzmbean.setCzdwmc(log.getOrgname());
					tgzmbean.setCzrjh(log.getUsername());
					tgzmbean.setCzrsfzh(log.getSfzh());
					tgzmbean.setCzrxm(log.getRealname());
					tgzmbean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				}else if (CommonConstant.OPERTYPE_DELETE.equals(operType)){
					sql = "deleteTgzmSQL";
					tgzmbean.setZxbs("2");
					tgzmbean.setCzdwdm(log.getOrgcode());
					tgzmbean.setCzdwmc(log.getOrgname());
					tgzmbean.setCzrjh(log.getUsername());
					tgzmbean.setCzrsfzh(log.getSfzh());
					tgzmbean.setCzrxm(log.getRealname());
					tgzmbean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					tgzmbean.setScsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				};
			}else{
				// 新增
				sql ="insertTgzmSQL";
				// 获得主键id
				StringBuffer sbf = new StringBuffer();
				sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
				sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
				sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_TGZMID"));
				
				tgzmbean.setId(sbf.toString());
				
				tgzmbean.setCzdwdm(log.getOrgcode());
				tgzmbean.setCzdwmc(log.getOrgname());
				tgzmbean.setCzrjh(log.getUsername());
				tgzmbean.setCzrsfzh(log.getCurrentUserSfzh());
				tgzmbean.setCzrxm(log.getRealname());
				tgzmbean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				tgzmbean.setDjdwdm(log.getOrgcode());
				tgzmbean.setDjdwmc(log.getOrgname());
				tgzmbean.setDjrsfzh(log.getCurrentUserSfzh());
				tgzmbean.setDjrxm(log.getRealname());
				tgzmbean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				tgzmbean.setZxbs("0");
			}
			msgss = service.saveBean(tgzmbean, sql, operType);
			responseWrite(tgzmbean);
		} catch (Exception e) {
			responseWrite(msgss);
			e.printStackTrace();
		}
	}
	/**
	 * 保存“迷途人员”信息(新增、修改)
	 */
	public void saveMtryBean(){
		boolean msgss = false ; //标志是否保存成功
		try {
			String sql = "";
			if (!"".equals(mtrybean.getId()) ){
				// 修改或删除
				
				if (CommonConstant.OPERTYPE_UPDATE.equals(operType)){
					sql = "updateMtrySQL";
					mtrybean.setCzdwdm(log.getOrgcode());
					mtrybean.setCzdwmc(log.getOrgname());
					mtrybean.setCzrjh(log.getUsername());
					//mtrybean.setCzrsfzh(log.getSfzh());
					mtrybean.setCzrxm(log.getRealname());
					mtrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				}else if (CommonConstant.OPERTYPE_DELETE.equals(operType)){
					sql = "deleteMtrySQL";
					mtrybean.setZxbs("2");
					mtrybean.setCzdwdm(log.getOrgcode());
					mtrybean.setCzdwmc(log.getOrgname());
					mtrybean.setCzrjh(log.getUsername());
					//mtrybean.setCzrsfzh(log.getSfzh());
					mtrybean.setCzrxm(log.getRealname());
					mtrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					mtrybean.setScsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				};
			}else{
				// 新增
				sql ="insertMtrySQL";
				// 获得主键id
				StringBuffer sbf = new StringBuffer();
				sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
				sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
				sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_MTRYID"));
				
				mtrybean.setId(sbf.toString());
				
				mtrybean.setCzdwdm(log.getOrgcode());
				mtrybean.setCzdwmc(log.getOrgname());
				mtrybean.setCzrjh(log.getUsername());
				//mtrybean.setCzrsfzh(log.getCurrentUserSfzh());
				mtrybean.setCzrxm(log.getRealname());
				mtrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				mtrybean.setDjdwdm(log.getOrgcode());
				mtrybean.setDjdwmc(log.getOrgname());
				//mtrybean.setDjrsfzh(log.getCurrentUserSfzh());
				mtrybean.setDjrxm(log.getRealname());
				mtrybean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				mtrybean.setZxbs("0");
			}
			msgss = service.saveBean(mtrybean, sql, operType);
			responseWrite(mtrybean);
		} catch (Exception e) {
			responseWrite(msgss);
			e.printStackTrace();
		}
	}
	
	/**
	 * 显示“迷途人员”照片
	 */
	public void showMtryPh(){
		InputStream is =null;
		OutputStream os =null;
		try {
			os = response.getOutputStream();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try{
			Blob zpblob = service.queryZpxxById(id,"t_gzgl_mtry","mtryzmzp");
			if (zpblob != null){
				is = zpblob.getBinaryStream();
				byte[] b = new byte[1024];
				while(is.read(b) > 0){
					os.write(b);
					os.flush();
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(is != null){
					is.close();
				};
				if(os != null){
					os.close();
				}
				
			}catch (IOException e){
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 插入“迷途人员”照片
	 */
	public void insertMtryPh(){
		service.updateZpxxbyId(mtrybean.getId(),filezp,"updateMtryzpSQL");
	}
	/*
	 * 删除“迷途人员”照片
	 */
	public void deleteMtryPh(){
		try {
			service.deleteZpxxbyId(id,"deleteMtryzpSQL");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除“迷途人员”信息
	 */
	public void deleteMtryBean(){
		if (id != null){
			try {
				mtrybean = service.queryBeanById(MtryBean.class, id, "queryMtryBeanBYIdSQL");
				saveMtryBean();
			} catch (Exception e) {
				mtrybean = null;
				e.printStackTrace();
			}
		}
	}
	/**
	 * 查询弃婴信息列表
	 */
	public void queryQyryListAction(){
		if(qyryquery == null){
			qyryquery = new QyryQueryBean();
			initQueryBean(qyryquery);
		}
		PageResultInfo<QyryBean> list;
		try {
			list = service.queryPageList(QyryBean.class, qyryquery, "queryPageQyryListSQL", getPageInfo());
			responseWrite(list);
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	/**
	 *  跳转弹出“弃婴信息”页面
	 * 新增、修改、查看详情
	 * @return
	 */
	public String toQyryPage(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){//操作类型为新增
			if(qyrybean == null){
				qyrybean = new QyryBean();
			}
			//保存登记人信息
			qyrybean.setDjrxm(log.getRealname());
			qyrybean.setDjdwdm(log.getOrgcode());
			qyrybean.setCzrjh(log.getUsername());
			qyrybean.setDjdwmc(log.getOrgname());
			//登记时间
			qyrybean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));			
		}
		else				//修改信息或者查看信息
		{	//根据编号，获得该编号的弃婴信息明细
			try {
				qyrybean = service.queryBeanById(QyryBean.class, id, "queryQyryBeanBYIdSQL");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "toQyryPage";
	}
	/**
	 * 显示“弃婴信息”照片
	 */
	public void showQyryPh(){
		InputStream is =null;
		OutputStream os =null;
		try {
			os = response.getOutputStream();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try{
			Blob zpblob = service.queryZpxxById(id,"t_gzgl_qyry","qyryzmzp"); // 区别
			if (zpblob != null){
				is = zpblob.getBinaryStream();
				byte[] b = new byte[1024];
				while(is.read(b) > 0){
					os.write(b);
					os.flush();
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(is != null){
					is.close();
				};
				if(os != null){
					os.close();
				}
				
			}catch (IOException e){
				e.printStackTrace();
			}
		}
	}
	/**
	 * 插入弃婴照片信息
	 */
	public void insertQyryPh(){
		service.updateZpxxbyId(qyrybean.getId(),filezp,"updateQyryzpSQL");
	}
	/**
	 * 删除弃婴照片信息
	 */
	public void deleteQyryPh(){
		try {
			service.deleteZpxxbyId(id,"deleteQyryzpSQL");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除弃婴信息
	 */
	public void deleteQyryBean(){
		if (id != null){
			try {
				qyrybean = service.queryBeanById(QyryBean.class, id, "queryQyryBeanBYIdSQL");
				saveQyryBean();
			} catch (Exception e) {
				qyrybean = null;
				e.printStackTrace();
			}
		}
	}
	/**
	 * 保存弃婴信息（新增或修改）
	 */
	public void saveQyryBean(){
		boolean msgss = false ; //标志是否保存成功
		try {
			String sql = "";
			if (!"".equals(qyrybean.getId()) ){
				// 修改或删除
				
				if (CommonConstant.OPERTYPE_UPDATE.equals(operType)){
					sql = "updateQyrySQL";
					qyrybean.setCzdwdm(log.getOrgcode());
					qyrybean.setCzdwmc(log.getOrgname());
					qyrybean.setCzrjh(log.getUsername());
					qyrybean.setCzrxm(log.getRealname());
					qyrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				}else if (CommonConstant.OPERTYPE_DELETE.equals(operType)){
					sql = "deleteQyrySQL";
					qyrybean.setZxbs("2");
					qyrybean.setCzdwdm(log.getOrgcode());
					qyrybean.setCzdwmc(log.getOrgname());
					qyrybean.setCzrjh(log.getUsername());
					qyrybean.setCzrxm(log.getRealname());
					qyrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					qyrybean.setScsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				};
			}else{
				// 新增
				sql ="insertQyrySQL";
				// 获得主键id
				StringBuffer sbf = new StringBuffer();
				sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
				sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
				sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_QYRYID"));
				
				qyrybean.setId(sbf.toString());
				
				qyrybean.setCzdwdm(log.getOrgcode());
				qyrybean.setCzdwmc(log.getOrgname());
				qyrybean.setCzrjh(log.getUsername());
				qyrybean.setCzrxm(log.getRealname());
				qyrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				qyrybean.setDjdwdm(log.getOrgcode());
				qyrybean.setDjdwmc(log.getOrgname());
				qyrybean.setDjrxm(log.getRealname());
				qyrybean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				qyrybean.setZxbs("0");
			}
			msgss = service.saveBean(qyrybean, sql, operType);
			responseWrite(qyrybean);
		} catch (Exception e) {
			responseWrite(msgss);
			e.printStackTrace();
		}
	}
	/**
	 * 弹出弃婴移送信息窗口
	 */
	public String toQyryYsxxPage(){
		try {
			qyrybean = service.queryBeanById(QyryBean.class, id, "queryQyryBeanBYIdSQL");
			qyrybean.setQyysdjdwdm(log.getOrgcode());
			qyrybean.setQyysdjdwmc(log.getOrgname());
			qyrybean.setQyysdjrxm(log.getRealname());
			qyrybean.setQyysdjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toQyryYsxxPage";
	}
	/**
	 * 保存弃婴移送信息
	 */
	public void saveQyryYsxxBean(){
		boolean msgss = false;
		String sql = "updateQyryYsxxSQL";
		try {
			msgss = service.saveBean(qyrybean, sql, "update");
			responseWrite(msgss);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	/**
	 * 查询流浪乞讨人员列表
	 */
	public void queryQtryListAction(){
		if(qtryquery == null){
			qtryquery = new QtryQueryBean();
			initQueryBean(qtryquery);
		}
		PageResultInfo<QtryBean> list;
		try {
			list = service.queryPageList(QtryBean.class, qtryquery, "queryPageQtryListSQL", getPageInfo());
			responseWrite(list);
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	/**
	 * 查询乞讨人员亲戚朋友列表
	 */
	public void queryQtryqphyListAction(){
		if(qtryqyquery == null){
			qtryqyquery = new QtryqyQueryBean();
			initQueryBean(qtryqyquery);
		}
		qtryqyquery.setQtryid(id);
		PageResultInfo<QtryqyBean> list;
		try {
			list = service.queryPageList(QtryqyBean.class, qtryqyquery, "queryPageQyryqphyListSQL", getPageInfo());
			responseWrite(list);
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	
	/**
	 * 弹出乞讨人员登记修改页面
	 * @return
	 */
	public String toQtryPage(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){//操作类型为新增
			if(qtrybean == null){
				qtrybean = new QtryBean();
			}
			//保存登记人信息
			qtrybean.setDjrxm(log.getRealname());
			qtrybean.setDjdwdm(log.getOrgcode());
			qtrybean.setDjrjh(log.getUsername());
			qtrybean.setCzrjh(log.getUsername());
			qtrybean.setCzdwdm(log.getOrgcode());
			qtrybean.setCzdwmc(log.getOrgname());
			qtrybean.setCzrxm(log.getRealname());
			qtrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			qtrybean.setDjdwmc(log.getOrgname());
			//登记时间
			qtrybean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));			
		}
		else				//修改信息或者查看信息
		{	//根据编号，获得该编号的乞讨人员明细
			try {
				qtrybean = service.queryBeanById(QtryBean.class, id, "queryQtryBeanBYIdSQL");
				if(qtryqyquery == null){
					qtryqyquery = new QtryqyQueryBean();
				}
				qtryqyquery.setQtryid(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "toQtryPage";
	}
	/**
	 * 保存乞讨人员基本信息（新增或修改）
	 */
	public void saveQtryBean(){
		boolean msgss = false ; //标志是否保存成功
		try {
			String sql = "";
			if (!"".equals(qtrybean.getId()) ){
				// 修改或删除
				
				if (CommonConstant.OPERTYPE_UPDATE.equals(operType)){
					sql = "updateQtrySQL";
					qtrybean.setCzdwdm(log.getOrgcode());
					qtrybean.setCzdwmc(log.getOrgname());
					qtrybean.setCzrjh(log.getUsername());
					qtrybean.setCzrxm(log.getRealname());
					qtrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				}else if (CommonConstant.OPERTYPE_DELETE.equals(operType)){
					sql = "deleteQtrySQL";
					qtrybean.setZxbs("2");
					qtrybean.setCzdwdm(log.getOrgcode());
					qtrybean.setCzdwmc(log.getOrgname());
					qtrybean.setCzrjh(log.getUsername());
					qtrybean.setCzrxm(log.getRealname());
					qtrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
					qtrybean.setScsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				};
			}else{
				// 新增
				sql ="insertQtrySQL";
				// 获得主键id
				StringBuffer sbf = new StringBuffer();
				sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
				sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
				sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_QTRYID"));
				
				qtrybean.setId(sbf.toString());
				
				qtrybean.setCzdwdm(log.getOrgcode());
				qtrybean.setCzdwmc(log.getOrgname());
				qtrybean.setCzrjh(log.getUsername());
				qtrybean.setCzrxm(log.getRealname());
				qtrybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				qtrybean.setDjdwdm(log.getOrgcode());
				qtrybean.setDjdwmc(log.getOrgname());
				qtrybean.setDjrxm(log.getRealname());
				qtrybean.setDjrjh(log.getUsername());
				qtrybean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				qtrybean.setZxbs("0");
			}
			msgss = service.saveBean(qtrybean, sql, operType);
			responseWrite(qtrybean);
		} catch (Exception e) {
			responseWrite(msgss);
			e.printStackTrace();
		}
	}
	/**
	 * 显示乞讨人员照片
	 */
	public void showQtryPh(){
		InputStream is =null;
		OutputStream os =null;
		try {
			os = response.getOutputStream();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try{
			Blob zpblob = service.queryZpxxById(id,"t_gzgl_qtry","qtryzp"); // 区别
			if (zpblob != null){
				is = zpblob.getBinaryStream();
				byte[] b = new byte[1024];
				while(is.read(b) > 0){
					os.write(b);
					os.flush();
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(is != null){
					is.close();
				};
				if(os != null){
					os.close();
				}
				
			}catch (IOException e){
				e.printStackTrace();
			}
		}
	}
	/**
	 * 删除乞讨人员信息
	 */
	public void deleteQtryBean(){
		if (id != null){
			try {
				qtrybean = service.queryBeanById(QtryBean.class, id, "queryQtryBeanBYIdSQL");
				saveQtryBean();
			} catch (Exception e) {
				qtrybean = null;
				e.printStackTrace();
			}
		}
	}
	/**
	 * 新增（保存）乞讨人员照片
	 */
	public void insertQtryPh(){
		service.updateZpxxbyId(qtrybean.getId(),filezp,"updateQtryzpSQL");
	}
	/**
	 * 删除乞讨人员照片
	 */
	public void deleteQtryPh(){
		try {
			service.deleteZpxxbyId(id,"deleteQtryzpSQL");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 弹出新增乞讨人员亲戚朋友登记页面
	 * @return
	 */
	public String toQtryQyPage(){
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){//操作类型为新增
			if(qtryqybean == null){
				qtryqybean = new QtryqyBean();
			}
			//保存登记人信息
			qtryqybean.setDjrxm(log.getRealname());
			qtryqybean.setDjdwdm(log.getOrgcode());
			qtryqybean.setDjrjh(log.getUsername());
			qtryqybean.setCzrjh(log.getUsername());
			qtryqybean.setDjdwmc(log.getOrgname());
			//登记时间
			qtryqybean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));	
			qtryqybean.setQtryid(id);// 此为页面传的id---乞讨人员基本信息表主键id
		}
		return "toQtryQyPage";
	}
	/**
	 * 保存乞讨人员家庭成员和亲友信息
	 */
	public void saveQtryQyxxBean(){
		boolean msgss = false ; //标志是否保存成功
		try {
			String sql = "";
			// 新增
			sql ="insertQtryqyxxSQL";
			// 获得主键id
			StringBuffer sbf = new StringBuffer();
			sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
			sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
			sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_QTRYQYID"));
			
			qtryqybean.setId(sbf.toString());
			
			qtryqybean.setCzdwdm(log.getOrgcode());
			qtryqybean.setCzdwmc(log.getOrgname());
			qtryqybean.setCzrjh(log.getUsername());
			qtryqybean.setCzrxm(log.getRealname());
			qtryqybean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			qtryqybean.setDjdwdm(log.getOrgcode());
			qtryqybean.setDjdwmc(log.getOrgname());
			qtryqybean.setDjrxm(log.getRealname());
			qtryqybean.setDjrjh(log.getUsername());
			qtryqybean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			qtryqybean.setZxbs("0");
			
			msgss = service.saveBean(qtryqybean, sql, operType);
			responseWrite(qtryqybean);
		} catch (Exception e) {
			responseWrite(msgss);
			e.printStackTrace();
		}
	}
	/**
	 * 弹出乞讨人员移送信息登记页面
	 * @return
	 */
	public String toQtryYsxxPage(){
		try {
			qtrybean = service.queryBeanById(QtryBean.class, id, "queryQtryBeanBYIdSQL");
			qtrybean.setYsdjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			qtrybean.setYsdjrxm(log.getRealname());
			qtrybean.setYsdjdwdm(log.getOrgcode());
			qtrybean.setYsdjdwmc(log.getOrgname());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "toQtryYsxxPage";
	}
	/**
	 * 保存乞讨人员移送信息bean
	 */
	public void saveQtryYsxxBean(){
		boolean msgss = false;
		String sql = "updateQtryYsxxSQL";
		try {
			msgss = service.saveBean(qtrybean, sql, "update");
			responseWrite(msgss);
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	}
	
	/**
	 * 省厅治安系统开展排查填报（登记页面）
	 * @return
	 */
	public String toStZapctbPage(){
		log = ActionContextHelper.getLoginInfo();
		try {
			zapcquery = new StZapcQueryBean();
			zapcquery.setDjdwdm(log.getOrgcode());
			zapcquery.setTjyf(DateTimeHelper.getNowDateStr("yyyyMM"));
			ArrayList<ZapcTbBean> alist =  service.queryList(ZapcTbBean.class, zapcquery, "queryStZapctbByDjdwdmAndTjnySQL");
			if(alist!= null && alist.size()>0){
				stzapcbean = alist.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			if(stzapcbean == null){
				stzapcbean = new ZapcTbBean();
			}
			//保存登记人信息
			stzapcbean.setDjrxm(log.getRealname());
			stzapcbean.setDjrjh(log.getUsername());
			stzapcbean.setDjrsfzh(log.getSfzh());
			stzapcbean.setDjdwdm(log.getOrgcode());
			stzapcbean.setDjdwmc(log.getOrgname());
			//上级代码
			stzapcbean.setParentcode(log.getParent_code());
			//stzapcbean.setParentname(log.ge)
			// 单位级别
			stzapcbean.setLeve(""+log.getLeve());
			//登记时间
			stzapcbean.setTbsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));	
			stzapcbean.setTjyf(DateTimeHelper.getNowDateStr("yyyyMM"));
			//登记开始时间 -- 截至时间 本月4日至下月2日
			String ym = DateUtils.getYear()+DateUtils.getMonth()+"04";
			GregorianCalendar gc = new GregorianCalendar();
			gc.setTime(new Date());
			gc.add(2, 1);
			String yym = new SimpleDateFormat("yyyyMM").format(gc.getTime())+"03";
			stzapcbean.setTjqsrq(ym);
			stzapcbean.setTjjzrq(yym);
			strtitle = ym.substring(0, 4) + "年" 
			+ ym.substring(4, 6)+"月" + 
			ym.substring(6, 8)+"日"
			+ " - " + yym.substring(0, 4) + "年" + 
			yym.substring(4, 6) + "月" + yym.substring(6,8) + "日";
			// ip地址
			stzapcbean.setIp(this.getIpAddress());
			
			operType = "add";
			
		return "toStZapctbPage";
	}
	/**
	 * 保存省厅治安系统开展排查填报
	 */
	public void saveStZapctb(){
		boolean msgss = false ; //标志是否保存成功
		try {
			String sql = "";
			if(!"".equals(stzapcbean.getId())){
				// 修改
				if (CommonConstant.OPERTYPE_UPDATE.equals(operType)){
					sql = "updateStZapctbSQL";
				}
			}else{
				// 新增
				sql ="insertStZapcbeanSQL";
				// 获得主键id
				StringBuffer sbf = new StringBuffer();
				sbf.append(DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm"));
				sbf.append(DateTimeHelper.getNowDateStr("yyyyMMdd"));
				sbf.append(CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW, "SEQ_GZGL_STZAPCID"));
				stzapcbean.setId(sbf.toString());
			}	
			msgss = service.saveBean(stzapcbean, sql, operType);
			responseWrite(stzapcbean);
		} catch (Exception e) {
			responseWrite(msgss);
			e.printStackTrace();
		}
	}
	/**
	 * 根据登记单位代码和统计年月查询
	 * 省厅治安系统开展排查填报
	 */
	public void queryStZapctbByDjdwdmAndTjny(){
		List<ZapcTbBean> list;
		list = new ArrayList<ZapcTbBean>();
		ZapcTbBean obj = new ZapcTbBean();
		try {
			list = service.queryList(ZapcTbBean.class, zapcquery, "queryStZapctbByDjdwdmAndTjnySQL");
			if(list != null && list.size() > 0){
				obj = list.get(0);
			}
			responseWrite(obj);
		} catch (Exception e) {
			responseWrite(obj);
			e.printStackTrace();
		}
	}
	/**
	 * 省厅治安系统开展排查填报 报表
	 * @return
	 */
	public String toStZapctbbbPage(){
		
		return "toStZapctbbbPage";
	}
	/**
	 * 省厅治安系统开展排查 统计报表
	 */
	public void queryStZapctbTjBBByDjdwdmAndTjny(){
		List<ZapcTbBean> list1; // 治安
		list1 = new ArrayList<ZapcTbBean>();
		
		List<ZapcTbBean> list2; // 派出所
		list2 = new ArrayList<ZapcTbBean>();
		// 获取单位所在级别 1：省厅 2：市级3：县级4:派出所5：警务室
		
		List<ZapcTbBean> list; // 结果集合
		list = new ArrayList<ZapcTbBean>();
		ZapcTbBean bean1 = new ZapcTbBean(); // 第一行
		ZapcTbBean bean2 = new ZapcTbBean(); // 第二行
		
		try {
			list1 = service.queryList(ZapcTbBean.class, zapcquery, "queryStZapctbTjBBByDjdwdmAndTjny1SQL");
			list2 = service.queryList(ZapcTbBean.class, zapcquery, "queryStZapctbTjBBByDjdwdmAndTjny2SQL");
			if(list1 != null && list1.size() > 0){
				bean1 = list1.get(0);
				bean1.setId("1");
			}
			if(list2 != null && list2.size() > 0){
				bean2 = list2.get(0);
				bean2.setId("2");
			}
			list.add(bean1);
			list.add(bean2);
			responseWrite(list);
		} catch (Exception e) {
			responseWrite(list);
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 导出 省厅治安系统开展排查 统计报表 Excel
	 * @return
	 */
	public String downloadStZapcTbbExcel(){
		 stzapcbean = new ZapcTbBean();
		
		List<ZapcTbBean> list1; // 治安
		list1 = new ArrayList<ZapcTbBean>();
		
		List<ZapcTbBean> list2; // 派出所
		list2 = new ArrayList<ZapcTbBean>();
		// 获取单位所在级别 1：省厅 2：市级3：县级4:派出所5：警务室
		
		downloadZapctbList = new ArrayList<ZapcTbBean>();
		ZapcTbBean bean1 = new ZapcTbBean(); // 第一行
		ZapcTbBean bean2 = new ZapcTbBean(); // 第二行
		
		try {
			list1 = service.queryList(ZapcTbBean.class, zapcquery, "queryStZapctbTjBBByDjdwdmAndTjny1SQL");
			list2 = service.queryList(ZapcTbBean.class, zapcquery, "queryStZapctbTjBBByDjdwdmAndTjny2SQL");
			if(list1 != null && list1.size() > 0){
				bean1 = list1.get(0);
				stzapcbean = list1.get(0);
				bean1.setId("治安各部门<br/>（总和）");
			}
			if(list2 != null && list2.size() > 0){
				bean2 = list2.get(0);
				bean2.setId("其中派出所<br/>（总和）");
			}
			
			stzapcbean.setTitless(zapcquery.getTitless());
			stzapcbean.setTbdwmc(zapcquery.getTbdwmc());
			stzapcbean.setTbrxm(zapcquery.getTbrxm());
			downloadZapctbList.add(bean1);
			downloadZapctbList.add(bean2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "downloadStZapcTbbExcel";
	}
	/**
	 *全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况月报表
	 *明细
	 *queryStZapctbTjBBByDjdwdmAndTjny1SQL
	 * @return
	 */
	public String openStZapcTbbMingXi(){
		mingxiZapctbList = new ArrayList<ZapcTbBean>();
		try {
			String sql ="";
			if("0".equals(zapcquery.getJb())){
				sql = "queryStZapctbTjBBByDjdwdmAndTjnyMingxiASQL" ; // 治安
			}else if("1".equals(zapcquery.getJb())){
				sql = "queryStZapctbTjBBByDjdwdmAndTjnyMingxiBSQL" ; // 派出所
			}
			mingxiZapctbList = service.queryList(ZapcTbBean.class, zapcquery, sql);
			if(mingxiZapctbList != null && mingxiZapctbList.size() >0){
				stzapcbean = mingxiZapctbList.get(0);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "openStZapcTbbMingXi";
	}
	/**
	 * 全国治安系统开展排查发现及时化解提前处置个人极端暴力犯罪工作情况月报表
	 * 点击单位名称， 更新备注说明内容
	 */
	public void queryStZapcTbbMingXiLgzy(){
		try {
			List<ZapcTbBean> list = new ArrayList<ZapcTbBean>();
			list =	service.queryList(ZapcTbBean.class, zapcquery, "queryStZapcTbbMingXiLgzy") ;
			if(list != null && list.size()>0){
				stzapcbean = list.get(0);
			}
			responseWrite(stzapcbean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public QyryQueryBean getQyryquery() {
		return qyryquery;
	}

	public void setQyryquery(QyryQueryBean qyryquery) {
		this.qyryquery = qyryquery;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public MtryQueryBean getMtryquery() {
		return mtryquery;
	}

	public void setMtryquery(MtryQueryBean mtryquery) {
		this.mtryquery = mtryquery;
	}

	public MtryBean getMtrybean() {
		return mtrybean;
	}

	public void setMtrybean(MtryBean mtrybean) {
		this.mtrybean = mtrybean;
	}

	public QyryBean getQyrybean() {
		return qyrybean;
	}

	public void setQyrybean(QyryBean qyrybean) {
		this.qyrybean = qyrybean;
	}

	public QtryQueryBean getQtryquery() {
		return qtryquery;
	}

	public void setQtryquery(QtryQueryBean qtryquery) {
		this.qtryquery = qtryquery;
	}

	public QtryBean getQtrybean() {
		return qtrybean;
	}

	public void setQtrybean(QtryBean qtrybean) {
		this.qtrybean = qtrybean;
	}

	public QtryqyBean getQtryqybean() {
		return qtryqybean;
	}

	public void setQtryqybean(QtryqyBean qtryqybean) {
		this.qtryqybean = qtryqybean;
	}

	public QtryqyQueryBean getQtryqyquery() {
		return qtryqyquery;
	}

	public void setQtryqyquery(QtryqyQueryBean qtryqyquery) {
		this.qtryqyquery = qtryqyquery;
	}

	public QtfwBean getQtfwbean() {
		return qtfwbean;
	}

	public void setQtfwbean(QtfwBean qtfwbean) {
		this.qtfwbean = qtfwbean;
	}

	public QtfwQueryBean getQtfwquery() {
		return qtfwquery;
	}

	public void setQtfwquery(QtfwQueryBean qtfwquery) {
		this.qtfwquery = qtfwquery;
	}

	public ZapcTbBean getStzapcbean() {
		return stzapcbean;
	}

	public void setStzapcbean(ZapcTbBean stzapcbean) {
		this.stzapcbean = stzapcbean;
	}

	public List<ZapcTbBean> getMingxiZapctbList() {
		return mingxiZapctbList;
	}

	public void setMingxiZapctbList(List<ZapcTbBean> mingxiZapctbList) {
		this.mingxiZapctbList = mingxiZapctbList;
	}
}
