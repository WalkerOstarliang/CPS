package com.chinacreator.xtgl.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.bean.PageInfo;
import com.chinacreator.common.bean.PageResultInfo;
import com.chinacreator.common.bean.QueryBean;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.xtgl.bean.BywclBean;
import com.chinacreator.xtgl.bean.JwtBean;
import com.chinacreator.xtgl.bean.KhpmBean;
import com.chinacreator.xtgl.bean.SjcjslBean;
import com.chinacreator.xtgl.bean.SqkhtjBean;
import com.chinacreator.xtgl.bean.WtsjtjfxBean;
import com.chinacreator.xtgl.bean.WtsjtjfxpzBean;
import com.chinacreator.xtgl.dao.KhkpDao;
import com.chinacreator.xtgl.dao.impl.KhkpDaoImpl;
import com.chinacreator.xtgl.query.JwtQueryBean;
import com.chinacreator.xtgl.query.KhkpQueryBean;
import com.chinacreator.xtgl.query.WtsjtjfxQueryBean;
import com.chinacreator.xtgl.service.KhkpService;

public class KhkpServiceImpl implements KhkpService {

	private static final long serialVersionUID = 2176164556361482684L;
	
	private KhkpDao dao = new KhkpDaoImpl();
	
	private LoginInfo loginInfo = ActionContextHelper.getLoginInfo();

