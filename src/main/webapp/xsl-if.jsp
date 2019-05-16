<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>XSLT &lt;xsl:if&gt; Element</title>
    <!-- Syntax Highlight -->
    <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
</head>

<body>
    <style>
        hr {
            border: 0;
            border-top: 1px solid #eee;
        }

        .highlighted {
            background-color: #4f4f4f;
        }
    </style>

    <h1>XSLT &lt;xsl:if&gt; Element</h1>
    <hr>
    <p>The &lt;xsl:if&gt; element is used to put a conditional test against the content of the XML file.</p>
    <hr>
    <h2>The &lt;xsl:if&gt; Element</h2>
    <p>To put a conditional if test against the content of the XML file, add an &lt;xsl:if&gt; element to the XSL document.</p>
    <h3>Syntax</h3>
    <pre class="prettyprint linenums">
&lt;xsl:if test="expression"&gt;
    ...some output if the expression is true...
&lt;/xsl:if&gt;</pre>

    <hr>

    <h2>Where to Put the &lt;xsl:if&gt; Element</h2>
    <p>To add a conditional test, add the &lt;xsl:if&gt; element inside the &lt;xsl:for-each&gt; element in the XSL file:</p>
    <b>Example</b>

    <pre class="prettyprint linenums">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;

    &lt;xsl:template match="/"&gt;
        &lt;html&gt;
            &lt;body&gt;
                &lt;h2&gt;My CD Collection&lt;/h2&gt;
                &lt;table border="1"&gt;
                    &lt;tr bgcolor="#9acd32"&gt;
                        &lt;th&gt;Title&lt;/th&gt;
                        &lt;th&gt;Artist&lt;/th&gt;
                        &lt;th&gt;Price&lt;/th&gt;
                    &lt;/tr&gt;
                    &lt;xsl:for-each select="catalog/cd"&gt;
                        <span class="highlighted">&lt;xsl:if test="price &gt; 10"&gt;</span>
                            &lt;tr&gt;
                                &lt;td&gt;&lt;xsl:value-of select="title"/&gt;&lt;/td&gt;
                                &lt;td&gt;&lt;xsl:value-of select="artist"/&gt;&lt;/td&gt;
                                &lt;td&gt;&lt;xsl:value-of select="price"/&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                        <span class="highlighted">&lt;/xsl:if&gt;</span>
                    &lt;/xsl:for-each&gt;
                &lt;/table&gt;
            &lt;/body&gt;
        &lt;/html&gt;
    &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;</pre>
    <p><b>Note:</b> The value of the required <b>test</b> attribute contains the expression to be evaluated.</p>
    <p>The code above will only output the title and artist elements of the CDs that has a price that is higher than 10.</p>
</body>

</html>
