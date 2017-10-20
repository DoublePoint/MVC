/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.taglib.ajaxdatagird;

import java.awt.Component;
import java.awt.Container;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;

import org.springframework.cglib.proxy.Dispatcher;

import cn.doublepoint.taglib.base.BaseTagSupport;

public class AjaxDataGridTag extends BaseTagSupport{
	private static final long serialVersionUID = -8732133881974659484L;
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
	  
	  public void setStartyear(int startyear)
	  {
	    this.startyear = startyear;
	  }
	  
	  public void setEndyear(int endyear)
	  {
	    this.endyear = endyear;
	  }
	  
	  public void setShowpagerbar(boolean showpagerbar)
	  {
	    this.showpagerbar = showpagerbar;
	  }
	  
	  private boolean collapseoninit = false;
	  
	  public void setCollapseoninit(boolean collapseoninit)
	  {
	    this.collapseoninit = collapseoninit;
	  }
	  
	  private boolean initData = true;
	  private boolean showPager = true;
	  private boolean supportFilter = false;
	  private boolean supportOrder = false;
	  private boolean supportToExcel = false;
	  private boolean supportToExcelFull = false;
	  private boolean supportToPdf = false;
	  private boolean supportToPdfFull = false;
	  private String postInit;
	  
	  public void setSupporttopdffull(boolean supportToPdfFull)
	  {
	    this.supportToPdfFull = supportToPdfFull;
	  }
	  
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
	  private String rowHeight = CommonUtil.getThemeTagPropertyValue("ajaxgridRowHeight");
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
	  
	  public void setShowtooltip(boolean showtooltip)
	  {
	    this.showtooltip = showtooltip;
	  }
	  
	  public void setCustomrownum(boolean customrownum)
	  {
	    this.customRowNum = customrownum;
	  }
	  
	  private boolean showtipsonturnpage = true;
	  
	  public void setShowtipsonturnpage(boolean showtipsonturnpage)
	  {
	    this.showtipsonturnpage = showtipsonturnpage;
	  }
	  
	  private boolean isexporthidecols = false;
	  
	  public void setIsexporthidecols(boolean isexporthidecols)
	  {
	    this.isexporthidecols = isexporthidecols;
	  }
	  
	  public void setOncontextmenu(String onContextMenu)
	  {
	    this.onContextMenu = onContextMenu;
	  }
	  
	  private List<Map<String, Object>> gridColumnList = new ArrayList();
	  
	  public Component getBean(ValueStack vs, HttpServletRequest req, HttpServletResponse res)
	  {
	    return new AjaxDataGrid(vs, req, res);
	  }
	  
	  public int doStartTag()
	    throws JspException
	  {
	    if ((this.id == null) || ("".equals(this.id))) {
	      this.id = ("ajaxstaticgrid_" + SerialUtils.getSerial(this.pageContext, "ajaxstaticgrid"));
	    }
	    Map<String, String> tagList = (Map)this.pageContext.getAttribute("NAP_PAGE_REQUIRED_TAG");
	    if (tagList != null)
	    {
	      String className = getClass().getName();
	      tagList.put(className, className);
	      if (!"".equals(this.type))
	      {
	        Map<String, String> componentTypeMap = (Map)this.pageContext.getAttribute("NAP_COMPONENT_TYPE");
	        if ((componentTypeMap != null) && 
	          (!componentTypeMap.containsKey(className))) {
	          componentTypeMap.put(className, this.type);
	        }
	      }
	    }
	    try
	    {
	      this.component = getBean(getStack(), 
	        (HttpServletRequest)this.pageContext.getRequest(), 
	        (HttpServletResponse)this.pageContext.getResponse());
	      Container container = Dispatcher.getInstance().getContainer();
	      container.inject(this.component);
	    }
	    catch (Exception localException) {}
	    return 2;
	  }
	  
	  public int doEndTag()
	    throws JspException
	  {
	    populateParams();
	    return super.doEndTag();
	  }
	  
