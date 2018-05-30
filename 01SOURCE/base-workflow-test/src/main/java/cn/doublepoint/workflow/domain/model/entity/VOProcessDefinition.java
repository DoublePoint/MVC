/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月30日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.workflow.domain.model.entity;

import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.impl.form.StartFormHandler;
import org.activiti.engine.impl.persistence.entity.SuspensionState;

import cn.doublepoint.commonutil.domain.model.BaseModel;

public class VOProcessDefinition extends BaseModel{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String key;
	public int revision = 1;
	public int version;
	public String category;
	public String deploymentId;
	public String resourceName;
	public String tenantId = ProcessEngineConfiguration.NO_TENANT_ID;
	public Integer historyLevel;
	public StartFormHandler startFormHandler;
	public String diagramResourceName;
	public boolean isGraphicalNotationDefined;
	public boolean hasStartFormKey;
	public int suspensionState = SuspensionState.ACTIVE.getStateCode();
	public boolean isIdentityLinksInitialized = false;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getRevision() {
		return revision;
	}

	public void setRevision(int revision) {
		this.revision = revision;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDeploymentId() {
		return deploymentId;
	}

	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public Integer getHistoryLevel() {
		return historyLevel;
	}

	public void setHistoryLevel(Integer historyLevel) {
		this.historyLevel = historyLevel;
	}

	public StartFormHandler getStartFormHandler() {
		return startFormHandler;
	}

	public void setStartFormHandler(StartFormHandler startFormHandler) {
		this.startFormHandler = startFormHandler;
	}

	public String getDiagramResourceName() {
		return diagramResourceName;
	}

	public void setDiagramResourceName(String diagramResourceName) {
		this.diagramResourceName = diagramResourceName;
	}

	public boolean isGraphicalNotationDefined() {
		return isGraphicalNotationDefined;
	}

	public void setGraphicalNotationDefined(boolean isGraphicalNotationDefined) {
		this.isGraphicalNotationDefined = isGraphicalNotationDefined;
	}

	public boolean isHasStartFormKey() {
		return hasStartFormKey;
	}

	public void setHasStartFormKey(boolean hasStartFormKey) {
		this.hasStartFormKey = hasStartFormKey;
	}

	public int getSuspensionState() {
		return suspensionState;
	}

	public void setSuspensionState(int suspensionState) {
		this.suspensionState = suspensionState;
	}

	public boolean isIdentityLinksInitialized() {
		return isIdentityLinksInitialized;
	}

	public void setIdentityLinksInitialized(boolean isIdentityLinksInitialized) {
		this.isIdentityLinksInitialized = isIdentityLinksInitialized;
	}

}
