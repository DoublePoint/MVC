/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月17日
* 
* 类   说   明 ：菜单Tag
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.taglib;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class MenuTag extends TagSupport {
	private final String  templateFileName="menu.ftl";

	private static final long serialVersionUID = 1L;
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		Configuration conf = new Configuration();
//		conf.setServletContextForTemplateLoading(this.pageContext.getServletContext(), "tlds/menu");
//		conf.setClassForTemplateLoading(this.getClass(),"tlds/menu");
		conf.setClassForTemplateLoading(this.getClass(), "/tlds/menu");
//		try {
//			File file=new File(this.getClass().getClassLoader().getResource("tlds/menu").getPath());
//			conf.setDirectoryForTemplateLoading(file);
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		conf.setDefaultEncoding("UTF-8");
        Map<String, Menu> root = new HashMap<String, Menu>();  
        root.put("parameters", new Menu());  
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
        this.pageContext=pageContext;
    }
}
