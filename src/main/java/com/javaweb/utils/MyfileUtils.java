package com.javaweb.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
 

import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

/**
 * springMVC中文件的工具类
 * 
 * @author chenpeng
 *
 */
public class MyfileUtils {

	private static final Logger logger = LoggerFactory.getLogger(MyfileUtils.class);
	/**
	 * 存储的路径，默认的为c盘符
	 */
	public static String directory = "c:/";

	/**
	 * 图片的大小配置，默认为2048000
	 */
	public static long imagesize = 2048000;

	/**
	 * 图片的类型配置默认如下
	 */
	public static String imagetype = "image/bmp,image/png,image/jpeg,image/jpg";

	/**
	 * 文件上传的大小限制
	 */
	public static long filesize = 20971520;

	/**
	 * 文件上传文件的类型
	 */
	public static String filetype = "application/msword,application/pdf,application/zip,video/mpeg,video/quicktime,video/x-sgi-movie,video/mpeg,video/x-msvideo,audio/x-mpeg,application/octet-stream";

	/**
	 * 配置路径的字段
	 */
	public static final String DIRECTORY = "myfileutils.uploadFileDirectory";

	/**
	 * 配置图片大小的字段
	 */
	public static final String IMAGESIZE = "myfileutils.imgSize";

	/**
	 * 配置图片类型的字段
	 */
	public static final String IMAGETYPE = "myfileutils.imgType";

	/**
	 * 文件的大小
	 */
	public static final String FILESIZE = "myfileutils.fileSize";

	/**
	 * 文件的类型
	 */
	public static final String FILETYPE = "myfileutils.fileType";

	/**
	 * 文件所支持的全部类型(图片,office文件,压缩包,视频,音频)
	 */
	public static String[] sporting_filetype;

	/**
	 * 上传的结果
	 * 
	 * @author cp UPLOAD_SUCCESS:"上传成功" UPLOAD_SIZE_ERROR:"上传文件过大"
	 *         UPLOAD_TYPE_ERROR:"上传文件类型错误" UPLOAD_FILE:"上传文件失败"
	 *
	 */
	public static enum Upload {
		UPLOAD_SUCCESS("上传成功", 1), UPLOAD_SIZE_ERROR("上传文件过大", 2), UPLOAD_TYPE_ERROR("上传文件类型错误",
				3), UPLOAD_FILE("上传文件失败", 4),FILE_DOWNLOAD_SUCCESS("文件下载成功",5),FILE_NOTFOUND("未找到该文件",6);

		// 成员变量
		private String name;
		@SuppressWarnings("unused")
		private int index;

		// 构造方法
		private Upload(String name, int index) {
			this.name = name;
			this.index = index;
		}

		// 覆盖toString方法
		@Override
		public String toString() {
			return this.name;
		}

	}

	/**
	 * static语句块读取配置文件
	 */
	static {
		Properties properties = new Properties();
		try {
			InputStream in = new BufferedInputStream(MyfileUtils.class.getResourceAsStream("/user-setting.properties"));
			properties.load(in);
			Iterator<String> it = properties.stringPropertyNames().iterator();
			while (it.hasNext()) {
				String key = it.next();
				String value = properties.getProperty(key);
				logger.info("读取配置文件..." + key + ":" + value);
				switch (key) {
				// 如果是路径
				case DIRECTORY:
					// 判断是否存在该文件夹如果没有则要重新创建
					File file = new File(value);
					if (!file.exists() && !file.isDirectory()) {
						// 创建文件夹
						file.mkdirs();
					}
					directory = value;
					break;
				// 如果是图片的格式
				case IMAGETYPE:
					imagetype = value;
					break;
				// 如果是图片的大小
				case IMAGESIZE:
					imagesize = Long.parseLong(value);
					break;
				// 如果是文件的大小
				case FILESIZE:
					filesize = Long.parseLong(value);
					break;
				// 如果是文件的类型
				case FILETYPE:
					filetype = value;
					break;
				default:
					break;
				}
			}
			// 读取配置后把支持图片的和支持文件的放在一起
			String[] imagetypes = imagetype.split(",");
			String[] filetypees = filetype.split(",");
			sporting_filetype = new String[imagetypes.length+filetypees.length];
			System.arraycopy(imagetypes, 0, sporting_filetype, 0, imagetypes.length);
			System.arraycopy(filetypees, 0, sporting_filetype, imagetypes.length, filetypees.length);
		} catch (FileNotFoundException e) {
			logger.error("未发现配置文件");
		} catch (IOException e) {
			logger.error("读取配置文件失败");
		}
	}

