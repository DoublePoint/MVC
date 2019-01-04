package cn.doublepoint.common.port.adapter.template.persistence.sys.admin;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.encrypt.EncyptUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysAdmin;
import cn.doublepoint.dto.domain.model.vo.query.EnumSortParamType;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParam;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;
import cn.doublepoint.dto.domain.model.vo.query.SortParamList;

@Service("adminService")
public class AdminServiceImpl  implements AdminService{

	/**
	 * 根据查询条件以及分页信息，查询所有数据
	 * 
	 * @return 
	 */
	@Override
	public List<SysAdmin> find(SysAdmin admin,PageInfo pageInfo) {
		QueryParamList paramList=new QueryParamList();
		if(admin!=null){
			if(admin.getDepartmentId()!=null)
				paramList.addParam("departmentId",admin.getDepartmentId());
			if(!StringUtil.isNullOrEmpty(admin.getLoginAccountNo())){
				paramList.addParam("loginAccountNo","%"+admin.getLoginAccountNo()+"%",QueryParam.RELATION_LIKE);
			}
		}
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("createTime",EnumSortParamType.DESC);
		return JPAUtil.load(SysAdmin.class,paramList, pageInfo);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	@Override
	public SysAdmin getById(Integer id){
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
		
		//delete by adminId
		QueryParamList paramList = new QueryParamList();
		paramList.addParam("adminId", admin.getId());
		JPAUtil.executeUpdate("delete from SysAdminRole where adminId = :adminId",paramList);
		return true;
	}
	
	
	/**
	 * 移除
	 * @param adminList
	 * @return
	 */
	@Override
	public boolean remove(List<SysAdmin> adminList){
		adminList.stream().forEach(this::remove);
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

	@Override
	public SysAdmin getByLoginAccountNo(String loginAccountNo) {
		QueryParamList paramList = new QueryParamList();
		paramList.addParam("loginAccountNo", loginAccountNo);
		List<SysAdmin> admins = JPAUtil.load(SysAdmin.class,paramList);
		if(admins.size()==0)
			return null;
		return admins.get(0);
	}
}