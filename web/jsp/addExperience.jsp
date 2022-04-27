<%@page import= "java.sql.*" %> 
<%@page contentType="text/html"
        pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/addExperience.css">
        <title>Add Experience Form</title>
    </head>

    <body>
        <header class="class">
        <!-- Left Box for logo -->
        <div class="left">
             <div class="left"><img src="../images/logobg.png" alt=""></div> 
        </div>
    </header>
        <!--HTML form to add experience of student-->
        <form>
            <div class="form-box">
                <div class="header-text">Share your Experience</div>
                <input type="text" name="Company" placeholder="Enter the company name" />
                <input type="text" name="Position" placeholder="Enter position" />
                <select name="Category">
                    <option value="" disabled selected>Choose a category</option>
                    <option value="Internship">
                        Internship
                    </option>
                    <option value="Placement">
                        Placement
                    </option>
                </select>
                <select name="Verdict">
                    <option value="" disabled selected>Verdict</option>
                    <option value="Selected">
                        Selected
                    </option>
                    <option value="Rejected">
                        Rejected
                    </option>
                </select>
                <textarea id="share" name="Description" placeholder="Add your experience here" maxlength="970"
                style="height:200px" rows="40" cols="50"></textarea>
                <button type="submit" class="btn" name="Add">Add Experience</button>
            </div>
        </form>
        <br><!-- comment -->
        <br><!-- comment -->
        <br>
        <div class="ct-footer">     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </div>
    </body>

</html>
<%
    if (request.getParameter("Add") != null) 
    {
        String company, position, category, verdict, des;
        company = request.getParameter("Company");
        position = request.getParameter("Position");
        category = request.getParameter("Category");
        verdict = request.getParameter("Verdict");
        des = request.getParameter("Description");
        
        if(company==null || position==null || category==null || verdict==null || des==null)
        {
           out.println("<script>alert('Please enter the details.');</script>");
        }
        else{
        try 
        {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","aadivyoma"); 
                Statement stmt = conn.createStatement();
                String semailid = (String) session.getAttribute("mailid");
                
                ResultSet rs= stmt.executeQuery("select * from experience");
                des= des.replaceAll("\\r?\\n", "<br />");
                
                des=des.replaceAll("&", "and");
                
                
                String query1 = "insert into experience(SEMAILID,COMPANY,DESCRIPTION,POSITION, CATEGORY, VERDICT) VALUES('" + semailid + "','" + company + "','" + des + "','" + position + "','" + category + "','" + verdict +"')";
               
                
                int i=0;
                Statement stmt2 = conn.createStatement();
                i = stmt2.executeUpdate(query1);
                
                
                if (i > 0) 
                    
                {
                    out.println("<script>alert('Your experience has been added.');</script>");
                }
                
                else
                {
                    out.println("<script>alert('Error in adding your experience. Try again!');</script>");
                }
            conn.close();
        
        }
        catch (Exception e) 
        {
            System.out.print(e);
            e.printStackTrace();
        }
    }
    }
%>
