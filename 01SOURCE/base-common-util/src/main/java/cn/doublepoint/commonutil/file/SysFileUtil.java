package cn.doublepoint.commonutil.file;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.Iterator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import antlr.StringUtils;
import cn.doublepoint.commonutil.CommonUtil;
import cn.doublepoint.commonutil.SequenceUtil;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;
import cn.doublepoint.dto.domain.model.entity.sys.SysFile;
import cn.doublepoint.dto.util.StringUtil;

/**
 * @author 江西DJ烟仔
 * @time 2018年6月18日 :上午1:07:04
 * @description 文件上传 工具类
 */
public class SysFileUtil {
	

	// 文件上传工具类服务方法
	public static SysFile uploadFile(MultipartFile multipartFile, String filePath) throws Exception {
		String originalName = multipartFile.getOriginalFilename();// 原名称 带后缀
		String fileSuffix = originalName.substring(originalName.lastIndexOf("."));// 后缀名
		String newName = originalName.substring(0,originalName.lastIndexOf("."))+System.currentTimeMillis() + fileSuffix;// 新名称
		
		String diskFileName = SysFileUtil.getRootFileDir()+ File.separator + filePath + File.separator + newName;
		File directory = new File(getRootFileDir(), filePath);
		if (!directory.exists()) {
			directory.mkdirs();
		}
		FileUtils.writeByteArrayToFile(new File(diskFileName),multipartFile.getBytes());
		
		Long fileSize = multipartFile.getSize();// 文件大小
		SysFile upload = new SysFile();
		upload.setId(SequenceUtil.getNextVal(SysFile.class));
		upload.setFileSize(fileSize.doubleValue());
		upload.setNewName(newName);
		upload.setOrigName(originalName);
		upload.setCreateTime(CommonUtil.getDateTime());
		upload.setModifyTime(CommonUtil.getDateTime());
		upload.setServerPath(filePath + File.separator + newName);
		JPAUtil.create(upload);
		return upload;
	}

	/**
	 * 删除文件
	 * 
	 * @param path
	 *            文件相对路径
	 * @return
	 */
	public static boolean deleteFile(String path) {
		File file = new File(getRootFileDir(), path);
		if (file.exists()) {
			return file.delete();
		}
		return true;
	}

	/**
	 * 获取项目根路径
	 * 
	 * @return
	 */
	public static String getRootFileDir() {
		try {
			File path;
			path = new File(ResourceUtils.getURL("classpath:").getPath());
			if (!path.exists())
				path = new File("");
			System.out.println("path:" + path.getAbsolutePath());
			return path.getAbsolutePath();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return "";
		}

	}

	/**
	 * 文件下载
	 * 
	 * @param fileName
	 *            下载后的文件名
	 * @param sourcePath
	 *            文件相对路径
	 * @throws Exception
	 */
	public static boolean download(HttpServletResponse response, String sourcePath, String fileName) throws Exception { // 把FilePathKit.FILE_ROOT_PATH
																														// 换成你的项目根路径
		File sourceFile = new File(getRootFileDir()+"/" + sourcePath);
		if (!sourceFile.exists()) {
			throw new Exception("您下载的资源已不存在");
		}
		BufferedInputStream in = null;
		ServletOutputStream out = null;
		try {
			fileName = URLEncoder.encode(fileName, "UTF-8"); // 解决下载文件名乱码
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			in = new BufferedInputStream(new FileInputStream(sourceFile));
			out = response.getOutputStream();
			byte[] buffer = new byte[1024 * 1024 * 10];
			int len = 0;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(fileName + " 下载出错,若有问题请与管理员联系");
		} finally {
			out.close();
			in.close();
		}
		return true;
	}
	
	
	/**
	 * 获取文件扩展名
	 * @param file
	 * @return
	 */
	public String getFileSuffix(MultipartFile file){
		String origName = file.getOriginalFilename();
		return origName.substring(origName.lastIndexOf("."));
	}
}
