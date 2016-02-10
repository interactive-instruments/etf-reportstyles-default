<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>

	<!-- converts a date string from 2014-01-15T16:21:47.099+01:00 or 15.1.2014T16:21:47.099+01:00to 15.01.2014 16:21:47.099 +01:00 -->
	<xsl:template name="formatDate">
		<xsl:param name="DateTime"/>
		<!-- Based on John Workmans formatDate -->

		<!-- DATE -->
		<xsl:variable name="date" select="substring-before($DateTime, 'T')"/>

		<xsl:choose>
			<xsl:when test="contains($date, '-')">
				<!-- Format 2014-01-15 -->
				<xsl:variable name="year" select="substring($date, 1, 4)"/>
				<xsl:variable name="month-temp" select="substring-after($date, '-')"/>
				<xsl:variable name="month" select="substring-before($month-temp, '-')"/>
				<xsl:variable name="day-temp" select="substring-after($month-temp, '-')"/>
				<xsl:variable name="day" select="substring($day-temp, 1, 2)"/>
				<xsl:value-of select="$day"/>
				<xsl:value-of select="'.'"/>
				<xsl:value-of select="$month"/>
				<xsl:value-of select="'.'"/>
				<xsl:value-of select="$year"/>
			</xsl:when>
			<xsl:when test="contains($date, '.')">
				<!-- Format 15.1.2015 -->
				<xsl:variable name="day-temp" select="substring-after($date, '.')"/>
				<xsl:value-of select="substring-before($date, '.')"/>
				<xsl:value-of select="'.'"/>
				<xsl:variable name="month-temp" select="substring-after($date, '.')"/>
				<xsl:value-of select="substring-before($month-temp, '.')"/>
				<xsl:value-of select="'.'"/>
				<xsl:variable name="year-temp" select="substring-after($date, '.')"/>
				<xsl:value-of select="substring-before($year-temp, '.')"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- Unknown -->
				<xsl:value-of select="'00.00.0000'"/>
			</xsl:otherwise>
		</xsl:choose>

		<!-- TIME -->
		<xsl:variable name="time" select="substring-after($DateTime, 'T')"/>
		<xsl:variable name="hh" select="substring($time, 1, 2)"/>
		<xsl:variable name="mm" select="substring($time, 4, 2)"/>
		<xsl:variable name="ss" select="substring($time, 7, 2)"/>
		<xsl:variable name="ms" select="substring($time, 10, 3)"/>
		<xsl:variable name="tz" select="substring($time, 14, 5)"/>
		<xsl:value-of select="' '"/>
		<xsl:value-of select="$hh"/>
		<xsl:value-of select="':'"/>
		<xsl:value-of select="$mm"/>
		<xsl:value-of select="':'"/>
		<xsl:value-of select="$ss"/>
		<!-- FIXME: inconsistent output with leading zeros -->
		<!--xsl:value-of select="'.'"/>
		<xsl:value-of select="$ms"/>
		<xsl:value-of select="' +'"/>
		<xsl:value-of select="$tz"/-->
	</xsl:template>

	<!-- XSLT Cookbook, 2nd Edition -->
	<xsl:template name="substring-after-last">
		<xsl:param name="input"/>
		<xsl:param name="substr"/>

		<!-- Extract the string which comes after the first occurrence -->
		<xsl:variable name="temp" select="substring-after($input, $substr)"/>

		<xsl:choose>
			<!-- If it still contains the search string the recursively process -->
			<xsl:when test="$substr and contains($temp, $substr)">
				<xsl:call-template name="substring-after-last">
					<xsl:with-param name="input" select="$temp"/>
					<xsl:with-param name="substr" select="$substr"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$temp"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="string-replace">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="with" />
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of select="substring-before($text,$replace)" />
				<xsl:value-of select="$with" />
				<xsl:call-template name="string-replace">
					<xsl:with-param name="text" select="substring-after($text,$replace)" />
					<xsl:with-param name="replace" select="$replace" />
					<xsl:with-param name="with" select="$with" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
