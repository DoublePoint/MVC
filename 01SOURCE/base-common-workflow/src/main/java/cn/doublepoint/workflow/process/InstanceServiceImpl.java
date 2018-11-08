/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年6月7日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.workflow.process;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSONObject;

import cn.doublepoint.commonutil.DateTimeUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.ajaxmodel.PageInfo;
import cn.doublepoint.commonutil.domain.model.CommonBeanUtils;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;
import cn.doublepoint.template.dto.domain.model.entity.sys.Worksheet;
import cn.doublepoint.workflow.util.WorksheetUtil;

@Service("instanceService")
public class InstanceServiceImpl implements InstanceService {
	
	//启动一个工作流URL
	private final String START_INSTANCE_URL="/runtime/process-instances";

	@Autowired
	private WorksheetService worksheetService;
	
	@Autowired
	RestTemplate restTemplate;

	/**
	 * 启动线程，待成功后创建工作单
	 */
	@Override
	public String createAndStart(String classification, String createUser, String description) {
		ProcessInstanceCreateRequest request=new ProcessInstanceCreateRequest();
		request.setProcessDefinitionKey(classification);
		String  requestString=JSONObject.toJSONString(request);
		HttpHeaders headers = new HttpHeaders(); 
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestBody=new HttpEntity<>(requestString,headers);
		
		// 启动流程并返回实例标识
		ProcessInstanceResponse response = restTemplate.exchange(WorksheetUtil.getWorkflowUrl()+START_INSTANCE_URL, 
                HttpMethod.POST, 
                requestBody, 
                new ParameterizedTypeReference<ProcessInstanceResponse>() {}).getBody();
		
		Worksheet worksheet = new Worksheet();
		worksheet.setInstanceId(response.getId());
		worksheet.setId(SequenceUtil.getNextVal(Worksheet.class));
		worksheet.setWorksheetNo(generateWorksheetNo());
		worksheet.setClassification(classification);
		worksheet.setDescription(description);
		worksheet.setCreateUser(createUser);
		worksheet.setState(WorksheetConstant.SHEET_STATE_RUNNING);
		worksheet.setCreateTime(DateTimeUtil.getCurrentDate());
		worksheet.setModifyTime(DateTimeUtil.getCurrentDate());
		worksheetService.create(worksheet);
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
				"http://localhost:8080/base-workflow-test/template/sys/workflow/transmit/{id}", String.class,instanceId);
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

	@Override
	public List<Worksheet> getPersonalWorksheetList(Worksheet worksheet, PageInfo pageInfo) {
		StringBuffer sBuffer=new StringBuffer();
		QueryParamList queryParamList=new QueryParamList();
		sBuffer.append(" select ws from  Worksheet ws where 1=1");
		if(worksheet!=null){
			if(!StringUtil.isNullOrEmpty(worksheet.getWorksheetNo())){
				sBuffer.append(" and ws.worksheetNo=:worksheetNo");
				queryParamList.addParam("worksheetNo", worksheet.getWorksheetNo());
			}
			if(!StringUtil.isNullOrEmpty(worksheet.getState())){
				sBuffer.append(" and ws.state=:state");
				queryParamList.addParam("state", worksheet.getState());
			}
		}
		List<Object> sourceList=JPAUtil.executeQuery(sBuffer.toString(), queryParamList, pageInfo);
		return CommonBeanUtils.copyTo(sourceList, Worksheet.class);
	}
	

	@Override
	public List<VOTask> getHistoricTasks(String instanceId){
		AjaxResponse response= restTemplate.exchange("http://localhost:8080/base-workflow-test/workflow/instance/{id}/history/task", 
                HttpMethod.GET, 
                null, 
                new ParameterizedTypeReference<AjaxResponse>() {},
                instanceId).getBody();
		Object object=response.getParameterMap().get("dataWrap");
		AjaxDataWrap<VOTask> dataWrap=(AjaxDataWrap<VOTask>)object;
		return dataWrap.getDataList();
	}
}
