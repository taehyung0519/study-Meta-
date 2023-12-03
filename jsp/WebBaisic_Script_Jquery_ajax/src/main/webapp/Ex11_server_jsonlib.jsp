
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//java 객체를 json데이터로 변환
	//1. JSONObject 사용 > {} json객체 하나
	//2. JSONArray 사용 > 배열로 생성
	Member member = new Member();
	JSONObject obj = JSONObject.fromObject(member);
%>
<%=obj %>
<hr>
<% 
	List<Member> list = new ArrayList<>();
	list.add(new Member("hong","1004","서울시 강남구","0"));
	list.add(new Member("kim","1004","서울시 강남구","0"));
	list.add(new Member("park","1004","서울시 강남구","0"));

	JSONArray memberarray = JSONArray.fromObject(list);
%>
<%=memberarray %>
