/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月26日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.dto.domain.model.vo.query;

import java.util.ArrayList;
import java.util.List;

public class ParamAndSql {
	private String sqlString = "";
	  private List<Object> params = new ArrayList<Object>();
	  
	  public String getSqlString()
	  {
	    return this.sqlString;
	  }
	  
	  public void setSqlString(String sqlString)
	  {
	    this.sqlString = sqlString;
	  }
	  
	  public List<Object> getParams()
	  {
	    return this.params;
	  }
	  
	  public void setParams(List<Object> params)
	  {
	    this.params = params;
	  }
}
