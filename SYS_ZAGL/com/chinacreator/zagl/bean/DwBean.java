package com.chinacreator.zagl.bean;

import java.util.ArrayList;
import java.util.List;

import com.chinacreator.common.bean.CommonLogBean;
import com.chinacreator.common.cps.bean.DzxxBean;
import com.chinacreator.lsgl.bean.FwJbxxBean;
import com.chinacreator.lsgl.bean.RkfwglBean;
import com.chinacreator.sydw.bean.DwGlbmHsBean;

public class DwBean extends CommonLogBean
{
	
	private static final long serialVersionUID = -904783329363015047L;
	
	private boolean isupdatefield = false;
	
	private DwfwglBean dwfwglBean = new DwfwglBean();
	
	private RkfwglBean rkfwglBean = new RkfwglBean();
	
	private FwJbxxBean fwBean = new FwJbxxBean();
	
	/**
	 * 单位安全设备
	 */
	private DwAqsbBean aqsb = new DwAqsbBean();
	
	/**
	 * 单位地址信息
	 */
	private DzxxBean dwdz = new DzxxBean();
	
	
	/**
	 * 单位照片
	 */
	private List<DwzpxxBean> dwzpList;
	
	private DwzpxxBean dwzp = new DwzpxxBean();
	
	/**
	 * 单位基本信息
	 */
	private DwjbxxBean dwjbxx = new DwjbxxBean();
	
	/**
	 * 特种行业
	 */
	private TzhyBean tzhy = new TzhyBean();;
	
	/**
	 * 特行旅馆
	 */
	private ThlgyBean thlgy = new ThlgyBean();
	
	/**
	 * 特行开锁
	 */
	private ThksyBean thksyBean = new ThksyBean();
	
	/**
	 * 上网服务场所
	 */
	private SwfwcsBean swfwcs = new SwfwcsBean();
	
	/**
	 * 公共场所
	 */
	private GgcsBean ggcs = new GgcsBean();
	
	/**
	 * 内保单位
	 */
	private NbdwBean nbdw = new NbdwBean();
	
	/**
	 * 涉外单位
	 */
	private SwdwBean swdwBean = new SwdwBean();
	
	/**
	 * 危险品单位
	 */
	private WxwpdwBean wxwpdwBean = new WxwpdwBean();
	
	/**
	 * 技防单位
	 */
	private JfdwBean jfdw = new JfdwBean();
	

	/**
	 * 九小场所
	 */
	private JxcsBean jxcs;
	
	/**
	 * 安保人员
	 */
	private List<DwabryBean> abryList;
	
	private DwabryBean abry;
	
	/**
	 * 安保设施
	 */
	private List<DwabssBean> abssList;
	
	private DwabssBean abss;
	
	/**
	 * 安全检查
	 */
	private List<DwaqjcBean> aqjcList;
	
	/**
	 * 安全检查对象
	 */
	private DwaqjcBean aqjc = new DwaqjcBean();
	
	/**
	 * 从业人员
	 */
	private List<DwcyryBean> cyryList;
	
	private DwcyryBean cyry = new DwcyryBean();
	
	/**
	 * 单位奖惩
	 */
	private List<DwjcBean> dwjcList;
	
	/**
	 * 单位奖惩
	 */
	private DwjcBean dwjc = new DwjcBean();
	
	/**
	 * 重点要害部位
	 */
	private List<ZdyhbwBean> zdyhbwList;
	
	private ZdyhbwBean zdyhbw = new ZdyhbwBean();
	
	/**
	 * 保卫机构
	 */
	private BwjgBean bwjg = new BwjgBean();
	private List<BwjgBean> bwjgList = new ArrayList<BwjgBean>();
	
	/**
	 * 保卫建议书
	 */
	private BwjysBean bwjys = new BwjysBean();
	private List<BwjysBean> bwjysList = new ArrayList<BwjysBean>();
	
	/**
	 * 保卫制度
	 */
	private BwzdBean bwzd = new BwzdBean();
	private List<BwzdBean> bwzdList = new ArrayList<BwzdBean>();
	
	/**
	 * 突发事件预案
	 */
	private TfsjyaBean tfsjya = new TfsjyaBean();
	private List<TfsjyaBean> tfsjyaList = new ArrayList<TfsjyaBean>();

	/**
	 * 不安定因素
	 */
	private BadysBean badys = new BadysBean();
	private List<BadysBean> badysList = new ArrayList<BadysBean>();
	
