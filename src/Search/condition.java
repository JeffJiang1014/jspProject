package Search;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class condition
 */
@WebServlet("/condition")
public class condition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public condition() {
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
		String college=(String)request.getParameter("college");
		String major=(String)request.getParameter("major");
		String className=(String)request.getParameter("className");
		String sql="select * from stu_info";
		if(!"".equals(college)||!"".equals(major)||!"".equals(className)) {
			sql=sql+" where ";
		}
		if(!"".equals(college))
			sql=sql+"college='"+college+"'";
		if(!"".equals(major)) {
			if(sql.indexOf("college")==-1)
				sql=sql+"major='"+major+"'";
			else sql=sql+" and "+"major='"+major+"'";
		}
		if(!"".equals(className)) {
			if(sql.indexOf("college")==-1&&sql.indexOf("major")==-1)
				sql=sql+"class='"+className+"'";
			else sql=sql+" and "+"class='"+className+"'";
		}
		System.out.println(sql);
		request.setAttribute("condition",sql);
		request.getRequestDispatcher("manIndex.jsp").forward(request,response);
	}

}
