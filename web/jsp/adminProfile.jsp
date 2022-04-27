<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>CSS User Profile Card</title>
        <link rel="stylesheet" href="../css/adminProfile.css">

    </head>
    <body>
        <%  String emailId =(String)session.getAttribute("mailid"); //getting emailid through session

        %>        
        <div class="wrapper">
            <!--on the left side admin logo and name of the admin to be appeared-->
            <div class="left">
                <img src="../images/adminprofile.png" alt="admin" width="100">
                <h4>
                    <%      try {
                            String name = "Select * from admin where aemailid='" + emailId + "'";
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(name);
                            while (rs.next()) {
                                out.println(rs.getString(2));
                            }
                            conn.close();
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>  
                </h4>
                <p>Admin</p>
            </div>
                <!--on the right all the details of the admin available in database to be displayed-->
            <div class="right">
                <div class="info">
                    <h3>YOUR PROFILE</h3>
                    <div class="info_data">
                        <div class="data">
                            <!--displaying admin emailid-->
                            <h4>Email</h4>
                            <p><%
                                try {
                                    String name = "Select * from admin where aemailid='" + emailId + "'";
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery(name);
                                    while (rs.next()) {
                                        out.println(rs.getString(1));
                                    }
                                    conn.close();
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                                %>  
                            </p>
                        </div>
                        <div class="data">
                            <!--displaying admin password in * form-->
                            <h4>Password</h4>
                            <p><%
                                try {
                                    String name = "Select * from admin where aemailid='" + emailId + "'";
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery(name);
                                    while (rs.next()) {
                                        String pwd = rs.getString(3);
                                        for (int i = 0; i < pwd.length(); i++) {
                                            out.print("*");
                                        }
                                    }
                                    conn.close();
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                                %>  </p>
                        </div>
                        <div class="data">
                            <!--displaying admin security question-->
                            <h4>Security Question</h4>
                            <p><%
                                try {
                                    String name = "Select * from admin where aemailid='" + emailId + "'";
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                     Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery(name);
                                    while (rs.next()) {
                                        out.println(rs.getString(4));
                                    }
                                    conn.close();
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                                %>  </p>
                        </div>
                        <div class="data">
                            <!--displaying admin security answer-->
                            <h4>Security Answer</h4>
                            <p><%
                                try {
                                    String name = "Select * from admin where aemailid='" + emailId + "'";
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                     Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery(name);
                                    while (rs.next()) {
                                        out.println(rs.getString(5));
                                    }
                                    conn.close();
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                                %>  </p>
                        </div>
                    </div>
                    <div class="change">
                        <!--button for change password-->
                        <div class="btn">
                            <button type="button" onclick="window.open( '../jsp/changePassword.jsp');">Change Password</button>
                        </div>
                        <!--button for change security question and answer-->
                        <div class="btn">
                            <button type="button" onclick="window.open('../jsp/changeSecQuesAnsAdmin.jsp');">Change Security QnA</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        <!-- div for responsive footer-->
       
            <footer class="ct-footer" >     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </footer>

    </body>
</html>
