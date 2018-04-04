/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询菜单服务
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.application.template.sys.role;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.sys.Role;
import cn.doublepoint.common.port.adapter.template.persistence.sys.role.RoleRepository;
import cn.doublepoint.commonutil.domain.model.SnowflakeIdWorker;

@Service("roleApplicationService")
public class RoleApplicationService {
	@Resource
	RoleRepository roleRepository;
	
	@Resource
	SnowflakeIdWorker idWorker;
	
	public boolean createRole(Role role){
		try {
			role.setId(idWorker.nextId());
			role.setCreateTime(new Date());
			roleRepository.save(role);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public boolean removeRole(List<Role> cdList){
		roleRepository.delete(cdList);
		return true;
	}
}
