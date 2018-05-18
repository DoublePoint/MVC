/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年3月31日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.web.port.adapter.template.service.controller.sys.generate;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.doublepoint.common.application.template.sys.entity.EntityFilterQueryService;
import cn.doublepoint.common.domain.model.entity.sys.EntityFilter;
import cn.doublepoint.common.domain.model.entity.sys.MySQLTables;
import cn.doublepoint.common.port.adapter.template.persistence.sys.common.DataBaseMetaDataUtil;
import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.file.DownloadFileUtil;
import cn.doublepoint.commonutil.file.ZipUtil;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;
import cn.doublepoint.generate.EGenerateType;
import cn.doublepoint.generate.GenerateServiceTemplateUtil;
import cn.doublepoint.generate.GenerateEntityTemplateUtil;
import cn.doublepoint.generate.GenerateServiceImplTemplateUtil;
import cn.doublepoint.generate.GenerateTemplateUtil;
import cn.doublepoint.generate.domain.model.helper.BaseTemplate;
import cn.doublepoint.generate.domain.model.helper.TemplateEntityModel;
import freemarker.template.TemplateException;

@Controller
public class GenerateEntityHandleController extends BaseHandleController {
	@Resource
	EntityFilterQueryService efQueryService;

	private final String oomDirPath = "oom";
	
	@RequestMapping("/template/sys/tables")
	@ResponseBody
	public AjaxDataWrap<MySQLTables> getTables() {
		List<MySQLTables> list = DataBaseMetaDataUtil.getTables();
		AjaxDataWrap<MySQLTables> dataWrap = new AjaxDataWrap<>();
		dataWrap.setDataList(list);
		return dataWrap;
	}

	/**
	 * 导入文件 并返回文件中的所有表
	 * @param request
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/template/sys/getFileTable")
	@ResponseBody
	public void getFileTable(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		try {
			String oomName = UUID.randomUUID() + ".oom";
			File filev = new File(getOomDirPath(request) + "/" + oomName);
			file.transferTo(filev);

			List<TemplateEntityModel> beanModelList = GenerateTemplateUtil.buildTableNameList(filev);
			AjaxDataWrap<TemplateEntityModel> ajaxDataWrap = new AjaxDataWrap<TemplateEntityModel>();
			ajaxDataWrap.setDataList(beanModelList);
			responseData.setAjaxParameter("ajaxDataWrap", ajaxDataWrap);
			responseData.setAjaxParameter("oomName", oomName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成该实体的各个源文件
	 * @param request
	 * @throws TemplateException
	 * @throws IOException
	 */
	@RequestMapping("/template/sys/assistant/generate")
	@ResponseBody
	public void generate(HttpServletRequest request) throws TemplateException, IOException {
		
		String oomName=request.getParameter("oomName");
		if (!StringUtil.isNullOrEmpty(oomName)) {
			List<GenerateTemplateUtil> templateUtils=new ArrayList<>();
			templateUtils.add(new GenerateEntityTemplateUtil());
			templateUtils.add(new GenerateServiceTemplateUtil());
			templateUtils.add(new GenerateServiceImplTemplateUtil());
			
			File file = new File(getOomDirPath(request) + oomName);
			List<BaseTemplate> models = GenerateTemplateUtil.buildTemplateModelList(file);

			String generateDir = UUID.randomUUID().toString();
			String generateDirPath = generateDirPath(request, generateDir);
			
			templateUtils.stream().forEach(util->{
				util.generateFile(models, generateDirPath);
			});

			responseData.setAjaxParameter("generateDir", generateDir);
		}
	}

	
	/**
	 * 源文件详细信息页面
	 * @param request
	 * @return
	 * @throws TemplateException
	 * @throws IOException
	 */
	@RequestMapping("/template/sys/assistant/generateDetail")
	public String generateDetail(HttpServletRequest request) throws TemplateException, IOException {
		Map<String, String> map = new HashMap<String, String>();
		getEntityContent(request, map);
		getServiceContent(request, map);
		getServiceImplContent(request, map);
		responseData.setAjaxParameter("map", map);
		return "/template/sys/assistant/generateDetail";
	}

