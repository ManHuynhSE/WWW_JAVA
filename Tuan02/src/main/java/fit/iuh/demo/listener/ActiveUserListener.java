package fit.iuh.demo.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import org.jboss.weld.servlet.api.ServletListener;

import java.util.concurrent.atomic.AtomicInteger;

@WebListener
public class ActiveUserListener implements ServletContextListener, HttpSessionListener {
    // Tên attribute lưu trong Application Scope
    private static final String ACTIVE_USERS_ATTRIBUTE = "activeUsersCount";
    // Khởi tạo biến đếm = 0 khi server (application) bắt đầu chạy
    private static final AtomicInteger activeSessions = new AtomicInteger(-1);

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().setAttribute(ACTIVE_USERS_ATTRIBUTE,
                activeSessions);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().removeAttribute(ACTIVE_USERS_ATTRIBUTE);
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        AtomicInteger activeUsers = (AtomicInteger)
                se.getSession().getServletContext().getAttribute(ACTIVE_USERS_ATTRIBUTE);
        if (activeUsers != null) {
            activeUsers.incrementAndGet();
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        AtomicInteger activeUsers = (AtomicInteger)
                se.getSession().getServletContext().getAttribute(ACTIVE_USERS_ATTRIBUTE);
        if (activeUsers != null) {
            activeUsers.decrementAndGet();
        }
    }
}
