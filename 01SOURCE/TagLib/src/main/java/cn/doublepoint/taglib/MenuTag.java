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

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class MenuTag extends SimpleTagSupport {

	@Override
	public void doTag() throws JspException, IOException {
		 JspWriter out = getJspContext().getOut();
		 out.println("Hello Custom Tag!");
	}

	@Override
	protected JspFragment getJspBody() {
		// TODO Auto-generated method stub
		return super.getJspBody();
	}

	@Override
	protected JspContext getJspContext() {
		// TODO Auto-generated method stub
		return super.getJspContext();
	}

	@Override
	public JspTag getParent() {
		// TODO Auto-generated method stub
		return super.getParent();
	}

	@Override
	public void setJspBody(JspFragment jspBody) {
		// TODO Auto-generated method stub
		super.setJspBody(jspBody);
	}

	@Override
	public void setJspContext(JspContext pc) {
		// TODO Auto-generated method stub
		super.setJspContext(pc);
	}

	@Override
	public void setParent(JspTag parent) {
		// TODO Auto-generated method stub
		super.setParent(parent);
	}

}
