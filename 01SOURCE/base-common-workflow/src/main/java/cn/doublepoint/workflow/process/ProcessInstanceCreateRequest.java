package cn.doublepoint.workflow.process;

import java.util.List;

import org.springframework.util.StringUtils;

public class ProcessInstanceCreateRequest {

  private String processDefinitionId;
  private String processDefinitionKey;
  private String message;
  private String businessKey;
  private List<RestVariable> variables;
  private String tenantId;
  
  private boolean returnVariables;
  
  public String getProcessDefinitionId() {
    return processDefinitionId;
  }
  
  public void setProcessDefinitionId(String processDefinitionId) {
    this.processDefinitionId = processDefinitionId;
  }
  
  public String getProcessDefinitionKey() {
    return processDefinitionKey;
  }
  
  public void setProcessDefinitionKey(String processDefinitionKey) {
    this.processDefinitionKey = processDefinitionKey;
  }
  
  public String getBusinessKey() {
    return businessKey;
  }
  
  public void setBusinessKey(String businessKey) {
    this.businessKey = businessKey;
  }
  public String getMessage() {
    return message;
  }
  public void setMessage(String message) {
    this.message = message;
  }
  
  public void setTenantId(String tenantId) {
	  this.tenantId = tenantId;
  }
  
  public String getTenantId() {
	  return tenantId;
  }
  
  public List<RestVariable> getVariables() {
    return variables;
  }
  
  public void setVariables(List<RestVariable> variables) {
    this.variables = variables;
  }
  
  public boolean isCustomTenantSet() {
  	return tenantId != null && !StringUtils.isEmpty(tenantId);
  }
  
  public boolean getReturnVariables() {
	  return returnVariables;
  }
  
  public void setReturnVariables(boolean returnVariables) {
	  this.returnVariables = returnVariables;
  }
}
