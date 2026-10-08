package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    private static final String Insert_Query = "Insert into Menu(MenuID,RestaurantID,ItemName,Description,Price,IsAvailable,ImagePath) values(?,?,?,?,?,?,?)";

    private static final String Select_Query = "Select * From Menu where MenuID = ?";

    private static final String Select1_Query = "Select * From Menu";

    private static final String Update_Query = "Update Menu set RestaurantID=?,ItemName=?,Description=?,Price=?,IsAvailable=?,ImagePath=? where MenuID=?";

    private static final String Delete_Query = "Delete from Menu where MenuID = ?";

    @Override
    public void addMenu(Menu menu) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement pstmt = connection.prepareStatement(Insert_Query);

            pstmt.setInt(1, menu.getMenuId());
            pstmt.setInt(2, menu.getRestaurantId());
            pstmt.setString(3, menu.getItemName());
            pstmt.setString(4, menu.getDescription());
            pstmt.setFloat(5, menu.getPrice());
            pstmt.setBoolean(6, menu.isAvailable());
            pstmt.setString(7, menu.getImagePath());

            int i = pstmt.executeUpdate();
            System.out.println(i);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int menuId) {
        Connection connection = DBConnection.getConnection();

        Menu m = null;

        try {
            PreparedStatement pstmt = connection.prepareStatement(Select_Query);

            pstmt.setInt(1, menuId);

            ResultSet res = pstmt.executeQuery();

            while (res.next()) {
                m = getMenuByResultSet(res);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return m;
    }

    @Override
    public void updateMenu(Menu menu) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement pstmt = connection.prepareStatement(Update_Query);

            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getItemName());
            pstmt.setString(3, menu.getDescription());
            pstmt.setFloat(4, menu.getPrice());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setString(6, menu.getImagePath());
            pstmt.setInt(7, menu.getMenuId());

            int i = pstmt.executeUpdate();
            System.out.println(i);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMenu(int menuId) {
        Connection connection = DBConnection.getConnection();

        try {
            PreparedStatement pstmt = connection.prepareStatement(Delete_Query);

            pstmt.setInt(1, menuId);

            int i = pstmt.executeUpdate();
            System.out.println(i);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Menu> getAllmenu() {

        List<Menu> list = new ArrayList<Menu>();

        Connection connection = DBConnection.getConnection();

        try {
            Statement stmt = connection.createStatement();

            ResultSet res = stmt.executeQuery(Select1_Query);

            while (res.next()) {

                Menu m = getMenuByResultSet(res);

                list.add(m);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> list = new ArrayList<Menu>();

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt = connection.prepareStatement(
                    "Select * From Menu where RestaurantID = ?"
            );

            pstmt.setInt(1, restaurantId);

            ResultSet res = pstmt.executeQuery();

            while (res.next()) {

                Menu m = getMenuByResultSet(res);

                list.add(m);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    private static Menu getMenuByResultSet(ResultSet res) throws SQLException {

        int menuId = res.getInt("MenuID");
        int restaurantId = res.getInt("RestaurantID");
        String itemName = res.getString("ItemName");
        String description = res.getString("Description");
        float price = res.getFloat("Price");
        boolean isAvailable = res.getBoolean("IsAvailable");
        String imagePath = res.getString("ImagePath");

        Menu m = new Menu(
                menuId,
                restaurantId,
                itemName,
                description,
                price,
                isAvailable,
                imagePath
        );

        return m;
    }
}