<%@page import= "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Login</title>
        <link rel="stylesheet" href="../css/studentLogin.css">
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
        <!--login box to fill details-->
        <div class="loginBox">
            <div class="glass">
                <!--student logo-->
                <img src="../images/student.png" width="100" height="100" class="admin" style="display:flex">
                <h2>Student Login</h2>
                <form method="get">
                    <div class="inputBox">
                        <!--taking input for email id of the student-->
                        <input type="text" name="mailid" placeholder="Enter your Email ID">
                        <span><i class="fa fa-user" aria-hidden="true"></i></i></span>
                    </div>
                    <div class="inputBox">
                        <!--input for password of the student-->
                        <input type="password" name="password" placeholder="Enter your Password">
                        <span><i class="fa fa-lock" aria-hidden="true"></i></span>
                    </div>
                    <!--Button to submit -->
                    <input type="submit" name="Submit" value="Login">
                </form>
                <!--In case the student forgets her password she will be redirected to forget password page -->
                <a href="forgetPasswordStudent.jsp">Forgot Password</a>
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

<%
    if (request.getParameter("Submit") != null) //when submit button is clicked
    {
        String uid, pwd, name;
        uid = request.getParameter("mailid"); //emailid entered by student
        pwd = request.getParameter("password");//password entered by student
        session = request.getSession();
        String query = "Select * from student where semailid='" + uid + "' and spassword='" + pwd + "'";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next();
            if (status) {
                session.setAttribute("mailid", uid);  //if details found correct student's session will be created and she wiil be redirected to home page
                response.sendRedirect("../html/Home.html");

                return;
            } else if (uid.isEmpty() || pwd.isEmpty()) {  
                //no data has been entered thus the following message is printed   
                out.println("<html><div id=error><p>Please enter the details</p></div></html>");
            } else {
                //data is wrong hence error message is generated
                out.println("<html><div id=error><p>Incorrect Email id or password</p></div></html>");
                //request.setAttribute("errorMessage", "Invalid username or password"); 
            }
            conn.close();//connection closed
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>


