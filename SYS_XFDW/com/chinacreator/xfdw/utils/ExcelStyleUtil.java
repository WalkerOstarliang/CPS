package com.chinacreator.xfdw.utils;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;


@SuppressWarnings("deprecation")
public class ExcelStyleUtil {
	
	public void setSheetTitle(HSSFRow titleRow, HSSFCellStyle style, String[] arrText) {

		for (int i = 0; i < arrText.length; i++) {
			String text = arrText[i];
			HSSFCell cell = titleRow.createCell(i);
			cell.setCellValue(new HSSFRichTextString(text));
			cell.setCellStyle(style);
			titleRow.setHeight((short) 300);
		}
	}
	

	public void addColspanTitle(int START_ROW, HSSFWorkbook book, HSSFSheet sheet, String text,int cols) {
		HSSFRow row = sheet.createRow(START_ROW - 1);
		row.setHeight((short) 300);
		HSSFCell cell = row.createCell(0);
		cell.setCellStyle(cStyleTitle(book));
		cell.setCellValue(new HSSFRichTextString(text));
		CellRangeAddress colspan = new CellRangeAddress(START_ROW - 1, START_ROW - 1, 0, cols);
		sheet.addMergedRegion(colspan);

		for (int i = 0; i <= cols; i++) {
			HSSFCell cell2 = row.getCell(i);
			if (cell2 == null) {
				cell2 = row.createCell(i);
			}
			cell2.setCellStyle(cStyleTitle(book));
			cell2.setCellStyle(cStyleTitle(book));
		}
	}
	
	public void addColspanShuoming(int START_ROW, HSSFWorkbook book, HSSFSheet sheet, String text,int cols) {
		HSSFRow row = sheet.createRow(START_ROW - 1);
		row.setHeight((short) 300);
		HSSFCell cell = row.createCell(0);
		
		HSSFCellStyle style = book.createCellStyle();
		HSSFFont font = book.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//粗体
		style.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		style.setFont(font);
		setSolidBorder(style);//细边框
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//设置背景颜色
        style.setFillForegroundColor(new HSSFColor.GREY_25_PERCENT().getIndex());//灰色
        cell.setCellStyle(style);
        
		cell.setCellValue(new HSSFRichTextString(text));
		CellRangeAddress colspan = new CellRangeAddress(START_ROW - 1, START_ROW - 1, 0, cols);
		sheet.addMergedRegion(colspan);
		for (int i = 0; i <= cols; i++) {
			HSSFCell cell2 = row.getCell(i);
			if (cell2 == null) {
				cell2 = row.createCell(i);
			}
			cell2.setCellStyle(style);
		}
	}
	
	//  居中  细边框  粗体 
 	public HSSFCellStyle cStyleTitle(HSSFWorkbook book){
 		
		HSSFCellStyle style = book.createCellStyle();
		HSSFFont font = book.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//粗体
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//居中
		style.setFont(font);
		setSolidBorder(style);//细边框
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//设置背景颜色
        style.setFillForegroundColor(new HSSFColor.GREY_25_PERCENT().getIndex());//灰色
		return style;
	}
	
 	
 	// 居中 细边框  
 	public HSSFCellStyle cStyleBorderCenter(HSSFWorkbook book){
		HSSFCellStyle style = book.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//居中
		setSolidBorder(style);//细边框
		return style;
 	}
 	
 	
    // 居左 细边框  
 	public HSSFCellStyle cStyleBorderLeft(HSSFWorkbook book){
		HSSFCellStyle style = book.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_LEFT);//居中
		setSolidBorder(style);//细边框
		return style;
 	}
 	
 	// 居右 细边框  
 	public HSSFCellStyle cStyleBorderRight(HSSFWorkbook book){
		HSSFCellStyle style = book.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_RIGHT);//居中
		setSolidBorder(style);//细边框
		return style;
 	}
 	
	//细边框
	public HSSFCellStyle cStyleBorder(HSSFWorkbook book){
		HSSFCellStyle style = book.createCellStyle();
		setSolidBorder(style);//细边框
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		return style;
	}

	
	
	/** private method ******************************************************************************/
	
	
	//设置细边框
	private void setSolidBorder(HSSFCellStyle style){
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
	}
}
