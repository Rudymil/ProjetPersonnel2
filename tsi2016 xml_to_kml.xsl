<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:tsi2016="http://www.ensg.eu/tsi2016">
  
	<xsl:output method="kml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="/"> <!-- des qu on rencontre la racine -->
	
	<kml xmlns="http://www.opengis.net/kml/2.2"> <!-- prologue kml -->
	
		<Document> <!-- liste des placemark -->
			<xsl:for-each select="Personne"> <!-- pour chaque personne -->
			<Placemark> <!-- on place un marqueur -->
				<name> <!-- TITRE -->
					<xsl:value-of select="@prenom "/>
					<xsl:value-of select="@nom"/>
				</name>
				<description> <!-- DESCRIPTION -->
					<xsl:value-of select="role"/> à 
					<xsl:value-of select="@lieu"/> au 
					<xsl:value-of select="@service"/> par l'
					<xsl:value-of select="@employeur"/>
				</description>
				<Point>
					<coordinates> <!-- COORDONNEES -->
					<xsl:if test="@lieu= 'ENSG'"> <!-- si c est l ENSG -->
						<xsl:value-of select="Lieu[0]/Coordonnees/@Longitude"/>,
						<xsl:value-of select="Lieu[0]/Coordonnees/@Latitude"/>
					</xsl:if>
					<xsl:if test="@lieu= 'UPEM'"> <!-- si c est l UPEM -->
						<xsl:value-of select="Lieu[1]/Coordonnees/@Longitude"/>,
						<xsl:value-of select="Lieu[1]/Coordonnees/@Latitude"/>
					</xsl:if>
					</coordinates>
				</Point>
			</Placemark>
			</xsl:for-each>
			<xsl:for-each select="Employeur"> <!-- pour chaque employeur -->
			<Placemark> <!-- on place un marqueur -->
				<name> <!-- TITRE -->
					<xsl:value-of select="@nom"/>
				</name>
				<description> <!-- COORDONNEES -->
					<xsl:for-each select="Direction"> <!-- pour chaque direction -->
						<xsl:value-of select="@nom"/>
						<xsl:for-each select="Service"> <!-- pour chaque service -->
							<xsl:value-of select="@nom"/>
							<xsl:value-of select="@agents"/>
						</xsl:for-each>
					</xsl:for-each>
				</description>
				<Point>
					<coordinates> <!-- COORDONNEES -->
					<xsl:if test="@nom= 'ENSG'"> <!-- si c est l ENSG -->
						<xsl:value-of select="Lieu[0]/Coordonnees/@Longitude"/>,
						<xsl:value-of select="Lieu[0]/Coordonnees/@Latitude"/>
					</xsl:if>
					<xsl:if test="@nom= 'UPEM'"> <!-- si c est l UPEM -->
						<xsl:value-of select="Lieu[1]/Coordonnees/@Longitude"/>,
						<xsl:value-of select="Lieu[1]/Coordonnees/@Latitude"/>
					</xsl:if>
					</coordinates>
				</Point>
			</Placemark>
			</xsl:for-each>		
		</Document>
		
	</kml>
	
	</xsl:template>
  
</xsl:stylesheet>