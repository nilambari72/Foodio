
//import java.util.Scanner;
package com.tap.Test;

import java.sql.Connection;
import java.util.List;
import java.util.Scanner;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class Testing {
	
	public static void main(String[]args) {
		
		Connection connection = DBConnection.getConnection();
		System.out.println("Connection is created");
		
		//ADD USER
//	Scanner scan = new Scanner(System.in);
//		
//		System.out.println("Enter the UserName");
//		String userName = scan.next();
//		
//		System.out.println("Enter the PassWord");
//		String password = scan.next();
//		
//		System.out.println("Enter the Email");
//		String email = scan.next();
//		
//		System.out.println("Enter the Address");
//		String address = scan.next();
//		
//		System.out.println("Enter the Role");
//		String role = scan.next();
//		
//		User u = new User(userName,password,email,address,role);
//		
//		UserDAOImpl udao = new UserDAOImpl();
//		udao.addUser(u);
//		System.out.println("USER ADDED");
	
		
//		//GET USER
//        UserDAOImpl udao = new UserDAOImpl();
//        User u =udao.getUser(1);
//        System.out.println(u);
		
		// GET ALL USER
//		UserDAOImpl udao = new UserDAOImpl();
//		List<User>allUser = udao.getAllUser();
//		
//		for(User user:allUser) {
//			System.out.println(user);
//		}
		//UPADATE USER
//		UserDAOImpl udao = new UserDAOImpl();
//		System.out.println("Enter the User Id");
//		int id = scan.nextInt();
//		
//		User u = udao.getUser(id);
//		System.out.println(u);
//		
//		u.setAddress("Banashankari");
//		udao.updateUser(u);
		//System.out.println(u);
		
		
	}
}


