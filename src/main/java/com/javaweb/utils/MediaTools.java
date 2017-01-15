package com.javaweb.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import org.apache.commons.fileupload.util.Streams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;


/**
 * 视频的转码工具类
 * 
 * @author cp
 *
 */
public class MediaTools {

	private static final Logger logger = LoggerFactory.getLogger(MediaTools.class);

	/**
	 * ffmpegpath的文件路径
	 */
	public static String myffmpegPath;
	
	/**
	 * 父路径
	 */
	public static String myParentPath;

	/**
	 * 上传文件的路径
	 */
	public static String myupFilePath = "c:/";

	/**
	 * 编码后文件的路径
	 */
	public static String mycodcFilePath = "c:/";

	/**
	 * 截图文件的路径
	 */
	public static String mymediaPicPath = "c:/";

	/**
	 * ffmpegpath的路径字符常量
	 */
	public static final String FFMPEG_PATH = "ffmpegPath";

	/**
	 * 上传文件的路径字符常量
	 */
	public static final String UPLOADFILE_PATH = "upFilePath";

	/**
	 * 编码后文件保存的路径字符常量
	 */
	public static final String CODEFILE_PATH = "codcFilePath";

	/**
	 * 视频截图保存的路径字符常量
	 */
	public static final String MEDIAPICPATH = "mediaPicPath";

	/**
	 * 静态语句块，读取用户的视频文件预览的配置
	 */
	static {
		Properties properties = new Properties();
		try {
			InputStream in = new BufferedInputStream(
					MediaTools.class.getResourceAsStream("/ffmpeg-setting.properties"));
			properties.load(in);
			Iterator<String> it = properties.stringPropertyNames().iterator();
			while (it.hasNext()) {
				String key = it.next();
				String value = properties.getProperty(key);
				logger.info("读取配置文件..." + key + ":" + value);
				switch (key) {
				case MediaTools.FFMPEG_PATH:// 工具的位置
					String[] paths = value.split(",");
					MediaTools.myffmpegPath = paths != null && paths[0].length() > 0 && paths[0].equals("-1") ? paths[1]
							: paths[0];

					logger.info("ffmpeg:" + myffmpegPath);

					break;
				case MediaTools.UPLOADFILE_PATH:// 上传文件的路径
					MediaTools.myupFilePath = (value != null && value.length() > 0) ? value : "c:/";
					break;
				case MediaTools.CODEFILE_PATH:// 编码后文件保存的位置
					MediaTools.mycodcFilePath = (value != null && value.length() > 0) ? value : "c:/";
					break;
				case MediaTools.MEDIAPICPATH:// 截图保存的位置
					MediaTools.mymediaPicPath = (value != null && value.length() > 0) ? value : "c:/";
				default:
					break;
				}
			}			 
		} catch (Exception e) {
			logger.error(e.toString());
		}
	}

	/**
	 * 视频转码
	 * 
	 * @param ffmpegPath
	 *            转码工具的存放路径
	 * @param upFilePath
	 *            用于指定要转换格式的文件,要截图的视频源文件
	 * @param codcFilePath
	 *            格式转换后的的文件保存路径
	 * @param mediaPicPath
	 *            截图保存路径
	 * @return
	 * @throws Exception
	 */
	public static boolean executeCodecs(String upFilePath, String codcFilePath, String mediaPicPath) throws Exception {
		logger.info("上传文件的路径:" + upFilePath);
		logger.info("编码后文件保存的路径：" + codcFilePath);
		logger.info("图片保存的路径：" + mediaPicPath);
		// 创建一个List集合来保存转换视频文件为flv格式的命令
		List<String> convert = new ArrayList<String>();
		convert.add(myffmpegPath); // 添加转换工具路径
		convert.add("-i"); // 添加参数＂-i＂，该参数指定要转换的文件
		convert.add(upFilePath); // 添加要转换格式的视频文件的路径
		convert.add("-qscale"); // 指定转换的质量
		convert.add("6");
		convert.add("-ab"); // 设置音频码率
		convert.add("64");
		convert.add("-ac"); // 设置声道数
		convert.add("2");
		convert.add("-ar"); // 设置声音的采样频率
		convert.add("22050");
		convert.add("-r"); // 设置帧频
		convert.add("24");
		convert.add("-y"); // 添加参数＂-y＂，该参数指定将覆盖已存在的文件
		convert.add(codcFilePath);

		// 创建一个List集合来保存从视频中截取图片的命令
		List<String> cutpic = new ArrayList<String>();
		cutpic.add(myffmpegPath);
		cutpic.add("-i");
		cutpic.add(upFilePath); // 同上（指定的文件即可以是转换为flv格式之前的文件，也可以是转换的flv文件）
		cutpic.add("-y");
		cutpic.add("-f");
		cutpic.add("image2");
		cutpic.add("-ss"); // 添加参数＂-ss＂，该参数指定截取的起始时间
		cutpic.add("1"); // 添加起始时间为第17秒
		cutpic.add("-t"); // 添加参数＂-t＂，该参数指定持续时间
		cutpic.add("0.001"); // 添加持续时间为1毫秒
		cutpic.add("-s"); // 添加参数＂-s＂，该参数指定截取的图片大小
		cutpic.add("800*600"); // 添加截取的图片大小为350*240
		cutpic.add(mediaPicPath); // 添加截取的图片的保存路径

		boolean mark = true;
		ProcessBuilder builder = new ProcessBuilder();
		try {
			builder.command(convert);
			builder.redirectErrorStream(true);

			builder.start();
			builder.command(cutpic);
			builder.redirectErrorStream(true);

			// 如果此属性为 true，则任何由通过此对象的 start() 方法启动的后续子进程生成的错误输出都将与标准输出合并，
			// 因此两者均可使用 Process.getInputStream() 方法读取。这使得关联错误消息和相应的输出变得更容易
			builder.start();
		} catch (Exception e) {
			mark = false;
			System.out.println(e);
			e.printStackTrace();
		}
		return mark;
	}

