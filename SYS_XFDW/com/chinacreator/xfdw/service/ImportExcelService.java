package com.chinacreator.xfdw.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.chinacreator.xfdw.bean.XFxxExportBean;
import com.chinacreator.xfdw.dao.ImportDao;

public class ImportExcelService {
	
	private Logger logger = Logger.getLogger(ImportExcelService.class);
	private ImportDao hzglDao = new ImportDao();
	public Map<String, Object> insertXfxx(List<XFxxExportBean> xfxxexportbeans){
		Map<String, Object> map=new HashMap<String, Object>();
		int insert=0;
		int error =0;
		for(XFxxExportBean bean:xfxxexportbeans){
			try {
				hzglDao.insert(bean);
				insert++;
			} catch (Exception e) {
				error++;
				logger.debug(e.getCause());
//				e.printStackTrace();
			}
		}
		map.put("insert", insert);
		map.put("fail", error);
		return map;
	}
	
	
	
	
	
	
	
}
