package info.easysafe.domain;

import java.util.Date;

public class UserVO {


	private int no;
	private String uid;
	private String upw;
	private String umail;
	private String uname;
	private String ulevel;
	private Date regdate;
	private String uinfo;
	
	private String file;
	private String apikey;
	private String token;
	private String joinFlag;
	
	

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getJoinFlag() {
		return joinFlag;
	}
	public void setJoinFlag(String joinFlag) {
		this.joinFlag = joinFlag;
	}
	public String getApikey() {
		return apikey;
	}
	public void setApikey(String apikey) {
		this.apikey = apikey;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getUinfo() {
		return uinfo;
	}
	public void setUinfo(String uinfo) {
		this.uinfo = uinfo;
	}
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
	
	public String getUlevel() {
		return ulevel;
	}
	public void setUlevel(String ulevel) {
		this.ulevel = ulevel;
	}
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "UserVO [no=" + no + ", uid=" + uid + ", upw=" + upw + ", umail=" + umail + ", uname=" + uname
				+ ", ulevel=" + ulevel + ", regdate=" + regdate + ", uinfo=" + uinfo + ", file=" + file + ", apikey="
				+ apikey + ", token=" + token + ", joinFlag=" + joinFlag + "]";
	}
	
}
