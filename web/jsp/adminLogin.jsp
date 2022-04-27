<%@page import= "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <title>Admin Login</title>
        <link rel="stylesheet" type="text/css" href="../css/adminLogin.css?version5"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap" rel="stylesheet">
    </head>
    <body>
        <header class="class">
            <!-- Left Box for logo -->
            <div class="left">
                  <div class="left"><img src="../images/logobg.png" alt=""></div> 
            </div>
        </header>
        <!--HTML code for Admin Login Form-->
        <div class="loginBox">
            <div class="glass">
                <img src="../images/admin.png" width="100" height="100" class="admin">
                <h2>Admin Login</h2>
                <form method="post">
                    <div class="inputBox">
                        <input type="text" name="mailid" placeholder="Enter your Email ID">
                        <span><i class="fa fa-user" aria-hidden="true"></i></i></span>
                    </div>
                    <div class="inputBox">
                        <input type="password" name="password" placeholder="Enter your Password">
                        <span><i class="fa fa-lock" aria-hidden="true"></i></span>
                    </div>
                    <input type="submit" name="Submit" value="Login">
                </form>
                <a href="../jsp/forgotPasswordAdmin.jsp">Forgot Password</a>
            </div>
        </div>
        <!-- HTML Code For Footer -->
        <footer class="ct-footer" >     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </footer>
    </body>
</html>

<!-- Java code for validating the entered admin credentials from the database -->
<%
    if (request.getParameter("Submit") != null) {
        String uid, pwd;
        uid = request.getParameter("mailid"); // we get the emailid entered by the user in the admin login form
        pwd = request.getParameter("password"); // we get the password entered by the user in the admin login form
        String query = "Select * from admin where aemailid='" + uid + "' and apassword='" + pwd + "'";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next(); // if the result set corresponding to the sql query written using admin details entered is returned then the status will be true otherwise false
            if (status) { // if status is true means the user is admin and the session for the admin is set and admin is redirected to the Home page
                session.setAttribute("mailid", uid);
                response.sendRedirect("../html/AHome.html");
                return;
            } else if (uid.isEmpty() || pwd.isEmpty()) {
                // if no credentials or any one of the credentials are not filled then this msg is printed
                out.println("<html><span id=error><p>Please enter the details</p></span></html>");
            } else {
                //if invalid admin credentials are entered then error message is generated
                out.println("<html><span id=error><p>Incorrect Email id or password</p></span></html>");
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>