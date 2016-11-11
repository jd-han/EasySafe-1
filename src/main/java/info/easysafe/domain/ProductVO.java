package info.easysafe.domain;

public class ProductVO {
	
	private String name;
	
	private String upc;
	
	private String components;
	
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

	public String getComponents() {
		return components;
	}

	public void setComponents(String component) {
		this.components = component;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	@Override
	public String toString() {
		return "ProductVO [name=" + name + ", upc=" + upc + ", components=" + components + ", producer=" + producer + "]";
	}
	
	

}
