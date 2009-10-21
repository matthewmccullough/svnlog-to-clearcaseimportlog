<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="iso-8859-1"
                method="xml"
                omit-xml-declaration="yes"
                indent="no" />
  <xsl:template match="/log">
    <xsl:for-each select="logentry">
      <xsl:for-each select="paths/path">
        <!-- Put in a leading dot slash to match the ClearCase expected format -->
        <xsl:text>.&#47;</xsl:text>
        <!-- File path -->
        <xsl:call-template name="TrimToAfterFirstSlashPath">
          <xsl:with-param name="InputString">
            <xsl:call-template name="TrimToAfterFirstSlashPath">
              <xsl:with-param name="InputString">
                 <xsl:value-of select="."/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:with-param>
        </xsl:call-template>
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
  <xsl:template name="TrimToAfterFirstSlashPath">
    <xsl:param name="InputString"/>
    <xsl:variable name="RemainingString" 
      select="substring-after($InputString,'&#47;')"/>
      <xsl:value-of select="$RemainingString"/>
  </xsl:template>
</xsl:stylesheet>