	/**
	 * 上传文件
	 * 
	 * @param multipartFiles
	 *            上传的文件
	 * @param parentDir
	 *            上传文件制定的父文件夹，格式为A/b,可以为空
	 * @param storageFileName
	 *            上传的文件的别名,注意上传文件名不用带后缀
	 * @return
	 */
	public List<String> uploadFile(MultipartFile[] multipartFiles, String parentDir, String storageFileName) {
		List<String> myStrings = new ArrayList<>();
		if (multipartFiles != null && multipartFiles.length > 0) {
			String laString = "";
			String storagePath = "";
			// 先判断要存储的文件夹是否存在，如果不存在就重新创建
			String path = directory + ((parentDir!=null)?("/" + parentDir):"");
			File fileDir = new File(path);
			if (!fileDir.exists() && !fileDir.isDirectory()) {
				fileDir.mkdir();
			}
			for (MultipartFile file : multipartFiles) {
				// 先判断文件的类型是否符合配置要求
				if (MyfileUtils.checkFileType(file, sporting_filetype)) {
					/***** 判断文件的大小 *****/
					String type = file.getContentType().substring(0, file.getContentType().lastIndexOf("/"));
					// 如果是图片,且大小超过范围的，如果是文件，且大小超过范围的直接返回
					if ((type.equals("image") && !MyfileUtils.checkFileSize(file, MyfileUtils.imagesize))
							|| (!type.equals("image") && !MyfileUtils.checkFileSize(file, filesize))) {
						logger.info("文件过大");
						 
					}
					// 获取变量名file,文件类型,文件名
					logger.info(
							"上传的文件：" + file.getName() + "," + file.getContentType() + "," + file.getOriginalFilename());
					laString = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					try {
						if (!file.isEmpty()) {
							// 判断sotrageName是否为空,如果不为空就以存储的命名,为空就以原来的名称命名
							storagePath = path + "/" + ((storageFileName != null) ? (storageFileName + laString)
									: file.getOriginalFilename());
							logger.info("保存的路径为：" + storagePath);
							Streams.copy(file.getInputStream(), new FileOutputStream(storagePath), true);							        
							myStrings.add(storagePath);
						}
					} catch (Exception e) {
						logger.error("上传文件失败");
						e.printStackTrace();					 
					}
				} else {
					logger.info("上传文件类型有误");				 
				}
			}
			logger.info("上传文件成功");			 
		} else {
			logger.info("上传文件失 败");			 
		}
		return myStrings;
	}

	/** 
	 * 下载文件
	 * 
	 * @param filePath
	 *            文件的路径
	 * @param fileReName
	 *            文件的下载显示的别名
	 * @return 文件的对象
	 * @throws IOException
	 */
	public ResponseEntity<byte[]> downloadFile(String filePath, String fileReName) throws IOException {
		// 指定文件,必须是绝对路径
		File file = new File(filePath);
		// 下载浏览器响应的那个文件名
		String dfileName = new String(fileReName.getBytes("GBK"), "iso-8859-1");
		// 下面开始设置HttpHeaders,使得浏览器响应下载
		HttpHeaders headers = new HttpHeaders();
		// 设置响应方式
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		// 设置响应文件
		headers.setContentDispositionFormData("attachment", dfileName);
		// 把文件以二进制形式写回
		ResponseEntity<byte[]> result = null;
		try {			
			result = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return result;
	}

	/**
	 * 检查文件的格式
	 * 
	 * @return
	 */
	public static boolean checkFileType(MultipartFile file, String[] supprtedTypes) {
		String fileType = file.getContentType();
		logger.info("文件的格式为："+fileType);
		return Arrays.asList(supprtedTypes).contains(fileType);
	}

	/**
	 * 判断文件的大小是否符合要求
	 * 
	 * @param maxSize
	 *            最大文件
	 * @return
	 */
	public static boolean checkFileSize(MultipartFile file, long maxSize) {
		logger.info("文件的大小比较："+file.getSize()+",max:"+maxSize);
		return file.getSize() <= maxSize;
	}
	
//	public static boolean readXLSToObject(MultipartFile file,String outputPath){
//		
//	}

}
