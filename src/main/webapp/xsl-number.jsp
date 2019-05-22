<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>XSLT &lt;xsl:number&gt; Element</title>
    <!-- Syntax Highlight -->
    <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
</head>

<body>
    <div id="navbar">
        <a href="/xslt_examples" class="active">Home</a>
        <a href="priority-of-templates.jsp">Priority of templates</a>
        <a href="xsl-if.jsp">XSLT &lt;if&gt;</a>
        <a href="xsl-for-each.jsp">XSLT &lt;for-each&gt;</a>
        <a href="xsl-value-of.jsp">XSLT &lt;value-of&gt;</a>
        <a href="xsl-number.jsp">XSLT &lt;number&gt;</a>
        <a href="xsl-choose.jsp">XSLT &lt;choose&gt;</a>
        <a href="xsl-copy.jsp">XSLT &lt;copy-of&gt;</a>
    </div>

    <div class="floatingBox">
        <h1>XSLT &lt;xsl:number&gt; Element</h1>
        <hr>
        The <code>&lt;xsl:number&gt;</code> element is used to determine the integer position of the current node in the source. It is also used to format a number.
        <hr>

        <h2>Syntax</h2>
        <div class="floatingBox">
            <pre class="prettyprint linenums">
        &lt;xsl:number
                select=&quot;expression&quot;
                count=&quot;expression&quot;
                level=&quot;single|multiple|any&quot;
                from=&quot;expression&quot;
                value=&quot;expression&quot;
                format=&quot;formatstring&quot;
                lang=&quot;languagecode&quot;
                letter-value=&quot;alphabetic|traditional&quot;
                grouping-separator=&quot;character&quot;
                grouping-size=&quot;number&quot;/&gt;</pre>
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
                        count
                    </td>
                    <td>
                        expression
                    </td>
                    <td>
                        Optional. An XPath expression that specifies what nodes are to be counted
                    </td>
                </tr>

                <tr>
                    <td>
                        level
                    </td>
                    <td>
                        single<br/>multiple<br/>any
                    </td>
                    <td>
                        Optional. Controls how the sequence number is assigned
                        <br>Can be one of the following:
                        <ul>
                            <li>single (default)</li>
                            <li>multiple</li>
                            <li>any (not supported by Netscape 6)</li>
                        </ul>
                    </td>
                </tr>
                <tr class="light">
                    <td>
                        from
                    </td>
                    <td>
                        expression
                    </td>
                    <td>
                        Optional. An XPath expression that specifies where the counting will start</td>
                    <td>
                </tr>
                <tr >
                    <td>
                        value
                    </td>
                    <td>
                        expression
                    </td>
                    <td>
                        Optional. Specifies a user-provided number that is used in place of a sequence generated number
                    </td>
                    <td>
                </tr>
                <tr class="light">
                    <td>
                        format
                    </td>
                    <td>
                        formatstring
                    </td>
                    <td>
                        Optional. Defines the output format for the number. </td>
                    <td>
                </tr>
                <tr>
                    <td>
                        lang
                    </td>
                    <td>
                        languagecode
                    </td>
                    <td>
                        Optional. Specifies the language alphabet to be used for the numbering (Not supported by Netscape 6)            </td>
                    <td>
                </tr>
                <tr class="light">
                    <td>
                        letter-value
                    </td>
                    <td>
                        alphabetic
                        traditional
                    </td>
                    <td>
                        Optional. Specifies whether the numbering in the selected language is alphabetic or traditional. The default is alphabetic
                    </td>
                    <td>
                </tr>
                <tr >
                    <td>
                        grouping-separator	            </td>
                    <td>
                        character
                    </td>
                    <td>
                        Optional. Specifies what character should be used to separate groups of digits. The default is the comma
                    </td>
                    <td>
                </tr>
                <tr class="light">
                    <td>
                        grouping-size	            </td>
                    <td>
                        number
                    </td>
                    <td>
                        Optional. Specifies how many digits are in the groups that are being separated by the character specified in the grouping-separator attribute. The default is 3            </td>
                    <td>
                </tr>
            </table>
        </div>
        <h2>Examples</h2>


        <div class="floatingHalfBox">
            <h3>XML File (customers.xml)</h3>
            <pre class="prettyprint linenums">
        &lt;?xml version="1.0"?&gt;
        &lt;?xml-stylesheet type="text/xsl" href="foreach.xsl" ?&gt;
        &lt;customers>&lt;
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
                                &lt;td&gt;&lt;xsl:number value=&quot;position()&quot; format=&quot;1&quot; /&gt;&lt;/td&gt;
                                &lt;td&gt;&lt;xsl:value-of select="name" />&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/xsl:for-each&gt;
                    &lt;/table&gt;
                &lt;/body&gt;
            &lt;/html&gt;
        &lt;/xsl:template&gt;

        &lt;/xsl:stylesheet&gt;</pre>



        </div>

        <br>
        <br>
        <br>
        <br>
        <div class="floatingBox">
            <h3>Output</h3>
            <table>
                <tr>
                    <td>1</td>
                    <td>Albert Aikens</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>John Smith</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Zack Zwyker</td>
                </tr>
            </table>
            <br/>
            <b>Processor output:</b>
            <pre class="prettyprint linenums">
        &lt;html&gt;
            &lt;body&gt;
                &lt;table&gt;
                    &lt;tr&gt;
                        &lt;td&gt;1&lt;/td&gt;
                        &lt;td&gt;Albert Aikens&lt;/td&gt;
                    &lt;/tr&gt;
                    &lt;tr&gt;
                        &lt;td&gt;2&lt;/td&gt;
                        &lt;td&gt;John Smith&lt;/td&gt;
                    &lt;/tr&gt;
                    &lt;tr&gt;
                        &lt;td&gt;3&lt;/td&gt;
                        &lt;td&gt;Zack Zwyker&lt;/td&gt;
                    &lt;/tr&gt;
                &lt;/table&gt;
            &lt;/body&gt;
        &lt;/html&gt;</pre>
        </div>
    </div>
</body>

</html>