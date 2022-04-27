import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.http.HttpSession;


@WebServlet("/resourceUpload")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
             maxFileSize=1024*1024*20,      // 20MB
             maxRequestSize=1024*1024*50)
public class resourceUpload extends HttpServlet {
private static final String SAVE_DIR="resourcefiles";
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     response.setContentType("text/html;charset=UTF-8");
    PrintWriter outt = response.getWriter();
    String path = "C:\\Users\\HP\\Documents\\NetBeansProjects\\BVTechHub\\web\\resources" + File.separator + SAVE_DIR; //specify your path here
        
     
         Part filePart = request.getPart("img");
            
          
         String savePath="C:\\Users\\HP\\Documents\\NetBeansProjects\\BVTechHub\\web\\resources";
          
          File file=new File(savePath);
          file.mkdir();
          String fileName = extractFileName(filePart);
          
          OutputStream out = null;
          
            InputStream filecontent = null;
            
           
            try {
        out = new FileOutputStream(new File(path + File.separator
                + fileName));
        
        filecontent = filePart.getInputStream();
     
 
        int read = 0;
        final byte[] bytes = new byte[1024];
 
        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
           
            savePath=path+File.separator+fileName;
            
        }
                
        HttpSession session=request.getSession(false);
        String email=(String)session.getAttribute("mailid");
        String DirPlusFileName=null;
        DirPlusFileName=fileName; 
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","aadivyoma");
        String query="INSERT INTO resources(semailid,material,topic,path,subject) values (?,?,?,?,?)";

            PreparedStatement pst;
            pst=conn.prepareStatement(query);

           String filePath= path + File.separator + fileName ;
           pst.setString(1,email);
           pst.setString(3,request.getParameter("txt_eid"));
           pst.setString(2,DirPlusFileName);
           pst.setString(4, filePath);
           pst.setString(5, request.getParameter("txt_sub"));
           int x= pst.executeUpdate();
           if(x>0){
                outt.println("<script>alert('Your file is uploaded successfully.');</script>");
           }
           else
               outt.println("<script>alert(' Error in uploading. Try again!');</script>");
           
      }
            
            catch(Exception ex){
                outt.println(ex);
            }
    }

    private String extractFileName(Part part) {
    final String partHeader = part.getHeader("content-disposition");
    
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}