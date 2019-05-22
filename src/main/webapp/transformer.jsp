<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>XSLT Transformation</title>
    </head>
    <body>
        <style>
            div {
                width: 49%;
                float: left;
                padding: 0.5%;
            }

            textarea {
                width: 100%;
                height: 80%;
                overflow: auto;
            }
        </style>

        <h1>XSLT Transformation</h1>
        <form action="${pageContext.request.contextPath}/examples/transformer/transform" method="post">
            <div>
                <h3>XML</h3>
                <textarea name="xml"></textarea>
            </div>
            <div>
                <h3>XSLT</h3>
                <textarea name="xslt"></textarea>
            </div>
            <input type="submit"  value="Transform"/>
        </form>

        <c:if test="${not empty error}">
            <div style="border: solid 1px red; background-color: yellow; padding: 10px">
                <c:out value="${error}"/>
            </div>
        </c:if>
        <pre>
            <c:out value="${result}"/>
        </pre>
    </body>