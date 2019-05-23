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
        <a href="application-of-templates.jsp">Application of templates</a>
        <a href="priority-of-templates.jsp">Priority of templates</a>
        <a href="named-templates.jsp">Named templates</a>
        <a href="xsl-if.jsp">XSLT &lt;if&gt;</a>
        <a href="xsl-for-each.jsp">XSLT &lt;for-each&gt;</a>
        <a href="xsl-value-of.jsp" style="background-color: #ddd; color: black;">XSLT &lt;value-of&gt;</a>
        <a href="xsl-number.jsp">XSLT &lt;number&gt;</a>
        <a href="xsl-choose.jsp">XSLT &lt;choose&gt;</a>
        <a href="xsl-copy.jsp">XSLT &lt;copy-of&gt;</a>
        <a href="transformer.jsp">Transform</a>
    </div>

    <div class="content">
        <h1>XSLT &lt;xsl:value-of&gt; Element</h1>
        <hr>
        <h2>Definition and usage</h2>
        <p>The <code class="light">&lt;xsl:value-of&gt;</code> element extracts the value of a selected node.</p>
        <hr>

        <h2>Syntax</h2>
        <div class="floatingBox">
        <pre class="prettyprint linenums">
    &lt;xsl:value-of select=&quot;expression&quot; disable-output-escaping=&quot;yes|no&quot;/&gt;</pre>
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
                        Required. An XPath expression that specifies which node/attribute to extract the value from. It works
                        like navigating a file system where a forward slash (/) selects subdirectories.
                    </td>
                </tr>

                <tr>
                    <td>
                        disable-output-escaping
                    </td>
                    <td>
                        yes<br/>no
                    </td>
                    <td>
                        Optional. "yes" indicates that special characters (like "<") should be output as is. "no" indicates
                        that special characters (like "<") should be output as "&lt;". Default is "no"
                    </td>
                </tr>
            </table>
        </div>
        <hr>

        <h2>The &lt;xsl:value-of&gt; Element</h2>
        <p>
            The <code class="light">&lt;xsl:value-of&gt;</code> element can be used to extract the value of an XML element
            and add it to the output stream of the transformation.
        </p>

        <hr>
        <h2>Example</h2>
        <p>
            The following XSLT file creates a <code class="light">&lt;p&gt;</code> element from a <code class="light">&lt;person&gt;</code>
            element with <code class="light">&lt;given-name&gt;</code> and <code class="light">&lt;family-name&gt;</code> child elements.
            The <code class="light">&lt;p&gt;</code> element will contain the string value of the first <code class="light">&lt;given-name&gt;</code>
            child element of the current node, followed by a space and the string value of the first <code class="light">&lt;family-name&gt;</code>
            child element of the current node.
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
    &lt;/family&gt;</pre>
        </div>

        <div class="floatingHalfBox">
            <h3>XSLT File (family.xsl)</h3>
            <pre class="prettyprint linenums">
    &lt;?xml version="1.0"?&gt;
    &lt;xsl:stylesheet version="1.0"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;

    &lt;xsl:template match="person"&gt;
        &lt;p&gt;
            &lt;xsl:value-of select="first-name"/&gt;
            &lt;xsl:text&gt; &lt;/xsl:text&gt;
            &lt;xsl:value-of select="family-name"/&gt;
        &lt;/p&gt;
    &lt;/xsl:template&gt;

    &lt;/xsl:stylesheet&gt;</pre>
        </div>

        <div class="floatingBox">
            <h3>Output</h3>
            Fred Smith<br/>
            Jill Jones<br/>
            <br/>

            <b>Processor output:</b>
            <pre class="prettyprint linenums">
    &lt;?xml version="1.0" encoding="UTF-16"?&gt;
        &lt;p&gt;Fred Smith&lt;/p&gt;
        &lt;p&gt;Jill Jones&lt;/p&gt;</pre>
        </div>
    </div>
</body>

</html>
