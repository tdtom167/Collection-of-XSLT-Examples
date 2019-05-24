<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>XSLT &lt;xsl:value-of&gt; Element</title>
    <!-- Syntax Highlight -->
    <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
</head>

<body>
    <style>
        th {padding: 10px;}
        td {padding: 10px;}
    </style>

    <div id="navbar">
        <a href="/xslt_examples" class="active">Home</a>
        <a href="priority-of-templates.jsp">Priority of templates</a>
        <a href="named-templates.jsp">Named templates</a>
        <a href="xsl-if.jsp">XSLT &lt;if&gt;</a>
        <a href="xsl-for-each.jsp">XSLT &lt;for-each&gt;</a>
        <a href="xsl-value-of.jsp">XSLT &lt;value-of&gt;</a>
        <a href="xsl-number.jsp">XSLT &lt;number&gt;</a>
        <a href="xsl-choose.jsp">XSLT &lt;choose&gt;</a>
        <a href="xsl-copy.jsp" style="background-color: #ddd; color: black;">XSLT &lt;copy-of&gt;</a>
        <a href="literal-elements.jsp">Literal elements</a>
    </div>

    <div class="content">
        <h1>XSLT &lt;xsl:copy-of&gt; Element</h1>
        <hr>
        <h2>Definition and usage</h2>
        <p>The <code class="light">&lt;xsl:copy-of&gt;</code> element makes a deep copy of an XML node as defined by an expression in the select attribute.</p>
        <hr>

        <h2>Syntax</h2>
        <div class="floatingBox">
            <pre class="prettyprint linenums">
        &lt;xsl:copy-of select=&quot;expression&quot; /&gt;</pre>
        </div>

        <hr>
        <h2>Usage</h2>
        <div class="floatingBox">
            <table class="grayWhiteTable">
                <tr>
                    <th style="width: 15%; text-align: left;">
                        Attribute
                    </th>
                    <th style="width: 15%; text-align: left;">
                        Value
                    </th>
                    <th style= "text-align: left;">
                        Description
                    </th>
                </tr>

                <tr class="light">
                    <td>
                        select
                    </td>
                    <td>
                        expression
                    </td>
                    <td>
                        Required an XPATH expression or variable reference.
                    </td>
                </tr>
            </table>
        </div>
        <hr>

        <hr>
        <h2>Example</h2>
        <p>
            The following XSLT file creates a copy of the input file example, creating another xml file containing only person elements that have age under 18
        </p>

        <div class="floatingHalfBox">
            <h3>XML File (family.xml)</h3>
            <pre class="prettyprint linenums">
        &lt;?xml version="1.0"?&gt;
        &lt;?xml-stylesheet type="text/xsl" href="family.xsl"?&gt;
        &lt;family&gt;
            &lt;person&gt;
                &lt;first-name age="10"&gt;Fred&lt;/first-name&gt;
                &lt;family-name&gt;Smith&lt;/family-name&gt;
            &lt;/person&gt;
            &lt;person&gt;
                &lt;first-name age="13"&gt;Jill&lt;/first-name&gt;
                &lt;family-name&gt;Jones&lt;/family-name&gt;
            &lt;/person&gt;
            &lt;person&gt;
                &lt;first-name age="23"&gt;John&lt;/first-name&gt;
                &lt;family-name&gt;Wick&lt;/family-name&gt;
            &lt;/person&gt;
        &lt;/family&gt;</pre>
        </div>

        <div class="floatingHalfBox">
            <h3>XSLT File (family.xsl)</h3>
            <pre class="prettyprint linenums">
        &lt;?xml version="1.0"?&gt;
        &lt;xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;
                 &lt;xsl:copy-of select=&quot;/person[@age lt; 18]&quot; /&gt;
        &lt;/xsl:stylesheet&gt;










        </pre>
        </div>

        <div>
            <a target="_blank" href="transformer.jsp" class="myButton">Try it yourself</a>
        </div>

        <div class="floatingBox">
            <b>Processor output:</b>
            <pre class="prettyprint linenums">
        &lt;?xml version="1.0" encoding="UTF-16"?&gt;
            &lt;person&gt;
                &lt;first-name age="10"&gt;Fred&lt;/first-name&gt;
                &lt;family-name&gt;Smith&lt;/family-name&gt;
            &lt;/person&gt;
            &lt;person&gt;
                &lt;first-name age="13"&gt;Jill&lt;/first-name&gt;
                &lt;family-name&gt;Jones&lt;/family-name&gt;
            &lt;/person&gt;
        </pre>
        </div>
    </div>
</body>

</html>
