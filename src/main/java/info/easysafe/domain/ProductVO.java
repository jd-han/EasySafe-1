package info.easysafe.domain;

public class ProductVO {
	
	private String code;
	private String seqcode;
	private String name;
	private String thumimg;
	private String producer;
	private String barcode;
	private String type;
	private String components;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getSeqcode() {
		return seqcode;
	}
	public void setSeqcode(String seqcode) {
		this.seqcode = seqcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getThumimg() {
		return thumimg;
	}
	public void setThumimg(String thumimg) {
		this.thumimg = thumimg;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getComponents() {
		return components;
	}
	public void setComponents(String components) {
		this.components = components;
	}
	
	@Override
	public String toString() {
		return "ProductVO [code=" + code + ", seqcode=" + seqcode + ", name=" + name + ", thumimg=" + thumimg
				+ ", producer=" + producer + ", barcode=" + barcode + ", type=" + type + ", components=" + components
				+ "]";
	}
}
