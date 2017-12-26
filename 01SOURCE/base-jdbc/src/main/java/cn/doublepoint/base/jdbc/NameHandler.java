/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月25日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.base.jdbc;

public interface NameHandler {

	/**
	 * 根据实体名获取表名
	 *
	 * @param entityName
	 * @return
	 */
	public String getTableName(String entityName);

	/**
	 * 根据表名获取主键名
	 * 
	 * @param entityName
	 * @return
	 */
	public String getPrimaryName(String entityName);

	/**
	 * 根据属性名获取列名
	 *
	 * @param fieldName
	 * @return
	 */
	public String getColumnName(String fieldName);
}
