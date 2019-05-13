<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Named Templates</title>
        <!-- Syntax Highlight -->
        <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
    </head>
    <body>
    <p><c:out value="${pageContext.request.contextPath}"/></p>
        <pre class="prettyprint linenums">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;xsl:stylesheet version=&quot;1.0&quot;
xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot;&gt;

    &lt;xsl:template match=&quot;/&quot;&gt;
        &lt;html&gt;
            &lt;body&gt;
                &lt;h2&gt;My CD Collection&lt;/h2&gt;
                &lt;table border=&quot;1&quot;&gt;
                    &lt;tr bgcolor=&quot;#9acd32&quot;&gt;
                        &lt;th&gt;Title&lt;/th&gt;
                        &lt;th&gt;Artist&lt;/th&gt;
                    &lt;/tr&gt;
                    &lt;tr&gt;
                        &lt;td&gt;.&lt;/td&gt;
                        &lt;td&gt;.&lt;/td&gt;
                    &lt;/tr&gt;
                &lt;/table&gt;
            &lt;/body&gt;
        &lt;/html&gt;
    &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;
        </pre>
    </body>
</html>