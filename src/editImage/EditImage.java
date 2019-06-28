package editImage;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import db.FileDAO;

/**
 * Servlet implementation class EditImage
 */
@WebServlet("/EditImage")
public class EditImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		if(ServletFileUpload.isMultipartContent(request)) {
			String folder="stuImage/";
			String fileDir=getServletContext().getRealPath(folder);
			//基于磁盘文件项目创建一个工厂对象
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//创建一个新的文件上传对象
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = null;
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			for(FileItem i:items) {
				if(!i.isFormField()) {
					String name=i.getName();
					String size=new Long(i.getSize()).toString();
					if((name==null)||(name.equals("")&&(size.equals("0")))) {
						System.out.println("空文件");
						break;
					}
					String address=fileDir+"\\"+name.substring(name.lastIndexOf("\\")+1,name.length());
					File saveFile=new File(address);
					try {
						i.write(saveFile);
					}catch(Exception e) {
						e.printStackTrace();
					}
					String relativePath=folder+name.substring(name.lastIndexOf("\\")+1,name.length());
					//System.out.println(relativePath);
					FileDAO operateFile=new FileDAO();
					operateFile.update(session.getAttribute("id").toString(),relativePath);
					//System.out.println(session.getAttribute("id").toString());
					response.sendRedirect("stuIndex.jsp");
				}
			}
		}
	}

}
