package com.javaweb.views;

import java.util.HashMap;
import java.util.Map;
 

/**
 * 功能项
 * 
 * @author cp
 *
 */
public class AccordingItem {
	private int id;
	private String text;
	private String iconCls;
	private Map<String, Object> attributes;
	
	public AccordingItem() {
		 this.attributes = new HashMap<String, Object>();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

}
