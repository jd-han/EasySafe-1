package info.easysafe.domain;

import java.util.Date;

public class MsgVO {
	private int msgNo;
	private String receiveUser;
	private String sendUser;
	private String msgTitle;
	private String msg;
	private Date regDate;
	private String readable;
	private String lvUpFile;
	
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getLvUpFile() {
		return lvUpFile;
	}
	public void setLvUpFile(String lvUpFile) {
		this.lvUpFile = lvUpFile;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public String getReceiveUser() {
		return receiveUser;
	}
	public void setReceiveUser(String receiveUser) {
		this.receiveUser = receiveUser;
	}
	public String getSendUser() {
		return sendUser;
	}
	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getReadable() {
		return readable;
	}
	public void setReadable(String readable) {
		this.readable = readable;
	}
	@Override
	public String toString() {
		return "MsgVO [msgNo=" + msgNo + ", receiveUser=" + receiveUser + ", sendUser=" + sendUser + ", msgTitle="
				+ msgTitle + ", msg=" + msg + ", regDate=" + regDate + ", readable=" + readable + ", lvUpFile="
				+ lvUpFile + "]";
	}
}
