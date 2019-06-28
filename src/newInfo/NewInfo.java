package newInfo;

import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DBConnection;

/**
 * Servlet implementation class NewInfo
 */
@WebServlet("/NewInfo")
public class NewInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewInfo() {
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
		DBConnection con=new DBConnection();
		con.createConnection();
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		if(!("").equals(title)&&!("").equals(content)) {
			Calendar cal=Calendar.getInstance();
			String date=String.format("%4d-%02d-%02d",cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1,cal.get(Calendar.DAY_OF_MONTH));
			String time=String.format("%2d:%02d:%02d", cal.get(Calendar.HOUR_OF_DAY),cal.get(Calendar.MINUTE),cal.get(Calendar.SECOND));
			String dateTime=date+" "+time;
			HttpSession session=request.getSession();
			String name=(String)session.getAttribute("name");
			String sql="insert into inform(title,content,name,date,id) values('"+title+"','"+content+"','"+name+"','"+dateTime+"','"+getUUID()+"')";
			con.update(sql);
			request.setAttribute("message","success");
		}
		else{
			request.setAttribute("message","fail");
		}
		request.getRequestDispatcher("manIndex.jsp").forward(request, response);
	}
	
	public static String getUUID(){

        UUID uuid=UUID.randomUUID();

        String uuidStr=uuid.toString();

        return uuidStr;

}

}
