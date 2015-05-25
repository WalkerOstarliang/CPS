package com.chinacreator.zagl.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.SystemDictionaryBean;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.cps.bean.DzxxBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.RkxxBean;
import com.chinacreator.lsgl.query.FwQueryBean;
import com.chinacreator.lsgl.services.LsglFwService;
import com.chinacreator.lsgl.services.impl.LsglFwServiceImpl;
import com.chinacreator.zagl.bean.AqyhBean;
import com.chinacreator.zagl.bean.BadysBean;
import com.chinacreator.zagl.bean.BwjgBean;
import com.chinacreator.zagl.bean.BwjysBean;
import com.chinacreator.zagl.bean.BwzdBean;
import com.chinacreator.zagl.bean.CyryPfBean;
import com.chinacreator.zagl.bean.CyrytjBean;
import com.chinacreator.zagl.bean.DwAqsbBean;
import com.chinacreator.zagl.bean.DwBean;
import com.chinacreator.zagl.bean.DwabssBean;
import com.chinacreator.zagl.bean.DwaqjcBean;
import com.chinacreator.zagl.bean.DwcyryBean;
import com.chinacreator.zagl.bean.DwjbxxBean;
import com.chinacreator.zagl.bean.DwjcBean;
import com.chinacreator.zagl.bean.GgcsBean;
import com.chinacreator.zagl.bean.JfdwNsxxBean;
import com.chinacreator.zagl.bean.NbDwTjBean;
import com.chinacreator.zagl.bean.NbdwBean;
import com.chinacreator.zagl.bean.OperateBean;
import com.chinacreator.zagl.bean.SwfwcsBean;
import com.chinacreator.zagl.bean.TfsjyaBean;
import com.chinacreator.zagl.bean.ThlgyBean;
import com.chinacreator.zagl.bean.TzhyBean;
import com.chinacreator.zagl.bean.ZdyhbwBean;
import com.chinacreator.zagl.bean.ZdyhbwZpBean;
import com.chinacreator.zagl.bean.ZhsgBean;
import com.chinacreator.zagl.query.CyryQueryBean;
import com.chinacreator.zagl.query.DwQueryBean;
import com.chinacreator.zagl.services.DwService;
import com.chinacreator.zagl.services.impl.DwServiceImpl;

public class DwAction extends CPSBaseAction 
{

	private static final long serialVersionUID = 6691282756491030687L;
	private List<SystemDictionaryBean> kslxList;
	private List<SystemDictionaryBean> wxpdwflList;
	private DwBean dw;
	private DwQueryBean dwcx;
	private String bh;
	private DwService dwService;
	private LsglFwService fwService;
	private CyryQueryBean cyrycx;
	private FwQueryBean queryBean;
	private List<SystemDictionaryBean> rytssxList;
	private List<ZdyhbwZpBean> zdyhbwzpbeans;
	
	private List<DwaqjcBean> aqjcList;
	
	private List<CyrytjBean> cyrytjlist ; // 从业人员统计结果
	
	/*用户机构代码*/
	private String userOrgCode;
	/*用户机构名称*/
	private String userOrgName;
	// 单位统计级别 1 分县局 ； 2 派出所 ；3 警务区
	private String dwtjjb;
	
	private File[] uploads;
	
	private String[] uploadsFileName;
	
	
	private DwcyryBean cyryBean;
	
	private boolean isxttxpage = false;
	
	private boolean isCyrypf = false;
	
	private boolean isdblclick = false;
	
	/**
	 * 人口基本信息
	 */
	private RkxxBean rkBean;

	/**
	 * 机构编号
	 */
	private String jgbh;

	/**
	 * 行业类别
	 */
	private String hylb;
	
	private String hylbmc;
	
	/**
	 * 特行类别
	 */
	private String thlb;

	/**
	 * 用户信息
	 */
	private LoginInfo loginInfo;

	/**
	 * 行业类别字典
	 */
	private List<SystemDictionaryBean> hylbList;
	
	/**
	 * 单位房屋选择页面状态 "add":新增单位时选择地址  "update":修改单位时选择地址 
	 */
	private String dwfwzt;
	
	private String cyrybhs;
	
	private List<DwcyryBean> cyryBeans;
	
	private String jgbhs;
	
	private List<DwjbxxBean> sydwBeans;
	
	private CyryPfBean cyrypf;
	
	/**
	 * 技防单位年审信息
	 */
	private JfdwNsxxBean nsxx;
	
	private List<JfdwNsxxBean> nsList;
	//内保单位 统计
	List<NbDwTjBean> reslist;

	public DwAction() {
		super();
		dw = new DwBean();
		cyrycx = new CyryQueryBean();
		dwcx = new DwQueryBean();
		dwService = new DwServiceImpl();
		fwService = new LsglFwServiceImpl();
		queryBean = new FwQueryBean();
		jgbh = "";
		loginInfo = ActionContextHelper.getLoginInfo();
		rkBean = new RkxxBean();
		hylbList = new ArrayList<SystemDictionaryBean>();
		rytssxList = new ArrayList<SystemDictionaryBean>();
		
		cyrypf = new CyryPfBean();
		nsxx = new JfdwNsxxBean();
		
		nsList = new ArrayList<JfdwNsxxBean>();
		
		reslist = new ArrayList<NbDwTjBean>();
		
		aqjcList = new ArrayList<DwaqjcBean>();
	}

	/**
	 * 初始化查询条件
	 */
	public void initQueryBean() {
		super.initQueryBean(dwcx);
	}

