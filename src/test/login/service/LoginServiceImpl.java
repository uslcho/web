package test.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.login.dao.LoginDAO;
import test.login.dto.LoginDTO;


@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDAO loginDAO;

	@Override
	@Transactional(readOnly=true)
	public LoginDTO getLogin(LoginDTO loginDTO) throws Exception {
		return this.loginDAO.getLogin(loginDTO);
	}
}