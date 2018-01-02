///** 
//* 创   建   人： 刘磊
//* 
//* 创   建   时   间 ： 2017年12月29日
//* 
//* 类   说   明 ：
//* 
//* 修   改   人：          修   改   日   期：
//*/
//package cn.doublepoint.datajpa.util;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import com.querydsl.core.types.Predicate;
//
//import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
//import cn.doublepoint.commonutil.domain.model.BaseModel;
//import cn.doublepoint.commonutil.domain.model.PageInfo;
//import cn.doublepoint.commonutil.port.adapter.persistence.BaseRepositoryUtil;
//import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
//import cn.doublepoint.commonutil.port.adapter.persistence.SortParamList;
//import cn.doublepoint.datajpa.domain.model.QT_XT_CD;
//import cn.doublepoint.datajpa.repository.TXTCDRepository;
//
//public class DataJPAUtil implements BaseRepositoryUtil{
//	@Resource
//	TXTCDRepository repository;
//	public <T extends BaseModel> List<T> executeQuery(String sql, Class<T> clas) {
//		QT_XT_CD cd = QT_XT_CD.t_XT_CD;
//		Predicate predicate = cd.cdbs.eq("393822756359110656");
////		repository.findCDDetail(predicate);
//
//		return null;
//	}
//	
//	public <T extends BaseModel> List<T> executeQuery(String sql, Object[] params, Class<T> clas) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public <T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList params) {
//		QT_XT_CD cd = QT_XT_CD.t_XT_CD;
//		
//		Predicate predicate = cd.cdbs.eq("393822756359110656");
////		repository.findCDDetail(predicate);
//		return null;
//	}
//
//	public <T extends BaseModel> AjaxDataWrap<T> load(Class<T> clazz, PageInfo pageInfo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public <T extends BaseModel> List<T> load(Class<T> clazz, QueryParamList params, SortParamList sortParams) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public <T extends BaseModel> AjaxDataWrap<T> load(Class<T> clazz, SortParamList sortParams, PageInfo pageInfo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public <T extends BaseModel> AjaxDataWrap<T> load(Class<T> clazz, QueryParamList params, PageInfo pageInfo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public <T extends BaseModel> AjaxDataWrap<T> load(Class<T> clazz, QueryParamList params, SortParamList sortParams,
//			PageInfo pageInfo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	public <T extends BaseModel> void batchUpdate(List<T> updateList) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	public <T extends BaseModel> void batchInsert(List<T> insertList) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	public int queryCount(String sql, Object[] params) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	
//
//}
