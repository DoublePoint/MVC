/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月17日
* 
* 类   说   明 ：菜单Tag
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.taglib.menu;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import cn.doublepoint.taglib.base.BaseTagSupport;
import freemarker.template.Configuration;
import freemarker.template.Template;

public class MenuTag extends BaseTagSupport {
	private String id;

	private String style;

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	private final String templateFileName = "menu.ftl";

	private static final long serialVersionUID = 1L;

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		Configuration conf = new Configuration();
		conf.setClassForTemplateLoading(this.getClass(), "/ftls/menu");
		conf.setDefaultEncoding("UTF-8");
		Map<String, MenuTag> root = new HashMap<String, MenuTag>();
		root.put("menu", this);
		Template tl;
		try {
			tl = conf.getTemplate(templateFileName);
			tl.process(root, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	private PageContext pageContext;

	@Override
	public void setPageContext(PageContext pageContext) {
		this.pageContext = pageContext;
	}
}
