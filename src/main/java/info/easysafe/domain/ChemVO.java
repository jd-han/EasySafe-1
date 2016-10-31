package info.easysafe.domain;

public class ChemVO {

//	private String korName;
//	private String engName;
	private String name;
	
	
	
	private String kor;
	private String us;
	private String eu;
	
	private String ins;
	private String cas;
	private String codex;
	
	private String japan;
	private String china;
	private String aus;
	
	private int viewcnt;
	private int replycnt;
	
	
//	public String getKorName() {
//		return korName;
//	}
//	public void setKorName(String korName) {
//		this.korName = korName;
//	}
//	public String getEngName() {
//		return engName;
//	}
//	public void setEngName(String engName) {
//		this.engName = engName;
//	}
	
	
	public String getKor() {
		return kor;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAus() {
		return aus;
	}
	public void setAus(String aus) {
		this.aus = aus;
	}
	public void setKor(String kor) {
		this.kor = kor;
	}
	public String getUs() {
		return us;
	}
	public void setUs(String us) {
		this.us = us;
	}
	public String getEu() {
		return eu;
	}
	public void setEu(String eu) {
		this.eu = eu;
	}
	public String getIns() {
		return ins;
	}
	public void setIns(String ins) {
		this.ins = ins;
	}
	public String getCas() {
		return cas;
	}
	public void setCas(String cas) {
		this.cas = cas;
	}
	public String getCodex() {
		return codex;
	}
	public void setCodex(String codex) {
		this.codex = codex;
	}
	public String getJapan() {
		return japan;
	}
	public void setJapan(String japan) {
		this.japan = japan;
	}
	public String getChina() {
		return china;
	}
	public void setChina(String china) {
		this.china = china;
	}
	public String getAustralia() {
		return aus;
	}
	public void setAustralia(String aus) {
		this.aus = aus;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	@Override
	public String toString() {
		return "ChemVO [name=" + name + ", kor=" + kor + ", us=" + us + ", eu=" + eu + ", ins=" + ins + ", cas=" + cas
				+ ", codex=" + codex + ", japan=" + japan + ", china=" + china + ", aus=" + aus + ", viewcnt=" + viewcnt
				+ ", replycnt=" + replycnt + "]";
	}
	
	

	

}
