<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/viewResources.css?version5">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=El+Messiri&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap" rel="stylesheet">
        <title>View Resources</title>
    </head>
    <body>
        <div class="left">
            <img src="../images/logobg.png" alt="" />
        </div>
        <section>
            <h1>Resources</h1>
            <!--HTML code to set the heading in the table columns-->
            <div class="tbl-header">
                <table style="width:100%" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th>S No.</th>
                            <th>NAME</th>
                            <th>TOPIC</th>
                            <th>MATERIAL</th>
                            <th>DOWNLOAD</th>
                        </tr>
                    </thead>
                </table>
            </div>


            <div class="tbl-content">
                <%
//                    Code to display resources to the user by retrieving them from the database
                    int s_no = 1, flag = 0;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BVTechHub","root","aadivyoma");
                        Statement stmt = conn.createStatement();
                        String subject = request.getParameter("subject"); // we get the subject name which was set on the view resources button of the resources landing page
                        String query1="select resources.rid, student.sname, resources.material, resources.topic, resources.semailid, resources.subject from resources inner join STUDENT on resources.semailid = student.semailid where resources.subject='"+subject+"' order by student.sname";
                        ResultSet rs = stmt.executeQuery(query1);
                       
                        out.println("<html><body><form name=ff>");
                        out.print("<table style=width:100% cellspacing=0 cellpadding=0>");
                         
                        while (rs.next()) {
                            flag = 1;
                            out.print("<tr><td> " + s_no + "</td>"); // serial number
                            out.print("<td> " + rs.getString(2) + "</td>"); // Name of the student who added that resource
                            out.print("<td> " + rs.getString(4) + "</td>"); // Topic of the resource
                            out.print("<td> " + rs.getString(3) + "</td>"); // Material name of the resource. EX : abc.pdf
                %>                            
                            <td>
                                <!--Link to the DownloadServlet.java code to which we are sending the filename which the user wants to download-->
                                <a href="../DownloadServlet?fileName=<%=rs.getString(3)%>">Download</a> 
                            </td>
                            
                <%
                            out.print("</tr>");
                            s_no++; // we increase the serial count
                        }
                        out.print("</table>");
                        boolean status=rs.next();
//                      If no resources exists corresponding to the subject then this message is displayed.
                        if((status==false) &&(flag==0)){
                            out.println("<html><div id=error><p>Currently, no resources exist for this subject.</p></div></html>");
                        } 
                        out.println("</form></body></html>");
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                %>
            </div>
        </section>
        <!-- HTML Code for the footer -->
        <footer class="ct-footer">
            <div class="inner-right">
                <p>Copyright ©️ 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by
                    CS10
                    of Banasthali Vidyapith</p>
            </div>
        </footer>
    </body>
</html>
