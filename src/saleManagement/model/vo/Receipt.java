package saleManagement.model.vo;

import java.sql.Date;

public class Receipt {
	private int ono;
	private Date saleDate;
	private int coin;
	private Date deliveryDate;
	private int orderSum;
	private String userId;
	private Product product;
	private String orderState;
	private Delivery delivery;
	private Payment payment;

	public Receipt() {}

	public Receipt(int ono, Date saleDate, int coin, Date deliveryDate, int orderSum, String userId, Product product,
			String orderState, Delivery delivery, Payment payment) {
		super();
		this.ono = ono;
		this.saleDate = saleDate;
		this.coin = coin;
		this.deliveryDate = deliveryDate;
		this.orderSum = orderSum;
		this.userId = userId;
		this.product = product;
		this.orderState = orderState;
		this.delivery = delivery;
		this.payment = payment;
	}
	
	public Receipt(int ono, Date saleDate, int orderSum, String userId, Product product, String orderState) {
		super();
		this.ono = ono;
		this.saleDate = saleDate;
		this.orderSum = orderSum;
		this.userId = userId;
		this.product = product;
		this.orderState = orderState;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public Date getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	public int getCoin() {
		return coin;
	}

	public void setCoin(int coin) {
		this.coin = coin;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public int getOrderSum() {
		return orderSum;
	}

	public void setOrderSum(int orderSum) {
		this.orderSum = orderSum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public Delivery getDelivery() {
		return delivery;
	}

	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "Receipt [ono=" + ono + ", saleDate=" + saleDate + ", coin=" + coin + ", deliveryDate=" + deliveryDate
				+ ", orderSum=" + orderSum + ", userId=" + userId + ", product=" + product + ", orderState="
				+ orderState + ", delivery=" + delivery + ", payment=" + payment + "]";
	}
	
	
}
