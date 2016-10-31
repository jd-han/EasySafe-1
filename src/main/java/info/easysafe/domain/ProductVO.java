package info.easysafe.domain;

public class ProductVO {
	
	private String name;
	
	private String upc;
	
	private String component;
	
	private String producer;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUpc() {
		return upc;
	}

	public void setUpc(String upc) {
		this.upc = upc;
	}

	public String getComponent() {
		return component;
	}

	public void setComponent(String component) {
		this.component = component;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	@Override
	public String toString() {
		return "ProductVO [name=" + name + ", upc=" + upc + ", component=" + component + ", producer=" + producer + "]";
	}
	
	

}
