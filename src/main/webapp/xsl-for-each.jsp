<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>XSLT &lt;xsl:for-each&gt; Element</title>
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
        <a href="${pageContext.request.contextPath}/examples/xsl-if">&lt;if&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-for-each" style="background-color: #ddd; color: black;">&lt;for-each&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-value-of">&lt;value-of&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-number">&lt;number&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-choose">&lt;choose&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-copy">&lt;copy-of&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/transformer">Transformation</a>
    </div>

    <div class="content">
        <h1>XSLT &lt;xsl:for-each&gt; Element</h1>
        <hr>
        The <code>&lt;xsl:for-each&gt;</code> element allows you to do looping in XSLT and can be used to select every XML element of a specified node-set.
        <hr/>

        <h2>Remarks</h2>
        The <code>&lt;xsl:for-each&gt;</code> element establishes the context for iteration. The XSLT transformation
        instructions within this loop are to be applied to the selected nodes. Each source element selected by
        <code>&lt;xsl:for-each&gt;</code> becomes a new context against which any pattern matching within the
        <code>&lt;xsl:for-each&gt;</code> occurs.

        <hr>
        <h2>Example</h2>
        <div>
            The XSLT file in this example defines the structure of an output document. The output is a top-level HTML
            element containing <code>&lt;body&gt;</code> and <code>&lt;table&gt;</code> elements. The table contains repeated
            rows for each customer. The XSLT file also uses templates to create <code>&lt;td&gt;</code> elements for the name,
            address, and phone source elements.
        </div>

        <div class="floatingHalfBox">
            <h3>XML File (customers.xml)</h3>
            <pre class="prettyprint linenums">
&lt;?xml version="1.0"?&gt;
&lt;?xml-stylesheet type="text/xsl" href="foreach.xsl" ?&gt;
&lt;customers&gt;
    &lt;customer&gt;
        &lt;name>John Smith&lt;/name&gt;
        &lt;address>123 Oak St.&lt;/address&gt;
        &lt;state>WA&lt;/state&gt;
        &lt;phone>(206) 123-4567&lt;/phone&gt;
    &lt;/customer&gt;
    &lt;customer&gt;
        &lt;name>Zack Zwyker&lt;/name&gt;
        &lt;address>368 Elm St.&lt;/address&gt;
        &lt;state>WA&lt;/state&gt;
        &lt;phone>(206) 423-4537&lt;/phone&gt;
    &lt;/customer&gt;
    &lt;customer&gt;
        &lt;name>Albert Aikens&lt;/name&gt;
        &lt;address>368 Elm St.&lt;/address&gt;
        &lt;state>WA&lt;/state&gt;
        &lt;phone>(206) 423-4537&lt;/phone&gt;
    &lt;/customer&gt;
&lt;/customers&gt;</pre>
        </div>
        <div class="floatingHalfBox">
            <h3>XSLT File (foreach.xsl)</h3>
            <pre class="prettyprint linenums">
&lt;?xml version="1.0"?&gt;
&lt;xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" &gt;

    &lt;xsl:template match="/"&gt;
        &lt;html&gt;
            &lt;body&gt;
                &lt;table&gt;
                    &lt;xsl:for-each select="customers/customer"&gt;
                        &lt;xsl:sort select="name"/&gt;
                        &lt;tr&gt;
                            &lt;td&gt;&lt;xsl:value-of select="name" />&lt;/td&gt;
                            &lt;td&gt;&lt;xsl:value-of select="address" />&lt;/td&gt;
                            &lt;td&gt;&lt;xsl:value-of select="phone" />&lt;/td&gt;
                        &lt;/tr&gt;
                    &lt;/xsl:for-each&gt;
                &lt;/table&gt;
            &lt;/body&gt;
        &lt;/html&gt;
    &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;</pre>
        </div>

        <div class="floatingBox">
            <br/>
            <h3>Output</h3>
            <table>
                <tr>
                    <td>Albert Aikens</td>
                    <td>368 Elm St.</td>
                    <td>(206) 423-4537</td>
                </tr>
                <tr>
                    <td>John Smith</td>
                    <td>123 Oak St.</td>
                    <td>(206) 123-4567</td>
                </tr>
                <tr>
                    <td>Zack Zwyker</td>
                    <td>368 Elm St.</td>
                    <td>(206) 423-4537</td>
                </tr>
            </table>
            <br/>
            <b>Processor output:</b>
            <pre class="prettyprint linenums">
&lt;html&gt;
    &lt;body&gt;
        &lt;table&gt;
            &lt;tr&gt;
                &lt;td&gt;Albert Aikens&lt;/td&gt;
                &lt;td&gt;368 Elm St.&lt;/td&gt;
                &lt;td&gt;(206) 423-4537&lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;John Smith&lt;/td&gt;
                &lt;td&gt;123 Oak St.&lt;/td&gt;
                &lt;td&gt;(206) 123-4567&lt;/td&gt;
            &lt;/tr&gt;
            &lt;tr&gt;
                &lt;td&gt;Zack Zwyker&lt;/td&gt;
                &lt;td&gt;368 Elm St.&lt;/td&gt;
                &lt;td&gt;(206) 423-4537&lt;/td&gt;
            &lt;/tr&gt;
        &lt;/table&gt;
    &lt;/body&gt;
&lt;/html&gt;</pre>
        </div>

        <div>
            <a target="_blank" href="${pageContext.request.contextPath}/examples/transformer" class="myButton">Try it yourself</a>
        </div>
    </div>

</body>

</html>
