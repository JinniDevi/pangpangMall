<%@page import="kr.or.ddit.vo.PageVO"%>
<%@page import="kr.or.ddit.vo.ReviewVO"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

 // 서블릿에서 저장된 데이터 꺼내기
 	List<ReviewVO> list = (List<ReviewVO>) request.getAttribute("list");
	PageVO vo = (PageVO)request.getAttribute("pvo");
	
	JsonObject obj = new JsonObject();
	obj.addProperty("sp", vo.getStartPage());  
	obj.addProperty("ep", vo.getEndPage());  
	obj.addProperty("tp", vo.getTotalPage());
	
	
	//json데이터 생성
	Gson gson = new Gson();
	JsonElement result = gson.toJsonTree(list);
	
	obj.add("datas", result);
	
	out.print(obj);
	out.flush();

%>