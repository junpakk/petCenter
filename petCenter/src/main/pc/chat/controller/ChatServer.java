package main.pc.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;


@ServerEndpoint("/chatserver")
public class ChatServer {
	Logger logger = LogManager.getLogger(ChatServer.class);
	
	
	//현재 채팅 서버에 접속한 클라이언트(WebSocket Session) 목록
	//static 붙여야함
	private static List<Session> list = new ArrayList<Session>();
	
	private void print(String msg) {
		System.out.printf("[%tT] %s\n", Calendar.getInstance(), msg);
	}
	
	@OnOpen
	public void handleOpen(Session session) {
		print("클라이언트 연결");
		list.add(session);//접속자 관리
	}
	
	@OnMessage
	public void handleMessage(String msg, Session session) {
		//ws.send("1#" + $("#user").val() + "#");
		//로그인할때: 1#유저명
		//대화할때: 2유저명#메세지
		int index = msg.indexOf("#", 2);
		logger.info("index: "+ index);
		String no = msg.substring(0,1);
		logger.info("no: "+ no);
		String user = msg.substring(2,index);
		logger.info("user: "+ user);
		String txt = msg.substring(index + 1);
		logger.info("txt: "+ txt);
		
		if(no.equals("1")) {
			//누군가 접속 > 1#아무개
			for(Session s : list) {
				//현재 접속자가 아닌 나머지 사람들
				if(s != session) {
					try {
						s.getBasicRemote().sendText("1#"+ user + "#");
					}catch(IOException e) {
						e.printStackTrace();
					}
				}
			}//end of for
		}else if(no.equals("2")) {
			//누군가 메시지를 전송
			for(Session s : list) {
				//현재 접속자가 아닌 나머지 사람들
				if(s != session) {
					try {
						//s.getBasicRemote().sendText("2#"+ user +" : "+ txt);
						s.getBasicRemote().sendText("2#"+ user +" : "+ txt);
					}catch(IOException e) {
						e.printStackTrace();
					}
				}
			}//end of for
		}else if(no.equals("3")) {
			//누군가 접속 > 3#아무개
			for(Session s : list) {
				//현재 접속자가 아닌 나머지 사람들
				if(s != session) {
					try {
						s.getBasicRemote().sendText("3#"+ user +"#");
					}catch(IOException e) {
						e.printStackTrace();
					}
				}
			}//end of for
			list.remove(session);
		}//end of if-else
	}//end of handleMessage
	
	@OnClose
	public void handleClose() {
		
	}
	
	@OnError
	public void handleError(Throwable t) {
		
	}

}
