package com.chinacreator.gzgl.action;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.gzgl.bean.JqtbBean;
import com.chinacreator.gzgl.bean.RizhiBean;
import com.chinacreator.gzgl.bean.RzhzBean;
import com.chinacreator.gzgl.query.JqtbQueryBean;
import com.chinacreator.gzgl.query.RizhiQuery;
import com.chinacreator.gzgl.service.JqtbService;
import com.chinacreator.gzgl.service.RzglService;
import com.chinacreator.xqgk.utils.DateUtils;

/**
 * 日志管理
 * 包括日志登记，日志查询
 * @author royee
 *
 */
public class RizhiAction extends CPSBaseAction 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8153323716952768037L;
	private Map<String, String> rzrqMap = new LinkedHashMap<String, String>();
	private RizhiQuery rizhiQuery;
	private JqtbQueryBean queryBean;
	
	private RizhiBean rizhiBean;
	private JqtbBean jqtbBean;
	
	private List<RizhiBean> rizhiList;
	
	private RzglService rizhiService;
	private JqtbService jqtbService;
	
	private String operType;
	private String rzid;
	private String year;
	private String month;
	private String day;
	
	private RzhzBean rzhz;
	
	private String now = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
	protected static final String MODE_VIEW = "view";
	
	protected static final String MODE_EDIT = "edit";
	
	
	/**
	 * 操作模式
	 */
	private String viewMode = MODE_EDIT;
	/**
	 * @param rizhiQuery
	 * @param rizhiBean
	 * @param rizhiList
	 */
	public RizhiAction()
	{
		rizhiQuery = new RizhiQuery();
		queryBean = new JqtbQueryBean();
		rizhiBean = new RizhiBean();
		jqtbBean=new JqtbBean();
		rizhiList = new ArrayList<RizhiBean>();
		rizhiService = new RzglService();
		jqtbService= new JqtbService();
		rzhz = new RzhzBean();
	}

	public RzglService getRizhiService()
	{
		return rizhiService;
	}

	public void setRizhiService(RzglService rizhiService)
	{
		this.rizhiService = rizhiService;
	}
	
	
	public String init()
	{
		initQueryBean(rizhiQuery);
		return "queryRizhiList";
	}
	
	/**
	 * 查询所有日志
	 */
	public void queryRizhiList()
	{
		load();
	}

	protected void load()
	{
		PageResultInfo<RizhiBean> parse = rizhiService.getRizhiListPage(getPageInfo(), rizhiQuery);
		responseWrite(parse);
	}
	
	/**
	 * 跳转到日志汇总页面
	 * @return
	 */
	public String toRzhzPage()
	{
		rzhz = rizhiService.queryRzhz(rizhiQuery);
		if("1".equals(rizhiQuery.getIsDowload()))
		{
			return "dowloadRzhz";
		}
		else
		{
			return "toRzhzPage";
		}
	}
	/**
	 * 导出日志列表数据
	 * @return
	 */
	public String downLoadRzlist(){
		rizhiList = rizhiService.getRizhiList(rizhiQuery); 
		return "downLoadRzlist";
	}
	/**
	 * 新增导航
	 * @return	导航路径
	 */
	public String toAddRizhi()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		rizhiBean = rizhiService.queryGzRzBeanByMjjhAndGzrq(loginInfo.getUsername(), DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		
		setViewMode(MODE_EDIT);//编辑模式
		if (rizhiBean == null)
		{
			rizhiBean = new RizhiBean();
		}
		rizhiBean.setOp("new");//新增操作
		return "toAddRizhi";
	}
	
	/**
	 * 修改导航
	 * @return	导航路径
	 */
	public String toEditRizhi()
	{
		if (ValidateHelper.isEmptyString(rizhiQuery.getRzbh()))
		{
			return ERROR;
		}
		setViewMode(MODE_EDIT);//编辑模式
		
		List<RizhiBean> rizhiBeans = rizhiService.getRizhiList(rizhiQuery);
		
		if (ValidateHelper.isNotEmptyCollection(rizhiBeans))
		{
			setRizhiBean(rizhiBeans.get(0));
			rizhiBean.setOp("edit");//更新操作
		}
		
		return "toEditRizhi";
	}
	
	/**
	 * 
	 * @return
	 * @throws SQLException 
	 */
	public String toViewRizhiDetail() throws SQLException
	{
	/*if (ValidateHelper.isEmptyString(rizhiQuery.getRzbh()))
		{
			return ERROR;
		}
		setViewMode(MODE_VIEW);//查看视图
		
		List<RizhiBean> rizhiBeans = rizhiService.getRizhiList(rizhiQuery);
		
		if (ValidateHelper.isNotEmptyCollection(rizhiBeans))
		{
			setRizhiBean(rizhiBeans.get(0));
			rizhiBean.setOp("detail");//查看模式
		}*/
		rizhiBean = rizhiService.getRizhiBeanByRzbh(rizhiQuery.getRzbh());
		rizhiBean.setOp("detail");
		return "toViewRizhiDetail";
	}
	
	/**
	 * 保存数据
	 */
	public void saveRizhiBean()
	{
		String tip = ""; 
		String op = null;
		if (MODE_EDIT.equals(viewMode))//编辑模式
		{
			if ("new".equals(rizhiBean.getOp()))
			{
				op = RzglService.OP_ADD;
			}
			else if ("edit".equals(rizhiBean.getOp()))
			{
				op = RzglService.OP_UPDATE;
			}
			else if ("delete".equals(rizhiBean.getOp()))
			{
				op = RzglService.OP_DEL;
			}
		}
		if(rizhiService.submitRizhi(rizhiBean, op)){                //提交
			tip = "日志保存成功.";
		}else{
			tip = "日志保存失败.";
		}
		responseWrite(tip);
	}
	
	public void batchSaveRizhis()
	{
		String rizhiBhaos = rizhiQuery.getRzbh();
		if (ValidateHelper.isEmptyString(rizhiBhaos))
		{
			return;
		}
		String[] rizhiBhaoArr = new String[] {rizhiBhaos};//如果只存在于一个元素
		if (rizhiBhaos.contains(","))
		{
			rizhiBhaoArr = rizhiBhaos.split(",");
		}

		String op = request.getParameter("op");
		if ("del".equals(op))//批量删除操作
		{
			op = RzglService.OP_DEL;
		}
		else
		{
			responseWrite("op is null");
			return;
		}
		
		RizhiBean rizhiBean = null;
		List<RizhiBean> rizhiBeans = new ArrayList<RizhiBean>();
		for (String rizhiBh : rizhiBhaoArr)
		{
			rizhiBean = new RizhiBean();
			rizhiBean.setRzbh(rizhiBh);
			rizhiBean.setOp(op);
			rizhiBeans.add(rizhiBean);
		}
		rizhiService.batchSubmitRizhis(rizhiBeans);
	}
	
	
	//警情通报
	public String toJqtbPage()
	{
		initQueryBean(queryBean);
		return "toJqtbPage";
	}
	
	//新增 修改 详情界面
	public String toJqtbInfoPage()
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		if(CommonConstant.OPERTYPE_ADD.equals(operType))
		{
			Calendar cal = Calendar.getInstance();
			String tjDate = DateUtils.getDateTime("yyyy-MM-dd", cal.getTime());
			jqtbBean.setDjsj(tjDate);
			jqtbBean.setZrdwdm(loginInfo.getOrgcode());
			jqtbBean.setZrdwmc(loginInfo.getOrgname());
		}
		else
		{
			try 
			{
				jqtbBean=jqtbService.queryJqtbBeanByid(jqtbBean.getId(),jqtbBean.getNy(), jqtbBean.getZrdwdm());
				if (jqtbBean != null)
				{
					jqtbBean.setZrdwmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(jqtbBean.getZrdwdm()));
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		return "toJqtbInfoPage";
	}
	
	public  void  saveJqtbBean()
	{
		try 
		{
			if(ValidateHelper.isEmptyString(jqtbBean.getId())){
				jqtbService.insertJqtbBean(jqtbBean);
				responseWrite(true);
			}else{
				jqtbService.updateJqtbBean(jqtbBean);
				responseWrite(true);
			}
		} catch (Exception e) {
			responseWrite(false);
			e.printStackTrace();
		}
	} 
	
	public void isExistNy(){
		try {
			boolean flag=jqtbService.queryJqtbBeanByny(jqtbBean.getNy(),jqtbBean.getZrdwdm());
			responseWrite(flag);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryJqtbBeanPageInfo()
	{
		try 
		{
			PageResultInfo<JqtbBean> list=jqtbService.queryJqtbPageInfo(queryBean, getPageInfo());
			responseWrite(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String exportJqtbWord()
	{
		try
		{
			jqtbBean=jqtbService.queryJqtbBeanByid(jqtbBean.getId(),jqtbBean.getNy(), jqtbBean.getZrdwdm());
			if (jqtbBean != null)
			{
				jqtbBean.setZrdwmc(DictionaryCacheHellper.getOrganizationOrgNameByCode(jqtbBean.getZrdwdm()));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "exportJqtbWord";
	}
	
	public String exportRzBean() throws Exception{
		rizhiBean = rizhiService.getRizhiBeanByRzbh(rzid);
		String date = DateTimeHelper.getNowDateStr("yyyy-MM-dd");
		String da[] = date.split("-");
		year = da[0];
		month= da[1];
		day = da[2];
		return "exportRzzhiList";
	}
	
	public String exportRzzhiList() throws Exception{
		if(ValidateHelper.isNotEmptyString(rzid)){
			rizhiList = rizhiService.queryRiZhiListByRzbh(rzid);
		}else{
			rizhiList = rizhiService.getRizhiList(rizhiQuery);
		}
		return "exportRzzhiList";
	}
	
	
	public void loadGzrzBean()
	{
		RizhiBean rzBean = rizhiService.queryGzRzBeanByMjjhAndGzrq(rizhiBean.getGzmjjh(), rizhiBean.getGzrq());
		responseWrite(rzBean);
	}
	
	public RizhiQuery getRizhiQuery()
	{
		return rizhiQuery;
	}

	public void setRizhiQuery(RizhiQuery rizhiQuery)
	{
		this.rizhiQuery = rizhiQuery;
	}

	public RizhiBean getRizhiBean()
	{
		return rizhiBean;
	}

	public void setRizhiBean(RizhiBean rizhiBean)
	{
		this.rizhiBean = rizhiBean;
	}

	public List<RizhiBean> getRizhiList()
	{
		return rizhiList;
	}

	public void setRizhiList(List<RizhiBean> rizhiList)
	{
		this.rizhiList = rizhiList;
	}

	public String getNow()
	{
		return now;
	}

	public void setNow(String now)
	{
		this.now = now;
	}

	public String getViewMode()
	{
		return viewMode;
	}

	public void setViewMode(String viewMode)
	{
		this.viewMode = viewMode;
	}

	public JqtbBean getJqtbBean() {
		return jqtbBean;
	}

	public void setJqtbBean(JqtbBean jqtbBean) {
		this.jqtbBean = jqtbBean;
	}

	public JqtbQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(JqtbQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public String getOperType() {
		return operType;
	}

	public void setOperType(String operType) {
		this.operType = operType;
	}

	public String getRzid() {
		return rzid;
	}

	public void setRzid(String rzid) {
		this.rzid = rzid;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public RzhzBean getRzhz() {
		return rzhz;
	}

	public void setRzhz(RzhzBean rzhz) {
		this.rzhz = rzhz;
	}

	public Map<String, String> getRzrqMap()
	{
		for (int i=0;i>-8;i--)
		{
			String datestr = DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), i, "yyyy-MM-dd");
			rzrqMap.put(datestr, datestr);
		}
		return rzrqMap;
	}

	public void setRzrqMap(Map<String, String> rzrqMap)
	{
		this.rzrqMap = rzrqMap;
	}
	
}
