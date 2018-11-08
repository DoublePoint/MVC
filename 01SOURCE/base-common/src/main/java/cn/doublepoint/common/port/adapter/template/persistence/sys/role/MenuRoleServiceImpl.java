package cn.doublepoint.common.port.adapter.template.persistence.sys.role;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.template.dto.domain.model.entity.sys.MenuRole;

@Service("menuRoleService")
public class MenuRoleServiceImpl implements MenuRoleService {

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return
	 */
	@Override
	public List<MenuRole> find(MenuRole menuRole, PageInfo pageInfo) {
		QueryParamList queryParamList=new QueryParamList();
		if (menuRole != null) {
			if(menuRole.getRoleId()!=null)
				queryParamList.addParam("roleId",menuRole.getRoleId());
		}
		return JPAUtil.load(MenuRole.class,queryParamList, pageInfo);
	}

	/**
	 * 根据Id获取数据
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public MenuRole getById(long id) {
		return JPAUtil.loadById(MenuRole.class, id);
	}

	/**
	 * 移除
	 * 
	 * @param menuRole
	 * @return
	 */
	@Override
	public boolean remove(MenuRole menuRole) {
		JPAUtil.remove(menuRole);
		return true;
	}

	/**
	 * 移除
	 * 
	 * @param menuRoleList
	 * @return
	 */
	@Override
	public boolean remove(List<MenuRole> menuRoleList) {
		menuRoleList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}

	/**
	 * 创建或更新数据
	 * 
	 * @param menuRole
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(MenuRole menuRole) {
		if (menuRole.getId() == null) {
			menuRole.setId(SequenceUtil.getNextVal(MenuRole.class));
			menuRole.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		menuRole.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(menuRole);
		return true;
	}

	/**
	 * 创建或更新数据
	 * 
	 * @param menuRoleList
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(List<MenuRole> menuRoleList) {
		removeByRoleId(menuRoleList.get(0).getRoleId());
		menuRoleList.stream().forEach(item -> {
			if (item.getId() == null) {
				item.setId(SequenceUtil.getNextVal(MenuRole.class));
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			item.setModifyTime(DateTimeUtil.getCurrentDate());
		});

		JPAUtil.saveOrUpdate(menuRoleList);
		return true;
	}

	@Override
	public List<MenuRole> findAll(PageInfo pageInfo) {
		return JPAUtil.load(MenuRole.class, pageInfo);
	}

	/**
	 * 根据roleId删除菜单角色绑定
	 * 
	 * @param roleId
	 * @return
	 */
	@Override
	public boolean removeByRoleId(Long roleId) {
		StringBuffer jpql = new StringBuffer();
		jpql.append(" delete from MenuRole mr where mr.roleId=:roleId");
		QueryParamList queryParamList = new QueryParamList();
		queryParamList.addParam("roleId", roleId);
		int i = JPAUtil.executeUpdate(jpql.toString(), queryParamList);
		return i != 0;
	}
}