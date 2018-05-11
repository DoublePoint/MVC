/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月25日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.domain.model;

import java.io.Serializable;

public class BaseModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public int rowId=-1;

	public int getRowId() {
		return rowId;
	}

	public void setRowId(int rowId) {
		this.rowId = rowId;
	}
	
}
