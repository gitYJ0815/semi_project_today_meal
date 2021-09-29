package saleManagement.model.vo;

public class Delivery {
	private int dno;
	private String name;
	private int phone;
	private String address;
	private String request;
	private String delivery_fee;
	
	public Delivery() {}
	
	public Delivery(int dno, String name, int phone, String address, String request, String delivery_fee) {
		super();
		this.dno = dno;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.request = request;
		this.delivery_fee = delivery_fee;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getDelivery_fee() {
		return delivery_fee;
	}

	public void setDelivery_fee(String delivery_fee) {
		this.delivery_fee = delivery_fee;
	}

	@Override
	public String toString() {
		return "Delivery [dno=" + dno + ", name=" + name + ", phone=" + phone + ", address=" + address + ", request="
				+ request + ", delivery_fee=" + delivery_fee + "]";
	}
	
}
