package com.tap.model;

public class Restaurant {
	private int RestaurantId;
	private String Name;
	private String CuisineType;
	private int DeliveryTime;
	private String Address;
	private float rating;
	private boolean IsActive;
	private String ImagePath;
	public Restaurant(int restaurantId, String name, String cuisineType, int deliveryTime, String address, float rating,
			boolean isActive, String imagePath) {
		super();
		RestaurantId = restaurantId;
		Name = name;
		CuisineType = cuisineType;
		DeliveryTime = deliveryTime;
		Address = address;
		this.rating = rating;
		IsActive = isActive;
		ImagePath = imagePath;
	}
	public int getRestaurantId() {
		return RestaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		RestaurantId = restaurantId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getCuisineType() {
		return CuisineType;
	}
	public void setCuisineType(String cuisineType) {
		CuisineType = cuisineType;
	}
	public int getDeliveryTime() {
		return DeliveryTime;
	}
	public void setDeliveryTime(int deliveryTime) {
		DeliveryTime = deliveryTime;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public boolean isIsActive() {
		return IsActive;
	}
	public void setIsActive(boolean isActive) {
		IsActive = isActive;
	}
	public String getImagePath() {
		return ImagePath;
	}
	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}
	@Override
	public String toString() {
		return "Restaurant [RestaurantId=" + RestaurantId + ", Name=" + Name + ", CuisineType=" + CuisineType
				+ ", DeliveryTime=" + DeliveryTime + ", Address=" + Address + ", rating=" + rating + ", IsActive="
				+ IsActive + ", ImagePath=" + ImagePath + "]";
	}
	
	
}