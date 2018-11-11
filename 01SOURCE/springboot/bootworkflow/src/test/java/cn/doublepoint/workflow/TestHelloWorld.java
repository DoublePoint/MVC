package cn.doublepoint.workflow;

import org.activiti.engine.impl.db.DbSchemaCreate;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
public class TestHelloWorld {
	
	@Test
	public void initDatabase(){
		DbSchemaCreate.main(null);
	}
}
