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

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.persistence.Entity;
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
import cn.doublepoint.commonutil.port.adapter.controller.handle.BaseHandleController;
import cn.doublepoint.generate.GenerateEntityUtil;
import freemarker.template.Configuration;

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

	@RequestMapping("/template/sys/uploadfile")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile myfile) throws IllegalStateException, IOException {
		String returnString = "";
		try {
			File file = File.createTempFile("tmp", null);
			myfile.transferTo(file);
			returnString = GenerateEntityUtil.buildEntityByTableName(file, "sys_entity_filter");
			file.deleteOnExit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnString.replace("<", "&lt;").replace("<", "&gt;");
	}

	@RequestMapping("/template/sys/config/entityFilter")
	@ResponseBody
	public AjaxDataWrap<EntityFilter> getEntityFilter(@RequestParam(required = false) String userId) {
		return efQueryService.findAllEntityFilter(null);
	}

	@RequestMapping("/template/sys/config/generateFile")
	@ResponseBody
	private void downloadFiles(@RequestParam(required=false) List<File> files, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String savePath = request.getSession().getServletContext()
				.getRealPath("/uploadTempDirectory/123/" + UUID.randomUUID() + ".java");
		File htmlFile = new File(savePath);
		
		File dir=new File(request.getSession().getServletContext().getRealPath("/uploadTempDirectory/123/"));
		if(!dir.exists()){
			dir.mkdir();
			System.out.println("dir：" + dir.getCanonicalPath());
		}
		System.out.println("dir.exists()：" + dir.exists());
		System.out.println("临时文件所在的本地路径：" + htmlFile.getCanonicalPath());
		FileOutputStream fos = new FileOutputStream(htmlFile);
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(htmlFile));
			out.write("aString");
			out.close();
			// 这里处理业务逻辑
		} finally {
			// 关闭临时文件
			fos.flush();
			fos.close();
			// htmlFile.deleteOnExit();//程序退出时删除临时文件
		}

		String fileName = UUID.randomUUID().toString() + ".zip";
		// 在服务器端创建打包下载的临时文件
		String outFilePath = request.getSession().getServletContext().getRealPath("/uploadTempDirectory/");

		File fileZip = new File(outFilePath + fileName);
		// 文件输出流
		FileOutputStream outStream = new FileOutputStream(fileZip);
		// 压缩流
		//ZipOutputStream zipOutStream = new ZipOutputStream(outStream);
		ZipUtil.toZip(dir.getCanonicalPath(),outStream,true);
		//zipFile(dir, zipOutStream);
		//zipOutStream.close();
		//outStream.close();
	}

	// 循环压缩多个文件
	public static void zipFile(List<File> files, ZipOutputStream outputStream) throws IOException, ServletException {
		try {
			int size = files.size();
			// 压缩列表中的文件
			for (int i = 0; i < size; i++) {
				File file = (File) files.get(i);
				zipFile(file, outputStream);
			}
		} catch (IOException e) {
			throw e;
		}
	}

	public static void zipFile(File inputFile, ZipOutputStream outputstream) throws IOException, ServletException {
		try {
			if (inputFile.exists()) {
				if (inputFile.isFile()) {
					FileInputStream inStream = new FileInputStream(inputFile);
					BufferedInputStream bInStream = new BufferedInputStream(inStream);
					ZipEntry entry = new ZipEntry(inputFile.getName());
					outputstream.putNextEntry(entry);
					final int MAX_BYTE = 10 * 1024 * 1024; // 最大的流为10M
					long streamTotal = 0; // 接受流的容量
					int streamNum = 0; // 流需要分开的数量
					int leaveByte = 0; // 文件剩下的字符数
					byte[] inOutbyte; // byte数组接受文件的数据

					streamTotal = bInStream.available(); // 通过available方法取得流的最大字符数
					streamNum = (int) Math.floor(streamTotal / MAX_BYTE); // 取得流文件需要分开的数量
					leaveByte = (int) streamTotal % MAX_BYTE; // 分开文件之后,剩余的数量

					if (streamNum > 0) {
						for (int j = 0; j < streamNum; ++j) {
							inOutbyte = new byte[MAX_BYTE];
							// 读入流,保存在byte数组
							bInStream.read(inOutbyte, 0, MAX_BYTE);
							outputstream.write(inOutbyte, 0, MAX_BYTE); // 写出流
						}
					}
					// 写出剩下的流数据
					inOutbyte = new byte[leaveByte];
					bInStream.read(inOutbyte, 0, leaveByte);
					outputstream.write(inOutbyte);
					outputstream.closeEntry(); // Closes the current ZIP entry

					bInStream.close(); // 关闭
					inStream.close();
				}
			} else {
				throw new ServletException("文件不存在！");
			}
		} catch (IOException e) {
			throw e;
		}
	}

}
