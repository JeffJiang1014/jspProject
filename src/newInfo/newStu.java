package newInfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class newStu
 */
@WebServlet("/newStu")
public class newStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newStu() {
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
		String stu_id=request.getParameter("stu_id");
		String name=request.getParameter("stuname");
		String sex=request.getParameter("sex");
		String enrollment=request.getParameter("enrollment");
		String birthday=request.getParameter("birthday");
		String nation=request.getParameter("nation");
		String native_place=request.getParameter("native_place");
		String political_status=request.getParameter("political_status");
		String phone_number=request.getParameter("phone_number");
		String id=request.getParameter("id");
		String qualification=request.getParameter("qualification");
		String college=request.getParameter("college");
		String major=request.getParameter("major");
		String className=request.getParameter("class");
		String sql="insert into stu_info values('"+stu_id+"','"+name+"','"+sex+"','"+enrollment+"','"+birthday+"','"+
					nation+"','"+native_place+"','"+political_status+"','"+phone_number+"','"+id+"','"+qualification+"','"+
					college+"','"+major+"','"+className+"','stuImage/demo.png')";
		if(con.update(sql)==1) {
			sql="insert into login values('"+stu_id+"','123456','Ñ§Éú')";
			con.update(sql);
			request.setAttribute("news","success");
		}else {
			request.setAttribute("news","fail");
		}
		request.getRequestDispatcher("manIndex.jsp").forward(request, response);
	}

}
