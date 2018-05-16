/** 
 * 创   建   人： 刘磊
 * 
 * 创   建   时   间 ： ${datetime}
 * 
 * 类   说   明 ：${baseModel.entityModel.entityClassName}维护类
 * 
 * 修   改   人：          修   改   日   期：
 */

package cn.doublepoint.common.application.template.sys.?;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.doublepoint.common.constant.XTConstant;
import cn.doublepoint.common.domain.model.entity.sys.${baseModel.entityModel.entityClassName};
import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;

@Service(" ${baseModel.application.annotationApplicationName}")
public class  ${baseModel.application.applicationClassName} implements ${baseModel.application.applicationClassName}Service{

	public boolean saveOrUpdate(${baseModel.entityModel.entityClassName} ${baseModel.entityModel.paramName}) {
		if (${baseModel.entityModel.paramName}.getId() == null)
			${baseModel.entityModel.paramName}.setId(SequenceUtil.getNextVal(${baseModel.entityModel.entityClassName}.class));
		${baseModel.entityModel.paramName}.setCreateTime(new Date());
		JPAUtil.saveOrUpdate(${baseModel.entityModel.paramName});
		return true;
	}

	public boolean remove${baseModel.entityModel.entityClassName}(List<${baseModel.entityModel.entityClassName}> ${baseModel.entityModel.paramListName}) {
		${baseModel.entityModel.paramListName}.stream().forEach(item -> {
			JPAUtil.remove(item);
		});
		return true;
	}
}
