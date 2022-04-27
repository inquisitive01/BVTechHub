<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../css/forgotPasswordAdmin.css?version3" />
    <link
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap"
      rel="stylesheet"
    />
    <title>Forgot Password</title>
  </head>
  <body>
    <header class="class">
      <!-- Left Box for logo -->
      <div class="left">
        <div class="left"><img src="../images/logobg.png" alt="" /></div>
      </div>
    </header>
    <!--HTML code for admin forgot password form-->  
    <div class="box">
      <div class="glass">
        <img src="../images/admin.png" width="100" height="100" class="admin" />
        <h2>Forgot Password</h2>
        <form method="post">
          <div class="inputBox">
            <input
              type="text"
              name="mailid"
              placeholder="Enter your Email ID"
            />
            <span><i class="fa fa-user" aria-hidden="true"></i></span>
          </div>
          <div class="inputBox">
            <select name="securityques">
              <option value="" disabled selected>
                Choose a security question
              </option>
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
            <input
              type="text"
              name="securityans"
              placeholder="Enter Security Answer"
            />
          </div>
          <input type="submit" name="Submit" value="Submit" />
        </form>
      </div>
    </div>
    <!-- HTML Code For Footer -->
    <footer class="ct-footer">
      <div class="inner-right">
        <p>
          Copyright ©️ 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to
          BVTechHub<br />
          Web Design by CS10 of Banasthali Vidyapith
        </p>
      </div>
    </footer>
    <!--JavaScript code for the navbar-->
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

<!--Java code for the validating admin when he/she forgets password on the basis of emailid and security question and answer-->
<%
    if (request.getParameter("Submit") != null) {
        String emailid, aques, aans, query;
        emailid = request.getParameter("mailid"); // we get the emailid entered by the user in the forgot password form
        aques = request.getParameter("securityques"); // we get the security question selected by the user in the forgot password form
        aans = request.getParameter("securityans"); // we get the security answer entered by the user in the forgot password form
        query = "SELECT * FROM admin  WHERE aemailid= '" + emailid + "' and asecurityques='" + aques + "' and asecurityans='" + aans + "'";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next(); // If we get the result set corresponding to the sql query written with the user details entered then the user is a valid admin and status is true
            if (status) { // when the status is true the session for the admin is set and admin is redirected to the Home page
                session.setAttribute("mailid", emailid);
                response.sendRedirect("../html/AHome.html");
            } else {
                // If incorrect details are entered by the user then this message will be displayed that is when the status is false
                out.println("<html><span id=error>Incorrect Email id or Answer</span></html>");
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>