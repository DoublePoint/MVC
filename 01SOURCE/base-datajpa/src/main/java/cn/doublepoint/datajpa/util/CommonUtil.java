///** 
//* 创   建   人： 刘磊
//* 
//* 创   建   时   间 ： 2017年12月31日
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
//import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
//import cn.doublepoint.commonutil.domain.model.BaseModel;
//import cn.doublepoint.commonutil.domain.model.PageInfo;
//import cn.doublepoint.commonutil.port.adapter.persistence.BaseRepositoryUtil;
//import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
//import cn.doublepoint.commonutil.port.adapter.persistence.SortParamList;
//import cn.doublepoint.datajpa.repository.TXTCDRepository;
//
//public abstract class CommonUtil implements BaseRepositoryUtil{
//	@Resource
//	TXTCDRepository repository;
//	
//	@Override
//	public <T extends BaseModel> AjaxDataWrap<T> load(Class<T> clazz, QueryParamList params, SortParamList sortParams,
//			PageInfo pageInfo) {
//		repository.findall
//		return null;
//	}
//
//	@Override
//	public <T extends BaseModel> void batchUpdate(List<T> updateList) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public <T extends BaseModel> void batchInsert(List<T> insertList) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	
//	
//}
