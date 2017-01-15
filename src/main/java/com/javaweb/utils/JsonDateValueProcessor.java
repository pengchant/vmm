package com.javaweb.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonDateValueProcessor implements JsonValueProcessor {

	/**
	 * datePattern
	 */
	private String dataPattern = "yyyy-MM-dd HH:mm:ss";

	public JsonDateValueProcessor() {
		super();
	}

	public JsonDateValueProcessor(String format) {
		super();
		this.dataPattern = format;
	}

	@Override
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		return process(value);
	}

	@Override
	public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
		return process(value);
	}

	/**
	 * 处理函数
	 * 
	 * @param value
	 * @return
	 */
	private Object process(Object value) {
		try {
			if (value instanceof Date) {
				SimpleDateFormat sdf = new SimpleDateFormat(dataPattern, Locale.CHINA);
				return sdf.format((java.util.Date) value);
			}
			return value == null ? "" : value.toString();
		} catch (Exception e) {
			return "";
		}
	}

	public String getDataPattern() {
		return dataPattern;
	}

	public void setDataPattern(String dataPattern) {
		this.dataPattern = dataPattern;
	}

}
