package com.chinacreator.qzgl.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.qzgl.bean.JfcyrxxBean;
import com.chinacreator.qzgl.bean.JftjdjxxBean;
import com.chinacreator.qzgl.query.JftjQueryBean;
import com.chinacreator.qzgl.services.JftjService;

public class JftjAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8353342544983885264L;
	/**
	 * 
	 */
	
	private JftjdjxxBean jftjBean;
	private JftjService service;
	private JfcyrxxBean jfcyrxxBean;
	private JftjQueryBean queryBean;
	private String operType;
	private String bh;
	private String bhs;
	private String dsrbh;
	
	public JftjAction(){
		super();
		service = new JftjService();
		jftjBean = new JftjdjxxBean();
		queryBean = new JftjQueryBean();
	}
	
	public String toJftjList(){
		initQueryBean(queryBean);
    	return "toJftyList";
    }
	
	/**
	 * 跳转到添加纠纷信息界面
	 * @return
	 * @throws SQLException 
	 */
	public String tojftjInfo() throws SQLException
	{
		if(CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			jftjBean = service.getJftjByBh(bh);
			List<JfcyrxxBean> jfcyList =new ArrayList<JfcyrxxBean>();
			jfcyList = service.getJfcyrxxByjfbh(bh);
			jftjBean.setJfcyList(jfcyList);
		}
		else if (CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			jftjBean = service.getJftjByBh(bh);
			List<JfcyrxxBean> jfcyList =new ArrayList<JfcyrxxBean>();
			jfcyList = service.getJfcyrxxByjfbh(bh);
			jftjBean.setJfcyList(jfcyList);
		}
		return "addJftjInfo";
	}
    
    /**
     * 查询纠纷调解信息
     * @return
     * @throws SQLException 
     */
    public void queryList() throws SQLException{
    	PageResultInfo<JftjdjxxBean> resultInfo = service.queryJftjxx(queryBean,getPageInfo());
    	responseWrite(resultInfo);
    }

    /**
     * 添加纠纷调解信息
     * @return
     * @throws SQLException 
     * @throws RollbackException 
     */
    public void saveJftjdjxx()
    {
    	try
    	{
    		service.saveJftjdjxx(jftjBean, operType);
    		responseWrite(jftjBean.getBh());
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		responseWrite(null);
    	}
		
    }
    
    /**
     * 删除当事人信息
     * @throws SQLException 
     */
    public void deleteJf() throws SQLException{
    	service.deleteJfdsrxx(bh);
    	responseWrite(true);
    }
    /**
     * 删除纠纷调解信息
     * @return
     * @throws SQLException 
     * @throws RollbackException 
     */
    public void deleteJftj() throws SQLException, RollbackException{
    	service.deleteJftjxx(bh);
    	responseWrite(true);
    }
    
    /**
     * 批量删除纠纷调解信息
     * 
     * @return
     * @throws Exception 
     */
    public void deleteJftjxx() throws Exception{
    	service.deleteJftjxxByBh(bhs);
    	responseWrite(true);
    }
    
    /**
     * 跳转到当事人信息填写界面
     * @return
     * @throws SQLException 
     */
    public String toAddDsrxx() throws SQLException{
    	if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			if(jfcyrxxBean == null){
				jfcyrxxBean = new JfcyrxxBean();
			}
		}else{
			jfcyrxxBean = service.getJftjcyrxxbybh(dsrbh);
		}
    	return "toAddDsrxx";
    }
    
    /**
     * 显示当事人信息
     * @return
     * @throws SQLException 
     */
    public void queryjftjdsrList() throws SQLException{
    	PageResultInfo<JfcyrxxBean> listInfo = service.getJftjcyrxxbyjfbh(bh,getPageInfo());
    	responseWrite(listInfo);
    }
    
    /**
     * 保存或者修改当事人信息
     * @return
     * @throws SQLException 
     */
    public void saveorupdatedsrxx() throws SQLException{
    	service.saveorupdatedsrxx(jfcyrxxBean,operType);
    }
    
    /**
     * 一桩纠纷 同一个sfzh不能保存多个
     * @return
     * @throws Exception 
     */
    public void isExistSfzhInSameJf() throws Exception{
    	boolean flag = service.isExistSfzh(jfcyrxxBean.getSfzh(), jftjBean.getBh());
    	responseWrite(flag);
    }
    public JftjdjxxBean getJftjBean() {
		return jftjBean;
	}
	public void setJftjBean(JftjdjxxBean jftjBean) {
		this.jftjBean = jftjBean;
	}
	
	
    public JfcyrxxBean getJfcyrxxBean() {
		return jfcyrxxBean;
	}
	public void setJfcyrxxBean(JfcyrxxBean jfcyrxxBean) {
		this.jfcyrxxBean = jfcyrxxBean;
	}
	
	
	public JftjQueryBean getQueryBean() {
		return queryBean;
	}
	public void setQueryBean(JftjQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}

	public String getBhs() {
		return bhs;
	}

	public void setBhs(String bhs) {
		this.bhs = bhs;
	}

	public String getDsrbh() {
		return dsrbh;
	}

	public void setDsrbh(String dsrbh) {
		this.dsrbh = dsrbh;
	}
	
	
}