	  protected void populateParams()
	  {
	    super.populateParams();
	    AjaxDataGrid grid = (AjaxDataGrid)this.component;
	    if ((this.width.indexOf("px") == -1) && (this.width.indexOf("%") == -1)) {
	      this.width += "px";
	    }
	    if ((this.height.indexOf("px") == -1) && (this.height.indexOf("%") == -1)) {
	      this.height += "px";
	    }
	    grid.setStartyear(this.startyear);
	    grid.setEndyear(this.endyear);
	    grid.setWidth(this.width);
	    grid.setHeight(this.height);
	    grid.setGroupField(this.groupField);
	    grid.setGrouptitle(this.grouptitle);
	    grid.setClientSortable(this.clientSortable);
	    grid.setShowQueryBar(this.showQueryBar);
	    grid.setInitData(this.initData);
	    grid.setShowPager(this.showPager);
	    grid.setSupportAdd(this.supportAdd);
	    grid.setRowOfPage(this.rowOfPage);
	    grid.setSupportDelete(this.supportDelete);
	    grid.setSupportFilter(this.supportFilter);
	    grid.setSupportOrder(this.supportOrder);
	    grid.setSupportRefresh(this.supportRefresh);
	    grid.setSupportToExcel(this.supportToExcel);
	    grid.setSupportToExcelFull(this.supportToExcelFull);
	    grid.setSupportToPdf(this.supportToPdf);
	    grid.setSupporttopdffull(this.supportToPdfFull);
	    grid.setCustomExport(this.customExport);
	    grid.setShowToolBar(this.showToolBar);
	    grid.setShowpagerbar(this.showpagerbar);
	    grid.setCustomtooltipfunc(this.customtooltipfunc);
	    grid.setCollapseoninit(this.collapseoninit);
	    grid.setTitleAlign(this.titleAlign);
	    grid.setNowrap(this.nowrap);
	    Map<String, String> typeMap = ApplicationUtil.getAppConfig().getAppExtProp();
	    if (("".equals(this.type)) && (typeMap.get("ajaxdatagridType") != null) && (!"default".equals(typeMap.get("ajaxdatagridType")))) {
	      this.type = ((String)typeMap.get("ajaxdatagridType"));
	    }
	    grid.setType(this.type);
	    grid.setReadonly(this.readonly);
	    grid.setLockedColumnNum(this.lockedColumnNum);
	    grid.setLockedRowNum(this.lockedRowNum);
	    boolean flag = false;
	    for (Map<String, Object> map : this.gridColumnList) {
	      for (Map.Entry<String, Object> entry : map.entrySet()) {
	        if ("width".equals(entry.getKey()))
	        {
	          String value = entry.getValue();
	          if (value.indexOf("%") != -1)
	          {
	            flag = true;
	            break;
	          }
	        }
	      }
	    }
	    if (flag) {
	      grid.setPercentLayout(true);
	    }
	    grid.setGridColumnList(this.gridColumnList);
	    grid.setAction(this.action);
	    grid.setUrl(this.url);
	    grid.setEscapeHtml(this.escapeHtml);
	    grid.setRowHeight(this.rowHeight);
	    grid.setPreSubmit(this.preSubmit);
	    grid.setPostSubmit(this.postSubmit);
	    grid.setOnready(this.onready);
	    grid.setRowStyleFunc(this.rowStyleFunc);
	    grid.setCellStyleFunc(this.cellStyleFunc);
	    grid.setQueryFunc(this.queryFunc);
	    grid.setColModelKey(this.colModelKey);
	    grid.setContextPath(((HttpServletRequest)this.pageContext.getRequest()).getContextPath());
	    grid.setLargeDataThreshold(this.largeDataThreshold);
	    grid.setOnContextMenu(this.onContextMenu);
	    grid.setPageContext(this.pageContext);
	    grid.setPostinit(this.postInit);
	    grid.setCustomrownum(this.customRowNum);
	    grid.setShowtooltip(this.showtooltip);
	    grid.setShowtipsonturnpage(this.showtipsonturnpage);
	    grid.setIsexporthidecols(this.isexporthidecols);
	    ValidateUtils validateUtil = (ValidateUtils)this.pageContext.getAttribute("NAP_VALIDATE_UTIL");
	    grid.setValidateUtil(validateUtil);
	    Object tagList = (Map)this.pageContext
	      .getAttribute("NAP_PAGE_REQUIRED_TAG");
	    grid.setTagList((Map)tagList);
	  }
	  
