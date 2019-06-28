package loginProcess;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DBConnection;

/**
 * Servlet implementation class LoginProcess
 */
@WebServlet("/LoginProcess")
public class LoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginProcess() {
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
		String user=request.getParameter("studentID");
		String password=request.getParameter("password");
		String usertype=request.getParameter("user");
		String sql="";
		sql="select * from login where user='"+user+"' and usertype='"+usertype+"'";
		ArrayList<Map<String,String>> rs=con.queryForList(sql);
		if(!rs.isEmpty()) {
			if(!rs.get(0).get("password").equals(password)) {
				request.setAttribute("loginError", "密码错误");
			}
			else {
				HttpSession session=request.getSession();
				session.setAttribute("id",user);
				session.setAttribute("password",password);
				if(usertype.equals("学生"))
					response.sendRedirect("stuIndex.jsp");  
				else
					response.sendRedirect("manIndex.jsp");
			}
		}
		else {
			request.setAttribute("loginError", "用户不存在");
		}
		if(request.getAttribute("loginError")!=null)
			request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

}
