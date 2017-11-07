<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/tree">
  <html>
  <body>
    <h1>Evolution of Writing Systems</h1>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </body>
  </html>
</xsl:template>

<xsl:template match="ws">
  <li>
    <b><xsl:value-of select="./name"/></b> → <xsl:value-of select="@type"/><br/>
    <xsl:apply-templates select="unicode"/>
    <xsl:apply-templates select="./children"/>
  </li>
</xsl:template>

<xsl:template match="children">
  <ul>
    <xsl:apply-templates match="./ws"/>
  </ul>
</xsl:template>

<xsl:template match="unicode">
  <a href="http://www.unicode.org/charts/PDF/U{./from}.pdf">
    <i>U+<xsl:value-of select="./from"/> - U+<xsl:value-of select="./to"/></i>
  </a>
</xsl:template>

</xsl:stylesheet>
