package iuh.fit.bai04.controller;

import iuh.fit.bai04.dao.BookDAO;
import iuh.fit.bai04.model.Book;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet({"/books","/book"})
public class BookServlet extends HttpServlet {
    private BookDAO bookDAO;
    @Resource(name="jdbc/bookstoredb")
    private DataSource dataSource;


    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if(id!=null) {
            int idPro = Integer.parseInt(id);
            Book book = bookDAO.getBook(idPro);
            if(book!=null) {
                req.setAttribute("book",book);
                req.getRequestDispatcher("book_detail.jsp").forward(req,resp);
            }
            else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND,"Book not found");
                return;
            }
        }
        List<Book> books = bookDAO.getALl();
        req.setAttribute("books",books);
        req.getRequestDispatcher("book_list.jsp").forward(req,resp);
    }
}
