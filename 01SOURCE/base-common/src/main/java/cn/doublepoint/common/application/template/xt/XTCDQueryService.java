package cn.doublepoint.common.application.template.xt;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_CD;
import cn.doublepoint.common.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.common.port.adapter.template.persistence.xt.XTCDRepository;
import cn.doublepoint.common.util.CommonBeanUtils;

/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月14日
* 
* 类   说   明 ：查询菜单服务
* 
* 修   改   人：          修   改   日   期：
*/ 
@Service
public class XTCDQueryService {
	
	@Resource
	XTCDRepository xtcdRepository;
	
	
	/**
	 * 加载系统菜单
	 * @return 返回系统菜单
	 */
	public List<VT_XT_CD> loadXTCD(){
		List<VT_XT_CD> rootCdList=findRootXTCD();
		if(rootCdList==null||rootCdList.size()<=0)
			return null;
		for(int i=0;i<rootCdList.size();i++){
			List<T_XT_CD> childrenList=xtcdRepository.findChildrenXTCD(rootCdList.get(i).getCdbs());
			rootCdList.get(i).setChildrenCDList(CommonBeanUtils.copyTo(childrenList, VT_XT_CD.class));
		}
		return rootCdList;
	}
	
	/**
	 * 查询最底层菜单
	 * @return 最底层菜单列表
	 */
	public List<VT_XT_CD> findRootXTCD(){
		List<T_XT_CD> xtcdList=xtcdRepository.findRootXTCD();
		List<VT_XT_CD> resultCdList=CommonBeanUtils.copyTo(xtcdList, VT_XT_CD.class);
		return resultCdList;
	}
	/**
	 * 查询最底层菜单
	 * @return 最底层菜单列表
	 */
	public List<VT_XT_CD> findChildrenXTCD(VT_XT_CD cd){
		List<T_XT_CD> xtcdList=xtcdRepository.findChildrenXTCD(cd.getCdbs());
		List<VT_XT_CD> resultCdList=CommonBeanUtils.copyTo(xtcdList, VT_XT_CD.class);
		return resultCdList;
	}
	/**
	 * 查询所有菜单
	 * @return 最底层菜单列表
	 */
	public List<VT_XT_CD> findAllXTCD(){
		List<T_XT_CD> xtcdList=xtcdRepository.findAll();
		List<VT_XT_CD> resultCdList=CommonBeanUtils.copyTo(xtcdList, VT_XT_CD.class);
		return resultCdList;
	}
}
