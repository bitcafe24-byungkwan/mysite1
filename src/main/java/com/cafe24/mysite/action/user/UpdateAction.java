package com.cafe24.mysite.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cafe24.mysite.dao.UserDao;
import com.cafe24.mysite.vo.UserVo;
import com.cafe24.web.WebUtil;
import com.cafe24.web.mvc.Action;

public class UpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//String email = request.getParameter("email");
		String password = request.getParameter("password");
		String no = request.getParameter("no");
		String gender = request.getParameter("gender");
		String name =request.getParameter("name");

		UserVo updateUser = new UserVo();
		
		updateUser.setName(name);
		updateUser.setGender(gender);
		updateUser.setNo(Long.parseLong(no));
		updateUser.setPassword(password);

		Boolean res = new UserDao().update(updateUser);
		if(!res) {
			UserVo userVo = new UserDao().get(Long.parseLong(no));
			request.setAttribute("userVo", userVo);
			request.setAttribute("result", "fail");
			WebUtil.forward(request, response, "WEB-INF/views/user/updateform.jsp");
			return;
		}		
		
		// 로그인처리
		HttpSession session = request.getSession(true);
		session.setAttribute("authUser", updateUser);
		
		WebUtil.redirect(request, response, request.getContextPath());		

	}

}
