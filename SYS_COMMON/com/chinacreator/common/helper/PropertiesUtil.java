package com.chinacreator.common.helper;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class PropertiesUtil { 
		private static  Properties properties;
		private static Map<String,String> objectcodeMap = new HashMap<String,String>();
		public static Map<String,String> datesourceMap = new HashMap<String,String>();
		static {
			try{
				InputStream in = PropertiesUtil.class.getResourceAsStream("/cps_config.properties");
				properties = new Properties();
				properties.load(in);
				
				String value = properties.getProperty("dataobjectcode.mapping");
				if(value != null && !"".equals(value)){
					String[] valuearr = value.split(",");
					for(int i=0;i<valuearr.length;i++){
						String[] varr = valuearr[i].split(":");
						objectcodeMap.put(varr[0], varr[1]);
					}
				}
				String datasource = properties.getProperty("datasource");
				if(datasource != null){
					String[] ds = datasource.split(",");
					for(int i=0;i<ds.length;i++){
						String datacode = properties.getProperty("dbname."+ds[i]);
						if(datacode != null){
							String[] dcs = datacode.split(",");
							for(int j=0;j<dcs.length;j++){
								datesourceMap.put(dcs[j], ds[i]);
							}
						}
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		public static Properties getProperties(){
			return properties;
		}
		
		/**
		 *
		 * @param key
		 * @return
		 */
		public static String getValue(String key){
			return properties.getProperty(key);
		}
		
		public static String getResource(String key,String[] args){
			String value = properties.getProperty(key);
			if(value!= null && !value.equals("") && args != null && args.length>0){
				for(int i=0;i<args.length;i++){
					value = value.trim().replace("{"+i+"}", args[i]);
				}
			}
			return value;
		}
		
}
