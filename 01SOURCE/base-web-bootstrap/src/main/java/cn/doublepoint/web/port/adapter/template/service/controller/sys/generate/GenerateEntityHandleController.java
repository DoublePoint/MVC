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

import static java.util.stream.Collectors.toList;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.doublepoint.common.application.template.sys.entity.EntityFilterQueryService;
import cn.doublepoint.common.domain.model.entity.sys.EntityFilter;
import cn.doublepoint.common.domain.model.entity.sys.MySQLTables;
import cn.doublepoint.common.port.adapter.template.persistence.sys.common.DataBaseMetaDataUtil;
import cn.doublepoint.commonutil.domain.model.AjaxDataWrap;
import cn.doublepoint.commonutil.domain.model.Log4jUtil;
import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.domain.model.ZipUtil;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;
import cn.doublepoint.generate.EGenerateType;
import cn.doublepoint.generate.GenerateTemplateUtil;
import cn.doublepoint.generate.domain.model.helper.BaseTemplate;
import cn.doublepoint.generate.domain.model.helper.TemplateEntityModel;
import freemarker.template.TemplateException;

@Controller
public class GenerateEntityHandleController extends BaseHandleController {
	@Resource
	EntityFilterQueryService efQueryService;

	private final String oomDirPath = "oom";

	private AjaxDataWrap<MySQLTables> dataWrap;
	private String tableName;
	private String oomName;
	private String generateDir;// 生成的实体类 服务 等存放路径
	private MultipartFile file;

	@RequestMapping("/template/sys/tables")
	@ResponseBody
	public AjaxDataWrap<MySQLTables> getTables() {
		List<MySQLTables> list = DataBaseMetaDataUtil.getTables();
		AjaxDataWrap<MySQLTables> dataWrap = new AjaxDataWrap<>();
		dataWrap.setDataList(list);
		return dataWrap;
	}

	// @RequestMapping("/template/sys/uploadfile1")
	// @ResponseBody
	// public String upload() throws IllegalStateException, IOException {
	// String returnString = "";
	// try {
	// File filev = File.createTempFile("tmp", null);
	// file.transferTo(filev);
	// returnString = GenerateEntityUtil.buildEntityByTableName(filev,
	// "sys_entity_filter");
	// //file.deleteOnExit();
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// return returnString.replace("<", "&lt;").replace("<", "&gt;");
	// }

