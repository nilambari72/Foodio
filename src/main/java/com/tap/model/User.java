package com.tap.model;

import java.sql.Timestamp;
import java.util.Date;

public class User {
	public User(String userName, String password, String email, String role,String address) {
		super();
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.address = address;
		this.role = role;
	}
		private int userId;
		private String userName;
		private static String password;
		private String email;
		private String address;
		private String role;
		private Date createDate;
		private Timestamp lastLoginDate;
		public User(int userId, String userName, String password, String email, String role, String address,
				Date createDate, Timestamp lastLoginDate) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.address = address;
		this.role = role;
		this.createDate = createDate;
		this.lastLoginDate = lastLoginDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public static String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", role=" + role + ", createDate=" + createDate + ", lastLoginDate="
				+ lastLoginDate + "]";
	}
	

}