package info.easysafe.domain;

import java.util.Date;

public class UserVO {

	private String uid;
	private String upw;
	private String umail;
	private String uname;
	private Date regdate;
	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUmail() {
		return umail;
	}
	public void setUmail(String umail) {
		this.umail = umail;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", upw=" + upw + ", umail=" + umail + ", uname=" + uname + ", regdate=" + regdate
				+ "]";
	}
	
	
}
