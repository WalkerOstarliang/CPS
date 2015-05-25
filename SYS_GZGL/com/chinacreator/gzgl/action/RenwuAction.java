package com.chinacreator.gzgl.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.MinjChuliBean;
import com.chinacreator.gzgl.bean.MinjingBean;
import com.chinacreator.gzgl.bean.RenwuBean;
import com.chinacreator.gzgl.bean.RenwuJiegBean;
import com.chinacreator.gzgl.bean.RwfjBean;
import com.chinacreator.gzgl.query.RenwuQuery;
import com.chinacreator.gzgl.service.RenwuService;

public class RenwuAction extends CPSBaseAction
{
	private static final long serialVersionUID = -2846373426389242794L;
	
	private RenwuBean renwuBean;
	
	private RenwuService renwuService;
	
	private List<RenwuBean> renwuList;
	
	private RenwuQuery renwuQuery;
	
	
	private MinjChuliBean minjChliBean;
	private RwfjBean fjBean;
	private RwfjBean fjfkBean;
	private File rwUploads;
	private String rwUploadsFileName;
	private File fkUploads;
	private String fkUploadsFileName;
	private String bh;
	
	public RenwuAction() 
	{
		renwuBean = new RenwuBean();
		renwuService = new RenwuService();
		renwuQuery = new RenwuQuery();
	}
	
	public String init()
	{	
		return "init";
	}
	
	/**
	 * 跳转到任务登记新增页面
	 * @return
	 */
	public String toAddRenwu()
	{
		renwuBean.setOp(CommonConstant.OPERTYPE_ADD);
		return "toAddRenwu";
	}
	
	/**
	 * 提交任务登记数据
	 */
	public void submitRenwuBean()
	{
		List<MinjingBean> mjins = renwuBean.getMjins();
		if (ValidateHelper.isEmptyCollection(mjins))
		{
			responseWrite(1);//校验关联民警列表
			return;
		}
		String tip = "";
		if(renwuService.submitRenwuBean(renwuBean,fjBean,rwUploads,rwUploadsFileName,fkUploads,fkUploadsFileName)){
			tip = "保存成功!";
		}else{
			tip = "保存失败!";
		}
		responseWrite(tip);
	}
	
	/**
	 * 删除登记任务
	 */
	public void delRenwu(){
		String tip = "";
		if(renwuService.delRenwu(bh)){
			tip = "删除任务成功!";
		}else{
			tip = "删除任务失败!";
		}
		responseWrite(tip);
	}
	
	/**
	 * 签收任务
	 * @throws Exception 
	 */
	public void qsRenwu() throws Exception{
		String tip = "";
		if(renwuService.qsRenwu(bh)){
			tip = "任务签收成功!";
		}else{
			tip = "任务签收失败!";
		}
		responseWrite(tip);
	} 
	
	/**
	 * 查询任务列表
	 */
	public void queryRenwuList()
	{
		PageResultInfo<RenwuBean> renwuList = renwuService.getRenwuListPage(renwuQuery, getPageInfo());
		responseWrite(renwuList);
	}
	/**
	 * 查询任务处理列表
	 * @throws SQLException 
	 */
	public void queryRenwuclList() throws SQLException{
		PageResultInfo<RenwuBean> renwuclList = renwuService.getRenwuclListPage(renwuQuery, getPageInfo());
		responseWrite(renwuclList);
	}
	/**
	 * 跳转到任务视图（详情、修改）
	 * @return
	 * @throws SQLException 
	 */
	public String toViewRenwu() throws SQLException
	{
		
		if (ValidateHelper.isEmptyString(renwuQuery.getRwbh()))
		{
			return ERROR;
		}
		//根据任务编号查询任务详细信息
		List<RenwuBean> renwuList = renwuService.getRenwuList(renwuQuery);
		if (ValidateHelper.isNotEmptyCollection(renwuList) && renwuList.size() > 0)
		{
			renwuBean = renwuList.get(0);
			fjBean = renwuService.getRwfjBeanById(renwuBean.getRwfjid());
		}
		queryMinjs();
		queryRenwuFkxx();
		
		renwuBean.setOp(renwuQuery.getOp());
		return "toViewRenwu";
	}
	
