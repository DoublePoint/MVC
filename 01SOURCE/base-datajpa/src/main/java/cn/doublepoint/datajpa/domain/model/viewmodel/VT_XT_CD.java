/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月29日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.datajpa.domain.model.viewmodel;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Id;

public class VT_XT_CD {
	private String cdbs; // 菜单标识
	private String cdmc; // 菜单名称
	private String cdlj; // 菜单链接
	private String sjcdbs; // 上级菜单标识
	private String sjcdmc;
}
