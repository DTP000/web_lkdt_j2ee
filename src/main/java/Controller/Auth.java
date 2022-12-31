package Controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Auth
 */
@WebServlet(name="Auth",urlPatterns={"/loginProccess"})
public class Auth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Auth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
			checkLogin(request, response);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchAlgorithmException {
		HttpSession session = request.getSession(true);
		System.out.println("xu ly dang nhap");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean err = false;
		if (email == null || email.equals("")) {
			session.setAttribute("error_email", "Email không được để trống");
			err = true;
		} 
		
		if (password == null || password.equals("")) {
			session.setAttribute("error_password", "Mật khẩu không được để trống");
			err = true;
		}
		
		if (!err) {
			System.out.println("o vo day dc rui");
			Model.Users userCurrent = Dao.UsersDAO.checkLogin(email, password);
			System.out.println("chi nua troi: " + userCurrent);
			if (userCurrent != null) {
				String pass2 = utils.func.md5(password);
				String salt = pass2.substring(5, 9);
				System.out.println("pass2: " + pass2);
				System.out.println("salt: " + salt);
				System.out.println("cookies login: " + utils.func.md5(pass2, salt));
				String cookie_pass = utils.func.base64_encode(email + ":" + utils.func.md5(pass2, salt));
				Cookie cookiePass = new Cookie("uautha", cookie_pass);
				cookiePass.setMaxAge(3600*60);
				response.addCookie(cookiePass);
				session.setAttribute("userCurrent", userCurrent);
				response.sendRedirect("./home");
			} else {
				session.setAttribute("error_login", "Tên tài khoản hoặc mật khẩu không hợp lệ");
				err = true;
			}
		}
		
		if (err) {
			response.sendRedirect("./login.jsp");	
			System.out.println("dang nhap that bai");
		}
	}

}
