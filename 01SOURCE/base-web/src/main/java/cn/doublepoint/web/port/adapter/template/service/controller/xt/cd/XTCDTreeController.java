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

import cn.doublepoint.common.application.template.xt.cd.MenuQueryService;
import cn.doublepoint.common.domain.model.viewmodel.xt.VMenu;
import cn.doublepoint.commonutil.domain.model.PageInfo;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseTreeController;

@Controller
@RequestMapping("/template/xt")
public class MenuTreeController extends BaseTreeController {
	// 树根名称
	private final String rooTreeName = "菜单树";

	@Resource
	MenuQueryService xTCDQueryService;

	@RequestMapping("cd/cd-tree/datalist")
	@ResponseBody
	public List<VMenu> getCDTree(@RequestParam(required = false) Boolean isHasRoot) {
		List<VMenu> returnMenuList;
		if (isHasRoot != null && isHasRoot.booleanValue()) {
			VMenu rootCd = new VMenu();
			rootCd.setCdmc(rooTreeName);
			returnMenuList = new ArrayList<VMenu>();
			List<VMenu> childrenMenuList = getChildrenMenuList(null);
			rootCd.setChildrenCDList(childrenMenuList);
			returnMenuList.add(rootCd);
		} else {
			returnMenuList = getChildrenMenuList(null);
		}
		return returnMenuList;
	}

	
	private List<VMenu> getChildrenMenuList(VMenu cd) {
		PageInfo pageRequest = new PageInfo(1, 999999);
		List<VMenu> xTCDList;
		if (cd == null||StringUtil.isNullOrEmpty(cd.getCdbs()))
			xTCDList = xTCDQueryService.findRootMenu(pageRequest).getDataList();
		else
			xTCDList = xTCDQueryService.findChildrenMenu(cd, pageRequest).getDataList();
		if (xTCDList == null) {
			return null;
		} else {
			for (int i = 0; i < xTCDList.size(); i++) {
				xTCDList.get(i).setChildrenCDList(getChildrenMenuList(xTCDList.get(i)));
			}
		}
		return xTCDList;
	}
}
