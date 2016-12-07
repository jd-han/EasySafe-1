package info.easysafe.domain;

/**
 * @author Yoondori
 *
 */
public class ChemVO {

//	private String korName;
//	private String engName;
	
	private int no;
	private String name;
	private String korea;
	private String us;
	private String eu;
	private String ins;
	private String cas;
	private String codex;
	private String japan;
	private String china;
	private String australia;
	private String aus;
	private String avg;
	
	private int viewcnt;
	private int replycnt;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKorea() {
		return korea;
	}
	public void setKorea(String korea) {
		this.korea = korea;
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
		return australia;
	}
	public void setAustralia(String australia) {
		this.australia = australia;
	}
	public String getAus() {
		return aus;
	}
	public void setAus(String aus) {
		this.aus = aus;
	}
	public String getAvg() {
		return avg;
	}
	public void setAvg(String avg) {
		this.avg = avg;
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
		return "ChemVO [no=" + no + ", name=" + name + ", korea=" + korea + ", us=" + us + ", eu=" + eu + ", ins=" + ins
				+ ", cas=" + cas + ", codex=" + codex + ", japan=" + japan + ", china=" + china + ", australia="
				+ australia + ", aus=" + aus + ", avg=" + avg + ", viewcnt=" + viewcnt + ", replycnt=" + replycnt + "]";
	}
	
}
