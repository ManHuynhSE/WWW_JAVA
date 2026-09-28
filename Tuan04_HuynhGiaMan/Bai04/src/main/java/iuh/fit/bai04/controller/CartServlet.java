package iuh.fit.bai04.controller;

import iuh.fit.bai04.dao.BookDAO;
import iuh.fit.bai04.model.Book;
import iuh.fit.bai04.model.Cart;
import iuh.fit.bai04.model.CartItem;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private BookDAO bookDAO;
    @Resource(name="jdbc/bookstoredb")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("cart.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart ==null) {
            cart = new Cart();
            session.setAttribute("cart",cart);
        }

        String action = req.getParameter("action");
        switch (action) {
            case "add":{
                Book b = bookDAO.getBook(Integer.parseInt(req.getParameter("id")));
                cart.addItem(b);
                break;
            }
            case "remove":{
                cart.remove(Integer.parseInt(req.getParameter("id")));
                break;
            }
        }
        resp.sendRedirect("cart");
    }
}
