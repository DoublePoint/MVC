/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月29日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.commonutil;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {
	
	/**
	 * //获取当前日期时间 格式为yyyy-MM-dd HH:mm:SS
	 * @return
	 */
	public static String getCurrentDateTimeString(){
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		return formatter.format(date);
	}
	
	/**
	 * //获取当前日期时间 格式为yyyy-MM-dd
	 * @return
	 */
	public static String getCurrentDateString(){
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		return formatter.format(date);
	}
	
	/**
	 * //获取当前日期时间 格式为yyyy-MM-dd
	 * @return
	 */
	public static Date getCurrentDate(){
		return new Date();
	}
	
	
}
