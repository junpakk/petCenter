package main.pc.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	
	//HttpServletRequest req, HttpServletResponse resp, HttpSession session
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String chat() {
		return "chat/chat";
	}
}
