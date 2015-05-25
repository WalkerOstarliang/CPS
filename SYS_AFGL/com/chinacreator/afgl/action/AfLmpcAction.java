package com.chinacreator.afgl.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.RollbackException;

import com.chinacreator.afgl.bean.AflmpcBean;
import com.chinacreator.afgl.bean.AflmpcZpxxBean;
import com.chinacreator.afgl.bean.AflmpctxrBean;
import com.chinacreator.afgl.query.LmpcxxQuery;
import com.chinacreator.afgl.services.AflmpcService;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import org.apache.commons.codec.binary.Base64;
public class AfLmpcAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8947778088455144930L;
	
	private LmpcxxQuery queryBean;
	private AflmpcBean lmpcBean;
	private AflmpcZpxxBean lmpczpxxBean;
	private AflmpcService lmpcService;
	private String operType;
	private String jlbh;
	private String v_jlbh;
	private AflmpctxrBean txrBean;
	private String id;
	private List<AflmpctxrBean> txrBeanList;
	
	// 路面盘查导出LIST
	private List<AflmpcBean> lmpcxxList;
	
	/*用户机构代码*/
	private String userOrgCode;
	/*用户机构名称*/
	private String userOrgName;
	
	
	
	public String getUserOrgCode() {
		return userOrgCode;
	}
	public void setUserOrgCode(String userOrgCode) {
		this.userOrgCode = userOrgCode;
	}
	public String getUserOrgName() {
		return userOrgName;
	}
	public void setUserOrgName(String userOrgName) {
		this.userOrgName = userOrgName;
	}
	public List<AflmpcBean> getLmpcxxList() {
		return lmpcxxList;
	}
	public void setLmpcxxList(List<AflmpcBean> lmpcxxList) {
		this.lmpcxxList = lmpcxxList;
	}
	public AfLmpcAction(){
		queryBean = new LmpcxxQuery();
		lmpcBean = new AflmpcBean();
		lmpcService = new AflmpcService();
		txrBean = new AflmpctxrBean();
		txrBeanList = new ArrayList<AflmpctxrBean>();
		lmpcxxList = new ArrayList<AflmpcBean>();
	}
	/**
	 * 跳转至路面盘查列表界面
	 * @return
	 */
	public String toLmpcList(){
		super.initQueryBean(queryBean);
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		
		if(loginInfo.getLeve() == 2){
			userOrgCode = loginInfo.getCitygajgdm();
		}else if(loginInfo.getLeve() == 3){
			userOrgCode = loginInfo.getCountrygajgdm();
		}else if(loginInfo.getLeve() == 4){
			userOrgCode = loginInfo.getPcsdm();
		}else if(loginInfo.getLeve() == 5){
			userOrgCode = loginInfo.getJwsqdm();
		};
		userOrgName = DictionaryCacheHellper.getOrganizationOrgNameByCode(userOrgCode);
		
		this.responseWrite(loginInfo);
		return "toLmpcList";
	}
	/**
	 * 查询路面盘查列表
	 * @throws SQLException
	 */
	public  void  queryLmpcList() throws SQLException{
		queryBean.setQuerydwdm(queryBean.getOrgcode());
		PageResultInfo<AflmpcBean> resultInfo = lmpcService.queryLmpcList(queryBean,getPageInfo());
		responseWrite(resultInfo);
	}
	/**
	 * 注销路面盘查信息
	 */
	public void zxLmpcxx(){
		boolean result = false;
		result = lmpcService.updateZxLmpcxx(v_jlbh);
		responseWrite(result);
	}
	/**
	 * 跳转至路面盘查新增界面
	 * @return
	 * @throws SQLException 
	 */
	public  String toAddLmpcxx() throws SQLException{
		lmpcBean = lmpcService.queryLmpcBeanByJlbh(jlbh);
		return "toAddLmcpPage";
	}
	
	/**
	 * 保存路面盘查信息
	 * @return
	 * @throws RollbackException 
	 */
	public void addLmpcxx() throws RollbackException{
		lmpcService.saveLmpcxx(operType,lmpcBean,txrBeanList);
		responseWrite(true);
	}
	
	/**
	 * 查询同行人列表
	 * @return
	 * @throws SQLException 
	 */
	public void queryLmpctxrList() throws SQLException{
		PageResultInfo<AflmpctxrBean> txrBeanlistInfo = lmpcService.queryLmpctxrBeanList(jlbh,getPageInfo());
		responseWrite(txrBeanlistInfo);
	}
	
	/**
	 * 根据id删除同行人信息
	 * @return
	 * @throws SQLException 
	 */
	public void deltxrxx() throws SQLException{
		lmpcService.deltxrxxById(id);
		responseWrite(true);
	}
	
	/**
	 * 查询并显示路面盘查抽过来的照片
	 * @return
	 */
	public void ShowLmpcZpxx(){
		OutputStream out = null;
		InputStream in = null;
		try
		{
			out = response.getOutputStream();
			if (ValidateHelper.isNotEmptyString(jlbh))
			{
				
				//查询抽取过来的路面盘查照片
				lmpczpxxBean = new AflmpcZpxxBean();
				lmpczpxxBean.setZapc_xxbh(jlbh);
				Blob blob = lmpczpxxBean.getZapc_bcrxp();
				if (blob == null)
				{
					String xpStr = "";
					if (ValidateHelper.isNotEmptyString(xpStr) && xpStr.length() > 100)
					{
						// 服务器中心异常
						byte[] bytes = Base64.decodeBase64(xpStr.getBytes());
						out.write(bytes);
					}
					else
					{
						in = new FileInputStream(request.getSession().getServletContext().getRealPath("/systemico/default_zp.png"));
						if (in == null) return ;
						byte[] b = new byte[1024];
						while(in.read(b) > 0)
						{
							out.write(b);
						}
					}
				}
				else
				{
					in = blob.getBinaryStream();
					if (in == null) return ;
					byte[] b = new byte[1024];
					while(in.read(b) > 0)
					{
						out.write(b);
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				in.close();
				out.close();
			}
			catch(Exception e)
			{
			}
		}
		
	}
	/**
	 * 导出路面盘查信息
	 * @return
	 */
	public String  downloadlmpcExcel(){
		queryBean.setQuerydwdm(queryBean.getOrgcode());
		lmpcxxList=lmpcService.queryLmpcBeanListDown(queryBean);
		return "downloadlmpclistpage";
	}
	
	/**
	 * 选择某几条路面盘查记录导出
	 * @return
	 */
	public String downloadxzlmpcExcel(){
		lmpcxxList=lmpcService.queryLmpcBeanListXZDown(v_jlbh);
		return "downloadlmpclistpage";
	}
	
	public LmpcxxQuery getQueryBean() {
		return queryBean;
	}
	public void setQueryBean(LmpcxxQuery queryBean) {
		this.queryBean = queryBean;
	}
	public AflmpcBean getLmpcBean() {
		return lmpcBean;
	}
	public void setLmpcBean(AflmpcBean lmpcBean) {
		this.lmpcBean = lmpcBean;
	}
	public String getOperType() {
		return operType;
	}
	public void setOperType(String operType) {
		this.operType = operType;
	}
	public String getJlbh() {
		return jlbh;
	}
	public void setJlbh(String jlbh) {
		this.jlbh = jlbh;
	}
	public AflmpctxrBean getTxrBean() {
		return txrBean;
	}
	public void setTxrBean(AflmpctxrBean txrBean) {
		this.txrBean = txrBean;
	}
	public List<AflmpctxrBean> getTxrBeanList() {
		return txrBeanList;
	}
	public void setTxrBeanList(List<AflmpctxrBean> txrBeanList) {
		this.txrBeanList = txrBeanList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getV_jlbh() {
		return v_jlbh;
	}
	public void setV_jlbh(String v_jlbh) {
		this.v_jlbh = v_jlbh;
	}
	
	
}