	@RequestMapping("/template/sys/getFileTable")
	@ResponseBody
	public void getFileTable(HttpServletRequest request) throws IllegalStateException, IOException {
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
	 * 获取OOm所在文件夹
	 * 
	 * @param request
	 * @return
	 */
	private String getOomDirPath(HttpServletRequest request) {
		return generateDirPath(request, oomDirPath) + "/";
	}

	@RequestMapping("/template/sys/assistant/generate")
	@ResponseBody
	public void generate(HttpServletRequest request) throws TemplateException, IOException {

		if (!StringUtil.isNullOrEmpty(oomName)) {
			List<String> tableNameList = new ArrayList<>();
			if (dataWrap != null) {
				tableNameList = dataWrap.getDataList().stream().map(MySQLTables::getTableName).collect(toList());
			}
			File file = new File(getOomDirPath(request) + oomName);
			List<BaseTemplate> models = GenerateTemplateUtil.buildEntityModelList(file);
			Map<String, String> mapEntity = GenerateTemplateUtil.buildEntityByTableNameList(models);
			Map<String, String> mapRepository = GenerateTemplateUtil.buildRepositoryByTableNameList(models);

			String generateDir = UUID.randomUUID().toString();
			String generateDirPath = generateDirPath(request, generateDir);
			mapEntity.entrySet().stream().forEach(e -> {
				try {
					generateEntityFile(generateDirPath, e.getKey(), e.getValue());
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			});

			mapRepository.entrySet().stream().forEach(e -> {
				try {
					generateRepositoryFile(generateDirPath, e.getKey(), e.getValue());
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			});

			responseData.setAjaxParameter("generateDir", generateDir);
		}
	}

	@SuppressWarnings("resource")
	@RequestMapping("/template/sys/assistant/generateDetail")
	public String generateDetail(HttpServletRequest request) throws TemplateException, IOException {
		Map<String, String> map = new HashMap<String, String>();
		getEntityContent(request, map);
		getRepositoryContent(request, map);
		responseData.setAjaxParameter("map", map);
		return "/template/sys/assistant/generateDetail";
	}

	/**
	 * 获取EntityContent
	 * 
	 * @param request
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	private void getEntityContent(HttpServletRequest request, Map<String, String> map) throws IOException {
		if (!StringUtil.isNullOrEmpty(generateDir) && !StringUtil.isNullOrEmpty(tableName)) {
			String entityFileName = getTempDir(request) + generateDir + "/Entity/"
					+ GenerateTemplateUtil.getFileNameContainExt(tableName, EGenerateType.Entity);
			FileReader reader = new FileReader(entityFileName);
			BufferedReader bReader = new BufferedReader(reader);
			String s;
			StringBuffer sBuffer = new StringBuffer();
			while ((s = bReader.readLine()) != null) {
				sBuffer.append(s + "<br/>");
			}
			map.put("entity", sBuffer.toString());
		}
	}

	/**
	 * 获取RepositoryContent
	 * 
	 * @param request
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	private void getRepositoryContent(HttpServletRequest request, Map<String, String> map) throws IOException {
		if (!StringUtil.isNullOrEmpty(generateDir) && !StringUtil.isNullOrEmpty(tableName)) {
			String entityFileName = getTempDir(request) + generateDir + "/repository/"
					+ GenerateTemplateUtil.getFileNameContainExt(tableName, EGenerateType.Repository);
			FileReader reader = new FileReader(entityFileName);
			BufferedReader bReader = new BufferedReader(reader);
			String s;
			StringBuffer sBuffer = new StringBuffer();
			while ((s = bReader.readLine()) != null) {
				sBuffer.append(s + "<br/>");
			}
			map.put("repository", sBuffer.toString());
		}
	}

	@RequestMapping("/template/sys/testGetDataWrap")
	@ResponseBody
	public void testGetDataWrap(HttpServletRequest request) throws IllegalStateException, IOException {
		try {
			String oomFileName = "";
			// testParam = request.getParameter("testParam");
			// String generateDirPath= generateDirPath(request);
			// oomFileName=generateDirPath+"/"+UUID.randomUUID()+".oom";
			// File filev = new File(oomFileName);
			// file.transferTo(filev);
			//
			// List<BeanModel>
			// beanModelList=GenerateEntityUtil.buildTableNameList(filev);
			// AjaxDataWrap<BeanModel> ajaxDataWrap=new
			// AjaxDataWrap<BeanModel>();
			// ajaxDataWrap.setDataList(beanModelList);
			responseData.setAjaxParameter("ajaxDataWrap", null);
			// responseData.setAjaxParameter("oomFileName", oomFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// String oomFileName="";
	// try {
	// String generateDirPath= generateDirPath(request);
	//
	// oomFileName=generateDirPath+"/"+UUID.randomUUID()+".oom";
	// File file = new File(oomFileName);
	// myfile.transferTo(file);
	// List<String> tableNameLlist=new ArrayList<>();
	// tableNameLlist.add("sys_menu");
	// tableNameLlist.add("sys_entity_filter");
	//
	// Map<String,String>
	// tableMap=GenerateEntityUtil.buildEntityByTableNameList(file,
	// tableNameLlist);
	// tableMap.entrySet().stream().forEach(entity->{
	// String tableName=entity.getKey();
	// String tableContent=entity.getValue();
	// try {
	// generateEntityFile(generateDirPath, tableName, tableContent);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// });
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	//
	// return oomFileName;

	@RequestMapping("/template/sys/config/entityFilter")
	@ResponseBody
	public AjaxDataWrap<EntityFilter> getEntityFilter(@RequestParam(required = false) String userId) {
		return efQueryService.findAllEntityFilter(null);
	}

	@RequestMapping("/template/sys/config/generateFile")
	@ResponseBody
	private void downloadFiles(@RequestParam(required = false) List<File> files, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String tempDir = request.getSession().getServletContext().getRealPath("/uploadTempDirectory/");
		String tempDirName = UUID.randomUUID() + "";
		String generateDirPath = tempDir + tempDirName;
		File generateDir = new File(generateDirPath);
		if (!generateDir.exists()) {
			generateDir.mkdir();
			System.out.println("创建临时文件夹：" + generateDir.getCanonicalPath());
		}

		String generateRepositoryDirPath = generateDirPath + "/repository";
		File generateRepositoryDir = new File(generateRepositoryDirPath);
		if (!generateRepositoryDir.exists()) {
			generateRepositoryDir.mkdir();
			System.out.println("创建临时文件夹repository：" + generateRepositoryDir.getCanonicalPath());
		}

		String generateJspDirPath = generateDirPath + "/jsp";
		File generateJspDir = new File(generateJspDirPath);
		if (!generateJspDir.exists()) {
			generateJspDir.mkdir();
			System.out.println("创建临时文件夹jsp：" + generateJspDir.getCanonicalPath());
		}

		// 在服务器端创建打包下载的临时文件
		String zipFilePath = tempDir + "/" + tempDirName + ".zip";

		File fileZip = new File(zipFilePath);
		// 文件输出流
		FileOutputStream outStream = new FileOutputStream(fileZip);
		// 压缩流
		ZipUtil.toZip(generateDirPath, outStream, true);

		if (outStream != null)
			outStream.close();
	}

	/**
	 * 生成实体文件
	 * 
	 * @param generateDirPath
	 *            生成文件夹根路径 在此基础上添加/entity/entity.java
	 * @param fileName
	 *            文件名称
	 * @param fileContent
	 *            文件内容
	 * @throws IOException
	 *             异常
	 */
	private void generateEntityFile(String generateDirPath, String fileName, String fileContent) throws IOException {
		String generateEntityDirPath = generateDirPath + "/entity";
		File generateEntityDir = new File(generateEntityDirPath);
		if (!generateEntityDir.exists()) {
			generateEntityDir.mkdir();
		}

		String entityFilePath = generateEntityDirPath + "/"
				+ GenerateTemplateUtil.getFileNameContainExt(fileName, EGenerateType.Entity);
		File entiryFile = new File(entityFilePath);
		System.out.println("临时文件所在的本地路径：" + entiryFile.getCanonicalPath());
		FileOutputStream fos = new FileOutputStream(entiryFile);
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(entiryFile));
			out.write(fileContent);
			out.close();
			// 这里处理业务逻辑
		} finally {
			// 关闭临时文件
			fos.flush();
			fos.close();
		}
	}

	/**
	 * 生成实体文件
	 * 
	 * @param generateDirPath
	 *            生成文件夹根路径 在此基础上添加/entity/entity.java
	 * @param fileName
	 *            文件名称
	 * @param fileContent
	 *            文件内容
	 * @throws IOException
	 *             异常
	 */
	private void generateRepositoryFile(String generateDirPath, String fileName, String fileContent)
			throws IOException {
		generateDirPath = generateDirPath + "/repository";
		File generateEntityDir = new File(generateDirPath);
		if (!generateEntityDir.exists()) {
			generateEntityDir.mkdir();
		}

		String entityFilePath = generateDirPath + "/"+ GenerateTemplateUtil.getFileNameContainExt(fileName, EGenerateType.Repository);
		File entiryFile = new File(entityFilePath);
		Log4jUtil.info("临时文件所在的本地路径：" + entiryFile.getCanonicalPath());
		FileOutputStream fos = new FileOutputStream(entiryFile);
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(entiryFile));
			out.write(fileContent);
			out.close();
			// 这里处理业务逻辑
		} finally {
			// 关闭临时文件
			fos.flush();
			fos.close();
		}
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

}
