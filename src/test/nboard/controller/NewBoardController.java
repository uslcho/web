package test.nboard.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import test.nboard.dto.NewBoardDTO;
import test.nboard.service.NewBoardService;

@Controller
public class NewBoardController {
	private static Logger logger = Logger.getLogger(NewBoardController.class);
	
	@Autowired
	private NewBoardService newboardService;
	
	@RequestMapping("/view/board/newlist.do")
	public ModelAndView getBoardList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		try {
			NewBoardDTO pageModel = new NewBoardDTO();
			pageModel.setPageline(1);
			
			int page = 0;
			int nowpage = 1;
			if(request.getParameter("page") == null) {
				pageModel.setPage(0);	
				nowpage = 1;
			} else {
				page = (Integer.parseInt(request.getParameter("page"))-1)*pageModel.getPageline();
				pageModel.setPage(page);	
				nowpage = Integer.parseInt(request.getParameter("page"));
			}
			
			int totalcnt = this.newboardService.getBoardTotalcnt(pageModel);
			
			int totalpage = 1;			
			Double doublepage = 0.0;
			if(totalcnt > 0) {
				doublepage = Double.valueOf(totalcnt)/Double.valueOf(pageModel.getPageline());
				totalpage = (int)Math.ceil(doublepage);
			}
			
			List<NewBoardDTO> newboardList = newboardService.getBoardList(pageModel);			
			mav.addObject("newboardList", newboardList);
			mav.addObject("totalcnt", totalcnt);
			mav.addObject("totalpage", totalpage);
			mav.addObject("nowpage", nowpage);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("/board/newlist");
		return mav;
	}
	
	@RequestMapping("/view/board/newview.do")
	public ModelAndView getBoard(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		try {
			if(request.getParameter("b_no") != null && !request.getParameter("b_no") .equals("")) {
				NewBoardDTO newBoardDTO = newboardService.getBoard(new BigDecimal(request.getParameter("b_no")));
				String content = newBoardDTO.getNewcontents();
				content = content.replaceAll ("\"", "'");
				content = content.replaceAll ("\n", "<br />");
				//content = content.replaceAll ("&nbsp;", "&amp;nbsp;");
				//content = content.replaceAll ("&nbsp;", " ");				
				System.out.println("content====>>>>"+content);
				
				newBoardDTO.setNewcontents(content);
				mav.addObject("newBoardDTO", newBoardDTO);
				mav.setViewName("/board/newview");
			} else {
				mav.setViewName("/board/newlist");
				response.sendRedirect("/web/view/board/newlist.do");
			}
		}catch(Exception e) {
		}	
		return mav;
	}
	
	@RequestMapping(value="/view/board/newwrite.do", method=RequestMethod.GET)
	public ModelAndView writeBoard(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		if(request.getParameter("b_no") != null && !request.getParameter("b_no") .equals("")) {
			try {		
				NewBoardDTO newBoardDTO = newboardService.getBoard(new BigDecimal(request.getParameter("b_no")));
				String content = newBoardDTO.getNewcontents();
				content = content.replaceAll ("\"", "'");
				newBoardDTO.setNewcontents(content);
				mav.addObject("newBoardDTO", newBoardDTO);
			}catch(Exception e) {
			
			}
		}
		mav.setViewName("/board/newwrite");
		return mav;
	}
	
	@RequestMapping(value="/view/board/newwrite.do", method=RequestMethod.POST)
	public void insertBoard(HttpServletRequest request, HttpServletResponse response, NewBoardDTO newBoardDTO, BindingResult errors) {
		if(errors.hasErrors()) {
			logger.info("errors..");
		}		
		try {		
			int b_no = 0;			
			if(request.getParameter("b_no") != null && !request.getParameter("b_no") .equals("")) {				
				String content = request.getParameter("content");			
				newBoardDTO.setNewcontents(content);	
				b_no = Integer.parseInt(request.getParameter("b_no"));
				newboardService.updateBoard(newBoardDTO);
			} else {
				String content = request.getParameter("content");			
				newBoardDTO.setNewcontents(content);
				b_no = newboardService.insertBoard(newBoardDTO);
			}
			response.sendRedirect("/web/view/board/newview.do?b_no="+b_no);
		}catch(Exception e) {
			logger.info("insert Fail...");
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/view/board/newReply.do", method=RequestMethod.GET)
	public ModelAndView replyBoard(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		if(request.getParameter("b_no") != null && !request.getParameter("b_no") .equals("")) {
			try {		
				NewBoardDTO newBoardDTO = newboardService.getBoard(new BigDecimal(request.getParameter("b_no")));
				String content = newBoardDTO.getNewcontents();
				content = content.replaceAll ("\"", "'");
				newBoardDTO.setNewcontents(content);
				mav.addObject("newBoardDTO", newBoardDTO);
			}catch(Exception e) {
			
			}
		}
		mav.setViewName("/board/newReply");
		return mav;
	}
	
	@RequestMapping(value="/view/board/newReply.do", method=RequestMethod.POST)
	public void insertReplyBoard(HttpServletRequest request, HttpServletResponse response, NewBoardDTO newBoardDTO, BindingResult errors) {
		if(errors.hasErrors()) {
			logger.info("errors..");
		}		
		try {		
			int b_no = 0;			
			if(request.getParameter("b_no") != null && !request.getParameter("b_no") .equals("")) {				
				String content = request.getParameter("content");
				newBoardDTO.setNewcontents(content);
				b_no = newboardService.insertReplyBoard(newBoardDTO);
			}
			response.sendRedirect("/web/view/board/newview.do?b_no="+b_no);
		}catch(Exception e) {
			logger.info("insert Fail...");
			e.printStackTrace();
		}
	}	
}