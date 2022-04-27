<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/updateStudentPassword.css">
        <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap" rel="stylesheet">
        <title>Update Student Password</title>
    </head>

    <body>
        <header class="class">
            <!-- Left Box for logo -->
            <div class="left">
                <img src="../images/logobg.png" alt="">
            </div>
        </header>
        
        
   
<%

    String emailId = (String) session.getAttribute("mailid");

    
%>     
    <div class="one">
        <form>
            <div class="form-box">
                <div class="header-text">Change your Password</div>

                <input type="password" name="newpassword" placeholder="Enter new password" maxlength="20" />
                <input type="password" name="confirmpassword" placeholder="Confirm password" maxlength="20"/>
                <button type="submit" class="btn" name="save">Save</button>
            </div>
    </div>
        </form>
        <footer class="ct-footer" >     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </footer>
    </body>

</html>



<%
           if (request.getParameter("save") != null)
           {
                String newpass, confirmpass;

                newpass = request.getParameter("newpassword");
                confirmpass = request.getParameter("confirmpassword");
                if(newpass.length()<6){
                    out.println("<html><span id=error><p>Password length must be atleast 6 characters</p></span></html>");
                    return;  
                }
                if (!newpass.equals(confirmpass)) 
                {
                    out.println("<html><span id=error><p>Passwords do not match</p></span></html>");
                    return;
                }
                if (newpass == "") 
                {
                    out.println("<html><span id=error><p>Please enter your new password!</p></span></html>");
                    return;
                }

                String query = "Select * from student where semailid='" + emailId + "'";

                try 
                {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    boolean status = rs.next();
                    if (status) {

                        String updateQuery = "Update student set spassword='" + newpass + "' where semailid='" + emailId + "'";
                        Statement stmt_update = conn.createStatement();
                        int i = stmt_update.executeUpdate(updateQuery);
                        if (i > 0) {
                            out.println("<script>alert('Password has been updated');</script>");
                        } else {
                            out.println("<script>alert('Error in updating password');</script>");
                        }
                        return;

                    }

                    conn.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
    }

   

%>
