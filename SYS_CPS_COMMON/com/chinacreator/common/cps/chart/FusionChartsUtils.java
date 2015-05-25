package com.chinacreator.common.cps.chart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class FusionChartsUtils {
	public static String creatSingleCharts(List<Charts> list){
		return creatSingleCharts(list,getChartCfgMap());
	}
	
	public static String creatSingleCharts(List<Charts> list,Map<String,String> chartcfg){
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("graph");
		if(null == chartcfg || 0>=chartcfg.size()){
			chartcfg = getChartCfgMap();
		}
		if (null!=chartcfg){
			for (int j=0;j<chartcfg.size();j++){
				String tmpkey=(String)chartcfg.keySet().toArray()[j];
				String tmpValue=(String)chartcfg.get(tmpkey);
				root.addAttribute(tmpkey, tmpValue);
			}
		}
		for(Charts charts : list){
			Element set = root.addElement("set");
			set.addAttribute("name",charts.getTitle());
			set.addAttribute("value",charts.getData().toString());
			if(charts.getLink() != null && charts.getLink().length()>=0){
				set.addAttribute("link", charts.getLink());
			}
			if(null != charts.getStyle()){
				Map<String,String> style = charts.getStyle();
				Iterator<String> keys = style.keySet().iterator();
				while(keys.hasNext()){
					String key = keys.next();
					set.addAttribute(key,style.get(key));
				}
			}
			if(null == set.attribute("color")){
				set.addAttribute("color",randomBgColor());
			}
			//set.addAttribute("color",color);
		}
		return document.asXML();
	}
	public static String creatMutilCharts(List<Charts> list,Map<String,String> chartcfg){
		Document document = DocumentHelper.createDocument();
		document.setXMLEncoding("gbk");
		Element root = document.addElement("graph");
		if(null == chartcfg || 0<chartcfg.size()){
			chartcfg = getChartCfgMap();
		}
		if (null!=chartcfg){
			for (int j=0;j<chartcfg.size();j++){
				String tmpkey=(String)chartcfg.keySet().toArray()[j];
				String tmpValue=(String)chartcfg.get(tmpkey);
				root.addAttribute(tmpkey, tmpValue);
			}
		}
		Element categorys=root.addElement("categories");
		
		Charts charts = list.get(0);
		Map<String,Object> map = charts.getMutilData();
		Iterator<String> key = map.keySet().iterator();
		while(key.hasNext()){
			Element category=categorys.addElement("category");
			category.addAttribute("name",key.next());
		}
		for(Charts chart : list){	
			Element dataset=root.addElement("dataset");
			dataset.addAttribute("seriesName",chart.getTitle());
			if(null != charts.getStyle()){
				Map<String,String> style = charts.getStyle();
				Iterator<String> keys = style.keySet().iterator();
				while(keys.hasNext()){
					String key_ = keys.next();
					dataset.addAttribute(key_,style.get(key_));
				}
			}
			if(null == dataset.attribute("color")){
				dataset.addAttribute("color",randomBgColor());
			}
			dataset.addAttribute("color",randomBgColor());
			dataset.addAttribute("showValues","1");
			Map<String,Object> map_ = chart.getMutilData();
			Iterator<String> key_ = map_.keySet().iterator();
			while(key_.hasNext()){
				Element tmpset=dataset.addElement("set");
				tmpset.addAttribute("value",map_.get(key_.next()).toString());
			}
		}
		return document.asXML();
	}
	public static String creatMutilCharts(List<Charts> list){
		
		return creatMutilCharts(list,null);
	}
	public static List<String> getChartColor(){
		List<String> colors = new ArrayList<String>();
		
		colors.add("FF8C00");
		colors.add("9400D3");
		colors.add("0000FF");
		colors.add("B22222");
		colors.add("4B0082");
		colors.add("FF1493");
		colors.add("7FFFD4");
		colors.add("00BFFF");
		colors.add("00FFFF");
		return colors;
	}
	public static Map<String,String> getChartCfgMap(){
		Map<String,String> chartConfigmap=new HashMap<String,String>();  
		chartConfigmap.put("baseFont","宋体");
		chartConfigmap.put("baseFontSize","12");
		chartConfigmap.put("bgColor","FAFCFC");
		chartConfigmap.put("forceDecimals","0");
		chartConfigmap.put("decimals","2");
		chartConfigmap.put("canvasBgColor","FFFFFF");
		chartConfigmap.put("canvasBaseColor","E8ECED");
		chartConfigmap.put("divlinecolor","E0370C");
		chartConfigmap.put("canvasBorderColor","8B7859");	
		chartConfigmap.put("canvasBorderThickness","1");
		chartConfigmap.put("showLabels","1");
		chartConfigmap.put("animation","0");	
		chartConfigmap.put("showValues","1");
		chartConfigmap.put("showLegend","1");
		chartConfigmap.put("showDivLineValue","1");
		chartConfigmap.put("showYAxisValues","1");
		chartConfigmap.put("showLegend","1");
		chartConfigmap.put("showCanvasBg","1");
		chartConfigmap.put("showCanvasBase","1");
		chartConfigmap.put("showLimits","1");	 
		chartConfigmap.put("maxColWidth","40");
		chartConfigmap.put("areaOverColumns","0");
		chartConfigmap.put("formatNumberScale", "0");
		chartConfigmap.put("decimalPrecision", "0");
		
		return chartConfigmap; 
	}
	private static int randomNumber(){    
		return (int)Math.floor(Math.random()*256);    
	}
	private static String decToHex(int dec){    
		String hexStr = "0123456789ABCDEF";    
		int low = Math.abs(dec % 16);    
		int high = Math.abs((dec - low)/16);    
		String hex = "" + (hexStr.length()>high?hexStr.charAt(high):hexStr.charAt(0)) + (hexStr.length()>low?hexStr.charAt(low):hexStr.charAt(10));    
		return hex;    
	}
	private static String randomBgColor(){    
		String r,g,b;    
		r = decToHex(randomNumber()-1);    
		g = decToHex(randomNumber()-1);    
		b = decToHex(randomNumber()-1);    
		return r + g + b;    
	} 
}
