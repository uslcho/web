package test.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import test.login.dto.LoginDTO;
import test.login.service.LoginService;

@Controller
public class LoginController {

	private final Log log = LogFactory.getLog(LoginController.class);

	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView UserLogin(HttpServletRequest request, HttpServletResponse response) {		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value="/test.do", method=RequestMethod.GET)
	public ModelAndView Test(HttpServletRequest request, HttpServletResponse response) {		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");
		return mav;
	}	
	
	@RequestMapping(value="/bootstrap.do", method=RequestMethod.GET)
	public ModelAndView BootstrapTest(HttpServletRequest request, HttpServletResponse response) {		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bootstrap");
		return mav;
	}	
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public void getLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response, LoginDTO loginDTO) {		
		try {
			
			log.debug("222222222222222222222222222222");
			
			LoginDTO login = this.loginService.getLogin(loginDTO);
			if(login == null) {
				response.sendRedirect("/web/login.do");
			} else {				
				session.setAttribute("usernm", login.getUsernm());
				session.setAttribute("membno", login.getMembno());
				response.sendRedirect("/web/loginSuccess.do");
			}			
		}catch(Exception e) {
			log.info("login Fail...");
			e.printStackTrace();
		}
	}

	@RequestMapping("/loginout.do")
	public void LoginOut(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		try {
			session.removeAttribute("usernm");
			session.removeAttribute("membno");				
			response.sendRedirect("/web/login.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/loginSuccess.do")
	public ModelAndView LoginSuccess(HttpServletRequest request, HttpServletResponse response) {		
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("loginSuccess");
		return mav;
	}	
}