	public String queryKhkp(QueryBean bean) {
		try{
			return dao.queryKhkp(bean).size() + "";
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	public List<KhpmBean> queryKhkpDl(QueryBean bean) {
		try{
			return dao.queryKhkpDl(bean);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	public List<KhpmBean> queryKhkpXl(QueryBean bean) {
		try{
			return dao.queryKhkpXl(bean);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	public List<SqkhtjBean> querySqkhtj(QueryBean bean) {
		try{
			return dao.querySqkhtj(bean);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public HSSFWorkbook downLoadExcel(HSSFWorkbook workbook,KhkpQueryBean bean) throws Exception {
		if(workbook == null){
			throw new Exception("excel文档为空。");
		}
		
		HSSFSheet sheet = workbook.createSheet();
		//网上考核
		if("03".equals(bean.getTjlb())){
			createWskhReport(sheet,getCellStyle(workbook),bean);
		//两实数据采集
		}else if("04".equals(bean.getTjlb())){
			createLscjReport(sheet,getCellStyle(workbook),bean);
		//重点人员动态管控
		}else if("05".equals(bean.getTjlb())){
			createDtgkReport(sheet,getCellStyle(workbook),bean);
		}
		
		return workbook;
	}
	
	//网上考核
	protected void createWskhReport(HSSFSheet sheet,Map<String,HSSFCellStyle> styleMap,KhkpQueryBean bean) throws Exception {
		if(sheet == null){
			throw new Exception("sheet页为空或者样式为空。");
		}
		
		HSSFRow row0 = sheet.createRow(0);
		HSSFRow row2 = sheet.createRow(2);
		
		//生成表头
		HSSFRow row3 = sheet.createRow(3);
		HSSFRow row4 = sheet.createRow(4);
		
		HSSFCell cellA3 = row3.createCell(0);
		sheet.setColumnWidth(0,50*256);
		HSSFCell cellA4 = row4.createCell(0);
		cellA4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		cellA3.setCellValue(new HSSFRichTextString("单位名称"));
		cellA3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,0,0));
		
		int cellIndex = 0;
		if("5".equals(bean.getTjjb())){
			HSSFCell cellB3 = row3.createCell(++cellIndex);
			cellB3.setCellValue(new HSSFRichTextString("民警"));
			cellB3.setCellStyle(styleMap.get("tableHeadStyle"));
			HSSFCell cellB4 = row4.createCell(cellIndex);
			cellB4.setCellStyle(styleMap.get("tableHeadStyle"));
			sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
			sheet.setColumnWidth(cellIndex,20*256);
			HSSFCell cellB2 = row2.createCell(cellIndex);
			cellB2.setCellStyle(styleMap.get("msStyle"));
		}
		
		HSSFCell cellC3 = row3.createCell(++cellIndex);
		cellC3.setCellValue(new HSSFRichTextString("总分值"));
		cellC3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellC4 = row4.createCell(cellIndex);
		cellC4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		sheet.setColumnWidth(cellIndex,8*256);
		HSSFCell cellC2 = row2.createCell(cellIndex);
		cellC2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellD3 = row3.createCell(++cellIndex);
		cellD3.setCellValue(new HSSFRichTextString("排名"));
		cellD3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellD4 = row4.createCell(cellIndex);
		cellD4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		sheet.setColumnWidth(cellIndex,8*256);
		HSSFCell cellD2 = row2.createCell(cellIndex);
		cellD2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellE3 = row3.createCell(++cellIndex);
		cellE3.setCellValue(new HSSFRichTextString("两实信息采集维护25分"));
		cellE3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellE4 = row4.createCell(cellIndex);
		cellE4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		HSSFCell cellE2 = row2.createCell(cellIndex);
		cellE2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellF3 = row3.createCell(++cellIndex);
		cellF3.setCellValue(new HSSFRichTextString("重点人员动态管控20分"));
		cellF3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellF4 = row4.createCell(cellIndex);
		cellF4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		HSSFCell cellF2 = row2.createCell(cellIndex);
		cellF2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellG3 = row3.createCell(++cellIndex);
		cellG3.setCellValue(new HSSFRichTextString("情报信息收集报送5分"));
		cellG3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellG4 = row4.createCell(cellIndex);
		cellG4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		HSSFCell cellG2 = row2.createCell(cellIndex);
		cellG2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellH3 = row3.createCell(++cellIndex);
		cellH3.setCellValue(new HSSFRichTextString("治安防范日常管理5分"));
		cellH3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellH4 = row4.createCell(cellIndex);
		cellH4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		HSSFCell cellH2 = row2.createCell(cellIndex);
		cellH2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellI3 = row3.createCell(++cellIndex);
		cellI3.setCellValue(new HSSFRichTextString("相关警种基础工作20分"));
		cellI3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellJ3 = row3.createCell(cellIndex + 1);
		cellJ3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellK3 = row3.createCell(cellIndex + 2);
		cellK3.setCellStyle(styleMap.get("tableHeadStyle"));
//		HSSFCell cellL3 = row3.createCell(cellIndex + 3);
//		cellL3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellM3 = row3.createCell(cellIndex + 3);
		cellM3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellN3 = row3.createCell(cellIndex + 4);
		cellN3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellO3 = row3.createCell(cellIndex + 5);
		cellO3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellP3 = row3.createCell(cellIndex + 6);
		cellP3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,3,cellIndex,cellIndex+6));
		
		HSSFCell cellI4 = row4.createCell(cellIndex);
		cellI4.setCellValue(new HSSFRichTextString("消防基础工作5分"));
		cellI4.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellI2 = row2.createCell(cellIndex);
		cellI2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellJ4 = row4.createCell(++cellIndex);
		cellJ4.setCellValue(new HSSFRichTextString("治安基础工作5分"));
		cellJ4.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellJ2 = row2.createCell(cellIndex);
		cellJ2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellK4 = row4.createCell(++cellIndex);
		cellK4.setCellValue(new HSSFRichTextString("国保基础工作3分"));
		cellK4.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellK2 = row2.createCell(cellIndex);
		cellK2.setCellStyle(styleMap.get("msStyle"));
		
//		HSSFCell cellL4 = row4.createCell(++cellIndex);
//		cellL4.setCellValue(new HSSFRichTextString("刑侦基础工作2分"));
//		cellL4.setCellStyle(styleMap.get("tableHeadStyle"));
//		HSSFCell cellL2 = row2.createCell(cellIndex);
//		cellL2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellM4 = row4.createCell(++cellIndex);
		cellM4.setCellValue(new HSSFRichTextString("网技基础工作2分"));
		cellM4.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellM2 = row2.createCell(cellIndex);
		cellM2.setCellStyle(styleMap.get("msStyle"));
		
		
		HSSFCell cellN4 = row4.createCell(++cellIndex);
		cellN4.setCellValue(new HSSFRichTextString("内保基础工作2分"));
		cellN4.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellN2 = row2.createCell(cellIndex);
		cellN2.setCellStyle(styleMap.get("msStyle"));
		
		
		HSSFCell cellO4 = row4.createCell(++cellIndex);
		cellO4.setCellValue(new HSSFRichTextString("禁毒基础工作3分"));
		cellO4.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellO2 = row2.createCell(cellIndex);
		cellO2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellP4 = row4.createCell(++cellIndex);
		cellP4.setCellValue(new HSSFRichTextString("小计"));
		cellP4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.setColumnWidth(cellIndex,8*256);
		HSSFCell cellP2 = row2.createCell(cellIndex);
		cellP2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellQ3 = row3.createCell(++cellIndex);
		cellQ3.setCellValue(new HSSFRichTextString("防范入室盗窃案件10分"));
		cellQ3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellQ4 = row4.createCell(cellIndex);
		cellQ4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		HSSFCell cellQ2 = row2.createCell(cellIndex);
		cellQ2.setCellStyle(styleMap.get("msStyle"));
		
		//合并单元格产生标题
		
		HSSFCell cellA0 = row0.createCell(0);
		cellA0.setCellValue(new HSSFRichTextString("社区警务网上考核排名"));
		cellA0.setCellStyle(styleMap.get("titleStyle"));
		sheet.addMergedRegion(new CellRangeAddress(0,1,0,cellIndex));
		
		//生成报表描述
		HSSFCell cellA2 = row2.createCell(0);
		
		StringBuffer ms = new StringBuffer();
		if("1".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至10号" + "  ");
		}else if("2".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至20号" + "  ");
		}else if("3".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至月底" + "  ");
		}
		ms.append("制表人：" + loginInfo.getRealname() + "  ");
		ms.append("制表单位：" + loginInfo.getOrgname() + "  ");
		ms.append("制表时间：" + DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		cellA2.setCellValue(new HSSFRichTextString(ms.toString()));
		cellA2.setCellStyle(styleMap.get("msStyle"));
		sheet.addMergedRegion(new CellRangeAddress(2,2,0,cellIndex));
		
		//生成报表数据
		List<SqkhtjBean> list = querySqkhtj(bean);
		if(list == null || list.size() == 0){
			HSSFRow row5 = sheet.createRow(5);
			HSSFCell cellA5 = row5.createCell(0);
			cellA5.setCellValue(new HSSFRichTextString("暂时没有数据."));
			cellA5.setCellStyle(styleMap.get("tipStyle"));
			sheet.addMergedRegion(new CellRangeAddress(5,5,0,cellIndex));
		}else{
			for(int i = 0 ; i < list.size() ; i++){
				SqkhtjBean sqkhtj = list.get(i);
				
				HSSFRow dataRow = sheet.createRow(i + 5);
				
				HSSFCell dataCellA = dataRow.createCell(0);
				dataCellA.setCellStyle(styleMap.get("dataStyle"));
				dataCellA.setCellValue(new HSSFRichTextString(sqkhtj.getOrgname()));
				
				int dateCellIndex = 0;
				if("5".equals(bean.getTjjb())){
					HSSFCell dataCellB = dataRow.createCell(++dateCellIndex);
					dataCellB.setCellValue(sqkhtj.getMjxm());
					dataCellB.setCellStyle(styleMap.get("dataStyle"));
				}
				
				HSSFCell dataCellC = dataRow.createCell(++dateCellIndex);
				dataCellC.setCellValue(sqkhtj.getZfz());
				dataCellC.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellD = dataRow.createCell(++dateCellIndex);
				dataCellD.setCellValue(sqkhtj.getPm());
				dataCellD.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellE = dataRow.createCell(++dateCellIndex);
				dataCellE.setCellValue(sqkhtj.getA00000());
				dataCellE.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellF = dataRow.createCell(++dateCellIndex);
				dataCellF.setCellValue(sqkhtj.getB00000());
				dataCellF.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellG = dataRow.createCell(++dateCellIndex);
				dataCellG.setCellValue(sqkhtj.getD00000());
				dataCellG.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellH = dataRow.createCell(++dateCellIndex);
				dataCellH.setCellValue(sqkhtj.getE00000());
				dataCellH.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellI = dataRow.createCell(++dateCellIndex);
				dataCellI.setCellValue(sqkhtj.getC10000());
				dataCellI.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellJ = dataRow.createCell(++dateCellIndex);
				dataCellJ.setCellValue(sqkhtj.getC20000());
				dataCellJ.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellK = dataRow.createCell(++dateCellIndex);
				dataCellK.setCellValue(sqkhtj.getC30000());
				dataCellK.setCellStyle(styleMap.get("dataStyle"));

//				HSSFCell dataCellL = dataRow.createCell(++dateCellIndex);
//				dataCellL.setCellValue(sqkhtj.getC40000());
//				dataCellL.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellM = dataRow.createCell(++dateCellIndex);
				dataCellM.setCellValue(sqkhtj.getC50000());
				dataCellM.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellN = dataRow.createCell(++dateCellIndex);
				dataCellN.setCellValue(sqkhtj.getC60000());
				dataCellN.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellO = dataRow.createCell(++dateCellIndex);
				dataCellO.setCellValue(sqkhtj.getC70000());
				dataCellO.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellP = dataRow.createCell(++dateCellIndex);
				dataCellP.setCellValue(sqkhtj.getC00000());
				dataCellP.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellQ = dataRow.createCell(++dateCellIndex);
				dataCellQ.setCellValue(sqkhtj.getF00000());
				dataCellQ.setCellStyle(styleMap.get("dataStyle"));
			}
		}
	}

	//两实数据采集
	protected void createLscjReport(HSSFSheet sheet,Map<String,HSSFCellStyle> styleMap,KhkpQueryBean bean) throws Exception{
		if(sheet == null){
			throw new Exception("sheet页为空或者样式为空。");
		}
		
		HSSFRow row0 = sheet.createRow(0);
		HSSFRow row2 = sheet.createRow(2);
		
		//生成表头
		HSSFRow row3 = sheet.createRow(3);
		HSSFRow row4 = sheet.createRow(4);
		
		HSSFCell cellA3 = row3.createCell(0);
		sheet.setColumnWidth(0,50*256);
		HSSFCell cellA4 = row4.createCell(0);
		cellA4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		cellA3.setCellValue(new HSSFRichTextString("单位名称"));
		cellA3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,0,0));
		
		int cellIndex = 0;
		if("5".equals(bean.getTjjb())){
			HSSFCell cellB3 = row3.createCell(++cellIndex);
			cellB3.setCellValue(new HSSFRichTextString("民警"));
			cellB3.setCellStyle(styleMap.get("tableHeadStyle"));
			HSSFCell cellB4 = row4.createCell(cellIndex);
			cellB4.setCellStyle(styleMap.get("tableHeadStyle"));
			sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
			sheet.setColumnWidth(cellIndex,20*256);
			HSSFCell cellB2 = row2.createCell(cellIndex);
			cellB2.setCellStyle(styleMap.get("msStyle"));
		}
		
		HSSFCell cellC3 = row3.createCell(++cellIndex);
		cellC3.setCellValue(new HSSFRichTextString("总分值"));
		cellC3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellC4 = row4.createCell(cellIndex);
		cellC4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		sheet.setColumnWidth(cellIndex,8*256);
		HSSFCell cellC2 = row2.createCell(cellIndex);
		cellC2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellD3 = row3.createCell(++cellIndex);
		cellD3.setCellValue(new HSSFRichTextString("排名"));
		cellD3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellD4 = row4.createCell(cellIndex);
		cellD4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		sheet.setColumnWidth(cellIndex,8*256);
		HSSFCell cellD2 = row2.createCell(cellIndex);
		cellD2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellE3 = row3.createCell(++cellIndex);
		cellE3.setCellValue(new HSSFRichTextString("采集数量5分"));
		cellE3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellE4 = row4.createCell(cellIndex);
		cellE4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		HSSFCell cellE2 = row2.createCell(cellIndex);
		cellE2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellF2 = row2.createCell(++cellIndex);
		cellF2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellF3 = row3.createCell(cellIndex);
		cellF3.setCellValue(new HSSFRichTextString("信息维护10分"));
		cellF3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,3,cellIndex,cellIndex + 7));
		HSSFCell cellF4 = row4.createCell(cellIndex);
		cellF4.setCellValue(new HSSFRichTextString("流动人口延期或主动注销2分"));
		cellF4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellG2 = row2.createCell(++cellIndex);
		cellG2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellG3 = row3.createCell(cellIndex);
		cellG3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellG4 = row4.createCell(cellIndex);
		cellG4.setCellStyle(styleMap.get("tableHeadStyle"));
		cellG4.setCellValue(new HSSFRichTextString("流动人口系统自动注销1分"));
		sheet.addMergedRegion(new CellRangeAddress(3,3,cellIndex,cellIndex));
		
		HSSFCell cellH2 = row2.createCell(++cellIndex);
		cellH2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellH3 = row3.createCell(cellIndex);
		cellH3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellH4 = row4.createCell(cellIndex);
		cellH4.setCellValue(new HSSFRichTextString("从业人员提醒处理1分"));
		cellH4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		
		HSSFCell cellI2 = row2.createCell(++cellIndex);
		cellI2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellI3 = row3.createCell(cellIndex);
		cellI3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellI4 = row4.createCell(cellIndex);
		cellI4.setCellValue(new HSSFRichTextString("常口异动提醒处理2分"));
		cellI4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellJ2 = row2.createCell(++cellIndex);
		cellJ2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellJ3 = row3.createCell(cellIndex);
		cellJ3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellJ4 = row4.createCell(cellIndex);
		cellJ4.setCellValue(new HSSFRichTextString("境外人员提醒处理1分"));
		cellJ4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellK2 = row2.createCell(++cellIndex);
		cellK2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellK3 = row3.createCell(cellIndex);
		cellK3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellK4 = row4.createCell(cellIndex);
		cellK4.setCellValue(new HSSFRichTextString("出租屋巡查2分"));
		cellK4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellL2 = row2.createCell(++cellIndex);
		cellL2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellL3 = row3.createCell(cellIndex);
		cellL3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellL4 = row4.createCell(cellIndex);
		cellL4.setCellValue(new HSSFRichTextString("出租房屋登记提醒处理1分"));
		cellL4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellM2 = row2.createCell(++cellIndex);
		cellM2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellM3 = row3.createCell(cellIndex);
		cellM3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellM4 = row4.createCell(cellIndex);
		cellM4.setCellValue(new HSSFRichTextString("小计"));
		cellM4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellN2 = row2.createCell(++cellIndex);
		cellN2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellN3 = row3.createCell(cellIndex);
		cellN3.setCellValue(new HSSFRichTextString("信息质量10分"));
		cellN3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,3,cellIndex,cellIndex + 4));
		HSSFCell cellN4 = row4.createCell(cellIndex);
		cellN4.setCellValue(new HSSFRichTextString("两实信息质量1分"));
		cellN4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellO2 = row2.createCell(++cellIndex);
		cellO2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellO3 = row3.createCell(cellIndex);
		cellO3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellO4 = row4.createCell(cellIndex);
		cellO4.setCellValue(new HSSFRichTextString("实有人口逻辑错误1分"));
		cellO4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellP2 = row2.createCell(++cellIndex);
		cellP2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellP3 = row3.createCell(cellIndex);
		cellP3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellP4 = row4.createCell(cellIndex);
		cellP4.setCellValue(new HSSFRichTextString("单位信息质量1分"));
		cellP4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellQ2 = row2.createCell(++cellIndex);
		cellQ2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellQ3 = row3.createCell(cellIndex);
		cellQ3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellQ4 = row4.createCell(cellIndex);
		cellQ4.setCellValue(new HSSFRichTextString("实体标注和地址关联1分"));
		cellQ4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		
		HSSFCell cellS2 = row2.createCell(++cellIndex);
		cellS2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellS3 = row3.createCell(cellIndex);
		cellS3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellS4 = row4.createCell(cellIndex);
		cellS4.setCellValue(new HSSFRichTextString("信息数据重复录入2分"));
		cellS4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellT2 = row2.createCell(++cellIndex);
		cellT2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellT3 = row3.createCell(cellIndex);
		cellT3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellT4 = row4.createCell(cellIndex);
		cellT4.setCellValue(new HSSFRichTextString("信息应采未采系统对比2分"));
		cellT4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellU2 = row2.createCell(++cellIndex);
		cellU2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellU3 = row3.createCell(cellIndex);
		cellU3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellU4 = row4.createCell(cellIndex);
		cellU4.setCellValue(new HSSFRichTextString("电话号码采集率2分"));
		cellU4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellR2 = row2.createCell(++cellIndex);
		cellR2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellR3 = row3.createCell(cellIndex);
		cellR3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellR4 = row4.createCell(cellIndex);
		cellR4.setCellValue(new HSSFRichTextString("小计"));
		cellR4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		
		//合并单元格产生标题
		
