<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Application of templates</title>
        <!-- Syntax Highlight -->
        <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/desert.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylesheet.css" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
    </head>
    <body>
        <h1>Application of templates</h1>
        <p>
            Templates can be applied using <strong>&lt;xsl:apply-templates <span style="color: rgb(135, 202, 99);">match</span><span style="color: white;">=</span><span style="color: rgb(255, 81, 142);">&quot;some/xpath&quot;</span> <span style="color: rgb(135, 202, 99);">mode</span><span style="color: white;">=</span><span style="color: rgb(255, 81, 142);">&quot;nameOfMode&quot;</span>/&gt;</strong>.
            Both of the attributes are optional. If you don't specify <strong>match</strong> attribite then all children of current element will be matched.
            Using <strong>match</strong> you can select which children will be selected. You can also specify <strong>mode</strong> which will affect which template will be used.
            Applying templates also depends on <a href="${pageContext.request.contextPath}/examples/priority-of-templates">priority of templates</a>. Templates can also have names and being called, see <a href="${pageContext.request.contextPath}/examples/named-templates">named teplates</a>.
        </p>
        <div class="fileHalfScreen">
            <h3>XML File</h3>
            <pre class="prettyprint linenums">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;vehicles&gt;
    &lt;car&gt;
        &lt;name&gt;Porsche 911&lt;/name&gt;
        &lt;price&gt;300000&lt;/price&gt;
    &lt;/car&gt;

    &lt;motorcycle&gt;
        &lt;name&gt;Suzuki GSX-R1000X&lt;/name&gt;
        &lt;price&gt;180000&lt;/price&gt;
    &lt;/motorcycle&gt;

    &lt;motorcycle&gt;
        &lt;name&gt;Yamaha 2019 YZ450F&lt;/name&gt;
        &lt;price&gt;200000&lt;/price&gt;
    &lt;/motorcycle&gt;

    &lt;car&gt;
        &lt;name&gt;Tesla Model X&lt;/name&gt;
        &lt;price&gt;500000&lt;/price&gt;
    &lt;/car&gt;
&lt;/vehicles&gt;
            </pre>
        </div>
        <div class="fileHalfScreen">
            <h3>XSLT File</h3>
            <pre class="prettyprint linenums">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
&lt;xsl:stylesheet version=&quot;1.0&quot; xmlns:xsl=&quot;http://www.w3.org/1999/XSL/Transform&quot;&gt;

    &lt;xsl:template match=&quot;/&quot;&gt;
        &lt;html&gt;
            &lt;xsl:apply-templates/&gt;
        &lt;/html&gt;
    &lt;/xsl:template&gt;

    &lt;xsl:template match=&quot;vehicles&quot;&gt;
        &lt;h1&gt;Vehicles&lt;/h1&gt;
        &lt;h2&gt;Cars&lt;/h2&gt;
        &lt;h3&gt;Cars list&lt;/h3&gt;
        &lt;ul&gt;
            &lt;xsl:apply-templates select=&quot;car&quot; mode=&quot;list&quot;/&gt;
        &lt;/ul&gt;
        &lt;h3&gt;Cars table&lt;/h3&gt;
        &lt;table&gt;
            &lt;tr&gt;
                &lt;th&gt;Name&lt;/th&gt;
                &lt;th&gt;Price&lt;/th&gt;
            &lt;/tr&gt;
            &lt;xsl:apply-templates select=&quot;car&quot;/&gt;
        &lt;/table&gt;
        &lt;h2&gt;Motorcycles&lt;/h2&gt;
        &lt;table&gt;
            &lt;tr&gt;
                &lt;th&gt;Name&lt;/th&gt;
                &lt;th&gt;Price&lt;/th&gt;
            &lt;/tr&gt;
            &lt;xsl:apply-templates select=&quot;motorcycle&quot;/&gt;
        &lt;/table&gt;
    &lt;/xsl:template&gt;

    &lt;xsl:template match=&quot;car&quot;&gt;
        &lt;tr&gt;
            &lt;td&gt;&lt;xsl:value-of select=&quot;name&quot;/&gt;&lt;/td&gt;
            &lt;td&gt;&lt;xsl:value-of select=&quot;price&quot;/&gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/xsl:template&gt;

    &lt;xsl:template match=&quot;car&quot; mode=&quot;list&quot;&gt;
        &lt;li&gt;&lt;xsl:value-of select=&quot;name&quot;/&gt;&lt;/li&gt;
    &lt;/xsl:template&gt;

    &lt;xsl:template match=&quot;motorcycle&quot;&gt;
        &lt;tr&gt;
            &lt;td&gt;&lt;xsl:value-of select=&quot;name&quot;/&gt;&lt;/td&gt;
            &lt;td&gt;&lt;xsl:value-of select=&quot;price&quot;/&gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/xsl:template&gt;

&lt;/xsl:stylesheet&gt;
            </pre>
        </div>
        <div class="fileHalfScreen">
                <h3>Output</h3>
                <pre class="prettyprint linenums">
&lt;html&gt;
    &lt;h1&gt;Vehicles&lt;/h1&gt;
    &lt;h2&gt;Cars&lt;/h2&gt;
    &lt;h3&gt;Cars list&lt;/h3&gt;
    &lt;ul&gt;
        &lt;li&gt;Porsche 911&lt;/li&gt;
        &lt;li&gt;Tesla Model X&lt;/li&gt;
    &lt;/ul&gt;
    &lt;h3&gt;Cars table&lt;/h3&gt;
    &lt;table&gt;
        &lt;tr&gt;
            &lt;th&gt;Name&lt;/th&gt;
            &lt;th&gt;Price&lt;/th&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td&gt;Porsche 911&lt;/td&gt;
            &lt;td&gt;300000&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td&gt;Tesla Model X&lt;/td&gt;
            &lt;td&gt;500000&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/table&gt;
    &lt;h2&gt;Motorcycles&lt;/h2&gt;
    &lt;table&gt;
        &lt;tr&gt;
            &lt;th&gt;Name&lt;/th&gt;
            &lt;th&gt;Price&lt;/th&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td&gt;Suzuki GSX-R1000X&lt;/td&gt;
            &lt;td&gt;180000&lt;/td&gt;
        &lt;/tr&gt;
        &lt;tr&gt;
            &lt;td&gt;Yamaha 2019 YZ450F&lt;/td&gt;
            &lt;td&gt;200000&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/table&gt;
&lt;/html&gt;
                </pre>
        </div>
        <div class="fileHalfScreen">
            <h3>Preview</h3>
            <p>This is how result html looks like displayed by browser.</p>
            <div class="browserDisplay">
                <h1>Vehicles</h1>
                <h2>Cars</h2>
                <h3>Cars list</h3>
                <ul>
                    <li>Porsche 911</li>
                    <li>Tesla Model X</li>
                </ul>
                <h3>Cars table</h3>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                    </tr>
                    <tr>
                        <td>Porsche 911</td>
                        <td>300000</td>
                    </tr>
                    <tr>
                        <td>Tesla Model X</td>
                        <td>500000</td>
                    </tr>
                </table>
                <h2>Motorcycles</h2>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                    </tr>
                    <tr>
                        <td>Suzuki GSX-R1000X</td>
                        <td>180000</td>
                    </tr>
                    <tr>
                        <td>Yamaha 2019 YZ450F</td>
                        <td>200000</td>
                    </tr>
                </table>
            </div>
        </div>
        <p>First the car template with mode list is matched. This means all motorcycles are ignored. Then the car template without mode,
             which creates table of cars. And then the template matching motorcycles is applied.</p>
    </body>
</html>
