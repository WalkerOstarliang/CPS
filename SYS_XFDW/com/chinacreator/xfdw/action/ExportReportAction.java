package com.chinacreator.xfdw.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

import com.chinacreator.common.action.BaseAction;
import com.chinacreator.common.helper.PropertiesUtil;
import com.chinacreator.xfdw.utils.ExcelStyleUtil;
import com.chinacreator.xfdw.utils.UtilTools;
import com.googlecode.jsonplugin.JSONUtil;

/**
 *
 * @ClassName: ExportReportAction
 * @author wenchao.yu
 * @mail yuwenchao28@163.com
 * @date Dec 11, 201311:16:38 AM
 * @Description: TODO (用一句话描述这个类的作用)
 * 报表数据导出
 *
 */

public class ExportReportAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(ExportReportAction.class);
	private final int START_ROW = 1;// 从第几行开始 x
	//private final int MAX_ROW = 50000;
	private ExcelStyleUtil styleUtil = new ExcelStyleUtil();
	
	public void export(){
		String exportData = this.getRequest().getParameter("exportData");
		String filePath = writeExcel(exportData);
		String[] args = filePath.split("&");
		File file = new File(args[0]);
		UtilTools.downloadFile(args[1], file, this.getResponse());
	}
	
	@SuppressWarnings("unchecked")
	protected String writeExcel(String exportData){
		String filePath = "";
		String fileName = "";
		OutputStream os = null;
		try {
			Map obj = (Map)JSONUtil.deserialize(exportData);
			
			String title = obj.get("title").toString();
			String shuoming = obj.get("shuoming").toString();
			
			Map table = (Map)obj.get("table");
			
			List thead = (List)table.get("thead");
			//List tfoot = (List)table.get("tfoot");
			List tbody = (List)table.get("tbody");
			
			//获取文件保存路径
//			String path = request.getSession().getServletContext().getRealPath("") + File.separator;
//			fileName = title + ".xls";
//			filePath = path + PropertiesUtil.getValue("export.path") + new Date().getTime()+".xls";
			
			fileName = title + ".xls";
			filePath = PropertiesUtil.getValue("export.path") + new Date().getTime()+".xls";
			
			File file =  new File(filePath);
			
			//判断文件是否存在，不存在即创建,以报表标题为文件名
			if(!file.isFile()){
				file.createNewFile();
			}
			os = new FileOutputStream(file);
			
			HSSFWorkbook book = new HSSFWorkbook(); 
			HSSFSheet sheetGrphb = book.createSheet(title);
			
			//获取报表标题跨列colspan数
			int titleColspan = getAllColCount(thead);
			
			//报表标题
			styleUtil.addColspanTitle(START_ROW, book, sheetGrphb, title, titleColspan);
			styleUtil.addColspanShuoming(2, book, sheetGrphb, shuoming, titleColspan);
			
			//报表表头
			int firstRow = 2;
			
			//循环表头行
			for(int i=0; i<thead.size(); i++){
				Map rowThead = (Map)thead.get(i);
				List colThead = (List)rowThead.get("tr");
				
				HSSFRow row = sheetGrphb.getRow(i + 2);
				if(row == null){
					row = sheetGrphb.createRow(i + 2);
				}
				
				firstRow = 2 + i;
				int firstCol = 0;
				for(int j=0; j<colThead.size(); j++){
					Map th = (Map)colThead.get(j);
					String text = th.get("text").toString();
					
					int cols = Integer.parseInt(th.get("colspan").toString());
					int rows = Integer.parseInt(th.get("rowspan").toString());
					
					//判断该单元格是否被合并单元格占用
					for(int k=0; k<255; k++){
						if(this.isMergedRegion(sheetGrphb, firstRow, firstCol)){
							HSSFCell cell3 = sheetGrphb.getRow(firstRow).createCell(firstCol);
							cell3.setCellStyle(styleUtil.cStyleTitle(book));
							firstCol ++ ;
						}else{
							break;
						}
					}
					//合并单元格
					CellRangeAddress cellRange = new CellRangeAddress(firstRow, (firstRow + rows-1), firstCol, (firstCol + cols-1));
					sheetGrphb.addMergedRegion(cellRange);
					
					//合并单元格边框
					for(int k=1;k<rows+1;k++){
						HSSFRow row_m = sheetGrphb.getRow(firstRow+k-1);
						if(row_m == null){
							row_m = sheetGrphb.createRow(firstRow+k-1);
						}
						for(int m=1;m<cols+1;m++){
							HSSFCell cell11 = row_m.createCell(firstCol + m-1);
							cell11.setCellStyle(styleUtil.cStyleTitle(book));
						}
					}
					
					//合并单元格边框
					HSSFCell cell1 = row.createCell(firstCol);
					cell1.setCellStyle(styleUtil.cStyleTitle(book));
					cell1.setCellValue(new HSSFRichTextString(text));
					firstCol = firstCol + cols;
				}
			}
			
			
			//报表数据
			//将数据写入Excel
			
			//循环表头行
			for(int i=0; i<tbody.size(); i++){
				Map rowThead = (Map)tbody.get(i);
				List colThead = (List)rowThead.get("tr");
				
				int rowIndex = firstRow + 1 + i;
				
				HSSFRow row = sheetGrphb.getRow(rowIndex);
				if(row == null){
					row = sheetGrphb.createRow(rowIndex);
				}
				
				int firstCol = 0;
				for(int j=0; j<colThead.size(); j++){
					Map th = (Map)colThead.get(j);
					String text = th.get("text").toString();
					
					int cols = Integer.parseInt(th.get("colspan").toString());
					int rows = Integer.parseInt(th.get("rowspan").toString());
					
					//判断该单元格是否被合并单元格占用
					for(int k=0; k<255; k++){
						if(this.isMergedRegion(sheetGrphb, rowIndex, firstCol)){
							HSSFCell cell3 = sheetGrphb.getRow(rowIndex).createCell(firstCol);
							cell3.setCellStyle(styleUtil.cStyleTitle(book));
							firstCol ++ ;
						}else{
							break;
						}
					}
					
					
					for(int k=1;k<rows+1;k++){
						HSSFRow row_m = sheetGrphb.getRow(rowIndex+k-1);
						if(row_m == null){
							row_m = sheetGrphb.createRow(rowIndex+k-1);
						}
						for(int m=1;m<cols+1;m++){
							HSSFCell cell11 = row_m.createCell(firstCol + m-1);
							cell11.setCellStyle(styleUtil.cStyleBorder(book));
						}
					}
					
					//合并单元格
					if(cols != 1 || rows != 1){
						CellRangeAddress cellRange = new CellRangeAddress(rowIndex, (rowIndex + rows-1), firstCol, (firstCol + cols-1));
						sheetGrphb.addMergedRegion(cellRange);	
					}
					HSSFCell cell1 = row.createCell(firstCol);
					cell1.setCellStyle(styleUtil.cStyleBorder(book));
					if(this.isNumber(text) && !"".equals(text)){
						int _text = Integer.parseInt(text); 
						cell1.setCellValue(_text);
					}else{
						cell1.setCellValue(new HSSFRichTextString(text));
					}
					firstCol = firstCol + cols;
				}
			}
			//记录每一列里的最大长度数，用来设置宽度
//			for(int i=0; i<tbody.size(); i++){
//				Map tr = (Map)tbody.get(i);
//				HSSFRow row = sheetGrphb.createRow(i + 1 + firstRow);
//				//Excel文件中写入数据超过限定的最大行数，退出处理
//				if(i >= MAX_ROW){
//					HSSFCell cell1 = row.createCell(0);
//					cell1.setCellStyle(styleUtil.cStyleBorderCenter(book));
//					cell1.setCellValue(new HSSFRichTextString("导出数据量过大，后面的数据将不再写入Excel文件中，请分批导出!"));
//					break;
//				}
//				logger.info("tfoot for start:" + tfoot.size());
				
				
				
//				for(int j=0; j<tfoot.size(); j++){
//					
//					Map cellKey = (Map)tfoot.get(j);
//					//200服务器上面加上下面语句无法将数据写入Excel文件中
//					//sheetGrphb.autoSizeColumn(j, true);
//					HSSFCell cell1 = row.createCell(j);
//					
//					String text = tr.get(cellKey.get("id")).toString();
//					if(cellKey.get("id").equals("dwmc")){
//						cell1.setCellStyle(styleUtil.cStyleBorder(book));
//						cell1.setCellValue(new HSSFRichTextString(text));
//					}else{
//						cell1.setCellStyle(styleUtil.cStyleBorder(book));
//						if(text.contains(",")){
//							text = text.replaceAll(",","");
//						}
//						if(text.matches("[0-9]+[\\.]?[0-9]*")){
//							double val = Double.parseDouble(text);
//							cell1.setCellValue(val);
//						}else{
//							cell1.setCellValue(new HSSFRichTextString(text));
//						}
//					}
//				}
//			}
//			
//			for(int i=0;i<tfoot.size();i++){
//				HSSFRow rowsa = sheetGrphb.getRow(thead.size());
//				HSSFCell cell = rowsa.getCell(i);
//				int max = getCellLength(cell);
//				
//				for(int j=thead.size()+1;j<tbody.size()+1;j++){
//					HSSFRow rowss = sheetGrphb.getRow(j);
//					HSSFCell cell1 = rowss.getCell(i);
//					int len = getCellLength(cell1);
//					if(this.isMergedRegion(sheetGrphb, j, i)){
//						len = this.getMergedRegionVal(sheetGrphb, j, i).getBytes().length;
//					}
//					if(len>max){
//						max = len;
//					}
//				}
//				sheetGrphb.setColumnWidth(i, (max+2)*256);
//			}
			
			book.write(os);
			os.flush();
			os.close();
			
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			if(os != null) {
				try {
					os.flush();
					os.close();
				} catch (Exception e1) {
					logger.error(e1.getMessage(), e1);
				}
			}
		}
		return filePath + "&" + fileName;
	}
	/**
	 * 判断字符串是否为数字
	 * @param str
	 * @return
	 */
	@SuppressWarnings("unused")
	private boolean isNumber(String str){
		Pattern pattern =Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if(!isNum.matches()){
			return false;
		};
		try{
			int _str = Integer.parseInt(str);
			return true;
		}catch(Exception e){
			//e.printStackTrace();
			return false;
		}
		
	}
	/**
	 * 获取所有列数量
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private int getAllColCount(List thead){
		Map firstRowTheadMap = (Map)thead.get(0);
		List firstRowTheadList = (List)firstRowTheadMap.get("tr");
		int colCount = 0;
		for(int i=0; i<firstRowTheadList.size(); i++){
			Map<String, String> colMap = (HashMap<String, String>)firstRowTheadList.get(i);
			colCount += Integer.parseInt(colMap.get("colspan")); 
		}
		colCount = colCount-1;
		return colCount;
	}
	
	public static int getCellLength(HSSFCell cell){
		int max = 0;
		if(HSSFCell.CELL_TYPE_NUMERIC==cell.getCellType()){
			max = (cell.getNumericCellValue()+"").getBytes().length;
		}else if(HSSFCell.CELL_TYPE_STRING==cell.getCellType()){
			max = cell.getStringCellValue().getBytes().length;
		}
		return max;
	}
	
	public static String getCellValue(HSSFCell cell){
		String val = "";
		if(HSSFCell.CELL_TYPE_NUMERIC==cell.getCellType()){
			val = cell.getNumericCellValue()+"";
		}else if(HSSFCell.CELL_TYPE_STRING==cell.getCellType()){
			val = cell.getStringCellValue();
		}
		return val;
	}
	
	/**
	 * 判断单元格是否被合并单元格占用
	 * @param sheet
	 * @param row
	 * @param col
	 * @return
	 */
	public boolean isMergedRegion(HSSFSheet sheet, int row, int col){
		int SheetMergeCount = sheet.getNumMergedRegions();
		
		for(int i=0; i<SheetMergeCount; i++){
			CellRangeAddress cra = sheet.getMergedRegion(i);
			int firstCol = cra.getFirstColumn();
			int lastCol = cra.getLastColumn();
			int firstRow = cra.getFirstRow();
			int lastRow = cra.getLastRow();
			
			if(row >= firstRow && row <= lastRow){
				if(col >= firstCol && col <= lastCol){
					return true;
				}
			}
		}
		return false;
	}
	
	public String getMergedRegionVal(HSSFSheet sheet, int row, int col){
		int SheetMergeCount = sheet.getNumMergedRegions();
		
		for(int i=0; i<SheetMergeCount; i++){
			CellRangeAddress cra = sheet.getMergedRegion(i);
			int firstCol = cra.getFirstColumn();
			int lastCol = cra.getLastColumn();
			int firstRow = cra.getFirstRow();
			int lastRow = cra.getLastRow();
			
			if(row >= firstRow && row <= lastRow){
				if(col >= firstCol && col <= lastCol){
					HSSFRow row1 = sheet.getRow(firstRow);
					HSSFCell cell1 = row1.getCell(firstCol);
					return getCellValue(cell1);
				}
			}
		}
		return "";
	}

}
