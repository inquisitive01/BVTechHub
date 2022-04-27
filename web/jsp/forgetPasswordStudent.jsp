<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/forgetPasswordStudent.css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap" rel="stylesheet">
        <title>Forgot Password</title>
    </head>
    <body>
        <header class="class">
            <!-- Left Box for logo -->
            <div class="left">
                  <div class="left"><img src="../images/logobg.png" alt=""></div> 
            </div>
        </header>
        <div class="box">
            <div class="glass">
                <!--student logo on the form-->
                <img src="../images/student.png" width="100" height="100" class="admin">
                <!--heading of the form-->
                <h2>Forgot Password</h2>
                <form method="post">
                    <div class="inputBox">
                        <!--emailid to be entered by the student-->
                        <input type="text" name="mailid" placeholder="Enter your Email ID">
                        <span><i class="fa fa-user" aria-hidden="true"></i></span>
                    </div>
                    <div class="inputBox">
                        <!--choosing the security question student wants to answer-->
                        <select name="securityques">
                            <option value="" disabled selected>Choose a security question</option>
                            <option value="What is the name of your college?">
                                What is the name of your college?
                            </option>
                            <option value="What was your first school?">
                                What was your first school?
                            </option>
                            <option value="What is the last name of your father?">
                                What is the last name of your father?
                            </option>
                            <option value="Which city do you live in?">
                                Which city do you live in?
                            </option>
                        </select>
                    </div>
                    <div class="inputBox">
                        <!--student's answer to the security question-->
                        <input type="text" name="securityans" placeholder="Enter Security Answer" />
                    </div>
                    <!--button to submit response-->
                    <input type="submit" name="Submit" value="Submit">
                </form>
            </div>
        </div>
        <!--footer of the page-->
        <footer class="ct-footer">     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </footer>
        <!--javascript-->
        <script>
            /* Toggle between adding and removing the "responsive" class to navbar when the user clicks on the icon */
            function myFunction() {
                var x = document.getElementById("mainnav");
                if (x.className === "navbar") {
                    x.className += "  responsive";
                } else {
                    x.className = "navbar";
                }
            }
        </script>
    </body>
</html>
<%
    if (request.getParameter("Submit") != null) {  //when submit button is clicked
        String emailid, aques, aans, query;
        emailid = request.getParameter("mailid");  //emailid entered by the student
        aques = request.getParameter("securityques"); //security question student has chosen
        aans = request.getParameter("securityans");   //answer given by the student to the security question
        query = "SELECT * FROM student  WHERE semailid= '" + emailid + "' and ssecurityques='" + aques + "' and ssecurityans='" + aans + "'";
        try {
            //setting up connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub", "root", "aadivyoma");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next();
            if (status) {
                session.setAttribute("mailid", emailid);  //if correct details are entered session is set and studet is redirected to home page
                response.sendRedirect("../html/Home.html");
            } else {
                out.println("<html><span id=error>Incorrect Email id or Answer</span></html>"); //error message in case of incorrect details
            }
            conn.close();//connection is closed
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>
