package cn.doublepoint.common.port.adapter.template.persistence.sys.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.viewmodel.sys.VOAdminRole;
import cn.doublepoint.common.session.SysCommonUtil;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysAdminRole;
import cn.doublepoint.dto.domain.model.entity.sys.SysRole;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;

/**
 * 创 建 人： 刘磊
 * 
 * 创 建 时 间 ： 2017年10月14日
 * 
 * 类 说 明 ：管理员权限服务
 * 
 * 修 改 人： 修 改 日 期：
 */
@Service(value="adminRoleService")
public class AdminRoleServiceImpl implements AdminRoleService{

	/**
	 * 查询所有管理员权限
	 * 
	 * @return 最底层管理员权限列表
	 */
	public List<VOAdminRole> findRolesByAdminId(Integer adminId,PageInfo pageInfo) {
		List<VOAdminRole> resultList=new ArrayList<>();
		
		QueryParamList paramList=new QueryParamList();
		paramList.addParam("adminId",adminId);
		
		List<Object> list = JPAUtil.executeQuery("select a,r.name from SysAdminRole a,SysRole r where r.id=a.roleId and a.adminId = :adminId ",paramList);
		if(list.size()>0){
			list.stream().forEach(item->{
				Object[] arr = (Object[]) item;
				VOAdminRole adminRole = new VOAdminRole();
				CommonBeanUtils.copyProperties((SysAdminRole)arr[0],adminRole);
				adminRole.setRoleName(SysCommonUtil.getDefaultRecordString(arr[1], ""));
				resultList.add(adminRole);
			});
			
		}
		return resultList;
	}
	/**
	 * 查询非该管理员拥有的权限
	 * 
	 * @return 最底层管理员权限列表
	 */
	@Override
	public List<SysRole> findRolesNotAdminId(Integer adminId) {
		QueryParamList paramList=new QueryParamList();
		paramList.addParam("adminId",adminId);
		List<SysRole> list = JPAUtil.executeQueryModel("select r from SysRole r where not exists (select a.id from SysAdminRole a where r.id=a.roleId and a.adminId = :adminId)",paramList,SysRole.class);
		return list;
	}

	/**
	 * 查询所有管理员权限
	 * 
	 * @return 最底层管理员权限列表
	 */
	public List<SysAdminRole> findAll(PageInfo pageInfo) {
		return JPAUtil.load(SysAdminRole.class, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysAdminRole getById(Integer id){
		return JPAUtil.loadById(SysAdminRole.class, id);
	}

	/**
	 * 移除管理员权限
	 * @param adminRole
	 * @return
	 */
	public boolean removeAdminRole(List<SysAdminRole> adminRoleList) {
		adminRoleList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	

	/**
	 * 保存或更新
	 * @param adminRole
	 * @return
	 */
	public boolean saveOrUpdate(SysAdminRole adminRole) {
		if (adminRole.getId() == null){
			adminRole.setId(SequenceUtil.getNextVal(SysAdminRole.class));
			adminRole.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		adminRole.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(adminRole);
		return true;
	}
	
	/**
	 * 保存或更新
	 * @param adminRole
	 * @return
	 */
	public boolean saveOrUpdate(List<SysAdminRole> adminRoleList) {
		adminRoleList.stream().forEach(adminRole->{
			if (adminRole.getId() == null){
				adminRole.setId(SequenceUtil.getNextVal(SysAdminRole.class));
				adminRole.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			adminRole.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(adminRoleList);
		return true;
	}

	@Override
	public boolean removeByAdminId(Integer adminId) {
		QueryParamList paramList = new QueryParamList();
		paramList.addParam("adminId",adminId);
		JPAUtil.executeUpdate("	DELETE FROM SysAdminRole ar where ar.adminId=:adminId",paramList);
		return true;
	}

}

