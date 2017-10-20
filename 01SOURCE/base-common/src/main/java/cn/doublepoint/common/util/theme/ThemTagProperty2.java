/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.util.theme;

public class ThemTagProperty2 {
	public static String ajaxgridRowHeight = "30";
	  public static String freeformRowHeight = "30";
	  public static String buttonCssClass = "assist_normal";
	  public static String regionTitleHeight = "30";
	  public static String fillAreaTitleHeight = "30";
	  public static String titleImgClass = "titletipsimg";
	  public static String titleCollapseClass = "title-collapse-img";
	  public static String titleExpandClass = "title-expand-img";
	  
	  public static String getPropertiesValue(String propertyName)
	  {
	    String propertyValue = "";
	    if (propertyName.equals("ajaxgridRowHeight")) {
	      propertyValue = ajaxgridRowHeight;
	    } else if (propertyName.equals("freeformRowHeight")) {
	      propertyValue = freeformRowHeight;
	    } else if (propertyName.equals("buttonCssClass")) {
	      propertyValue = buttonCssClass;
	    } else if (propertyName.equals("regionTitleHeight")) {
	      propertyValue = regionTitleHeight;
	    } else if (propertyName.equals("fillAreaTitleHeight")) {
	      propertyValue = fillAreaTitleHeight;
	    } else if (propertyName.equals("titleImgClass")) {
	      propertyValue = titleImgClass;
	    } else if (propertyName.equals("titleCollapseClass")) {
	      propertyValue = titleCollapseClass;
	    } else if (propertyName.equals("titleExpandClass")) {
	      propertyValue = titleExpandClass;
	    }
	    return propertyValue;
	  }
}
