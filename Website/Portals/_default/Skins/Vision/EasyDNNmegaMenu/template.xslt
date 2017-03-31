<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="ControlID" />
	<xsl:param name="Options" />
	<xsl:template match="/*">
		<xsl:apply-templates select="root" />
	</xsl:template>
	<xsl:template match="root">
		<ol>
			<xsl:apply-templates select="node">
				<xsl:with-param name="level" select="0" />
				<xsl:with-param name="megaMenuColumns" select="0" />
			</xsl:apply-templates>
		</ol>
	</xsl:template>
	<xsl:template match="node">
		<xsl:param name="level" />
		<xsl:param name="megaMenuColumns" />
		<xsl:if test="not($megaMenuColumns = 0) and not(position() = 1) and position() mod $megaMenuColumns = 1">
			<xsl:text disable-output-escaping="yes"><![CDATA[</ol><ol>]]></xsl:text>
		</xsl:if>
		<li>
			<xsl:attribute name="class">
				<xsl:text>edsmm_menuItem</xsl:text>
				<xsl:if test="@first = 1">
					<xsl:text> edsmm_first</xsl:text>
				</xsl:if>
				<xsl:if test="@last = 1">
					<xsl:text> edsmm_last</xsl:text>
				</xsl:if>
				<xsl:if test="node">
					<xsl:text> edsmm_hasChild</xsl:text>
				</xsl:if>
				<xsl:if test="@breadcrumb = 1">
					<xsl:text> edsmm_active</xsl:text>
				</xsl:if>
				<xsl:if test="@enabled != 1">
					<xsl:text> edsmm_disabled</xsl:text>
				</xsl:if>
				<xsl:if test="@id = 73 and $level = 0">
					<xsl:text> edsmm_megaMenu edsmm_multiColumn edsmm_2Column edsmm_htmlContentLeft</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<span>
				<xsl:choose>
					<xsl:when test="@enabled = 1">
						<a class="edsmm_itemContainer">
							<xsl:attribute name="href">
								<xsl:value-of select="@url"/>
							</xsl:attribute>
							<xsl:value-of select="@text" />
						</a>
					</xsl:when>
					<xsl:otherwise>
						<span class="edsmm_itemContainer">
							<xsl:value-of select="@text" />
						</span>
					</xsl:otherwise>
				</xsl:choose>
				<span class="edsmm_childIndicator"></span>
			</span>
			<xsl:if test="node or ($level = 0 and (@id = 73))">
				<div>
					<xsl:attribute name="class">
						<xsl:text>edsmm_level_</xsl:text>
						<xsl:value-of select="$level + 1"/>
					</xsl:attribute>
					<xsl:if test="@id = 73 and $level = 0">
						<div class="edsmm_htmlContainer edsmm_leftContainer">
							<xsl:text disable-output-escaping="yes">
								<![CDATA[<div class="megaVisit">
<p>Garden Access</p>

<ul>
 <li>Garden Hours:
 <ul>
  <li>Spring, Summer, Fall: <strong>8am - 8pm</strong></li>
  <li>Winter: <strong>8am - 6pm</strong></li>
 </ul>
 </li>
 <li>Garden access is always <strong>$FREE</strong></li>
</ul>

<p>Parking:</p>

<ul>
 <li>Parking Fee:
 <ul>
  <li>Saturdays, Sundays &amp; Holidays Memorial Day To Labor Day : <strong>$5</strong> (NJ registered vehicles),&nbsp; $7 (non NJ vehicles)</li>
  <li>All other times parking is Free</li>
 </ul>
 </li>
 <li>Parking Lots:
 <ul>
  <li>Parking Lot A - &nbsp;most convenient to the Carriage House Visitor Center, the Concert Lawn and the Manor House.</li>
  <li>Parking Lot B - provides easy access to the Lilac Garden, the Great Lawn, the Peony Garden, and the Azalea Garden.</li>
  <li>Parking Lot C - for hikers and mountain bikers with direct access to trails</li>
 </ul>
 </li>
 <li>Grounds Accessibility:
 <ul>
  <li>Primary Roads - paved and fully accessible to all</li>
  <li>Carriage House / Visitor Center - handicapped accessible, as is the ground floor of the Manor House</li>
  <li>Specialty Gardens - set within lawns, and are accessible to most sturdy wheelchairs</li>
  <li>Courtyard - surfaced in pea gravel, lawns uneven and rocky</li>
  <li>Trails &amp; Paths - cover varied terrain and are often uneven and rocky</li>
 </ul>
 </li>
 <li>Parking Accessibility:
 <ul>
  <li>Paarking Lot A - Handicapped parking provides easy, paved access to the main road loops</li>
  <li>Parking Lot B &amp; C - Handicapped parking is also available but these lots are not paved.</li>
 </ul>
 </li>
</ul>
</div>
]]>
							</xsl:text>
						</div>
					</xsl:if>
					<xsl:if test="node">
						<div class="edsmm_menuListsContainer">
							<ol>
							<xsl:choose>
								<xsl:when test="@id = 73 and $level = 0">
									<xsl:apply-templates select="node">
										<xsl:with-param name="level" select="$level + 1" />
										<xsl:with-param name="megaMenuColumns" select="1" />
									</xsl:apply-templates>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="node">
										<xsl:with-param name="level" select="$level + 1" />
										<xsl:with-param name="megaMenuColumns" select="0" />
									</xsl:apply-templates>
								</xsl:otherwise>
							</xsl:choose>
							</ol>
						</div>
					</xsl:if>
				</div>
			</xsl:if>
		</li>
	</xsl:template>
</xsl:stylesheet>