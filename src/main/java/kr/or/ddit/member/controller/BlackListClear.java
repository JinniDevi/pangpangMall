package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;


@WebServlet("/blackListClear.do")
public class BlackListClear extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memId = (String) request.getParameter("member_id");
		System.out.println(memId);
		IMemberService service = MemberServiceImpl.getInstance();
		
		int res = service.blackListClear(memId);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("includes/member/key9.status.jsp").forward(request, response);
	}

}
