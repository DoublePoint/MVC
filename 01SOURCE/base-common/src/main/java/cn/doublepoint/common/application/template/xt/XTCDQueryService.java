package cn.doublepoint.common.application.template.xt;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.domain.model.XTCDConstant;
import cn.doublepoint.commonutil.port.adapter.persistence.BaseRepositoryUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParam;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;

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
public class XTCDQueryService {

	@Resource
	BaseRepositoryUtil jpaUtil;
	// /**
	// * 加载系统菜单
	// * @return 返回系统菜单
	// */
	// public List<VT_XT_CD> loadXTCD(){
	// List<VT_XT_CD> rootCdList=findRootXTCD();
	// if(rootCdList==null||rootCdList.size()<=0)
	// return null;
	// for(int i=0;i<rootCdList.size();i++){
	// List<T_XT_CD>
	// childrenList=xtcdRepository.findChildrenXTCD(rootCdList.get(i).getCdbs());
	// rootCdList.get(i).setChildrenCDList(CommonBeanUtils.copyTo(childrenList,
	// VT_XT_CD.class));
	// }
	// return rootCdList;
	// }

	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VT_XT_CD> findRootXTCD(PageInfo pageInfo) {
		QueryParamList params=new QueryParamList();
		params.addParam(new QueryParam("cdcj",XTCDConstant.TREE_ROOT_NODE_CJ));
		return jpaUtil.load(T_XT_CD.class, params,pageInfo).copy(VT_XT_CD.class);
	}
	
	/**
	 * 查询最底层菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VT_XT_CD> findChildrenXTCD(VT_XT_CD cd, PageInfo pageInfo) {
		QueryParamList queryParamList=new QueryParamList();
		
		queryParamList.addParam(new QueryParam("sjcdbs",cd.getCdbs()));
		return jpaUtil.load(T_XT_CD.class, queryParamList,pageInfo).copy(VT_XT_CD.class);
	}
	/**
	 * 查询所有菜单
	 * 
	 * @return 最底层菜单列表
	 */
	public AjaxDataWrap<VT_XT_CD> findAllXTCD(PageInfo pageInfo) {
		AjaxDataWrap<T_XT_CD> ajaxDataWrap=jpaUtil.load(T_XT_CD.class, pageInfo);
		return ajaxDataWrap.copy(VT_XT_CD.class);
	}
}
