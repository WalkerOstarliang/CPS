package com.chinacreator.xfdw.action;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.exception.CPSException;
import com.chinacreator.common.helper.ExcelImportHelper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.xfdw.bean.XFxxExportBean;
import com.chinacreator.xfdw.service.ImportExcelService;

public class ImportExcelAction extends CPSBaseAction {
	private static final long serialVersionUID = 1L;
 
	private File uploads;
	private ImportExcelService hzglService =new ImportExcelService();
	
	public void importHZExcel(){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<XFxxExportBean> xfxxexportbeans=ExcelImportHelper.readExcelFromClass(XFxxExportBean.class, new FileInputStream(uploads));
			if(ValidateHelper.isNotEmptyCollection(xfxxexportbeans)){
			map=hzglService.insertXfxx(xfxxexportbeans);
			}
		} catch (Exception e) {
			e.printStackTrace();
			if (e instanceof CPSException)
			{
				map.put("error", e.getMessage());
			}else{
				map.put("error", "系统导入时发生错误");
			}
		}
		responseWrite(map);
	}

	public File getUploads() {
		return uploads;
	}

	public void setUploads(File uploads) {
		this.uploads = uploads;
	}

	
}
