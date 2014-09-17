package test.nboard.dao;

import java.math.BigDecimal;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import test.nboard.dto.NewBoardDTO;

@Repository
public class NewBoardDAOImpl  extends SqlSessionDaoSupport implements NewBoardDAO {
	private static Logger logger = Logger.getLogger(NewBoardDAOImpl.class);
	
	@Override
	public List<NewBoardDTO> getBoardList(NewBoardDTO newBoardDTO) throws Exception {
		// TODO Auto-generated method stub
		return  getSqlSession().selectList("newboard.getBoardList",newBoardDTO);
	}

	@Override
	public int insertBoard(NewBoardDTO newBoardDTO) throws Exception {
		// TODO Auto-generated method stub
		logger.info("insertBoard invoked...");
		getSqlSession().insert("newboard.insertBoard", newBoardDTO);
		int b_no = newBoardDTO.getB_no().intValue();
		return b_no;
	}
	
	@Override
	public  NewBoardDTO getBoard(BigDecimal b_no) throws Exception {
		// TODO Auto-generated method stub		
		return (NewBoardDTO)getSqlSession().selectOne("newboard.getBoard", b_no);
	}
	
	@Override
	public void updateBoard(NewBoardDTO newBoardDTO)  throws Exception {
		getSqlSession().update("newboard.updateBoard", newBoardDTO);
	}
	
	@Override
	public int getRefMax()  throws Exception {
		return Integer.parseInt(getSqlSession().selectOne("newboard.getRefMax").toString());
	}
	
	@Override
	public void updateCommunitySetp(NewBoardDTO newBoardDTO)  throws Exception {
		getSqlSession().update("newboard.updateCommunitySetp",newBoardDTO);
	}
	
	@Override
	public int  getStepMax(NewBoardDTO newBoardDTO)  throws Exception {
		return Integer.parseInt(getSqlSession().selectOne("newboard.getStepMax",newBoardDTO).toString());
	}
	
	//리플
	@Override
	public int insertReplyBoard(NewBoardDTO newBoardDTO) throws Exception {
		logger.info("insertReplyBoard invoked...");
		getSqlSession().insert("newboard.insertReplyBoard", newBoardDTO);
		int b_no = newBoardDTO.getB_no().intValue();
		return b_no;		
	}
}