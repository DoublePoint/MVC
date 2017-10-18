/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月18日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.taglib.menu;

public class Menu {
	private static final long serialVersionUID = 8141423082371605145L;
	private int serial=0;
	private boolean rightFilter=true;
	private String direction = "h";
	private String extendedItem="extendedItem";
	private String source="source";
	private String targetFrame = "mainFrame";
	private String rootCode = "0";
	private String type = "type";
	private String colortype = "blue";
	private boolean rootVisible=true;
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public boolean isRightFilter() {
		return rightFilter;
	}
	public void setRightFilter(boolean rightFilter) {
		this.rightFilter = rightFilter;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getExtendedItem() {
		return extendedItem;
	}
	public void setExtendedItem(String extendedItem) {
		this.extendedItem = extendedItem;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getTargetFrame() {
		return targetFrame;
	}
	public void setTargetFrame(String targetFrame) {
		this.targetFrame = targetFrame;
	}
	public String getRootCode() {
		return rootCode;
	}
	public void setRootCode(String rootCode) {
		this.rootCode = rootCode;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getColortype() {
		return colortype;
	}
	public void setColortype(String colortype) {
		this.colortype = colortype;
	}
	public boolean isRootVisible() {
		return rootVisible;
	}
	public void setRootVisible(boolean rootVisible) {
		this.rootVisible = rootVisible;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
