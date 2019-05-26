<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Named Templates</title>
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
            <a href="${pageContext.request.contextPath}/examples/named-templates" style="background-color: #ddd; color: black;">Named templates</a>
            <a href="${pageContext.request.contextPath}/examples/literal-elements">Literal elements</a>
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
            <h1>Named templates</h1>
            <p>
                Templates can have custom names. The name of the template is specified by <strong>name</strong> attribute.
                After you name the template you can call it using <strong>&lt;xsl:call-template <span style="color: rgb(135, 202, 99);">name</span>
                <span style="color: white;">=</span>
                <span style="color: rgb(255, 81, 142);">&quot;nameOfTemplate&quot;</span>/&gt;</strong>.
                Calling tempalte is similar to calling function in programming. You can even call them with arguments.
            </p>
            <h2>Calling templates with arguments</h2>
            <p>To call template with an argument you need to put tag <strong>&lt;xsl:with-param&gt;</strong> inside the tag <strong>&lt;xsl:call-template&gt;</strong> like this<br/><br/>
                <strong>&lt;xsl:call-template <span style="color: rgb(135, 202, 99);">name</span> <span style="color: white;">=</span>
                    <span style="color: rgb(255, 81, 142);">&quot;nameOfTemplate&quot;</span>&gt;<br/>
                    &nbsp;&nbsp;&nbsp;&lt;xsl:with-param <span style="color: rgb(135, 202, 99);">name</span> <span style="color: white;">=</span> <span style="color: rgb(255, 81, 142);">&quot;nameOfArgument&quot;</span> <span style="color: rgb(135, 202, 99);">match</span> <span style="color: white;">=</span> <span style="color: rgb(255, 81, 142);">&quot;some/xpath&quot;</span>/&gt; <br/>
                    &nbsp;&nbsp;&nbsp;...<br/>
                    &lt;/xsl:call-template&gt;</strong><br/>
                <br/>
                You can add more arguments, which is symbolized with dots.
            </p>
            <div class="floatingHalfBox">
                <h3>XML File</h3>
                <pre class="prettyprint linenums">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;persons&gt;
    &lt;person&gt;
        &lt;name&gt;John&lt;/name&gt;
        &lt;surname&gt;Doe&lt;/surname&gt;
        &lt;income&gt;75000&lt;/income&gt;
    &lt;/person&gt;

    &lt;person&gt;
        &lt;name&gt;John&lt;/name&gt;
        &lt;surname&gt;Snow&lt;/surname&gt;
        &lt;income&gt;80000&lt;/income&gt;
    &lt;/person&gt;

    &lt;person&gt;
        &lt;name&gt;Alice&lt;/name&gt;
        &lt;surname&gt;Carlson&lt;/surname&gt;
        &lt;income&gt;76000&lt;/income&gt;
    &lt;/person&gt;
&lt;/persons&gt;
            </pre>
            </div>
            <div class="floatingHalfBox">
                <h3>XSLT File</h3>
                <pre class="prettyprint linenums">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;xsl:stylesheet version=&quot;1.0&quot; xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot;&gt;

    &lt;xsl:template match=&quot;/&quot;&gt;
        &lt;html&gt;
            &lt;xsl:apply-templates/&gt;
        &lt;/html&gt;
    &lt;/xsl:template&gt;

    &lt;xsl:template match=&quot;persons&quot;&gt;
        &lt;xsl:call-template name=&quot;createTable&quot;&gt;
            &lt;xsl:with-param name=&quot;name&quot;&gt;Name&lt;/xsl:with-param&gt;
            &lt;xsl:with-param name=&quot;surname&quot;&gt;Surname&lt;/xsl:with-param&gt;
            &lt;xsl:with-param name=&quot;income&quot;&gt;Income&lt;/xsl:with-param&gt;
        &lt;/xsl:call-template&gt;
    &lt;/xsl:template&gt;

    &lt;xsl:template name=&quot;createTable&quot;&gt;
        &lt;xsl:param name=&quot;name&quot;/&gt;
        &lt;xsl:param name=&quot;surname&quot;/&gt;
        &lt;xsl:param name=&quot;income&quot;/&gt;
        &lt;table&gt;
            &lt;tr&gt;
                &lt;th&gt;&lt;xsl:value-of select=&quot;$name&quot;/&gt;&lt;/th&gt;
                &lt;th&gt;&lt;xsl:value-of select=&quot;$surname&quot;/&gt;&lt;/th&gt;
                &lt;th&gt;&lt;xsl:value-of select=&quot;$income&quot;/&gt;&lt;/th&gt;
            &lt;/tr&gt;
            &lt;xsl:apply-templates/&gt;
        &lt;/table&gt;
    &lt;/xsl:template&gt;

    &lt;xsl:template match=&quot;person&quot;&gt;
        &lt;tr&gt;
            &lt;td&gt;&lt;xsl:value-of select=&quot;name&quot;/&gt;&lt;/td&gt;
            &lt;td&gt;&lt;xsl:value-of select=&quot;surname&quot;/&gt;&lt;/td&gt;
            &lt;td&gt;&lt;xsl:value-of select=&quot;income&quot;/&gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;
            </pre>
            </div>

            <div class="floatingHalfBox">
                <h3>Output</h3>
                <pre class="prettyprint linenums">
&lt;html&gt;
    &lt;table&gt;
        &lt;tr&gt;
            &lt;th&gt;Name&lt;/th&gt;
            &lt;th&gt;Surname&lt;/th&gt;
            &lt;th&gt;Income&lt;/th&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td&gt;John&lt;/td&gt;
            &lt;td&gt;Doe&lt;/td&gt;
            &lt;td&gt;75000&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td&gt;John&lt;/td&gt;
            &lt;td&gt;Snow&lt;/td&gt;
            &lt;td&gt;80000&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td&gt;Alice&lt;/td&gt;
            &lt;td&gt;Carlson&lt;/td&gt;
            &lt;td&gt;76000&lt;/td&gt;
        &lt;/tr&gt;
        &lt;/table&gt;
&lt;/html&gt;
                </pre>

                <div>
                    <a target="_blank" href="${pageContext.request.contextPath}/examples/transformer" class="myButton">Try it yourself</a>
                </div>
            </div>
            <div class="floatingHalfBox">
                <h3>Preview</h3>
                <p>This is how result html looks like displayed by browser.</p>
                <div class="browserDisplay">
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>Surname</th>
                            <th>Income</th>
                        </tr>
                        <tr>
                            <td>John</td>
                            <td>Doe</td>
                            <td>75000</td>
                        </tr>
                        <tr>
                            <td>John</td>
                            <td>Snow</td>
                            <td>80000</td>
                        </tr>
                        <tr>
                            <td>Alice</td>
                            <td>Carlson</td>
                            <td>76000</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
