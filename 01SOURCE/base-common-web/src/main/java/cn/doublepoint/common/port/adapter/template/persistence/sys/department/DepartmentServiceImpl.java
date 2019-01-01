package cn.doublepoint.common.port.adapter.template.persistence.sys.department;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysDepartment;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;
import cn.doublepoint.dto.domain.model.vo.query.QueryParam;
import cn.doublepoint.dto.domain.model.vo.query.QueryParamList;
import cn.doublepoint.dto.domain.model.vo.query.SortParamList;

/**
 * 创 建 人： 刘磊
 * 
 * 创 建 时 间 ： 2017年10月14日
 * 
 * 类 说 明 ：菜单服务
 * 
 * 修 改 人： 修 改 日 期：
 */
@Service(value="departmentService")
public class DepartmentServiceImpl implements DepartmentService{

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysDepartment> findRootDepartment(PageInfo pageInfo) {
		QueryParamList queryParamList=new QueryParamList();
		queryParamList.addParam("level", XTConstant.TREE_ROOT_NODE_CJ);
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		List<SysDepartment> list=JPAUtil.load(SysDepartment.class, queryParamList,sortParamList);
		return list;
	}

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysDepartment> findChildrenDepartment(SysDepartment department, PageInfo pageInfo) {
		QueryParamList paramList=new QueryParamList();
		if(department.getId()!=null)
			paramList.addParam("parentId",department.getId());
		if(!StringUtil.isNullOrEmpty(department.getName())){
			paramList.addParam("name","%"+department.getName()+"%",QueryParam.RELATION_LIKE);
		}
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return JPAUtil.load(SysDepartment.class,paramList, pageInfo,sortParamList);
	}
	
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysDepartment> find(SysDepartment department,PageInfo pageInfo) {
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return JPAUtil.load(SysDepartment.class, pageInfo,sortParamList);
	}

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysDepartment> findAll(PageInfo pageInfo) {
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return JPAUtil.load(SysDepartment.class, pageInfo,sortParamList);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysDepartment getById(Integer id){
		return JPAUtil.loadById(SysDepartment.class, id);
	}

	/**
	 * 移除菜单
	 * @param department
	 * @return
	 */
	public boolean removeDepartment(List<SysDepartment> departmentList) {
		departmentList.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
	

	/**
	 * 保存或更新
	 * @param department
	 * @return
	 */
	public boolean saveOrUpdate(SysDepartment department) {
		if (department.getParentId() == null) {
			department.setLevel(Integer.valueOf(XTConstant.TREE_ROOT_NODE_CJ));
			department.setParentId(0);
		} else {
			SysDepartment parentCd = getById(department.getParentId());
			if(parentCd==null){
				department.setLevel(Integer.valueOf(XTConstant.TREE_ROOT_NODE_CJ));
				department.setParentId(0);
			}
			else
				department.setLevel(parentCd.getLevel() + 1);
		}
		if (department.getId() == null){
			department.setId(SequenceUtil.getNextVal(SysDepartment.class));
			department.setCreateTime(DateTimeUtil.getCurrentDate());
		}
		department.setModifyTime(DateTimeUtil.getCurrentDate());
		JPAUtil.saveOrUpdate(department);
		return true;
	}
	
	/**
	 * 保存或更新
	 * @param department
	 * @return
	 */
	public boolean saveOrUpdate(List<SysDepartment> departmentList) {
		departmentList.stream().forEach(department->{
			if (department.getParentId() == null||department.getParentId() == 0) {
				department.setLevel(Integer.valueOf(XTConstant.TREE_ROOT_NODE_CJ));
				department.setParentId(0);
			} else {
				SysDepartment parentCd = getById(department.getParentId());
				department.setLevel(parentCd.getLevel() + 1);
			}
			if (department.getId() == null){
				department.setId(SequenceUtil.getNextVal(SysDepartment.class));
				department.setCreateTime(DateTimeUtil.getCurrentDate());
			}
			department.setModifyTime(DateTimeUtil.getCurrentDate());
		});
		
		JPAUtil.saveOrUpdate(departmentList);
		return true;
	}

	@Override
	public long getChildrenCount(Integer parentDepartmentId) {
		QueryParamList queryParamList=new QueryParamList();
		if(parentDepartmentId!=null)
			queryParamList.addParam("parentId",parentDepartmentId);
		return JPAUtil.getDaoService().count(SysDepartment.class, queryParamList);
	}
	
}

