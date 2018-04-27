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

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
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
import cn.doublepoint.commonutil.domain.model.ZipUtil;
import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;
import cn.doublepoint.generate.GenerateEntityUtil;
import cn.doublepoint.generate.domain.model.helper.BeanModel;

@Controller
public class GenerateEntityHandleController extends BaseHandleController {
	@Resource
	EntityFilterQueryService efQueryService;

	@RequestMapping("/template/sys/tables")
	@ResponseBody
	public AjaxDataWrap<MySQLTables> getTables() {
		List<MySQLTables> list = DataBaseMetaDataUtil.getTables();
		AjaxDataWrap<MySQLTables> dataWrap = new AjaxDataWrap<>();
		dataWrap.setDataList(list);
		return dataWrap;
	}

	@RequestMapping("/template/sys/uploadfile1")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile myfile) throws IllegalStateException, IOException {
		String returnString = "";
		try {
			File file = File.createTempFile("tmp", null);
			myfile.transferTo(file);
			returnString = GenerateEntityUtil.buildEntityByTableName(file, "sys_entity_filter");
			//file.deleteOnExit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnString.replace("<", "&lt;").replace("<", "&gt;");
	}
	
	@RequestMapping("/template/sys/getAllFileTable")
	@ResponseBody
	public AjaxDataWrap<BeanModel> getAllFileTable(@RequestParam("file") MultipartFile myfile,HttpServletRequest request) throws IllegalStateException, IOException {
		
		try {
			String oomFileName="";
			String generateDirPath= generateDirPath(request);
			oomFileName=generateDirPath+"/"+UUID.randomUUID()+".oom";
			File file = new File(oomFileName);
			myfile.transferTo(file);
			
			List<BeanModel> beanModelList=GenerateEntityUtil.buildTableNameList(file);
			AjaxDataWrap<BeanModel> ajaxDataWrap=new AjaxDataWrap<BeanModel>();
			ajaxDataWrap.setDataList(beanModelList);
			return ajaxDataWrap;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
//	String oomFileName="";
//	try {
//		String generateDirPath= generateDirPath(request);
//		
//		oomFileName=generateDirPath+"/"+UUID.randomUUID()+".oom";
//		File file = new File(oomFileName);
//		myfile.transferTo(file);
//		List<String> tableNameLlist=new ArrayList<>();
//		tableNameLlist.add("sys_menu");
//		tableNameLlist.add("sys_entity_filter");
//		
//		Map<String,String> tableMap=GenerateEntityUtil.buildEntityByTableNameList(file, tableNameLlist);
//		tableMap.entrySet().stream().forEach(entity->{
//			String tableName=entity.getKey();
//			String tableContent=entity.getValue();
//			try {
//				generateEntityFile(generateDirPath, tableName, tableContent);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		});
//	} catch (Exception e) {
//		e.printStackTrace();
//	}
//	
//	return oomFileName;

	@RequestMapping("/template/sys/config/entityFilter")
	@ResponseBody
	public AjaxDataWrap<EntityFilter> getEntityFilter(@RequestParam(required = false) String userId) {
		return efQueryService.findAllEntityFilter(null);
	}

	@RequestMapping("/template/sys/config/generateFile")
	@ResponseBody
	private void downloadFiles(@RequestParam(required=false) List<File> files, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String tempDir= request.getSession().getServletContext().getRealPath("/uploadTempDirectory/");
		String tempDirName=UUID.randomUUID()+"";
		String generateDirPath= tempDir + tempDirName;
		File generateDir = new File(generateDirPath);
		if(!generateDir.exists()){
			generateDir.mkdir();
			System.out.println("创建临时文件夹：" + generateDir.getCanonicalPath());
		}
		
		String generateRepositoryDirPath=generateDirPath+"/repository";
		File generateRepositoryDir = new File(generateRepositoryDirPath);
		if(!generateRepositoryDir.exists()){
			generateRepositoryDir.mkdir();
			System.out.println("创建临时文件夹repository：" + generateRepositoryDir.getCanonicalPath());
		}
		
		String generateJspDirPath=generateDirPath+"/jsp";
		File generateJspDir = new File(generateJspDirPath);
		if(!generateJspDir.exists()){
			generateJspDir.mkdir();
			System.out.println("创建临时文件夹jsp：" + generateJspDir.getCanonicalPath());
		}
		
		// 在服务器端创建打包下载的临时文件
		String zipFilePath = tempDir+"/"+tempDirName + ".zip";
		
		File fileZip = new File(zipFilePath);
		// 文件输出流
		FileOutputStream outStream = new FileOutputStream(fileZip);
		// 压缩流
		ZipUtil.toZip(generateDirPath,outStream,true);
		
		if(outStream!=null)
			outStream.close();
	}

	/**
	 * 生成实体文件
	 * @param generateDirPath 生成文件夹根路径 在此基础上添加/entity/entity.java
	 * @param fileName 文件名称
	 * @param fileContent 文件内容
	 * @throws IOException 异常
	 */
	private void generateEntityFile(String generateDirPath,String fileName,String fileContent) throws IOException{
		String generateEntityDirPath=generateDirPath+"/entity";
		File generateEntityDir = new File(generateEntityDirPath);
		if(!generateEntityDir.exists()){
			generateEntityDir.mkdir();
		}
		
		String entityFilePath = generateEntityDirPath+"/" + fileName + ".java";
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
	 * 生成  自动创建实体仓库根文件夹
	 * @param request 
	 * @return 返回根文件夹路径+名称
	 */
	private String generateDirPath(HttpServletRequest request){
		String tempDir= request.getSession().getServletContext().getRealPath("/uploadTempDirectory/");
		String tempDirName=UUID.randomUUID()+"";
		String generateDirPath= tempDir + tempDirName;
		File generateDir = new File(generateDirPath);
		if(!generateDir.exists()){
			generateDir.mkdir();
		}
		return generateDirPath;
	}
}
