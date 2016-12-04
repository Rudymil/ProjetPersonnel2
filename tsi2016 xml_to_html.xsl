<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tsi2016="http://www.ensg.eu/tsi2016">
  <xsl:output method="html" encoding="UTF-8" indent="yes" /> 
  <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt; &#10;</xsl:text>
    <html>
    <xsl:call-template name="entete" />
      <body>
    
        <h2>TSI 2016</h2>

        <table border="1">
          <tr bgcolor="#9acd32">
            <th>Nom</th>
            <th>Prenom</th>
            <th>Fonction</th>
            <th>Employeur</th>
            <th>Service</th>
            <th>Lieu</th>
          </tr>

          <xsl:for-each select="tsi2016:tsi2016/tsi2016:Personne">
            <tr>
              <td><xsl:value-of select="@nom" /></td>
              <td><xsl:value-of select="@prenom" /></td>
              <td><xsl:value-of select="tsi2016:Fonction/@role" /></td>
              <td><xsl:value-of select="@employeur" /></td>
              <td><xsl:value-of select="@service" /></td>
              <td><xsl:value-of select="@lieu" /></td>
            </tr>
          </xsl:for-each>

        </table>

      <h2>Employeurs</h2>

      <table border="1">
          <tr bgcolor="#9acd32">
            <th>Nom</th>
            <th>Direction</th>
          </tr>

          <xsl:for-each select="tsi2016:tsi2016/tsi2016:Employeur">
            <tr>
              <td><xsl:value-of select="@nom" /></td>
              <td><xsl:value-of select="tsi2016:Direction/@nom" /></td>
            </tr>
          </xsl:for-each>

      </table>

      <h2>Lieux</h2>

      <table border="1">
          <tr bgcolor="#9acd32">
            <th>Nom</th>
            <th>Adresses</th>
          </tr>

          <xsl:for-each select="tsi2016:tsi2016/tsi2016:Lieu">
            <tr>
              <td><xsl:value-of select="@nom" /></td>
              <td><xsl:value-of select="tsi2016:Adresse/@no"/>&#160;<xsl:value-of select="tsi2016:Adresse/@rue" />&#160;<xsl:value-of select="tsi2016:Adresse/@codePostal" />&#160;<xsl:value-of select="tsi2016:Adresse/@ville" /></td>
              <td></td>
            </tr>
          </xsl:for-each>

      </table>
      </body>
      </html>
      <xsl:call-template name="fin" />
  </xsl:template>

  <!-- Template nommé : -->

  <xsl:template name="entete">

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </head>
         
  </xsl:template>


  <xsl:template name="fin">
    
  </xsl:template>

</xsl:stylesheet>