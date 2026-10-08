package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO {
	private static final String Insert_Query = "Insert into user(UserName,email,Password,role,Address,LastLoginDate) values(?,?,?,?,?,?)";
	private static final String Select_Query = "Select * From User where UserId = ?";
	private static final String Select1_Query = "Select * From User";
	private static final String Update_Query = "Update user set UserName= ?,email=?,Password=?,address=?,LastLoginDate =? where userId=?";
	private static final String Delete_Query = "Delete from User where userId = ?";
	private static final String Select2_Query =  "Select * From User where UserName = ?";

	@Override
	public int addUser(User user) {
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(Insert_Query);
			pstmt.setString(1,user.getUserName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getRole());
			pstmt.setString(5,user.getAddress());
			pstmt.setTimestamp(6,new Timestamp(System.currentTimeMillis()));
			
			int i = pstmt.executeUpdate();
			System.out.println(i);
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public User getUser(int userId) {
		Connection connection = DBConnection.getConnection();
		User u = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(Select_Query);
			pstmt.setInt(1, userId);
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				u = getUserByResultSet(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return u;
	}

	@Override
	public void updateUser(User user) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = connection.prepareStatement(Update_Query);
			pstmt.setString(1,user.getUserName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getAddress());
			pstmt.setTimestamp(5,new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(6,user.getUserId());
			
			int i = pstmt.executeUpdate();
			System.out.println(i);
			
		}
		catch(SQLException e) {
			e.printStackTrace();	
		}
		
	}

	@Override
	public void deleteUser(int userId) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = connection.prepareStatement(Delete_Query);
			pstmt.setInt(1,userId);
			
			int i = pstmt.executeUpdate();
			System.out.println(i);
			
		}
		catch(SQLException e) {
			e.printStackTrace();		
			}
	}
	
	@Override
	public List<User> getAllUser() {
		List<User> list = new ArrayList<User>();
		Connection connection = DBConnection.getConnection();
		try {
			Statement stmt = connection.createStatement();
			ResultSet res = stmt.executeQuery(Select1_Query);
			
			while(res.next()) {
				User u = getUserByResultSet(res);
				list.add(u);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	private static User getUserByResultSet(ResultSet res) throws SQLException{
		int id = res.getInt("userId");
		String userName = res.getString("username");
		String userEmail = res.getString("email");
		String userPassword = res.getString("Password");
		String userrole = res.getString("role");
		String userAddress = res.getString("Address");
		Timestamp createdDate = res.getTimestamp("createdDate");
		Timestamp lastLogindate = res.getTimestamp("lastLoginDate");
		
		User u = new User(id,userName,userPassword,userEmail,userrole,userAddress,createdDate,lastLogindate);
		return u;
	
	}

	public static User getUserByUsername(String name) {
		Connection connection = DBConnection.getConnection();
		User u = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(Select2_Query);
			pstmt.setString(1, name);
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				u = getUserByResultSet(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return u;
	}
}