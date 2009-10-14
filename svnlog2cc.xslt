<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="iso-8859-1"
	              method="xml"
	              omit-xml-declaration="yes"
	              indent="no" />
	<xsl:template match="/log">
		<xsl:text>FILENAME       COMMENT&#10;</xsl:text>
    <xsl:for-each select="logentry">
<xsl:for-each select="paths/path">
<xsl:text>.</xsl:text><xsl:value-of select="."/>
<xsl:text>     </xsl:text>
<xsl:value-of select="../../msg"/><xsl:text>&#10;</xsl:text>
</xsl:for-each>
	  </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>