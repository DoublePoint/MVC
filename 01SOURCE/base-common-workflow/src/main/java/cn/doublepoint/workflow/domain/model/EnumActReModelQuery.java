package cn.doublepoint.workflow.domain.model;
public enum EnumActReModelQuery {
	id("id"), 
	category("category"), 
	createTime("createTime"), 
	deploymentId("deploymentId"), 
	editorSourceExtraValueId("editorSourceExtraValueId"), 
	editorSourceValueId("editorSourceValueId"), 
	key("key"),
	lastUpdateTime("lastUpdateTime"), 
	metaInfo("metaInfo"), 
	name("name"), 
	rev("rev"), 
	tenantId("tenantId"), 
	version("version");

	private EnumActReModelQuery(String p) { 
    }
}