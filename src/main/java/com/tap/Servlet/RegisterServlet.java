package com.tap.Servlet;
import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String address = req.getParameter("address");
        String role = req.getParameter("role").toUpperCase();

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        User user = new User(userName, hashedPassword, email, role, address);
        UserDAOImpl userDAOImpl = new UserDAOImpl();
        int res = userDAOImpl.addUser(user);
        if (res == 1) {
            resp.sendRedirect("login.html");
        } else {
            resp.sendRedirect("signup.jsp?error=1");
        }
    }
}