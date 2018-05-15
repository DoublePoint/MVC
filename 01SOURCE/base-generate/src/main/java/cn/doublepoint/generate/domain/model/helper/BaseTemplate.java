/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月15日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.generate.domain.model.helper;

public class BaseTemplate {
	private TemplateEntityModel entityModel;
	private TemplateJsp jsp;
	private TemplateDialogJsp dialogJsp;
	private TemplateScript script;
	private TemplateDialogScript dialogScript;
	private TemplateApplication application;
	private TemplateController action;

	public BaseTemplate(TemplateEntityModel entityModel) {
		super();
		this.entityModel = entityModel;

		this.jsp=new TemplateJsp(entityModel);
		this.dialogJsp=new TemplateDialogJsp(entityModel);
		this.script=new TemplateScript(entityModel);
		this.dialogScript=new TemplateDialogScript(entityModel);
		this.application=new TemplateApplication(entityModel);
		this.action=new TemplateController(entityModel);

	}

	public TemplateEntityModel getEntityModel() {
		return entityModel;
	}

	public void setEntityModel(TemplateEntityModel entityModel) {
		this.entityModel = entityModel;
	}

	public TemplateJsp getJsp() {
		return jsp;
	}

	public void setJsp(TemplateJsp jsp) {
		this.jsp = jsp;
	}

	public TemplateScript getScript() {
		return script;
	}

	public void setScript(TemplateScript script) {
		this.script = script;
	}

	public TemplateApplication getApplication() {
		return application;
	}

	public void setApplication(TemplateApplication application) {
		this.application = application;
	}

	public TemplateController getAction() {
		return action;
	}

	public void setAction(TemplateController action) {
		this.action = action;
	}

	public TemplateDialogJsp getDialogJsp() {
		return dialogJsp;
	}

	public void setDialogJsp(TemplateDialogJsp dialogJsp) {
		this.dialogJsp = dialogJsp;
	}

	public TemplateDialogScript getDialogScript() {
		return dialogScript;
	}

	public void setDialogScript(TemplateDialogScript dialogScript) {
		this.dialogScript = dialogScript;
	}

}
