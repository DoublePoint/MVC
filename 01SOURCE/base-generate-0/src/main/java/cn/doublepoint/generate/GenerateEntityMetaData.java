/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月19日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.generate;

import java.util.HashMap;
import java.util.Map;

public class GenerateEntityMetaData {
	
	private static Map<String, String> fieldTypeMap=new HashMap<String,String>();
	
	private static Map<String, String> oomNodeTypeMap=new HashMap<String,String>();
	
	/**
	 * 获取字段类型映射
	 * @return
	 */
	public static Map<String,String> getFieldTypeMap(){
		if(fieldTypeMap.keySet().size()>=0){
			fieldTypeMap.put("String", "String");
		}
		return fieldTypeMap;
	}
	
//	public static Map<String, String> getOomNodeTypeMap(){
//		if(oomNodeTypeMap.keySet().size()>=0){
//			oomNodeTypeMap.put("String", "String");
//			oomNodeTypeMap.put("String", "String");
//			oomNodeTypeMap.put("String", "String");
//			oomNodeTypeMap.put("String", "String");
//			oomNodeTypeMap.put("String", "String");
//			oomNodeTypeMap.put("String", "String");
//		}
//		return oomNodeTypeMap;
//	}
}
