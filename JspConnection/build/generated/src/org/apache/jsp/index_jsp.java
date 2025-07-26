package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.HttpServlet;
import java.sql.DriverManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/ht    ml; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       <form method=\"post\" action=\"myform\">\n");
      out.write("            <table cellpadding=\" 5\" cellpacing=\"5\" border=\"1\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>Enter No</th>\n");
      out.write("                    <th><input type=\"text\" name=\"strno\" </th>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Enter Name</th>\n");
      out.write("                    <th><input type=\"text\" name=\"strname\" </th>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th> </th>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"submit\" name=\"b1\" value=\"Save\">\n");
      out.write("                        <input type=\"submit\" name=\"b1\" value=\"view\"> \n");
      out.write("                        <input type=\"submit\" name=\"b1\" value=\"delete\">\n");
      out.write("                        <input type=\"submit\" name=\"b1\" value=\"update\">\n");
      out.write("                        <input type=\"submit\" name=\"b1\" value=\"search\"\n");
      out.write("                                \n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                    \n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("      ");

            
          Connection con=null;
          ResultSet rs=null ;            
          Statement st=null;
             java.sql.PreparedStatement ps=null;
          try
          {
              Class.forName("com.mysql.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhost/jspdatabase","root","");
              st=con.createStatement();
                     String  no,name;  
                      String action=null;
                  no=request.getParameter("strno");
                  name=request.getParameter("strname");    
                  action=request.getParameter("b1");
                    
                 if(action.equalsIgnoreCase("Save"))
                 {
                      ps=con.prepareStatement("insert into jspdemo(no,name)value(?,?)");
                   ps.setString(1,no);
                   ps.setString(2, name);
                    int insertResponse = ps.executeUpdate();
                      if(insertResponse > 0)
                         out.println("<script>alert('Recode is submit sucesfully');document.loction.href='index.jsp';</script>");
                      else
                         out.println("<script>alert('Recode is not submit sucesfully');document.loction.href='index.jsp';</script>");
                   
                 }
          }
          catch(Exception e)
          {
              out.println("Ex is:- "+e);
          }
                     
      
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
