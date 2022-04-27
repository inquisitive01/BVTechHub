import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name= "DownloadServlet", urlPatterns = {"/DownloadServlet"})

public class DownloadServlet extends HttpServlet { 
    public static int BUFFER_SIZE=1024*100;
    public static final String UPLOAD_DIR= "resources/resourcefiles"; // we specify the upload directory
    public static String fileName = null;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
//        retrieve the filename using request.getParameter() method
        fileName=request.getParameter("fileName");
        
//        If the filename is null or it is empty string then proper message is displayed
        if(fileName==null || fileName.equals("")){
            response.setContentType("text/html");
            response.getWriter().println("<h3>File"+fileName+"is not present</h3>");          
        } 
        else{
//            We retrieve the filepath where the file is stored
            String applicationPath=getServletContext().getRealPath("");
            String downloadPath= applicationPath + File.separator + UPLOAD_DIR;
            String filePath=downloadPath + File.separator + fileName;
            File file= new File(filePath);
            OutputStream outStream=null;
            FileInputStream inputStream=null;
          
//          If the file actually exists then set the content type of the file set the header
            if(file.exists()){
                String mimeType="application/octet-stream";
                response.setContentType(mimeType);
                String headerKey= "Content-Disposition";
                String headerValue= String.format("attachment; filename=\"%s\"",file.getName());
                response.setHeader(headerKey, headerValue);
           
                try{            
                    outStream=response.getOutputStream();
                    inputStream= new FileInputStream(file);
                    byte[] buffer = new byte[BUFFER_SIZE];
                    int bytesRead = -1;
                    
//                  here inputStream.read(buffer) reads some number of bytes from the inputStream and stores them into the buffer array
                    while( (bytesRead = inputStream.read(buffer))!= -1){
//                      This method writes bytes from the specified byte array buffer starting at offset 0 to this outStream
                        outStream.write(buffer,0,bytesRead);
                    }
                }catch(IOException ex){
                    ex.printStackTrace();
                } finally{
//                  Now we close the inputStream
                    if(inputStream != null){
                        inputStream.close();
                    }
              
                    outStream.flush();
//                  Now we close the outStream
                    if(outStream != null){
                        outStream.close();
                    }
                }
            } else{
//              If the file doesn't exist then proper message is displayed
                response.setContentType("text/html");
                response.getWriter().println("<h3>File"+fileName+"is not present</h3>");
            }  
        }
    } 
}    