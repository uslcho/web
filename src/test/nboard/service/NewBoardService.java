package test.nboard.service;

import java.math.BigDecimal;
import java.util.List;
import test.nboard.dto.NewBoardDTO;

public interface NewBoardService {
	
	//게시판 상세보기
	public NewBoardDTO getBoard(BigDecimal b_no) throws Exception;
	
	//게시판 리스트
	public List<NewBoardDTO> getBoardList(NewBoardDTO newBoardDTO) throws Exception;

	//총갯수
	public int getBoardTotalcnt(NewBoardDTO newBoardDTO) throws Exception;
	
	//입력
	public int insertBoard(NewBoardDTO newBoardDTO) throws Exception;
	
	//수정
	public void updateBoard(NewBoardDTO newBoardDTO)  throws Exception;
	
	//리플
	public int insertReplyBoard(NewBoardDTO newBoardDTO) throws Exception;
}