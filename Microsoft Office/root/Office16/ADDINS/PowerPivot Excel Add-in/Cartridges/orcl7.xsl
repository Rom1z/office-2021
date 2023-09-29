<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0" xmlns:mssqlcrt="urn:sql-microsoft-com:sqlcrt" xmlns:mssqldbg="urn:sql-microsoft-com:sqldbg">
<xsl:output method="xml" indent="yes"/>

<!-- This ALWAYS GENERATED file contains the definitions for the cartridges
Microsoft Cartridge Interfaces (Analysis Services 2005)
(C) Copyright 1988 - 2003 By Microsoft Corporation.      -->


<!-- Area of Custom parametrizations: these may be modified by customers for specific query customizations  -->
<!-- post-select-query-hint will append the customer-defined string at the end of the generated SELECT statement - e.g. WITH UR -->
<xsl:param name="post-select-query-hint"></xsl:param>


<!-- Oracle 7 pluggable cartridge -->

<!-- Area of STANDARD parametrizations: these are externally passed   -->
<xsl:param name="in_CanUseParams">yes</xsl:param>
<xsl:param name="in_IdentStartQuotingCharacter">"</xsl:param>
<xsl:param name="in_IdentEndQuotingCharacter">"</xsl:param>
<xsl:param name="in_StringStartQuotingCharacter">'</xsl:param>
<xsl:param name="in_StringEndQuotingCharacter">'</xsl:param>
<xsl:param name="in_DateValueFormat">TO_DATE('{0:yyyy-MM-dd HH':'mm':'ss}', 'YYYY-MM-DD HH24:Mi:SS')</xsl:param>

<!-- Area of CORE parametrizations: These are externally checked      -->
<mssqlcrt:provider type="prefix" managed="yes" native="yes">Oracle</mssqlcrt:provider>
<mssqlcrt:parameter-style native="unnamed" managed="named"/>
<mssqlcrt:dq-datetime-format>YYYY-MM-DD HH:MM:SS</mssqlcrt:dq-datetime-format>

<mssqlcrt:capabilities>
<mssqlcrt:supports-datepart-year/>
<mssqlcrt:supports-datepart-quarter/>
<mssqlcrt:supports-datepart-month/>
<mssqlcrt:supports-datepart-dayofyear/>
<mssqlcrt:supports-datepart-day/>
<mssqlcrt:supports-datepart-week/>
<mssqlcrt:supports-datepart-dayofweek/>
<mssqlcrt:supports-datepart-hour/>
<mssqlcrt:supports-datepart-minute/>
<mssqlcrt:supports-datepart-second/>
<mssqlcrt:supports-datepart-millisecond/>
<mssqlcrt:supports-multiple-distinct-count/>
<mssqlcrt:supports-update/>
<mssqlcrt:supports-insert/>
<mssqlcrt:supports-subselect/>
<mssqlcrt:supports-table-alias/>
<mssqlcrt:supports-column-alias/>
<mssqlcrt:supports-cast/>
<mssqlcrt:supports-union/>
<mssqlcrt:supports-union-all/>
<mssqlcrt:supports-remote-query/>
<mssqlcrt:supports-real-time/>
<mssqlcrt:supports-joins/>
<mssqlcrt:supports-distinct-count/>
<mssqlcrt:supports-params/>
<mssqlcrt:limit-params-support>OLEDB</mssqlcrt:limit-params-support>
<mssqlcrt:supports-materialized-view>2</mssqlcrt:supports-materialized-view>
<mssqlcrt:limit-materialized-view-column-count>255</mssqlcrt:limit-materialized-view-column-count>
<mssqlcrt:supports-weeknum-return-type>21</mssqlcrt:supports-weeknum-return-type>
<mssqlcrt:pattern-search-expression-type>POSIX</mssqlcrt:pattern-search-expression-type>
<mssqlcrt:limit-table-identifier-length>30</mssqlcrt:limit-table-identifier-length>
<mssqlcrt:limit-column-identifier-length>30</mssqlcrt:limit-column-identifier-length>

