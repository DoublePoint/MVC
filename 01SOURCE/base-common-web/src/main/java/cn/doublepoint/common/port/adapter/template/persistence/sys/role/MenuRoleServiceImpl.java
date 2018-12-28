package cn.doublepoint.common.port.adapter.template.persistence.sys.role;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenuRole;
import cn.doublepoint.common.session.SysCommonUtil;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.Menu;
import cn.doublepoint.dto.domain.model.entity.sys.MenuRole;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;

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
		menuRoleList.stream().forEach(item -> {
			MenuRole mRole = this.getByRoleIdAndMenuId(item.getRoleId(), item.getMenuId());
			if(mRole == null){
				if(item.getId()==null){
					item.setId(SequenceUtil.getNextVal(MenuRole.class));
				}
			}
			else{
				item.setId(mRole.getId());
			}
			if(item.getCreateTime()==null)
				item.setCreateTime(DateTimeUtil.getCurrentDate());
			if(item.getModifyTime()==null)
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
	
	/**
	 * 根据roleId删除菜单角色绑定
	 * 
	 * @param roleId
	 * @return
	 */
	@Override
	public List<VOMenuRole> getMenuRole(Long roleId) {
		return null;
	}
	

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	@Override
	public List<VOMenuRole> findChildrenMenuRole(Long roleId , Menu query) {
		QueryParamList paramList=new QueryParamList();
		StringBuffer jpql = new StringBuffer();
		jpql.append(" select m.name,m.id mid,mr.id mrid,mr.role_id,mr.permission from sys_Menu m left join (select * from sys_Menu_Role r where r.role_id=:roleId) mr on m.id = mr.menu_Id where 1=1 ");
		
		if(query.getId()!=null){
			jpql.append("and m.parent_Id = :parentId");
			paramList.addParam("parentId",query.getId());
		}
		if(!StringUtil.isNullOrEmpty(query.getName())){
			jpql.append("and m.name like :name");
			paramList.addParam("name","%"+query.getName()+"%");
		}
		jpql.append("  order by m.sn");
		paramList.addParam("roleId", roleId);
		List<Object> objs = JPAUtil.executeNativeQuery(jpql.toString(), paramList);
		if(objs==null)
			return null;
		return objs.stream().map(i->{
			Object[] arr = (Object[]) i;
			int index=0; 
			String name=SysCommonUtil.getDefaultRecordString(arr[index++], "");
			Long menu_id=SysCommonUtil.getDefaultRecordLong(arr[index++],  null);
			Long id=SysCommonUtil.getDefaultRecordLong(arr[index++],  null);
			Long role_id=SysCommonUtil.getDefaultRecordLong(arr[index++], null);
			Integer permission=SysCommonUtil.getDefaultRecordInteger(arr[index++], new Integer(0));
			
			VOMenuRole res = new VOMenuRole();
			res.setMenuName(name);
			res.setId(id);
			res.setRoleId(role_id);
			res.setMenuId(menu_id);
			res.setPermission(permission);
			return res;
		}).collect(Collectors.toList());
	}
	
	/**
	 * 判断是否有写权限
	 * @param a
	 * @return
	 */
	@Override
    public  boolean isHasWriteRight(Integer a){
    	return ((a.intValue())&XTConstant.PROPERTY_RIGHT_WRITE)==XTConstant.PROPERTY_RIGHT_WRITE;
    }
	
	/**
	 * 判断是否有写权限
	 * @param a
	 * @return
	 */
	@Override
    public boolean isHasReadRight(Integer a){
    	return ((a.intValue())&XTConstant.PROPERTY_RIGHT_READ)==XTConstant.PROPERTY_RIGHT_READ;
    }
	
	/**
	 * 获取权限值列表
	 * @param mRole
	 * @return
	 */
	@Override
	public List<String> getRightList(MenuRole mRole){
		List<String> list = new ArrayList<String>();
		if(isHasWriteRight(mRole.getPermission()))
			list.add(String.valueOf(XTConstant.PROPERTY_RIGHT_WRITE));
		if(isHasReadRight(mRole.getPermission()))
			list.add(String.valueOf(XTConstant.PROPERTY_RIGHT_READ));
		return list;
	}
	
	/**
	 * 获取权限值列表
	 * @param mRole
	 * @return
	 */
	@Override
	public List<String> getRightList(VOMenuRole mRole){
		List<String> list = new ArrayList<String>();
		if(isHasWriteRight(mRole.getPermission()))
			list.add(String.valueOf(XTConstant.PROPERTY_RIGHT_WRITE));
		if(isHasReadRight(mRole.getPermission()))
			list.add(String.valueOf(XTConstant.PROPERTY_RIGHT_READ));
		return list;
	}
	
	/**
	 * 根据roleid以及menuid获取数据
	 * @param roleId
	 * @param menuId
	 * @return
	 */
	@Override
	public MenuRole getByRoleIdAndMenuId(Long roleId,Long menuId){
		QueryParamList paramList = new QueryParamList();
		paramList.addParam("roleId",roleId);
		paramList.addParam("menuId",menuId);
		List<MenuRole> list = JPAUtil.load(MenuRole.class, paramList);
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	/**
	 * 根据roleid获取数据
	 * @param roleId
	 * @param menuId
	 * @return
	 */
	@Override
	public boolean isExistByRoleId(Long roleId){
		QueryParamList paramList = new QueryParamList();
		paramList.addParam("roleId",roleId);
		long count = JPAUtil.count(MenuRole.class, paramList);
		return count>0;
	}
	
	
}