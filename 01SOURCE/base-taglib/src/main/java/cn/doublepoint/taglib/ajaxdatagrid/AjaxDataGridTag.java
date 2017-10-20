/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月20日
* 
* 类   说   明 ：ajaxdatagrid数据表格标签
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.taglib.ajaxdatagrid;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import cn.doublepoint.common.util.CommonUtil;
import cn.doublepoint.taglib.base.BaseTagSupport;
import cn.doublepoint.taglib.menu.MenuTag;
import freemarker.template.Configuration;
import freemarker.template.Template;

public class AjaxDataGridTag extends BaseTagSupport {
	
	private static final long serialVersionUID = -8732133881974659484L;
	
	private final String TEMPLATE_FILE_NAME="ajaxdatagrid.ftl";
	
	private String type = "";
	private String width = "400px";
	private String height = "300px";
	private String groupField = "";
	private String grouptitle = "";
	private boolean showQueryBar = false;
	private boolean showpagerbar = true;
	private String customtooltipfunc = "";
	private boolean escapeHtml = true;
	private int startyear = 1900;
	Calendar calendar = Calendar.getInstance();
	private int endyear = this.calendar.get(1) + 50;
	private boolean initData = true;
	private boolean showPager = true;
	private boolean supportFilter = false;
	private boolean supportOrder = false;
	private boolean supportToExcel = false;
	private boolean supportToExcelFull = false;
	private boolean supportToPdf = false;
	private boolean supportToPdfFull = false;
	private String postInit;
	private boolean customExport = false;
	private boolean showToolBar = true;
	private boolean supportAdd = true;
	private boolean supportDelete = true;
	private boolean supportRefresh = true;
	private String titleAlign = "center";
	private boolean nowrap = false;
	private int lockedRowNum = 0;
	private int lockedColumnNum = 0;
	private int rowOfPage = 10;
	private boolean clientSortable = true;
	private boolean readonly = false;
	private int largeDataThreshold = 100;
	private String action = "";
	private String url = "";
	private String rowHeight = "200";
	private String preSubmit = "";
	private String postSubmit = "";
	private String onready = "";
	private String rowStyleFunc = "";
	private String cellStyleFunc = "";
	private String queryFunc = "query()";
	private String onContextMenu;
	private String colModelKey;
	private boolean customRowNum = false;
	private boolean showtooltip = false;
	private boolean showtipsonturnpage = true;
	private boolean isexporthidecols = false;
	private List<Map<String, Object>> gridColumnList = new ArrayList();
	private boolean collapseoninit = false;
	
	
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		Configuration conf = new Configuration();
		conf.setClassForTemplateLoading(this.getClass(), "/tlds/ajaxdatagrid");
		conf.setDefaultEncoding("UTF-8");
        Map<String, MenuTag> root = new HashMap<String, MenuTag>();  
		Template tl;
		try {
			tl = conf.getTemplate(TEMPLATE_FILE_NAME);
			tl.process(root, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int doEndTag() throws JspException {
		return super.doEndTag();
	}
	
	public void setStartyear(int startyear) {
		this.startyear = startyear;
	}

	public void setEndyear(int endyear) {
		this.endyear = endyear;
	}

	public void setShowpagerbar(boolean showpagerbar) {
		this.showpagerbar = showpagerbar;
	}
	

	public void setCollapseoninit(boolean collapseoninit) {
		this.collapseoninit = collapseoninit;
	}

	
	public void setSupporttopdffull(boolean supportToPdfFull) {
		this.supportToPdfFull = supportToPdfFull;
	}


	public void setShowtooltip(boolean showtooltip) {
		this.showtooltip = showtooltip;
	}

	public void setCustomrownum(boolean customrownum) {
		this.customRowNum = customrownum;
	}

	

	public void setShowtipsonturnpage(boolean showtipsonturnpage) {
		this.showtipsonturnpage = showtipsonturnpage;
	}
	

	public void setIsexporthidecols(boolean isexporthidecols) {
		this.isexporthidecols = isexporthidecols;
	}

	public void setOncontextmenu(String onContextMenu) {
		this.onContextMenu = onContextMenu;
	}

	

	public void release() {
		super.release();
		this.titleAlign = "center";
		this.nowrap = false;
		this.lockedColumnNum = 0;
		this.lockedRowNum = 0;
		this.rowOfPage = 10;
		this.rowHeight = "22";
		this.clientSortable = true;
		this.width = "400";
		this.height = "300";
		this.groupField = "";
		this.showQueryBar = false;
		this.initData = true;
		this.showPager = true;
		this.supportAdd = false;
		this.supportDelete = false;
		this.supportFilter = false;
		this.supportOrder = false;
		this.supportRefresh = false;
		this.supportToExcel = false;
		this.supportToExcelFull = false;
		this.supportToPdf = false;
		this.supportToPdfFull = false;
		this.customExport = false;
		this.showToolBar = false;
		this.showpagerbar = true;
		this.escapeHtml = true;
		this.collapseoninit = true;
		this.readonly = false;
		this.action = "";
		this.url = "";
		this.preSubmit = "";
		this.postSubmit = "";
		this.onready = "";
		this.largeDataThreshold = 100;
		this.queryFunc = "query";
	}

	public void addColumn(Map<String, Object> columnProp) {
		if (columnProp.get("startyear") != null) {
			setStartyear(((Integer) columnProp.get("startyear")).intValue());
		}
		if (columnProp.get("endyear") != null) {
			setEndyear(((Integer) columnProp.get("endyear")).intValue());
		}
		this.gridColumnList.add(columnProp);
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getId() {
		return this.id;
	}

	public void setgrouptitle(String grouptitle) {
		this.grouptitle = grouptitle;
	}

	public void setGroupfield(String groupField) {
		this.groupField = groupField;
	}

	public void setShowquerybar(boolean showQueryBar) {
		this.showQueryBar = showQueryBar;
	}

	public void setInitdata(boolean initData) {
		this.initData = initData;
	}

	public void setShowpager(boolean showPager) {
		this.showPager = showPager;
	}

	public void setSupportfilter(boolean supportFilter) {
		this.supportFilter = supportFilter;
	}

	public void setSupportorder(boolean supportOrder) {
		this.supportOrder = supportOrder;
	}

	public void setSupporttoexcel(boolean supportToExcel) {
		this.supportToExcel = supportToExcel;
	}

	public void setSupporttoexcelfull(boolean supportToExcelFull) {
		this.supportToExcelFull = supportToExcelFull;
	}

	public void setSupporttopdf(boolean supportToPdf) {
		this.supportToPdf = supportToPdf;
	}

	public void setCustomexport(boolean customExport) {
		this.customExport = customExport;
	}

	public void setShowtoolbar(boolean showToolBar) {
		this.showToolBar = showToolBar;
	}

	public void setSupportadd(boolean supportAdd) {
		this.supportAdd = supportAdd;
	}

	public void setSupportdelete(boolean supportDelete) {
		this.supportDelete = supportDelete;
	}

	public void setSupportrefresh(boolean supportRefresh) {
		this.supportRefresh = supportRefresh;
	}

	public void setNowrap(boolean nowrap) {
		this.nowrap = nowrap;
	}

	public void setTitlealign(String titleAlign) {
		this.titleAlign = titleAlign;
	}

	public void setLockedrownum(int lockedRowNum) {
		this.lockedRowNum = lockedRowNum;
	}

	public void setLockedcolumnnum(int lockedColumnNum) {
		this.lockedColumnNum = lockedColumnNum;
	}

	public void setRowofpage(int rowOfPage) {
		this.rowOfPage = rowOfPage;
	}

	public void setClientsortable(boolean clientSortable) {
		this.clientSortable = clientSortable;
	}

	public void setReadonly(boolean readonly) {
		this.readonly = readonly;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public void setRowheight(String rowHeight) {
		this.rowHeight = rowHeight;
	}

	public void setPresubmit(String preSubmit) {
		this.preSubmit = preSubmit;
	}

	public void setPostsubmit(String postSubmit) {
		this.postSubmit = postSubmit;
	}

	public void setOnready(String onready) {
		this.onready = onready;
	}

	public void setRowstylefunc(String rowStyleFunc) {
		this.rowStyleFunc = rowStyleFunc;
	}

	public void setCellstylefunc(String cellStyleFunc) {
		this.cellStyleFunc = cellStyleFunc;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setLargedatathreshold(int largeDataThreshold) {
		this.largeDataThreshold = largeDataThreshold;
	}

	public void setQueryfunc(String queryFunc) {
		this.queryFunc = queryFunc;
	}

	public void setCustomtooltipfunc(String customtooltipfunc) {
		this.customtooltipfunc = customtooltipfunc;
	}

	public void setColmodelkey(String colModelKey) {
		this.colModelKey = colModelKey;
	}

	public void setPostinit(String postInit) {
		this.postInit = postInit;
	}

	public void setEscapehtml(boolean escapeHtml) {
		this.escapeHtml = escapeHtml;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
