<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>XSLT Examples</title>
    <link href="https://fonts.googleapis.com/css?family=Kodchasan&display=swap" rel="stylesheet">
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
            <div align="center">
                <h1>Collection of XSLT Examples</h1>
            </div>
            <h3>What is XSLT?</h3>
            <p>
                XSL (eXtensible Stylesheet Language) is a styling language for XML.
                XSLT stands for XSL Transformations and is used to transform XML documents into another format
                such as HTML.
            </p>

            <h3>Why do you need to learn XSLT? </h3>

            <p>
                Not many people know XSLT but it is a very powerful tool widely used for transforming XML documents
                mainly in cases of ETL, HTML, and presentation of XML into more human-readable forms.
                There is not a real alternative, therefore should not be missing in anyone's skill set who is interested
                in markup languages. These examples will teach you how to use XSLT to transform XML documents into other
                formats (like transforming XML into HTML).
            </p>

            <h3> What can you find on this website? </h3>

            <p>
                This website with try it yourself examples will serve as a very good basis for learning, understanding XSLT
                and will be your best friend anytime you need a quick reminder of an XSLT syntax.
            </p>

            <h3>What technologies did we use?</h3>
            <p>
            The website was developed using java servlet, jsp pages and can be run on localhost TomCat Server after cloning the repository from GitHub.
            It was created as a part of a school group project for Masaryk University, Faculty of Informatics, Subject: PB138 Modern markup languages.

            </p>
            Don't wait any more and jump straight to it.
            <hr>
            Authors: Branislav Smolíček, Tomáš Bouma,  Jakub Bateľ, Marek Pavel Viskup.
        </div>
    </body>
</html>
