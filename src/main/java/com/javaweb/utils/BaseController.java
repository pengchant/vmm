package com.javaweb.utils;
 
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * Controller基类
 * @author cp
 *
 */
public class BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	
	/**
	 * 处理返回结果
	 * @param object
	 * @return
	 */
	@SuppressWarnings({ "unused" })
	public String responseResult(Object object){
		JSONObject jsonObject = new JSONObject();
		if(jsonObject!=null){
			logger.info("后端返回的对象:{}",object);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
			jsonObject = JSONObject.fromObject(object,jsonConfig);
			logger.info("后端返回的数据:{}",jsonObject);
			if(HttpConstants.SERVICE_RESPONSE_SUCCESS_CODE.equals(jsonObject.getString(HttpConstants.SERVICE_RESPONSE_RESULT_FLAG))){
				jsonObject.element(HttpConstants.RESPONSE_RESULT_FLAG_ISERROR, false);
				jsonObject.element(HttpConstants.SERVICE_RESPONSE_RESULT_MSG, "");
			}else{
				jsonObject.element(HttpConstants.RESPONSE_RESULT_FLAG_ISERROR, true);
				String errorMsg = jsonObject.getString(HttpConstants.SERVICE_RESPONSE_RESULT_MSG);
				jsonObject.element(HttpConstants.SYSTEM_ERROR_MSG, errorMsg==null?HttpConstants.SERVICE_RESPONSE_NULL:errorMsg);
			}
 		}
		logger.info("输出的结果:{}",jsonObject!=null?jsonObject.toString():null);
		return jsonObject!=null?jsonObject.toString():null;
	}
	
	/**
     * 返回成功Object
     * @param obj 输出对象
     * @return 输出成功的JSON格式数据
     */
	public String responseSuccess(Object obj){
		JSONObject jsonObj = new JSONObject();
		if(obj != null){
		    logger.info("后端返回对象：{}", obj);
		    JsonConfig jsonConfig = new JsonConfig(); 
		    jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		    jsonObj = JSONObject.fromObject(obj, jsonConfig);
		    logger.info("后端返回数据：" + jsonObj);
		    jsonObj.element(HttpConstants.RESPONSE_RESULT_FLAG_ISERROR, false);
		    jsonObj.element(HttpConstants.SERVICE_RESPONSE_RESULT_MSG, "");
		}
		logger.info("输出结果：{}", jsonObj.toString());
		return jsonObj.toString();
	}

	/**
	 * 返回成功Array
	 * @param obj 输出对象
	 * @return 输出成功的JSON格式数据
	 */
	public String responseArraySuccess(Object obj){
		JSONArray jsonObj = new JSONArray();
		if(obj != null){
			logger.info("后端返回对象：{}", obj);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
			jsonObj = JSONArray.fromObject(obj, jsonConfig);
			logger.info("后端返回数据：" + jsonObj);
		}
		logger.info("输出结果：{}", jsonObj.toString());
		return jsonObj.toString();
	}
	
	/**
     * 返回成功Object 可以输出参数
     * @param obj 输出对象
     * @return 输出成功的JSON格式数据
     */
	public String responseSuccess(Object obj, String msg){
		JSONObject jsonObj = new JSONObject();
		if(obj != null){
		    logger.info("后端返回对象：{}", obj);
		    JsonConfig jsonConfig = new JsonConfig(); 
		    jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		    jsonObj = JSONObject.fromObject(obj, jsonConfig);
		    logger.info("后端返回数据：" + jsonObj);
		    jsonObj.element(HttpConstants.RESPONSE_RESULT_FLAG_ISERROR, false);
		    jsonObj.element(HttpConstants.SERVICE_RESPONSE_RESULT_MSG, msg);
		}
		logger.info("输出结果：{}", jsonObj.toString());
		return jsonObj.toString();
	}
	
	/**
     * 返回失败 输入失败的结果
     * @param errorMsg 错误信息
     * @return 输出失败的JSON格式数据
     */
    public String responseFail(String errorMsg){
    	JSONObject jsonObj = new JSONObject();
    	jsonObj.put(HttpConstants.RESPONSE_RESULT_FLAG_ISERROR, true);
    	jsonObj.put(HttpConstants.SERVICE_RESPONSE_RESULT_MSG, errorMsg);
        logger.info("输出结果：{}", jsonObj.toString());
        return jsonObj.toString();
    }

}
