/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月20日
* 
* 类   说   明 ：统一操作类
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

public class CommonUtils {
	/**
	 * 获取数据库时间
	 * @return
	 */
	public static Timestamp getDate() {
		java.sql.Date dt = new java.sql.Date(System.currentTimeMillis());
		dt = java.sql.Date.valueOf(dt.toString());
		return new Timestamp(dt.getTime());
	}

	public static Timestamp getDateTime() {
		long current = System.currentTimeMillis();
		current -= current % 1000L;
		return new Timestamp(current);
	}

	public static String getChineseDate() {
		return DateFormat.getDateInstance(1, Locale.CHINA).format(new java.sql.Date(System.currentTimeMillis()));
	}

	public static String getChineseDate(java.sql.Date date) {
		return DateFormat.getDateInstance(1, Locale.CHINA).format(date);
	}

	public static String getChineseDateTime() {
		return DateFormat.getDateTimeInstance(1, 1, Locale.CHINA).format(new java.sql.Date(System.currentTimeMillis()));
	}

	public static String getChineseDateTime(java.sql.Date date) {
		return DateFormat.getDateTimeInstance(1, 1, Locale.CHINA).format(date);
	}

	public static Timestamp addYear(Timestamp val, int num) {
		return calendarAdd(val, 1, num);
	}

	public static Timestamp addMonth(Timestamp val, int num) {
		return calendarAdd(val, 2, num);
	}

	public static Timestamp addDay(Timestamp val, int num) {
		return calendarAdd(val, 5, num);
	}

	public static int getDaysOffset(java.sql.Date date1, java.sql.Date date2) {
		long time1 = date1.getTime();
		long time2 = date2.getTime();
		long oneDayTimes = 86400000L;
		time1 -= time1 % oneDayTimes;
		time2 -= time2 % oneDayTimes;
		long offset = time2 - time1;
		return Integer.parseInt(String.valueOf(offset / oneDayTimes));
	}

	/**
	 * 日期操作
	 * @param 需要操作的日期
	 * @param 操作字段类型 年月日时分秒
	 * @param 操作数字
	 * @return
	 */
	private static Timestamp calendarAdd(Timestamp val, int field, int num) {
		if (val == null) {
			return val;
		}
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(val);
		calendar.add(field, num);
		return new Timestamp(calendar.getTime().getTime());
	}

	
	public static double add(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.add(b2).doubleValue();
	}

	public static double sub(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.subtract(b2).doubleValue();
	}

	public static double mul(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.multiply(b2).doubleValue();
	}

	public static double div(double v1, double v2) {
		return div(v1, v2, 10);
	}

	public static double div(double v1, double v2, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException("The scale must be a positive integer or zero");
		}
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.divide(b2, scale, 4).doubleValue();
	}

	public static double round(double v, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException("The scale must be a positive integer or zero");
		}
		BigDecimal b = new BigDecimal(Double.toString(v));
		BigDecimal one = new BigDecimal("1");
		return b.divide(one, scale, 4).doubleValue();
	}

	public static String ltrim(String val) {
		if (val == null) {
			return val;
		}
		int len = val.length();
		int start = 0;
		while ((start < len) && (val.charAt(start) <= ' ')) {
			start++;
		}
		return start > 0 ? val.substring(start, len) : val;
	}

	public static String rtrim(String val) {
		if (val == null) {
			return val;
		}
		int len = val.length();
		int end = len;
		while ((end > 0) && (val.charAt(end - 1) <= ' ')) {
			end--;
		}
		return end < len ? val.substring(0, end) : val;
	}

	public static String charFormat(String charValue, int len) {
		if (charValue == null) {
			return null;
		}
		charValue = rtrim(charValue);
		StringBuilder buffer = new StringBuilder(charValue);
		int charLen = charValue.length();
		for (int i = 0; i < len - charLen; i++) {
			buffer.append(" ");
		}
		return buffer.toString();
	}

	public static String charZeroFormat(String charValue, int len) {
		if (charValue == null) {
			return null;
		}
		StringBuilder buffer = new StringBuilder("");
		int charLen = charValue.length();
		for (int i = 0; i < len - charLen; i++) {
			buffer.append("0");
		}
		buffer.append(charValue);
		return buffer.toString();
	}

	public static Timestamp getUnlimitedDate() {
		Calendar cal = Calendar.getInstance();
		cal.set(1, 9999);
		cal.set(2, 11);
		cal.set(5, 31);

		java.sql.Date dt = new java.sql.Date(cal.getTimeInMillis());
		dt = java.sql.Date.valueOf(dt.toString());
		return new Timestamp(dt.getTime());
	}

	public static Timestamp truncTsToDay(Timestamp ts) {
		if (ts == null) {
			return null;
		}
		java.sql.Date dt = new java.sql.Date(ts.getTime());
		dt = java.sql.Date.valueOf(dt.toString());
		return new Timestamp(dt.getTime());
	}

	public static Timestamp getTimeMillis() {
		long current = System.currentTimeMillis();
		return new Timestamp(current);
	}
}
