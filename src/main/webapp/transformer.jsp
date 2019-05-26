<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>XSLT Transformation</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
    </head>
    <body>
        <style>
            textarea {
                width: 100%;
                height: 50%;
                overflow: auto;
            }
        </style>

        <div id="navbar">
            <a href="${pageContext.request.contextPath}/examples/" class="active">Home</a>
            <a href="${pageContext.request.contextPath}/examples/application-of-templates">Application of templates</a>
            <a href="${pageContext.request.contextPath}/examples/priority-of-templates">Priority of templates</a>
            <a href="${pageContext.request.contextPath}/examples/named-templates">Named templates</a>
            <a href="${pageContext.request.contextPath}/examples/literal-elements">Literal elements</a>
            <a href="${pageContext.request.contextPath}/examples/processing-mode">Processing mode</a>
            <a href="${pageContext.request.contextPath}/examples/xsl-if">&lt;if&gt;</a>
            <a href="${pageContext.request.contextPath}/examples/xsl-for-each">&lt;for-each&gt;</a>
            <a href="${pageContext.request.contextPath}/examples/xsl-value-of">&lt;value-of&gt;</a>
            <a href="${pageContext.request.contextPath}/examples/xsl-number">&lt;number&gt;</a>
            <a href="${pageContext.request.contextPath}/examples/xsl-choose">&lt;choose&gt;</a>
            <a href="${pageContext.request.contextPath}/examples/xsl-copy">&lt;copy-of&gt;</a>
            <a href="${pageContext.request.contextPath}/examples/transformer" style="background-color: #ddd; color: black;">Transformation</a>
        </div>

        <div class="content">
            <h1>XSLT Transformation</h1>

            <form action="${pageContext.request.contextPath}/examples/transformer/transform" method="post">
                <div class="floatingHalfBox">
                    <h3>XML</h3>
                    <textarea name="xml"></textarea>
                </div>
                <div class="floatingHalfBox">
                    <h3>XSLT</h3>
                    <textarea name="xslt"></textarea>
                </div>
                <input type="submit"  value="Transform"/>
            </form>

            <c:if test="${not empty error}">
                <div style="color: black; border: solid 1px red; background-color: lightgray; padding: 10px">
                    <c:out value="${error}"/>
                </div>
            </c:if>

            <div class="floatingBox">
                <h3>Output</h3>
                <pre class="prettyprint linenums">
<c:out value="${result}"/></pre>
            </div>
        </div>
    </body>