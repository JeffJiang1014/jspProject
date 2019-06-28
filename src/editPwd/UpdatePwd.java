package editPwd;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DBConnection;

/**
 * Servlet implementation class UpdatePwd
 */
@WebServlet("/UpdatePwd")
public class UpdatePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
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
		HttpSession session=request.getSession();
		String password=request.getParameter("newPwd");
		String sql="update login set password='"+password+"' where user='"+session.getAttribute("id")+"'";
		con.update(sql);
		session.invalidate();
		request.setAttribute("success","密码修改成功，请重新登录");
		request.getRequestDispatcher("EditPwd.jsp").forward(request, response);
	}

}