	/**
	 * 查询任务执行民警
	 */
	protected void queryMinjs()
	{
		if (ValidateHelper.isEmptyString(renwuQuery.getRwbh()))
		{
			return;
		}
		Map<String, String> params = new HashMap<String, String>();
		params.put("rwbh", renwuQuery.getRwbh());
		List<MinjingBean> minjs = renwuService.getMinjingList(params);
		PageResultInfo<MinjingBean> minjsPage = PaginationHelper.wrapPageResultInfo(getPageInfo(), (long)minjs.size(), minjs);
		renwuBean.setMjins(minjs);
		responseWrite(minjsPage);
	}
	
	/**
	 * 查询任务反馈信息
	 * @throws SQLException 
	 */
	protected void queryRenwuFkxx() throws SQLException{
		if (ValidateHelper.isEmptyString(renwuQuery.getRwbh()))
		{
			return;
		}
		List<RenwuJiegBean> list = renwuService.queryRenwuFkxx(renwuQuery);
		for(RenwuJiegBean fk:list){
			fjfkBean = renwuService.getRwfjBeanById(fk.getFjid());
			if(fjfkBean!=null){
			fk.setFjtitle(fjfkBean.getTitle());
			}
		}
		renwuBean.setRwCljg(list);
	}
	
	public String toMjRenwu()
	{
		return "toMjRenwu";
	}
	
	/**
	 * 查询任务反馈
	 */
	public void queryRenwufk()
	{
		initQueryBean(renwuQuery);
		PageResultInfo<RenwuJiegBean> chulis = renwuService.getMinjChuliListPage(renwuQuery, getPageInfo());
		responseWrite(chulis);
	}
	
	/*@Override
	protected void initQueryBean(QueryBean queryBean)
	{
		super.initQueryBean(queryBean);
		queryBean.setUsername(ActionContextHelper.getLoginInfo().getUsername());
	}*/

	protected RenwuJiegBean loadRenwJieg()
	{
		if (ValidateHelper.isEmptyString(renwuQuery.getRwbh()) 
				|| ValidateHelper.isEmptyString(renwuQuery.getClmjid()))
		{
			return null;
		}
		
		List<RenwuJiegBean> minjChulis = renwuService.getMinjChuliList(renwuQuery);
		if (minjChulis != null && minjChulis.size() > 0)
		{
			return minjChulis.get(0);
		}
		return null;
	}
	
	/**
	 * 跳转到反馈页面
	 * @return
	 */
	public String toFankuiRenwu()
	{
		RenwuJiegBean renwuJieg = loadRenwJieg();
		if (renwuJieg != null)
		{
			renwuJieg.setOp(CommonConstant.OPERTYPE_QT);
			request.setAttribute("chli", renwuJieg);
			return "toFankRenwu";
		}
		return ERROR;
	}

	/**
	 * 跳转到任务反馈视图
	 * @return
	 */
	public String toViewFankuiRenwu()
	{
		RenwuJiegBean renwuJieg = loadRenwJieg();
		if (renwuJieg != null)
		{
			renwuJieg.setOp(CommonConstant.OPERTYPE_DETAIL);
			request.setAttribute("chli", renwuJieg);
			return "toViewFankuiRenwu";
		}
		return ERROR;
	}
	
	/**
	 * 跳转至任务处理详情界面
	 * @throws SQLException 
	 */
	public String toViewRenwucl() throws SQLException{
		if (ValidateHelper.isEmptyString(renwuQuery.getRwbh()))
		{
			return ERROR;
		}
		//根据任务编号查询任务详细信息
		List<RenwuBean> renwuList = renwuService.getRenwuList(renwuQuery);
		if (ValidateHelper.isNotEmptyCollection(renwuList) && renwuList.size() > 0)
		{
			renwuBean = renwuList.get(0);
			fjBean = renwuService.getRwfjBeanById(renwuBean.getRwfjid());
		}
		queryMinjs();
		queryRenwuFkxx();
		return "toViewRenwucl";
	}
	
