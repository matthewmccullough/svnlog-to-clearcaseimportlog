<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="iso-8859-1"
                method="xml"
                omit-xml-declaration="yes"
                indent="no" />
  <xsl:template match="/log">
    <xsl:for-each select="logentry">
      <xsl:for-each select="paths/path">
        <xsl:text>.</xsl:text>
        <!-- File path -->
        <xsl:value-of select="."/>
        <!-- Column separator -->
        <xsl:text>     </xsl:text>

        <!-- Commit Message -->
        <xsl:call-template name="TrimCRLFs">
          <xsl:with-param name="InputString">
            <xsl:value-of select="../../msg"/>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  
  
  <xsl:template name="TrimCRLFs">
    <xsl:param name="InputString"/>
    <xsl:variable name="RemainingString" 
      select="substring-before($InputString,'&#10;')"/>
      <xsl:value-of select="$RemainingString"/>
  </xsl:template>
</xsl:stylesheet>