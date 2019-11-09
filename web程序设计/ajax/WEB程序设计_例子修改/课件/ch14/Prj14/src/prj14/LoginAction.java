package prj14;

public class LoginAction {
	private String account;
	public String getAccount() {
		System.out.println("LoginAction getAccount");
		return account;
	}
	public void setAccount(String account) {
		System.out.println("LoginAction setAccount");
		this.account = account;
	}
	private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String execute() throws Exception {
		System.out.println("LoginAction execute");
		if(account.equals(password)){
			return "success";
		}
		return "fail";
	}
	public LoginAction(){
		System.out.println("LoginAction¹¹Ôìº¯Êý");
		}
}
