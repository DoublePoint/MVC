/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月6日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.application.template.sys.entity;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.port.adapter.template.persistence.sys.entity.EntityFilterRepository;

@Service
public class EntityFilterApplicationService {

	@Resource
	EntityFilterRepository repository;

}
