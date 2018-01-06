/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： ${datetime}
 * 
 * 类   说   明 ：Spring Data JPA Impl
 * 
 * 修   改   人：          修   改   日   期：
 */
package cn.doublepoint.generate.domain.model.helper.template;
import cn.doublepoint.common.port.adapter.template.persistence.xt.BaseRepository;

public class <#list entityModel.modelClassCode?split('_') as n>${n?upper_case}</#list>RepositoryExtendImpl  extends BaseRepository implements <#list entityModel.modelClassCode?split('_') as n>${n?upper_case}</#list>RepositoryExtend {

}
