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

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.sys.Sequence;
import cn.doublepoint.common.domain.model.entity.sys.Worksheet;
import cn.doublepoint.common.port.adapter.template.persistence.sys.worksheet.WorksheetService;
import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.ApplicationContextUtil;

public class WorksheetUtil {
	
	/**
	 * 创建工作单,并启动工作单，即启动流程
	 * @param worksheetType
	 * @param userId
	 * @param remak
	 * @return
	 */
	public static String create(String worksheetType,String userId,String remak){
		WorksheetService worksheetService=getWorksheetService();
		Worksheet newWroksheet=new Worksheet();
		newWroksheet.setWorksheetNo(generateWorksheetNo());
		
		String worksheetNo="";
		return worksheetNo;
	}
	
	/**
	 * 传递工作单
	 * @param worksheetNo
	 * @return
	 */
	public static String transmit(String worksheetNo){
		return worksheetNo;
	}
	
	/**
	 * 回退工作单
	 * @param worksheetType
	 * @return
	 */
	public static String back(String worksheetNo){
		return worksheetNo;
	}
	
	/**
	 * 作废工作单
	 * @param worksheetType
	 * @return
	 */
	public static String abolish(String worksheetNo){
		return worksheetNo;
	}
	
	/**
	 * 挂起工作单
	 * @param worksheetType
	 * @return
	 */
	public static String suspend(String worksheetNo){
		return worksheetNo;
	}
	
	/**
	 * 工作单挂起之后若需要激活，调用此方法
	 * @param worksheetType
	 * @return
	 */
	public static String active(String worksheetType){
		String worksheetNo="";
		return worksheetNo;
	}
	
	private static WorksheetService getWorksheetService(){
		return (WorksheetService)ApplicationContextUtil.getBean("llWorksheetService");
	}
	
	private static String generateWorksheetNo(){
		return SequenceUtil.getNextVal("ll.workflow.worksheetNo").toString();
	}
}
