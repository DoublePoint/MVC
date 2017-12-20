/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年11月18日
* 
* 类   说   明 ：菜单树
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.web.port.adapter.template.service.controller.xt.cd;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.base.common.port.adapter.controller.request.BaseTreeController;
import cn.doublepoint.common.application.template.xt.XTCDQueryService;
import cn.doublepoint.common.domain.model.viewmodel.xt.VT_XT_CD;

@Controller
@RequestMapping("/template/xt")
public class XTCDTreeController extends BaseTreeController {
	//树根名称
	private final String rooTreeName="菜单树";

	@Resource
	XTCDQueryService xTCDQueryService;
	
	@RequestMapping("cdTree")
	@ResponseBody
	public List<VT_XT_CD> getCDTree(@RequestParam(required=false) Boolean isHasRoot){
		List<VT_XT_CD> returnXTCDList;
		if(isHasRoot!=null&&isHasRoot.booleanValue()){
			VT_XT_CD rootCd=new VT_XT_CD();
			rootCd.setCdmc(rooTreeName);
			returnXTCDList=new ArrayList<VT_XT_CD>();
			List<VT_XT_CD> childrenXTCDList=getChildrenXTCDList(null);
			rootCd.setChildrenCDList(childrenXTCDList);
			returnXTCDList.add(rootCd);
		}
		else{
			returnXTCDList=getChildrenXTCDList(null);
		}
		return returnXTCDList;
	}
	
	private List<VT_XT_CD> getChildrenXTCDList(VT_XT_CD cd){
		List<VT_XT_CD> xTCDList;
		if(cd==null)
			xTCDList=xTCDQueryService.findRootXTCD();
		else
			xTCDList=xTCDQueryService.findChildrenXTCD(cd);
		if(xTCDList==null){
			return null;
		}
		else{
			for(int i=0;i<xTCDList.size();i++){
				xTCDList.get(i).setChildrenCDList(getChildrenXTCDList(xTCDList.get(i)));
			}
		}
		return xTCDList;
	}
}