<!-- The real limit for number of params passed to Oracle is 64K (http://docs.oracle.com/cd/B10501_01/appdev.920/a96624/e_limits.htm#LNPLS018) But limiting to 2100 to avoid very long queries.-->
<mssqlcrt:limit-parameter-count>2100</mssqlcrt:limit-parameter-count>
<mssqlcrt:limit-in-operator-list-size>1000</mssqlcrt:limit-in-operator-list-size>

<!-- Don't use provider-string format, instead split into DataSource, Username, Password -->
<mssqlcrt:remote-connection-string-translation-behavior>2</mssqlcrt:remote-connection-string-translation-behavior>

<!-- Map from MSDAInitialize connection string to components -->
<mssqlcrt:remote-connection-string-mappings>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>Provider</mssqlcrt:datasource-property>
<mssqlcrt:remote-property></mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>DataSource</mssqlcrt:datasource-property>
<mssqlcrt:remote-property>Data Source</mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>UserName</mssqlcrt:datasource-property>
<mssqlcrt:remote-property>User ID</mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>Password</mssqlcrt:datasource-property>
<mssqlcrt:remote-property>Password</mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
</mssqlcrt:remote-connection-string-mappings>
</mssqlcrt:capabilities>

<mssqlcrt:schema-classes>
<mssqlcrt:schema-class>
<mssqlcrt:managed-provider>System.Data.OracleClient</mssqlcrt:managed-provider>
<mssqlcrt:type>Microsoft.DataWarehouse.Design.OracleSchema, Microsoft.DataWarehouse</mssqlcrt:type>
<mssqlcrt:query-designer>
<mssqlcrt:type>Microsoft.DataWarehouse.Controls.OracleQueryDesigner, Microsoft.DataWarehouse</mssqlcrt:type>
</mssqlcrt:query-designer>
</mssqlcrt:schema-class>
<mssqlcrt:schema-class>
<mssqlcrt:managed-provider>System.Data.OleDb</mssqlcrt:managed-provider>
<mssqlcrt:type>Microsoft.DataWarehouse.Design.OleDbSchema, Microsoft.DataWarehouse</mssqlcrt:type>
<mssqlcrt:query-designer>
<mssqlcrt:type>Microsoft.DataWarehouse.Controls.OleDbQueryDesigner, Microsoft.DataWarehouse</mssqlcrt:type>
</mssqlcrt:query-designer>
</mssqlcrt:schema-class>
<mssqlcrt:schema-class>
<mssqlcrt:managed-provider>System.Data.Odbc</mssqlcrt:managed-provider>
<mssqlcrt:type>Microsoft.DataWarehouse.Design.OdbcSchema, Microsoft.DataWarehouse</mssqlcrt:type>
</mssqlcrt:schema-class>
</mssqlcrt:schema-classes>
<mssqlcrt:capabilities>
<!-- MATH/TRIG Functions -->
<mssqlcrt:supports-func>ABS</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ACOS</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ACOT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ASIN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ATAN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>CEILING</mssqlcrt:supports-func>
<mssqlcrt:supports-func>COS</mssqlcrt:supports-func>
<mssqlcrt:supports-func>COSH</mssqlcrt:supports-func>
<mssqlcrt:supports-func>COT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>CURRENCY</mssqlcrt:supports-func>
<mssqlcrt:supports-func>DEGREES</mssqlcrt:supports-func>
<mssqlcrt:supports-func>DIVIDE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>EXP</mssqlcrt:supports-func>
<mssqlcrt:supports-func>INT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ISO.CEILING</mssqlcrt:supports-func>
<mssqlcrt:supports-func>LN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>LOG</mssqlcrt:supports-func>
<mssqlcrt:supports-func>LOG10</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MAX</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MIN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MOD</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MROUND</mssqlcrt:supports-func>
<mssqlcrt:supports-func>POWER</mssqlcrt:supports-func>
<mssqlcrt:supports-func>QUOTIENT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>RADIANS</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ROUND</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ROUNDDOWN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ROUNDUP</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SIGN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SIN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SINH</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SQRT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SQRTPI</mssqlcrt:supports-func>
<mssqlcrt:supports-func>TAN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>TRUNC</mssqlcrt:supports-func>

<!-- INFO Functions -->
<mssqlcrt:supports-func>CONTAINSROW</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ISBLANK</mssqlcrt:supports-func>

<!-- LOGICAL Functions -->
<mssqlcrt:supports-func>IF</mssqlcrt:supports-func>
<mssqlcrt:supports-func>NOT</mssqlcrt:supports-func>

<!-- DATETIME Functions -->
<mssqlcrt:supports-func>DATE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>DAY</mssqlcrt:supports-func>
<mssqlcrt:supports-func>EDATE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>EOMONTH</mssqlcrt:supports-func>
<mssqlcrt:supports-func>HOUR</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MINUTE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MONTH</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SECOND</mssqlcrt:supports-func>
<mssqlcrt:supports-func>TIME</mssqlcrt:supports-func>
<mssqlcrt:supports-func>WEEKDAY</mssqlcrt:supports-func>
<mssqlcrt:supports-func>WEEKNUM</mssqlcrt:supports-func>
<mssqlcrt:supports-func>YEAR</mssqlcrt:supports-func>

<!-- String Functions -->
<mssqlcrt:supports-func>CONCATENATE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>DATEVALUE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>FIND</mssqlcrt:supports-func>
<mssqlcrt:supports-func>LEFT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>LEN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>LOWER</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MID</mssqlcrt:supports-func>
<mssqlcrt:supports-func>RIGHT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SEARCH</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SUBSTITUTE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>TIMEVALUE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>TRIM</mssqlcrt:supports-func>
<mssqlcrt:supports-func>UNICODE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>UPPER</mssqlcrt:supports-func>
<mssqlcrt:supports-func>VALUE</mssqlcrt:supports-func>

<!-- Filter Functions -->
<mssqlcrt:supports-func>KEEPFILTERS</mssqlcrt:supports-func>
<mssqlcrt:supports-func>RELATED</mssqlcrt:supports-func>
<mssqlcrt:supports-func>USERELATIONSHIP</mssqlcrt:supports-func>

</mssqlcrt:capabilities>

<!-- Area of internal parametrizations                                -->
<!-- overrideOfUseParams:
yes      = use always parametric queries
no       = never use parametric queries
nosubsel = use as yes, but not on subselects
auto     = use the value of in_CanUseParams to determine     -->
<xsl:variable name="overrideOfUseParams">auto</xsl:variable>
<!-- shouldProduceDebug:
yes      = produce debug information
no       = do not produce debug information                  -->
<xsl:variable name="shouldProduceDebug">yes</xsl:variable>

<!-- Area of global variables initializations                         -->
<xsl:variable name="UseParams">
<xsl:choose>
<xsl:when test="normalize-space($overrideOfUseParams) = 'yes' or (normalize-space($overrideOfUseParams) = 'auto' and normalize-space($in_CanUseParams)='yes')">yes</xsl:when>
<xsl:when test="normalize-space($overrideOfUseParams) = 'nosubsel'">nosubsel</xsl:when>
<xsl:otherwise>no</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="ProduceDebug" select="$shouldProduceDebug"/>
<xsl:variable name="IdentifierStartQuotingCharacter" select="normalize-space($in_IdentStartQuotingCharacter)"/>
<xsl:variable name="IdentifierEndQuotingCharacter" select="normalize-space($in_IdentEndQuotingCharacter)"/>
<xsl:variable name="StringStartQuotingCharacter" select="normalize-space($in_StringStartQuotingCharacter)"/>
<xsl:variable name="StringEndQuotingCharacter" select="normalize-space($in_StringEndQuotingCharacter)"/>
<mssqlcrt:sourceprovidertypename>
<supportedtypes>
<!-- TODO: what about extra types in PL/SQL? -->
<varchar2>STR</varchar2>
<nvarchar2>STR</nvarchar2>
<long>STR</long>
<number>R8</number>
<decimal>R8</decimal> <!-- Most numeric types are mapped to DECIMAL(p, s), including INTEGER -->
<binary_float>R8</binary_float>
<binary_double>R8</binary_double>
<double>R8</double> <!-- FLOAT(4) -->
<int16>R8</int16> <!-- NUMERIC(4) -->
<date>DATE</date>
<timestamp>DATE</timestamp>
<timestamptz>DATE</timestamptz>
<timestampltz>DATE</timestampltz>
<intervalym/>
<intervalds/>
<raw/>
<longraw/>
<rowid/>
<urowid/>
<char>STR</char>
<nchar>STR</nchar>
<clob/>
<ncolb/>
<blob/>
<bfile/>
</supportedtypes>
<unicode>
<nchar/>
<nvarchar2/>
</unicode>
<leaf_cast>
<clob>nvarchar2(2000)</clob>
<nclob>nvarchar2(max)</nclob>
</leaf_cast>
<fixed_length_string_types>
<char/>
<nchar/>
</fixed_length_string_types>

<!--
Tabular Model canonical types
VT_I8	= 20(Integer),
VT_BOOL	= 11(Boolean),
VT_BSTR	= 8(String),
VT_DATE	= 7(DateTime),
VT_CY	= 6(SmallDecimal),
VT_R8	= 5(Double)
-->
</mssqlcrt:sourceprovidertypename>

<!-- Generated statement packaging                                    -->
<xsl:template match="/">
<xsl:element name="Statement">

<!-- Generate query                                           -->
<xsl:element name="Text">
<xsl:apply-templates select="./Statement/*[1]"/>
</xsl:element>

<!-- Generate parameters                                      -->
<xsl:if test="(/Statement[not(@DQInlineParams)]) and count(./Statement/Parameters/Parameter)!=0 and ((normalize-space($UseParams)='yes') or (normalize-space($UseParams)='nosubsel'))">
<xsl:element name="Parameters">
<xsl:choose>
<xsl:when test="/Statement/*[1]//Parameter/@ParamName">
<xsl:for-each select="./Statement/Parameters/Parameter">
<xsl:element name="Parameter">
<xsl:attribute name="ref">
<xsl:value-of select="./@id"/>
</xsl:attribute>
</xsl:element>
</xsl:for-each>
</xsl:when>
<xsl:otherwise>
<xsl:for-each select="./Statement/*[1]//Parameter">
<xsl:element name="Parameter">
<xsl:attribute name="ref">
<xsl:value-of select="./@ref"/>
</xsl:attribute>
</xsl:element>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:if>

<!-- Generate debug info                                      -->
<xsl:if test="$ProduceDebug='yes'">
<xsl:element name="mssqldbg:DebugInfo">
<xsl:element name="mssqldbg:GenerateParametricInfo">
<xsl:attribute name="mssqldbg:Value">
<xsl:value-of select="$UseParams"/>
</xsl:attribute>
<xsl:element name="mssqldbg:External">
<xsl:value-of select="$in_CanUseParams"/>
</xsl:element>
<xsl:element name="mssqldbg:Internal">
<xsl:value-of select="$overrideOfUseParams"/>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:if>

</xsl:element>
</xsl:template>

<!-- Union statement                                                  -->
<xsl:template match="Union">
<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert'">
(
</xsl:if>
<xsl:call-template name="print-children-list">
<xsl:with-param name="operator" select="' UNION '"/>
</xsl:call-template>
<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert'">
)
</xsl:if>
</xsl:template>

<!-- Union All statement                                                  -->
<xsl:template match="UnionAll">
<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert'">
(
</xsl:if>
<xsl:call-template name="print-children-list">
<xsl:with-param name="operator" select="' UNION ALL '"/>
</xsl:call-template>
<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert'">
)
</xsl:if>
</xsl:template>
<!-- Rownums are 1 based. -->
<!-- Top clause -->
<xsl:template name="Top">
<xsl:param name="SelectExpr" select="'DEFAULT_VALUE'"/>
<xsl:param name="TopExpr" select="./Top/*[1]"/>
SELECT * FROM (<xsl:value-of select="$SelectExpr" />) WHERE ROWNUM &lt;= <xsl:apply-templates select="$TopExpr"/>
</xsl:template>

<!-- Select statement                                                 -->
<xsl:template match="Select">
<xsl:variable name="SelectStmt">
SELECT
<xsl:apply-templates select="./Distinct"/>
<xsl:apply-templates select="./ColumnExpressions"/>
<xsl:apply-templates select="./Sources"/>
<xsl:apply-templates select="./Where"/>
<xsl:apply-templates select="./GroupBy"/>
<xsl:apply-templates select="./OrderBy"/>
<xsl:if test="name(..) = 'Statement'">
<xsl:text> </xsl:text>
<xsl:value-of select="$post-select-query-hint"/>
</xsl:if>
</xsl:variable>

<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert' and name(..) != 'Union' and name(..) != 'UnionAll'">
(
</xsl:if>

<xsl:choose>
<xsl:when test="count(child::Top) != 0">
<xsl:call-template name="Top">
<xsl:with-param name="SelectExpr" select="$SelectStmt"/>
<xsl:with-param name="TopExpr" select="./Top/*[1]"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$SelectStmt"/>
</xsl:otherwise>
</xsl:choose>

<!--<xsl:apply-templates select="./Top"/>-->

<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert' and name(..) != 'Union' and name(..) != 'UnionAll'">
)
</xsl:if>
</xsl:template>

<!-- Singleton clause                                                       -->
<xsl:template match="Singleton">
(SELECT <xsl:apply-templates select="./ColumnExpressions"/>
FROM DUAL
<xsl:text>
) </xsl:text>
</xsl:template>

<!-- Update statement                                                 -->
<xsl:template match="Update">
UPDATE <xsl:apply-templates select="./Target"/>
<xsl:apply-templates select="./Where"/>
</xsl:template>

<!-- Insert statement                                                 -->
<xsl:template match="Insert">
INSERT INTO <xsl:apply-templates select="./Target"/>
<xsl:apply-templates select="./Select"/>
<xsl:apply-templates select="./RowValues"/>
</xsl:template>

<xsl:template match="RowValues">
VALUES <xsl:call-template name="print-children-list"/>
</xsl:template>

<xsl:template match="RowValue">
(<xsl:call-template name="print-children-list"/>)
</xsl:template>

<!-- Delete statement                                                 -->
<xsl:template match="Delete">
DELETE FROM <xsl:apply-templates select="./Target"/>
<xsl:apply-templates select="./Where"/>
</xsl:template>

<!-- Drop statement                                                   -->
<xsl:template match="Drop">
<xsl:choose>
<xsl:when test="count(./Phase) = 0">
DROP <xsl:apply-templates select="./*"/>
</xsl:when>
<xsl:otherwise>
DROP MATERIALIZED <xsl:apply-templates select="./*"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- Create statement                                                 -->
<xsl:template match="Create">
CREATE
<xsl:variable name="phase"><xsl:value-of select="./Phase"/></xsl:variable>
<xsl:choose>
<xsl:when test="number($phase)=1">
MATERIALIZED VIEW <xsl:apply-templates select="./View"/> REFRESH ON COMMIT AS <xsl:apply-templates select="./*[5]"/>
</xsl:when>
<xsl:when test="number($phase)=2">
UNIQUE INDEX <xsl:apply-templates select="./Index"/> ON <xsl:apply-templates select="./View"/> ( <xsl:apply-templates select="./*[4]"/> )
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
<xsl:choose>
<xsl:when test="name(./*[1]) = 'Table'">( <xsl:apply-templates select="./*[2]"/> )</xsl:when>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="Distinct">
DISTINCT
</xsl:template>

<xsl:template match="As">
<xsl:apply-templates select="./*[1]"/><xsl:text> </xsl:text><xsl:apply-templates select="./*[2]"/>
</xsl:template>
<xsl:template match="Sources">
FROM <xsl:choose>
<xsl:when test="count(./Join) != 0 or count(./CrossJoin)!= 0">
<xsl:apply-templates select="./Join"/>
<xsl:apply-templates select="./CrossJoin"/>
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="print-children-list"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="Join">
(<xsl:apply-templates select="./*[2]"/><xsl:call-template name="JoinType"/> <xsl:apply-templates select="./*[3]"/> on <xsl:apply-templates select="./On/*"/>)
</xsl:template>

<xsl:template name="JoinType">
<xsl:text>&#10;&#13;</xsl:text>
<xsl:variable name="value-node">
<xsl:value-of select="normalize-space(./JoinType/text())"/>
</xsl:variable>
<xsl:choose>
<xsl:when test="$value-node = 'LeftOuterJoin'" > left outer join </xsl:when>
<xsl:when test="$value-node = 'RightOuterJoin'"> right outer join </xsl:when>
<xsl:when test="$value-node = 'FullOuterJoin'" > full outer join </xsl:when>
<xsl:when test="$value-node = 'InnerJoin'"     > inner join </xsl:when>
</xsl:choose>
<xsl:text>&#10;&#13;</xsl:text>
</xsl:template>

<xsl:template match="CrossJoin">
<xsl:text>&#10;&#13;</xsl:text>
<xsl:apply-templates select="./*[1]"/> cross join <xsl:apply-templates select="./*[2]"/>
<xsl:text>&#10;&#13;</xsl:text>
</xsl:template>

<xsl:template match="ColumnDefinitions">
<xsl:call-template name="print-children-list"/>
</xsl:template>

<xsl:template match="GroupBy">
GROUP BY <xsl:call-template name="print-children-list"/>
</xsl:template>

<xsl:template match="OrderBy">
ORDER BY <xsl:call-template name="print-children-list"/>
</xsl:template>

<xsl:template match="Where">
WHERE <xsl:apply-templates select="./*"/>
</xsl:template>

<xsl:template match="Having">
HAVING <xsl:apply-templates select="./*"/>
</xsl:template>

<xsl:template match="ColumnExpressions">
<xsl:call-template name="print-children-list"/>
</xsl:template>

<xsl:template match="ColumnUpdates">
<xsl:call-template name="print-children-list"/>
</xsl:template>

<xsl:template match="Assign">
<xsl:apply-templates select="./*[1]"/>=<xsl:apply-templates select="./*[2]"/>
</xsl:template>

<xsl:template match="Insert/Target">
<xsl:apply-templates select="./Table"/>
(
<xsl:call-template name="print-list">
<xsl:with-param name="value-node" select="./ColumnUpdates/*/*[1]"/>
</xsl:call-template>
)
<xsl:if test="./*[2]/Assign">
VALUES
(
<xsl:call-template name="print-list">
<xsl:with-param name="value-node" select="./ColumnUpdates/*/*[2]"/>
</xsl:call-template>
)
</xsl:if>
</xsl:template>

<xsl:template match="Update/Target">
<xsl:apply-templates select="./Table"/>
SET <xsl:apply-templates select="./ColumnUpdates"/>
</xsl:template>

<xsl:template match="Delete/Target">
<xsl:apply-templates select="./Table"/>
</xsl:template>

<xsl:template match="Insert/Target/ColumnUpdates/Assign/SQLColumn[1]">
<!-- The table name is not printed for LHS of assignments in insert -->
<xsl:apply-templates select="./Column"/>
</xsl:template>

<xsl:template match="Create/ColumnDefinitions/SQLColumn">
<xsl:apply-templates select="./Column"/>
<xsl:if test="count(../../Phase) = 0">
<xsl:apply-templates select="./Type"/>
<xsl:apply-templates select="./Usage"/>
</xsl:if>
</xsl:template>

<xsl:template match="SQLColumn">
<xsl:variable name="table">
<xsl:if test="name(..)!='Count' or name(./Column/*[1]) != 'Asterisk'"><xsl:apply-templates select="./Table"/></xsl:if>
</xsl:variable>
<xsl:variable name="column">
<xsl:apply-templates select="./Column"/>
</xsl:variable>
<xsl:choose>
<xsl:when test="$table = ''">
<xsl:value-of select="$column"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat($table,'.', $column)"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="Create/Database|Drop/Database">
DATABASE <xsl:apply-templates select="./Name"/>
</xsl:template>

<xsl:template match="Table">
<xsl:call-template name="build-quoted-schema-object"/>
</xsl:template>

<xsl:template match="Create/Table|Drop/Table">
TABLE <xsl:call-template name="build-quoted-schema-object"/>
</xsl:template>

<xsl:template match="View">
<xsl:call-template name="build-quoted-schema-object"/>
</xsl:template>

<xsl:template match="Drop/View">
VIEW <xsl:call-template name="build-quoted-schema-object"/>
</xsl:template>

<xsl:template match="Index">
<xsl:apply-templates select="./Name"/>
</xsl:template>

<xsl:template match="Drop/Index">
INDEX <xsl:apply-templates select="./Name"/>
</xsl:template>

<xsl:template match="Column">
<xsl:apply-templates select="./Asterisk"/>
<xsl:apply-templates select="./Name"/>
<xsl:apply-templates select="./Null"/>
</xsl:template>

<!-- Null                                                         -->
<xsl:template match="Null">null</xsl:template>

<xsl:template match="Table/Name|View/Name|Index/Name|Column/Name|Database/Name|Schema">
<xsl:call-template name="quote-identifier"/>
</xsl:template>

<xsl:template match="Usage">
<xsl:variable name="usage"><xsl:value-of select="."/></xsl:variable>
<xsl:choose>
<xsl:when test="$usage = 'Key'">    primary key   </xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpaqueExpression">
<xsl:if test="name(..) = 'As' and name(../..) = 'Sources'">
(
</xsl:if>
<xsl:value-of select="."/>
<xsl:if test="name(..) = 'As' and name(../..) = 'Sources'">
)
</xsl:if>
</xsl:template>

<xsl:template match="OrderExpression">
<xsl:apply-templates select="./*[1]"/>
<xsl:apply-templates select="./Asc"/>
<xsl:apply-templates select="./Desc"/>
</xsl:template>

<!--OpOrderExpression-->
<!--Child nodes here should never contain parameter passed into query, except the case when Op1Type = 'SqlBool'.-->
<xsl:template match="OpOrderExpression">
<xsl:choose>
<xsl:when test="@Op1Type = 'SqlBool'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'SqlBool'"/>
<xsl:with-param name="target-type" select="'SqlBit'"/>
<xsl:with-param name="value-node" select="./*[1]"/>
</xsl:call-template>
<xsl:apply-templates select="./Asc"/>
<xsl:apply-templates select="./Desc"/>
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' or @Op1Type = 'String'">
<xsl:apply-templates select="./*[1]"/>
<xsl:apply-templates select="./Asc"/>
<xsl:apply-templates select="./Desc"/>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$ReferenceDate"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)
</xsl:otherwise>
</xsl:choose>
<xsl:apply-templates select="./Asc"/>
<xsl:apply-templates select="./Desc"/>
, (CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL THEN 0 ELSE 1 END)
<xsl:apply-templates select="./Asc"/>
<xsl:apply-templates select="./Desc"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="Asc">
ASC
</xsl:template>

<xsl:template match="Desc">
DESC
</xsl:template>

<!-- Print values: ? for parametric queries and convert expressions
for non-parametric queries                                       -->
<xsl:template match="Parameter">
<xsl:choose>
<xsl:when test="(/Statement[not(@DQInlineParams)]) and $UseParams = 'yes' or $UseParams = 'nosubsel'">
<xsl:choose>
<xsl:when test="./@ParamName">
@<xsl:value-of select="./@ParamName"/>
</xsl:when>
<xsl:otherwise>
?
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="print-non-parametric-parameter-ref">
<xsl:with-param name="parameter-reference" select="."/>
</xsl:call-template>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- DatePart                                                         -->
<xsl:template match="DatePart">
DATEPART( <xsl:apply-templates select="./*[1]"/> , <xsl:apply-templates select="./*[2]"/> )
</xsl:template>

<!-- DatePartSpec                                                     -->
<xsl:template match="DatePartSpec">
<xsl:variable name="dps-val"><xsl:value-of select="normalize-space(./text())"/></xsl:variable>
<xsl:choose>
<xsl:when test="$dps-val = 'Year'">        year        </xsl:when>
<xsl:when test="$dps-val = 'Quarter'">     quarter     </xsl:when>
<xsl:when test="$dps-val = 'Month'">       month       </xsl:when>
<xsl:when test="$dps-val = 'DayOfYear'">   dayofyear   </xsl:when>
<xsl:when test="$dps-val = 'Day'">         day         </xsl:when>
<xsl:when test="$dps-val = 'Week'">        week        </xsl:when>
<xsl:when test="$dps-val = 'DayOfWeek'">   weekday     </xsl:when>
<xsl:when test="$dps-val = 'Hour'">        hour        </xsl:when>
<xsl:when test="$dps-val = 'Minute'">      minute      </xsl:when>
<xsl:when test="$dps-val = 'Second'">      second      </xsl:when>
<xsl:when test="$dps-val = 'Millisecond'"> millisecond </xsl:when>
</xsl:choose>
</xsl:template>

<!-- Asterisk                                                         -->
<xsl:template match="Asterisk">*</xsl:template>

<!-- Count/Min/Max/Sum                                                -->
<xsl:template match="Min|Max|Sum">
<xsl:variable name="function">
<xsl:choose>
<xsl:when test="name()='Min'"> MIN </xsl:when>
<xsl:when test="name()='Max'"> MAX </xsl:when>
<xsl:when test="name()='Sum'"> SUM </xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$function"/>( <xsl:apply-templates select="./*[1]"/> )
</xsl:template>

<xsl:template match="Count">
COUNT ( <xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./*[2]"/> )
</xsl:template>

<!-- /Stdev/Stdevp/Var/Varp/Avg                                         -->
<xsl:template match="Stdev|Stdevp|Var|Varp|Avg">
<xsl:variable name="function">
<xsl:choose>
<xsl:when test="name()='Stdev'"> STDDEV </xsl:when>
<xsl:when test="name()='Stdevp'"> STDDEV_POP </xsl:when>
<xsl:when test="name()='Var'"> VARIANCE </xsl:when>
<xsl:when test="name()='Varp'"> VARIANCE_POP </xsl:when>
<xsl:when test="name()='Avg'"> AVG </xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$function"/>( <xsl:apply-templates select="./*[1]"/> )
</xsl:template>

<!-- Binary expressions                                               -->
<!-- Equal/NotEqual/Greater/GreaterOrEqual/Less/LessOrEqual/In/And/Or/Plus/Minus/Divide/Multiply
expressions                                                      -->
<xsl:template match="Equal|NotEqual|Greater|GreaterOrEqual|Less|LessOrEqual|In|And|Or|Plus|Minus|Divide|Multiply">
<xsl:variable name="operator">
<xsl:choose>
<xsl:when test="name()='Equal'"         > = </xsl:when>
<xsl:when test="name()='NotEqual'"      > &lt;&gt; </xsl:when>
<xsl:when test="name()='Greater'"       > &gt; </xsl:when>
<xsl:when test="name()='GreaterOrEqual'"> &gt;= </xsl:when>
<xsl:when test="name()='Less'"          > &lt; </xsl:when>
<xsl:when test="name()='LessOrEqual'"   > &lt;= </xsl:when>
<xsl:when test="name()='In'"            > IN </xsl:when>
<xsl:when test="name()='And'"           > AND </xsl:when>
<xsl:when test="name()='Or'"            > OR </xsl:when>
<xsl:when test="name()='Plus'"          > + </xsl:when>
<xsl:when test="name()='Minus'"         > - </xsl:when>
<xsl:when test="name()='Divide'"        > / </xsl:when>
<xsl:when test="name()='Multiply'"      > * </xsl:when>
</xsl:choose>
</xsl:variable>
(
<xsl:call-template name="print-children-list">
<xsl:with-param name="operator" select="$operator"/>
</xsl:call-template>
)
</xsl:template>

<!-- Unary string functions	-->

<xsl:template match="OpLower">
LOWER(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpUpper">
UPPER(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpLen">
LENGTH(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpTrimLeft">
LTRIM(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpTrimRight">
RTRIM(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpTrim">
RTRIM(LTRIM(<xsl:apply-templates select="./*[1]"/>))
</xsl:template>

<xsl:template match="OpLOWER">LOWER(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpUPPER">UPPER(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpLEN">LENGTH(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpTRIM">TRIM(<xsl:apply-templates select="./*[1]"/>)</xsl:template>

<!-- Although TRUNC returns a date, you cannot extract hour/minute/second from that date. -->
<!-- Rely on system default timestamp format which is 'DD-MON-RR HH.MI.SSXFF AM' rather than 'YYYY-MM-DD HH24:MI:SS.FF' on our test machine. -->
<!-- TODO: OLE/DB provider seems to have changed NLS_DATE_FORMAT -->
<xsl:template match="OpDATEVALUE">TO_TIMESTAMP(TRUNC(TO_TIMESTAMP(<xsl:apply-templates select="./*[1]"/>)))</xsl:template>
<xsl:template match="OpVALUE">TO_NUMBER(<xsl:apply-templates select="./*[1]"/>)</xsl:template>

<xsl:template match="OpUNICODE">ASCII(<xsl:apply-templates select="./*[1]"/>)</xsl:template>

<!-- TODO: Fraction of a second doesn't match DAX. -->
<!-- TODO: OLE/DB provider seems to have changed NLS_DATE_FORMAT -->
<xsl:template match="OpTIMEVALUE">(SELECT TIMESTAMP'1899-12-30 00:00:00' + (Op1 - TRUNC(Op1)) FROM (SELECT TO_TIMESTAMP(<xsl:apply-templates select="./*[1]"/>) AS Op1 FROM DUAL) AuxTable)</xsl:template>




<!--
Unary expressions where NULL considered as BLANK value(more like 0).
-->

<xsl:template match="OpNot">
NOT(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<!-- OpNot and BitNot																											-->
<!-- Do not use SQL NOT because we need to handle UNKNOWN in a special way -->
<xsl:template match="OpNot_Deprecated">
CAST((CASE WHEN (<xsl:apply-templates select="./*[1]"/>) THEN 0 ELSE 1 END) AS NUMBER(1,0))
</xsl:template>

<xsl:template match="BitNot">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
(1 - <xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(1 - <xsl:apply-templates select="./*[1]"/>, 1)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- UnaryMinus																													 -->
<xsl:template match="UnaryMinus">
(-<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<!-- Unary Excel math functions that NULL is a fixed point. -->
<xsl:template match="OpAbs|OpCeiling|OpFloor|OpSign|OpSqrt">
<xsl:variable name="OpName">
<xsl:choose>
<xsl:when test="name()='OpAbs'">ABS</xsl:when>
<xsl:when test="name()='OpCeiling'">CEIL</xsl:when>
<xsl:when test="name()='OpFloor'">FLOOR</xsl:when>
<xsl:when test="name()='OpSign'">SIGN</xsl:when>
<xsl:when test="name()='OpSqrt'">SQRT</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$OpName"/>(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpSqr">
POWER(<xsl:apply-templates select="./*[1]"/>, 2)
</xsl:template>


<!-- Count Rows                                                                 -->
<xsl:template match="OpCount">
COUNT(<xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./*[2]"/>)
</xsl:template>

<xsl:template match="OpDistinctCount">
(COUNT(DISTINCT <xsl:apply-templates select="./*[1]"/>) + MAX(CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL THEN 1 ELSE 0 END))
</xsl:template>

<xsl:template match="OpDistinctCountSkipBlank">
COUNT(DISTINCT <xsl:apply-templates select="./*[1]"/>)
</xsl:template>


<xsl:template match="OpDAY">EXTRACT(DAY FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpMONTH">EXTRACT(MONTH FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpYEAR">EXTRACT(YEAR FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>

<xsl:template match="OpWEEKNUM">
<!-- We are making assumptions here. In theory, we need to check SELECT @@DATEFIRST and generate SQL accordingly. -->
<xsl:choose>
<xsl:when test="@WeekBeginsOn='Monday' and @System='2'">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/>, 'IW'))</xsl:when>
<xsl:otherwise>
<xsl:message terminate="yes">Cartridge error: Unsupported parameters for OpWEEKNUM.</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="OpWEEKDAY">
<xsl:choose>
<xsl:when test="@WeekBeginsOn='Sunday' and @FirstDayIndex='1'">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/>, 'D'))</xsl:when>
<xsl:when test="@WeekBeginsOn='Monday' and @FirstDayIndex='1'">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/> - 1, 'D'))</xsl:when>
<xsl:when test="@WeekBeginsOn='Tuesday' and @FirstDayIndex='1'">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/> - 2, 'D'))</xsl:when>
<xsl:when test="@WeekBeginsOn='Wednesday' and @FirstDayIndex='1'">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/> - 3, 'D'))</xsl:when>
<xsl:when test="@WeekBeginsOn='Thursday' and @FirstDayIndex='1'">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/> - 4, 'D'))</xsl:when>
<xsl:when test="@WeekBeginsOn='Friday' and @FirstDayIndex='1'">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/> - 5, 'D'))</xsl:when>
<xsl:when test="@WeekBeginsOn='Saturday' and @FirstDayIndex='1'">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/> - 6, 'D'))</xsl:when>
<xsl:when test="@WeekBeginsOn='Monday' and @FirstDayIndex='0'">(TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/> - 1, 'D')) - 1)</xsl:when>
<xsl:otherwise>
<xsl:message terminate="yes">Cartridge error: Unsupported parameters for OpWEEKDAY.</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- Cannot use EXTRACT function on HOUR/MINUTE/SECOND since it only accepts TIMESTAMP but not DATE data type. -->
<!-- EXTRACT(SECOND FROM ...) extracts fraction of a second as well. -->
<xsl:template match="OpSECOND">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/>, 'SS'))</xsl:template>
<xsl:template match="OpMINUTE">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/>, 'MI'))</xsl:template>
<xsl:template match="OpHOUR">TO_NUMBER(TO_CHAR(<xsl:apply-templates select="./*[1]"/>, 'HH24'))</xsl:template>

<xsl:template match="OpABS">ABS(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSQRT">SQRT(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSIGN">SIGN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpINT">FLOOR(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpInList">(<xsl:call-template name="print-children-list"/>)</xsl:template>

<xsl:template match="OpIn|OpNaryOr">
<xsl:variable name="operator">
<xsl:choose>
<xsl:when test="name()='OpIn'"> IN </xsl:when>
<xsl:when test="name()='OpNaryOr'"> OR </xsl:when>
</xsl:choose>
</xsl:variable>
(<xsl:call-template name="print-children-list"> <xsl:with-param name="operator" select="$operator"/> </xsl:call-template>)
</xsl:template>

<!--
Binary expressions where NULL considered as BLANK value(more like 0).
-->
<!-- Comparisons -->
<xsl:template match="OpGreater|OpLess|OpNotEqual|OpEqual|OpGreaterOrEqual|OpLessOrEqual">
<xsl:variable name="operator">
<xsl:choose>
<xsl:when test="name()='OpGreater'"       > &gt; </xsl:when>
<xsl:when test="name()='OpLess'"          > &lt; </xsl:when>
<xsl:when test="name()='OpNotEqual'"      > &lt;&gt; </xsl:when>
<xsl:when test="name()='OpEqual'"         > = </xsl:when>
<xsl:when test="name()='OpGreaterOrEqual'"> &gt;= </xsl:when>
<xsl:when test="name()='OpLessOrEqual'"   > &lt;= </xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"><xsl:apply-templates select="./*[1]"/></xsl:when>
<xsl:when test="@Op1Type = 'String'">NVL(<xsl:apply-templates select="./*[1]"/>, ' ')</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">COALESCE(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$ReferenceDate"/>)</xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:when test="@Op2Type = 'String'">NVL(<xsl:apply-templates select="./*[2]"/>, ' ')</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">COALESCE(<xsl:apply-templates select="./*[2]"/>, <xsl:value-of select="$ReferenceDate"/>)</xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
(<xsl:value-of select="$Op1"/> <xsl:value-of select="$operator"/> <xsl:value-of select="$Op2"/>)
</xsl:template>

<!-- OpIs -->
<xsl:template match="OpIs">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' or @Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@OpsAreColRefs = 'true'">
<!--It's illegal to repeat query parameters more than once, so we can use only column references here.-->
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> OR <xsl:apply-templates select="./*[1]"/> IS NULL AND <xsl:apply-templates select="./*[2]"/> IS NULL)
</xsl:when>
<xsl:otherwise>
<!--Do the same as in "OpsAreColRefs = 'true'" branch, but repeating parameters only once here -> expression is more complicated.-->
((SELECT CASE WHEN Op1 = Op2 OR Op1 IS NULL AND Op2 IS NULL THEN 1 ELSE 0 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictGreater-->
<xsl:template match="OpStrictGreater">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">' '</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">' '</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &gt; <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)</xsl:when>
<xsl:otherwise>((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictLess-->
<xsl:template match="OpStrictLess">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">' '</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">' '</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &lt; <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)</xsl:when>
<xsl:otherwise>((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictLessOrEqual-->
<xsl:template match="OpStrictLessOrEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">' '</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">' '</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &lt;= <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 0)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 0)</xsl:when>
<xsl:otherwise>((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 0)</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictGreaterOrEqual-->
<xsl:template match="OpStrictGreaterOrEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">' '</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">' '</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &gt;= <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END) FROM SELECT (<xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 0)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 0)</xsl:when>
<xsl:otherwise>((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 0)</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictNotEqual-->
<xsl:template match="OpStrictNotEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">' '</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">' '</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'"><xsl:value-of select="$ReferenceDate"/></xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &lt;&gt; <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT CASE WHEN Op2 IS NULL THEN 0 ELSE CASE WHEN Op1 = Op2 THEN 1 ELSE 0 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 0)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT CASE WHEN Op1 IS NULL THEN 0 ELSE CASE WHEN Op1 = Op2 THEN 1 ELSE 0 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 0)</xsl:when>
<xsl:otherwise>((SELECT CASE WHEN Op1 = Op2 OR Op1 IS NULL AND Op2 IS NULL THEN 1 ELSE 0 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL AuxTable)) = 0)</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictEqual-->
<xsl:template match="OpStrictEqual">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT CASE WHEN Op2 IS NULL THEN 0 ELSE CASE WHEN Op1 = Op2 THEN 1 ELSE 0 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT CASE WHEN Op1 IS NULL THEN 0 ELSE CASE WHEN Op1 = Op2 THEN 1 ELSE 0 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)</xsl:when>
<xsl:otherwise>((SELECT CASE WHEN Op1 = Op2 OR Op1 IS NULL AND Op2 IS NULL THEN 1 ELSE 0 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) = 1)</xsl:otherwise>
</xsl:choose>
</xsl:template>


<!--
OpAdd resulting expression type.

DATE: DT

____  | op2
op1   | I8  R8  CY  DT
___   |__________________
I8    | I8  R8  CY  DT
R8    | R8  R8  R8  DT
CY    | CY  R8  CY  DT
DT    | DT  DT  DT  DT

-->

<!-- OpAdd -->
<xsl:template match="OpAdd">
<xsl:variable name="Op2UnNestedIfDatetimeToDouble">
<xsl:choose>
<xsl:when test="@Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'Datetime'"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2FromNestedQryIfDatetimeToDouble">
<xsl:choose>
<xsl:when test="@Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'Datetime'"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="op-node" select="'AuxTable.Op2'"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
AuxTable.Op2
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op1TypeAdjusted">
<xsl:choose>
<xsl:when test="@Op2Type = 'Datetime'">
<xsl:choose>
<xsl:when test="@Op1Type = 'Datetime'">
AuxTable.Op1
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="@Op1Type"/>
<xsl:with-param name="target-type" select="'Datetime'"/>
<xsl:with-param name="op-node" select="'AuxTable.Op1'"/>
</xsl:call-template>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
AuxTable.Op1
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2TypeAdjusted">
<xsl:choose>
<xsl:when test="@Op1Type = 'Datetime'">
<xsl:choose>
<xsl:when test="@Op2Type = 'Datetime'">
AuxTable.Op2
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="@Op2Type"/>
<xsl:with-param name="target-type" select="'Datetime'"/>
<xsl:with-param name="op-node" select="'AuxTable.Op2'"/>
</xsl:call-template>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
AuxTable.Op2
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/> + <xsl:value-of select="$Op2UnNestedIfDatetimeToDouble"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
(SELECT COALESCE(AuxTableOut.Op1 + AuxTableOut.Op2, AuxTableOut.Op1Casted) FROM (SELECT Op1, <xsl:value-of select="$Op2UnNestedIfDatetimeToDouble"/> AS Op2, <xsl:value-of select="$Op1TypeAdjusted"/> AS Op1Casted FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1 FROM DUAL) AuxTable) AuxTableOut)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
(SELECT COALESCE(AuxTableOut.Op1 + AuxTableOut.Op2, AuxTableOut.Op2Casted) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2FromNestedQryIfDatetimeToDouble"/> AS Op2, <xsl:value-of select="$Op2TypeAdjusted"/> AS Op2Casted FROM (Select <xsl:apply-templates select="./*[2]"/> AS Op2 from DUAL) AuxTable) AuxTableOut)
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(AuxTableOut.Op1 + AuxTableOut.Op2, AuxTableOut.Op1Casted, AuxTableOut.Op2Casted) FROM (Select Op1, <xsl:value-of select="$Op2FromNestedQryIfDatetimeToDouble"/> AS Op2, <xsl:value-of select="$Op1TypeAdjusted"/> AS Op1Casted, <xsl:value-of select="$Op2TypeAdjusted"/> AS Op2Casted FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2 FROM DUAL) AuxTable) AuxTableOut)
</xsl:otherwise>
</xsl:choose>
</xsl:template>


<!--
OpSubtract resulting expression type.

DATE: DT

____  | op2
op1   | I8  R8  CY  DT
___   |__________________
I8    | I8  R8  CY  R8
R8    | R8  R8  R8  R8
CY    | CY  R8  CY  R8
DT    | DT  DT  DT  DT

-->

<!-- OpSubtract -->
<xsl:template match="OpSubtract">
<xsl:variable name="Op2IfDateTimeToDouble">
<xsl:choose>
<xsl:when test="@Op2Type = 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'Datetime'"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2TypeAdjusted">
<xsl:choose>
<xsl:when test="@Op1Type = 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'Double'"/>
<xsl:with-param name="target-type" select="'Datetime'"/>
<xsl:with-param name="op-node" select="'-(AuxTable.Op2)'"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
-(AuxTable.Op2)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/> - <xsl:value-of select="$Op2IfDateTimeToDouble"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
(SELECT COALESCE(AuxTableOut.Op1 - AuxTableOut.Op2, AuxTableOut.Op1) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2IfDateTimeToDouble"/> AS Op2 FROM DUAL) AuxTableOut)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
(SELECT COALESCE(AuxTableOut.Op1 - AuxTableOut.Op2, AuxTableOut.Op2Casted) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, Op2, <xsl:value-of select="$Op2TypeAdjusted"/> AS Op2Casted FROM (Select <xsl:value-of select="$Op2IfDateTimeToDouble"/> AS Op2 from DUAL) AuxTable) AuxTableOut)
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(AuxTableOut.Op1 - AuxTableOut.Op2, AuxTableOut.Op1, AuxTableOut.Op2Casted) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, Op2, <xsl:value-of select="$Op2TypeAdjusted"/> AS Op2Casted FROM (Select <xsl:value-of select="$Op2IfDateTimeToDouble"/> AS Op2 from DUAL) AuxTable) AuxTableOut)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpDivide -->
<xsl:template match="OpDivide">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op1Type = 'Currency' and @Op2Type != 'Currency'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="@Op2Type"/>
<xsl:with-param name="target-type" select="'Currency'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="@Op2Type"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/> / <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:otherwise>
(<xsl:apply-templates select="./*[1]"/> / COALESCE(<xsl:value-of select="$Op2"/>, 0))
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpMultiply  -->
<xsl:template match="OpMultiply">
<xsl:choose>
<xsl:when test="@Op1Type = 'Currency' and @Op2Type = 'Currency'">
(<xsl:apply-templates select="./*[1]"/> *
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'Currency'"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>)
</xsl:when>
<xsl:when test="@Op1Type = 'Double' and @Op2Type = 'Currency' or @Op2Type = 'Double' and @Op1Type = 'Currency'">
<!--FUTURE: RT: it's impossible to use <xsl:call-template name="OpCast"/> here,
so using direct cast. It gives us desired result here.          -->
CAST(<xsl:apply-templates select="./*[1]"/> * <xsl:apply-templates select="./*[2]"/> AS MONEY)
</xsl:when>
<xsl:otherwise>
(<xsl:apply-templates select="./*[1]"/> * <xsl:apply-templates select="./*[2]"/>)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpSafeDivide -->
<xsl:template match="OpSafeDivide">
<!-- ***** This part is from OpDivide above ***** -->
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op1Type = 'Currency' and @Op2Type != 'Currency'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="@Op2Type"/>
<xsl:with-param name="target-type" select="'Currency'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="@Op2Type"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<!-- ***** End of part from OpDivide. ***** -->
(SELECT
CASE
WHEN AuxTable.Op1 IS NULL
THEN NULL
ELSE
CASE
WHEN AuxTable.Op2 IS NULL OR AuxTable.Op2 = 0
THEN AuxTable.Op3
ELSE
AuxTable.Op1 / AuxTable.Op2
END
END
FROM (SELECT
<xsl:apply-templates select="./*[1]"/> AS Op1,
<xsl:value-of select="$Op2"/> AS Op2,
<xsl:apply-templates select="./*[3]"/> AS Op3
FROM DUAL) AuxTable
)
</xsl:template>

<!-- OpOr|OpAnd                                                           -->
<xsl:template match="OpOr|OpAnd">
<xsl:variable name="operator">
<xsl:choose>
<xsl:when test="name()='OpOr'"> OR </xsl:when>
<xsl:when test="name()='OpAnd'"> AND </xsl:when>
</xsl:choose>
</xsl:variable>
(<xsl:apply-templates select="./*[1]"/> <xsl:value-of select="$operator"/> <xsl:apply-templates select="./*[2]"/>)
</xsl:template>

<!-- OpPOWER|OpQUOTIENT|OpROUND|OpROUNDUP|OpMROUND|OpCEILING|OpISO.CEILING|OpROUNDDOWN|OpTRUNC -->
<xsl:template match="OpPOWER|OpQUOTIENT|OpROUND|OpROUNDUP|OpMROUND|OpCEILING|OpISO.CEILING|OpROUNDDOWN|OpTRUNC">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpPOWER'">
POWER(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="name()='OpQUOTIENT'">
TRUNC(<xsl:apply-templates select="./*[1]"/> / <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="name()='OpROUND'">
ROUND(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="name()='OpROUNDDOWN' or name() = 'OpTRUNC'">
TRUNC(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="name()='OpROUNDUP'">
(SELECT CEIL(ABS(Op1) * Op2) * SIGN(Op1) / Op2 FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, POWER(10.0, <xsl:value-of select="$Op2"/>) AS Op2 FROM DUAL) AuxTable)
</xsl:when>
<xsl:when test="name()='OpMROUND'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
(SELECT CASE WHEN Op2 = 0 THEN 0 ELSE ROUND(Op1/Op2, 0)*Op2 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2 FROM DUAL) AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op1 IS NULL THEN NULL ELSE CASE WHEN Op2 = 0 THEN 0 ELSE ROUND(Op1/Op2, 0)*Op2 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2 FROM DUAL) AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpCEILING'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2Static=1">
CEIL(<xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op2 = 0 THEN 0 ELSE CEIL(Op1/Op2)*Op2 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2 FROM DUAL) AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op1 IS NULL THEN NULL ELSE CASE WHEN Op2 = 0 THEN 0 ELSE CEIL(Op1/Op2)*Op2 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2 FROM DUAL) AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpISO.CEILING'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2Static=1">
CEIL(<xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op2 = 0 THEN 0 ELSE CEIL(Op1/Op2)*Op2 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, ABS(<xsl:value-of select="$Op2"/>) AS Op2 FROM DUAL) AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op1 IS NULL THEN NULL ELSE CASE WHEN Op2 = 0 THEN 0 ELSE CEIL(Op1/Op2)*Op2 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, ABS(<xsl:value-of select="$Op2"/>) AS Op2 FROM DUAL) AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:template>

<!--
Binary text functions expressions where NULL considered as 0.
-->

<!-- Mid for new DQ -->
<xsl:template match="OpMID">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
<xsl:apply-templates select="./*[2]"/>
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op3">
<xsl:choose>
<xsl:when test="@Op3Nullable = 'false'">
<xsl:apply-templates select="./*[3]"/>
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[3]"/>, 0)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
SUBSTR(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op3"/>)
</xsl:template>

<!-- Left, Right for new DQ -->
<xsl:template match="OpLEFT|OpRIGHT">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
<xsl:apply-templates select="./*[2]"/>
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpLEFT'">
SUBSTR(<xsl:apply-templates select="./*[1]"/>, 1, <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="name()='OpRIGHT'">
<!-- SUBSTR returns NULL when Op2 is bigger than the length of the string but DAX expects the string itself in this case. -->
<!-- SUBSTR(Op1, LENGTH(Op1) - Op2 + 1, Op2) does not return the DAX result in the above case. -->
<!-- Supply Op2 as the 3rd argument to SUBSTR to correctly handle the corner case when Op2 < 0. -->
(SELECT CASE WHEN LENGTH(Op1) > Op2 THEN SUBSTR(Op1, -Op2, Op2) ELSE Op1 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2 FROM DUAL) AuxTable)
</xsl:when>
</xsl:choose>
</xsl:template>

<!-- Oracle || operator handles NULL correctly, doesn't simply return NULL. -->
<xsl:template match="OpCONCATENATE">(<xsl:apply-templates select="./*[1]"/> || <xsl:apply-templates select="./*[2]"/>)</xsl:template>

<!-- OpEXACT: Oracle performs case sensitive string comparisons by default, = operator inherits default system behavior, therefore no need for EXACT. -->

<!-- OpREPT: No elegant way as Oracle LPAD/RPAD doesn't allow empty string as first argument. -->

<xsl:template match="OpSUBSTITUTE">
<!-- REPLACE behaves correctly when 2nd or 3rd argument is NULL. -->
REPLACE(<xsl:apply-templates select="./*[1]"/>, <xsl:apply-templates select="./*[2]"/>, <xsl:apply-templates select="./*[3]"/>)
</xsl:template>

<xsl:template match="OpSEARCH|OpPATTERNSEARCH|OpFIND">
<!-- Unlike DAX, Oracle cannot find BLANK() or "". -->
<xsl:choose>
<xsl:when test="name()='OpSEARCH' or name()='OpPATTERNSEARCH'">
<xsl:choose>
<xsl:when test="./Parameter[1]">
<xsl:choose>
<xsl:when test="name()='OpSEARCH'">
<xsl:choose>
<xsl:when test="@Op4Static=0">
(SELECT INSTR(Op2, Op1, Op3) FROM (SELECT UPPER(<xsl:apply-templates select="./*[1]"/>) AS Op1, UPPER(<xsl:apply-templates select="./*[2]"/>) AS Op2, <xsl:apply-templates select="./*[3]"/> AS Op3 FROM DUAL) AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Result > 0 THEN Result ELSE Op4 END FROM (SELECT INSTR(Op2, Op1, Op3) AS Result, Op4 FROM (SELECT UPPER(<xsl:apply-templates select="./*[1]"/>) AS Op1, UPPER(<xsl:apply-templates select="./*[2]"/>) AS Op2, <xsl:apply-templates select="./*[3]"/> AS Op3, <xsl:apply-templates select="./*[4]"/> AS Op4 FROM DUAL) AuxTable) AuxTable2)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpPATTERNSEARCH'">
<xsl:choose>
<xsl:when test="@Op4Static=0">
(SELECT REGEXP_INSTR(Op2, Op1, Op3, 1, 0, 'i') FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2, <xsl:apply-templates select="./*[3]"/> AS Op3 FROM DUAL) AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Result > 0 THEN Result ELSE Op4 END FROM (SELECT REGEXP_INSTR(Op2, Op1, Op3, 1, 0, 'i') AS Result, Op4 FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2, <xsl:apply-templates select="./*[3]"/> AS Op3, <xsl:apply-templates select="./*[4]"/> AS Op4 FROM DUAL) AuxTable) AuxTable2)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:message terminate="yes">Cartridge error: The first parameter of OpSEARCH/OpPATTERNSEARCH is expected to be a constant string.</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpFIND'">
<xsl:choose>
<xsl:when test="@Op4Static=0">
(SELECT INSTR(Op2, Op1, Op3) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2, <xsl:apply-templates select="./*[3]"/> AS Op3 FROM DUAL) AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Result > 0 THEN Result ELSE Op4 END FROM (SELECT INSTR(Op2, Op1, Op3) AS Result, Op4 FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2, <xsl:apply-templates select="./*[3]"/> AS Op3, <xsl:apply-templates select="./*[4]"/> AS Op4 FROM DUAL) AuxTable) AuxTable2)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:template>
<!-- Unlike DAX, DATE/TIME cannot deal with component values out of range. -->
<xsl:template match="OpDATE">TO_DATE(<xsl:apply-templates select="./*[1]"/> || '-' || <xsl:apply-templates select="./*[2]"/> || '-' || <xsl:apply-templates select="./*[3]"/>, 'YYYY-MM-DD')</xsl:template>
<xsl:template match="OpTIME">TO_TIMESTAMP('1899-12-30 ' || <xsl:apply-templates select="./*[1]"/> || ':' || <xsl:apply-templates select="./*[2]"/> || ':' || <xsl:apply-templates select="./*[3]"/>, 'YYYY-MM-DD HH24:Mi:SS')</xsl:template>

<xsl:template match="OpEOMONTH|OpEDATE">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
<xsl:apply-templates select="./*[2]"/>
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpEOMONTH'">LAST_DAY(ADD_MONTHS(TRUNC(<xsl:apply-templates select="./*[1]"/>), <xsl:value-of select="$Op2"/>))</xsl:when>
<xsl:when test="name()='OpEDATE'">ADD_MONTHS(TRUNC(<xsl:apply-templates select="./*[1]"/>), <xsl:value-of select="$Op2"/>)</xsl:when>
</xsl:choose>
</xsl:template>

<!-- OpCast                                                             -->
<!-- Known types:                                                       -->
<!--     Double                                                         -->
<!--     Integer                                                        -->
<!--     Currency                                                       -->
<!--     SqlBool                                                        -->
<!--     SqlBit                                                         -->
<!--     Datetime                                                       -->
<!--     String                                                         -->

<xsl:variable name="ReferenceDate" select="&quot;TO_TIMESTAMP(&apos;1899-12-30 00:00:00&apos;, &apos;yyyy-mm-dd HH24:mi:ss&apos;)&quot;" />

<xsl:template name="OpCast" match="OpCast">
<xsl:param name="param-type" select="@Op1Type"/>
<xsl:param name="target-type" select="@ResultType"/>
<xsl:param name="source-target-type" select="@SourceTargetType"/>
<xsl:param name="value-node" select="./*[1]"/>
<xsl:param name="op-node" select="'DEFAULT_VALUE'"/>

<xsl:variable name="effectiveValue">
<xsl:choose>
<xsl:when test="$op-node = 'DEFAULT_VALUE'">
<xsl:apply-templates select="$value-node"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$op-node" />
</xsl:otherwise>
</xsl:choose>
</xsl:variable>

<xsl:choose>

<xsl:when test="$target-type = 'Double'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
(SELECT CAST(EXTRACT(DAY FROM AuxTable.cDiff) + EXTRACT(HOUR FROM AuxTable.cDiff)/24 + EXTRACT(MINUTE FROM AuxTable.cDiff)/(24*60.0) + EXTRACT(SECOND FROM AuxTable.cDiff)/(24*60*60.0) AS FLOAT) FROM
(SELECT (<xsl:value-of select="$effectiveValue" /> - <xsl:value-of select="$ReferenceDate"/>) cDiff FROM DUAL) AuxTable)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
(CASE WHEN <xsl:value-of select="$effectiveValue" /> THEN 1.0 ELSE 0.0 END)
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='IntervalYM'">
CAST((SELECT EXTRACT(YEAR FROM Op1) * 12 + EXTRACT(MONTH FROM Op1) FROM (SELECT <xsl:value-of select="$effectiveValue"/> Op1 FROM DUAL) AuxTable) AS BINARY_DOUBLE)
</xsl:when>
<xsl:when test="@Op1SourceProviderType='IntervalDS'">
CAST(SYSDATE + <xsl:value-of select="$effectiveValue"/> - SYSDATE AS BINARY_DOUBLE)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:value-of select="$effectiveValue"/> AS FLOAT)
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'Integer'">
<xsl:choose>
<!-- Auto roundoff -->
<xsl:when test="$param-type = 'Datetime'">
(SELECT CAST(EXTRACT(DAY FROM AuxTable.cDiff) + EXTRACT(HOUR FROM AuxTable.cDiff)/24 + EXTRACT(MINUTE FROM AuxTable.cDiff)/(24*60.0) + EXTRACT(SECOND FROM AuxTable.cDiff)/(24*60*60.0) AS NUMBER(19, 0)) FROM
(SELECT (<xsl:value-of select="$effectiveValue" /> - <xsl:value-of select="$ReferenceDate"/>) cDiff FROM DUAL) AuxTable)
</xsl:when>
<!-- Auto roundoff -->
<xsl:when test="$param-type = 'Double' or $param-type = 'Currency'">
CAST(<xsl:value-of select="$effectiveValue" /> AS NUMBER(19, 0))
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
(CASE WHEN <xsl:value-of select="$effectiveValue" /> THEN 1 ELSE 0 END)
</xsl:when>
<!-- Truncate the scale. -->
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='IntervalYM'">
(SELECT EXTRACT(YEAR FROM Op1) * 12 + EXTRACT(MONTH FROM Op1) FROM (SELECT <xsl:value-of select="$effectiveValue"/> Op1 FROM DUAL) AuxTable)
</xsl:when>
<xsl:when test="@Op1SourceProviderType='IntervalDS'">
CAST(SYSDATE + <xsl:value-of select="$effectiveValue"/> - SYSDATE AS NUMBER(19, 0))
</xsl:when>
<xsl:otherwise>
CAST(<xsl:value-of select="$effectiveValue" /> as NUMBER(19, 0))
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'Currency'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
(SELECT CAST(EXTRACT(DAY FROM AuxTable.cDiff) + EXTRACT(HOUR FROM AuxTable.cDiff)/24 + EXTRACT(MINUTE FROM AuxTable.cDiff)/(24*60.0) + EXTRACT(SECOND FROM AuxTable.cDiff)/(24*60*60.0) AS NUMBER(19, 4)) FROM
(SELECT (<xsl:value-of select="$effectiveValue" /> - <xsl:value-of select="$ReferenceDate"/>) cDiff FROM DUAL) AuxTable)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
(CASE WHEN <xsl:value-of select="$effectiveValue" /> THEN 1.0 ELSE 0.0 END)
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='IntervalYM'">
CAST((SELECT EXTRACT(YEAR FROM Op1) * 12 + EXTRACT(MONTH FROM Op1) FROM (SELECT <xsl:value-of select="$effectiveValue"/> Op1 FROM DUAL) AuxTable) AS NUMBER(19, 4))
</xsl:when>
<xsl:when test="@Op1SourceProviderType='IntervalDS'">
CAST(SYSDATE + <xsl:value-of select="$effectiveValue"/> - SYSDATE AS NUMBER(19, 4))
</xsl:when>
<xsl:otherwise>
CAST(<xsl:value-of select="$effectiveValue" /> AS NUMBER(19, 4))
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'SqlBool'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
(<xsl:value-of select="$effectiveValue" /> != <xsl:value-of select="$ReferenceDate"/>)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
<xsl:value-of select="$effectiveValue" />
</xsl:when>
<xsl:when test="$param-type = 'String'">
(TO_NUMBER(<xsl:value-of select="$effectiveValue" />) = 1)
</xsl:when>
<xsl:otherwise>
(<xsl:value-of select="$effectiveValue" /> &lt;&gt; 0)
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'SqlBit'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
(CASE WHEN <xsl:value-of select="$effectiveValue" /> IS NULL THEN NULL WHEN <xsl:value-of select="$effectiveValue" /> != <xsl:value-of select="$ReferenceDate"/> THEN 1 ELSE 0 END)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
(CASE WHEN <xsl:value-of select="$effectiveValue" /> THEN 1 ELSE 0 END)
</xsl:when>
<xsl:when test="$param-type = 'String'">
(CASE WHEN <xsl:value-of select="$effectiveValue" /> IS NULL THEN NULL WHEN TO_NUMBER(<xsl:value-of select="$effectiveValue" />) &lt;&gt; 0 THEN 1 ELSE 0 END)
</xsl:when>
<xsl:otherwise>
(CASE WHEN <xsl:value-of select="$effectiveValue" /> IS NULL THEN NULL WHEN <xsl:value-of select="$effectiveValue" /> &lt;&gt; 0 THEN 1 ELSE 0 END)
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'Datetime'">
<xsl:choose>
<xsl:when test="$param-type = 'SqlBool'">
(CASE WHEN <xsl:value-of select="$effectiveValue" /> THEN <xsl:value-of select="$ReferenceDate"/> + 1 ELSE <xsl:value-of select="$ReferenceDate"/> END)
</xsl:when>
<xsl:when test="$param-type = 'Double'
or $param-type = 'Integer'
or $param-type = 'Currency'
or $param-type = 'SqlBit'">
(<xsl:value-of select="$ReferenceDate"/> + <xsl:value-of select="$effectiveValue" />)
</xsl:when>
<xsl:otherwise>
TO_TIMESTAMP(<xsl:value-of select="$effectiveValue" />, 'yyyy-mm-dd HH24:mi:ss')
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'String'">
<xsl:choose>
<xsl:when test="$param-type = 'SqlBit'">
(CASE WHEN <xsl:value-of select="$effectiveValue" /> = 1 THEN 'TRUE' ELSE 'FALSE' END)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
(CASE WHEN <xsl:value-of select="$effectiveValue" /> THEN 'TRUE' ELSE 'FALSE' END)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:value-of select="$effectiveValue"/> AS VARCHAR2(4000))
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$source-target-type != ''">
CAST(<xsl:apply-templates select="$value-node"/> AS <xsl:apply-templates select="$source-target-type"/>)
</xsl:when>

<xsl:otherwise>
<xsl:message terminate="yes">Oracle cartridge error: OpCast: ResultType is not specified</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpCase -->
<xsl:template match="OpCase">
(
CASE
<xsl:for-each select="IfClause">
WHEN <xsl:apply-templates select="./Condition/*[1]"/>
THEN <xsl:apply-templates select="./Then/*[1]"/>
</xsl:for-each>
ELSE <xsl:apply-templates select="./Else/*[1]"/>
END
)
</xsl:template>
<!-- Literal -->
<xsl:template match="Literal">
<xsl:value-of select="."/>
</xsl:template>

<!-- True and False                                                       -->
<xsl:template match="True">
CAST(1 AS NUMBER(1, 0))
</xsl:template>

<xsl:template match="False">
CAST(0 AS NUMBER(1, 0))
</xsl:template>


<!-- Postfix unary expressions                                        -->
<!-- IsNull
expressions                                                      -->
<xsl:template match="IsNull">
<xsl:variable name="operator">
<xsl:choose>
<xsl:when test="name()='IsNull'"> IS NULL </xsl:when>
</xsl:choose>
</xsl:variable>
(
<xsl:apply-templates select="./*[1]"/>
<xsl:value-of select="$operator"/>
)
</xsl:template>

<!-- Types                                                            -->
<xsl:template match="Type">
<xsl:variable name="type-val"><xsl:value-of select="normalize-space(./text())"/></xsl:variable>
<xsl:choose>
<xsl:when test="$type-val = 'DBTYPE_BSTR'">    nvarchar2    </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_WSTR'">    nvarchar2    </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_STR'">     varchar2    </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_BOOL'">    number(1,0) </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I1'">      number(3,0) </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I2'">      number(5,0) </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I4'">      number(10,0) </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I8'">      number(19,0) </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI1'">     number(3,0) </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI2'">     number(5,0) </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI4'">     number(10,0) </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI8'">     number(19,0) </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_R4'">      number       </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_R8'">      float 	</xsl:when>
<xsl:when test="$type-val = 'DBTYPE_DATE'">    date         </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_DBTIMESTAMP'">    date  </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_CY'">      number       </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_VARIANT'"> number       </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_GUID'">    varchar2     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_ByteArray'"> long raw  </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_DECIMAL'"> number </xsl:when>
</xsl:choose>
<xsl:apply-templates select="./Size"/>
<xsl:apply-templates select="./Precision"/>
<xsl:apply-templates select="./Scale"/>
</xsl:template>

<!-- BoolValue - casts only boolean expressions to bit                -->
<xsl:template match="BoolValue">
CAST(CASE WHEN(<xsl:apply-templates select="./*[1]"/>)THEN 1 ELSE 0 END as number(1,0))
</xsl:template>

<!-- Size (optional)                                                  -->
<xsl:template match="Size">
( <xsl:value-of select="./text()"/> )
</xsl:template>

<!-- Precision (optional)                                                  -->
<xsl:template match="Precision">
( <xsl:value-of select="./text()"/>
</xsl:template>

<!-- Scale (optional)                                                  -->
<xsl:template match="Scale">
, <xsl:value-of select="./text()"/> )
</xsl:template>
<!-- Cast                                                             -->
<xsl:template match="Cast">
CAST(<xsl:apply-templates select="./*[1]"/> AS <xsl:apply-templates select="./*[2]"/>)
</xsl:template>

<!-- By default don't do anything                                     -->
<xsl:template match="*">
</xsl:template>

<!-- Print a schema object                                               -->
<xsl:template name="build-quoted-schema-object">
<xsl:param name="schema-object-node" select="."/>

<xsl:variable name="unquoted-schema">
<xsl:value-of select="$schema-object-node/Schema"/>
</xsl:variable>
<xsl:variable name="schema">
<xsl:apply-templates select="$schema-object-node/Schema"/>
</xsl:variable>
<xsl:variable name="table">
<xsl:apply-templates select="$schema-object-node/Name"/>
</xsl:variable>
<xsl:choose>
<xsl:when test="$unquoted-schema = ''">
<xsl:value-of select="$table"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat($schema,'.', $table)"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- Convert an identifier to the OLEDB quotation form                -->
<xsl:template name="quote-identifier">
<xsl:param name="identifier" select="."/>

<xsl:value-of select="$IdentifierStartQuotingCharacter"/>
<xsl:call-template name="normalize-entity-aux">
<xsl:with-param name="entity" select="$identifier"/>
<xsl:with-param name="end-quoting-char" select="$IdentifierEndQuotingCharacter"/>
</xsl:call-template>
<xsl:value-of select="$IdentifierEndQuotingCharacter"/>
</xsl:template>

<!-- Convert a string to the string quotation form                    -->
<xsl:template name="quote-string">
<xsl:param name="string" select="."/>

<xsl:value-of select="$StringStartQuotingCharacter"/>
<xsl:call-template name="normalize-entity-aux">
<xsl:with-param name="entity" select="$string"/>
<xsl:with-param name="end-quoting-char" select="$StringEndQuotingCharacter"/>
</xsl:call-template>
<xsl:value-of select="$StringEndQuotingCharacter"/>
</xsl:template>

<!-- Convert an entity to the quotation form (recursive, aux)  by
duplicating the end quoting character                            -->
<xsl:template name="normalize-entity-aux">
<xsl:param name="entity"/>
<xsl:param name="end-quoting-char"/>

<xsl:choose>
<xsl:when test="contains($entity, $end-quoting-char)">
<xsl:value-of select="substring-before($entity, $end-quoting-char)"/>
<xsl:value-of select="$end-quoting-char"/>
<xsl:value-of select="$end-quoting-char"/>
<xsl:call-template name="normalize-entity-aux">
<xsl:with-param name="entity" select="substring-after($entity, $end-quoting-char)"/>
<xsl:with-param name="end-quoting-char" select="$end-quoting-char"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$entity"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- Print the children list                                          -->
<xsl:template name="print-children-list">
<xsl:param name="operator" select="','"/>

<xsl:call-template name="print-list">
<xsl:with-param name="value-node" select="./*"/>
<xsl:with-param name="operator" select="$operator"/>
</xsl:call-template>
</xsl:template>

<!-- Print a list                                                     -->
<xsl:template name="print-list">
<xsl:param name="operator" select="','"/>
<xsl:param name="value-node" select="."/>

<xsl:for-each select="$value-node">
<xsl:variable name="phase"><xsl:value-of select="../../../Phase"/></xsl:variable>
<xsl:choose>
<xsl:when test="number($phase) = 1 and name($value-node) = 'ColumnExpressions'">
<xsl:call-template name="print-view-column">
<xsl:with-param name="parameter" select="./*[1]"/>
<xsl:with-param name="pos" select="position()"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="."/>
</xsl:otherwise>
</xsl:choose>
<xsl:if test="position()!=last()">
<xsl:value-of select="$operator"/>
</xsl:if>
</xsl:for-each>
</xsl:template>

<xsl:template name="print-view-column">
<xsl:param name="parameter"/>
<xsl:param name="pos"/>
<xsl:apply-templates select="$parameter"/><xsl:text> </xsl:text><xsl:apply-templates select="/Statement/Create/ColumnDefinitions/*[$pos]"/>
</xsl:template>

<!-- Get the value of a parameter ref for the query                   -->
<xsl:template name="print-non-parametric-parameter-ref">
<xsl:param name="parameter-reference"/>

<xsl:variable name="reference"><xsl:value-of select="$parameter-reference/@ref"/></xsl:variable>
<xsl:call-template name="print-non-parametric-parameter">
<xsl:with-param name="parameter" select="/Statement/Parameters/Parameter[@id=$reference]"/>
</xsl:call-template>
</xsl:template>

<!-- Get the value of a parameter ref for the query                   -->
<xsl:template name="print-non-parametric-parameter">
<xsl:param name="parameter"/>

<xsl:variable name="db-type"><xsl:value-of select="$parameter/@DBTYPE"/></xsl:variable>
<xsl:variable name="value"><xsl:value-of select="$parameter/text()"/></xsl:variable>
<xsl:choose>
<xsl:when test="$db-type = 'DBTYPE_BSTR'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_WSTR'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_STR'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_BOOL'">CAST(<xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS number)</xsl:when>
<xsl:when test="$db-type = 'DBTYPE_I1'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_I2'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_I4'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_I8'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_UI1'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_UI2'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_UI4'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_UI8'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_R4'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_R8'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_DATE'">TO_DATE(<xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template>, 'YYYY-MM-DD HH24:Mi:SS')</xsl:when>
<xsl:when test="$db-type = 'DBTYPE_DBTIMESTAMP'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS date)</xsl:when>
<xsl:when test="$db-type = 'DBTYPE_CY'">CAST(<xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS number)</xsl:when>
<xsl:when test="$db-type = 'DBTYPE_VARIANT'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_GUID'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_ByteArray'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_DECIMAL'"><xsl:value-of select="$value"/></xsl:when>
</xsl:choose>
</xsl:template>
<xsl:template match="OpACOS|OpACOT|OpCOS|OpCOSH|OpCOT|OpEXP|OpLN|OpLOG10">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"><xsl:apply-templates select="./*[1]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpACOS'">ACOS(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpACOT'">(1.5707963267949 - ATAN(<xsl:value-of select="$Op1"/>))</xsl:when>
<xsl:when test="name()='OpCOS'">COS(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpCOSH'">COSH(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpCOT'">(1 / TAN(<xsl:value-of select="$Op1"/>))</xsl:when>
<xsl:when test="name()='OpEXP'">EXP(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpLN'">LN(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpLOG10'">LOG(10, <xsl:value-of select="$Op1"/>)</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpASIN">ASIN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpATAN">ATAN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpDEGREES">(<xsl:apply-templates select="./*[1]"/> * 57.2957795130823)</xsl:template>

<!-- max, min -->

<xsl:template match="OpMOD">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<!-- MOD in Oracle behaves differently for Op1 and Op2 having opposite signs -->
(SELECT Op1 - Op2 * FLOOR(Op1 / Op2) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2 FROM DUAL) AuxTable)
</xsl:template>

<!-- MAX/MIN/LOG differ from DAX by converting BLANK to 0 to keep SQL expressions simple -->
<xsl:template match="OpMAX|OpMIN|OpLOG">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"><xsl:apply-templates select="./*[1]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpMAX'">GREATEST(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpMIN'">LEAST(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpLOG'">(SELECT LOG(Op2, Op1) FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2 FROM DUAL) AuxTable)</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpRADIANS">(<xsl:apply-templates select="./*[1]"/> * 0.0174532925199433)</xsl:template>
<xsl:template match="OpSIN">SIN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSINH">SINH(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSQRTPI">SQRT(<xsl:apply-templates select="./*[1]"/> * 3.14159265358979)</xsl:template>
<xsl:template match="OpTAN">TAN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>

</xsl:stylesheet>
