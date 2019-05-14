<%--
  Created by IntelliJ IDEA.
  User: tomasbouma
  Date: 14/05/2019
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
    <title>xslt-number</title>
</head>
<body>
    <h1>XSLT:Number</h1>
    The &lt;xsl:number&gt; element is used to determine the integer position of the current node in the source. It is also used to format a number.
    <h3>Usage</h3>
    <pre class="prettyprint">
        &lt;xsl:number
            count="expression"
            level="single|multiple|any"
            from="expression"
            value="expression"
            format="formatstring"
            lang="languagecode"
            letter-value="alphabetic|traditional"
            grouping-separator="character"
            grouping-size="number"/&gt;
        </pre>
    <h3>Syntax</h3>
    <table style="width:100%">
        <tr>
            <th>Attribute</th>
            <th>Value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>count</td>
            <td>expression</td>
            <td>Optional. An XPath expression that specifies what nodes are to be counted</td>
        </tr>
        <tr>
            <td>level</td>
            <td>single/multiple/any</td>
            <td>Optional. Controls how the sequence number is assigned</td>
        </tr>
        <tr>
            <td>from<td/>
            <td>expression<td/>
            <td>Optional. An XPath expression that specifies where the counting will start<td/>
        </tr>
        <tr>
            <td>value<td/>
            <td>expression<td/>
            <td>Optional. Specifies a user-provided number that is used in place of a sequence generated number<td/>
        </tr>
        <tr>
            <td>format</td>
            <td>formatstring</td>
            <td>Optional. Defines the output format for the number. Can be one of the following:</td>
        </tr>
        <tr>
            <td>lang</td>
            <td>languagecode</td>
            <td>Optional. Specifies the language alphabet to be used for the numbering </td>
        </tr>
        <tr>
            <td>letter-value</td>
            <td>alphabetic/traditional</td>
            <td>Optional. Specifies whether the numbering in the selected language is alphabetic or traditional. The default is alphabetic
            </td>
        </tr>
        <tr>
            <td>grouping-separator</td>
            <td>character</td>
            <td>Optional. Specifies what character should be used to separate groups of digits. The default is the comma</td>
        </tr>
        <tr>
            <td>grouping-size</td>
            <td>number</td>
            <td>Optional. Specifies how many digits are in the groups that are being separated by the character specified in the grouping-separator attribute. The default is 3</td>
        </tr>
    </table>
    <h3>Example</h3>
    <pre class="prettyprint">
        &lt;xsl:number value="250000" grouping-size="2"/&gt;>
        Output:
            25,00,00
        </pre>
</body>
</html>
