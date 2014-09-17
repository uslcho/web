package test.login.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import test.login.dto.LoginDTO;

@Repository
public class LoginDAOImpl extends SqlSessionDaoSupport implements LoginDAO {

	@Override
	public LoginDTO getLogin(LoginDTO loginDTO) throws Exception {
		
		return (LoginDTO)getSqlSession().selectOne("login.getLogin",loginDTO);
		
	}
}