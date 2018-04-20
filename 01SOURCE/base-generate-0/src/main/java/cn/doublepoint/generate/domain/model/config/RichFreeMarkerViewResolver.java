/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年1月5日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.generate.domain.model.config;

import org.springframework.web.servlet.view.AbstractTemplateViewResolver;
import org.springframework.web.servlet.view.AbstractUrlBasedView;

/**
 * ViewResolver for RichFreeMarkerView
 * 
 * Override buildView, if viewName start with / , then ignore prefix.
 */
public class RichFreeMarkerViewResolver extends AbstractTemplateViewResolver {
	/**
	 * Set default viewClass
	 */
	public RichFreeMarkerViewResolver() {
		setViewClass(RichFreeMarkerView.class);
	}

	/**
	 * if viewName start with / , then ignore prefix.
	 */
	@Override
	protected AbstractUrlBasedView buildView(String viewName) throws Exception {
		AbstractUrlBasedView view = super.buildView(viewName);
		// start with / ignore prefix
		if (viewName.startsWith("/")) {
			view.setUrl(viewName + getSuffix());
		}
		return view;
	}
}
