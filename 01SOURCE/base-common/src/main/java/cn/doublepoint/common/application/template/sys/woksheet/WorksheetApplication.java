/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.application.template.sys.woksheet;

import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class WorksheetApplication {
	
	/**
	 * 创建工作单,并启动工作单，即启动流程
	 * @param worksheetType
	 * @param userId
	 * @param remak
	 * @return
	 */
	public String create(String worksheetType,String userId,String remak){
		String worksheetNo="";
		return worksheetNo;
	}
	
	/**
	 * 传递工作单
	 * @param worksheetNo
	 * @return
	 */
	public String transmit(String worksheetNo){
		return worksheetNo;
	}
	
	/**
	 * 回退工作单
	 * @param worksheetType
	 * @return
	 */
	public String back(String worksheetNo){
		return worksheetNo;
	}
	
	/**
	 * 作废工作单
	 * @param worksheetType
	 * @return
	 */
	public String abolish(String worksheetNo){
		return worksheetNo;
	}
	
	/**
	 * 挂起工作单
	 * @param worksheetType
	 * @return
	 */
	public String suspend(String worksheetNo){
		return worksheetNo;
	}
	
	/**
	 * 工作单挂起之后若需要激活，调用此方法
	 * @param worksheetType
	 * @return
	 */
	public String active(String worksheetType){
		String worksheetNo="";
		return worksheetNo;
	}
	
	
}
