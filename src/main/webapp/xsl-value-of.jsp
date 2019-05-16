<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>XSLT &lt;xsl:value-of&gt; Element</title>
    <!-- Syntax Highlight -->
    <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
</head>

<p>
    <style>
        tr.light {
            background-color: lightgray;
        }
        table {
            width: 70%;
            border: solid 1px black;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
        }
        th {
            padding: 10px;
        }
    </style>

    <h1>XSLT &lt;xsl:value-of&gt; Element</h1>
    <h2>Definition and usage</h2>
    <p>The &lt;xsl:value-of&gt; element extracts the value of a selected node.</p>
    <h2>Syntax</h2>
    <pre class="prettyprint linenums">
&lt;xsl:value-of select=&quot;expression&quot; disable-output-escaping=&quot;yes|no&quot;/&gt;</pre>

    <h2>Syntax</h2>
    <table>
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

    <h2>The &lt;xsl:value-of&gt; Element</h2>
    <p>The &lt;xsl:value-of&gt; element can be used to extract the value of an XML element and add it to the output stream of the transformation:</p>
    <p><b>Example</b></p>

    <pre class="prettyprint linenums">
    &lt;?xml version="1.0" encoding="UTF-8"?&gt;
    &lt;xsl:stylesheet version="1.0"
                    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"&gt;

        &lt;xsl:template match="/"&gt;
            &lt;html&gt;
            &lt;body&gt;
            &lt;h2&gt;My CD Collection&lt;/h2&gt;
            &lt;table border="1"&gt;
                &lt;tr bgcolor="#9acd32"&gt;
                    &lt;th&gt;Title&lt;/th&gt;
                    &lt;th&gt;Artist&lt;/th&gt;
                &lt;/tr>
                &lt;tr>
                    &lt;td&gt;&lt;xsl:value-of select="catalog/cd/title"/&gt;&lt;/td&gt;
                    &lt;td&gt;&lt;xsl:value-of select="catalog/cd/artist"/&gt;&lt;/td&gt;
                &lt;/tr&gt;
            &lt;/table&gt;
            &lt;/body&gt;
            &lt;/html&gt;
        &lt;/xsl:template&gt;

    &lt;/xsl:stylesheet&gt;</pre>
    <p>
        <b>Note:</b> The <b>select</b> attribute, in the example above, contains an XPath expression. An XPath expression works
        like navigating a file system; a forward slash (/) selects subdirectories.
    </p>
    <p>
        The result from the example above was a little disappointing; only one line of data was copied from the XML
        document to the output. In the next chapter you will learn how to use the <b>&lt;xsl:for-each&gt;</b> element to loop through
        the XML elements, and display all of the records.
    </p>
</body>

</html>
