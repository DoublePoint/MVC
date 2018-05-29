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

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.impl.db.DbSchemaCreate;
import org.junit.Test;

public class TestHelloWorld {
	
	ProcessEngine pe=ProcessEngines.getDefaultProcessEngine();
	
	@Test
	public void initDatabase(){
		DbSchemaCreate.main(null);
	}
	
	@Test
	public void deploy(){
		pe.getRepositoryService()
		.createDeployment()
		.addClasspathResource("diagrams/test1.bpmn")
		.deploy();
	}
}
