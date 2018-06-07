/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月7日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package process;

import java.util.ArrayList;
import java.util.List;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.template.dto.domain.model.entity.workflow.VOProcessDefinition;

@Service
public class ProcessServiceImpl implements ProcessService {
	 @Autowired
	 protected RepositoryService repositoryService;

	public List<VOProcessDefinition> getProcessList() {
		List<VOProcessDefinition> processDefinitionList=new ArrayList<VOProcessDefinition>();
    	List<ProcessDefinition> source = repositoryService.createProcessDefinitionQuery().orderByDeploymentId().desc().list();
    	processDefinitionList=CommonBeanUtils.copyTo(source, VOProcessDefinition.class);
    	return processDefinitionList;
	}

}