	/**
	 * 
	 * @param multipartFile
	 * @return
	 */
	public static MyMediaBean doProcessing(MultipartFile multipartFile, String relativePath, String fileName) {
		MyMediaBean myMediaBean = null;
		// 判断文件的大小
		if (multipartFile.getSize() > 500 * 1024 * 1024) {
			return null;
		}
		String tempPath = "";
		String savePath="";
		String mediaPicPath="";
		try {
			// 1.先将文件保存到目标地址
			String type = multipartFile.getOriginalFilename()
					.substring(multipartFile.getOriginalFilename().lastIndexOf(".") + 1);
			tempPath = MediaTools.myupFilePath + "/" + String.valueOf(System.currentTimeMillis()) + "." + type;

			logger.info("存放临时文件的地址：" + tempPath);

			Streams.copy(multipartFile.getInputStream(), new FileOutputStream(tempPath), true);
			// 2.进行解码			
			savePath = MediaTools.mycodcFilePath + "/" + ((relativePath != null) ? (relativePath + "/") : "")
					+ fileName + ".flv";			
			mediaPicPath = MediaTools.mymediaPicPath + "/" + ((relativePath != null) ? (relativePath + "/") : "")
					+ fileName + ".jpg";
			// 创建文件夹
			createDir(MediaTools.mycodcFilePath + "/" + ((relativePath != null) ? (relativePath) : ""));
			createDir(MediaTools.mymediaPicPath + "/" + ((relativePath != null) ? (relativePath) : ""));
			boolean flag = false;

			flag = MediaTools.executeCodecs(tempPath, savePath, mediaPicPath);
			if (!flag) {
				return null;
			}
			// 4.封装结果bean
			myMediaBean = new MediaTools().new MyMediaBean();
			myMediaBean.setSaveFilePath(savePath);
			myMediaBean.setPicPath(mediaPicPath);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return myMediaBean;
	}

	/**
	 * 封装media的内部类
	 * 
	 * @author cp
	 *
	 */
	public class MyMediaBean {

		/**
		 * 保存解码后文件的位置
		 */
		private String saveFilePath;

		/**
		 * 截图保存的位置
		 */
		private String picPath;

		public String getSaveFilePath() {
			return saveFilePath;
		}

		public void setSaveFilePath(String saveFilePath) {
			this.saveFilePath = saveFilePath;
		}

		public String getPicPath() {
			return picPath;
		}

		public void setPicPath(String picPath) {
			this.picPath = picPath;
		}

	}

	/**
	 * 创建目录
	 * 
	 * @param dir
	 */
	private static void createDir(String dir) {
		logger.info("要创建的文件夹路径：" + dir.replace("/", "\\\\"));
		File fileDir = new File(dir);
		if (!fileDir.exists() && !fileDir.isDirectory()) {
			fileDir.mkdirs();
		}
	}

}
