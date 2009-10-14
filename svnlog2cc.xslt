<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/log">
		<xsl:text>FILENAME       COMMENT&#10;</xsl:text>
    <xsl:for-each select="logentry">
<xsl:for-each select="paths/path">
<xsl:text>.</xsl:text><xsl:value-of select="."/>    PR# CBS000003 <xsl:value-of select="../../msg"/><xsl:text>&#10;</xsl:text>
</xsl:for-each>
	  </xsl:for-each>
End log entry
	</xsl:template>
</xsl:stylesheet>