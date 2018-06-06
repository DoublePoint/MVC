/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月29日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package a_helloworld;

import java.util.List;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.db.DbSchemaCreate;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:/workflow-beans/*.xml"})
public class TestHelloWorld {
	
	@Autowired
	public RepositoryService repositoryService;
	
	@Autowired
	public RuntimeService runtimeService;
	
	@Autowired
	public TaskService taskService;
	
	@Test
	public void initDatabase(){
		DbSchemaCreate.main(null);
	}
	
	//部署流程定义
	@Test
	public void deploy(){
		repositoryService
		.createDeployment()
		.addClasspathResource("diagrams/leave.bpmn")
		.deploy();
		System.out.println("部署成功!");
	}
	
	//启动流程实例
	@Test
	public void startProcess(){
		ProcessInstance processInstance=runtimeService.startProcessInstanceByKey("leave");
		System.out.println(processInstance.getId()+"-------"+processInstance.getActivityId());
		//12501-------deptLeaderAudit
		System.out.println("启动流程实例成功!");
	}
	
	//查看我的个人任务
	@Test
	public void getMyTaskList(){
		List<Task> tasks=taskService.createTaskQuery()
			.list();
		
		tasks.stream().forEach(task->{
			System.out.println(" taskId:"+task.getId()+"  ---"+task.getName());
		});
		System.out.println("查看我的个人任务成功!");
	}
	
	//完成我的个人任务
	@Test
	public void completeTask(){
		String taskId="17504";//17504
		taskService.setVariable(taskId,"hrPass",true);
		taskService.complete(taskId);
		System.out.println("完成我的个人任务成功!");
	}
}
