<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>XSLT &lt;xsl:choose&gt; Element</title>
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
        <a href="${pageContext.request.contextPath}/examples/xsl-choose" style="background-color: #ddd; color: black;">&lt;choose&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-copy">&lt;copy-of&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/transformer">Transformation</a>
    </div>

    <div class="content">
        <h1>XSLT &lt;xsl:choose&gt; Element</h1>
        <hr>
        <h2>Definition and usage</h2>
        <p>The <code class="light">&lt;xsl:choose&gt;</code> element is used in conjunction with
            <code>&lt;xsl:when&gt;</code> and <code>&lt;xsl:otherwise&gt;</code> to express multiple conditional tests.</p>
        <hr>

        <h2>Syntax</h2>
        <div class="floatingBox">
            <pre class="prettyprint linenums">
&lt;xsl:choose>
    &lt;xsl:when test=&quot;expression&quot;&gt;
        ... some output ...
    &lt;/xsl:when&gt;
    &lt;xsl:otherwise&gt;
        ... some output ....
    &lt;/xsl:otherwise&gt;
&lt;/xsl:choose&gt;</pre>
        </div>
        <hr>

        <h2>Example</h2>
        <p>
            The following XSLT file creates a <code class="light">&lt;p&gt;</code> element from a <code class="light">&lt;person&gt;</code>
            element with <code class="light">&lt;given-name&gt;</code> and <code class="light">&lt;family-name&gt;</code> child elements.
            The <code class="light">&lt;p&gt;</code> element will contain the string value of the first <code class="light">&lt;given-name&gt;</code>
            child element of the current node, followed by a space and the string value of the first <code class="light">&lt;family-name&gt;</code>
            followed with another <code class="light">&lt;p&gt;</code> element saying if the person is child or adult
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

    &lt;xsl:template match="person"&gt;
        &lt;p&gt;
            &lt;xsl:value-of select="first-name"/&gt;
            &lt;xsl:text&gt; &lt;/xsl:text&gt;
            &lt;xsl:value-of select="family-name"/&gt;
                &lt;p&gt;
                     &lt;xsl:choose&gt;
                            &lt;xsl:when test="age &amp;lt; 18"&gt;
                                child
                            &lt;/xsl:when&gt;
                        &lt;xsl:otherwise&gt;
                            adult
                        &lt;/xsl:otherwise&gt;
                    &lt;/xsl:choose&gt;
                &lt;/p&gt;
        &lt;/p&gt;
    &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;</pre>
        </div>

        <div class="floatingBox">
            <h3>Output</h3>
            Fred Smith<br/> child <br/>
            Jill Jones<br/> child <br/>
            John Wick <br/> adult
            <br/>

            <b>Processor output:</b>
            <pre class="prettyprint linenums">
&lt;?xml version="1.0" encoding="UTF-16"?&gt;
    &lt;p&gt;Fred Smith
        &lt;p&gt;child&lt;/p&gt;
    &lt;/p&gt;
&lt;p&gt;Jill Jones
        &lt;p&gt;child&lt;/p&gt;
    &lt;/p&gt;
&lt;p&gt;John Wick
        &lt;p&gt;adult&lt;/p&gt;
    &lt;/p&gt;
</pre>
        </div>

        <div>
            <a target="_blank" href="${pageContext.request.contextPath}/examples/transformer" class="myButton">Try it yourself</a>
        </div>
    </div>
</body>

</html>
