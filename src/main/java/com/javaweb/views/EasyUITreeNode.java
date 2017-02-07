package com.javaweb.views;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.javaweb.utils.MyErrorPrinter;

/**
 * easyui 树形目录的单元节点
 * 
 * @author cp
 *
 */
public class EasyUITreeNode {
	
	private static final Logger logger = LoggerFactory.getLogger(EasyUITreeNode.class);

	// 树形目录的id
	private String id;

	// 树形目录的标题
	private String text;
	
	// 图标
	private String iconCls;

	// 树形目录的状态('open','closed')
	private String state;

	// 树形目录的选中状态
	private boolean checked;

	// 树形目录的属性
	private HashMap<String, String> attributes;

	// 树形目录的子节点
	private List<EasyUITreeNode> children;

	public EasyUITreeNode() {

	}

	/**
	 * 创建easyui的树形目录的单元节点
	 * @param id			树形目录的编号
	 * @param text			树形目录的text值
	 * @param iconCls		树形目录的icon值
	 * @param state			树形目录的状态
	 * @param checked		树形目录的选中状态
	 * @param attributes	树形目录的属性
	 * @param children		树形目录的子节点
	 */
	public EasyUITreeNode(String id, String text,String iconCls, String state, boolean checked, HashMap<String, String> attributes,
			List<EasyUITreeNode> children) {
		super();
		this.id = id;
		this.text = text;
		this.iconCls = iconCls;
		this.state = state;
		this.checked = checked;
		this.attributes = attributes;
		this.children = children;
	}
	
	

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean getChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public HashMap<String, String> getAttributes() {
		return attributes;
	}

	public void setAttributes(HashMap<String, String> attributes) {
		this.attributes = attributes;
	}

	public List<EasyUITreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<EasyUITreeNode> children) {
		this.children = children;
	}
	
	/**
	 * 添加一个children节点到当前节点中
	 * @param childrenNode
	 */
	public void pushChildrenNode(EasyUITreeNode childrenNode){
		if(this.children==null){
			this.children = new ArrayList<>();
		}
		this.children.add(childrenNode);
	}
	
	/**
	 * 添加一个属性到当前节点中
	 * @param key
	 * @param value
	 */
	public void pushAttributes(String key,String value){
		if(this.attributes==null){
			this.attributes = new HashMap<>();
		}
		try {
			this.attributes.put(key, value);
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
	}

}
