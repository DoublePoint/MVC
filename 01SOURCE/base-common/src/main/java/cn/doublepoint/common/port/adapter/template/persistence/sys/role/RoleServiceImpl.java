package cn.doublepoint.common.port.adapter.template.persistence.sys.role;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.template.dto.domain.model.entity.sys.Role;

@Service("roleService")
public class RoleServiceImpl  implements RoleService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<Role> find(Role role,PageInfo pageInfo) {
		return JPAUtil.load(Role.class, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public Role getById(long id){
		return JPAUtil.loadById(Role.class, id);
	}
	
	/**
	 * 移除
	 * @param role
	 * @return
	 */
	@Override
	public boolean remove(Role role){
		JPAUtil.remove(role);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param roleList
	 * @return
	 */
	@Override
	public boolean remove(List<Role> roleList){
		roleList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param role
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(Role role) {
		if (role.getId() == null){
			role.setId(SequenceUtil.getNextVal(Role.class));
			role.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		role.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(role);
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param roleList
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(List<Role> roleList) {
		roleList.stream().forEach(item->{
			if (item.getId() == null){
				item.setId(SequenceUtil.getNextVal(Role.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(roleList);
		return true;
	}

	@Override
	public List<Role> findAll(PageInfo pageInfo) {
		return JPAUtil.load(Role.class,pageInfo);
	}
}