	/**
	 * 保存单位基本信息
	 */
	public void saveDwJbxx() {
		try 
		{
			dw = dwService.saveDwJbxxBean(dw);
			responseWrite(dw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存单位
	 * @throws Exception
	 */
	public void saveDw() throws Exception 
	{
		dw = dwService.saveDw(dw);
		responseWrite(dw);
	}

	/**
	 * 保存特种行业
	 * @throws Exception
	 * @date 2013-10-15 下午04:33:03
	 */
	public void saveTzhyBean() throws Exception {
		dwService.saveTzhyBean(dw);
		responseWrite(dw);
	}

	/**
	 * 保存公共场所
	 * @throws Exception
	 * @date 2013-10-15 下午04:33:11
	 */
	public void saveGGCSBean() throws Exception {
		dwService.saveGGCSBean(dw);
		responseWrite(dw);
	}

	/**
	 * 保存内保单位
	 * @throws Exception
	 * @date 2013-10-15 下午04:33:35
	 */
	public void saveNbdwBean() throws Exception {
		dwService.saveNbdwBean(dw);
		responseWrite(dw);
	}

	/**
	 * 保存上网服务场所信息
	 * @throws Exception
	 * @date 2013-10-15 下午05:56:33
	 */
	public void saveSwfwcsBean() throws Exception {
		dwService.saveSwfwcsBean(dw);
		responseWrite(dw);
	}

	/**
	 * 保存涉外单位
	 * 
	 * @throws Exception
	 * @date 2013-10-16 上午09:17:34
	 */
	public void saveSwdwBean() throws Exception {
		dwService.saveSwdwBean(dw);
		responseWrite(dw);
	}

	/**
	 * 保存危险物品单位
	 * 
	 * @throws Exception
	 * @date 2013-10-16 上午10:46:10
	 */
	public void saveWxwpdwBean() throws Exception {
		dwService.saveWxwpdwBean(dw);
		responseWrite(dw);
	}
	

	/**
	 * 保存单位安全检查
	 * 
	 * @throws Exception
	 * @date 2013-10-17 上午09:35:57
	 */
	public void saveDwAqjcBean() throws Exception 
	{
		dwService.saveDwAqjcBean(dw);
		responseWrite(dw);
	}
	
	/**
	 * 保存单位照片
	 * 
	 * @throws Exception
	 * @date 2013-10-16 下午04:35:47
	 */
	public void saveDwZp() throws Exception {
		dwService.saveDwzpBean(dw);
		responseWrite(dw.getDwzpList());
	}

	/**
	 * 保存从业人员
	 * 
	 * @throws Exception
	 * @date 2013-10-16 下午04:35:58
	 */
	public void saveCyryBean() throws Exception 
	{
		if (CommonConstant.OPERTYPE_UPDATE.equals(operType))
		{
			dwService.saveCyryBean(dw,rkBean);
			responseWrite(dw);
		}
		else
		{
			int size = dwService.queryCyryByJgbhAndSfzh(dw.getCyry().getJgbh(), rkBean.getJbxxBean().getSfzh());
			if (size == 0)
			{
				dwService.saveCyryBean(dw,rkBean);
				responseWrite(dw);
			}
			else
			{
				responseWrite("existcyry");
			}
		}
	}

	/**
	 * 保存单位奖惩
	 * @throws Exception
	 */
	public void saveDwJcBean() throws Exception {
		dwService.saveDwJcxxBean(dw);
		responseWrite(dw);
	}

	/**
	 * 保存重点要害部位
	 * @throws Exception
	 */
	public void saveZdyhbwBean() throws Exception {
		dwService.saveZdyhbwBean(dw);
		responseWrite(dw);
	}
	
	/**
	 * 保存单位安全设备
	 */
	public void saveDwAqsb() throws Exception {
		responseWrite(dwService.saveDwAqsb(dw));
	}
	
	/**
	 * 保存保卫机构
	 * @throws Exception
	 */
	public void saveBwjg() throws Exception{
		responseWrite(dwService.saveBwjgBean(dw));
	}
	
	/**
	 * 删除保卫机构
	 * @throws Exception
	 */
	public void delBwjg() throws Exception{
		dwService.delBwjg(dw.getBwjg().getBwjgbh());
	}
	
	/**
	 * 保存保卫制度
	 * @throws Exception
	 */
	public void saveBwzd() throws Exception{
		responseWrite(dwService.saveBwzdBean(dw));
	}
	
	/**
	 * 保存安保设施
	 * @throws Exception
	 */
	public void saveAbss() throws Exception{
		responseWrite(dwService.saveAbssBean(dw));
	}
	
	/**
	 * 删除安保设施
	 * @throws Exception
	 */
	public void delAbss() throws Exception{
		dwService.delAbss(dw.getAbss().getSsbh());
	} 
	
	/**
	 * 删除保卫制度
	 * @throws Exception
	 */
	public void delBwzd() throws Exception{
		dwService.delBwzd(dw.getBwzd().getZdbh());
	}
	
	/**
	 * 保存保卫建议书
	 * @throws Exception
	 */
	public void saveBwjys() throws Exception{
		responseWrite(dwService.saveBwjys(dw));
	}
	
	/**
	 * 删除保卫建议书
	 * @throws Exception
	 */
	public void delBwjys() throws Exception{
		dwService.delBwjys(dw.getBwjys().getJysbh());
	}
	
	/**
	 * 保存突发事件预案
	 * @throws Exception
	 */
	public void saveTfsjya() throws Exception{
		responseWrite(dwService.saveTfsjya(dw));
	}
	
	/**
	 * 删除突发事件预案
	 * @throws Exception
	 */
	public void delTfsjya() throws Exception{
		dwService.delTfsjya(dw.getTfsjya().getYabh());
	}
	
	/**
	 * 保存预案演练
	 * @throws Exception
	 */
	public void saveYayl() throws Exception{
		responseWrite(dwService.saveYayl(dw));
	}
	
	/**
	 * 删除预案演练
	 * @throws Exception
	 */
	public void delYayl() throws Exception{
		dwService.delYayl(dw.getTfsjya().getYayl().getBh());
	}
	
	/**
	 * 保存灾害事故
	 * @throws Exception
	 */
	public void saveZhsg() throws Exception{
		responseWrite(dwService.saveZhsg(dw));
	}
	
	/**
	 * 删除灾害事故
	 * @throws Exception
	 */
	public void delZhsg() throws Exception{
		dwService.delZhsg(dw.getZhsg().getBh());
	}
	
	/**
	 * 保存不安定因素
	 * @throws Exception
	 */
	public void saveBadys() throws Exception{
		responseWrite(dwService.saveBadys(dw));
	}
	
	/**
	 * 删除不安定因素
	 * @throws Exception
	 */
	public void delBadys() throws Exception{
		dwService.delBadys(dw.getBadys().getBh());
	}
	
	/**
	 * 保存安全隐患
	 * @throws Exception
	 */
	public void saveAqyh() throws Exception{
		responseWrite(dwService.saveAqyh(dw));
	}
	
	/**
	 * 删除安全隐患
	 * @throws Exception
	 */
	public void delAqyh() throws Exception{
		dwService.delAqyh(dw.getAqyh().getBh());
	}
	
	/**
	 * 跳转到安全隐患
	 * @return
	 * @throws Exception
	 */
	public String toAqyh() throws Exception{
		AqyhBean aqyh = new AqyhBean();
		initDjxx(aqyh);
		dw.setAqyh(aqyh);
		dw.setAqyhList(dwService.queryAqyhByJgbh(jgbh));
		return "toAqyh";
	}
	
	/**
	 * 跳转到灾害事故
	 * @return
	 * @throws Exception
	 */
	public String toZhsg() throws Exception{
		ZhsgBean zhsg = new ZhsgBean();
		initDjxx(zhsg);
		dw.setZhsg(zhsg);
		dw.setZhsgList(dwService.queryZhsgByJgbh(jgbh));
		return "toZhsg";
	}
	
	/**
	 * 跳转到不安定因素界面
	 * @return
	 * @throws Exception
	 */
	public String toBadys() throws Exception{
		BadysBean badys = new BadysBean();
		if(ValidateHelper.isEmptyString(dw.getBadys().getBh())){
			initDjxx(badys);
		}else{
			badys = dwService.queryBadysByBh(dw.getBadys().getBh());
		}
		dw.setBadys(badys);
		dw.setBadysList(dwService.queryBadysByJgbh(jgbh));
		return "toBadys";
	}
	
	/**
	 * 跳转到突发事件预案列表
	 * @return
	 * @throws Exception
	 */
	public String toTfsjyaList() throws Exception{
		dw.setTfsjyaList(dwService.queryTfsjyaByJgbh(jgbh));
		return "toTfsjyaList";
	}
	
	/**
	 * 跳转到突发事件预案
	 * @return
	 * @throws Exception
	 */
	public String toTfsjya() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			TfsjyaBean tfsjya = new TfsjyaBean();
			initDjxx(tfsjya);
			dw.setTfsjya(tfsjya);
		}else{
			dw.setTfsjya(dwService.queryTfsjyaByYabh(dw.getTfsjya().getYabh()));
		}
		return "toTfsjya";
	}
	
	/**
	 * 根据雅安编号查询预案演练
	 * @throws Exception
	 */
	public void queryYaylByYabh() throws Exception{
		responseWrite(dwService.queryYaylByYabh(dw.getTfsjya().getYabh(), this.getPageInfo()));
	}
	
	/**
	 * 跳转到保卫制度
	 * @return
	 * @throws Exception
	 */
	public String toBwzd() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			BwzdBean bwzd = new BwzdBean();
			initDjxx(bwzd);
			dw.setBwzd(bwzd);
		}else{
			dw.setBwzd(dwService.queryBwzdByBwzdbh(dw.getBwzd().getZdbh()));
		}
		return "toBwzd";
	}
	
	/**
	 * 跳转到保卫建议书
	 * @return
	 * @throws Exception
	 */
	public String toBwjys() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			BwjysBean bwjys = new BwjysBean();
			initDjxx(bwjys);
			dw.setBwjys(bwjys);
		}else{
			dw.setBwjys(dwService.queryBwjysByJysbh(dw.getBwjys().getJysbh()));
		}
		return "toBwjys";
	} 
	
	/**
	 * 跳转到保卫机构
	 * @return
	 * @throws Exception
	 */
	public String toBwjg() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			BwjgBean bwjg = new BwjgBean();
			initDjxx(bwjg);
			dw.setBwjg(bwjg);
		}else{
			dw.setBwjg(dwService.queryBwjgByBwjgbh(dw.getBwjg().getBwjgbh()));
		}
		return "toBwjg";
	}
	
	/**
	 * 跳转到企事业单位保卫机构
	 * @return
	 */
	public String toBwjgList() throws Exception{
		dw.setBwjgList(dwService.queryBwjgByJgbh(jgbh));
		dw.setBwzdList(dwService.queryBwzdByJgbh(jgbh));
		dw.setBwjysList(dwService.queryBwjysByJgbh(jgbh));
		return "toBwjgList";
	}
	
	/**
	 * 跳转到单位详细信息页面
	 * @return
	 * @throws Exception
	 */
	public String toDwInfoPage() throws Exception {
		if (CommonConstant.OPERTYPE_ADD.equals(operType)) {
			dw.getDwjbxx().setDwdm(dwcx.getDwdm());
			dw.getDwjbxx().setDwmc(dwcx.getDwmc());
			dw.getDwjbxx().setFrdb(dwcx.getFrdb());
			dw.getDwjbxx().setFrsfzhm(dwcx.getFrsfzhm());
			dw.getDwjbxx().setDjrxm(loginInfo.getRealname());
			dw.getDwjbxx().setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			dw.getDwjbxx().setDjdwdm(loginInfo.getOrgcode());
			dw.getDwjbxx().setDjdwmc(loginInfo.getOrgname());
			dw.getDwjbxx().setZcrq(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
			dw.getDwjbxx().setHylb("10");
			if (ValidateHelper.isNotEmptyString(dw.getFwBean().getFwid())) {
				FwJbxxBean fwBean = fwService.queryFwJbxxBeanByFwid(dw.getFwBean().getFwid(),"fwinfo");
				dw.setFwBean(fwBean);
			}

		} else {
			dw = dwService.queryDwByJgbh(dw.getDwjbxx().getJgbh());
		}
		return "toDwInfoPage";
	}

	/**
	 * 调整至行业类别页面
	 * 
	 * @return
	 * @date 2013-10-12 下午06:03:56
	 */
	public String goHylbInfoPage() throws Exception {
		try {
			dw = dwService.queryDwHyInfo(dw.getDwjbxx().getJgbh(), dw
					.getDwjbxx().getHylb());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "hllbinfo_" + dw.getDwjbxx().getHylb();
	}
	
	/**
	 * 根据行业类别加载单位信息
	 * @return
	 * @throws Exception
	 */
	public String loadTzhyTsxxInfoPage() throws Exception {
		String thlb = dw.getTzhy().getThlb();
		if (ValidateHelper.isNotEmptyString(dw.getDwjbxx().getHylb())) {
			dw = dwService.queryDwHyInfo(dw.getDwjbxx().getJgbh(), dw
					.getDwjbxx().getHylb());
		}
		return "tzhy_" + thlb;
	}
	
	/**
	 * 根据单位名称查询单位信息
	 * @return
	 */
	public String toQueryDwxxByDwmc(){
		return "toQueryDwxxByDwmc";
	}
	
	/**
	 * 跳转到单位基本信息页面
	 * @return
	 * @throws Exception
	 */
	public String goDwJbxxPage() throws Exception {
		dw = dwService.queryDwByJgbh(dw.getDwjbxx().getJgbh());
		
		return "goDwJbxxPage";
	}

	/**
	 * 跳转到房屋选择页面
	 * 
	 * @return
	 */
	public String toDwfw() {
		super.initQueryBean(queryBean);
		return "toDwfw";
	}
	
	/**
	 * 跳转到单位选择页面
	 * @return
	 */
	public String toDwselect(){
		initQueryBean();
		return "toDwselect";
	}
	
	/**
	 * 跳转到单位安全设备登记页面
	 */
	public String toDwaqsb() throws Exception {
		DwAqsbBean aqsb = dwService.queryDwAqsbByJgbh(jgbh);
		if(!CommonConstant.OPERTYPE_DETAIL.equals(operType)){
			if (aqsb == null) {
				aqsb = new DwAqsbBean();
				aqsb.setDjrxm(loginInfo.getRealname());
				aqsb.setDjdwdm(loginInfo.getOrgcode());
				aqsb.setDjdwmc(loginInfo.getOrgname());
				aqsb.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			}
			aqsb.setCzrxm(loginInfo.getRealname());
			aqsb.setCzdwdm(loginInfo.getOrgcode());
			aqsb.setCzdwmc(loginInfo.getOrgname());
			aqsb.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
		}
		dw.setAqsb(aqsb);
		return "toDwaqsb";
	}

	/**
	 * 查询安全检查列表
	 */
	public void queryAqjcList(){
		responseWrite(dwService.queryAqjcList(dwcx, getPageInfo()));
	}
	
	/**
	 * 导出安全检查
	 * @return
	 */
	public String downloadAqjc(){
		aqjcList = dwService.queryAqjcList(dwcx);
		return "downloadAqjc";
	}
	
	/**
	 * 跳转到单位页面
	 * 
	 * @return
	 */
	public String toDw() throws Exception {
		String operType = dw.getOpertype();
		if (ValidateHelper.isEmptyString(operType)) {
			throw new Exception();
		} else {
			dwcx.setHylb(hylb);
			// 操作类型为新增
			if (CommonConstant.OPERTYPE_ADD.equals(operType)) {
				String dzid = "";
				if (dw.getDwjbxx() != null) {
					dzid = dw.getDwjbxx().getDzid();
				}

				DwjbxxBean dwjbxx = new DwjbxxBean();
				dwjbxx.setZrdwpcsdm(loginInfo.getOrgcode());
				dwjbxx.setZrdwpcsmc(loginInfo.getOrgname());
				dwjbxx.setZrmjxm(loginInfo.getRealname());
				dwjbxx.setZrmjdh(loginInfo.getTelephone());
				dwjbxx.setZrmjjh(loginInfo.getUsername());

				dwjbxx.setDjrxm(loginInfo.getRealname());
				dwjbxx.setDjsj(DateTimeHelper
						.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				dwjbxx.setDjdwmc(loginInfo.getOrgname());
				dwjbxx.setDjdwdm(loginInfo.getOrgcode());

				dwjbxx.setCzrxm(loginInfo.getRealname());
				dwjbxx.setCzdwdm(loginInfo.getOrgcode());
				dwjbxx.setCzdwmc(loginInfo.getOrgname());
				dwjbxx.setCzsj(DateTimeHelper
						.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				dwjbxx.setCzbs(CommonConstant.CZBZ_ADD);
				dwjbxx.setHylb(hylb);

				if (dzid.equals("")) {
					dw.setDwdz(new DzxxBean());
				} else {
					dwjbxx.setDzid(dzid);
					dw.setDwdz(dwService.queryDzxxByDzid(dzid));
				}
				dw.setDwjbxx(dwjbxx);

				if ("01".equals(hylb)) {
					dw.setTzhy(new TzhyBean());
					dw.setThlgy(new ThlgyBean());
				} else if ("02".equals(hylb)) {
					dw.setGgcs(new GgcsBean());
				} else if ("03".equals(hylb)) {
					dw.setNbdw(new NbdwBean());
				} else {
					dw.setSwfwcs(new SwfwcsBean());
				}

				// 操作类型为修改
			} else if (CommonConstant.OPERTYPE_UPDATE.equals(operType)) {
				dw = dwService.queryDwByJgbh(jgbh);
				DwjbxxBean dwjbxx = dw.getDwjbxx();
				dwjbxx.setCzrxm(loginInfo.getRealname());
				dwjbxx.setCzdwdm(loginInfo.getOrgcode());
				dwjbxx.setCzdwmc(loginInfo.getOrgname());
				dwjbxx.setCzsj(DateTimeHelper
						.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				dwjbxx.setCzbs(CommonConstant.CZBZ_UPDATE);
				dw.setDwjbxx(dwjbxx);

				dw.setDwjbxx(dwjbxx);
				// 操作类型为详情
			} else {
				dw = dwService.queryDwByJgbh(jgbh);
			}
			dw.setOpertype(operType);
		}
		return "toDw";
	}

	/**
	 * 跳转到安保人员页面
	 * 
	 * @return
	 */
	public String toAbry() throws Exception {
		return "toAbry";
	}

	/**
	 * 跳转到安保设施页面
	 * 
	 * @return
	 */
	public String toAbss() throws Exception {
		dw = dwService.queryDwJbxxByJgbh(jgbh);
		DwabssBean abss = new DwabssBean();
		abss.setSydwmc(dw.getDwjbxx().getDwmc());
		abss.setSydwdz(dw.getFwBean().getDzmc());
		initDjxx(abss);
		dw.setAbss(abss);
		dw.setAbssList(dwService.queryAbssListByjgbh(jgbh));
		return "toAbss";
	}

	/**
	 * 跳转到技防单位信息
	 * @return
	 */
	public String toJfdwPage() throws Exception{
		if(CommonConstant.OPERTYPE_ADD.equals(operType)){
			DwjbxxBean dwjbxx = new DwjbxxBean();
			try {
				initDjxx(dwjbxx);
				initCzxx(dwjbxx);
				
				dwjbxx.setZrmjxm(loginInfo.getRealname());
				dwjbxx.setZrmjjh(loginInfo.getUsername());
				dwjbxx.setZrmjdh(loginInfo.getMoblie());
				dwjbxx.setZrdwpcsdm(loginInfo.getOrgcode());
				dwjbxx.setZrdwpcsmc(loginInfo.getOrgname());
			} catch (Exception e) {
				e.printStackTrace();
			}
			dw.setDwjbxx(dwjbxx);
		}else{
			dw = dwService.queryDwByJgbh(jgbh);
			
			if(CommonConstant.OPERTYPE_UPDATE.equals(operType)){
				if(dw != null){
					initCzxx(dw.getDwjbxx());
				}
			}
		}
		
		return "toJfdwPage";
	}
	
	/**
	 * 跳转到技防单位列表页面
	 * @return
	 */
	public String toJfdwListPage(){
		return "toJfdwListPage";
	}
	
	/**
	 * 跳转到安全检查页面
	 * 
	 * @return
	 */
	public String toAqjc() throws Exception {
		return "toAqjc";
	}
	
	/**
	 * 跳转到从业人员页面
	 * 
	 * @return
	 */
	public String toCyry() throws Exception {
		return "toCyry";
	}

	/**
	 * 跳转到重点要害部位页面
	 * 
	 * @return
	 */
	public String toZdyhbw() throws Exception {
		return "toZdyhbw";
	}

	/**
	 * 跳转到单位奖惩信息页面
	 * 
	 * @return
	 */
	public String toDwjc() throws Exception {
		return "toDwjc";
	}

	/**
	 * 跳转到单位照片页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toDwzp() throws Exception {
		dw.setDwzpList(dwService.queryDwzpByJgbh(jgbh));
		return "toDwzp";
	}
	
	/**
	 * 跳转到单位查询页面
	 * 
	 * @return
	 */
	public String toDwcx() {
		initQueryBean();
		dwcx.setDjsjstart(DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), -31, "yyyy-MM-dd"));
		dwcx.setDjsjend(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toDwcx";
	}
	
	/**
	 * 跳转到安全检查列表
	 * @return
	 */
	public String toAqjcListPage(){
		initQueryBean();
		return "toAqjcListPage";
	} 
	
	/**********************内保管理***********************/
	
	/**
	 * 内保单位查询
	 */
	public String toNbdwcx()
	{
		initQueryBean();
		dwcx.setDjsjstart(DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), -31, "yyyy-MM-dd"));
		dwcx.setDjsjend(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toNbdwcx";
	}
	
	/**
	 * 单位信息统计
	 * @return
	 */
	public String toDwtj(){
		initQueryBean();
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
		return "toDwtj";
	}
	
	/**
	 * 查询统计内保单位，按各类别统计
	 */
	public void queryNbdwlbtjPageResultInfo(){
		PageResultInfo<NbDwTjBean> pageResultInfo = dwService.queryNbdwlbtjPageResultInfo(getPageInfo(), dwcx,dwtjjb);
		responseWrite(pageResultInfo);
	}
	
	/**
	 * 单位发案统计
	 * @return
	 */
	public String toDwfatj(){
		initQueryBean();
		return "toDwfatj";
	}
	
	/**************************************************/
	
	
	/**
	 * 跳转到从业人员列表
	 * 
	 * @return
	 */
	public String toCyryList() {
		initQueryBean(cyrycx);
		cyrycx.setDjsj_start(DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), -31, "yyyy-MM-dd"));
		cyrycx.setDjsj_end(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toCyryList";
	}

	/**
	 * 跳转到从业人员详情
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toCyryDetail() throws Exception 
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		DwcyryBean cyry = dw.getCyry();
		if(cyry.getCyrybh() != null)
		{
			cyry = dwService.queryCyryByCyrybh(dw.getCyry().getCyrybh());
			if(cyry != null && CommonConstant.OPERTYPE_UPDATE.equals(dw.getOpertype()))
			{
				cyry.setCzrxm(loginInfo.getRealname());
				cyry.setCzdwdm(loginInfo.getOrgcode());
				cyry.setCzdwmc(loginInfo.getOrgname());
				cyry.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
				cyry.setCzrsfzh(loginInfo.getSfzh());
				cyry.setCzrjh(loginInfo.getUsername());
			}
			dw.setCyry(cyry);
		}else{
			cyry.setZxbs("0");
			cyry.setDjrxm(loginInfo.getRealname());
			cyry.setDjdwdm(loginInfo.getOrgcode());
			cyry.setDjdwmc(loginInfo.getOrgname());
			cyry.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			cyry.setDjrsfzh(loginInfo.getSfzh());
			
			cyry.setCzrjh(loginInfo.getUsername());
			cyry.setCzrsfzh(loginInfo.getSfzh());
			cyry.setCzrxm(loginInfo.getRealname());
			cyry.setCzdwdm(loginInfo.getOrgcode());
			cyry.setCzdwmc(loginInfo.getOrgname());
			cyry.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			dw.setCyry(cyry);
		}
		if ("1".equals(cyry.getSfjwry()))
		{
			return "toCyryDetail_jwrk";
		}
		else
		{
			return "toCyryDetail_syrk";
		}
	}

	/**
	 * 跳转到实有单位查询
	 * 
	 * @return
	 */
	public String toSydwcx() {
		return "toSydwcx";
	}

	/**
	 * 单位安全检查查询分页
	 * 
	 * @date 2013-10-17 上午10:15:33
	 */
	public void queryDwaqjcBeans() {
		PageResultInfo<DwaqjcBean> pageResultInfo = dwService.queryDwAqjcPageResultInfoByJgbh(getPageInfo(), dwcx);
		responseWrite(pageResultInfo);
	}

	/**
	 * 单位奖惩查询分页
	 * 
	 * @date 2013-10-17 上午11:24:19
	 */
	public void queryDwjcBeans() {
		PageResultInfo<DwjcBean> pageResultInfo = dwService.queryDwjcPageResultInfo(getPageInfo(), dwcx.getJgbh());
		responseWrite(pageResultInfo);
	}

	/**
	 * 分页查询重点要害部位
	 * 
	 * @date 2013-10-17 下午03:11:23
	 */
	public void queryZdyhbwBeans() {
		PageResultInfo<ZdyhbwBean> pageResultInfo = dwService
				.queryZdyhbwPageResultInfoByJgbh(getPageInfo(), dwcx.getJgbh());
		responseWrite(pageResultInfo);
	}
	
	/**
	 * 显示单位照片
	 * 
	 * @throws Exception
	 */
	public void showDwzp() throws Exception {
		InputStream is = null;
		OutputStream os = null;
		try {
			os = response.getOutputStream();
			Blob dwzp = dwService.queryDwzpById(dw.getDwzp().getId());
			if (dwzp != null)
			{
				is = dwzp.getBinaryStream();
				byte[] b = new byte[1024];
				while (is.read(b) > 0) 
				{
					os.write(b);
					os.flush();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
				os.close();
			} catch (IOException e) {
			}
		}
	}
	
	/**
	 * 分页查询从业人员
	 * 
	 * @throws Exception
	 */
	public void queryCyryPageResultInfo() throws Exception 
	{
		responseWrite(dwService.queryCyryPageResultInfo(getPageInfo(), cyrycx));
	}
	
	/**
	 * 从业人员统计分析
	 * @return
	 */
	public String toCyryTjfxList(){
		initQueryBean(cyrycx);
		cyrycx.setDjsj_start(DateTimeHelper.addDateTimeToStr(System.currentTimeMillis(), -31, "yyyy-MM-dd"));
		cyrycx.setDjsj_end(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toCyryTjfxList";
	}
	
	/**
	 * 从业人员统计分析结果
	 */
	public void queryCyryTjList(){
		cyrytjlist = dwService.queryCyryTjList(cyrycx);
		responseWrite(cyrytjlist);
	}
	
	public void queryCyryListByJgbh()
	{
		PageResultInfo<DwcyryBean> pageResult = null;
		try
		{
			if (ValidateHelper.isNotEmptyString(cyrycx.getJgbh()))
			{
				pageResult = dwService.queryCyryPageResultInfo(getPageInfo(), cyrycx);
			}
			else
			{
				pageResult = new PageResultInfo<DwcyryBean>();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			pageResult = new PageResultInfo<DwcyryBean>();
		}
		responseWrite(pageResult);
	}
	
	public void queryCyryLsByRybh() throws Exception
	{
		PageResultInfo<DwcyryBean> pageResult = null;
		String rybh = cyrycx.getRybh();
		//查询当前
		if (ValidateHelper.isEmptyString(rybh))
		{
			pageResult = dwService.queryCyryPageResultInfo(getPageInfo(), cyrycx);
		}
		//查询历史
		else
		{
			cyrycx.setCyrybh("");
			pageResult = dwService.queryCyryPageResultInfo(getPageInfo(), cyrycx);
		}
		responseWrite(pageResult);
	}

	/**
	 * 查询从业人员派发列表
	 */
	public void queryCyryPfList(){
		responseWrite(dwService.queryCyryPfList(getPageInfo(), cyrycx));
	}
	
	/**
	 * 分页查询单位基本信息
	 * 
	 * @throws Exception
	 */
	public void queryDwjbxxPageResultInfoByJgbh() throws Exception 
	{
		responseWrite(dwService.queryDwjbxxPageResultInfo(getPageInfo(), dwcx));
	}
	
	/**
	 * 分页查询内保单位
	 * @throws Exception
	 */
	public void queryNbdwPageResultInfo() throws Exception{
		responseWrite(dwService.queryNbdwPageResultInfo(getPageInfo(), dwcx));
	}

	/**
	 * 删除单位照片
	 * 
	 * @throws Exception
	 */
	public void deleteDwzp()
	{
		try
		{
			dwService.deleteDwzp(dw.getDwzp().getId());
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
		
	}
	
	/**
	 * 注销从业人员
	 */
	public void delCyryByCyryBh() throws Exception
	{
		dwService.delCyryByCyryBh(dw.getCyry().getCyrybh());
	}
	
	/**
	 * 恢复从业人员
	 * @throws Exception
	 */
	public void resetCyryByCyryBh() throws Exception{
		dwService.resetCyryByCyryBh(dw.getCyry().getCyrybh());
	}
	
	//删除从业人员
	public void delteCyryBycyrybh(){
		dwService.delteCyryByCyrybh(dw.getCyry().getCyrybh());
	}
	
	/**
	 * 根据机构编号查询单位下的所有从业人员
	 */
	public void queryDwcyryList(){
		responseWrite(dwService.queryDwcyryList(jgbh));
	}

	/**
	 * 注销单位
	 * 
	 * @throws Exception
	 */
	public void deleteDwByjgbh() throws Exception {
		dwService.delDwByJgbh(dw.getDwjbxx().getJgbh());
	}

	/**
	 * 恢复注销单位
	 * 
	 * @throws Exception
	 */
	public void resetDwByJgbh() throws Exception {
		dwService.resetDwByJgbh(dw.getDwjbxx().getJgbh());
	}
	
	/**
	 * 内保管理-实体查询
	 * @return
	 */
	public String toStcxPage(){
		return "toStcxPage";
	}
	
	/**
	 * 内保单位登记
	 * @return
	 */
	public String toNbdwdj()
	{
		return "toNbdwdj";
	}
	//////////////////////////////////////单位详情//////////////////////////////////////////
	
	//单位详情
	public String toDwDetail()
	{
		
		return "toDwDetail";
	}
	
	//单位基本信息
	public String toDwjbxxDetail() throws Exception{
		dw = dwService.queryDwJbxxByJgbh(dw.getDwjbxx().getJgbh());
		return "toDwjbxxDetail";
	}

	//单位菜单
	public String toDwMenu(){
		return "toDwMenu";
	}
	
	/**
	 * 01	特种行业
	 * 02	公共场所	
	 * 03	企事业单位
	 * 04	危险品单位
	 * 05	上网服务场所
	 * 06	涉外单位
	 */
	public String toDwInfoDetail() throws Exception{
		String hylb = dw.getDwjbxx().getHylb();
		dw = dwService.queryDwHyInfo(dw.getDwjbxx().getJgbh(), dw.getDwjbxx().getHylb());
		return "dw_" + hylb + "_detail";
	}
	
	
	//单位照片详情
	public String toDwzpDetail() throws Exception{
		dw.setDwzpList(dwService.queryDwzpByJgbh(dw.getDwjbxx().getJgbh()));
		return "toDwzpDetail";
	}
	
	//从业人员详情
	public String toDwCyryDetail() throws Exception{
		return "toDwCyryDetail";
	}
	
	//安全检查详情
	public String toAqjcList() throws Exception{
		return "toAqjcList";
	}
	
	public String toAqjcDetail() throws Exception{
		DwaqjcBean aqjc = dwService.queryAqjcByJlbh(dw.getAqjc().getJlbh());
		dw.setAqjc(aqjc);
		return "toAqjcDetail";
	}
	
	//单位奖惩详情
	public String toDwjcList() throws Exception{
		return "toDwjcList";
	}
	
	public String toDwjcDetail() throws Exception{
		DwjcBean dwjc = dwService.queryDwjcByBh(dw.getDwjc().getBh());
		dw.setDwjc(dwjc);
		return "toDwjcDetail";
	}
	
	//重点要害部位详情
	public String toZdyhbwList() throws Exception{
		return "toZdyhbwList";
	}
	
	public String toZdyhbwDetail() throws Exception{
		ZdyhbwBean zdyhbw = dwService.queryZdthByYhbwbh(dw.getZdyhbw().getYhbwbh());
		dw.setZdyhbw(zdyhbw);
		return "toZdyhbwDetail";
	}
	
	//安全设备详情
	public String toAqsbDetail() throws Exception{
		DwAqsbBean aqsb = dwService.queryDwAqsbByJgbh(dw.getDwjbxx().getJgbh());
		dw.setAqsb(aqsb);
		return "toAqsbDetail";
	}
	
	//安保设施详情
	public String toAbssDetail() throws Exception{
		dw.setAbssList(dwService.queryAbssListByjgbh(dw.getDwjbxx().getJgbh()));
		return "toAbssDetail";
	}
	
	//保卫机构列表
	public String toBwjgListDetail() throws Exception{
		dw.setBwjgList(dwService.queryBwjgByJgbh(dw.getDwjbxx().getJgbh()));
		dw.setBwzdList(dwService.queryBwzdByJgbh(dw.getDwjbxx().getJgbh()));
		dw.setBwjysList(dwService.queryBwjysByJgbh(dw.getDwjbxx().getJgbh()));
		
		return "toBwjgListDetail";
	}
	
	//突发事件预案列表
	public String toTfsjyaListDetail() throws Exception{
		dw.setTfsjyaList(dwService.queryTfsjyaByJgbh(dw.getDwjbxx().getJgbh()));
		return "toTfsjyaListDetail";
	}
	
	//突发事件预案列表
	public String toTfsjyaDetail() throws Exception{
		dw.setTfsjya(dwService.queryTfsjyaByYabh(dw.getTfsjya().getYabh()));
		return "toTfsjyaDetail";
	}
	
	//不安定因素详情
	public String toBadysDetail() throws Exception{
		dw.setBadysList(dwService.queryBadysByJgbh(dw.getDwjbxx().getJgbh()));
		return "toBadysDetail";
	}
	
	//灾害事故
	public String toZhsgDetail() throws Exception{
		dw.setZhsgList(dwService.queryZhsgByJgbh(dw.getDwjbxx().getJgbh()));
		return "toZhsgDetail";
	}
	
	//安全隐患
	public String toAqyhDetail() throws Exception
	{
		dw.setAqyhList(dwService.queryAqyhByJgbh(dw.getDwjbxx().getJgbh()));
		return "toAqyhDetail";
	}
	
	/**
	 * 跳转到从业人员派发列表页面
	 * @return
	 */
	public String toCyryPfListPage()
	{
		cyrycx.setDjsj_start("2014-06-01");
		cyrycx.setDjsj_end(DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		return "toCyryPfListPage";
	}
	
	/**
	 * 跳转到从业人员反馈页面
	 * @return
	 */
	public String toCyryfkPage()
	{
		return "toCyryfkPage";
	}

	public String toZdryyhbwFjxxPage()
	{
		zdyhbwzpbeans = dwService.queryZdyhbwZpBeans(dwcx);
		return "toZdryyhbwFjxxPage";
	}
	
	public void deleteZdyhbwzpBean()
	{
		try
		{
			dwService.deleteZdyhbwzpBean(bh);
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
	}
	
	public void saveCyryfkxx()
	{
		boolean result = false;
		try
		{
			dwService.saveCyryfkxx(cyryBean);
			result = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			result = false;
		}
		responseWrite(result);
	}
	
	public void uploadFile()
	{
		String bhs = "";
		try
		{
			List<ZdyhbwZpBean> zpbeans = dwService.saveZdyhbwZpBean(dwcx.getYhbwbh(), uploads, uploadsFileName);
			if (ValidateHelper.isNotEmptyCollection(zpbeans))
			{
				for (int i=0;i<zpbeans.size();i++)
				{
					if (i==zpbeans.size()-1)
					{
						bhs += zpbeans.get(i).getBh();
					}
					else
					{
						bhs += zpbeans.get(i).getBh() + ",";
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		responseWrite(bhs);
	}
	
	public void showYhbwzp()
	{
		try
		{
			Blob blob = dwService.queryYhbwzp(bh);
			if (blob != null)
			{
				InputStream is = blob.getBinaryStream();
				if (is == null) return ;
				byte[] b = new byte[1024];
				while(is.read(b) > 0)
				{
					response.getOutputStream().write(b);
					response.getOutputStream().flush();
				}
				is.close();
				response.getOutputStream().close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 从业人员导出
	 * @return
	 */
	
	public String  toExportExcelCyryInfoPage(){
		if(ValidateHelper.isNotEmptyString(cyrybhs)){
			cyryBeans = dwService.queryDwCyryListByCyrybhs(cyrybhs);
		}else{
//			cyrycx.setLeve(loginInfo.getLeve());
//			cyrycx.setOrgcode(loginInfo.getOrgcode());
			cyryBeans = dwService.queryDwCyryListByQueryBean(cyrycx);
		}
		return "toExportExcelCyryInfoPage";
	}
	
	/**
	 * 从业人员统计结果导出
	 * @return
	 */
	public String  toExportExcelCyrytjInfoPage(){
		cyrytjlist = dwService.queryCyryTjList(cyrycx);
		return "toExportExcelCyrytjInfoPage";
	}
	
	
	/**
	 * 实有单位导出  电子台账（商铺门店 、 企事业单位、【特种行业、娱乐场所】）
	 * @return
	 */
	public String  toExportExcelSydwInfoPage(){
		if(ValidateHelper.isNotEmptyString(jgbhs)){
			sydwBeans = dwService.queryDwListByJgbhs(jgbhs);
		}else{
			sydwBeans = dwService.queryDwListByDwQueryBean(dwcx);
		}
		return "toExportExcelSydwInfoPage";
	}
	
	/**
	 * 跳转到年审信息页面
	 * @return
	 */
	public String toJfdwNsxxPage(){
		try{
			dw = dwService.queryDwByJgbh(jgbh);
			nsxx = new JfdwNsxxBean();
			if(dw.getDwjbxx() != null){
				nsxx.setJgbh(dw.getDwjbxx().getJgbh());
				jgbh = dw.getDwjbxx().getJgbh();
			}
			initDjxx((OperateBean)nsxx);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "toJfdwNsxxPage";
	}
	
	/**
	 * 保存技防单位年审信息
	 */
	public void saveJfdwnsxx(){
		responseWrite(dwService.saveJfwdwNsxx(nsxx));
	}
	
	/**
	 * 根据机构编号查询技防单位年审信息
	 */
	public void queryJfdwNsxxByJgbh(){
		responseWrite(dwService.queryJfdwNsxxByJgbh(jgbh, getPageInfo()));
	}
	////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 跳转到从业人员派发
	 */
	public String toCyrypf()
	{
		try 
		{
			DwcyryBean cyry = dwService.queryCyryByCyrybh(dw.getCyry().getCyrybh());
			dw.setCyry(cyry);
		} 
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return "toCyrypf";
	}
	
	/**
	 * 从业人员派发
	 */
	public void Cyrypf(){
		dwService.cyrypf(cyrypf);
	}
	
	/**
	 * 检查单位
	 * @return
	 */
	public void checkDw(){
		responseWrite(dwService.checkDw(jgbh));
	}
	
	
	public DwBean getDw() {
		return dw;
	}

	public void setDw(DwBean dw) {
		this.dw = dw;
	}

	public DwQueryBean getDwcx() {
		return dwcx;
	}

	public void setDwcx(DwQueryBean dwcx) {
		this.dwcx = dwcx;
	}

	public String getJgbh() {
		return jgbh;
	}

	public void setJgbh(String jgbh) {
		this.jgbh = jgbh;
	}

	public String getHylb() {
		return hylb;
	}

	public void setHylb(String hylb) {
		this.hylb = hylb;
	}

	public CyryQueryBean getCyrycx() {
		return cyrycx;
	}

	public void setCyrycx(CyryQueryBean cyrycx) {
		this.cyrycx = cyrycx;
	}

	public RkxxBean getRkBean() {
		if (dw.getCyry() != null) {
			rkBean.setJbxxBean(dw.getCyry());
			rkBean.setJwrkBean(dw.getCyry().getJwrk());
		}
		if (dw.getAbry() != null) {
			rkBean.setJbxxBean(dw.getAbry());
		}
		return rkBean;
	}

	public void setRkBean(RkxxBean rkBean) {
		this.rkBean = rkBean;
	}

	public List<SystemDictionaryBean> getHylbList() throws SQLException {
		hylbList = new DwServiceImpl().getHylbZd();
		return hylbList;
	}

	public void setHylbList(List<SystemDictionaryBean> hylbList) {
		this.hylbList = hylbList;
	}

	public String getThlb() {
		return thlb;
	}

	public void setThlb(String thlb) {
		this.thlb = thlb;
	}

	public List<SystemDictionaryBean> getKslxList() {
		kslxList = DictionaryCacheHellper
				.getSystemDictionaryListByZdlb("ZDY_KSLX");
		if (ValidateHelper.isEmptyCollection(kslxList)) {
			kslxList = new ArrayList<SystemDictionaryBean>();
		}
		return kslxList;
	}

	public void setKslxList(List<SystemDictionaryBean> kslxList) {
		this.kslxList = kslxList;
	}

	public List<SystemDictionaryBean> getWxpdwflList() {
		wxpdwflList = DictionaryCacheHellper
				.getSystemDictionaryListByZdlb("ZDY_WXPDWFL");
		return wxpdwflList;
	}

	public void setWxpdwflList(List<SystemDictionaryBean> wxpdwflList) {
		this.wxpdwflList = wxpdwflList;
	}

	public boolean getIsdblclick()
	{
		return isdblclick;
	}

	public void setIsdblclick(boolean isdblclick)
	{
		this.isdblclick = isdblclick;
	}
	
	public String getHylbmc() {
		if(ValidateHelper.isNotEmptyString(this.hylb)){
			hylbmc = DictionaryCacheHellper.getSystemDictionaryValueByZdlbAndDm("ZDY_HYLB", this.hylb);
		}
		return hylbmc;
	}

	public void setHylbmc(String hylbmc) {
		this.hylbmc = hylbmc;
	}
	
	public String getDwfwzt() {
		return dwfwzt;
	}

	public void setDwfwzt(String dwfwzt) {
		this.dwfwzt = dwfwzt;
	}

	/**
	 * 初始化登记信息
	 * @param bean
	 */
	private void initDjxx(OperateBean bean) throws Exception {
		if(bean != null){
			bean.setDjrxm(loginInfo.getRealname());
			bean.setDjdwmc(loginInfo.getOrgname());
			bean.setDjdwdm(loginInfo.getOrgcode());
			bean.setDjsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			bean.setDjrjh(loginInfo.getUsername());
			bean.setDjrsfzh(loginInfo.getSfzh());
		}else{
			throw new Exception("对象为空，无法初始化登记信息!");
		}
	}
	
	/**
	 * 初始化操作信息
	 * @param bean
	 */
	private void initCzxx(OperateBean bean) throws Exception{
		if(bean != null ){
			bean.setCzrxm(loginInfo.getRealname());
			bean.setCzdwmc(loginInfo.getOrgname());
			bean.setCzdwdm(loginInfo.getOrgcode());
			bean.setCzrjh(loginInfo.getUsername());
			bean.setCzsj(DateTimeHelper.getNowDateStr("yyyy-MM-dd HH:mm:ss"));
			bean.setCzrsfzh(loginInfo.getSfzh());
		}else{
			throw new Exception("对象为空，无法初始化操作信息!");
		}
	}
	
	/**
	 * 导出技防单位年审信息
	 */
	public String downloadJfdwnsxx(){
		nsList = dwService.queryJfdwNsxx(dwcx);
		return "downloadJfdwnsxx";
		
	}

	public FwQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(FwQueryBean queryBean) {
		this.queryBean = queryBean;
	}
	public List<SystemDictionaryBean> getRytssxList() {
		rytssxList = DictionaryCacheHellper.getSystemDictionaryListByZdlb("ZDY_RYTSSX");
		return rytssxList;
	}

	public void setRytssxList(List<SystemDictionaryBean> rytssxList) {
		this.rytssxList = rytssxList;
	}
	public boolean getIsxttxpage() {
		return isxttxpage;
	}

	public void setIsxttxpage(boolean isxttxpage) {
		this.isxttxpage = isxttxpage;
	}

	public DwcyryBean getCyryBean() {
		return cyryBean;
	}

	public void setCyryBean(DwcyryBean cyryBean) {
		this.cyryBean = cyryBean;
	}

	public File[] getUploads()
	{
		return uploads;
	}

	public void setUploads(File[] uploads)
	{
		this.uploads = uploads;
	}

	public String[] getUploadsFileName()
	{
		return uploadsFileName;
	}

	public void setUploadsFileName(String[] uploadsFileName)
	{
		this.uploadsFileName = uploadsFileName;
	}

	public String getBh()
	{
		return bh;
	}

	public void setBh(String bh)
	{
		this.bh = bh;
	}

	public List<ZdyhbwZpBean> getZdyhbwzpbeans()
	{
		return zdyhbwzpbeans;
	}

	public void setZdyhbwzpbeans(List<ZdyhbwZpBean> zdyhbwzpbeans)
	{
		this.zdyhbwzpbeans = zdyhbwzpbeans;
	}

	public String getCyrybhs() {
		return cyrybhs;
	}

	public void setCyrybhs(String cyrybhs) {
		this.cyrybhs = cyrybhs;
	}

	public List<DwcyryBean> getCyryBeans() {
		return cyryBeans;
	}

	public void setCyryBeans(List<DwcyryBean> cyryBeans) {
		this.cyryBeans = cyryBeans;
	}

	public String getJgbhs() {
		return jgbhs;
	}

	public void setJgbhs(String jgbhs) {
		this.jgbhs = jgbhs;
	}

	public List<DwjbxxBean> getSydwBeans() {
		return sydwBeans;
	}

	public void setSydwBeans(List<DwjbxxBean> sydwBeans) {
		this.sydwBeans = sydwBeans;
	}

	public CyryPfBean getCyrypf() {
		return cyrypf;
	}

	public void setCyrypf(CyryPfBean cyrypf) {
		this.cyrypf = cyrypf;
	}

	public JfdwNsxxBean getNsxx() {
		return nsxx;
	}

	public void setNsxx(JfdwNsxxBean nsxx) {
		this.nsxx = nsxx;
	}

	public boolean getIsCyrypf()
	{
		return isCyrypf;
	}

	public void setIsCyrypf(boolean isCyrypf)
	{
		this.isCyrypf = isCyrypf;
	}
	
	public List<JfdwNsxxBean> getNsList() {
		return nsList;
	}

	public void setNsList(List<JfdwNsxxBean> nsList) {
		this.nsList = nsList;
	}

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

	public String getDwtjjb() {
		return dwtjjb;
	}

	public void setDwtjjb(String dwtjjb) {
		this.dwtjjb = dwtjjb;
	}

	public List<NbDwTjBean> getReslist() {
		return reslist;
	}

	public void setReslist(List<NbDwTjBean> reslist) {
		this.reslist = reslist;
	}

	public List<DwaqjcBean> getAqjcList() {
		return aqjcList;
	}

	public void setAqjcList(List<DwaqjcBean> aqjcList) {
		this.aqjcList = aqjcList;
	}

	public List<CyrytjBean> getCyrytjlist() {
		return cyrytjlist;
	}

	public void setCyrytjlist(List<CyrytjBean> cyrytjlist) {
		this.cyrytjlist = cyrytjlist;
	}
}
