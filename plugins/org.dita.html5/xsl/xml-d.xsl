<?xml version="1.0" encoding="UTF-8" ?>
<!--
This file is part of the DITA Open Toolkit project.

Copyright 2014 Jarno Elovirta

See the accompanying LICENSE file for applicable license.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:template match="*[contains(@class, ' xml-d/xmlelement ')]">
    <code>
      <xsl:if test="@ai-intent">
        <xsl:attribute name="ai-intent" select="@ai-intent"/>
      </xsl:if>
      <xsl:call-template name="commonattributes"/>
      <xsl:text>&lt;</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>&gt;</xsl:text>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/xmlatt ')]">
    <code>
      <xsl:if test="@ai-intent">
        <xsl:attribute name="ai-intent" select="@ai-intent"/>
      </xsl:if>
      <xsl:call-template name="commonattributes"/>
      <xsl:text>@</xsl:text>
      <xsl:apply-templates/>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/textentity ')]">
    <code>
      <xsl:if test="@ai-intent">
        <xsl:attribute name="ai-intent" select="@ai-intent"/>
      </xsl:if>
      <xsl:call-template name="commonattributes"/>
      <xsl:text>&amp;</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>;</xsl:text>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/parameterentity ')]">
    <code>
      <xsl:if test="@ai-intent">
        <xsl:attribute name="ai-intent" select="@ai-intent"/>
      </xsl:if>
      <xsl:call-template name="commonattributes"/>
      <xsl:text>%</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>;</xsl:text>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/numcharref ')]">
    <code>
      <xsl:if test="@ai-intent">
        <xsl:attribute name="ai-intent" select="@ai-intent"/>
      </xsl:if>
      <xsl:call-template name="commonattributes"/>
      <xsl:text>&amp;#</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>;</xsl:text>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/xmlnsname ')]">
    <code>
      <xsl:if test="@ai-intent">
        <xsl:attribute name="ai-intent" select="@ai-intent"/>
      </xsl:if>
      <xsl:call-template name="commonattributes"/>
      <xsl:apply-templates/>
    </code>
  </xsl:template>
  
  <xsl:template match="*[contains(@class, ' xml-d/xmlpi ')]">
    <code>
      <xsl:if test="@ai-intent">
        <xsl:attribute name="ai-intent" select="@ai-intent"/>
      </xsl:if>
      <xsl:call-template name="commonattributes"/>
      <xsl:text>&lt;?</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>?&gt;</xsl:text>
    </code>
  </xsl:template>
    
</xsl:stylesheet>
