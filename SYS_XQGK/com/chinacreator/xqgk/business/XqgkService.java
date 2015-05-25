package com.chinacreator.xqgk.business;

import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.helper.PaginationHelper;
import com.chinacreator.xqgk.bean.SqDetailColumnInfo;
import com.chinacreator.xqgk.bean.SqDetailQueryInfo;
import com.chinacreator.xqgk.bean.XqgkQueryInfo;
import com.chinacreator.xqgk.bean.XqgkQueryInfoDetail;
import com.chinacreator.xqgk.bean.XqgkShowInfo;
import com.chinacreator.xqgk.bean.XqgkShowNumInfo;
import com.chinacreator.xqgk.bean.query.CyryQueryBean;
import com.chinacreator.xqgk.bean.query.SydwQueryBean;
import com.chinacreator.xqgk.bean.query.SyfwQueryBean;
import com.chinacreator.xqgk.bean.query.SyjzQueryBean;
import com.chinacreator.xqgk.bean.query.SyrkQueryBean;
import com.chinacreator.xqgk.bean.query.XqfaQueryBean;
import com.chinacreator.xqgk.bean.query.XqzaQueryBean;
import com.chinacreator.xqgk.bean.query.ZdryQueryBean;
import com.chinacreator.xqgk.bean.show.CyryBean;
import com.chinacreator.xqgk.bean.show.SydwBean;
import com.chinacreator.xqgk.bean.show.SyfwBean;
import com.chinacreator.xqgk.bean.show.SyjzBean;
import com.chinacreator.xqgk.bean.show.SyrkBean;
import com.chinacreator.xqgk.bean.show.XqzaBean;
import com.chinacreator.xqgk.bean.show.ZdryBean;
import com.chinacreator.xqgk.dao.SqDetailDao;
import com.chinacreator.xqgk.dao.XqgkDataDao;
import com.chinacreator.xqgk.dao.XqgkDetailDao;
import com.chinacreator.xqgk.utils.DateUtils;
import com.chinacreator.xqgk.utils.DeptUtils;

@SuppressWarnings("unchecked")
public class XqgkService {

	public static XqgkService getInstance(){
		return new XqgkService();
	}

	/**
	 * 查询辖区概况具体数值
	 * @param deptCode 单位代码
	 * @param infoCode 查询数据类型
	 * @return
	 * @throws Exception
	 */
	public XqgkShowInfo getDataOfQueryInfo(String deptCode, String infoCode) throws Exception {
		XqgkQueryInfo info = XqgkDataDao.getInstance().getQueryByCode(infoCode);

		XqgkShowInfo showInfo = new XqgkShowInfo();
		if (info != null)
		{
			showInfo.setCode(info.getCode());
			showInfo.setName(info.getName());
			for(XqgkQueryInfoDetail detail : info.getList())
			{
				int num = XqgkDataDao.getInstance().getDataOfQueryInfo(deptCode, detail);
				XqgkShowNumInfo numInfo = new XqgkShowNumInfo();
				numInfo.setId(detail.getId());
				numInfo.setNumStr(NumberFormat.getNumberInstance().format(num));
				showInfo.addData2List(numInfo);
			}
		}
		return showInfo;
	}
	
	/**
	 * 获取辖区各下级单位实有人口信息
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public List<SyrkBean> querySyrkInfoOfDept(String deptCode) throws Exception {
		SyrkQueryBean query = new SyrkQueryBean();
		query.setDeptCode(deptCode);
		query.setChildLevel(DeptUtils.getLevel(deptCode) + 1);
		query.setTjDate(DateUtils.getDateTime("yyyy-MM-dd", new Date()));
		
		return XqgkDetailDao.getInstance().querySyrkInfoOfDept(query);
	}
	
	/**
	 * 获取辖区各下级单位实有建筑信息
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public List<SyjzBean> querySyjzInfoOfDept(String deptCode) throws Exception {
		SyjzQueryBean query = new SyjzQueryBean();
		query.setDeptCode(deptCode);
		query.setChildLevel(DeptUtils.getLevel(deptCode) + 1);
		query.setTjDate(DateUtils.getDateTime("yyyy-MM-dd", new Date()));
		
		return XqgkDetailDao.getInstance().querySyjzInfoOfDept(query);
	}
	/**
	 * 获取辖区各下级单位实有从业人员信息
	 */
	public List<CyryBean> queryCyryInfoOfDept(String deptCode) throws Exception{
		CyryQueryBean query = new CyryQueryBean();
		query.setDeptCode(deptCode);
		query.setChildLevel(DeptUtils.getLevel(deptCode)+1);
		
	   return XqgkDetailDao.getInstance().queryCyryInfoOfDept(query);
		
	}
	
	
	/**
	 * 获取辖区各下级单位实有房屋信息
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public List<SyfwBean> querySyfwInfoOfDept(String deptCode) throws Exception {
		SyfwQueryBean query = new SyfwQueryBean();
		query.setDeptCode(deptCode);
		query.setChildLevel(DeptUtils.getLevel(deptCode) + 1);
		query.setTjDate(DateUtils.getDateTime("yyyy-MM-dd", new Date()));
		
		return XqgkDetailDao.getInstance().querySyfwInfoOfDept(query);
	}
	
	/**
	 * 获取辖区各下级单位实有单位信息
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public List<SydwBean> querySydwInfoOfDept(String deptCode) throws Exception {
		SydwQueryBean query = new SydwQueryBean();
		query.setDeptCode(deptCode);
		query.setChildLevel(DeptUtils.getLevel(deptCode) + 1);
		query.setTjDate(DateUtils.getDateTime("yyyy-MM-dd", new Date()));
		
		return XqgkDetailDao.getInstance().querySydwInfoOfDept(query);
	}
	
	public List<ZdryBean> queryZdryInfoOfDept(String deptCode) throws Exception {
		ZdryQueryBean query = new ZdryQueryBean();
		query.setDeptCode(deptCode);
		query.setChildLevel(DeptUtils.getLevel(deptCode) + 1);
		query.setTjDate(DateUtils.getDateTime("yyyy-MM-dd", new Date()));
		
		return XqgkDetailDao.getInstance().queryZdryInfoOfDept(query);
	}
	
	public List<ZdryBean> querySelfZdryOfDept(String deptCode) throws Exception {
		return XqgkDetailDao.getInstance().querySelfZdryOfDept(deptCode);
	}
	
	/**
	 * 获取辖区治安信息
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public List<XqzaBean> queryXqzaInfo(String deptCode) throws Exception{
		XqzaQueryBean query = new XqzaQueryBean();
		query.setDeptCode(deptCode);
		query.setChildLevel(DeptUtils.getLevel(deptCode) + 1);
		query.setTjDate(DateUtils.getDateTime("yyyy-MM-dd", new Date()));
		
		return XqgkDetailDao.getInstance().queryXqzaInfo(query);
	}
	
	/**
	 * 获取辖区各下级单位发案信息
	 * @param deptCode
	 * @return
	 * @throws Exception
	 */
	public List<XqzaBean> queryXqzaInfoOfDept(String deptCode) throws Exception{
		XqzaQueryBean query = new XqzaQueryBean();
		query.setDeptCode(deptCode);
		query.setChildLevel(DeptUtils.getLevel(deptCode) + 1);
		query.setTjDate(DateUtils.getDateTime("yyyy-MM-dd", new Date()));
		
		return XqgkDetailDao.getInstance().queryXqzaInfoOfDept(query);
	}
	
