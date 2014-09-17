package test.login.dto;

public class LoginDTO {
	private String userseq;
	private String pwd;
	private String membno;
	private String deptno;
	private String userid;
	private String usernm;
	private String masteryn;
	private String singlesanyn;
	private String systemmaster;

	public String getUserseq() {
		return userseq;
	}

	public void setUserseq(String userseq) {
		this.userseq = userseq;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}	
	
	public String getMembno() {
		return membno;
	}
	public void setMembno(String membno) {
		this.membno = membno;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getMasteryn() {
		return masteryn;
	}
	public void setMasteryn(String masteryn) {
		this.masteryn = masteryn;
	}
	public String getSinglesanyn() {
		return singlesanyn;
	}
	public void setSinglesanyn(String singlesanyn) {
		this.singlesanyn = singlesanyn;
	}
	public String getSystemmaster() {
		return systemmaster;
	}
	public void setSystemmaster(String systemmaster) {
		this.systemmaster = systemmaster;
	}
}