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

import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.doublepoint.common.application.template.xt.XTCDQueryService;
import cn.doublepoint.common.domain.model.viewmodel.xt.VT_XT_CD;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseTreeController;

@Controller
@RequestMapping("/template/xt")
public class XTCDTreeController implements BaseTreeController {
	// 树根名称
	private final String rooTreeName = "菜单树";

	@Resource
	XTCDQueryService xTCDQueryService;

	@RequestMapping("cd-tree")
	@ResponseBody
	public List<VT_XT_CD> getCDTree(@RequestParam(required = false) Boolean isHasRoot) {
		List<VT_XT_CD> returnXTCDList;
		if (isHasRoot != null && isHasRoot.booleanValue()) {
			VT_XT_CD rootCd = new VT_XT_CD();
			rootCd.setCdmc(rooTreeName);
			returnXTCDList = new ArrayList<VT_XT_CD>();
			List<VT_XT_CD> childrenXTCDList = getChildrenXTCDList(null);
			rootCd.setChildrenCDList(childrenXTCDList);
			returnXTCDList.add(rootCd);
		} else {
			returnXTCDList = getChildrenXTCDList(null);
		}
//		 try {
//			 ObjectMapper mapper = new ObjectMapper();  
//				String jsonStr = mapper.writeValueAsString(returnXTCDList);
//			} catch (JsonProcessingException e) {
//				e.printStackTrace();
//			}  
		return returnXTCDList;
	}

	private List<VT_XT_CD> getChildrenXTCDList(VT_XT_CD cd) {
		PageInfo pageRequest = new PageInfo(0, 999999);
		List<VT_XT_CD> xTCDList;
		if (cd == null)
			xTCDList = xTCDQueryService.findRootXTCD(pageRequest).getData();
		else
			xTCDList = xTCDQueryService.findChildrenXTCD(cd, pageRequest).getData();
		if (xTCDList == null) {
			return null;
		} else {
			for (int i = 0; i < xTCDList.size(); i++) {
				xTCDList.get(i).setChildrenCDList(getChildrenXTCDList(xTCDList.get(i)));
			}
		}
		return xTCDList;
	}
}
