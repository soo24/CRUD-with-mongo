<%@page import="com.mongodb.client.model.Updates"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="org.bson.conversions.Bson"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="java.util.*"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
	request.setCharacterEncoding("EUC-KR");
	int port = 27017;
	
	String db = "db01";
	String collection = "people";
	
	MongoClient mongoClient = new MongoClient("localhost", port);
	MongoDatabase mongoDB = mongoClient.getDatabase(db);
	MongoCollection<Document> c = mongoDB.getCollection(collection);
	
	System.out.println("delete_ok ���� ���� ! ");
	
	String name = request.getParameter("name");
	
	delete(mongoClient, mongoDB, c, name);

%>

<%!

	public void delete(MongoClient mongoClient, MongoDatabase mongoDB, MongoCollection<Document> collection,
				String name) {
		
		collection.deleteOne(new Document("name", name));
		System.out.println("==> Delete " + name);
	}



%>

<body>

	<a href="main.jsp">���� �������� ����</a> <br/><br/>
	<a href="read.jsp">��ü ��� ����</a>
</body>
</html>