<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Processing Mode</title>
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
        <a href="${pageContext.request.contextPath}/examples/processing-mode" style="background-color: #ddd; color: black;">Processing mode</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-if">&lt;if&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-for-each">&lt;for-each&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-value-of">&lt;value-of&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-number">&lt;number&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-choose">&lt;choose&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/xsl-copy">&lt;copy-of&gt;</a>
        <a href="${pageContext.request.contextPath}/examples/transformer">Transformation</a>
    </div>

<div class="content">
    <h1>Processing Mode</h1>
    <hr>
    The XSLT processor takes one or more XML source documents, plus one or more XSLT stylesheets, and processes them to produce an output document.
    <br>
    The processor follows a fixed algorithm. First, assuming a stylesheet has already been read and prepared, the processor builds a source tree from the input XML document. It then processes the source tree's root node, finds the best-matching template for that node in the stylesheet, and evaluates the template's contents. Instructions in each template generally direct the processor to either create nodes in the result tree, or to process more nodes in the source tree in the same way as the root node. Output derives from the result tree.
    <hr>

    <h2>Definition and usage</h2>
    <p>The <code class="light">&lt;xsl:processing-instruction&gt;</code> element writes a processing instruction to the output.</p>
    <hr>

    <h2>Syntax</h2>
    <div class="floatingBox">
            <pre class="prettyprint linenums">
&lt;xsl:processing-instruction
        name="process-name"&gt;

    &lt;!-- Content:template --&gt;

&lt;/xsl:processing-instruction&gt;</pre>
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
                    name
                </td>
                <td>
                    process-name
                </td>
                <td>
                    Required. Specifies the name of the processing instruction
                </td>
            </tr>

        </table>
    </div>

    <h2>Example</h2>

    <div class="floatingBox">
        <h3>This code:</h3>
        <pre class="prettyprint linenums">
&lt;xsl:processing-instruction name="xml-stylesheet"&gt;
    href="style.css" type="text/css"
&lt;/xsl:processing-instruction&gt;</pre>
    </div>

    <div class="floatingBox">
        <h3>Creates this tag:</h3>
        <pre class="prettyprint linenums">
&lt;?xml-stylesheet href="style.css" type="text/css"?&gt;</pre>
    </div>

</div>

</body>
</html>
