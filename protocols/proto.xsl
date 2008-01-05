
<!-- Author: stpeter -->

<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>

  <xsl:output method='html'/>

  <xsl:template match='/'>
    <html>
      <head>
        <title><xsl:value-of select='/manifest/longname'/></title>
        <link rel='stylesheet' type='text/css' href='/xmpp.css' />
        <link rel='shortcut icon' type='image/x-icon' href='/favicon.ico' />
        <link>
          <xsl:attribute name='rel'><xsl:text>alternate</xsl:text></xsl:attribute>
          <xsl:attribute name='href'><xsl:value-of select='/manifest/specurl'/></xsl:attribute>
        </link>
        <meta>
          <xsl:attribute name='name'><xsl:text>DC.Title</xsl:text></xsl:attribute>
          <xsl:attribute name='content'><xsl:value-of select='/manifest/longname'/></xsl:attribute>
        </meta>
      </head>
      <body>
        <h1><xsl:value-of select='/manifest/longname'/></h1>
        <p>
        <a>
          <xsl:attribute name='href'>
            <xsl:value-of select='/manifest/specurl'/>
          </xsl:attribute>
          <xsl:value-of select='/manifest/specnum'/>:<xsl:text> </xsl:text><xsl:value-of select='/manifest/longname'/>
        </a>
        (a <xsl:value-of select='/manifest/status'/> Standard of the
        <xsl:value-of select='/manifest/publisher'/>)
        defines the following XML namespaces:</p>
          <ul>
            <xsl:apply-templates select='/manifest/namespace' mode='name'/>
          </ul>
        <xsl:variable name='schema.count' select='count(/manifest/namespace)'/>
        <xsl:if test='$schema.count &gt; 0'>
          <p>The following XML schemas are available for the <xsl:value-of select='/manifest/longname'/> protocol:</p>
          <ul>
            <xsl:apply-templates select='/manifest/namespace' mode='schema'/>
          </ul>
        </xsl:if>
        <p>This information is maintained by the <a href='http://www.xmpp.org/registrar/'>XMPP Registrar</a>.</p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match='namespace' mode='name'>
    <xsl:variable name='ns.count' select='count(name)'/>
    <xsl:choose>
      <xsl:when test="$ns.count &gt; 0">
        <li><xsl:value-of select='name'/></li>
      </xsl:when>
      <xsl:otherwise>
        <li><xsl:value-of select='name'/></li>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match='namespace' mode='schema'>
    <xsl:variable name='this.url' select='schema'/>
    <xsl:variable name='ns.count' select='count(name)'/>
    <xsl:choose>
      <xsl:when test="$ns.count &gt; 0">
        <li><a href='{$this.url}'><xsl:value-of select='schema'/></a></li>
      </xsl:when>
      <xsl:otherwise>
        <li><a href='{$this.url}'><xsl:value-of select='schema'/></a></li>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>