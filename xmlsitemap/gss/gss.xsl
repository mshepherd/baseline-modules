<?xml version="1.0" encoding="UTF-8"?>

<!-- Google Sitmaps Stylesheets (GSStylesheets)
     Project Home: http://sourceforge.net/projects/gstoolbox
     Copyright (c) 2005 Baccou Bonneville SARL (http://www.baccoubonneville.com)
     License http://www.gnu.org/copyleft/lesser.html GNU/LGPL -->

<xsl:stylesheet version="2.0"
    xmlns:html="http://www.w3.org/TR/REC-html40"
    xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="utf-8" indent="yes"/>
  <!-- Root template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Sitemap file</title>
        <script type="text/javascript" src="[xsl-js]"></script>
        <link href="[xsl-css]" type="text/css" rel="stylesheet"/>
      </head>

      <!-- Store in $fileType if we are in a sitemap or in a siteindex -->
      <xsl:variable name="fileType">
        <xsl:choose>
          <xsl:when test="//sitemap:url">sitemap</xsl:when>
          <xsl:otherwise>siteindex</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <!-- Body -->
      <body onLoad="initXsl('table0','{$fileType}');">

        <!-- Text and table -->
        <h1 id="head1">Sitemap file</h1>
          <xsl:choose>
        <xsl:when test="$fileType='sitemap'"><xsl:call-template name="sitemapTable"/></xsl:when>
        <xsl:otherwise><xsl:call-template name="siteindexTable"/></xsl:otherwise>
          </xsl:choose>
      </body>
    </html>
  </xsl:template>

  <!-- siteindexTable template -->
  <xsl:template name="siteindexTable">
    <h2>Number of sitemaps in this index: <xsl:value-of select="count(sitemap:sitemapindex/sitemap:sitemap)"></xsl:value-of></h2>
    <p class="sml">Click on the table headers to change sorting.</p>
    <table border="1" width="100%" class="data" id="table0">
      <tr class="header">
        <td>Sitemap URL</td>
        <td>Last modification date</td>
      </tr>
      <xsl:apply-templates select="sitemap:sitemapindex/sitemap:sitemap">
        <xsl:sort select="sitemap:lastmod" order="descending"/>
      </xsl:apply-templates>
    </table>
  </xsl:template>

  <!-- sitemapTable template -->
  <xsl:template name="sitemapTable">
    <h2>Number of URLs in this sitemap: <xsl:value-of select="count(sitemap:urlset/sitemap:url)"></xsl:value-of></h2>
    <p class="sml">Click on the table headers to change sorting.</p>
    <table border="1" width="100%" class="data" id="table0">
      <tr class="header">
        <td>URL location</td>
        <td>Last modification date</td>
        <td>Change frequency</td>
        <td>Priority</td>
      </tr>
      <xsl:apply-templates select="sitemap:urlset/sitemap:url">
        <xsl:sort select="sitemap:priority" order="descending"/>
      </xsl:apply-templates>
    </table>
  </xsl:template>

  <!-- sitemap:url template -->
  <xsl:template match="sitemap:url">
    <tr>
      <td>
        <xsl:variable name="sitemapURL"><xsl:value-of select="sitemap:loc"/></xsl:variable>
        <a href="{$sitemapURL}" target="_blank" ref="nofollow"><xsl:value-of select="$sitemapURL"></xsl:value-of></a>
      </td>
      <td><xsl:value-of select="sitemap:lastmod"/></td>
      <td><xsl:value-of select="sitemap:changefreq"/></td>
      <td><xsl:value-of select="sitemap:priority"/></td>
    </tr>
  </xsl:template>

  <!-- sitemap:sitemap template -->
  <xsl:template match="sitemap:sitemap">
    <tr>
      <td>
        <xsl:variable name="sitemapURL"><xsl:value-of select="sitemap:loc"/></xsl:variable>
        <a href="{$sitemapURL}"><xsl:value-of select="$sitemapURL"></xsl:value-of></a>
      </td>
      <td><xsl:value-of select="sitemap:lastmod"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
