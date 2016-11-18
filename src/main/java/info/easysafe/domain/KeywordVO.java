package info.easysafe.domain;

import java.util.Date;

public class KeywordVO {
	private String keyword;
	private Date regDate;
	private int count;	
	
	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "KeywordVO [keyword=" + keyword + ", regDate=" + regDate + ", count=" + count + "]";
	}	
}
