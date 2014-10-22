package test.nboard.service;

import java.math.BigDecimal;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import test.nboard.dao.NewBoardDAO;
import test.nboard.dto.NewBoardDTO;

@Service
public class NewBoardServiceImpl  implements NewBoardService{

	private static Logger logger = Logger.getLogger(NewBoardServiceImpl.class);
	
	@Autowired
	private NewBoardDAO newBoardDAO;
	
	//게시판 상세보기
	@Override
	@Transactional(readOnly=true)
	public NewBoardDTO getBoard(BigDecimal b_no) throws Exception {
		return this.newBoardDAO.getBoard(b_no);
	}
	
	//게시판 리스트
	@Override
	@Transactional(readOnly=true)	
	public List<NewBoardDTO> getBoardList(NewBoardDTO newBoardDTO) throws Exception {
		return this.newBoardDAO.getBoardList(newBoardDTO);
	}
	
	//총갯수
	@Override
	@Transactional(readOnly=true)	
	public int getBoardTotalcnt(NewBoardDTO newBoardDTO) throws Exception {
		return this.newBoardDAO.getBoardTotalcnt(newBoardDTO);
	}
	
	//입력
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insertBoard(NewBoardDTO newBoardDTO) throws Exception {
		int newref = this.newBoardDAO.getRefMax();
		newBoardDTO.setRef(new BigDecimal(newref));
		return this.newBoardDAO.insertBoard(newBoardDTO);
	}
	
	//수정
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})	
	public void updateBoard(NewBoardDTO newBoardDTO)  throws Exception {
		this.newBoardDAO.updateBoard(newBoardDTO);
	}
	
	//삭제
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})	
	public void deleteBoard(NewBoardDTO newBoardDTO)  throws Exception {
		this.newBoardDAO.deleteBoard(newBoardDTO);
		deleteBoardComment(newBoardDTO);
	}
	
	//리플
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})		
	public int insertReplyBoard(NewBoardDTO newBoardDTO) throws Exception {
		//순번(step)을 제 세팅한다 
		//같은 ref(최상위부모값)을 가진 것 중 현재 답글을 달 게시물의 순번보다 큰것을 +1로 하며 하나씩 밀리게 한다.
		this.newBoardDAO.updateCommunitySetp(newBoardDTO);
		
		//현재 답글의 순번을 생성하고 모델에 저장한다.
		int netstep = this.newBoardDAO.getStepMax(newBoardDTO);		
		newBoardDTO.setStep(new BigDecimal(netstep));
		
		//답글 저장
		return this.newBoardDAO.insertReplyBoard(newBoardDTO);
	}
	
	//코멘트
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public void insertComment(NewBoardDTO newBoardDTO) throws Exception {
		this.newBoardDAO.insertComment(newBoardDTO);
	}
	
	//코멘트리스트
	@Override
	@Transactional(readOnly=true)	
	public List<NewBoardDTO> listBoardComment(NewBoardDTO newBoardDTO) throws Exception {
		return this.newBoardDAO.listBoardComment(newBoardDTO);
	}
	
	//코멘트삭제
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})	
	public void deleteBoardComment(NewBoardDTO newBoardDTO)  throws Exception {
		this.newBoardDAO.deleteBoardComment(newBoardDTO);
	}	
}