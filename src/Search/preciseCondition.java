package Search;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class preciseCondition
 */
@WebServlet("/preciseCondition")
public class preciseCondition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public preciseCondition() {
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
		String stu_id=(String)request.getParameter("stu_id");
		String sql="";
		if(stu_id!=null)
			sql="select * from stu_info where stu_id='"+stu_id+"'";
		else
			sql="select * from stu_info";
		request.setAttribute("preciseCondition",sql);
		request.getRequestDispatcher("manIndex.jsp").forward(request,response);
	}

}
