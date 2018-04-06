///** 
//* 创   建   人： 刘磊
//* 
//* 创   建   时   间 ： 2017年10月14日
//* 
//* 类   说   明 ：系统菜单仓库测试类
//* 
//* 修   改   人：          修   改   日   期：
//*/
//package cn.doublepoint.infrastruture.xt;
//
//import java.sql.Timestamp;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.junit.Test;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//
//import cn.doublepoint.common.domain.model.entity.xt.CustomerProjection;
//import cn.doublepoint.common.domain.model.entity.xt.Menu;
//import cn.doublepoint.common.port.adapter.template.persistence.xt.MenuRepository;
//import cn.doublepoint.common.util.SnowflakeIdWorker;
//
//public class MenuRepositoryTest extends RepositoryTest {
//
//	@Resource
//	MenuRepository repository;
//	@Resource
//	SnowflakeIdWorker idworker;
//	
//	
//
//	@Test
//	public void testSaveMenu() {
//		List<Menu> list=new ArrayList<Menu>();
//		for (int i = 0; i < 1000000; i++) {
//			Menu cd = new Menu();
//			cd.setCdbs(idworker.nextId());
//			cd.setCdmc("菜单名称"+i);
//			cd.setCjsj(new Timestamp(100000));
//			cd.setGxsj(new Date());
//			list.add(cd);
//			if(i%20000==0){
////				repository.save(list);
//				list=new ArrayList<Menu>();
//			}
//		}
//	}
//
//	@Test
//	public void testPage() {
//		PageRequest request = this.buildPageRequest(1, 2);
//		Page<Menu> page=repository.findAllMenu(request);
//		System.out.println(111);
//	}
//
//	// 构建PageRequest
//	private PageRequest buildPageRequest(int pageNumber, int pagzSize) {
//		return new PageRequest(pageNumber - 1, pagzSize, null);
//	}
//
//	@Test
//	public void testProjection() {
//		List<CustomerProjection> list = repository.findReturnProjection();
//		// List<CustomerProjectionClass> list2=CommonBeanUtils.copyTo(list,
//		// CustomerProjectionClass.class);
//		System.out.println("123");
//	}
//}
