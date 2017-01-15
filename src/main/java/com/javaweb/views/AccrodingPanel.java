package com.javaweb.views;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单面板
 * 
 * @author cp
 *
 */
public class AccrodingPanel {
	
	/**
	 * 菜单里面的功能列表
	 */
	private List<AccordingElement> elements;
	
	public AccrodingPanel() { 
		this.elements = new ArrayList<AccordingElement>();
	} 

	public List<AccordingElement> getElements() {
		return elements;
	}

	public void setElements(List<AccordingElement> elements) {
		this.elements = elements;
	}
	 

}
