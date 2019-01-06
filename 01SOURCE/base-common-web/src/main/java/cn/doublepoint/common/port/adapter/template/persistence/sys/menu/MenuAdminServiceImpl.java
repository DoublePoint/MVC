package cn.doublepoint.common.port.adapter.template.persistence.sys.menu;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.List;

import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.session.SysCommonUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysMenu;
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
@Service(value="menuAdminService")
public class MenuAdminServiceImpl implements MenuAdminService{

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysMenu> findRootMenu(PageInfo pageInfo) {
		User currentUser = (User)SysCommonUtil.getCurrentUser();
		QueryParamList queryParamList=new QueryParamList();
		
		StringBuffer stringBuffer = new StringBuffer();
		stringBuffer.append("select s from SysMenu s where exists (");
		stringBuffer.append("	select smr.id from SysMenuRole smr where smr.menuId=s.id and exists ");
		stringBuffer.append("		(select sar.id from SysAdminRole sar where sar.roleId = smr.roleId and sar.adminId = (select sa.id from SysAdmin sa where sa.loginAccountNo=:adminId))");
		stringBuffer.append(") and s.level=:rootLevel");
		queryParamList.addParam("rootLevel", XTConstant.TREE_ROOT_NODE_CJ);
		queryParamList.addParam("adminId",currentUser.getUsername());
		List<SysMenu> list = JPAUtil.executeQueryModel(stringBuffer.toString(),queryParamList,SysMenu.class);
		return list;
	}

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysMenu> findChildrenMenu(SysMenu menu, PageInfo pageInfo) {
		
		User currentUser = (User)SysCommonUtil.getCurrentUser();
		QueryParamList queryParamList=new QueryParamList();
		
		StringBuffer stringBuffer = new StringBuffer();
		stringBuffer.append("select s from SysMenu s where exists (");
		stringBuffer.append("	select smr.id from SysMenuRole smr where smr.menuId=s.id and exists ");
		stringBuffer.append("		(select sar.id from SysAdminRole sar where sar.roleId = smr.roleId and sar.adminId = (select sa.id from SysAdmin sa where sa.loginAccountNo=:adminId))");
		stringBuffer.append(")");
		if(menu!=null){
			if(menu.getId()!=null){
				stringBuffer.append(" and s.parentId=:parentId");
				queryParamList.addParam("parentId",menu.getId());
			}
		}
		queryParamList.addParam("adminId",currentUser.getUsername());
		List<SysMenu> list = JPAUtil.executeQueryModel(stringBuffer.toString(),queryParamList,pageInfo,SysMenu.class);
		return list;
	}
	
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysMenu> find(SysMenu menu,PageInfo pageInfo) {
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return JPAUtil.load(SysMenu.class, pageInfo,sortParamList);
	}

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public List<SysMenu> findAll(PageInfo pageInfo) {
		SortParamList sortParamList=new SortParamList();
		sortParamList.addParam("sn");
		return JPAUtil.load(SysMenu.class, pageInfo,sortParamList);
	}
	
	/**
	 * 根据Id获取数据
	 * @param id
	 * @return
	 */
	public SysMenu getById(Integer id){
		return JPAUtil.loadById(SysMenu.class, id);
	}

	@Override
	public long getChildrenCount(Integer parentMenuId) {
		QueryParamList queryParamList=new QueryParamList();
		if(parentMenuId!=null)
			queryParamList.addParam("parentId",parentMenuId);
		return JPAUtil.getDaoService().count(SysMenu.class, queryParamList);
	}

	@Override
	public SysMenu getByLink(String link) {
		QueryParamList queryParamList=new QueryParamList();
		queryParamList.addParam("link", link);
		List<SysMenu> list=JPAUtil.load(SysMenu.class, queryParamList);
		if(list.size()==0)
			return null;
		return list.get(0);
	}
	
}

