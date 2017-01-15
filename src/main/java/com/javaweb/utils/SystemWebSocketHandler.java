package com.javaweb.utils;

import java.util.ArrayList;


import org.slf4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;


public class SystemWebSocketHandler implements WebSocketHandler {

	private static final Logger logger;
	
	public static final String WEBSOCKET_USER="userid";
	
	private static final ArrayList<WebSocketSession> users;
	
	static{
		users = new ArrayList<WebSocketSession>();
		logger = org.slf4j.LoggerFactory.getLogger(SystemWebSocketHandler.class);		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		logger.info("websocket被关闭...");
		users.remove(session);
	}

	/**
	 * 连接成功之后
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("连接websocket成功...");
		users.add(session);
		String userName = (String) session.getAttributes().get(WEBSOCKET_USER);
		if(userName==null){
			users.add(session);
		}
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// sendMessageToUsers();
	}

	/**
	 * 传输失败
	 */
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		if(session.isOpen()){
			session.close();
		}
		logger.info("websocket被关闭...");
		users.remove(session);
	}
 
	@Override
	public boolean supportsPartialMessages() {
		return false;
	}
	
	/**
	 * 给所有的用户发送消息
	 * @param message
	 */
	public void sendMessageToUsers(TextMessage message){
		for(WebSocketSession userSession:users){
			try {
				if(userSession.isOpen()){
					userSession.sendMessage(message);
				}
			} catch (Exception e) {
				logger.error(e.toString());
			}
		}
	}
	
	/**
	 * 给某个用户发送消息
	 * @param userName
	 * @param message
	 */
	public void sendMessageToUser(String userName,TextMessage message){
		for(WebSocketSession userSession:users){
			if(userSession.getAttributes().get(WEBSOCKET_USER).equals(userName)){
				try {
					if(userSession.isOpen()){
						userSession.sendMessage(message);
					}
				} catch (Exception e) {
					logger.error(e.toString());
				}
			}
		}
	}
	

}
