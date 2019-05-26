package cz.muni.fi.pb138.xslt.examples;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;

@WebServlet("/examples/*")
public class ExamplesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        System.out.println("GET " + action);
        System.out.println(action);
        final String JSP;
        switch (action) {
            case "/application-of-templates":
                JSP = "/application-of-templates.jsp";
                break;
            case "/literal-elements":
                JSP = "/literal-elements.jsp";
                break;
            case "/named-templates":
                JSP = "/named-templates.jsp";
                break;
            case "/priority-of-templates":
                JSP = "/priority-of-templates.jsp";
                break;
            case "/processing-mode":
                JSP = "/processing-mode.jsp";
                break;
            case "/transformer":
                JSP = "/transformer.jsp";
                break;
            case "/xsl-choose":
                JSP = "/xsl-choose.jsp";
                break;
            case "/xsl-copy":
                JSP = "/xsl-copy.jsp";
                break;
            case "/xsl-for-each":
                JSP = "/xsl-for-each.jsp";
                break;
            case "/xsl-if":
                JSP = "/xsl-if.jsp";
                break;
            case "/xsl-number":
                JSP = "/xsl-number.jsp";
                break;
            case "/xsl-value-of":
                JSP = "/xsl-value-of.jsp";
                break;
            default:
                JSP = "/index.jsp";
        }
        request.getRequestDispatcher(JSP).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getPathInfo();
        System.out.println("POST " + action);
        if (!action.matches("/transform.*")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Unknown action " + action);
            return;
        }
        try {
            String xml = request.getParameter("xml");
            String xslt = request.getParameter("xslt");
            System.out.println(xml);
            System.out.println(xslt);
            String result = transform(xml, xslt);
            request.setAttribute("result", result);
        } catch (TransformerException e) {
            request.setAttribute("error", e.getMessage());
        } finally {
            System.out.println("REDIRECTING");
            request.getRequestDispatcher("/transformer.jsp").forward(request, response);
        }
    }

    private String transform(String xml, String xslt) throws TransformerException {
        System.out.println("TRANSFORM STARTED");
        Source xmlSource = new StreamSource(new StringReader(xml));
        Source xsltSource = new StreamSource(new StringReader(xslt));
        System.out.println("SOURCES INITIALIZED");
        TransformerFactory factory = TransformerFactory.newInstance();
        factory.setAttribute("indent-number", 2);
        Transformer transformer = factory.newTransformer(xsltSource);
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        System.out.println("TRANSFORMER CREATED");
        StringWriter stringWriter = new StringWriter();
        transformer.transform(xmlSource, new StreamResult(stringWriter));
        System.out.println("TRANSFORM FINISHED");
        return stringWriter.getBuffer().toString();
    }

}
