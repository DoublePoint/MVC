/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月7日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.port.adapter.template.persistence.sys.worksheet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import cn.doublepoint.common.util.SequenceUtil;
import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet;

@Service("instanceService")
public class InstanceServiceImpl implements InstanceService {

	private final String SHEET_STATE_RUNNING = "1";// 运行
	private final String SHEET_STATE_SUSPEND = "2";// 挂起
	private final String SHEET_STATE_ABOLISHED = "3";// 作废
	private final String SHEET_STATE_COMPLETE = "4";// 完成
	
	@Autowired
	RestTemplate restTemplate;

	@Override
	public String createAndStart(String classification, String createUser, String description) {
		// 启动流程并返回实例标识
		String instanceId = restTemplate.getForObject(
				"http://localhost:8080/base-workflow-test/template/sys/workflow/model/{id}", String.class, "呜呜呜呜");
		Worksheet worksheet = new Worksheet();
		worksheet.setInstanceId(instanceId);
		worksheet.setWorksheetNo(generateWorksheetNo());
		worksheet.setClassification(classification);
		worksheet.setDescription(description);
		worksheet.setCreateUser(createUser);
		worksheet.setState(SHEET_STATE_RUNNING);
		worksheet.setCreateTime(DateTimeUtil.getCurrentDate());
		worksheet.setModifyTime(DateTimeUtil.getCurrentDate());
		return worksheet.getWorksheetNo();
	}

	/**
	 * 传递工作单
	 * 
	 * @param worksheetNo
	 * @return
	 */
	@Override
	public void transmit(String instanceId) {
		restTemplate.getForObject(
				"http://localhost:8080/base-workflow-test/template/sys/workflow/model/{id}", String.class, "呜呜呜呜");
	}

	/**
	 * 回退工作单
	 * 
	 * @param instanceId
	 * @return
	 */
	@Override
	public void back(String instanceId) {
		
	}

	/**
	 * 作废工作单
	 * 
	 * @param instanceId
	 * @return
	 */
	@Override
	public void abolish(String instanceId) {
		
	}

	/**
	 * 挂起工作单
	 * 
	 * @param instanceId
	 * @return
	 */
	@Override
	public void suspend(String instanceId) {
		
	}

	/**
	 * 工作单挂起之后若需要激活，调用此方法
	 * 
	 * @param instanceId
	 * @return
	 */
	@Override
	public void active(String instanceId) {
		
	}

	@Override
	public String generateWorksheetNo() {
		return SequenceUtil.getNextVal("ll.workflow.worksheetNo").toString();
	}
	
	
}
