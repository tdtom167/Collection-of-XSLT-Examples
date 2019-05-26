<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Construction of elements using literal elements</title>
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
        <a href="${pageContext.request.contextPath}/examples/literal-elements" style="background-color: #ddd; color: black;">Literal elements</a>
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
        <h1>Literal Element</h1>
        <hr>
        A literal element is any XML element that is represented literally in a template,
        is not in the XSLT namespace, and is written literally onto the result tree when processed.
        <br>
        These elements are copied to the current output stream at the position in which they occur.
        Attribute values within literal elements are treated as attribute value templates.
        <hr>

    <h2>Example</h2>
    <p>
        The XSLT file in this example defines the structure of an output document. The output is a top-level HTML
        element containing <code>&lt;body&gt;</code> element. The body contains literal elements <code>&lt;album&gt;</code> <code>&lt;band&gt;</code> and <code>&lt;release&gt;</code> for each album.
    </p>

    <div class="floatingHalfBox">
        <h3>XML File (albums.xml)</h3>
        <pre class="prettyprint linenums">
&lt;?xml version='1.0'?&gt;
&lt;?xml-stylesheet type="text/xsl" href="albums.xsl" ?&gt;
&lt;catalog&gt;
    &lt;album&gt;
        &lt;title&gt;Violator&lt;/title&gt;
        &lt;artist&gt;Depeche Mode&lt;/artist&gt;
        &lt;year&gt;1990&lt;/year&gt;
    &lt;/album&gt;
    &lt;album&gt;
        &lt;title&gt;Mylo Xyloto&lt;/title&gt;
        &lt;artist&gt;Coldplay&lt;/artist&gt;
        &lt;year&gt;2011&lt;/year&gt;
    &lt;/album&gt;
&lt;/catalog&gt;



        </pre>
    </div>

    <div class="floatingHalfBox">
        <h3>XSLT File (albums.xsl)</h3>
        <pre class="prettyprint linenums">
&lt;?xml version='1.0'?&gt;
&lt;xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;

    &lt;xsl:template match="/"&gt;
        &lt;html&gt;
            &lt;body&gt;
                &lt;xsl:for-each select="catalog/album"&gt;
                    &lt;album>&lt;xsl:value-of select="title"/&gt;&lt;/album&gt;
                    &lt;band&gt;&lt;xsl:value-of select="artist"/&gt;&lt;/band&gt;
                    &lt;release&gt;&lt;xsl:value-of select="year"/&gt;&lt;/release&gt;
                    &lt;br/&gt;
                &lt;/xsl:for-each&gt;
            &lt;/body&gt;
        &lt;/html&gt;
    &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;</pre>
    </div>

    <div class="floatingBox">
        <h3>Output</h3>
        Violator Depeche Mode 1990<br/>
        Mylo Xyloto Coldplay 2011<br/>

        <br/>
        <b>Processor output:</b>
        <pre class="prettyprint linenums">
&lt;html&gt;
    &lt;body&gt;
        &lt;album&gt;Violator&lt;/album&gt;
        &lt;band&gt;Depeche Mode&lt;/band&gt;
        &lt;release&gt;1990&lt;/release&gt;
        &lt;br&gt;
        &lt;album&gt;Mylo Xyloto&lt;/album&gt;
        &lt;band&gt;Coldplay&lt;/band&gt;
        &lt;release&gt;2011&lt;/release&gt;
        &lt;br&gt;
    &lt;/body&gt;
&lt;/html&gt;</pre>
    </div>
        <div>
            <a target="_blank" href="${pageContext.request.contextPath}/examples/transformer" class="myButton">Try it yourself</a>
        </div>
    </div>

</body>
</html>