	/**
	 * 灾害事故
	 */
	private ZhsgBean zhsg = new ZhsgBean();
	private List<ZhsgBean> zhsgList = new ArrayList<ZhsgBean>();
	
	/**
	 * 安全隐患
	 */
	private AqyhBean aqyh = new AqyhBean();
	private List<AqyhBean> aqyhList  = new ArrayList<AqyhBean>();
	
	/**
	 * 单位管理部门核实
	 */
	private DwGlbmHsBean dwhs = new DwGlbmHsBean();
	
	public DzxxBean getDwdz() {
		return dwdz;
	}

	public void setDwdz(DzxxBean dwdz) {
		this.dwdz = dwdz;
	}

	public List<DwzpxxBean> getDwzpList() {
		return dwzpList;
	}

	public void setDwzpList(List<DwzpxxBean> dwzpList) {
		this.dwzpList = dwzpList;
	}

	public DwjbxxBean getDwjbxx() {
		return dwjbxx;
	}

	public void setDwjbxx(DwjbxxBean dwjbxx) {
		this.dwjbxx = dwjbxx;
	}

	public TzhyBean getTzhy() {
		return tzhy;
	}

	public void setTzhy(TzhyBean tzhy) {
		this.tzhy = tzhy;
	}

	public ThlgyBean getThlgy() {
		return thlgy;
	}

	public void setThlgy(ThlgyBean thlgy) {
		this.thlgy = thlgy;
	}

	public SwfwcsBean getSwfwcs() {
		return swfwcs;
	}

	public void setSwfwcs(SwfwcsBean swfwcs) {
		this.swfwcs = swfwcs;
	}

	public GgcsBean getGgcs() {
		return ggcs;
	}

	public void setGgcs(GgcsBean ggcs) {
		this.ggcs = ggcs;
	}

	public NbdwBean getNbdw() {
		return nbdw;
	}

	public void setNbdw(NbdwBean nbdw) {
		this.nbdw = nbdw;
	}

	public List<DwabryBean> getAbryList() {
		return abryList;
	}

	public void setAbryList(List<DwabryBean> abryList) {
		this.abryList = abryList;
	}

	public DwabryBean getAbry() {
		return abry;
	}

	public void setAbry(DwabryBean abry) {
		this.abry = abry;
	}

	public List<DwabssBean> getAbssList() {
		return abssList;
	}

	public void setAbssList(List<DwabssBean> abssList) {
		this.abssList = abssList;
	}

	public DwabssBean getAbss() {
		return abss;
	}

	public void setAbss(DwabssBean abss) {
		this.abss = abss;
	}

	public List<DwaqjcBean> getAqjcList() {
		return aqjcList;
	}

	public void setAqjcList(List<DwaqjcBean> aqjcList) {
		this.aqjcList = aqjcList;
	}

	public DwaqjcBean getAqjc() {
		return aqjc;
	}

	public void setAqjc(DwaqjcBean aqjc) {
		this.aqjc = aqjc;
	}

	public List<DwcyryBean> getCyryList() {
		return cyryList;
	}

	public void setCyryList(List<DwcyryBean> cyryList) {
		this.cyryList = cyryList;
	}

	public DwcyryBean getCyry() {
		return cyry;
	}

	public void setCyry(DwcyryBean cyry) {
		this.cyry = cyry;
	}

	public List<DwjcBean> getDwjcList() {
		return dwjcList;
	}

	public void setDwjcList(List<DwjcBean> dwjcList) {
		this.dwjcList = dwjcList;
	}

	public DwjcBean getDwjc() {
		return dwjc;
	}

	public void setDwjc(DwjcBean dwjc) {
		this.dwjc = dwjc;
	}

	public List<ZdyhbwBean> getZdyhbwList() {
		return zdyhbwList;
	}

	public void setZdyhbwList(List<ZdyhbwBean> zdyhbwList) {
		this.zdyhbwList = zdyhbwList;
	}

	public ZdyhbwBean getZdyhbw() {
		return zdyhbw;
	}

	public void setZdyhbw(ZdyhbwBean zdyhbw) {
		this.zdyhbw = zdyhbw;
	}

	public DwzpxxBean getDwzp() {
		return dwzp;
	}

	public void setDwzp(DwzpxxBean dwzp) {
		this.dwzp = dwzp;
	}

	public JxcsBean getJxcs() {
		return jxcs;
	}

	public void setJxcs(JxcsBean jxcs) {
		this.jxcs = jxcs;
	}

	public FwJbxxBean getFwBean()
	{
		return fwBean;
	}

