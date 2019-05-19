<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Named Templates</title>
        <!-- Syntax Highlight -->
        <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
            
        <style>
            h3 {
                margin: 0;
            }
            .fileBlock {
                padding: 0.5%;
            }
            .fileBlockFloat {
                padding: 0.5%;
                float: left; width: 49%;
            }
        </style>
            
    </head>
    <body>
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
		
		<div class="fileBlock">
			<h3>Output</h3>
			<pre class="prettyprint linenums">
Template matching name John
Second template matching name John with income over 80000
High priority template matching name Alice
			</pre>
		</div>
    </body>
</html>