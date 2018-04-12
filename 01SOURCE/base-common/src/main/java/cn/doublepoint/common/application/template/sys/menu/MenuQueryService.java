package cn.doublepoint.common.application.template.sys.menu;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Predicate;
import com.querydsl.jpa.impl.JPAQueryFactory;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.Menu;
import cn.doublepoint.common.domain.model.entity.sys.QMenu;
import cn.doublepoint.common.domain.model.viewmodel.sys.VOMenu;
import cn.doublepoint.common.port.adapter.template.persistence.sys.menu.MenuRepository;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

/**
 * 创 建 人： 刘磊
 * 
 * 创 建 时 间 ： 2017年10月14日
 * 
 * 类 说 明 ：查询菜单服务
 * 
 * 修 改 人： 修 改 日 期：
 */
@Service
public class MenuQueryService {

	@Autowired  
    @PersistenceContext  
    private EntityManager entityManager;  
      
    private JPAQueryFactory queryFactory;  
      
    @PostConstruct  
    public void init() {  
        queryFactory = new JPAQueryFactory(entityManager);  
    }  

	@Resource
	MenuRepository menuRepository;


	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VOMenu> findRootMenu(PageInfo pageInfo) {
		QMenu query = QMenu.menu;
		Predicate predicate = query.level.eq(XTConstant.TREE_ROOT_NODE_CJ);
		AjaxDataWrap<Menu> dataWrap = findAll(Menu.class, predicate, pageInfo, menuRepository);
		AjaxDataWrap<VOMenu> ajaxDataWrap = dataWrap.copy(VOMenu.class);
		return ajaxDataWrap;
	}

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VOMenu> findChildrenMenu(VOMenu menu, PageInfo pageInfo) {
		QMenu query = QMenu.menu;
		BooleanBuilder bb=new BooleanBuilder();
		if(StringUtil.isNotEmpty(menu.getId()))
			bb.and(query.parentId.eq(menu.getId()));
		AjaxDataWrap<Menu> dataWrap = findAll(Menu.class, bb.getValue(), pageInfo, menuRepository);
		return dataWrap.copy(VOMenu.class);
	}

	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VOMenu> findAllMenu(PageInfo pageInfo) {
		AjaxDataWrap<Menu> ajaxDataWrap = findAll(Menu.class, null, pageInfo, menuRepository);
		return ajaxDataWrap.copy(VOMenu.class);
	}
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VOMenu> findAllMenu(VOMenu menu,PageInfo pageInfo) {
		AjaxDataWrap<Menu> ajaxDataWrap = findAll(Menu.class, null, pageInfo, menuRepository);
		return ajaxDataWrap.copy(VOMenu.class);
	}

	private <T extends BaseEntity> AjaxDataWrap<T> findAll(Class<T> clazz, Predicate predicate, PageInfo pageInfo,
			 QueryDslPredicateExecutor<T> repository) {
		Page<T> page = repository.findAll(predicate, CommonBeanUtils.copyPageInfoToPageable(pageInfo));
		AjaxDataWrap<T> ajaxDataWrap = CommonBeanUtils.copyPageToAjaxDataWrap(page, clazz);
		return ajaxDataWrap;
	}
	
	private void test(){
//		Predicate predicate = (QPerson.person.id.intValue()).eq(QIDCard.iDCard.person.id.intValue());  
//        JPAQuery<Tuple> jpaQuery = queryFactory.select(QIDCard.iDCard.idNo, QPerson.person.address, QPerson.person.name)  
//                .from(QIDCard.iDCard, QPerson.person)  
//                .where(predicate);  
//        List<Tuple> tuples = jpaQuery.fetch();  
//        List<PersonIDCardDto> dtos = new ArrayList<PersonIDCardDto>();  
//        if(null != tuples && !tuples.isEmpty()){  
//            for(Tuple tuple:tuples){  
//                String address = tuple.get(QPerson.person.address);  
//                String name = tuple.get(QPerson.person.name);  
//                String idCard = tuple.get(QIDCard.iDCard.idNo);  
//                PersonIDCardDto dto = new PersonIDCardDto();  
//                dto.setAddress(address);  
//                dto.setIdNo(idCard);  
//                dto.setName(name);  
//                dtos.add(dto);  
//            }  
//        }  
//        return dtos;  
	}
}

