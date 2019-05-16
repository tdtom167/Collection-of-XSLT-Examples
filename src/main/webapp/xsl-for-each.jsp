<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>XSLT &lt;xsl:for-each&gt; Element</title>
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

    <h1>XSLT &lt;xsl:for-each&gt; Element</h1>
    <hr>
    <p>The &lt;xsl:for-each&gt; element allows you to do looping in XSLT.</p>
    <hr>
    <h2>The &lt;xsl:for-each&gt; Element</h2>
    <p>The XSL &lt;xsl:for-each&gt; element can be used to select every XML element of a specified node-set:</p>

    <p><b>Example</b></p>
    <pre class="prettyprint linenums">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;

&lt;xsl:template match=&quot;/&quot;&gt;
    &lt;html&gt;
        &lt;body&gt;
            &lt;h2&gt;My CD Collection&lt;/h2&gt;
            &lt;table border=&quot;1&quot;&gt;
                &lt;tr bgcolor=&quot;#9acd32&quot;&gt;
                    &lt;th&gt;Title&lt;/th&gt;
                    &lt;th&gt;Artist&lt;/th&gt;
                &lt;/tr&gt;
                &lt;xsl:for-each select=&quot;catalog/cd&quot;&gt;
                &lt;tr&gt;
                    &lt;td&gt;&lt;xsl:value-of select=&quot;title&quot;/&gt;&lt;/td&gt;
                    &lt;td&gt;&lt;xsl:value-of select=&quot;artist&quot;/&gt;&lt;/td&gt;
                &lt;/tr&gt;
                &lt;/xsl:for-each&gt;
            &lt;/table&gt;
        &lt;/body&gt;
    &lt;/html&gt;
&lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;
    </pre>
    <p><b>Note:</b> The value of the <b>select</b> attribute is an XPath expression. An XPath expression works
        like navigating a file system; where a forward slash (/) selects subdirectories.</p>
</body>

</html>
