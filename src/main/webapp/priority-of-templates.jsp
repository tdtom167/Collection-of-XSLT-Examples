<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Priority of templates</title>
        <!-- Syntax Highlight -->
        <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
    </head>
    <body>
        <div id="navbar">
            <a href="/xslt_examples" class="active">Home</a>
            <a href="priority-of-templates.jsp" style="background-color: #ddd; color: black;">Priority of templates</a>
            <a href="named-templates.jsp">Named templates</a>
            <a href="xsl-if.jsp">XSLT &lt;if&gt;</a>
            <a href="xsl-for-each.jsp">XSLT &lt;for-each&gt;</a>
            <a href="xsl-value-of.jsp">XSLT &lt;value-of&gt;</a>
            <a href="xsl-number.jsp">XSLT &lt;number&gt;</a>
            <a href="xsl-choose.jsp">XSLT &lt;choose&gt;</a>
            <a href="xsl-copy.jsp">XSLT &lt;copy-of&gt;</a>
            <a href="literal-elements.jsp">Literal elements</a>
            <a href="processing-mode.jsp">Processing mode</a>
        </div>

        <div class="content">
            <h1>Priority of templates</h1>
            <p>Priority of template can be specified by <strong>priority</strong> attribute. The default priority is <em>0.5</em> .
                Template withhigher value in <strong>priority</strong> attribute is used. If two templates have the same priority then the last one in the file is used.</p>
            <div class="fileBlockFloat">
                <h3>XML file</h3>
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

            <div class="fileBlockFloat">
                <h3>XSLT file</h3>
                <pre class="prettyprint linenums">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;xsl:stylesheet version=&quot;1.0&quot; xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot;&gt;

    &lt;xsl:template priority=&quot;1&quot; match=&quot;/persons/person[name=&#39;Alice&#39;]&quot;&gt;
        High priority template matching name Alice
    &lt;/xsl:template&gt;

    &lt;xsl:template priority=&quot;0.5&quot; match=&quot;/persons/person[name=&#39;Alice&#39;]&quot;&gt;
        Low priority template matching name Alice
    &lt;/xsl:template&gt;

    &lt;xsl:template match=&quot;//person[name=&#39;John&#39;]&quot;&gt;
        Template matching name John
    &lt;/xsl:template&gt;

    &lt;xsl:template match=&quot;/persons/person[name=&#39;John&#39; and income&gt;=78000]&quot;&gt;
        First template matching name John with income over 78000
    &lt;/xsl:template&gt;

    &lt;xsl:template match=&quot;/persons/person[name=&#39;John&#39; and income&gt;=80000]&quot;&gt;
        Second template matching name John with income over 80000
    &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;
			</pre>
            </div>

            <div>
                <a target="_blank" href="transformer.jsp" class="myButton">Try it yourself</a>
            </div>

            <div class="fileBlock">
                <h3>Output</h3>
                <pre class="prettyprint linenums">
Template matching name John
Second template matching name John with income over 80000
High priority template matching name Alice
			</pre>
            </div>
            <p>
                First person <strong>John Doe</strong> is matched by template matching all persons with name <em>John</em>. It is only template that matches this person because he doesn't have income over <em>78000</em>.<br/>
                Second person <strong>John Snow</strong> have income <em>80000</em> which means he can be matched with 3 templates. Each of these have <strong>default priority</strong> attribute so they are equal. This means the last one in the file is used. <br/>
                The last person <strong>Alice Carlson</strong> fits two templates. Both the same, matching person with name <em>Alice</em>, except the first one have priority set to <em>1</em> which is more than <em>0.5</em> and that is why the first one is used.
            </p>
        </div>
    </body>
</html>