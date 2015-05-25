package com.chinacreator.xtgl.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.xtgl.bean.BywclBean;
import com.chinacreator.xtgl.bean.KhpmBean;
import com.chinacreator.xtgl.bean.SjcjslBean;
import com.chinacreator.xtgl.bean.SqkhtjBean;
import com.chinacreator.xtgl.bean.WtsjtjfxBean;
import com.chinacreator.xtgl.bean.WtsjtjfxpzBean;
import com.chinacreator.xtgl.query.KhkpQueryBean;
import com.chinacreator.xtgl.query.WtsjtjfxQueryBean;
import com.chinacreator.xtgl.service.KhkpService;
import com.chinacreator.xtgl.service.impl.KhkpServiceImpl;
/**
 * 考核考评
 */
public class KhkpAction extends CPSBaseAction {

	private static final long serialVersionUID = 1L;
	
	
	private KhpmBean khpm;
	private KhkpQueryBean query;
	private SqkhtjBean sqkhtj;
	private KhkpService service;
	private List<SqkhtjBean> sqtjDataList;
	private List<KhpmBean> khkpDataList;
	private WtsjtjfxQueryBean queryBean;
	private List<WtsjtjfxBean> wtsjBeans;
	private Map<String,Object> tableContentMap;
	
	private SjcjslBean sjcjsl;
	
	/**
	 * 本月未处理
	 */
	private BywclBean bywcl;
	
	private List<BywclBean> bywclList;
	
	public KhkpAction(){
		super();
		khpm = new KhpmBean();
		query = new KhkpQueryBean();
		sqkhtj = new SqkhtjBean();
		service = new KhkpServiceImpl();
		sqtjDataList = new ArrayList<SqkhtjBean>();
		khkpDataList = new ArrayList<KhpmBean>();
		sjcjsl = new SjcjslBean();
	}

	//查询社区考核统计
	public String querySqkhtj(){
		sqtjDataList = service.querySqkhtj(query);
		return "sqkhtj_" + query.getTjlb();
	}
	
	//查询统计
	public void queryKhkp(){
		responseWrite(service.queryKhkp(query));
	}
	
	//查询大类统计
	public String queryKhkpDl(){
		khkpDataList = service.queryKhkpDl(query);
		return "queryKhkpDl";
	}
	
	//查询细类统计
	public String queryKhkpXl(){
		khkpDataList = service.queryKhkpXl(query);
		return "queryKhkpXl";
	}
	
	//跳转到考核考评页面
	public String toKhkpPage(){
		return "toKhkpPage";
	}
	
	//跳转到社区考核统计页面
	public String toSqkhtjPage(){
		return "toSqkhtjPage";
	}
	
	/**
	 * 跳转到问题数据分析页面
	 * @return
	 */
	public String toWtsjflListPage()
	{
		return "toWtsjflListPage";
	}
	
	public void queryWtsltjfxList()
	{
		PageResultInfo<WtsjtjfxBean> pageResultInfo = service.queryWtsjtjfxBeanList(queryBean, getPageInfo());
		responseWrite(pageResultInfo);
	}
	
	public void queryWtsltjfxBakList()
	{
		PageResultInfo<WtsjtjfxBean> pageResultInfo = service.queryWtsjtjfxBakBeanList(queryBean, getPageInfo());
		responseWrite(pageResultInfo);
	}
	
	public String exportWtsjtjPage()
	{
		queryBean.setUsePage(false);
		PageResultInfo<WtsjtjfxBean> pageResultInfo = service.queryWtsjtjfxBeanList(queryBean, getPageInfo());
		wtsjBeans = pageResultInfo.getDatas();
		return "exportWtsjtjPage";
	}
	
	public String exportWtsjtjBakPage()
	{
		queryBean.setUsePage(false);
		PageResultInfo<WtsjtjfxBean> pageResultInfo = service.queryWtsjtjfxBakBeanList(queryBean, getPageInfo());
		wtsjBeans = pageResultInfo.getDatas();
		return "exportWtsjtjBakPage";
	}
	
