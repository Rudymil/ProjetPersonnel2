<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:tsi2016="http://www.ensg.eu/tsi2016">

	<xsl:output method="kml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/"> <!-- des qu on rencontre la racine -->

		<kml xmlns="http://www.opengis.net/kml/2.2"> <!-- prologue kml -->
			<!-- styles -->
			<Style id="Personne">
				<IconStyle>
					<Icon>
						<href>http://maps.google.com/mapfiles/kml/pal2/icon14.png</href>
					</Icon>
				</IconStyle>
			</Style>
			<Style id="Lieu">
				<IconStyle>
					<Icon>
						<href>http://maps.google.com/mapfiles/kml/pal3/icon21.png</href>
					</Icon>
				</IconStyle>
			</Style>
			<Document> <!-- liste des placemark -->
				<xsl:for-each select="tsi2016:tsi2016/tsi2016:Personne"> <!-- pour chaque personne-->
					<Placemark> <!-- on place un marqueur -->
						<name> <!-- TITRE -->
							<xsl:value-of select="@prenom "/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="@nom"/>
						</name>
						<description> <!-- DESCRIPTION -->
							<xsl:value-of select="tsi2016:Fonction/@role"/>
							<xsl:text> à l'</xsl:text>
							<xsl:value-of select="@lieu"/>
							<xsl:text> au </xsl:text> 
							<xsl:value-of select="@service"/>
							<xsl:text> par l'</xsl:text>
							<xsl:value-of select="@employeur"/>
						</description>
						<styleUrl>#Personne</styleUrl> 
						<Point>
							<coordinates> <!-- COORDONNEES -->
								<xsl:if test="@employeur= 'ENSG'"> <!-- si c est l ENSG -->
									<xsl:value-of select="../tsi2016:Lieu[1]/tsi2016:Coordonnees/@Longitude"/>
									<xsl:text>,</xsl:text>
									<xsl:value-of select="../tsi2016:Lieu[1]/tsi2016:Coordonnees/@Latitude"/>
								</xsl:if>
								<xsl:if test="@employeur= 'UPEM'"> <!-- si c est l UPEM -->
									<xsl:value-of select="../tsi2016:Lieu[2]/tsi2016:Coordonnees/@Longitude"/>
									<xsl:text>,</xsl:text>
									<xsl:value-of select="../tsi2016:Lieu[2]/tsi2016:Coordonnees/@Latitude"/>
								</xsl:if>
							</coordinates>
						</Point>
					</Placemark>
				</xsl:for-each>
				<xsl:for-each select="tsi2016:tsi2016/tsi2016:Employeur"> <!-- pour chaque employeur -->
					<Placemark> <!-- on place un marqueur -->
						<name> <!-- TITRE -->
							<xsl:value-of select="@nom"/>
						</name>
						<description> <!-- COORDONNEES -->
							<xsl:if test="@nom= 'ENSG'"> <!-- si c est l ENSG -->
								<xsl:text>Adresse :</xsl:text>
								<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
								<xsl:value-of select="../tsi2016:Lieu[1]/tsi2016:Adresse/@no"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="../tsi2016:Lieu[1]/tsi2016:Adresse/@rue"/>
								<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
								<xsl:value-of select="../tsi2016:Lieu[1]/tsi2016:Adresse/@codePostal"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="../tsi2016:Lieu[1]/tsi2016:Adresse/@ville"/>
								<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
							</xsl:if>
							<xsl:if test="@nom= 'UPEM'"> <!-- si c est l UPEM -->
								<xsl:text>Adresse :</xsl:text>
								<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
								<xsl:value-of select="../tsi2016:Lieu[2]/tsi2016:Adresse/@no"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="../tsi2016:Lieu[2]/tsi2016:Adresse/@rue"/>
								<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
								<xsl:value-of select="../tsi2016:Lieu[2]/tsi2016:Adresse/@codePostal"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="../tsi2016:Lieu[2]/tsi2016:Adresse/@ville"/>
								<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
							</xsl:if>
							<xsl:for-each select="tsi2016:Direction"> <!-- pour chaque direction -->     
								<xsl:text>-Direction :</xsl:text>
								<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
								<xsl:value-of select="@nom"/>
								<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
								<xsl:for-each select="tsi2016:Service"> <!-- pour chaque service -->
									<xsl:text>--Service :</xsl:text>
									<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
									<xsl:value-of select="@nom"/>
									<xsl:text> contient </xsl:text> 
									<xsl:value-of select="@agents"/>
									<xsl:text> agents. </xsl:text>
									<xsl:text>&#xA;<!-- retour chariot --></xsl:text>
								</xsl:for-each>
							</xsl:for-each>
						</description>
						<styleUrl>#Lieu</styleUrl> 
						<Point>
							<coordinates> <!-- COORDONNEES -->
								<xsl:if test="@nom= 'ENSG'"> <!-- si c est l ENSG -->
									<xsl:value-of select="../tsi2016:Lieu[1]/tsi2016:Coordonnees/@Longitude"/>
									<xsl:text>,</xsl:text>
									<xsl:value-of select="../tsi2016:Lieu[1]/tsi2016:Coordonnees/@Latitude"/>
								</xsl:if>
								<xsl:if test="@nom= 'UPEM'"> <!-- si c est l UPEM -->
									<xsl:value-of select="../tsi2016:Lieu[2]/tsi2016:Coordonnees/@Longitude"/>
									<xsl:text>,</xsl:text>
									<xsl:value-of select="../tsi2016:Lieu[2]/tsi2016:Coordonnees/@Latitude"/>
								</xsl:if>
							</coordinates>
						</Point>
					</Placemark>
				</xsl:for-each>
			</Document>
		</kml>

	</xsl:template>

</xsl:stylesheet>