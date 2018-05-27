package cn.doublepoint.common.application.template.sys.login;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.sys.Admin;
import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.encrypt.EncyptUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;

@Service("adminService")
public class AdminServiceImpl  implements AdminService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<Admin> find(Admin admin,PageInfo pageInfo) {
		return JPAUtil.load(Admin.class, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public Admin getById(long id){
		return JPAUtil.loadById(Admin.class, id);
	}
	
	/**
	 * 移除
	 * @param admin
	 * @return
	 */
	@Override
	public boolean remove(Admin admin){
		JPAUtil.remove(admin);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param adminList
	 * @return
	 */
	@Override
	public boolean remove(List<Admin> adminList){
		adminList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param admin
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(Admin admin) {
		if (admin.getId() == null){
			admin.setId(SequenceUtil.getNextVal(Admin.class));
			admin.setCreateTime(DateTimeUtil.getCurrentDate());
			admin.setLoginPassword(EncyptUtil.encypt(admin.getLoginPassword()));
		}
		else{
			Admin dbAdmin=JPAUtil.loadById(Admin.class,admin.getId());
			if(!dbAdmin.getLoginPassword().equals(EncyptUtil.encypt(admin.getLoginPassword()))){
				admin.setLoginPassword(EncyptUtil.encypt(admin.getLoginPassword()));
			}
		}
		admin.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(admin);
		return true;
	}
	
	/**
	 * 创建或更新数据
	 * @param adminList
	 * @return
	 */
	@Override
	public boolean saveOrUpdate(List<Admin> adminList) {
		adminList.stream().forEach(admin->{
			if (admin.getId() == null){
				admin.setId(SequenceUtil.getNextVal(Admin.class));
				admin.setCreateTime(DateTimeUtil.getCurrentDate());
				admin.setLoginPassword(EncyptUtil.encypt(admin.getLoginPassword()));
			}
			else{
				Admin dbAdmin=JPAUtil.loadById(Admin.class,admin.getId());
				if(!dbAdmin.getLoginPassword().equals(EncyptUtil.encypt(admin.getLoginPassword()))){
					admin.setLoginPassword(EncyptUtil.encypt(admin.getLoginPassword()));
				}
			}
			admin.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(adminList);
		return true;
	}

	@Override
	public List<Admin> findAll(PageInfo pageInfo) {
		return JPAUtil.load(Admin.class,pageInfo);
	}
}