	/**
	 * 提交任务反馈结果
	 * 处理结果：
	 * 0：未完成
	 * 1：已完成
	 * 2：部分完成
	 * 3：其他
	 */
	public void submitRenwuChliJieg()
	{
		String id = minjChliBean.getId();
		
		if (ValidateHelper.isEmptyString(id) || ValidateHelper.isEmptyString(minjChliBean.getRwbh()))
		{
			responseWrite("2");
			return;
		}
		renwuService.submitMinjChliBean(minjChliBean);
	}
	
	/**
	 * 跳转到任务派发列表
	 * @return
	 */
	public String toRwListPage(){
		initQueryBean(renwuQuery);
		return "toRwListPage";
	}
	
	/**
	 * 任务附件下载
	 * @return
	 * @throws SQLException 
	 * @throws UnsupportedEncodingException 
	 */
	public void downloadrwfjxx() throws SQLException, UnsupportedEncodingException{
		fjBean = renwuService.getRwfjBeanById(fjBean.getId());
		File b = fjBean.getFj();
		String filename = null;
		if(request.getHeader("User-Agent").toLowerCase().indexOf("firefox")>0){
			filename = new String(fjBean.getTitle().getBytes("utf-8"),"ISO8859-1");
		}else{
			filename = URLEncoder.encode(fjBean.getTitle(), "UTF-8");//IE浏览器
		}
		if(b!=null){
			try {
				response.reset();
				response.setContentType("application/octet-stream;charset=utf-8");
				response.setHeader("Content-Disposition", "attachment;filename="+filename);
					FileInputStream fis = new FileInputStream(b);	
					OutputStream out = response.getOutputStream();
					byte[] buff = new byte[1024];
					int d = 0;
					while((d=fis.read(buff,0,1024))!=-1){
						out.write(buff,0,d);
					}
					out.flush();
					fis.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		/*Blob fj= renwuService.getRwfjById(fjBean.getId());
		InputStream is =  null;
		try
		{
			is = fj.getBinaryStream();
			byte[] b = new byte[1024];
			while(is.read(b) > 0)
			{
				response.getOutputStream().write(b);
				response.getOutputStream().flush();
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
				is.close();
				response.getOutputStream().close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}*/
		
	}
	

	public List<RenwuBean> getRenwuList()
	{
		return renwuList;
	}

	public void setRenwuList(List<RenwuBean> renwuList)
	{
		this.renwuList = renwuList;
	}

	public RenwuQuery getRenwuQuery()
	{
		return renwuQuery;
	}

	public void setRenwuQuery(RenwuQuery renwuQuery)
	{
		this.renwuQuery = renwuQuery;
	}
	
	public RenwuBean getRenwuBean()
	{
		return renwuBean;
	}

	public void setRenwuBean(RenwuBean renwuBean)
	{
		this.renwuBean = renwuBean;
	}
	
	public MinjChuliBean getMinjChliBean()
	{
		return minjChliBean;
	}

	public void setMinjChliBean(MinjChuliBean minjChliBean)
	{
		this.minjChliBean = minjChliBean;
	}

	public RwfjBean getFjBean() {
		return fjBean;
	}

	public void setFjBean(RwfjBean fjBean) {
		this.fjBean = fjBean;
	}

	public File getRwUploads() {
		return rwUploads;
	}

	public void setRwUploads(File rwUploads) {
		this.rwUploads = rwUploads;
	}

	public String getRwUploadsFileName() {
		return rwUploadsFileName;
	}

	public void setRwUploadsFileName(String rwUploadsFileName) {
		this.rwUploadsFileName = rwUploadsFileName;
	}

	public File getFkUploads() {
		return fkUploads;
	}

	public void setFkUploads(File fkUploads) {
		this.fkUploads = fkUploads;
	}

	public String getFkUploadsFileName() {
		return fkUploadsFileName;
	}

	public void setFkUploadsFileName(String fkUploadsFileName) {
		this.fkUploadsFileName = fkUploadsFileName;
	}

	public RwfjBean getFjfkBean() {
		return fjfkBean;
	}

	public void setFjfkBean(RwfjBean fjfkBean) {
		this.fjfkBean = fjfkBean;
	}

	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}
	
	

	

	
}
