package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.javaweb.dao.DaoFactory;
import com.javaweb.entity.Account;
import com.javaweb.entity.Permission;
import com.javaweb.service.IUserValidateService;
import com.javaweb.views.AccordingElement;
import com.javaweb.views.AccordingItem;
import com.javaweb.views.AccrodingPanel;
import com.javaweb.views.LoginBean;

@Service
public class UserValidateService implements IUserValidateService {

	private static final Logger logger = LoggerFactory.getLogger(UserValidateService.class);

	@Resource
	private DaoFactory daoFactory;

	/**
	 * 根据账号里面的username和password查询用户的信息
	 */	 
	public LoginBean userislawable(Account account) {
		if (account == null) {
			return null;
		}
		LoginBean loginBean = null;
		try {
			loginBean = daoFactory.getAccontMapper().selectcount(account);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return loginBean;
	}

	/**
	 * 查询用户所有的权限
	 */	 
	public AccrodingPanel queryUserPrivleges(Account account) {
		// 先获取到用户所有的权限
		if (account == null) {
			return null;
		}
		AccrodingPanel accordingPanel = null;
		try {
			List<Permission> permissions = daoFactory.getPermissionMapper()
					.getAllUserPermission(account.getAccountnumber());
			if (permissions != null && permissions.size() > 0) {
				accordingPanel = new AccrodingPanel();
                Set<String> history = new HashSet<>();
                String currentCategory = ""; 
				// 开始解析数据
				accordingPanel = new AccrodingPanel();
				// 里面的每个大项
				List<AccordingElement> elements = new ArrayList<>();
				// 1.先解析出所有的大类
				// 2.依据大类再抽取出所有的子类				
				for (Permission p : permissions) {
					currentCategory = p.getAuthcategory();
					// 如果是新类
					if(!history.contains(currentCategory)){
						// 实例化一个项目
						AccordingElement element = new AccordingElement();
						element.setTitle(currentCategory);
						// 开始解析这个大项目下的所有子项目
						List<AccordingItem> items = new ArrayList<>();
						for(Permission _p:permissions){							 
							// 如果符合大类
							if(currentCategory.equals(_p.getAuthcategory())){
								AccordingItem item = new AccordingItem();
								item.setId(_p.getId());
								item.setText(_p.getPername());
								item.setIconCls(_p.getPerurl().split("#")[1]);
								Map<String, Object> attributes = new HashMap<String,Object>();
								attributes.put("url", _p.getPerurl().split("#")[0]);
								item.setAttributes(attributes);
								// 添加到item中
								items.add(item);								
							}
							element.setData(items);
							element.setDataJSON(JSON.toJSONString(items));
						}
						// 把这个项目添加到elements中
						elements.add(element);						 
						// 添加到历史记录中
						history.add(currentCategory);
					} 
				} 
				// 最后把所有的面板项项加到面板中
				accordingPanel.setElements(elements);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString());
		}
		logger.info("返回到前台的所有的panel格式如下：-->"+JSON.toJSONString(accordingPanel));
		return accordingPanel;
	}

}
