package com.chinacreator.xtgl.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.xtgl.bean.KfpzBean;
import com.chinacreator.xtgl.bean.KhkpParamBean;
import com.chinacreator.xtgl.bean.PageTableBean;
import com.chinacreator.xtgl.bean.PageTableHeadBean;
import com.chinacreator.xtgl.dao.KhkpkfxDao;
import com.chinacreator.xtgl.dao.impl.KhkpkfxDaoImpl;
import com.chinacreator.xtgl.service.KhkpKfxService;
import com.frameworkset.common.poolman.Record;
import com.frameworkset.common.poolman.SQLExecutor;
import com.frameworkset.common.poolman.handle.NullRowHandler;

public class KhkpKfxServiceImpl implements KhkpKfxService{

	private static final long serialVersionUID = 1L;
	
	private KhkpkfxDao dao = new KhkpkfxDaoImpl();

	@Override
	public Map<String,?> getResultMap(KhkpParamBean bean) {
		//初始化计算时间
		initQuery(bean);
		int leve = CommonDBBaseHelper.getOrgLeve(bean.getOrgcode());
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			//保存表名和表头的对应关系
			Map<String, PageTableBean> tableMap = new HashMap<String, PageTableBean>();
			
			//查询页面的表格
			List<PageTableBean> tableList = dao.queryTableByKhlx(bean.getKhlx(),leve);
			if(tableList != null){
				for(int i = 0; i<tableList.size(); i++){
					List<PageTableHeadBean> tableHeadList = dao.queryPageTableHeadByTablename(tableList.get(i).getTablename());
					if(tableHeadList == null){
						throw new Exception("没有配置表头，无法生成页面.");
					}else{
						tableList.get(i).setTableHeadList(tableHeadList);
						tableMap.put(tableList.get(i).getTablename(),tableList.get(i));
					}
				}
				
				//查询考核配置
				KfpzBean khpz = dao.queryKfpzByKhlx(bean.getKhlx(),leve);
				if(khpz != null){
					resultMap.put("khpz", khpz);
					
					//解析返回值
					String resultStr = khpz.getFhz();

					//返回值为空 
					if(resultStr == null){
						throw new NullPointerException("返回值未配置");
					}
					
					final Map<String,String> resultStrMap = new HashMap<String, String>();
					try {
						resultStr = resultStr.replace("{", "");
						resultStr = resultStr.replace("}", "");
						resultStr = resultStr.trim();
						String [] resultStrArry = resultStr.split(";");
						for(int i = 0 ; i < resultStrArry.length ; i++){
							resultStrMap.put(resultStrArry[i].split(":")[0], resultStrArry[i].split(":")[1]);
						}
					} catch (Exception e) {
						throw new Exception("返回值结构配置错误.");
					}
					
					
					//保存表名和数据的对应关系
					Map<String,List<List<String>>> dataMap = new HashMap<String, List<List<String>>>();
					//解析SQL
					String sqls = khpz.getSql().trim();
					try {
						sqls = sqls.replace("{", "");
						sqls = sqls.replace("}", "");
						String [] sqlArry = sqls.trim().split(";");
						for(int i = 0 ; i < sqlArry.length ; i++){
							final String tablename = sqlArry[i].split(":")[0].trim();
							String sql = sqlArry[i].split(":")[1].trim();
							final List<List<String>> dataList = new ArrayList<List<String>>();
							//查询数据
							SQLExecutor.queryBeanWithDBNameByNullRowHandler(new NullRowHandler<String>(){
								@Override
								public void handleRow(Record record) throws Exception {
									List<String> tdData = new ArrayList<String>();
									String [] resultArray = resultStrMap.get(tablename).split(",");
									for(int i = 0 ; i < resultArray.length ; i++){
										tdData.add(record.getString(resultArray[i]));
									}
									dataList.add(tdData);
								}
							}, CommonConstant.DBNAME_SQJW,sql, bean);
							dataMap.put(tablename, dataList);
						}
					} catch (Exception e) {
						throw new Exception("SQL结构配置错误.");
					}
					
				
					//结构化数据
					List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
					Iterator<String> it = tableMap.keySet().iterator();
					while (it.hasNext()) {
						String key = it.next();
						Map<String,Object> dateMap = new HashMap<String, Object>();
						dateMap.put("pageTable", tableMap.get(key));
						dateMap.put("pageData", dataMap.get(key));
						dataList.add(dateMap);
					}
					
					resultMap.put("table", dataList);
					
				}else{
					throw new Exception("配置考核错误，无法生成数据.");
				}
			}else{
				throw new Exception("没有配置页面表格，无法生成页面.");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	//初始化计算时间
	protected void initQuery(KhkpParamBean bean) {
		//获取当前日期的计算阶段
		int now_jsjd = 0;
		
		//计算阶段
		int jsjd = Integer.parseInt(bean.getTjjd());
		
		Calendar now = Calendar.getInstance();
		int now_day = now.get(Calendar.DAY_OF_MONTH);
		//1-10 号一阶段
		if(now_day <= 10){
			now_jsjd = 1;
		}
		//11 - 20 号 二阶段
		else if(now_day > 10 && now_day <= 20 ){
			now_jsjd = 2;
		}
		//21号到月底三阶段
		else{
			now_jsjd = 3;
		}
		
		Calendar khyf = Calendar.getInstance();
		khyf.set(Calendar.YEAR, Integer.parseInt(bean.getTjyf().substring(0,4)));
		khyf.set(Calendar.MONTH, Integer.parseInt(bean.getTjyf().substring(4,6)) - 1);
		
		//选择的考核时间在现在 之前
		if(khyf.before(now) 
				|| (new SimpleDateFormat("yyyyMMdd").format(khyf.getTime()).equals(new SimpleDateFormat("yyyyMMdd").format(now.getTime())))){
			//年份相同
			if(now.get(Calendar.YEAR) == khyf.get(Calendar.YEAR)){
				//月份相等 则比较计算阶段
				if(now.get(Calendar.MONTH) == khyf.get(Calendar.MONDAY)){
					//统计阶段相同 取上一天的统计结果
					if(jsjd == now_jsjd){
						bean.setJssj(new SimpleDateFormat("yyyyMMdd").format(now.getTime()));
						now = Calendar.getInstance();
					}
					//统计阶段比现在小
					else if(jsjd < now_jsjd){
						if(jsjd == 1){
							now.set(Calendar.DAY_OF_MONTH,11);
							bean.setJssj(new SimpleDateFormat("yyyyMMdd").format(now.getTime()));
							now = Calendar.getInstance();
						}
						else if(jsjd == 2){
							now.set(Calendar.DAY_OF_MONTH,21);
							bean.setJssj(new SimpleDateFormat("yyyyMMdd").format(now.getTime()));
							now = Calendar.getInstance();
						}
					}
				}
				
				//年份相等且月份小于当前月份  或者 年份比当前年份小
				if((khyf.get(Calendar.MONDAY) < now.get(Calendar.MONTH) && now.get(Calendar.YEAR) == khyf.get(Calendar.YEAR))
						|| (now.get(Calendar.YEAR) < khyf.get(Calendar.YEAR))){
					if(jsjd == 1){
						khyf.set(Calendar.DAY_OF_MONTH, 10);
						bean.setJssj(new SimpleDateFormat("yyyyMMdd").format(khyf.getTime()));
					}else if(jsjd == 2){
						khyf.set(Calendar.DAY_OF_MONTH, 10);
						bean.setJssj(new SimpleDateFormat("yyyyMMdd").format(khyf.getTime()));
					}else if(jsjd == 3){
						khyf.set(Calendar.MONTH, khyf.get(Calendar.MONTH) + 1);
						khyf.set(Calendar.DAY_OF_MONTH, 1);
						bean.setJssj(new SimpleDateFormat("yyyyMMdd").format(khyf.getTime()));
					}
				}
			}
		}
		
	}
	
	public static void main(String [] args){
		Calendar khyf = Calendar.getInstance();
		khyf.set(Calendar.YEAR, Integer.parseInt("2014"));
		khyf.set(Calendar.MONTH, Integer.parseInt("01"));
		
		Calendar now = Calendar.getInstance();
		now.set(Calendar.MONTH, 2);
		now.set(Calendar.DAY_OF_MONTH,1);
		now.add(Calendar.DAY_OF_MONTH,-1);
		System.out.println(now.get(Calendar.DAY_OF_MONTH));
	}
}
