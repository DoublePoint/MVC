/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年11月18日
* 
* 类   说   明 ：菜单树
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.persistence.sys.department;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublepoint.commonutil.ajaxmodel.TreeNodeBean;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.port.adapter.controller.request.BaseTreeController;
import cn.doublepoint.dto.domain.model.entity.sys.SysDepartment;
import cn.doublepoint.dto.domain.model.vo.query.PageInfo;

@Controller
@RequestMapping("sys")
public class DepartmentTreeController extends BaseTreeController {

	@Resource
	DepartmentService departmentService;
	
	@RequestMapping("/department/label")
	@ResponseBody
	public String getDepartmentTree(@RequestParam(required=true)String code) {
		try{
			SysDepartment department = departmentService.getById(Integer.valueOf(code));
			return department.getName();
		}
		catch(Exception e){
			return code;
		}
	}

	@RequestMapping("/department-tree/departments")
	@ResponseBody
	public List<TreeNodeBean> getDepartmentTree(@RequestBody(required=false)TreeNodeBean node,
			@RequestParam(required = false) Boolean isHasRoot) {
		Integer code=null;
		if(node!=null&&node.getCode()!=null)
			code=Integer.valueOf(node.getCode());
		List<TreeNodeBean> returnDepartmentList2 = new ArrayList<TreeNodeBean>();
		if (code==null) {
			List<SysDepartment> departments = getChildrenDepartmentList(0);
			if(departments==null||departments.size()==0)
				return returnDepartmentList2;
			returnDepartmentList2 = departments.stream().map(department -> {
				TreeNodeBean nodeBean = new TreeNodeBean();
				nodeBean.setName(department.getName());
				if (!isHasChild(department.getId()))
					nodeBean.setIsLeaf(true);
				else {
					nodeBean.setIsLeaf(false);
				}
				nodeBean.setCode(String.valueOf(department.getId()));
				nodeBean.setNodeBean(department);
				return nodeBean;
			}).collect(java.util.stream.Collectors.toList());
		} else {
			List<SysDepartment> departments = getChildrenDepartmentList(code);
			returnDepartmentList2 = departments.stream().map(department -> {
				TreeNodeBean nodeBean = new TreeNodeBean();
				nodeBean.setName(department.getName());
				if (!isHasChild(department.getId()))
					nodeBean.setIsLeaf(true);
				else {
					nodeBean.setIsLeaf(false);
				}
				nodeBean.setCode(String.valueOf(department.getId()));
				nodeBean.setNodeBean(department);
				return nodeBean;
			}).collect(java.util.stream.Collectors.toList());
		}
		return returnDepartmentList2;
	}

	private boolean isHasChild(Integer id) {
		return departmentService.getChildrenCount(id) > 0;
	}

	private List<SysDepartment> getChildrenDepartmentList(Integer id) {
		PageInfo pageRequest = new PageInfo(1, 999999);
		List<SysDepartment> departmentList;
		SysDepartment query = new SysDepartment();
		query.setId(id);
		departmentList = CommonBeanUtils.copyTo(departmentService.findChildrenDepartment(query, pageRequest), SysDepartment.class);
		return departmentList;
	}
}
