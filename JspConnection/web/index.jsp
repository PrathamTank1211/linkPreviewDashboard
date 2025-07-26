<%-- 
    Document   : index
    Created on : 12 Apr, 2022, 8:53:18 PM
    Author     : prath
--%>
<%@page import="sun.invoke.empty.Empty"%>
<%@page import="java.io.IOException"%>
\
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/ht    ml; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form method="post" >
            <table cellpadding=" 5" cellpacing="5" border="1">
                <tr>
                    <th>Enter No</th>
                    <th><input type="text" name="strno" </th>
                </tr>
                <tr>
                    <th>Enter Name</th>
                    <th><input type="text" name="strname" </th>
                </tr>
                <tr>
                    <th> </th>
                    <td>
                        <input type="submit" name="b1" value="save">
                        <input type="submit" name="b1" value="view"> 
                        <input type="submit" name="b1" value="delete">
                        <input type="submit" name="b1" value="update">
                        <input type="submit" name="b1" value="search"
                                
                   </td>
                </tr>
                    
            </table>
        </form>
          <% 
                    Connection con=null;
                    ResultSet rs=null ;                        
                    PreparedStatement ps=null;
            
            
          try
          {
                  String  no,name;  
                      String action=null;
               Class.forName("com.mysql.jdbc.Driver");
               con=DriverManager.getConnection("jdbc:mysql://localhost/jspdatabase","root","");                
               action=request.getParameter("b1");
               
               
       if(action!=null)
              {
                  if(action.equalsIgnoreCase("save"))
                  {
                     no=request.getParameter("strno");
                     name=request.getParameter("strname");
                    ps=con.prepareStatement("insert into jspdemo(no,name)value(?,?)");
                    ps.setString(1,no);
                    ps.setString(2, name);
                        int insertResponse = ps.executeUpdate();
                          if(insertResponse > 0)
                             out.println("<script>alert('Recode is submit sucesfully');</script>");
                          else
                             out.println("<script>alert('Recode is not submit sucesfully');</script>");
                 }   
                 else if(action.equalsIgnoreCase("view"))
                 {
                          no=request.getParameter("strno");
                    ps=con.prepareStatement("select * from jspdemo");
                    rs=ps.executeQuery();
                      if(!no.isEmpty()&& no!=null)
                       {
                           out.println("<table border=1 cellpadding=5 cellspacing=5><tr><th>no</th><th>Name</th><th>Delete</th></tr>");
                          while(rs.next())
                          {
                              out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td><a href=index.jsp?no="+rs.getString(1)+">Delete</a></td></tr>");
                          }
                              out.println("</table>");
                      } 
                      else
                       {
                           
                              out.println("<script>alert('recode is not found);</script>");      
                        }
                 }
                  else if(action.equalsIgnoreCase("delete"))
                    {
                     no=request.getParameter("strno");
                  ps=con.prepareStatement("delete from jspdemo where no=?");
                  ps.setString(1,no);
                   int deleteResponse = ps.executeUpdate();
                           if(deleteResponse > 0)
                           {
                         out.println("<script>alert('Recode is Deleted sucesfully');</script>");
                           }
                      else
                           {
                          out.println("<script>alert('Recode is not Deleted sucesfully');</script>");
                           }
                    }
                  else      
                  {
                      name=request.getParameter("strname");
                      no=request.getParameter("strno");
                       ps=con.prepareStatement("update jspdemo set name=? where no=?");
                 ps.setString(1,name);
                 ps.setString(2, no);
                    int updateResponse = ps.executeUpdate();
                             if(updateResponse>0)
                             {
                                 out.println("<script>alert('Recode is updated sucesfully');</script>");
                             }
                    else
                             {
                                 out.println("<script>alert('Recode is not updated sucesfully');</script>");
                             }
                  }else if(action.equalsIgnoreCase("search"))
                  {
                      no=request.getParameter("strno");
                  ps=con.prepareStatement("select * from jspdemo where no = ? ");
                 ps.setString(1,no);
                 rs=ps.executeQuery();
                 while(rs.next())
                 {
                     out.println(rs.getString(1)+ " " +rs.getString(2));
                 }
                  }
                  
          if(request.getParameter("no")!=null)
          {
              int no1=Integer.parseInt(request.getParameter("no"));
              ps=con.prepareStatement("delete from jspdemo where no=?");
              ps.setInt(1,no1);
              int deleteRecode=ps.executeUpdate();
                if(deleteRecode>0)
                {
                     out.println("<script>alert('Recode is Deleted sucesfully');document.location.href='index.jsp';</script>");
                }else
                {
                     out.println("<script>alert('Recode is  not Deleted sucesfully');document.location.href='index.jsp';</script>");
                }
           
          }
                  
         }
        }      
          catch(Exception e)
          {
              out.println("Ex is:- "+e);
          } 
         
               
%>
    </body>
</html>