	/**
	 * 获取辖区内近期全部发案
	 * @param deptCode
	 * @return
	 * @throws SQLException
	 */
	public List<HashMap> getLatestAJInfo(XqfaQueryBean query) throws SQLException{
		return XqgkDataDao.getInstance().getLatestAJInfo(query);
	}
	
	public PageResultInfo getDataOfQueryInfo(String deptCode, SqDetailQueryInfo queryInfo, PageInfo pageInfo) throws Exception{
		List result = new ArrayList();
		
		String sql = queryInfo.getSql() + "'" + deptCode + "'";
		Map map = SqDetailDao.getInstance().getDataOfQueryInfo(sql, pageInfo);
		int total = (Integer)map.get("total");
		
		Object obj = map.get("data");
		List<HashMap> resList = new ArrayList<HashMap>();
		if(obj != null){
			resList = (List<HashMap>)map.get("data");
		}
		for(HashMap res : resList){
			List<Map<String, String>> trInfo = new LinkedList<Map<String,String>>();
			
			for(SqDetailColumnInfo columnInfo : queryInfo.getList()){
				String col = columnInfo.getColName().toUpperCase();
				
				Map<String, String> data = new HashMap<String, String>();
				if(columnInfo.getIsParam() == 1){
					data.put("val", columnInfo.getShowColName());
					if(StringUtils.isEmpty(queryInfo.getActUrl())){
						data.put("actUrl", "");
					}else{
						data.put("actUrl", queryInfo.getActUrl() + (String)res.get(col));	
					}
				}else{
					if(StringUtils.isEmpty((String)res.get(col))){
						data.put("val", "&nbsp;");	
					}else{
						data.put("val", (String)res.get(col));
					}
					
					data.put("actUrl", "");
				}
				data.put("align", columnInfo.getAlign());
				
				trInfo.add(data);
			}
			result.add(trInfo);
		}
		
		PageResultInfo res = PaginationHelper.wrapPageResultInfo(pageInfo, (long)total, result);
		return res;
	}
	
	/*-----------------------------------------------------------------*/

	
	
	@SuppressWarnings("unused")
	private String getPieXml(List resList){
		StringBuilder sb = new StringBuilder();
		String pieStyle = " pieSliceDepth='30' pieYScale='55' startingAngle='290' pieRadius='100' ";
		sb.append("<chart palette='2' animation='1' formatNumberScale='0'  numberSuffix='人' showValues='0' " + pieStyle + ">");
		
		for(int i = 0; i < resList.size(); i ++){
			HashMap map = (HashMap)resList.get(i);
			String sliType = "0";
			if(i >= (resList.size() / 2)){
				sliType = "1";	
			}
			String mc = (String) map.get("MC");
			String num = (String) map.get("COU");
			sb.append("<set label='" + mc + "' value='" + num + "' isSliced='" + sliType + "'/>");
		}
		sb.append("<styles>");
		sb.append("<definition><style type='font' name='CaptionFont' size='15' color='#cc0000' /><style type='font' name='SubCaptionFont' bold='0'/></definition>");
		sb.append("<application><apply toObject='caption' styles='CaptionFont' /><apply toObject='SubCaption' styles='SubCaptionFont' /></application>");
		sb.append("</styles>");
		
		sb.append("</chart>");
		return sb.toString();
	}

}

