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

        code {
            background-color: lightgray;
        }

        .highlighted {
            background-color: #4f4f4f;
        }
    </style>

    <h1>XSLT &lt;xsl:if&gt; Element</h1>
    <hr>
    The <code>&lt;xsl:if&gt;</code> element is used to put a conditional test against the content of the XML file.
    <hr>
    <h2>The &lt;xsl:if&gt; Element</h2>
    To put a conditional if test against the content of the XML file, add an <code>&lt;xsl:if&gt;</code> element to the XSL document.
    <hr>

    <h2>Syntax</h2>
    <pre class="prettyprint linenums">
    &lt;xsl:if test="expression"&gt;
        ...some output if the expression is true...
    &lt;/xsl:if&gt;</pre>

    <hr>

    <h2>Where to Put the &lt;xsl:if&gt; Element</h2>
    To add a conditional test, add the <code>&lt;xsl:if&gt;</code> element inside the <code>&lt;xsl:for-each&gt;</code> element in the XSL file.

    <hr>
    <h2>Example</h2>
    This example inserts the text <code>International Stock:</code> when the <code>&lt;stock&gt;</code> element has an attribute named <code>international</code> set to <code>yes</code>.
    <h3>XML File (stock.xml)</h3>
    <pre class="prettyprint linenums">
    &lt;?xml version='1.0'?&gt;
    &lt;?xml-stylesheet type="text/xsl" href="ifstock.xsl" ?&gt;
    &lt;stocks&gt;
       &lt;stock international="no"&gt;Microsoft&lt;/stock&gt;
       &lt;stock international="no"&gt;Wingtip Toys&lt;/stock&gt;
       &lt;stock international="yes"&gt;Contoso Pharmaceuticals&lt;/stock&gt;
       &lt;stock international="no"&gt;Contoso, Ltd&lt;/stock&gt;
       &lt;stock international="yes"&gt;Fabrikam, Inc.&lt;/stock&gt;
    &lt;/stocks&gt;</pre>

    <br/>
    <h3>XSLT File (ifstock.xsl)</h3>
    <pre class="prettyprint linenums">
    &lt;?xml version='1.0'?&gt;
    &lt;xsl:stylesheet version="1.0"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;

    &lt;xsl:template match="/"&gt;
        &lt;html&gt;
            &lt;body&gt;
                &lt;xsl:apply-templates/&gt;
            &lt;/body&gt;
        &lt;/html&gt;
        &lt;/xsl:template&gt;

        &lt;xsl:template match="stock"&gt;
            &lt;p&gt;
                &lt;xsl:if test="@international='yes'">International Stock: &lt;/xsl:if&gt;
                &lt;xsl:apply-templates/&gt;
            &lt;/p&gt;
        &lt;/xsl:template&gt;

    &lt;/xsl:stylesheet&gt;</pre>

    <br/>
    <h3>Output</h3>
    Microsoft<br/>
    Wingtip Toys<br/>
    International Stock: Contoso Pharmaceuticals<br/>
    Contoso, Ltd<br/>
    International Stock: Fabrikam, Inc.<br/>

    <br/>
    <b>Processor output:</b>
    <pre class="prettyprint linenums">
    &lt;html&gt;
        &lt;body&gt;
            &lt;p&gt;Microsoft&lt;/p&gt;
            &lt;p&gt;Wingtip Toys&lt;/p&gt;
            &lt;p&gt;International Stock: Contoso Pharmaceuticals&lt;/p&gt;
            &lt;p&gt;Contoso, Ltd&lt;/p&gt;
            &lt;p&gt;International Stock: Fabrikam, Inc.&lt;/p&gt;
        &lt;/body&gt;
    &lt;/html&gt;</pre>
    <br/>
</body>

</html>
