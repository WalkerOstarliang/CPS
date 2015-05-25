package com.chinacreator.afgl.action;

import com.chinacreator.afgl.bean.SqLdzxxBean;
import com.chinacreator.afgl.bean.StxxBean;
import com.chinacreator.afgl.bean.WyxqxxBean;
import com.chinacreator.afgl.bean.YwhCyxxBean;
import com.chinacreator.afgl.bean.YwhxxBean;
import com.chinacreator.afgl.query.SqldzxxQueryBean;
import com.chinacreator.afgl.query.SqwyhQueryBean;
import com.chinacreator.afgl.query.StxxQueryBean;
import com.chinacreator.afgl.services.SqldzxxService;
import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;
/**
 * 走访对象，楼栋长信息
 * @author Administrator
 *
 */
public class SqldzxxglAction extends CPSBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id ;
	private SqldzxxService  service ;
	private SqldzxxQueryBean queryBeanldz ;
	private SqLdzxxBean  ldzbean ;
	private StxxQueryBean  queryBeanSt ;
	private StxxBean stxxbean ;
	private SqwyhQueryBean  queryBeanwyh ;
	private YwhxxBean ywhxxbean ;
	private String wyhid ; // 业主委员会ID
	
	private YwhCyxxBean yzwyhcybean ;
	
	public String getWyhid() {
		return wyhid;
	}


	public void setWyhid(String wyhid) {
		this.wyhid = wyhid;
	}


	public SqldzxxglAction(){
		super();
		queryBeanldz = new SqldzxxQueryBean();
		service = new SqldzxxService();
		ldzbean = new SqLdzxxBean();
		queryBeanSt = new StxxQueryBean();
		stxxbean = new StxxBean();
		queryBeanwyh = new SqwyhQueryBean();
		ywhxxbean = new YwhxxBean();
		yzwyhcybean = new YwhCyxxBean();
	}
	
	
	/**
	 * 跳转到楼栋长信息list
	 */
	public String toSqldzListPage(){
		initQueryBean(queryBeanldz);
		return "toSqldzListPage";
	}

	/**
	 * 分页查询楼栋长信息
	 */
	public void querySqLdzPageResult(){
		PageResultInfo<SqLdzxxBean> pageResult;
		try {
			pageResult = service.querySqldzxxPageResultInfoByQueryBean(queryBeanldz, getPageInfo());
			responseWrite(pageResult); 
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 跳转到楼栋长登记，修改界面
	 * @return
	 */
	public String toSqLdzInfoPage(){
		if (CommonConstant.OPERTYPE_UPDATE.equals(operType) || CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			try {
				ldzbean = service.querySqldzxxBeanById(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			ldzbean.setIp(this.getIpAddress());
			ldzbean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			ldzbean.setDjrjh(loginInfo.getUsername());
			ldzbean.setDjrsfzh(loginInfo.getSfzh());
			ldzbean.setDjrxm(loginInfo.getRealname());
			ldzbean.setDjdwdm(loginInfo.getOrgcode());
			ldzbean.setDjdwmc(loginInfo.getOrgname());
			ldzbean.setSsjwqdm(loginInfo.getJwsqdm());
			ldzbean.setSsjwqmc(loginInfo.getJwsqmc());
		}
		return "toSqLdzInfoPage";
	}
	
	/**
	 * 跳转到实体信息列表选择
	 * @return
	 */
	public String  toOpenStListSelect(){
		initQueryBean(queryBeanSt);
		return "toOpenStListSelect";
	}
	
	/**
	 * 实体分页查询
	 */
	public void queryStxxPageResult(){
		PageResultInfo<StxxBean> pageResult;
		try {
			pageResult = service.queryStxxPageResultInfoByQueryBean(queryBeanSt, getPageInfo());
			responseWrite(pageResult); 
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	/**
	 * 保存楼栋长信息
	 */
	public void saveSqLdzxxBean(){
		try
		{
			//新增
			if (CommonConstant.OPERTYPE_ADD.equals(operType))
			{
				int count = service.querySqLdzCountByStidAndSfzh(ldzbean.getStid(), ldzbean.getSfzh());
				if (count == 0)
				{
					if(!ValidateHelper.isEmptyString(ldzbean.getId())){
						ldzbean.setIp(this.getIpAddress());
					}	
					ldzbean = service.saveSqLdzxxBean(ldzbean, operType);
					responseWrite(ldzbean);
				}
				//人员已经存在
				else
				{
					responseWrite("isexist");
				}
			}
			//修改
			else
			{
				ldzbean = service.saveSqLdzxxBean(ldzbean, operType);
				responseWrite(ldzbean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	/**
	 * 注销楼栋长
	 */
	public void deleteSqLdzxxBeanById(){
		try {
			service.deleteSqLdzxxBeanById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		responseWrite(true);
	}
	/**
	 * 跳转到业主委员会list页面
	 * @return
	 */
	public String toSqwyhListPage(){
		initQueryBean(queryBeanwyh);
		return "toSqwyhListPage";
	}
	/**
	 * 业主委员会分页page
	 */
	public void querySqYwhPageResult(){
		PageResultInfo<YwhxxBean> pageResult;
		try {
			pageResult = service.querySqYwhPageResultInfoByQueryBean(queryBeanwyh, getPageInfo());
			responseWrite(pageResult); 
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	/**
	 * 弹出业委会登记、修改界面
	 * @return
	 */
	public String toSqYwhInfoPage(){
		if (CommonConstant.OPERTYPE_UPDATE.equals(operType) || CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			try {
				ywhxxbean = service.querySqywhxxBeanById(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			ywhxxbean.setIp(this.getIpAddress());
			ywhxxbean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			ywhxxbean.setDjrjh(loginInfo.getUsername());
			ywhxxbean.setDjrsfzh(loginInfo.getSfzh());
			ywhxxbean.setDjrxm(loginInfo.getRealname());
			ywhxxbean.setDjdwdm(loginInfo.getOrgcode());
			ywhxxbean.setDjdwmc(loginInfo.getOrgname());
			ywhxxbean.setSsjwqdm(loginInfo.getJwsqdm());
			ywhxxbean.setSsjwqmc(loginInfo.getJwsqmc());
		}
		
		return "toSqYwhInfoPage";
	}
	
	/**
	 * 保存业主委员会信息
	 */
	public void saveSqYwhxxBean(){
		try
		{
			//新增
			if (CommonConstant.OPERTYPE_ADD.equals(operType))
			{
				int count = service.querySqYzwyhCountByStidAndYzwyhmc(ywhxxbean.getStid(), ywhxxbean.getWyxqmc());
				if (count == 0)
				{
					if(!ValidateHelper.isEmptyString(ywhxxbean.getId())){
						ywhxxbean.setIp(this.getIpAddress());
					}	
					ywhxxbean = service.saveSqYzwyhxxBean(ywhxxbean, operType);
					responseWrite(ywhxxbean);
				}
				//已经存在
				else
				{
					responseWrite("isexist");
				}
			}
			//修改
			else
			{
				ywhxxbean = service.saveSqYzwyhxxBean(ywhxxbean, operType);
				responseWrite(ywhxxbean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	/**
	 * 业主委员会成员分页
	 */
	public void querySqYwhcyPageResult(){
		PageResultInfo<YwhCyxxBean> pageResult;
		try {
			pageResult = service.querySqYwhcyPageResultInfoByQueryBean(ywhxxbean, getPageInfo());
			responseWrite(pageResult); 
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	/**
	 * 弹出业主成员登记、修改界面
	 * @return
	 * @throws Exception 
	 */
	public String toOpenWyhcyxxInfo() throws Exception{
		if (CommonConstant.OPERTYPE_UPDATE.equals(operType) || CommonConstant.OPERTYPE_DETAIL.equals(operType))
		{
			try {
				yzwyhcybean = service.querySqYwhcyxxBeanById(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			yzwyhcybean.setYzwyhid(wyhid) ;
			String  mc = service.querySqywhxxBeanById(wyhid).getWyxqmc();
			if(mc != null && mc != ""){
				yzwyhcybean.setWyxqmc(mc);
			}
			yzwyhcybean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			yzwyhcybean.setIp(this.getIpAddress());
			LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
			yzwyhcybean.setDjrjh(loginInfo.getUsername());
			yzwyhcybean.setDjrsfzh(loginInfo.getSfzh());
			yzwyhcybean.setDjrxm(loginInfo.getRealname());
			yzwyhcybean.setDjdwdm(loginInfo.getOrgcode());
			yzwyhcybean.setDjdwmc(loginInfo.getOrgname());
			yzwyhcybean.setSsjwqdm(loginInfo.getJwsqdm());
			yzwyhcybean.setSsjwqmc(loginInfo.getJwsqmc());
		}
		
		return "toOpenWyhcyxxInfo" ;
	}
	/**
	 * 弹出物业小区选择
	 * @return
	 */
	public String toOpenWyxqListSelect(){
		initQueryBean(queryBeanSt);
		return "toOpenWyxqListSelect";
	}
	
	/**
	 * 分页查询物业小区
	 */
	public void queryWyxqPageResult(){
		PageResultInfo<WyxqxxBean> pageResult;
		try {
			pageResult = service.queryWyxqxxPageResultInfoByQueryBean(queryBeanSt, getPageInfo());
			responseWrite(pageResult); 
		} catch (Exception e) {
			responseWrite(null);
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存业主委员会成员信息
	 */
	public void saveSqYwhcyxxBean(){
		try
		{
			//新增
			if (CommonConstant.OPERTYPE_ADD.equals(operType))
			{
				int count = service.querySqYzwyhcyCountByYwhidAndSfzh(yzwyhcybean.getYzwyhid(), yzwyhcybean.getSfzh());
				if (count == 0)
				{
					if(!ValidateHelper.isEmptyString(yzwyhcybean.getId())){
						yzwyhcybean.setIp(this.getIpAddress());
					}	
					yzwyhcybean = service.saveSqYzwyhcyxxBean(yzwyhcybean, operType);
					responseWrite(yzwyhcybean);
				}
				//已经存在
				else
				{
					responseWrite("isexist");
				}
			}
			//修改
			else
			{
				yzwyhcybean = service.saveSqYzwyhcyxxBean(yzwyhcybean, operType);
				responseWrite(yzwyhcybean);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(null);
		}
	}
	/**
	 * 注销业主委员会
	 */
	public void deleteSqYwhBeanById(){
		try {
			service.deleteSqYwhBeanById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		responseWrite(true);
	}
	
	/**
	 * 注销业主委员会成员
	 */
	public void deleteSqYzwyhcyBeanById(){
		try {
			service.deleteSqYzwyhcyBeanById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		responseWrite(true);
	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public SqldzxxQueryBean getQueryBeanldz() {
		return queryBeanldz;
	}

	public void setQueryBeanldz(SqldzxxQueryBean queryBeanldz) {
		this.queryBeanldz = queryBeanldz;
	}

	public SqLdzxxBean getLdzbean() {
		return ldzbean;
	}

	public void setLdzbean(SqLdzxxBean ldzbean) {
		this.ldzbean = ldzbean;
	}
	
	public StxxBean getStxxbean() {
		return stxxbean;
	}

	public void setStxxbean(StxxBean stxxbean) {
		this.stxxbean = stxxbean;
	}

	public StxxQueryBean getQueryBeanSt() {
		return queryBeanSt;
	}

	public void setQueryBeanSt(StxxQueryBean queryBeanSt) {
		this.queryBeanSt = queryBeanSt;
	}


	public SqwyhQueryBean getQueryBeanwyh() {
		return queryBeanwyh;
	}


	public void setQueryBeanwyh(SqwyhQueryBean queryBeanwyh) {
		this.queryBeanwyh = queryBeanwyh;
	}


	public YwhxxBean getYwhxxbean() {
		return ywhxxbean;
	}


	public void setYwhxxbean(YwhxxBean ywhxxbean) {
		this.ywhxxbean = ywhxxbean;
	}


	public YwhCyxxBean getYzwyhcybean() {
		return yzwyhcybean;
	}


	public void setYzwyhcybean(YwhCyxxBean yzwyhcybean) {
		this.yzwyhcybean = yzwyhcybean;
	}

	
}
