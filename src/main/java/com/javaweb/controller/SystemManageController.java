package com.javaweb.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.utils.CreateFileUtil;
import com.javaweb.utils.MyWebUtils;
import com.javaweb.utils.StringUtils;
import com.javaweb.views.UserView;

/**
 * 系统管理
 * 
 * @author PengChan
 *
 */
@Controller
@RequestMapping("/base")
@Scope("prototype")
public class SystemManageController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(SystemManageController.class);
	
	// 数据库名称
	public static String databasename = "";
	// mysql安装的地址
	public static String mysqldump = "";
	// 数据库用户名
	public static String username="";
	// 数据库密码
	public static String password = "";
	// mysqlexe
	public static String mysqlexe="";
	
	static{
		try {
			Properties properties = new Properties();
			properties.load(SystemManageController.class.getResourceAsStream("/jdbc.properties"));
			databasename = properties.getProperty("databasename");
			mysqldump = properties.getProperty("mysqldump");
			username = properties.getProperty("username");
			password = properties.getProperty("password"); 
			mysqlexe = properties.getProperty("mysqlexe");
		} catch (Exception e) {
			logger.error("读取mysql备份还原配置失败");
		}
	}

	

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@Autowired
	private ServiceFactory serviceFactory;

	/**
	 * 查询所有的用户
	 * 
	 * @param status
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/queryUser")
	@ResponseBody
	public String queryUser(String status, Integer page, Integer rows, String key) {
		return responseSuccess(serviceFactory.getSystemManageService().queryAllUser(page, rows, status, key));
	}

	/**
	 * 用户信息管理 operation:c:创建,u:更新,d:删除
	 * 
	 * @return
	 */
	@RequestMapping("/{operation}/modiUser")
	@ResponseBody
	public String modiUser(UserView userView, String allprivileges, @PathVariable("operation") String operation) {
		boolean flag = false;
		if (org.apache.commons.lang.StringUtils.isNotBlank(operation)) {
			try {
				int[] myprivileges = null;
				logger.info("===========================>allprivileges：" + allprivileges);
				if (org.apache.commons.lang.StringUtils.isNotBlank(allprivileges)) {
					String[] privileges = allprivileges.split(",");
					myprivileges = new int[privileges.length];
					for (int i = 0; i < myprivileges.length; i++) {
						myprivileges[i] = StringUtils.getIntegerValue(privileges[i], -1);
					}
				}
				flag = serviceFactory.getSystemManageService().modifyUser(userView, myprivileges, operation);
			} catch (Exception e) {
				logger.error("用户信息管理异常!");
			}
		}
		return responseSuccess(flag);
	}

	/**
	 * 查询所有的权限
	 * 
	 * @return
	 */
	@RequestMapping("/queryAllPrivilege")
	@ResponseBody
	public String queryAllPrivilege() {
		return responseArraySuccess(serviceFactory.getSystemManageService().queryAllPermission());
	}

	/**
	 * 查询所有的部门
	 * 
	 * @return
	 */
	@RequestMapping("/queryAllSector")
	@ResponseBody
	public String queryAllSector() {
		return responseArraySuccess(serviceFactory.getSystemManageService().queryAllSectors());
	}

	/**
	 * 查询所有用户的权限
	 * 
	 * @param accountnumber
	 * @return
	 */
	@RequestMapping("/queryAllUserPrivilege")
	@ResponseBody
	public String queryAllUserPrivilege(String accountnumber) {
		return responseArraySuccess(serviceFactory.getSystemManageService().queryAllUserPer(accountnumber));
	}

	/**
	 * 修改用户密码
	 * 
	 * @param accountid
	 * @return
	 */
	@RequestMapping("/modiPass")
	@ResponseBody
	public String modiPass(String pass, HttpServletRequest request) {
		boolean flag = false;
		String accountnumber = MyWebUtils.getCurrentUser(request).getAccountnumber();
		flag = serviceFactory.getSystemManageService().modifyPass(pass, accountnumber);
		return responseSuccess(flag);
	}
	
	
	/**
	 * 数据库备份
	 * 
	 * @param location
	 * @return
	 */
	@RequestMapping("/databaseBF")
	@ResponseBody
	public String databaseBF(String location, HttpServletRequest request) {		
		boolean flag = false;
		if(org.apache.commons.lang.StringUtils.isNotBlank(location)){
			try {
	            Runtime rt = Runtime.getRuntime();
	 
	            // 调用 调用mysql的安装目录的命令
	            Process child = rt
	                    .exec(mysqldump+" -h localhost -u"+username+" -p"+password+" "+databasename);
	            // 设置导出编码为utf-8。这里必须是utf-8
	            // 把进程执行中的控制台输出信息写入.sql文件，即生成了备份文件。注：如果不对控制台信息进行读出，则会导致进程堵塞无法运行
	            InputStream in = child.getInputStream();// 控制台的输出信息作为输入流
	 
	            InputStreamReader xx = new InputStreamReader(in, "utf-8");
	            // 设置输出流编码为utf-8。这里必须是utf-8，否则从流中读入的是乱码
	 
	            String inStr;
	            StringBuffer sb = new StringBuffer("");
	            String outStr;
	            // 组合控制台输出信息字符串
	            BufferedReader br = new BufferedReader(xx);
	            while ((inStr = br.readLine()) != null) {
	                sb.append(inStr + "\r\n");
	            }
	            outStr = sb.toString();
	 
	            // 要用来做导入用的sql目标文件：
	            CreateFileUtil.createFile(location);
	            File objfile = new File(location); 
	            FileOutputStream fout = new FileOutputStream(objfile);
	            OutputStreamWriter writer = new OutputStreamWriter(fout, "utf-8");
	            writer.write(outStr);
	            writer.flush();
	            in.close();
	            xx.close();
	            br.close();
	            writer.close();
	            fout.close();  
	            flag = true;
	        } catch (Exception e) { 
	           logger.info("数据库备份操作失败!");
	        }
		} 
		return flag?responseSuccess(flag):responseFail("数据库备份操作失败！");
	}
	

	/**
	 * 数据库还原
	 * 
	 * @param location
	 * @return
	 */
	@RequestMapping("/databaseHY")
	@ResponseBody
	public String databaseHY(HttpServletRequest request,@RequestParam("refreshfile")MultipartFile multipartFile) {		
		boolean flag = false;
		  try {
	            Runtime runtime = Runtime.getRuntime();
	            Process process = runtime
	                    .exec(mysqlexe+" -hlocalhost -u"+username+" -p"+password+" --default-character-set=utf8 "+databasename);
	            OutputStream outputStream = process.getOutputStream();
	            BufferedReader br = new BufferedReader(new InputStreamReader(
	                    multipartFile.getInputStream(), "utf-8"));
	            String str = null;
	            StringBuffer sb = new StringBuffer();
	            while ((str = br.readLine()) != null) {
	                sb.append(str + "\r\n");
	            }
	            str = sb.toString();
	          
	            OutputStreamWriter writer = new OutputStreamWriter(outputStream,
	                    "utf-8");
	            writer.write(str);
	            writer.flush();
	            outputStream.close();
	            br.close();
	            writer.close();
	            logger.info("===========>执行完毕!");
	            flag = true;
	        } catch (Exception e) {  
	            logger.info("数据库还原操作失败!");
	        }
		return flag?responseSuccess(flag):responseFail("数据库还原操作失败！");
	}
}
