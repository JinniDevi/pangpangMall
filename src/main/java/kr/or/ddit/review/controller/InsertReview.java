package kr.or.ddit.review.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ReviewVO;

@WebServlet("/insertReview.do")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("/review/mainReview.jsp").forward(request, response);
//	}
//	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		
		MemberVO memVo = (MemberVO)session.getAttribute("loginMember");
		if(memVo == null) {
			response.sendRedirect(request.getContextPath() + "/login.do");
		}else {
			String mem_id = memVo.getMem_id();
			String re_content = request.getParameter("re_content");
			int re_rate = Integer.parseInt(request.getParameter("re_rate"));
			int p_id = Integer.parseInt(request.getParameter("p_id"));
			int pay_no = Integer.parseInt(request.getParameter("pay_no"));
			
			
			ReviewVO vo = new ReviewVO();
			vo.setMem_id(mem_id);
			vo.setP_id(p_id);
			vo.setRe_rate(re_rate);
			vo.setRe_content(re_content);
			vo.setPay_no(pay_no);
	
			
			
			
//		String content = request.getParameter("content");
//		int rate = Integer.parseInt(request.getParameter("rating"));
//		
//		System.out.println(rate);
//		System.out.println(content);
//		vo.setRe_rate(rate);
//		vo.setRe_content(content);
			
			IReviewService service = ReviewServiceImpl.getInstance();
			
			int res = service.insertReview(vo);
			
			request.setAttribute("result", res);
			
			request.getRequestDispatcher("review/result.jsp").forward(request, response);
			
			
		}
//		String mem_id = "wpdls";
		
	}

}