		HSSFCell cellA0 = row0.createCell(0);
		cellA0.setCellValue(new HSSFRichTextString("社区警务网上两实信息采集维护排名"));
		cellA0.setCellStyle(styleMap.get("titleStyle"));
		sheet.addMergedRegion(new CellRangeAddress(0,1,0,cellIndex));
		
		//生成报表描述
		HSSFCell cellA2 = row2.createCell(0);
		
		StringBuffer ms = new StringBuffer();
		if("1".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至10号" + "  ");
		}else if("2".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至20号" + "  ");
		}else if("3".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至月底" + "  ");
		}
		ms.append("制表人：" + loginInfo.getRealname() + "  ");
		ms.append("制表单位：" + loginInfo.getOrgname() + "  ");
		ms.append("制表时间：" + DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		cellA2.setCellValue(new HSSFRichTextString(ms.toString()));
		cellA2.setCellStyle(styleMap.get("msStyle"));
		sheet.addMergedRegion(new CellRangeAddress(2,2,0,cellIndex));
		
		//生成报表数据
		List<SqkhtjBean> list = querySqkhtj(bean);
		if(list.size() == 0){
			HSSFRow row5 = sheet.createRow(5);
			HSSFCell cellA5 = row5.createCell(0);
			cellA5.setCellValue(new HSSFRichTextString("暂时没有数据."));
			cellA5.setCellStyle(styleMap.get("tipStyle"));
			sheet.addMergedRegion(new CellRangeAddress(5,5,0,cellIndex));
		}else{
			for(int i = 0 ; i < list.size() ; i++){
				SqkhtjBean sqkhtj = list.get(i);
				
				HSSFRow dataRow = sheet.createRow(i + 5);
				
				HSSFCell dataCellA = dataRow.createCell(0);
				dataCellA.setCellStyle(styleMap.get("dataStyle"));
				dataCellA.setCellValue(new HSSFRichTextString(sqkhtj.getOrgname()));
				
				int dateCellIndex = 0;
				if("5".equals(bean.getTjjb())){
					HSSFCell dataCellB = dataRow.createCell(++dateCellIndex);
					dataCellB.setCellValue(sqkhtj.getMjxm());
					dataCellB.setCellStyle(styleMap.get("dataStyle"));
				}
				
				HSSFCell dataCellC = dataRow.createCell(++dateCellIndex);
				dataCellC.setCellValue(sqkhtj.getA00000());
				dataCellC.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellD = dataRow.createCell(++dateCellIndex);
				dataCellD.setCellValue(sqkhtj.getPm());
				dataCellD.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellE = dataRow.createCell(++dateCellIndex);
				dataCellE.setCellValue(sqkhtj.getA10000());
				dataCellE.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellF = dataRow.createCell(++dateCellIndex);
				dataCellF.setCellValue(sqkhtj.getA20001());
				dataCellF.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellG = dataRow.createCell(++dateCellIndex);
				dataCellG.setCellValue(sqkhtj.getA20002());
				dataCellG.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellH = dataRow.createCell(++dateCellIndex);
				dataCellH.setCellValue(sqkhtj.getA20003());
				dataCellH.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellI = dataRow.createCell(++dateCellIndex);
				dataCellI.setCellValue(sqkhtj.getA20004());
				dataCellI.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellJ = dataRow.createCell(++dateCellIndex);
				dataCellJ.setCellValue(sqkhtj.getA20005());
				dataCellJ.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellK = dataRow.createCell(++dateCellIndex);
				dataCellK.setCellValue(sqkhtj.getA20006());
				dataCellK.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellL = dataRow.createCell(++dateCellIndex);
				dataCellL.setCellValue(sqkhtj.getA20007());
				dataCellL.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellM = dataRow.createCell(++dateCellIndex);
				dataCellM.setCellValue(sqkhtj.getA20000());
				dataCellM.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellN = dataRow.createCell(++dateCellIndex);
				dataCellN.setCellValue(sqkhtj.getA30001());
				dataCellN.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellO = dataRow.createCell(++dateCellIndex);
				dataCellO.setCellValue(sqkhtj.getA30002());
				dataCellO.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellP = dataRow.createCell(++dateCellIndex);
				dataCellP.setCellValue(sqkhtj.getA30003());
				dataCellP.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellQ = dataRow.createCell(++dateCellIndex);
				dataCellQ.setCellValue(sqkhtj.getA30004());
				dataCellQ.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellS = dataRow.createCell(++dateCellIndex);
				dataCellS.setCellValue(sqkhtj.getA30005());
				dataCellS.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellT = dataRow.createCell(++dateCellIndex);
				dataCellT.setCellValue(sqkhtj.getA30006());
				dataCellT.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellU = dataRow.createCell(++dateCellIndex);
				dataCellU.setCellValue(sqkhtj.getA30007());
				dataCellU.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellR = dataRow.createCell(++dateCellIndex);
				dataCellR.setCellValue(sqkhtj.getA30000());
				dataCellR.setCellStyle(styleMap.get("dataStyle"));
			}
		}
	}
	