	  public void release()
	  {
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
	  
	  public String getTagDescription()
	  {
	    String theDescrip = new String();
	    theDescrip = "��������1.0.0  ����������2011-11-01";
	    return theDescrip;
	  }
	  
	  public String getTagResources(String contextPath)
	  {
	    StringBuffer pathBuffer = new StringBuffer();
	    
	    String componentType = "";
	    if (contextPath.indexOf("$") != -1)
	    {
	      String[] path = contextPath.split("\\$");
	      contextPath = path[0];
	      componentType = path[1];
	    }
	    String cssPath = contextPath + "/css/css/" + ApplicationUtil.getAppConfig().getTheme() + "/ajaxdatagrid/ajaxdatagrid.css";
	    pathBuffer.append("<link type=\"text/css\" rel=\"stylesheet\" href=\"" + 
	      cssPath + "\">\r\n");
	    
	    Map<String, String> map = ApplicationUtil.getAppConfig().getAppExtProp();
	    if (!"".equals(componentType))
	    {
	      cssPath = contextPath + "/css/css/" + ApplicationUtil.getAppConfig().getTheme() + "/ajaxdatagrid/" + componentType + ".css";
	      pathBuffer.append("<link type=\"text/css\" rel=\"stylesheet\" href=\"" + 
	        cssPath + "\">\r\n");
	    }
	    else if ((map.get("ajaxdatagridType") != null) && (!"default".equals(map.get("ajaxdatagridType"))) && (!"".equals(map.get("ajaxdatagridType"))))
	    {
	      cssPath = contextPath + "/css/css/" + ApplicationUtil.getAppConfig().getTheme() + "/ajaxdatagrid/" + (String)map.get("ajaxdatagridType") + ".css";
	      pathBuffer.append("<link type=\"text/css\" rel=\"stylesheet\" href=\"" + 
	        cssPath + "\">\r\n");
	    }
	    pathBuffer.append("<script src=\"" + contextPath + 
	      "/template/" + "haiyisoft" + "/ajaxdatagrid/grid.js\"></script>\r\n");
	    pathBuffer.append("<script src=\"" + contextPath + 
	      "/template/" + "haiyisoft" + "/ajaxdatagrid/store.js\"></script>\r\n");
	    if (CssExtLoadUtil.getInstance().isContainJs("ajaxdatagrid.js"))
	    {
	      String jsPath = "";
	      String jsScanPath = CssExtLoadUtil.getInstance().getJsScanPath();
	      if (!jsScanPath.startsWith("/")) {
	        jsScanPath = "/" + jsScanPath;
	      }
	      jsPath = contextPath + jsScanPath + "/ajaxdatagrid.js";
	      pathBuffer.append("<script src=\"" + jsPath + "\"></script>\r\n");
	    }
	    return pathBuffer.toString();
	  }
	  
	  public void addColumn(Map<String, Object> columnProp)
	  {
	    if (columnProp.get("startyear") != null) {
	      setStartyear(((Integer)columnProp.get("startyear")).intValue());
	    }
	    if (columnProp.get("endyear") != null) {
	      setEndyear(((Integer)columnProp.get("endyear")).intValue());
	    }
	    this.gridColumnList.add(columnProp);
	  }
	  
	  public void setWidth(String width)
	  {
	    this.width = width;
	  }
	  
	  public void setHeight(String height)
	  {
	    this.height = height;
	  }
	  
	  public String getId()
	  {
	    return this.id;
	  }
	  
	  public void setgrouptitle(String grouptitle)
	  {
	    this.grouptitle = grouptitle;
	  }
	  
	  public void setGroupfield(String groupField)
	  {
	    this.groupField = groupField;
	  }
	  
	  public void setShowquerybar(boolean showQueryBar)
	  {
	    this.showQueryBar = showQueryBar;
	  }
	  
	  public void setInitdata(boolean initData)
	  {
	    this.initData = initData;
	  }
	  
	  public void setShowpager(boolean showPager)
	  {
	    this.showPager = showPager;
	  }
	  
	  public void setSupportfilter(boolean supportFilter)
	  {
	    this.supportFilter = supportFilter;
	  }
	  
	  public void setSupportorder(boolean supportOrder)
	  {
	    this.supportOrder = supportOrder;
	  }
	  
	  public void setSupporttoexcel(boolean supportToExcel)
	  {
	    this.supportToExcel = supportToExcel;
	  }
	  
	  public void setSupporttoexcelfull(boolean supportToExcelFull)
	  {
	    this.supportToExcelFull = supportToExcelFull;
	  }
	  
	  public void setSupporttopdf(boolean supportToPdf)
	  {
	    this.supportToPdf = supportToPdf;
	  }
	  
	  public void setCustomexport(boolean customExport)
	  {
	    this.customExport = customExport;
	  }
	  
	  public void setShowtoolbar(boolean showToolBar)
	  {
	    this.showToolBar = showToolBar;
	  }
	  
	  public void setSupportadd(boolean supportAdd)
	  {
	    this.supportAdd = supportAdd;
	  }
	  
	  public void setSupportdelete(boolean supportDelete)
	  {
	    this.supportDelete = supportDelete;
	  }
	  
	  public void setSupportrefresh(boolean supportRefresh)
	  {
	    this.supportRefresh = supportRefresh;
	  }
	  
	  public void setNowrap(boolean nowrap)
	  {
	    this.nowrap = nowrap;
	  }
	  
	  public void setTitlealign(String titleAlign)
	  {
	    this.titleAlign = titleAlign;
	  }
	  
	  public void setLockedrownum(int lockedRowNum)
	  {
	    this.lockedRowNum = lockedRowNum;
	  }
	  
	  public void setLockedcolumnnum(int lockedColumnNum)
	  {
	    this.lockedColumnNum = lockedColumnNum;
	  }
	  
	  public void setRowofpage(int rowOfPage)
	  {
	    this.rowOfPage = rowOfPage;
	  }
	  
	  public void setClientsortable(boolean clientSortable)
	  {
	    this.clientSortable = clientSortable;
	  }
	  
	  public void setReadonly(boolean readonly)
	  {
	    this.readonly = readonly;
	  }
	  
	  public void setAction(String action)
	  {
	    this.action = action;
	  }
	  
	  public void setRowheight(String rowHeight)
	  {
	    this.rowHeight = rowHeight;
	  }
	  
	  public void setPresubmit(String preSubmit)
	  {
	    this.preSubmit = preSubmit;
	  }
	  
	  public void setPostsubmit(String postSubmit)
	  {
	    this.postSubmit = postSubmit;
	  }
	  
	  public void setOnready(String onready)
	  {
	    this.onready = onready;
	  }
	  
	  public void setRowstylefunc(String rowStyleFunc)
	  {
	    this.rowStyleFunc = rowStyleFunc;
	  }
	  
	  public void setCellstylefunc(String cellStyleFunc)
	  {
	    this.cellStyleFunc = cellStyleFunc;
	  }
	  
	  public void setUrl(String url)
	  {
	    this.url = url;
	  }
	  
	  public void setLargedatathreshold(int largeDataThreshold)
	  {
	    this.largeDataThreshold = largeDataThreshold;
	  }
	  
	  public void setQueryfunc(String queryFunc)
	  {
	    this.queryFunc = queryFunc;
	  }
	  
	  public void setCustomtooltipfunc(String customtooltipfunc)
	  {
	    this.customtooltipfunc = customtooltipfunc;
	  }
	  
	  public void setColmodelkey(String colModelKey)
	  {
	    this.colModelKey = colModelKey;
	  }
	  
	  public void setPostinit(String postInit)
	  {
	    this.postInit = postInit;
	  }
	  
	  public void setEscapehtml(boolean escapeHtml)
	  {
	    this.escapeHtml = escapeHtml;
	  }
	  
	  public String getType()
	  {
	    return this.type;
	  }
	  
	  public void setType(String type)
	  {
	    this.type = type;
	  }
}
