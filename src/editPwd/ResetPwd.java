package editPwd;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class ResetPwd
 */
@WebServlet("/ResetPwd")
public class ResetPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DBConnection con=new DBConnection();
		con.createConnection();
		String studentID=request.getParameter("studentID");
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String sql="select * from stu_info where stu_id='"+studentID+"'";
		ArrayList<Map<String,String>> rs=con.queryForList(sql);
		if(rs!=null) {
			if(rs.get(0).get("name").equals(name)&&rs.get(0).get("id").equals(id)) {
				String password=request.getParameter("newPassword");
				sql="update login set password='"+password+"' where user='"+studentID+"'";
				con.update(sql);
				response.setHeader("refresh","0.5;URL=Login.jsp");
			}
			else {
				System.out.println("用户信息不正确");
			}
		}else {
			System.out.println("用户不存在");
		}
	}

}
