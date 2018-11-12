 /** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年3月31日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.generate.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
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
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.doublepoint.commonutil.StringUtil;
import cn.doublepoint.commonutil.ajaxmodel.AjaxDataWrap;
import cn.doublepoint.commonutil.ajaxmodel.AjaxRequest;
import cn.doublepoint.commonutil.ajaxmodel.AjaxResponse;
import cn.doublepoint.commonutil.annotation.RequestForm;
import cn.doublepoint.commonutil.file.DownloadFileUtil;
import cn.doublepoint.commonutil.file.ZipUtil;
import cn.doublepoint.commonutil.log.Log4jUtil;
import cn.doublepoint.commonutil.port.adapter.controller.BaseController;
import cn.doublepoint.dto.domain.model.entity.sys.EntityFilter;
import cn.doublepoint.generate.EGenerateType;
import cn.doublepoint.generate.GenerateEntityTemplateUtil;
import cn.doublepoint.generate.GenerateServiceImplTemplateUtil;
import cn.doublepoint.generate.GenerateServiceTemplateUtil;
import cn.doublepoint.generate.GenerateTemplateUtil;
import cn.doublepoint.generate.domain.model.helper.BaseTemplate;
import cn.doublepoint.generate.domain.model.helper.TemplateEntityModel;
import cn.doublepoint.generate.service.EntityFilterQueryService;
import freemarker.template.TemplateException;

@Controller
public class GenerateEntityController extends BaseController {
	@Resource
	EntityFilterQueryService efQueryService;

	private final String oomDirPath = "oom";
	
	/**
	 * 导入文件 并返回文件中的所有表
	 * @param request
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("sys/getFileTable")
	@ResponseBody
	public AjaxResponse getFileTable(@RequestParam("file") MultipartFile file,AjaxResponse responseData) throws IllegalStateException, IOException {
		String oomName = UUID.randomUUID() + ".oom";
		File filev = new File(getOomDirPath() + "/" + oomName);
		file.transferTo(filev);

		List<TemplateEntityModel> beanModelList = GenerateTemplateUtil.buildTableNameList(filev);
		AjaxDataWrap<TemplateEntityModel> ajaxDataWrap = new AjaxDataWrap<TemplateEntityModel>();
		ajaxDataWrap.setDataList(beanModelList);
		responseData.setAjaxParameter("ajaxDataWrap", ajaxDataWrap);
		responseData.setAjaxParameter("oomName", oomName);
		return responseData;
	
	}

	/**
	 * 生成该实体的各个源文件
	 * @param request
	 * @throws TemplateException
	 * @throws IOException
	 */
	@RequestMapping("sys/assistant/generate")
	@ResponseBody
	public AjaxResponse generate(@RequestBody AjaxRequest request,AjaxResponse responseData) throws TemplateException, IOException {
		
		String oomName=request.getParameter("oomName");
		if (!StringUtil.isNullOrEmpty(oomName)) {
			List<GenerateTemplateUtil> templateUtils=new ArrayList<>();
			templateUtils.add(new GenerateEntityTemplateUtil());
			templateUtils.add(new GenerateServiceTemplateUtil());
			templateUtils.add(new GenerateServiceImplTemplateUtil());
			
			File file = new File(getOomDirPath() + oomName);
			List<BaseTemplate> models = GenerateTemplateUtil.buildTemplateModelList(file);

			String generateDir = UUID.randomUUID().toString();
			String generateDirPath = generateDirPath(generateDir);
			
			templateUtils.stream().forEach(util->{
				util.generateFile(models, generateDirPath);
			});
			responseData.setAjaxParameter("generateDir", generateDir);
		}
		return responseData;
	}

	
	/**
	 * 源文件详细信息页面
	 * @param request
	 * @return
	 * @throws TemplateException
	 * @throws IOException
	 */
	@RequestMapping("sys/assistant/generateDetail")
	public AjaxResponse generateDetail(@RequestForm AjaxRequest request,AjaxResponse responseData) throws TemplateException, IOException {
		Map<String, String> map = new HashMap<String, String>();
		getEntityContent(request, map);
		getServiceContent(request, map);
		getServiceImplContent(request, map);
		responseData.setAjaxParameter("map", map);
		responseData.setViewName("sys/assistant/generateDetail.html");
		return responseData;
	}

	/**
	 * 压缩并下载源文件
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("sys/assistant/zipAndDownload")
	public void zipAndDownload1(@RequestBody AjaxRequest request, HttpServletResponse response)
			throws IOException {
		String generateDir=request.getParameter("generateDir");
		String fileZip = getTempDir() + generateDir + ".zip";
		// 文件输出流
		FileOutputStream outStream = new FileOutputStream(fileZip);
		// 压缩流
		ZipUtil.toZip(getTempDir() + generateDir, outStream, true);

		DownloadFileUtil.download(response, fileZip, "实体映射包.zip");
	}

	/**
	 * 获取EntityContent
	 * 
	 * @param request
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	private void getEntityContent(@RequestBody AjaxRequest request, Map<String, String> map) throws IOException {
		String generateDir=request.getParameter("generateDir");
		String tableName=request.getParameter("tableName");
		if (!StringUtil.isNullOrEmpty(generateDir) && !StringUtil.isNullOrEmpty(tableName)) {
			String entityFileName = getTempDir() + generateDir + "/Entity/"
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
	private void getServiceContent(@RequestBody AjaxRequest request, Map<String, String> map) throws IOException {
		String generateDir=request.getParameter("generateDir");
		String tableName=request.getParameter("tableName");
		if (!StringUtil.isNullOrEmpty(generateDir) && !StringUtil.isNullOrEmpty(tableName)) {
			String entityFileName = getTempDir() + generateDir + "/service/"
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
	private void getServiceImplContent(@RequestBody AjaxRequest request, Map<String, String> map) throws IOException {
		String generateDir=request.getParameter("generateDir");
		String tableName=request.getParameter("tableName");
		if (!StringUtil.isNullOrEmpty(generateDir) && !StringUtil.isNullOrEmpty(tableName)) {
			String entityFileName = getTempDir() + generateDir + "/service/impl/"
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

	@RequestMapping("sys/config/entityFilter")
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
	private String generateDirPath( String driName) {
		String tempDir = getTempDir();
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
	private String getTempDir() {
		try {
			return getJarRootPath();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		/*String tempDir = request.getSession().getServletContext().getRealPath("/uploadTempDirectory/");
		return tempDir;*/
		return "";
	}
	
	/**
	 * 获取OOm所在文件夹
	 * 
	 * @param request
	 * @return
	 */
	private String getOomDirPath() {
		return generateDirPath(oomDirPath) + "/";
	}

	private String getJarRootPath() throws FileNotFoundException {
        String path = ResourceUtils.getURL("classpath:").getPath();
        Log4jUtil.debug("ResourceUtils.getURL(\"classpath:\").getPath() -> "+path);
        //创建File时会自动处理前缀和jar包路径问题  => /root/tmp
        File rootFile = new File(path);
        if(!rootFile.exists()) {
        	Log4jUtil.info("根目录不存在, 重新创建");
            rootFile = new File("");
            Log4jUtil.info("重新创建的根目录: "+rootFile.getAbsolutePath());
        }
        Log4jUtil.debug("项目根目录: "+rootFile.getAbsolutePath());        //获取的字符串末尾没有分隔符 /
        return rootFile.getAbsolutePath()+"/";
    }

}
