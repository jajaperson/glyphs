<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="/tree">
  <html>
  <head>
    <title>Evolution of Writing Systems</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700" rel="stylesheet"/>

    <style>
      body {
        font-family: 'Lato', sans-serif;
      }
    </style>
  </head>
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
    <b><xsl:value-of select="./name"/></b>
    <xsl:choose>
      <xsl:when test="@dir = '^'">
        ↑
      </xsl:when>
      <xsl:when test="@dir = 'v'">
        ↓
      </xsl:when>
      <xsl:when test="@dir = '&lt;'">
        ←
      </xsl:when>
      <xsl:when test="@dir = '&gt;'">
        →
      </xsl:when>
      <xsl:otherwise>
        ⤴
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="@type"/><br/>
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
