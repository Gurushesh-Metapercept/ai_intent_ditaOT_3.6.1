<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  version="2.0"
  exclude-result-prefixes="xs dita-ot"
>

  <!-- Define your component template -->
  <xsl:template name="my-header">
    
  <xsl:variable name="relpath">
    <xsl:choose>
      <xsl:when test="$FILEDIR='.'">
        <xsl:text>.</xsl:text>
      </xsl:when>
      <xsl:when test="contains($FILEDIR,'\')" >
         <xsl:value-of select=" replace($FILEDIR,'[^\\]+','..')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select=" replace($FILEDIR,'[^/]+','..')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

    <div style="background: #eee; padding:5px 1rem; border-bottom:1px solid #92929244;">
        <a href="/">
            <img src="{$relpath}/images/metr_logo.png" />
        </a>
    </div>
  </xsl:template>

</xsl:stylesheet>