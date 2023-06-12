package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/memberList.do")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// service 객체 생성
		IMemberService service = MemberServiceImpl.getInstance();


		// DB에서 전체 파일 정보 목록을 가져와 List에 저장한다.
		List<MemberVO> list = service.memberList();


		// 가져온 파일 정보 목록을 View페이지로 보낸다.
		request.setAttribute("memberList", list);
		
		request.getRequestDispatcher("/includes/admin/key0.adminhomeIndex.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
