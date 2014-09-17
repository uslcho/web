package test.nboard.dao;

import java.math.BigDecimal;
import java.util.List;

import test.nboard.dto.NewBoardDTO;

public interface NewBoardDAO {
	public NewBoardDTO getBoard(BigDecimal b_no) throws Exception;
	
	public List<NewBoardDTO> getBoardList(NewBoardDTO newBoardDTO) throws Exception;
	
	public int insertBoard(NewBoardDTO newBoardDTO) throws Exception;
	
	public void updateBoard(NewBoardDTO newBoardDTO)  throws Exception;
	
	public int getRefMax()  throws Exception;
	
	public void updateCommunitySetp(NewBoardDTO newBoardDTO)  throws Exception;
	
	public int  getStepMax(NewBoardDTO newBoardDTO)  throws Exception;
	
	//리플
	public int insertReplyBoard(NewBoardDTO newBoardDTO) throws Exception;	
}