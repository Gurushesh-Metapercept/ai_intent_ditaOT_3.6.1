<?xml version="1.0" encoding="UTF-8"?>
<!--
This file is part of the DITA Open Toolkit project.

Copyright 2016 Jarno Elovirta

See the accompanying LICENSE file for applicable license.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:related-links="http://dita-ot.sourceforge.net/ns/200709/related-links"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="2.0"
                exclude-result-prefixes="related-links xs">

  <!-- Concepts have their own group. -->
  <xsl:template match="*[contains(@class, ' topic/link ')][@type='concept']" mode="related-links:get-group"
                name="related-links:group.concept"
                as="xs:string">
    <xsl:text>concept</xsl:text>
  </xsl:template>
  
  <!-- Priority of concept group. -->
  <xsl:template match="*[contains(@class, ' topic/link ')][@type='concept']" mode="related-links:get-group-priority"
          name="related-links:group-priority.concept"
          as="xs:integer">
    <xsl:sequence select="3"/>
  </xsl:template>
  
  <xsl:attribute-set name="linklist-concept">
    <xsl:attribute name="outputclass">relconcepts</xsl:attribute>
  </xsl:attribute-set>
  
  <!-- Wrapper for concept group: "Related concepts" in a <div>. -->
  <xsl:template match="*[contains(@class, ' topic/link ')][@type='concept']" mode="related-links:result-group"
          name="related-links:result.concept" as="element()">
    <xsl:param name="links" as="node()*"/>
    <xsl:if test="normalize-space(string-join($links, ''))">
      <linklist class="- topic/linklist " xsl:use-attribute-sets="linklist linklist-concept ">
        <xsl:if test="@ai-intent">
          <xsl:attribute name="ai-intent" select="@ai-intent"/>
        </xsl:if>
        <xsl:copy-of select="ancestor-or-self::*[@xml:lang][1]/@xml:lang"/>
        <title class="- topic/title ">
          <xsl:if test="@ai-intent">
            <xsl:attribute name="ai-intent" select="@ai-intent"/>
          </xsl:if>
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'Related concepts'"/>
          </xsl:call-template>
        </title>
        <xsl:copy-of select="$links"/>
      </linklist>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
