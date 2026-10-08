package com.tap.model;

public class CartItem {
	
	private int menuId;
	private int resturantId;
	private String name;
	private float price;
	private int quantity;
	
	
	public CartItem(int menuId, int resturantId, String name, float price, int quantity) {
		super();
		this.menuId = menuId;
		this.resturantId = resturantId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getResturantId() {
		return resturantId;
	}
	public void setResturantId(int resturantId) {
		this.resturantId = resturantId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CartItem [menuId=" + menuId + ", resturantId=" + resturantId + ", name=" + name + ", price=" + price
				+ ", quantity=" + quantity + "]";
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	

}
