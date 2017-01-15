package com.javaweb.views;

import java.util.ArrayList;
import java.util.List;

/**
 * 导航功能菜单项
 * @author cp
 *
 */
public class AccordingElement {
	
	/**
	 * 面板标题
	 */
	private String title;
	
	/**
	 * 面板项
	 */
	private List<AccordingItem> data;
	
	/**
	 * 面板项数据JSON格式
	 */
	private String dataJSON; 
	
	public AccordingElement() {
		this.data = new ArrayList<AccordingItem>();
	}

	public String getDataJSON() {
		return dataJSON;
	}

	public void setDataJSON(String dataJSON) {
		this.dataJSON = dataJSON;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<AccordingItem> getData() {
		return data;
	}

	public void setData(List<AccordingItem> data) {
		this.data = data;
	}
	
	
	
}
