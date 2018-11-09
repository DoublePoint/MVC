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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSONObject;

import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.dto.domain.model.vo.workflow.VOActReModel;
import cn.doublepoint.dto.domain.model.vo.workflow.VOActReModelQuery;
import cn.doublepoint.workflow.util.WorksheetUtil;

@Service("llModelService")
public class ModelServiceImpl implements ModelService {

	//启动一个工作流URL
	private final String START_INSTANCE_URL="/runtime/process-instances";

	@Autowired
	RestTemplate restTemplate;
	
	@Override
	public AjaxDataWrap<VOActReModel> retrieve(VOActReModelQuery query) {
		String  requestString=JSONObject.toJSONString(query.getRequest());
		HttpHeaders headers = new HttpHeaders(); 
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestBody=new HttpEntity<>(requestString,headers);
		// 启动流程并返回实例标识
		AjaxDataWrap<VOActReModel> response = restTemplate.exchange(WorksheetUtil.getWorkflowUrl()+START_INSTANCE_URL, 
                HttpMethod.POST, 
                requestBody, 
                new ParameterizedTypeReference<AjaxDataWrap<VOActReModel>>() {}).getBody();
		return response;
	}
}
