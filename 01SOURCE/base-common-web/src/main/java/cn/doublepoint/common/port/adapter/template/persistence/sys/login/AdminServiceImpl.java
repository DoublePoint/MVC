package cn.doublepoint.common.port.adapter.template.persistence.sys.login;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.encrypt.EncyptUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysAdmin;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

@Service("adminService")
public class AdminServiceImpl  implements AdminService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<SysAdmin> find(SysAdmin admin,PageInfo pageInfo) {
		return JPAUtil.load(SysAdmin.class, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public SysAdmin getById(long id){
		return JPAUtil.loadById(SysAdmin.class, id);
	}
	
	/**
	 * 移除
	 * @param admin
	 * @return
	 */
	@Override
	public boolean remove(SysAdmin admin){
		JPAUtil.remove(admin);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param adminList
	 * @return
	 */
	@Override
	public boolean remove(List<SysAdmin> adminList){
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
	public boolean saveOrUpdate(SysAdmin admin) {
		if (admin.getId() == null){
			admin.setId(SequenceUtil.getNextVal(SysAdmin.class));
			admin.setCreateTime(DateTimeUtil.getCurrentDate());
			admin.setLoginPassword(EncyptUtil.encypt(admin.getLoginPassword()));
		}
		else{
			SysAdmin dbAdmin=JPAUtil.loadById(SysAdmin.class,admin.getId());
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
	public boolean saveOrUpdate(List<SysAdmin> adminList) {
		adminList.stream().forEach(admin->{
			if (admin.getId() == null){
				admin.setId(SequenceUtil.getNextVal(SysAdmin.class));
				admin.setCreateTime(DateTimeUtil.getCurrentDate());
				admin.setLoginPassword(EncyptUtil.encypt(admin.getLoginPassword()));
			}
			else{
				SysAdmin dbAdmin=JPAUtil.loadById(SysAdmin.class,admin.getId());
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
	public List<SysAdmin> findAll(PageInfo pageInfo) {
		return JPAUtil.load(SysAdmin.class,pageInfo);
	}
}