	/**
	 * 压缩并下载源文件
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/template/sys/assistant/zipAndDownload")
	public void zipAndDownload1(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String generateDir=request.getParameter("generateDir");
		String fileZip = getTempDir(request) + generateDir + ".zip";
		// 文件输出流
		FileOutputStream outStream = new FileOutputStream(fileZip);
		// 压缩流
		ZipUtil.toZip(getTempDir(request) + generateDir, outStream, true);

		DownloadFileUtil.download(response, fileZip, "实体映射包.zip");
	}

	/**
	 * 获取EntityContent
	 * 
	 * @param request
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	private void getEntityContent(HttpServletRequest request, Map<String, String> map) throws IOException {
		String generateDir=request.getParameter("generateDir");
		String tableName=request.getParameter("tableName");
		if (!StringUtil.isNullOrEmpty(generateDir) && !StringUtil.isNullOrEmpty(tableName)) {
			String entityFileName = getTempDir(request) + generateDir + "/Entity/"
					+ GenerateTemplateUtil.getFileNameContainExt(tableName, EGenerateType.Entity);
			FileReader reader = new FileReader(entityFileName);
			BufferedReader bReader = new BufferedReader(reader);
			String s;
			StringBuffer sBuffer = new StringBuffer();
			while ((s = bReader.readLine()) != null) {
				sBuffer.append(s.replace("<", "&lt;").replace(">", "&gt;") + "<br/>");
			}
			
			map.put("entity", sBuffer.toString());
		}
	}

	/**
	 * 获取ServiceContent
	 * 
	 * @param request
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	private void getServiceContent(HttpServletRequest request, Map<String, String> map) throws IOException {
		String generateDir=request.getParameter("generateDir");
		String tableName=request.getParameter("tableName");
		if (!StringUtil.isNullOrEmpty(generateDir) && !StringUtil.isNullOrEmpty(tableName)) {
			String entityFileName = getTempDir(request) + generateDir + "/service/"
					+ GenerateTemplateUtil.getFileNameContainExt(tableName, EGenerateType.Service);
			FileReader reader = new FileReader(entityFileName);
			BufferedReader bReader = new BufferedReader(reader);
			String s;
			StringBuffer sBuffer = new StringBuffer();
			while ((s = bReader.readLine()) != null) {
				sBuffer.append(s.replace("<", "&lt;").replace(">", "&gt;") + "<br/>");
			}
			map.put("service", sBuffer.toString());
		}
	}
	
	/**
	 * 获取ServiceContent
	 * 
	 * @param request
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	private void getServiceImplContent(HttpServletRequest request, Map<String, String> map) throws IOException {
		String generateDir=request.getParameter("generateDir");
		String tableName=request.getParameter("tableName");
		if (!StringUtil.isNullOrEmpty(generateDir) && !StringUtil.isNullOrEmpty(tableName)) {
			String entityFileName = getTempDir(request) + generateDir + "/service/impl/"
					+ GenerateTemplateUtil.getFileNameContainExt(tableName, EGenerateType.Service);
			FileReader reader = new FileReader(entityFileName);
			BufferedReader bReader = new BufferedReader(reader);
			String s;
			StringBuffer sBuffer = new StringBuffer();
			while ((s = bReader.readLine()) != null) {
				sBuffer.append(s.replace("<", "&lt;").replace(">", "&gt;") + "<br/>");
			}
			map.put("serviceImpl", sBuffer.toString());
		}
	}

	@RequestMapping("/template/sys/config/entityFilter")
	@ResponseBody
	public AjaxDataWrap<EntityFilter> getEntityFilter(@RequestParam(required = false) String userId) {
		return efQueryService.findAllEntityFilter(null);
	}

	
	/**
	 * 生成 自动创建实体仓库根文件夹
	 * 
	 * @param request
	 * @return 返回根文件夹路径+名称
	 */
	private String generateDirPath(HttpServletRequest request, String driName) {
		String tempDir = getTempDir(request);
		String generateDirPath = tempDir + driName;
		File generateDir = new File(generateDirPath);
		if (!generateDir.exists()) {
			generateDir.mkdir();
		}
		return generateDirPath;
	}

	/**
	 * 获取缓存文件路径
	 * 
	 * @param request
	 * @return
	 */
	private String getTempDir(HttpServletRequest request) {
		String tempDir = request.getSession().getServletContext().getRealPath("/uploadTempDirectory/");
		return tempDir;
	}
	
	/**
	 * 获取OOm所在文件夹
	 * 
	 * @param request
	 * @return
	 */
	private String getOomDirPath(HttpServletRequest request) {
		return generateDirPath(request, oomDirPath) + "/";
	}

}