	public String toOpenWtsjInfoPage()
	{
		try{
			WtsjtjfxpzBean pzBean = service.queryWtsjtjfxpzBean(queryBean.getSjtype());
			
			WtsjtjfxBean bean = service.queryWtsjtjfxBeanByOrgcodeAndTjrq(queryBean.getOrgcode(), queryBean.getTjrq());
			
			pzBean.setOrgcode(queryBean.getOrgcode());
			pzBean.setTjqssj(bean.getTjqssj());
			pzBean.setTjjzsj(bean.getTjjzsj());
			
			tableContentMap = service.executeQueryWtDataByPzBean(pzBean);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if (queryBean.isExport())
		{
			return "toExportWtsjPage";
		}
		else
		{
			return "toOpenWtsjPage";
		}
	}
	
	public String toExportMjDetailWin()
	{
		wtsjBeans = service.queryMjDetailInfoList(queryBean);
		return "toExportMjDetailWin";
	}
	
	//导出考核统计报表excel
	public void downLoadExcel(){
		String fileName = "";
		try {
			fileName = URLEncoder.encode("考核统计报表", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		response.setContentType("application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename="+fileName+".xls");
		response.setHeader("accept-encoding", "UTF-8");
		
		try {
			HSSFWorkbook wb = new HSSFWorkbook();
			service.downLoadExcel(wb,query);
			wb.write(response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				response.getOutputStream().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 导出数据采集数量
	 */
	public void downloadCjsl(){
		
		String fileName = "";
		try {
			fileName = URLEncoder.encode("采集量统计表", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		response.setContentType("application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment;filename="+fileName+".xls");
		response.setHeader("accept-encoding", "UTF-8");
		try {
			HSSFWorkbook wb = new HSSFWorkbook();
			service.downloadCjsl(wb,query);
			wb.write(response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				response.getOutputStream().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 数据采集数量页面
	 * @return
	 */
	public String toSjcjsl(){
		Calendar cal = Calendar.getInstance();
		if(cal.get(Calendar.DAY_OF_MONTH) == 1){
			cal.add(Calendar.MONTH, -1);
		}
		cal.set(Calendar.DAY_OF_MONTH, 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String kssj = sdf.format(cal.getTime()) + " 00:00:00";
		query.setTjkssj(kssj);
		
		cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, -1);
		query.setTjjssj(sdf.format(cal.getTime()) + " 23:59:59");
		return "toSjcjsl";
	}
	
	/**
	 * 分页查询当月数据采集量
	 */
	public void querySjcjList(){
		responseWrite(service.querySjcjList(query, getPageInfo()));
	}
	
	/**
	 * 导出考核统计排名
	 * @return
	 */
	public String downloadKhtjpm(){
		/*大类*/
		if(query.getTjlb().equals("01")){
			khkpDataList = service.queryKhkpDl(query);
		}
		/*细类*/
		else if(query.getTjlb().equals("02")){
			khkpDataList = service.queryKhkpXl(query);
		}
		return "downloadKhtjpm_" + query.getTjlb();
	}
	
	/**
	 * 跳转到本月未处理统计页面
	 * @return
	 */
	public String toBywclTj(){
		return "toBywclTj";
	}
	
	/**
	 * 查询本月未处理
	 */
	public void queryBywcltj(){
		responseWrite(service.queryBywcltj(query, getPageInfo()));
	}
	
	/**
	 * 导出本月未处理
	 * @return
	 */
	public String downlaodBywcltj(){
		bywclList = service.downlaodBywcltj(query);
		return "downlaodBywcltj";
	}
	
	/***************************************************************************/
	public KhpmBean getKhpm() {
		return khpm;
	}

	public void setKhpm(KhpmBean khpm) {
		this.khpm = khpm;
	}

	public KhkpQueryBean getQuery() {
		return query;
	}

	public void setQuery(KhkpQueryBean query) {
		this.query = query;
	}

	public SqkhtjBean getSqkhtj() {
		return sqkhtj;
	}

	public void setSqkhtj(SqkhtjBean sqkhtj) {
		this.sqkhtj = sqkhtj;
	}

	public List<SqkhtjBean> getSqtjDataList() {
		return sqtjDataList;
	}

	public void setSqtjDataList(List<SqkhtjBean> sqtjDataList) {
		this.sqtjDataList = sqtjDataList;
	}

	public List<KhpmBean> getKhkpDataList() {
		return khkpDataList;
	}

	public void setKhkpDataList(List<KhpmBean> khkpDataList) {
		this.khkpDataList = khkpDataList;
	}

	public SjcjslBean getSjcjsl() {
		return sjcjsl;
	}

	public void setSjcjsl(SjcjslBean sjcjsl) {
		this.sjcjsl = sjcjsl;
	}

	public WtsjtjfxQueryBean getQueryBean()
	{
		return queryBean;
	}

	public void setQueryBean(WtsjtjfxQueryBean queryBean)
	{
		this.queryBean = queryBean;
	}

	public List<WtsjtjfxBean> getWtsjBeans()
	{
		return wtsjBeans;
	}

	public void setWtsjBeans(List<WtsjtjfxBean> wtsjBeans)
	{
		this.wtsjBeans = wtsjBeans;
	}

	public Map<String, Object> getTableContentMap()
	{
		return tableContentMap;
	}

	public void setTableContentMap(Map<String, Object> tableContentMap)
	{
		this.tableContentMap = tableContentMap;
	}

	public BywclBean getBywcl() {
    	return bywcl;
    }

	public void setBywcl(BywclBean bywcl) {
    	this.bywcl = bywcl;
    }

	public List<BywclBean> getBywclList() {
    	return bywclList;
    }

	public void setBywclList(List<BywclBean> bywclList) {
    	this.bywclList = bywclList;
    }
}