	public void setFwBean(FwJbxxBean fwBean)
	{
		this.fwBean = fwBean;
	}

	public DwfwglBean getDwfwglBean()
	{
		return dwfwglBean;
	}

	public void setDwfwglBean(DwfwglBean dwfwglBean)
	{
		this.dwfwglBean = dwfwglBean;
	}

	public ThksyBean getThksyBean()
	{
		return thksyBean;
	}

	public void setThksyBean(ThksyBean thksyBean)
	{
		this.thksyBean = thksyBean;
	}

	public SwdwBean getSwdwBean()
	{
		return swdwBean;
	}

	public void setSwdwBean(SwdwBean swdwBean)
	{
		this.swdwBean = swdwBean;
	}

	public WxwpdwBean getWxwpdwBean()
	{
		return wxwpdwBean;
	}

	public void setWxwpdwBean(WxwpdwBean wxwpdwBean)
	{
		this.wxwpdwBean = wxwpdwBean;
	}

	public RkfwglBean getRkfwglBean()
	{
		return rkfwglBean;
	}

	public void setRkfwglBean(RkfwglBean rkfwglBean)
	{
		this.rkfwglBean = rkfwglBean;
	}

	public DwAqsbBean getAqsb() {
		return aqsb;
	}

	public void setAqsb(DwAqsbBean aqsb) {
		this.aqsb = aqsb;
	}

	public BwjgBean getBwjg() {
		return bwjg;
	}

	public void setBwjg(BwjgBean bwjg) {
		this.bwjg = bwjg;
	}

	public List<BwjgBean> getBwjgList() {
		return bwjgList;
	}

	public void setBwjgList(List<BwjgBean> bwjgList) {
		this.bwjgList = bwjgList;
	}

	public BwjysBean getBwjys() {
		return bwjys;
	}

	public void setBwjys(BwjysBean bwjys) {
		this.bwjys = bwjys;
	}

	public List<BwjysBean> getBwjysList() {
		return bwjysList;
	}

	public void setBwjysList(List<BwjysBean> bwjysList) {
		this.bwjysList = bwjysList;
	}

	public BwzdBean getBwzd() {
		return bwzd;
	}

	public void setBwzd(BwzdBean bwzd) {
		this.bwzd = bwzd;
	}

	public List<BwzdBean> getBwzdList() {
		return bwzdList;
	}

	public void setBwzdList(List<BwzdBean> bwzdList) {
		this.bwzdList = bwzdList;
	}

	public TfsjyaBean getTfsjya() {
		return tfsjya;
	}

	public void setTfsjya(TfsjyaBean tfsjya) {
		this.tfsjya = tfsjya;
	}

	public List<TfsjyaBean> getTfsjyaList() {
		return tfsjyaList;
	}

	public void setTfsjyaList(List<TfsjyaBean> tfsjyaList) {
		this.tfsjyaList = tfsjyaList;
	}

	public BadysBean getBadys() {
		return badys;
	}

	public void setBadys(BadysBean badys) {
		this.badys = badys;
	}

	public List<BadysBean> getBadysList() {
		return badysList;
	}

	public void setBadysList(List<BadysBean> badysList) {
		this.badysList = badysList;
	}

	public ZhsgBean getZhsg() {
		return zhsg;
	}

	public void setZhsg(ZhsgBean zhsg) {
		this.zhsg = zhsg;
	}

	public List<ZhsgBean> getZhsgList() {
		return zhsgList;
	}

	public void setZhsgList(List<ZhsgBean> zhsgList) {
		this.zhsgList = zhsgList;
	}

	public AqyhBean getAqyh() {
		return aqyh;
	}

	public void setAqyh(AqyhBean aqyh) {
		this.aqyh = aqyh;
	}

	public List<AqyhBean> getAqyhList() {
		return aqyhList;
	}

	public void setAqyhList(List<AqyhBean> aqyhList) {
		this.aqyhList = aqyhList;
	}

	public JfdwBean getJfdw() {
		return jfdw;
	}

	public void setJfdw(JfdwBean jfdw) {
		this.jfdw = jfdw;
	}

	public boolean getIsupdatefield()
	{
		return isupdatefield;
	}

	public void setIsupdatefield(boolean isupdatefield)
	{
		this.isupdatefield = isupdatefield;
	}

	public DwGlbmHsBean getDwhs() {
		return dwhs;
	}

	public void setDwhs(DwGlbmHsBean dwhs) {
		this.dwhs = dwhs;
	}

}
