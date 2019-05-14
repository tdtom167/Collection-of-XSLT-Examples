package cz.muni.fi.pb138.xslt.examples;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/examples/*")
public class ExamplesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        System.out.println(action);
        final String JSP;
        switch (action) {
            case "/priority-of-templates":
                JSP = "/priority-of-templates.jsp";
                break;
            case "/xsl-for-each":
                JSP = "/xsl-for-each.jsp";
                break;
            case "/xsl-number":
                JSP = "/xsl-number.jsp";
                break;
            default:
                JSP = "/index.jsp";
        }
        request.getRequestDispatcher(JSP).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {}

}
