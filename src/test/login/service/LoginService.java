package test.login.service;

import test.login.dto.LoginDTO;

public interface LoginService {

	public LoginDTO getLogin(LoginDTO loginDTO) throws Exception;
	
}