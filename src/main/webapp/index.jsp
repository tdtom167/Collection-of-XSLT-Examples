<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>XSLT Examples</title>
    <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
</head>
    <body>
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
            <a href="${pageContext.request.contextPath}/examples/transformer">Transformation</a>
        </div>

        <div class="content">
            <h1 align="center">Collection of XSLT Examples</h1>

            <h3>Examples:</h3>
            <ul>
                <li>
                    <a href="priority-of-templates.jsp">Priority of templates</a>
                </li>
                <li>
                    <a href="named-templates.jsp">Named templates</a><br/>
                </li>
                <li>
                    <a href="xsl-if.jsp">xsl:if</a><br/>
                </li>
                <li>
                    <a href="xsl-for-each.jsp">xsl:for-each</a><br/>
                </li>
                <li>
                    <a href="xsl-value-of.jsp">xsl:value-of</a><br/>
                </li>
                <li>
                    <a href="xsl-number.jsp">xsl:number</a><br/>
                </li>
                <li>
                    <a href="xsl-choose.jsp">xsl:choose</a><br/>
                </li>
                <li>
                    <a href="xsl-copy.jsp">xsl:copy-of</a><br/>
                </li>
                <li>
                    <a href="literal-elements.jsp">Literal elements</a><br/>
                </li>
                <li>
                    <a href="processing-mode.jsp">Processing mode</a><br/>
                </li>
            </ul>
        </div>
    </body>
</html>