	//动态管控
	protected void createDtgkReport(HSSFSheet sheet,Map<String,HSSFCellStyle> styleMap,KhkpQueryBean bean)throws Exception{
		if(sheet == null){
			throw new Exception("sheet页为空或者样式为空。");
		}
		
		HSSFRow row0 = sheet.createRow(0);
		HSSFRow row2 = sheet.createRow(2);
		
		//生成表头
		HSSFRow row3 = sheet.createRow(3);
		HSSFRow row4 = sheet.createRow(4);
		
		HSSFCell cellA3 = row3.createCell(0);
		sheet.setColumnWidth(0,50*256);
		HSSFCell cellA4 = row4.createCell(0);
		cellA4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		cellA3.setCellValue(new HSSFRichTextString("单位名称"));
		cellA3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,0,0));
		
		int cellIndex = 0;
		if("5".equals(bean.getTjjb())){
			HSSFCell cellB3 = row3.createCell(++cellIndex);
			cellB3.setCellValue(new HSSFRichTextString("民警"));
			cellB3.setCellStyle(styleMap.get("tableHeadStyle"));
			HSSFCell cellB4 = row4.createCell(cellIndex);
			cellB4.setCellStyle(styleMap.get("tableHeadStyle"));
			sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
			sheet.setColumnWidth(cellIndex,20*256);
			HSSFCell cellB2 = row2.createCell(cellIndex);
			cellB2.setCellStyle(styleMap.get("msStyle"));
		}
		
		HSSFCell cellC3 = row3.createCell(++cellIndex);
		cellC3.setCellValue(new HSSFRichTextString("总分值"));
		cellC3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellC4 = row4.createCell(cellIndex);
		cellC4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		sheet.setColumnWidth(cellIndex,8*256);
		HSSFCell cellC2 = row2.createCell(cellIndex);
		cellC2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellD3 = row3.createCell(++cellIndex);
		cellD3.setCellValue(new HSSFRichTextString("排名"));
		cellD3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellD4 = row4.createCell(cellIndex);
		cellD4.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		sheet.setColumnWidth(cellIndex,8*256);
		HSSFCell cellD2 = row2.createCell(cellIndex);
		cellD2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellE3 = row3.createCell(++cellIndex);
		cellE3.setCellValue(new HSSFRichTextString("下发数据维护8分"));
		cellE3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,3,cellIndex,cellIndex + 2));
		HSSFCell cellE4 = row4.createCell(cellIndex);
		cellE4.setCellValue(new HSSFRichTextString("首次重点人员信息2分"));
		cellE4.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellE2 = row2.createCell(cellIndex);
		cellE2.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellF2 = row2.createCell(++cellIndex);
		cellF2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellF3 = row3.createCell(cellIndex);
		cellF3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellF4 = row4.createCell(cellIndex);
		cellF4.setCellValue(new HSSFRichTextString("原有重点人员信息6分"));
		cellF4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellG2 = row2.createCell(++cellIndex);
		cellG2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellG3 = row3.createCell(cellIndex);
		cellG3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellG4 = row4.createCell(cellIndex);
		cellG4.setCellStyle(styleMap.get("tableHeadStyle"));
		cellG4.setCellValue(new HSSFRichTextString("小计"));
		
		HSSFCell cellH2 = row2.createCell(++cellIndex);
		cellH2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellH3 = row3.createCell(cellIndex);
		cellH3.setCellValue(new HSSFRichTextString("委托签收管理2分"));
		cellH3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		
		
		
		
		HSSFCell cellK2 = row2.createCell(++cellIndex);
		cellK2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellK3 = row3.createCell(cellIndex);
		cellK3.setCellValue(new HSSFRichTextString("在控登记质量6分"));
		cellK3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,3,cellIndex,cellIndex + 2));
		HSSFCell cellK4 = row4.createCell(cellIndex);
		cellK4.setCellValue(new HSSFRichTextString("关系人信息质量2分"));
		cellK4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellL2 = row2.createCell(++cellIndex);
		cellL2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellL3 = row3.createCell(cellIndex);
		cellL3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellL4 = row4.createCell(cellIndex);
		cellL4.setCellValue(new HSSFRichTextString("重点人员信息质量4分"));
		cellL4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellM2 = row2.createCell(++cellIndex);
		cellM2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellM3 = row3.createCell(cellIndex);
		cellM3.setCellStyle(styleMap.get("tableHeadStyle"));
		HSSFCell cellM4 = row4.createCell(cellIndex);
		cellM4.setCellValue(new HSSFRichTextString("小计"));
		cellM4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellO2 = row2.createCell(++cellIndex);
		cellO2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellO3 = row3.createCell(cellIndex);
		cellO3.setCellValue(new HSSFRichTextString("重点人员重新违法犯罪2分"));
		cellO3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		HSSFCell cellO4 = row4.createCell(cellIndex);
		cellO4.setCellStyle(styleMap.get("msStyle"));
		
		
		HSSFCell cellP2 = row2.createCell(++cellIndex);
		cellP2.setCellStyle(styleMap.get("msStyle"));
		HSSFCell cellP3 = row3.createCell(cellIndex);
		cellP3.setCellValue(new HSSFRichTextString("取保候审监视居住管理2分"));
		cellP3.setCellStyle(styleMap.get("tableHeadStyle"));
		sheet.addMergedRegion(new CellRangeAddress(3,4,cellIndex,cellIndex));
		HSSFCell cellP4 = row4.createCell(cellIndex);
		cellP4.setCellStyle(styleMap.get("msStyle"));
		
		//合并单元格产生标题
		HSSFCell cellA0 = row0.createCell(0);
		cellA0.setCellValue(new HSSFRichTextString("社区警务网上重点人员动态管控排名"));
		cellA0.setCellStyle(styleMap.get("titleStyle"));
		sheet.addMergedRegion(new CellRangeAddress(0,1,0,cellIndex));
		
		//生成报表描述
		HSSFCell cellA2 = row2.createCell(0);
		
		StringBuffer ms = new StringBuffer();
		if("1".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至10号" + "  ");
		}else if("2".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至20号" + "  ");
		}else if("3".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至月底" + "  ");
		}
		ms.append("制表人：" + loginInfo.getRealname() + "  ");
		ms.append("制表单位：" + loginInfo.getOrgname() + "  ");
		ms.append("制表时间：" + DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		cellA2.setCellValue(new HSSFRichTextString(ms.toString()));
		cellA2.setCellStyle(styleMap.get("msStyle"));
		sheet.addMergedRegion(new CellRangeAddress(2,2,0,cellIndex));
		
		//生成报表数据
		List<SqkhtjBean> list = querySqkhtj(bean);
		if(list.size() == 0){
			HSSFRow row5 = sheet.createRow(5);
			HSSFCell cellA5 = row5.createCell(0);
			cellA5.setCellValue(new HSSFRichTextString("暂时没有数据."));
			cellA5.setCellStyle(styleMap.get("tipStyle"));
			sheet.addMergedRegion(new CellRangeAddress(5,5,0,cellIndex));
		}else{
			for(int i = 0 ; i < list.size() ; i++){
				SqkhtjBean sqkhtj = list.get(i);
				
				HSSFRow dataRow = sheet.createRow(i + 5);
				
				HSSFCell dataCellA = dataRow.createCell(0);
				dataCellA.setCellStyle(styleMap.get("dataStyle"));
				dataCellA.setCellValue(new HSSFRichTextString(sqkhtj.getOrgname()));
				
				int dateCellIndex = 0;
				if("5".equals(bean.getTjjb())){
					HSSFCell dataCellB = dataRow.createCell(++dateCellIndex);
					dataCellB.setCellValue(sqkhtj.getMjxm());
					dataCellB.setCellStyle(styleMap.get("dataStyle"));
				}
				
				HSSFCell dataCellC = dataRow.createCell(++dateCellIndex);
				dataCellC.setCellValue(sqkhtj.getB00000());
				dataCellC.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellD = dataRow.createCell(++dateCellIndex);
				dataCellD.setCellValue(sqkhtj.getPm());
				dataCellD.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellE = dataRow.createCell(++dateCellIndex);
				dataCellE.setCellValue(sqkhtj.getB10001());
				dataCellE.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellF = dataRow.createCell(++dateCellIndex);
				dataCellF.setCellValue(sqkhtj.getB10002());
				dataCellF.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellG = dataRow.createCell(++dateCellIndex);
				dataCellG.setCellValue(sqkhtj.getB10000());
				dataCellG.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellJ = dataRow.createCell(++dateCellIndex);
				dataCellJ.setCellValue(sqkhtj.getB20000());
				dataCellJ.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellK = dataRow.createCell(++dateCellIndex);
				dataCellK.setCellValue(sqkhtj.getB30001());
				dataCellK.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellL = dataRow.createCell(++dateCellIndex);
				dataCellL.setCellValue(sqkhtj.getB30002());
				dataCellL.setCellStyle(styleMap.get("dataStyle"));

				HSSFCell dataCellM = dataRow.createCell(++dateCellIndex);
				dataCellM.setCellValue(sqkhtj.getB30000());
				dataCellM.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellN = dataRow.createCell(++dateCellIndex);
				dataCellN.setCellValue(sqkhtj.getB40000());
				dataCellN.setCellStyle(styleMap.get("dataStyle"));
				
				HSSFCell dataCellO = dataRow.createCell(++dateCellIndex);
				dataCellO.setCellValue(sqkhtj.getB50000());
				dataCellO.setCellStyle(styleMap.get("dataStyle"));
			}
		}
	}
	
	protected Map<String,HSSFCellStyle> getCellStyle(HSSFWorkbook workbook) {
		Map<String,HSSFCellStyle> styleMap = new HashMap<String, HSSFCellStyle>();
		
		//标题样式
		HSSFCellStyle titleStyle = workbook.createCellStyle();
		HSSFFont titleFont = workbook.createFont();
		
		titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		titleStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		titleStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		titleStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		titleStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		titleStyle.setWrapText(true);
		titleFont.setFontName("宋体");
		titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		titleFont.setFontHeightInPoints((short)20);
		titleStyle.setFont(titleFont);
		
		//表头样式
		HSSFCellStyle tableHeadStyle = workbook.createCellStyle();
		HSSFFont tableHeadFont = workbook.createFont();
		
		tableHeadStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		tableHeadStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		tableHeadStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		tableHeadStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		tableHeadStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		tableHeadStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		tableHeadStyle.setWrapText(true);
		tableHeadFont.setFontName("宋体");
		tableHeadFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		tableHeadFont.setFontHeightInPoints((short)10);
		tableHeadStyle.setFont(tableHeadFont);
		
		//说明样式
		HSSFCellStyle msStyle = workbook.createCellStyle();
		HSSFFont msFont = workbook.createFont();
		
		msStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		msStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		msStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		msStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		msStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		msStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		msFont.setFontName("宋体");
		msFont.setFontHeightInPoints((short)10);
		msStyle.setFont(msFont);
		
		//提示样式
		HSSFCellStyle tipStyle = workbook.createCellStyle();
		HSSFFont tipFont = workbook.createFont();
		
		tipStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		tipStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		tipStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		tipStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		tipStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		tipStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		tipFont.setFontName("宋体");
		tipFont.setFontHeightInPoints((short)10);
		tipFont.setColor(HSSFColor.RED.index);
		tipStyle.setFont(tipFont);
		
		//数据样式
		HSSFCellStyle dataStyle = workbook.createCellStyle();
		dataStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		
		styleMap.put("titleStyle", titleStyle);
		styleMap.put("tableHeadStyle", tableHeadStyle);
		styleMap.put("msStyle", msStyle);
		styleMap.put("tipStyle", tipStyle);
		styleMap.put("dataStyle", dataStyle);
		
		return styleMap;
	}

	@Override
	public PageResultInfo<SjcjslBean> querySjcjList(QueryBean bean,
			PageInfo pageInfo) {
		try {
			return dao.querySjcjList(bean, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public HSSFWorkbook downloadCjsl(HSSFWorkbook workbook, KhkpQueryBean bean)
			throws Exception {
		HSSFSheet sheet = workbook.createSheet();
		createCjsjReport(sheet, getCellStyle(workbook), bean);
		return workbook;
	}
	
	/**
	 * 查询所有的数据采集
	 * @param bean
	 * @return
	 * @throws SQLException 
	 */
	protected List<SjcjslBean> querySjcjList(KhkpQueryBean bean) throws SQLException{
		return dao.querySjcsslList(bean);
	}
	
	//创建本月数据采集数量报表
	protected void createCjsjReport(HSSFSheet sheet,Map<String,HSSFCellStyle> styleMap,KhkpQueryBean bean) throws Exception {
		if(sheet == null){
			throw new Exception("sheet页为空或者样式为空。");
		}
		
		//生成标题
		HSSFRow row1 = sheet.createRow(0);
		HSSFCell cellA1 = row1.createCell(0);
		cellA1.setCellValue("采集量统计表");
		cellA1.setCellStyle(styleMap.get("titleStyle"));
		sheet.addMergedRegion(new CellRangeAddress(0,1,0,11));
		
		//生成描述
		StringBuffer ms = new StringBuffer();
		if("1".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至10号" + "  ");
		}else if("2".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至20号" + "  ");
		}else if("3".equals(bean.getTjsjfw())){
			ms.append("统计时间：" + bean.getTjsj() + "-01号至月底" + "  ");
		}
		ms.append("制表人：" + loginInfo.getRealname() + "  ");
		ms.append("制表单位：" + loginInfo.getOrgname() + "  ");
		ms.append("制表时间：" + DateTimeHelper.getNowDateStr("yyyy-MM-dd"));
		
		HSSFRow row3 = sheet.createRow(2);
		HSSFCell cellA3 = row3.createCell(0);
		cellA3.setCellValue(ms.toString());
		cellA3.setCellStyle(styleMap.get("msStyle"));
		sheet.addMergedRegion(new CellRangeAddress(2,2,0,11));
		
		HSSFCell cellB3 = row3.createCell(1);
		cellB3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellC3 = row3.createCell(2);
		cellC3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellD3 = row3.createCell(3);
		cellD3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellE3 = row3.createCell(4);
		cellE3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellF3 = row3.createCell(5);
		cellF3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellG3 = row3.createCell(6);
		cellG3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellH3 = row3.createCell(7);
		cellH3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellI3 = row3.createCell(8);
		cellI3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellJ3 = row3.createCell(9);
		cellJ3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellK3 = row3.createCell(10);
		cellK3.setCellStyle(styleMap.get("msStyle"));
		
		HSSFCell cellL3 = row3.createCell(11);
		cellL3.setCellStyle(styleMap.get("msStyle"));
		
		//生成表头
		HSSFRow row4 = sheet.createRow(3);
		HSSFCell cellA4 = row4.createCell(0);
		cellA4.setCellValue("单位名称");
		sheet.setColumnWidth(0, 50*256);
		cellA4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellB4 = row4.createCell(1);
		cellB4.setCellValue("总数");
		cellB4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellC4 = row4.createCell(2);
		cellC4.setCellValue("常住人口");
		cellC4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellD4 = row4.createCell(3);
		cellD4.setCellValue("寄住人口");
		cellD4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellE4 = row4.createCell(4);
		cellE4.setCellValue("流动人口");
		cellE4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellF4 = row4.createCell(5);
		cellF4.setCellValue("流动人口延期");
		cellF4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellG4 = row4.createCell(6);
		cellG4.setCellValue("未落户人口");
		cellG4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellH4 = row4.createCell(7);
		cellH4.setCellValue("地址");
		cellH4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellI4 = row4.createCell(8);
		cellI4.setCellValue("实体");
		cellI4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellJ4 = row4.createCell(9);
		cellJ4.setCellValue("单位");
		cellJ4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellK4 = row4.createCell(10);
		cellK4.setCellValue("从业人员");
		cellK4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		HSSFCell cellL4 = row4.createCell(11);
		cellL4.setCellValue("出租屋 ");
		cellL4.setCellStyle(styleMap.get("tableHeadStyle"));
		
		//生成数据
		try {
			List<SjcjslBean> list = querySjcjList(bean);
			if(list.size() > 0){
				for(int i = 0 ; i < list.size() ; i++){
					if(i == 0){
						SjcjslBean bean0 =  list.get(0);
						bean0.setOrgname("合计");
					}
					
					HSSFRow row = sheet.createRow(i+4);
					HSSFCell cellA = row.createCell(0);
					cellA.setCellValue(list.get(i).getOrgname());
					cellA.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellB = row.createCell(1);
					cellB.setCellValue(list.get(i).getJcsjzs());
					cellB.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellC = row.createCell(2);
					cellC.setCellValue(list.get(i).getCzrkzs());
					cellC.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellD = row.createCell(3);
					cellD.setCellValue(list.get(i).getJzrkzs());
					cellD.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellE = row.createCell(4);
					cellE.setCellValue(list.get(i).getLdrkzs());
					cellE.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellF = row.createCell(5);
					cellF.setCellValue(list.get(i).getLdrkyqs());
					cellF.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellG = row.createCell(6);
					cellG.setCellValue(list.get(i).getWlhrks());
					cellG.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellH = row.createCell(7);
					cellH.setCellValue(list.get(i).getFwxxs());
					cellH.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellI = row.createCell(8);
					cellI.setCellValue(list.get(i).getStxxs());
					cellI.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellJ = row.createCell(9);
					cellJ.setCellValue(list.get(i).getDwxxs());
					cellJ.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellK = row.createCell(10);
					cellK.setCellValue(list.get(i).getCyrys());
					cellK.setCellStyle(styleMap.get("dataStyle"));
					
					HSSFCell cellL = row.createCell(11);
					cellL.setCellValue(list.get(i).getCzfws());
					cellL.setCellStyle(styleMap.get("dataStyle"));
				}
			}else{
				HSSFRow row5 = sheet.createRow(4);
				HSSFCell cell5 = row5.createCell(0);
				cell5.setCellStyle(styleMap.get("tipStyle"));
				sheet.addMergedRegion(new CellRangeAddress(4,4,0,11));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public PageResultInfo<JwtBean> queryJwtBeansPageResult(
			JwtQueryBean queryBean, PageInfo pageInfo) throws Exception
	{
		return dao.queryJwtBeansPageResult(queryBean, pageInfo);
	}
	
	public void saveJwtBean(JwtBean jwtBean) throws Exception
	{
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		jwtBean.setCzdwdm(loginInfo.getOrgcode());
		jwtBean.setCzdwmc(loginInfo.getOrgname());
		jwtBean.setCzrjh(loginInfo.getUsername());
		jwtBean.setCzrxm(loginInfo.getRealname());
		jwtBean.setCzrsfzh(loginInfo.getSfzh());
		jwtBean.setYxx("0"); //有效
		if (ValidateHelper.isEmptyString(jwtBean.getId()))
		{
			
			String xzdm = DictionaryCacheHellper.getSystemParamenterValueByKey("current.xzdm");
			String id =xzdm+CommonDBBaseHelper.getCommonSequence();
			jwtBean.setId(id);
			dao.inserJwtBean(jwtBean);
		}
		else
		{
			dao.updateJwtBean(jwtBean);
		}
	}

	@Override
	public JwtBean queryJwtBeanById(JwtQueryBean queryBean) throws Exception
	{
		return dao.queryJwtBeanById(queryBean);
	}

	@Override
	public void zxhfJwtBean(JwtQueryBean queryBean) throws Exception
	{
		dao.zxhfJwtBean(queryBean);
	}

	@Override
	public String getExistJwtPz(JwtQueryBean queryBean)
	{
		return dao.getExistJwtPz(queryBean);
	}

	@Override
	public PageResultInfo<WtsjtjfxBean> queryWtsjtjfxBeanList(WtsjtjfxQueryBean queryBean, PageInfo pageInfo)
	{
		return dao.queryWtsjtjfxBeanList(queryBean, pageInfo);
	}

	@Override
	public WtsjtjfxpzBean queryWtsjtjfxpzBean(String sjtype)
	{
		return dao.queryWtsjtjfxpzBean(sjtype);
	}
	
	public Map<String,Object> executeQueryWtDataByPzBean(WtsjtjfxpzBean pzBean)
	{
		return dao.executeQueryWtDataByPzBean(pzBean);
	}
	
	public List<WtsjtjfxBean> queryMjDetailInfoList(WtsjtjfxQueryBean queryBean)
	{
		return dao.queryMjDetailInfoList(queryBean);
	}

	@Override
	public PageResultInfo<WtsjtjfxBean> queryWtsjtjfxBakBeanList(
			WtsjtjfxQueryBean queryBean, PageInfo pageInfo)
	{
		return dao.queryWtsjtjfxBakBeanList(queryBean, pageInfo);
	}
	
	public WtsjtjfxBean queryWtsjtjfxBeanByOrgcodeAndTjrq(String orgcode, String tjrq)
	{
		return dao.queryWtsjtjfxBeanByOrgcodeAndTjrq(orgcode, tjrq);
	}

	@Override
    public PageResultInfo<BywclBean> queryBywcltj(KhkpQueryBean bean,
            PageInfo pageinfo) {
		try{
			return dao.queryBywcltj(bean,pageinfo);
		}catch(SQLException e){
			return null;
		}
    }

	@Override
    public List<BywclBean> downlaodBywcltj(KhkpQueryBean bean) {
	    try {
	        return dao.downlaodBywcltj(bean);
        } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
        }
    }
}
