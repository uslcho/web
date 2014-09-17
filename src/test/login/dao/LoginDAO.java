package test.login.dao;

import test.login.dto.LoginDTO;

public interface LoginDAO {
	
	public LoginDTO getLogin(LoginDTO loginDTO) throws Exception;
	
}