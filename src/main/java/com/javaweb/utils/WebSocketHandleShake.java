package com.javaweb.utils;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

public class WebSocketHandleShake implements HandshakeInterceptor{

	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandleShake.class);
	
	@Override
	public void afterHandshake(ServerHttpRequest arg0, ServerHttpResponse arg1, WebSocketHandler arg2, Exception arg3) {
		logger.info("建立握手成功!");
	}

	/**
	 * 在握手之前
	 */
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler handler,
			Map<String, Object> attributes) throws Exception {
		if(request instanceof ServletServerHttpRequest){
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
			HttpSession session = servletRequest.getServletRequest().getSession(false);
			if(session!=null){
				String userName = session.getAttribute(SystemWebSocketHandler.WEBSOCKET_USER).toString();
				attributes.put(SystemWebSocketHandler.WEBSOCKET_USER,userName);				
			}
		}
		return false;
	}

}
