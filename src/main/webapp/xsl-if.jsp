<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>XSLT &lt;xsl:if&gt; Element</title>
    <!-- Syntax Highlight -->
    <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
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
        <a href="${pageContext.request.contextPath}/examples/xsl-if" style="background-color: #ddd; color: black;">&lt;if&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-for-each">&lt;for-each&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-value-of">&lt;value-of&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-number">&lt;number&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-choose">&lt;choose&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-copy">&lt;copy-of&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/transformer">Transformation</a>
    </div>

    <div class="content">
        <h1>XSLT &lt;xsl:if&gt; Element</h1>
        <hr>
        The <code>&lt;xsl:if&gt;</code> element is used to put a conditional test against the content of the XML file.
        <hr>

        <h2>Syntax</h2>
        <div class="floatingBox">
        <pre class="prettyprint linenums">
&lt;xsl:if test="expression"&gt;
    ...some output if the expression is true...
&lt;/xsl:if&gt;</pre>
        </div>

        <hr>

        <h2>Where to Put the &lt;xsl:if&gt; Element</h2>
        To add a conditional test, add the <code>&lt;xsl:if&gt;</code> element inside the <code>&lt;xsl:for-each&gt;</code> element in the XSL file.

        <hr>
        <h2>Example</h2>
        <p>
            This example inserts the text <code>International Stock:</code> when the <code>&lt;stock&gt;</code> element has
            an attribute named <code>international</code> set to <code>yes</code>.
        </p>

        <div class="floatingHalfBox">
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
        </div>

        <div class="floatingHalfBox">
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
        </div>

        <div class="floatingBox">
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
        </div>

        <div>
            <a target="_blank" href="${pageContext.request.contextPath}/examples/transformer" class="myButton">Try it yourself</a>
        </div>
    </div>
</body>

</html>
