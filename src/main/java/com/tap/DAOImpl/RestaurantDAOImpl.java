package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.model.User;
import com.tap.utility.DBConnection;


public class RestaurantDAOImpl implements RestaurantDAO {

    /* ================= USER QUERIES ================= */

    private static final String INSERT_QUERY =
            "INSERT INTO `user`(UserName, Password, Email, Address, Role, CreatedDate, LastLoginDate) "
          + "VALUES(?,?,?,?,?,?,?)";

    private static final String SELECT_QUERY =
            "SELECT * FROM User WHERE UserID=?";

    private static final String SELECT_QUERY_02 =
            "SELECT * FROM user";

    private static final String UPDATE_QUERY =
            "UPDATE User SET UserName=?, Password=?, Email=?, Address=?, LastLoginDate=? "
          + "WHERE UserId=?";

    private static final String DELETE_QUERY =
            "DELETE FROM users WHERE id=?";


    /* ================= RESTAURANT QUERY ================= */

    private static final String RESTAURANT_SELECT_QUERY =
            "SELECT * FROM restaurant";


    /* ================= ADD USER ================= */

    @Override
    public void addUser(User u) {

        Connection connection = DBConnection.getConnection();

        try {

            Timestamp currentTime =
                    new Timestamp(System.currentTimeMillis());

            PreparedStatement pstmt =
                    connection.prepareStatement(INSERT_QUERY);

            pstmt.setString(1, u.getUserName());
            pstmt.setString(2, u.getPassword());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, u.getAddress());
            pstmt.setString(5, u.getRole());
            pstmt.setTimestamp(6, currentTime);
            pstmt.setTimestamp(7, currentTime);

            int i = pstmt.executeUpdate();

            System.out.println("User inserted: " + i);

        } catch (SQLException e) {

            e.printStackTrace();

        }
    }


    /* ================= UPDATE USER ================= */

    @Override
    public void updateUser(User u) {

        Connection connection =
                DBConnection.getConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(UPDATE_QUERY);

            pstmt.setString(1, u.getUserName());
            pstmt.setString(2, u.getPassword());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, u.getAddress());

            pstmt.setTimestamp(
                    5,
                    new Timestamp(System.currentTimeMillis())
            );

            pstmt.setInt(6, u.getUserId());

            int i = pstmt.executeUpdate();

            System.out.println("User updated: " + i);

        } catch (SQLException e) {

            e.printStackTrace();

        }
    }


    /* ================= DELETE USER ================= */

    @Override
    public void deleteUser(int id) {

        Connection connection =
                DBConnection.getConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(DELETE_QUERY);

            pstmt.setInt(1, id);

            int i = pstmt.executeUpdate();

            System.out.println("User deleted: " + i);

        } catch (SQLException e) {

            e.printStackTrace();

        }
    }


    /* ================= GET USER ================= */

    @Override
    public User getUser(int id) {

        Connection connection =
                DBConnection.getConnection();

        User u = null;

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(SELECT_QUERY);

            pstmt.setInt(1, id);

            ResultSet res =
                    pstmt.executeQuery();

            while (res.next()) {

                u = getUserByResultSet(res);

            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return u;
    }


    /* ================= GET ALL USERS ================= */

    @Override
    public List<User> getAllUser() {

        List<User> list =
                new ArrayList<User>();

        Connection connection =
                DBConnection.getConnection();

        try {

            Statement stmt =
                    connection.createStatement();

            ResultSet res =
                    stmt.executeQuery(SELECT_QUERY_02);

            while (res.next()) {

                User u =
                        getUserByResultSet(res);

                list.add(u);
            }

        } catch (SQLException e) {

            e.printStackTrace();

        }

        return list;
    }


    /* ================= USER RESULTSET ================= */

    private static User getUserByResultSet(ResultSet res)
            throws SQLException {

        int UserId =
                res.getInt("UserId");

        String UserName =
                res.getString("UserName");

        String Password =
                res.getString("Password");

        String Email =
                res.getString("Email");

        String Address =
                res.getString("Address");

        String Role =
                res.getString("Role");

        Timestamp createdDate =
                res.getTimestamp("CreatedDate");

        Timestamp lastLoginDate =
                res.getTimestamp("LastLoginDate");


        User u =
                new User(
                        UserId,
                        UserName,
                        Password,
                        Email,
                        Address,
                        Role,
                        createdDate,
                        lastLoginDate
                );

        return u;
    }


    /* =====================================================
       ================= RESTAURANT METHODS ==============
       ===================================================== */


    /* ================= GET ALL RESTAURANTS ================= */

    @Override
    public List<Restaurant> getAllRestaurant() {

        List<Restaurant> restaurantList =
                new ArrayList<Restaurant>();

        Connection connection =
                DBConnection.getConnection();

        try {

            Statement stmt =
                    connection.createStatement();

            ResultSet res =
                    stmt.executeQuery(RESTAURANT_SELECT_QUERY);


            while (res.next()) {

                int restaurantId =
                        res.getInt("RestaurantId");

                String name =
                        res.getString("Name");

                String cuisineType =
                        res.getString("CuisineType");

                int deliveryTime =
                        res.getInt("DeliveryTime");

                String address =
                        res.getString("Address");

                float rating =
                        res.getFloat("rating");

                boolean isActive =
                        res.getBoolean("IsActive");

                String imagePath =
                        res.getString("ImagePath");


                Restaurant restaurant =
                        new Restaurant(
                                restaurantId,
                                name,
                                cuisineType,
                                deliveryTime,
                                address,
                                rating,
                                isActive,
                                imagePath
                        );


                restaurantList.add(restaurant);
            }


        } catch (SQLException e) {

            e.printStackTrace();

        }


        return restaurantList;
    }


    /* ================= GET ALL RESTAURANTS
       OPTIONAL PLURAL METHOD ================= */

    public List<Restaurant> getAllRestaurants() {

        return getAllRestaurant();

    }


    /* ================= ADD RESTAURANT ================= */

    @Override
    public void addRestaurant(Restaurant restaurant) {

        // Not required for displaying restaurants yet.

    }


    /* ================= GET RESTAURANT ================= */

    @Override
    public Restaurant getRestaurant(int restaurantId) {

        return null;

    }


    /* ================= UPDATE RESTAURANT ================= */

    @Override
    public void updateRestaurant(Restaurant restaurant) {

        // Not required for displaying restaurants yet.

    }


    /* ================= DELETE RESTAURANT ================= */

    @Override
    public void deleteRestaurant(int restaurantId) {

        // Not required for displaying restaurants yet.

    }

}