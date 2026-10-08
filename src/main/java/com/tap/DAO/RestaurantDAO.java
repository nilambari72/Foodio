package com.tap.DAO;

import java.util.List;

import com.tap.model.Restaurant;
import com.tap.model.User;

public interface RestaurantDAO {
	void addRestaurant(Restaurant Restaurant);
	Restaurant getRestaurant(int RestaurantId);
	void updateRestaurant(Restaurant Restaurant);
	void deleteRestaurant(int RestaurantId);
	List<Restaurant> getAllRestaurant();
	void updateUser(User u);
	User getUser(int id);
	void deleteUser(int id);
	List<User> getAllUser();
	void addUser(User u);
}