<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0" xmlns:mssqlcrt="urn:sql-microsoft-com:sqlcrt" xmlns:mssqldbg="urn:sql-microsoft-com:sqldbg">
<xsl:output method="xml" indent="yes"/>

<!-- This ALWAYS GENERATED file contains the definitions for the cartridges
Microsoft Cartridge Interfaces (Analysis Services 2005)
(C) Copyright 1988 - 2003 By Microsoft Corporation.      -->


<!-- Area of Custom parametrizations: these may be modified by customers for specific query customizations  -->
<!-- post-select-query-hint will append the customer-defined string at the end of the generated SELECT statement - e.g. WITH UR -->
<xsl:param name="post-select-query-hint"></xsl:param>

<!-- SQL Server 120 pluggable cartridge                              -->

<!-- Area of STANDARD parametrizations: these are externally passed   -->
<xsl:param name="in_CanUseParams">yes</xsl:param>
<xsl:param name="in_IdentStartQuotingCharacter">[</xsl:param>
<xsl:param name="in_IdentEndQuotingCharacter">]</xsl:param>
<xsl:param name="in_UnicodeStringPrefix">N</xsl:param>
<xsl:param name="in_StringQuotingCharacter">'</xsl:param>

<!-- Area of CORE parametrizations: These are externally checked      -->
<mssqlcrt:provider type="prefix" managed="yes" native="yes">Microsoft SQL Server.11</mssqlcrt:provider>
<mssqlcrt:provider type="prefix" managed="yes" native="yes">Microsoft SQL Server.12</mssqlcrt:provider>
<mssqlcrt:provider type="prefix" managed="yes" native="yes">Microsoft SQL Server.13</mssqlcrt:provider>
<mssqlcrt:provider type="prefix" managed="yes" native="yes">Microsoft SQL Server.14</mssqlcrt:provider>
<mssqlcrt:provider type="prefix" managed="yes" native="yes">Microsoft SQL Server.15</mssqlcrt:provider>
<mssqlcrt:provider type="prefix" managed="yes" native="yes">Microsoft SQL Server.16</mssqlcrt:provider>
<mssqlcrt:parameter-style native="unnamed" managed="named"/>
<mssqlcrt:dq-datetime-format>YYYYMMDD HH:MM:SS</mssqlcrt:dq-datetime-format>

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
<mssqlcrt:supports-remote-query/>
<mssqlcrt:supports-top-clause/>
<mssqlcrt:supports-union/>
<mssqlcrt:supports-union-all/>
<mssqlcrt:supports-fast-writeback>TABLOCK,FIRE_TRIGGERS</mssqlcrt:supports-fast-writeback>
<mssqlcrt:supports-recursive-select>1</mssqlcrt:supports-recursive-select>
<mssqlcrt:supports-materialized-view>2</mssqlcrt:supports-materialized-view>
<mssqlcrt:supports-real-time/>
<mssqlcrt:supports-joins/>
<mssqlcrt:supports-apply/>
<mssqlcrt:supports-distinct-count/>
<mssqlcrt:supports-params/>
<mssqlcrt:supports-top-tie/>
<mssqlcrt:requires-orderby-for-skip/>
<mssqlcrt:supports-top/>
<mssqlcrt:supports-row-constructor/>
<mssqlcrt:supports-not-operator/>
<!-- mssqlcrt:supports-table-constructor (Disabled this for now because Azure SQL DW may not support Table constructor and apparently we use sql120.xsl cartridge for it instead of sqlpdw.xsl cartridge due to another issue) -->
<!-- mssqlcrt:supports-materialized-view-prevalidation -->

<mssqlcrt:supports-weeknum-return-type>1</mssqlcrt:supports-weeknum-return-type>
<mssqlcrt:supports-weeknum-return-type>17</mssqlcrt:supports-weeknum-return-type>
<mssqlcrt:supports-weeknum-return-type>21</mssqlcrt:supports-weeknum-return-type>
<mssqlcrt:pattern-search-expression-type>SQLLIKE</mssqlcrt:pattern-search-expression-type>

<mssqlcrt:limit-materialized-view-column-count>16</mssqlcrt:limit-materialized-view-column-count>
<!--
This cartridge is used as the default cartridge for unknown providers
So even though SQL supports larger aliases (at least 128), we'll use a smaller
alias for the other providers
-->
<mssqlcrt:limit-table-identifier-length>64</mssqlcrt:limit-table-identifier-length>
<mssqlcrt:limit-column-identifier-length>64</mssqlcrt:limit-column-identifier-length>

<mssqlcrt:limit-parameter-count>2100</mssqlcrt:limit-parameter-count>
<mssqlcrt:limit-in-operator-list-size>2100</mssqlcrt:limit-in-operator-list-size>
<mssqlcrt:limit-temptable-row-count>0</mssqlcrt:limit-temptable-row-count>
<mssqlcrt:limit-batch-insert-count>1000</mssqlcrt:limit-batch-insert-count>
<mssqlcrt:limit-table-constructor-row-count>1000</mssqlcrt:limit-table-constructor-row-count>

<!-- Map from MSDAInitialize connection string to SQLOLEDB connection string -->
<mssqlcrt:remote-connection-string-mappings>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>Provider</mssqlcrt:datasource-property>
<mssqlcrt:remote-property></mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>Data Source</mssqlcrt:datasource-property>
<mssqlcrt:remote-property>Server</mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>Initial Catalog</mssqlcrt:datasource-property>
<mssqlcrt:remote-property>Database</mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>User ID</mssqlcrt:datasource-property>
<mssqlcrt:remote-property>UID</mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>Password</mssqlcrt:datasource-property>
<mssqlcrt:remote-property>PWD</mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:remote-connection-string-mapping>
<mssqlcrt:datasource-property>Integrated Security=SSPI</mssqlcrt:datasource-property>
<mssqlcrt:remote-property>Trusted_Connection=yes</mssqlcrt:remote-property>
</mssqlcrt:remote-connection-string-mapping>
</mssqlcrt:remote-connection-string-mappings>
</mssqlcrt:capabilities>

<mssqlcrt:schema-classes>
<mssqlcrt:schema-class>
<mssqlcrt:managed-provider>System.Data.SqlClient</mssqlcrt:managed-provider>
<mssqlcrt:type>Microsoft.DataWarehouse.Design.SqlSchema, Microsoft.DataWarehouse.AS</mssqlcrt:type>
<mssqlcrt:query-designer>
<mssqlcrt:type>Microsoft.DataWarehouse.Controls.SqlClientQueryDesigner, Microsoft.DataWarehouse.AS</mssqlcrt:type>
</mssqlcrt:query-designer>
</mssqlcrt:schema-class>
<mssqlcrt:schema-class>
<mssqlcrt:managed-provider>System.Data.OleDb</mssqlcrt:managed-provider>
<mssqlcrt:type>Microsoft.DataWarehouse.Design.OleDbSchema, Microsoft.DataWarehouse.AS</mssqlcrt:type>
<mssqlcrt:query-designer>
<mssqlcrt:type>Microsoft.DataWarehouse.Controls.OleDbQueryDesigner, Microsoft.DataWarehouse.AS</mssqlcrt:type>
</mssqlcrt:query-designer>
</mssqlcrt:schema-class>
<mssqlcrt:schema-class>
<mssqlcrt:managed-provider>System.Data.Odbc</mssqlcrt:managed-provider>
<mssqlcrt:type>Microsoft.DataWarehouse.Design.OdbcSchema, Microsoft.DataWarehouse.AS</mssqlcrt:type>
</mssqlcrt:schema-class>
</mssqlcrt:schema-classes>
<mssqlcrt:capabilities>
<!-- MATH/TRIG Functions -->
<mssqlcrt:supports-func>ABS</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ACOS</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ASIN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ATAN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ACOT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>CEILING</mssqlcrt:supports-func>
<mssqlcrt:supports-func>COS</mssqlcrt:supports-func>
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
<mssqlcrt:supports-func>SQRT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SQRTPI</mssqlcrt:supports-func>
<mssqlcrt:supports-func>TAN</mssqlcrt:supports-func>

<!-- INFO Functions -->
<mssqlcrt:supports-func>CONTAINSROW</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ISBLANK</mssqlcrt:supports-func>

<!-- LOGICAL Functions -->
<mssqlcrt:supports-func>AND</mssqlcrt:supports-func>
<mssqlcrt:supports-func>IF</mssqlcrt:supports-func>
<mssqlcrt:supports-func>IF.EAGER</mssqlcrt:supports-func>
<mssqlcrt:supports-func>NOT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>OR</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SWITCH</mssqlcrt:supports-func>

<!-- DATETIME Functions -->

<mssqlcrt:supports-func>DATE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>DATEDIFF</mssqlcrt:supports-func>
<mssqlcrt:supports-func>DAY</mssqlcrt:supports-func>
<mssqlcrt:supports-func>EDATE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>EOMONTH</mssqlcrt:supports-func>
<mssqlcrt:supports-func>HOUR</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MINUTE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MONTH</mssqlcrt:supports-func>
<mssqlcrt:supports-func>QUARTER</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SECOND</mssqlcrt:supports-func>
<mssqlcrt:supports-func>TIME</mssqlcrt:supports-func>
<mssqlcrt:supports-func>WEEKDAY</mssqlcrt:supports-func>
<mssqlcrt:supports-func>WEEKNUM</mssqlcrt:supports-func>
<mssqlcrt:supports-func>YEAR</mssqlcrt:supports-func>

<!-- String Functions -->
<mssqlcrt:supports-func>COMBINEVALUES</mssqlcrt:supports-func>
<mssqlcrt:supports-func>CONCATENATE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>DATEVALUE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>EXACT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>FIND</mssqlcrt:supports-func>
<mssqlcrt:supports-func>LEFT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>LEN</mssqlcrt:supports-func>
<mssqlcrt:supports-func>LOWER</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MID</mssqlcrt:supports-func>
<mssqlcrt:supports-func>REPT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>RIGHT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SEARCH</mssqlcrt:supports-func>
<mssqlcrt:supports-func>SUBSTITUTE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>TIMEVALUE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>TRIM</mssqlcrt:supports-func>
<mssqlcrt:supports-func>UNICHAR</mssqlcrt:supports-func>
<mssqlcrt:supports-func>UNICODE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>UPPER</mssqlcrt:supports-func>
<mssqlcrt:supports-func>VALUE</mssqlcrt:supports-func>

<!-- Filter Functions -->
<mssqlcrt:supports-func>KEEPFILTERS</mssqlcrt:supports-func>
<mssqlcrt:supports-func>RELATED</mssqlcrt:supports-func>
<mssqlcrt:supports-func>USERELATIONSHIP</mssqlcrt:supports-func>

<!-- Aggregate Functions -->
<mssqlcrt:supports-func>SUM</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MINA</mssqlcrt:supports-func>
<mssqlcrt:supports-func>MAXA</mssqlcrt:supports-func>
<mssqlcrt:supports-func>AVERAGE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>AVERAGEA</mssqlcrt:supports-func>
<mssqlcrt:supports-func>STDEV.S</mssqlcrt:supports-func>
<mssqlcrt:supports-func>STDEV.P</mssqlcrt:supports-func>
<mssqlcrt:supports-func>VAR.S</mssqlcrt:supports-func>
<mssqlcrt:supports-func>VAR.P</mssqlcrt:supports-func>
<mssqlcrt:supports-func>COUNT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>COUNTA</mssqlcrt:supports-func>
<mssqlcrt:supports-func>COUNTROWS</mssqlcrt:supports-func>
<mssqlcrt:supports-func>DISTINCTCOUNT</mssqlcrt:supports-func>
<!--
TODO: We disable APPROXIMATEDISTINCTCOUNT() since older versions of SQL Server supported in this cartridge do not support it.
For versions that do support the function (e.g. Azure SQL), we manually enable them (see XLDQDatasourceCapabilities::PopulateDynamicDatasourceCaps())
Once support is changed or our infra is improved, we should globally re-enable it here and remove the manual allowlisting
-->
<!-- <mssqlcrt:supports-func>APPROXIMATEDISTINCTCOUNT</mssqlcrt:supports-func> -->
<mssqlcrt:supports-func>HASH</mssqlcrt:supports-func>

<!-- Engineering Functions -->
<mssqlcrt:supports-func>BITAND</mssqlcrt:supports-func>
<mssqlcrt:supports-func>BITOR</mssqlcrt:supports-func>
<mssqlcrt:supports-func>BITXOR</mssqlcrt:supports-func>
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
<mssqlcrt:sourceprovidertypename>
<supportedtypes>
<bigint>I8</bigint>
<bit>BOOL</bit>
<decimal>R8</decimal>
<int>I8</int>
<money>CY</money>
<numeric>R8</numeric>
<smallint>I8</smallint>
<smallmoney>CY</smallmoney>
<tinyint>I8</tinyint>
<float>R8</float>
<real>R8</real>
<date>DATE</date>
<datetime2>DATE</datetime2>
<datetime>DATE</datetime>
<datetimeoffset>DATE</datetimeoffset>
<smalldatetime>DATE</smalldatetime>
<time>DATE</time>
<char>STR</char>
<varchar>STR</varchar>
<nchar>STR</nchar>
<nvarchar>STR</nvarchar>
<text/>
<ntext/> <!-- intentionally leave TEXT and NTEXT blank to force conversion to (N)VARCHAR -->
<binary/>
<varbinary/>
<image/>
<cursor/>
<hierarchyid/>
<sql_variant/>
<table/>
<timestamp>DATE</timestamp>
<uniqueidentifier>STR</uniqueidentifier>
<xml/>
<geography/>
<geometry/>
</supportedtypes>
<unicode>
<nchar/>
<nvarchar/>
<ntext/>
<xml/>
</unicode>
<!-- SQL Server handles datetime literal on date column fine without implicit cast, so no special handling for date -->
<time format="hh:mm:ss">
<time/>
</time>
<agg_upcast>
<tinyint/>
<smallint/>
<int/>
<smallmoney/>
</agg_upcast>
<!-- SQL Server provider handles nvarchar correctly, so no special handling here unlike SAP HANA -->
<fixed_length_string_types>
<char/>
<nchar/>
</fixed_length_string_types>
</mssqlcrt:sourceprovidertypename>

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
<xsl:variable name="UnicodeStringPrefix" select="normalize-space($in_UnicodeStringPrefix)"/>
<xsl:variable name="StringQuotingCharacter" select="normalize-space($in_StringQuotingCharacter)"/>

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

<!-- Top clause																											 -->
<xsl:template match="Top">
TOP (<xsl:apply-templates select="./*[1]"/>) <xsl:apply-templates select="./TopPercent"/> <xsl:apply-templates select="./TopWithTies"/>
</xsl:template>

<xsl:template match="TopPercent">
PERCENT
</xsl:template>

<xsl:template match="TopWithTies">
WITH TIES
</xsl:template>
<!-- Select statement                                                 -->
<xsl:template match="Select">
<xsl:choose>
<xsl:when test="count(./ColumnExpressions/IsValidForIndexing) != 0">
SELECT OBJECTPROPERTY( object_id('<xsl:apply-templates select="./Sources/View"/>'), 'isindexable' )
</xsl:when>
<xsl:when test="name(..) != 'Statement' and count(.//Recursion) != 0">
<xsl:apply-templates select="./Sources/As/*[2]"/>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="name(..) != 'Statement' and name(..) != 'Insert' and name(..) != 'Union' and name(..) != 'UnionAll' and name(..) != 'OpCorrelationId' and name(..) != 'AddQueryHint'">
(
</xsl:when>
<xsl:when test="name(..) = 'Statement' and count(.//Recursion) != 0">
; WITH
<xsl:for-each select=".//Recursion">
<xsl:apply-templates select="."/>
<xsl:if test="position()!=last()">, </xsl:if>
</xsl:for-each>
</xsl:when>
</xsl:choose>
SELECT <xsl:apply-templates select="./Top"/>
<xsl:apply-templates select="./Distinct"/>
<xsl:apply-templates select="./ColumnExpressions"/>
<xsl:if test="count(../Phase) != 0">, COUNT_BIG(*) AS [COUNT_BIG_7673aff6-2445-4ef6-a4c9-7bf3d93bd42a] </xsl:if>
<xsl:apply-templates select="./Sources"/>
<xsl:apply-templates select="./Where"/>
<xsl:apply-templates select="./GroupBy"/>
<xsl:apply-templates select="./OrderBy"/>
<xsl:if test="name(..) = 'Statement'">
<xsl:text> </xsl:text><xsl:value-of select="$post-select-query-hint"/>
</xsl:if>
<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert' and name(..) != 'Union' and name(..) != 'UnionAll' and name(..) != 'OpCorrelationId' and name(..) != 'AddQueryHint'">
)
</xsl:if>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- Singleton clause                                                       -->
<xsl:template match="Singleton">
(SELECT <xsl:apply-templates select="./ColumnExpressions"/>
<xsl:text> ) </xsl:text>
</xsl:template>

<!-- Recursion fragment                                               -->
<xsl:template match="Recursion">
<xsl:variable name="cte-name">
<xsl:choose>
<xsl:when test="count(../Distinct) = 0 and name(../../..) != 'Union'">
[<xsl:value-of select="./Name"/>]
</xsl:when>
<xsl:otherwise>
[<xsl:value-of select="./Name"/>_e2__A9259451]
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$cte-name"/>
( <xsl:apply-templates select="./ColumnExpressions"/> )
AS
(
SELECT
<xsl:call-template name="print-children-list">
<xsl:with-param name="value-node" select="./ColumnExpressions"/>
</xsl:call-template>
<xsl:apply-templates select="./Sources"/>
<xsl:apply-templates select="./Where"/>
UNION ALL
SELECT
<xsl:call-template name="print-children-list">
<xsl:with-param name="value-node" select="./ColumnExpressions"/>
<xsl:with-param name="prefix" select="'[e2__A9259451-8A3F-4821-A7F0-10C7E3632D25]'"/>
</xsl:call-template>
FROM <xsl:apply-templates select="./Sources/As/*[1]"/> AS [e2__A9259451-8A3F-4821-A7F0-10C7E3632D25], <xsl:value-of select="$cte-name"/>
WHERE
(
<xsl:call-template name="print-children-pair-list">
<xsl:with-param name="value-node1" select="./Child"/>
<xsl:with-param name="value-node2" select="./Parent"/>
<xsl:with-param name="prefix1" select="$cte-name"/>
<xsl:with-param name="prefix2" select="'[e2__A9259451-8A3F-4821-A7F0-10C7E3632D25]'"/>
</xsl:call-template>
)
AND
<xsl:call-template name="print-children-pair-list">
<xsl:with-param name="value-node1" select="./Child"/>
<xsl:with-param name="value-node2" select="./Child"/>
<xsl:with-param name="prefix1" select="$cte-name"/>
<xsl:with-param name="prefix2" select="'[e2__A9259451-8A3F-4821-A7F0-10C7E3632D25]'"/>
<xsl:with-param name="connector" select="'&lt;&gt;'"/>
</xsl:call-template>
)
<xsl:if test="count(../Distinct) != 0">
,<xsl:value-of select="./Name"/>
( <xsl:apply-templates select="./ColumnExpressions"/> )
AS (
SELECT * FROM <xsl:value-of select="$cte-name"/>
)
</xsl:if>
<xsl:if test="name(../../..) = 'Union'">
,<xsl:value-of select="./Name"/>
( <xsl:apply-templates select="./ColumnExpressions"/> )
AS (
SELECT * FROM <xsl:value-of select="$cte-name"/>
UNION
<xsl:apply-templates select="../../../*[2]"/>
)
</xsl:if>
</xsl:template>

<!-- Update statement                                                 -->
<xsl:template match="Update">
UPDATE <xsl:apply-templates select="./Target"/>
<xsl:apply-templates select="./Where"/>
</xsl:template>

<xsl:template match="CloneTable">
Create Table <xsl:apply-templates select="./CloneTableName"/>
<xsl:apply-templates select="./CloneColumnDefinitions"/>
</xsl:template>

<xsl:template match="CloneTableName">
<xsl:value-of select="./text()"/>
</xsl:template>

<xsl:template match="CloneColumnDefinition">
<xsl:apply-templates select="./SQLColumn/Column"/>
<xsl:apply-templates select="./Type"/>
</xsl:template>

<xsl:template match="CloneColumnDefinitions">
(<xsl:call-template name="print-children-list"/>)
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
DROP <xsl:apply-templates select="./*"/>
</xsl:template>

<!-- Create statement                                                 -->
<xsl:template match="Create">
CREATE
<xsl:variable name="phase"><xsl:value-of select="./Phase"/></xsl:variable>
<xsl:choose>
<xsl:when test="number($phase)=1">
VIEW <xsl:apply-templates select="./View"/> ( <xsl:apply-templates select="./*[4]"/>, [COUNT_BIG_7673aff6-2445-4ef6-a4c9-7bf3d93bd42a] ) WITH SCHEMABINDING AS <xsl:apply-templates select="./*[5]"/>
</xsl:when>
<xsl:when test="number($phase)=2">
UNIQUE CLUSTERED INDEX <xsl:apply-templates select="./Index"/> ON <xsl:apply-templates select="./View"/> ( <xsl:apply-templates select="./*[4]"/> )
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
<xsl:choose>
<xsl:when test="name(./*[1]) = 'Table'"> ( <xsl:apply-templates select="./*[2]"/> )</xsl:when>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- Remote query (OPENROWSET)                                        -->
<xsl:template match="RemoteQuery">
OPENROWSET
(
<xsl:call-template name="quote-string"><xsl:with-param name="string" select="./Provider"/></xsl:call-template>,
<xsl:choose>
<xsl:when test="./DataSource">
<xsl:call-template name="quote-string"><xsl:with-param name="string" select="./DataSource"/></xsl:call-template>;<xsl:call-template name="quote-string"><xsl:with-param name="string" select="./UserName"/></xsl:call-template>;<xsl:call-template name="quote-string"><xsl:with-param name="string" select="./Password"/></xsl:call-template>,
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="quote-string"><xsl:with-param name="string" select="./ConnectionString"/></xsl:call-template>,
</xsl:otherwise>
</xsl:choose>
<xsl:call-template name="quote-string"><xsl:with-param name="string" select="./*[last()]"/></xsl:call-template>
)
</xsl:template>

<xsl:template match="Distinct">
DISTINCT
</xsl:template>

<xsl:template match="OpApproximateDistinctCountSkipBlank">
APPROX_COUNT_DISTINCT(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>


<!-- As construction for SQL 90 takes care of CTEs                    -->
<xsl:template match="As">
<xsl:choose>
<xsl:when test="count(.//Recursion) != 0">
<xsl:apply-templates select="./*[2]"/>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/> AS <xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="Sources">
FROM <xsl:choose>
<xsl:when test="count(./Join) != 0 or count(./Apply) != 0 or count(./CrossJoin)!= 0">
<xsl:apply-templates select="./Join"/>
<xsl:apply-templates select="./Apply"/>
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
<xsl:when test="$value-node = 'LeftOuterJoin'" > LEFT OUTER JOIN </xsl:when>
<xsl:when test="$value-node = 'RightOuterJoin'"> RIGHT OUTER JOIN </xsl:when>
<xsl:when test="$value-node = 'FullOuterJoin'" > FULL OUTER JOIN </xsl:when>
<xsl:when test="$value-node = 'InnerJoin'"     > INNER JOIN </xsl:when>
</xsl:choose>
<xsl:text>&#10;&#13;</xsl:text>
</xsl:template>

<xsl:template match="CrossJoin">
<xsl:text>&#10;&#13;</xsl:text>
<xsl:apply-templates select="./*[1]"/> cross join <xsl:apply-templates select="./*[2]"/>
<xsl:text>&#10;&#13;</xsl:text>
</xsl:template>

<xsl:template match="Apply">
(
<xsl:apply-templates select="./*[2]"/>
<xsl:call-template name="ApplyType"/>
<xsl:apply-templates select="./*[3]"/>
)
</xsl:template>

<xsl:template name="ApplyType">
<xsl:variable name="value-node">
<xsl:value-of select="normalize-space(./ApplyType/text())"/>
</xsl:variable>
<xsl:choose>
<xsl:when test="$value-node = 'CrossApply'">        cross apply        </xsl:when>
<xsl:when test="$value-node = 'OuterApply'">        outer apply        </xsl:when>
</xsl:choose>
</xsl:template>


<xsl:template match="TableValue">
(<xsl:apply-templates select="./RowValues"/>) AS <xsl:apply-templates select="./TableDefinition"/>
</xsl:template>

<xsl:template match="TableDefinition">
<xsl:apply-templates select="./Table"/>(<xsl:apply-templates select="./ColumnDefinitions"/>)
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

<!-- OpSynapseUBODiscovery -->
<xsl:template match="OpSynapseUBODiscovery">
SELECT 1
OPTION ( <xsl:apply-templates select="./QueryAnnotation"/> )
</xsl:template>

<!-- QueryAnnotation -->
<xsl:template match="QueryAnnotation">QUERYANNOTATION <xsl:call-template name="quote-string"><xsl:with-param name="string" select="."/></xsl:call-template> </xsl:template>

<!-- EngineEdition -->
<xsl:template match="EngineEdition">
SELECT 'EngineEdition', SERVERPROPERTY('EngineEdition')
</xsl:template>

<!-- Option -->
<xsl:template match="Option">
OPTION
(
<xsl:call-template name="print-children-list"/>
)
</xsl:template>

<!-- Label -->
<xsl:template match="Label">LABEL = <xsl:call-template name="quote-string"><xsl:with-param name="string" select="."/></xsl:call-template> </xsl:template>

<!-- OpCorrelationId -->
<xsl:template match="OpCorrelationId">
<xsl:param name="correlationid-value" select="@correlationid"/>
<!-- set client_correlation_id -->
EXEC sys.sp_set_session_context N'client_correlation_id', <xsl:if test="$correlationid-value !='NULL'">'</xsl:if><xsl:value-of select="@correlationid"/><xsl:if test="$correlationid-value !='NULL'">'</xsl:if>;
<xsl:apply-templates select="./*[1]"/>
<!-- turn off the client_correlation_id setting -->
EXEC sys.sp_set_session_context N'client_correlation_id', NULL;
</xsl:template>

<!-- AddQueryHint -->
<xsl:template match="AddQueryHint">
<!-- SELECT -->
<xsl:apply-templates select="./*[1]"/>
<!-- OPTION clause with query hint -->
<xsl:apply-templates select="./*[2]"/>;
</xsl:template>

<!-- HASH GROUP HASH JOIN -->
<xsl:template match="AdaptiveCachingOptimizerHint">
HASH JOIN, HASH GROUP
</xsl:template>

<!-- OpOLSDiscovery -->
<xsl:template match="OpOLSDiscovery">
<xsl:apply-templates select="./TableHasPermsByName" />
<xsl:apply-templates select="./ColumnHasPermsByName" />
</xsl:template>

<!-- TableHasPermsByName -->
<xsl:template match="TableHasPermsByName">
SELECT '<xsl:apply-templates select="./Table/Name"/>' as name, 0 as IsColumn, HAS_PERMS_BY_NAME('<xsl:apply-templates select="./Table"/>', 'OBJECT', 'SELECT') as PermCheckResult
<xsl:apply-templates select="./SingleUnionAll"/>
</xsl:template>

<!-- ColumnHasPermsByName -->
<xsl:template match="ColumnHasPermsByName">
SELECT '<xsl:apply-templates select="./SQLColumn"/>' as name, 1 as IsColumn, HAS_PERMS_BY_NAME('<xsl:apply-templates select="./Table"/>', 'OBJECT', 'SELECT', '<xsl:apply-templates select="./SQLColumn/Column/Name"/>', 'COLUMN') as PermCheckResult
<xsl:apply-templates select="./SingleUnionAll"/>
</xsl:template>

<!-- SingleUnionAll -->
<xsl:template match="SingleUnionAll">
UNION ALL
</xsl:template>

<xsl:template match="Exists">
EXISTS <xsl:apply-templates select="./*"/>
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
<xsl:if test="name(../../..) != 'Recursion' and (name(..)!='Count' or name(./Column/*[1]) != 'Asterisk')"><xsl:apply-templates select="./Table"/></xsl:if>
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

<xsl:template match="Recursion/Name">
<xsl:call-template name="quote-identifier"/>
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
COALESCE(<xsl:apply-templates select="./*[1]"/>, CAST(-2 AS datetime))
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
<xsl:when test="(/Statement[not(@DQInlineParams)]) and ($UseParams = 'yes' or $UseParams = 'nosubsel')">
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

<xsl:template match="InlineParameter">
<xsl:call-template name="print-non-parametric-parameter">
<xsl:with-param name="parameter" select="./Parameter"/>
</xsl:call-template>
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
<!-- Count/Min/Max/Sum -->
<xsl:template match="Min|Max|Sum">
<xsl:variable name="function">
<xsl:choose>
<xsl:when test="name()='Min'">MIN</xsl:when>
<xsl:when test="name()='Max'">MAX</xsl:when>
<xsl:when test="name()='Sum'">SUM</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$function"/>(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="Count">COUNT_BIG(<xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./*[2]"/>)</xsl:template>

<!-- /Stdev/Stdevp/Var/Varp/Avg                                         -->
<xsl:template match="Stdev|Stdevp|Var|Varp|Avg">
<xsl:variable name="function">
<xsl:choose>
<xsl:when test="name()='Stdev'"> STDEV </xsl:when>
<xsl:when test="name()='Stdevp'"> STDEVP </xsl:when>
<xsl:when test="name()='Var'"> VAR </xsl:when>
<xsl:when test="name()='Varp'"> VARP </xsl:when>
<xsl:when test="name()='Avg'"> AVG </xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$function"/>( <xsl:apply-templates select="./*[1]"/> )
</xsl:template>

<!-- TableToScalar -->
<xsl:template match="OpTableToScalar">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
((SELECT MIN(<xsl:apply-templates select="./*[1]"/>)) UNION (SELECT MAX(<xsl:apply-templates select="./*[1]"/>)))
</xsl:when>
<xsl:otherwise>
(CASE WHEN COUNT_BIG(*) = COUNT_BIG(<xsl:apply-templates select="./*[1]"/>) THEN ((SELECT MIN(<xsl:apply-templates select="./*[1]"/>)) UNION (SELECT MAX(<xsl:apply-templates select="./*[1]"/>))) ELSE ((SELECT MIN(<xsl:apply-templates select="./*[1]"/>)) UNION (SELECT NULL)) END)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- CountBlank -->
<xsl:template match="OpCountBlank">
SUM(CASE WHEN (<xsl:apply-templates select="./*[1]"/>) IS NULL THEN CAST(1 AS BIGINT) END)
</xsl:template>

<!-- CountSubqueryRows -->
<!-- Note that this operator, unlike OpCount and OpCountBlank, does not return NULL when count is 0. -->
<!-- Currently this operator is used internally and its result is assumed to be not NULL. -->
<!-- SQL Server 2005 and 2008 crash badly on COUNT_BIG(*) OVER () -->
<xsl:template match="OpCountSubqueryRows">
SUM(CAST(1 AS BIGINT)) OVER ()
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

<xsl:template match="OpBITAND">
(<xsl:apply-templates select="./*[1]"/> &amp; <xsl:apply-templates select="./*[2]"/>)
</xsl:template>
<xsl:template match="OpBITOR|OpBITXOR">
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
<xsl:when test="name()='OpBITOR'">(<xsl:value-of select="$Op1"/> | <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpBITXOR'">(<xsl:value-of select="$Op1"/> ^ <xsl:value-of select="$Op2"/>)</xsl:when>
</xsl:choose>
</xsl:template>
<!-- Unary string functions	-->

<xsl:template match="OpLower">
LOWER(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpUpper">
UPPER(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpLen">
LEN(<xsl:apply-templates select="./*[1]"/>)
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

<!-- LEN trims trailing spaces (including a string of spaces only) in SQL, but not in DAX -->
<xsl:template match="OpLEN">LEN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>

<!-- The inner cast is to extract only the date portion of a string such as 2016-08-10 17:35:00. -->
<!-- The outer cast is to convert to DATETIME so that operations like +/- numerical value can work. -->
<xsl:template match="OpDATEVALUE">CAST(CAST(<xsl:apply-templates select="./*[1]"/> AS DATE) AS DATETIME)</xsl:template>

<xsl:template match="OpUNICHAR">NCHAR(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpUNICODE">UNICODE(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpVALUE">CAST(<xsl:apply-templates select="./*[1]"/> AS FLOAT)</xsl:template>

<!-- Unlike DAX, spaces in the middle are not trimmed. -->
<!-- Unlike UPPER/LOWER, TRIM removes padding spaces of CHAR/NCHAR -->
<xsl:template match="OpTRIM">RTRIM(LTRIM(<xsl:apply-templates select="./*[1]"/>))</xsl:template>

<!-- Rounding of fraction of a second is different from DAX -->
<xsl:template match="OpTIMEVALUE">DATEADD(SECOND, DATEDIFF(SECOND, 0, CAST(<xsl:apply-templates select="./*[1]"/> AS TIME)), '1899-12-30')</xsl:template>
<xsl:template match="OpRAND">RAND()</xsl:template>
<!--
Unary expressions where NULL considered as BLANK value(more like 0).
-->

<!-- Not  -->
<xsl:template match="Not">
NOT(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpNot">
NOT(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<!-- OpNot_Deprecated and BitNot  -->
<!-- Do not use SQL NOT because we need to handle UNKNOWN in a special way -->
<xsl:template match="OpNot_Deprecated">
CAST((CASE WHEN (<xsl:apply-templates select="./*[1]"/>) THEN 0 ELSE 1 END) AS BIT)
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

<!-- UnaryMinus -->
<xsl:template match="UnaryMinus">(-<xsl:apply-templates select="./*[1]"/>)</xsl:template>

<!-- Unary Excel math functions that NULL is a fixed point. -->
<xsl:template match="OpAbs|OpCeiling|OpFloor|OpSign|OpSqrt|OpSqr">
<xsl:variable name="OpName">
<xsl:choose>
<xsl:when test="name()='OpAbs'">ABS</xsl:when>
<xsl:when test="name()='OpCeiling'">CEILING</xsl:when>
<xsl:when test="name()='OpFloor'">FLOOR</xsl:when>
<xsl:when test="name()='OpSign'">SIGN</xsl:when>
<xsl:when test="name()='OpSqrt'">SQRT</xsl:when>
<xsl:when test="name()='OpSqr'">SQUARE</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$OpName"/>(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<!-- Unary Excel math functions that NULL is NOT a fixed point. -->
<xsl:template match="OpExp|OpLn|OpLg">
<xsl:variable name="OpName">
<xsl:choose>
<xsl:when test="name()='OpExp'">EXP</xsl:when>
<xsl:when test="name()='OpLn'">LOG</xsl:when>
<xsl:when test="name()='OpLg'">LOG10</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:value-of select="$OpName"/>(<xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$OpName"/>(COALESCE((<xsl:apply-templates select="./*[1]"/>), 0))
</xsl:otherwise>
</xsl:choose>
</xsl:template>


<!-- Count Rows                                                                 -->
<xsl:template match="OpCount">
COUNT_BIG(<xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./*[2]"/>)
</xsl:template>

<!-- FUTURE: Avoid the redundant COUNT_BIG(DISTINCT ), either by using a subquery, or doing a projection on the results -->
<xsl:template match="OpDistinctCount">
(COUNT_BIG(DISTINCT <xsl:apply-templates select="./*[1]"/>) + MAX(CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL THEN 1 ELSE 0 END))
</xsl:template>

<!-- FUTURE: Avoid the redundant COUNT_BIG(DISTINCT ), either by using a subquery, or doing a projection on the results -->
<xsl:template match="OpDistinctCountSkipBlank">
COUNT_BIG(DISTINCT <xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpCount_Deprecated">
(CASE WHEN COUNT_BIG(<xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./*[2]"/>) = 0 THEN NULL ELSE COUNT_BIG(<xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./*[2]"/>) END)
</xsl:template>

<xsl:template match="OpABS">ABS(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpASIN">ASIN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpATAN">ATAN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpDEGREES">DEGREES(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpINT">FLOOR(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpRADIANS">RADIANS(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSIGN">SIGN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSIN">SIN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSQRT">SQRT(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpTAN">TAN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>

<xsl:template match="OpSQRTPI">SQRT(<xsl:apply-templates select="./*[1]"/> * PI())</xsl:template>

<xsl:template match="OpACOS|OpACOT|OpCOS|OpCOT|OpEXP|OpLN|OpLOG10">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"><xsl:apply-templates select="./*[1]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpACOS'">ACOS(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpACOT'">(PI()/2 - ATAN(<xsl:value-of select="$Op1"/>))</xsl:when>
<xsl:when test="name()='OpCOS'">COS(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpCOT'">COT(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpEXP'">EXP(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpLN'">LOG(<xsl:value-of select="$Op1"/>)</xsl:when>
<xsl:when test="name()='OpLOG10'">LOG10(<xsl:value-of select="$Op1"/>)</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpDAY">DAY(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpMONTH">MONTH(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpQUARTER">DATEPART(QUARTER, <xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpYEAR">YEAR(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpHOUR">DATEPART(HOUR, <xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpMINUTE">DATEPART(MINUTE, <xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSECOND">DATEPART(SECOND, <xsl:apply-templates select="./*[1]"/>)</xsl:template>

<xsl:template match="OpWEEKNUM">
<!-- We are making assumptions here. In theory, we need to check SELECT @@DATEFIRST and generate SQL accordingly. -->
<xsl:choose>
<xsl:when test="@WeekBeginsOn='Sunday' and @System='1'">DATEPART(WEEK, <xsl:apply-templates select="./*[1]"/>)</xsl:when>
<xsl:when test="@WeekBeginsOn='Monday' and @System='2'">DATEPART(ISO_WEEK, <xsl:apply-templates select="./*[1]"/>)</xsl:when>
<xsl:otherwise>
<xsl:message terminate="yes">Cartridge error: Unsupported parameters for OpWEEKNUM.</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="OpWEEKDAY">
<!-- We are making assumptions here. In theory, we need to check SELECT @@DATEFIRST and generate SQL accordingly. -->
<xsl:choose>
<xsl:when test="@WeekBeginsOn='Sunday' and @FirstDayIndex='1'">DATEPART(WEEKDAY, <xsl:apply-templates select="./*[1]"/>)</xsl:when>
<xsl:when test="@WeekBeginsOn='Monday' and @FirstDayIndex='1'">DATEPART(WEEKDAY, DATEADD(DAY, -1, <xsl:apply-templates select="./*[1]"/>))</xsl:when>
<xsl:when test="@WeekBeginsOn='Tuesday' and @FirstDayIndex='1'">DATEPART(WEEKDAY, DATEADD(DAY, -2, <xsl:apply-templates select="./*[1]"/>))</xsl:when>
<xsl:when test="@WeekBeginsOn='Wednesday' and @FirstDayIndex='1'">DATEPART(WEEKDAY, DATEADD(DAY, -3, <xsl:apply-templates select="./*[1]"/>))</xsl:when>
<xsl:when test="@WeekBeginsOn='Thursday' and @FirstDayIndex='1'">DATEPART(WEEKDAY, DATEADD(DAY, -4, <xsl:apply-templates select="./*[1]"/>))</xsl:when>
<xsl:when test="@WeekBeginsOn='Friday' and @FirstDayIndex='1'">DATEPART(WEEKDAY, DATEADD(DAY, -5, <xsl:apply-templates select="./*[1]"/>))</xsl:when>
<xsl:when test="@WeekBeginsOn='Saturday' and @FirstDayIndex='1'">DATEPART(WEEKDAY, DATEADD(DAY, -6, <xsl:apply-templates select="./*[1]"/>))</xsl:when>
<xsl:when test="@WeekBeginsOn='Monday' and @FirstDayIndex='0'">(DATEPART(WEEKDAY, DATEADD(DAY, -1, <xsl:apply-templates select="./*[1]"/>)) - 1)</xsl:when>
<xsl:otherwise>
<xsl:message terminate="yes">Cartridge error: Unsupported parameters for OpWEEKDAY.</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template><xsl:template match="OpInList">(<xsl:call-template name="print-children-list"/>)</xsl:template>

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
FUTURE: alleonov: maybe replace prefix Op with something else
-->
<!--Comparisons-->
<xsl:template match="OpGreater|OpLess|OpNotEqual|OpEqual|OpGreaterOrEqual|OpLessOrEqual">
<xsl:variable name="operator">
<xsl:choose>
<xsl:when test="name()='OpGreater'"> &gt; </xsl:when>
<xsl:when test="name()='OpLess'"> &lt; </xsl:when>
<xsl:when test="name()='OpNotEqual'"> &lt;&gt; </xsl:when>
<xsl:when test="name()='OpEqual'"> = </xsl:when>
<xsl:when test="name()='OpGreaterOrEqual'"> &gt;= </xsl:when>
<xsl:when test="name()='OpLessOrEqual'"> &lt;= </xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="(@Op1Nullable = 'false' and @Op2Nullable = 'false' and @Op1SourceProviderType = 'uniqueidentifier' and @Op2SourceProviderType = 'uniqueidentifier')">
(<xsl:apply-templates select="./*[1]"/> <xsl:value-of select="$operator"/> <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:otherwise>
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType = 'uniqueidentifier'">
CAST(<xsl:apply-templates select="./*[1]"/> AS VARCHAR(64))
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="@Op1SourceProviderType = 'uniqueidentifier'">COALESCE(CAST(<xsl:apply-templates select="./*[1]"/> AS VARCHAR(64)), '')</xsl:when>
<xsl:when test="@Op1Type = 'String'">COALESCE(<xsl:apply-templates select="./*[1]"/>, '')</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">COALESCE(<xsl:apply-templates select="./*[1]"/>, CAST(-2 AS datetime))</xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2SourceProviderType = 'uniqueidentifier'">
CAST(<xsl:apply-templates select="./*[2]"/> AS VARCHAR(64))
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="@Op2SourceProviderType = 'uniqueidentifier'">COALESCE(CAST(<xsl:apply-templates select="./*[2]"/> AS VARCHAR(64)), '')</xsl:when>
<xsl:when test="@Op2Type = 'String'">COALESCE(<xsl:apply-templates select="./*[2]"/>, '')</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">COALESCE(<xsl:apply-templates select="./*[2]"/>, CAST(-2 AS datetime))</xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
(<xsl:value-of select="$Op1"/> <xsl:value-of select="$operator"/> <xsl:value-of select="$Op2"/>)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpIs-->
<xsl:template match="OpIs">
<xsl:choose>
<xsl:when test="(@Op1Nullable = 'false' or @Op2Nullable = 'false') and @ResolveCollationConflict='true'">
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> COLLATE DATABASE_DEFAULT)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' or @Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@OpsAreColRefs = 'true' and @ResolveCollationConflict='true'">
<!--It's illegal to repeat query parameters more than once, so we can use only column references here.-->
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> COLLATE DATABASE_DEFAULT OR <xsl:apply-templates select="./*[1]"/> IS NULL AND <xsl:apply-templates select="./*[2]"/> IS NULL)
</xsl:when>
<xsl:when test="@OpsAreColRefs = 'true'">
<!--It's illegal to repeat query parameters more than once, so we can use only column references here.-->
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> OR <xsl:apply-templates select="./*[1]"/> IS NULL AND <xsl:apply-templates select="./*[2]"/> IS NULL)
</xsl:when>
<xsl:otherwise>
<!--Do the same as in "OpsAreColRefs = 'true'" branch, but repeating parameters only once here -> expression is more complicated.-->
((SELECT CASE WHEN Op1 = Op2 OR Op1 IS NULL AND Op2 IS NULL THEN 1 ELSE 0 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictGreater-->
<xsl:template match="OpStrictGreater">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &gt; <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END)  FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END)  FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)</xsl:when>
<xsl:otherwise>((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END END)  FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)</xsl:otherwise>
</xsl:choose>
</xsl:template>
<!-- OpStrictLess-->
<xsl:template match="OpStrictLess">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &lt; <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END)  FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END)  FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)</xsl:when>
<xsl:otherwise>((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END END)  FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)</xsl:otherwise>
</xsl:choose>
</xsl:template>
<!-- OpStrictLessOrEqual-->
<xsl:template match="OpStrictLessOrEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &lt;= <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 0)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 0)</xsl:when>
<xsl:otherwise>((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &gt; Op2 THEN 1 ELSE 0 END END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 0)</xsl:otherwise>
</xsl:choose>
</xsl:template>
<!-- OpStrictGreaterOrEqual-->
<xsl:template match="OpStrictGreaterOrEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &gt;= <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 0)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT (CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 0)</xsl:when>
<xsl:otherwise>((SELECT (CASE WHEN Op2 IS NULL THEN CASE WHEN Op1 &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 IS NULL THEN CASE WHEN Op2 &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END ELSE CASE WHEN Op1 &lt; Op2 THEN 1 ELSE 0 END END END) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 0)</xsl:otherwise>
</xsl:choose>
</xsl:template>
<!-- OpStrictNotEqual-->
<xsl:template match="OpStrictNotEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &lt;&gt; <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT CASE WHEN Op2 IS NULL THEN 0 ELSE CASE WHEN Op1 = Op2 THEN 1 ELSE 0 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 0)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT CASE WHEN Op1 IS NULL THEN 0 ELSE CASE WHEN Op1 = Op2 THEN 1 ELSE 0 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 0)</xsl:when>
<xsl:otherwise>((SELECT CASE WHEN Op1 = Op2 OR (Op1 IS NULL AND Op2 IS NULL) THEN 1 ELSE 0 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 0)</xsl:otherwise>
</xsl:choose>
</xsl:template>
<!-- OpStrictEqual-->
<xsl:template match="OpStrictEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(-2 AS datetime)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">((SELECT CASE WHEN Op2 IS NULL THEN 0 ELSE CASE WHEN Op1 = Op2 THEN 1 ELSE 0 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">((SELECT CASE WHEN Op1 IS NULL THEN 0 ELSE CASE WHEN Op1 = Op2 THEN 1 ELSE 0 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)</xsl:when>
<xsl:otherwise>((SELECT CASE WHEN Op1 = Op2 OR (Op1 IS NULL AND Op2 IS NULL) THEN 1 ELSE 0 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) as AuxTable) = 1)</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpAdd-->
<xsl:template match="OpAdd">
<xsl:choose>
<xsl:when test="@Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset' or @Op1SourceProviderType='smalldatetime'">
CAST(<xsl:apply-templates select="./*[1]"/> AS DATETIME)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='date' or @Op2SourceProviderType='datetime2' or @Op2SourceProviderType='datetimeoffset' or @Op2SourceProviderType='smalldatetime'">
CAST(<xsl:apply-templates select="./*[2]"/> AS DATETIME)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
(SELECT COALESCE(Op1 + CAST(Op2 + 2 AS FLOAT), Op1, Op2) FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset'">
CAST(<xsl:apply-templates select="./*[1]"/> AS DATETIME)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
(SELECT COALESCE(Op1 + Op2, Op1) FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(Op1 + Op2, Op1, CAST(Op2 - 2 AS DATETIME)) FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='date' or @Op2SourceProviderType='datetime2' or @Op2SourceProviderType='datetimeoffset'">
CAST(<xsl:apply-templates select="./*[2]"/> AS DATETIME)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
(SELECT COALESCE(Op1 + Op2, Op2) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(Op1 + Op2, CAST(Op1 - 2 AS DATETIME), Op2) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/> + <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
(SELECT COALESCE(Op1 + Op2, Op1) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
(SELECT COALESCE(<xsl:apply-templates select="./*[1]"/> + Op2, Op2) FROM (SELECT <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(Op1 + Op2, Op1, Op2) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpSubtract -->
<xsl:template match="OpSubtract">
<xsl:choose>
<xsl:when test="@Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset' or @Op1SourceProviderType='smalldatetime'">
CAST(<xsl:apply-templates select="./*[1]"/> AS DATETIME)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='date' or @Op2SourceProviderType='datetime2' or @Op2SourceProviderType='datetimeoffset' or @Op2SourceProviderType='smalldatetime'">
CAST(<xsl:apply-templates select="./*[2]"/> AS DATETIME)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
(SELECT COALESCE(Op1 - CAST(Op2 + 2 AS FLOAT), Op1, -2 - (Op2 + 2)) FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset'">
CAST(<xsl:apply-templates select="./*[1]"/> AS DATETIME)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
(SELECT COALESCE(Op1 - Op2, Op1) FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(Op1 - Op2, Op1, CAST(-2 - Op2 AS DATETIME)) FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="@Op2Type = 'Datetime' and @Op2Nullable = 'false'">
(SELECT COALESCE(-2 + (Op1- (Op2 + 2)), -2 - (Op2 + 2)) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">
(SELECT COALESCE(-2 +(Op1-  (Op2 + 2)), CAST(Op1 - 2 AS DATETIME), -2 - (Op2 + 2)) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/> - <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
(SELECT COALESCE(Op1 - Op2, Op1) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
(SELECT COALESCE(<xsl:apply-templates select="./*[1]"/> - Op2, -Op2) FROM (SELECT <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(Op1 - Op2, Op1, -Op2) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpDivide                                                           -->
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

<!-- OpMultiply                                                           -->
<xsl:template match="OpMultiply">
<xsl:choose>
<xsl:when test="@Op1Type = 'Currency' and @Op2Type = 'Currency'">
(<xsl:apply-templates select="./*[1]"/> *
(<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'Currency'"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>))
</xsl:when>
<xsl:when test="@Op1Type = 'Double' and @Op2Type = 'Currency' or @Op2Type = 'Double' and @Op1Type = 'Currency'">
<!--FUTURE: RT: it's impossible to use <xsl:call-template name="OpCast"/> here,
so using direct cast. It gives us desired result here.          -->
CAST(<xsl:apply-templates select="./*[1]"/> * <xsl:apply-templates select="./*[2]"/> AS money)
</xsl:when>
<xsl:otherwise>
(<xsl:apply-templates select="./*[1]"/> * <xsl:apply-templates select="./*[2]"/>)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpSafeDivide                                                           -->
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
<!-- ***** End of part from OpDivide.       ***** -->
(SELECT
CASE
WHEN Op1 IS NULL THEN NULL
ELSE
CASE WHEN Op2 IS NULL OR Op2 = 0 THEN Op3 ELSE Op1 / Op2 END
END
FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2, <xsl:apply-templates select="./*[3]"/> AS Op3) AS AuxTable
)
</xsl:template>


<!-- OpOr|OpAnd -->
<xsl:template match="OpOr|OpAnd">
<xsl:variable name="operator">
<xsl:choose>
<xsl:when test="name()='OpOr'"> OR </xsl:when>
<xsl:when test="name()='OpAnd'"> AND </xsl:when>
</xsl:choose>
</xsl:variable>
(<xsl:apply-templates select="./*[1]"/> <xsl:value-of select="$operator"/> <xsl:apply-templates select="./*[2]"/>)
</xsl:template>


<!-- Round -->
<xsl:template match="OpRound_Deprecated">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
ROUND(<xsl:apply-templates select="./*[1]"/>, <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:otherwise>
ROUND(<xsl:apply-templates select="./*[1]"/>, COALESCE(<xsl:apply-templates select="./*[2]"/>, 0))
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- Trunc | RoundDown -->
<xsl:template match="OpTrunc">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
ROUND((<xsl:apply-templates select="./*[1]"/>), (<xsl:apply-templates select="./*[2]"/>), 1)
</xsl:when>
<xsl:otherwise>
ROUND((<xsl:apply-templates select="./*[1]"/>), COALESCE((<xsl:apply-templates select="./*[2]"/>), 0), 1)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- MOD -->
<xsl:template match="OpMod">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
(SELECT Op1 - Op2 * FLOOR(Op1 / Op2) FROM (SELECT (<xsl:apply-templates select="./*[1]"/>) AS Op1, (<xsl:apply-templates select="./*[2]"/>) AS Op2) AS AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT Op1 - Op2 * FLOOR(Op1 / Op2) FROM (SELECT (<xsl:apply-templates select="./*[1]"/>) AS Op1, COALESCE((<xsl:apply-templates select="./*[2]"/>), 0) AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- QUOTIENT -->
<xsl:template match="OpQuotient">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
ROUND((<xsl:apply-templates select="./*[1]"/>) / (<xsl:apply-templates select="./*[2]"/>), 0, 1)
</xsl:when>
<xsl:otherwise>
ROUND((<xsl:apply-templates select="./*[1]"/>) / COALESCE((<xsl:apply-templates select="./*[2]"/>), 0), 0, 1)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- LOG -->
<xsl:template match="OpLog">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
(LOG(<xsl:apply-templates select="./*[1]"/>) / LOG(<xsl:apply-templates select="./*[2]"/>))
</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
(LOG(<xsl:apply-templates select="./*[1]"/>) / LOG(COALESCE((<xsl:apply-templates select="./*[2]"/>), 0)))
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
(LOG(COALESCE((<xsl:apply-templates select="./*[1]"/>), 0)) / LOG(<xsl:apply-templates select="./*[2]"/>))
</xsl:when>
<xsl:otherwise>
(LOG(COALESCE((<xsl:apply-templates select="./*[1]"/>), 0)) / LOG(COALESCE((<xsl:apply-templates select="./*[2]"/>), 0)))
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- POWER -->
<xsl:template match="OpPower">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
POWER((<xsl:apply-templates select="./*[1]"/>), (<xsl:apply-templates select="./*[2]"/>))
</xsl:when>
<xsl:otherwise>
POWER((<xsl:apply-templates select="./*[1]"/>), COALESCE((<xsl:apply-templates select="./*[2]"/>), 0))
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- ISNULL -->
<xsl:template match="OpIsNull">
COALESCE((<xsl:apply-templates select="./*[1]"/>), (<xsl:apply-templates select="./*[2]"/>))
</xsl:template>

<!-- SimpleMod, when you guarantee that two operands are natural numbers -->
<!--            Do not handle nulls. Be careful with negative integers. -->
<xsl:template match="OpSimpleMod">
(<xsl:apply-templates select="./*[1]"/>) % (<xsl:apply-templates select="./*[2]"/>)
</xsl:template>

<!-- OpIntegerDivide -->
<xsl:template match="OpIntegerDivide">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
((<xsl:apply-templates select="./*[1]"/>) / (<xsl:apply-templates select="./*[2]"/>))
</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
((<xsl:apply-templates select="./*[1]"/>) / COALESCE((<xsl:apply-templates select="./*[2]"/>), 0))
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
(COALESCE((<xsl:apply-templates select="./*[1]"/>), 0) / (<xsl:apply-templates select="./*[2]"/>))
</xsl:when>
<xsl:otherwise>
(COALESCE((<xsl:apply-templates select="./*[1]"/>), 0) / COALESCE((<xsl:apply-templates select="./*[2]"/>), 0))
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpMin w/o type casting. See DXScaExpr_MinMax::DoBuildSQLQuery() for how type casting is done. -->
<xsl:template match="OpMin">
<xsl:variable name="Op1CompareOperand">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"> Op1 </xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">COALESCE(Op1, '')</xsl:when>
<xsl:otherwise>COALESCE(Op1, 0)</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2CompareOperand">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"> Op2 </xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">COALESCE(Op2, '')</xsl:when>
<xsl:otherwise>COALESCE(Op2, 0)</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
(SELECT CASE WHEN <xsl:value-of select="$Op1CompareOperand"/> &lt; <xsl:value-of select="$Op2CompareOperand"/> THEN Op1 ELSE Op2 END FROM (SELECT (<xsl:apply-templates select="./*[1]"/>) AS Op1, (<xsl:apply-templates select="./*[2]"/>) AS Op2) AS AuxTable)
</xsl:template>

<!-- OpMax w/o type casting. See DXScaExpr_MinMax::DoBuildSQLQuery() for how type casting is done. -->
<xsl:template match="OpMax">
<xsl:variable name="Op1CompareOperand">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"> Op1 </xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">COALESCE(Op1, '')</xsl:when>
<xsl:otherwise>COALESCE(Op1, 0)</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2CompareOperand">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"> Op2 </xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">COALESCE(Op2, '')</xsl:when>
<xsl:otherwise>COALESCE(Op2, 0)</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
(SELECT CASE WHEN <xsl:value-of select="$Op1CompareOperand"/> &gt; <xsl:value-of select="$Op2CompareOperand"/> THEN Op1 ELSE Op2 END FROM (SELECT (<xsl:apply-templates select="./*[1]"/>) AS Op1, (<xsl:apply-templates select="./*[2]"/>) AS Op2) AS AuxTable)
</xsl:template>

<!-- MAX/MIN differ from DAX by converting BLANK to 0 to keep SQL expressions simple -->
<xsl:template match="OpMAX|OpMIN">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"><xsl:apply-templates select="./*[1]"/></xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">COALESCE(<xsl:apply-templates select="./*[1]"/>, '')</xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">COALESCE(<xsl:apply-templates select="./*[2]"/>, '')</xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpMAX'">(SELECT MAX(Op1) FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1 UNION ALL SELECT <xsl:value-of select="$Op2"/> AS Op1) AS AuxTable)</xsl:when>
<xsl:when test="name()='OpMIN'">(SELECT MIN(Op1) FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1 UNION ALL SELECT <xsl:value-of select="$Op2"/> AS Op1) AS AuxTable)</xsl:when>
</xsl:choose>
</xsl:template>

<!-- OpMOD|OpPOWER|OpQUOTIENT|OpROUND|OpTRUNC|OpROUNDDOWN|OpROUNDUP|OpMROUND|OpCEILING|OpISO.CEILING -->
<xsl:template match="OpMOD|OpPOWER|OpQUOTIENT|OpROUND|OpTRUNC|OpROUNDDOWN|OpROUNDUP|OpMROUND|OpCEILING|OpISO.CEILING">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpMOD'">(SELECT Op1 - Op2 * FLOOR(Op1 / Op2) FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)</xsl:when>
<xsl:when test="name()='OpPOWER'">POWER(CAST(<xsl:apply-templates select="./*[1]"/> AS FLOAT), <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpQUOTIENT'">
<xsl:choose>
<xsl:when test="@Op1Type = 'Integer' and @Op2Type = 'Integer'">
(<xsl:apply-templates select="./*[1]"/> / <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:otherwise>
ROUND(<xsl:apply-templates select="./*[1]"/> / <xsl:value-of select="$Op2"/>, 0, 1)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpROUND'">ROUND(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpTRUNC' or name()='OpROUNDDOWN'">ROUND(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>, 1)</xsl:when>
<xsl:when test="name()='OpROUNDUP'">(SELECT CEILING(ABS(Op1) * Op2) * SIGN(Op1) / Op2 FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, POWER(10.0, <xsl:value-of select="$Op2"/>) AS Op2) AS AuxTable)</xsl:when>
<xsl:when test="name()='OpMROUND'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
(SELECT CASE WHEN Op2 = 0 THEN 0 ELSE ROUND(Op1/Op2, 0)*Op2 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op1 IS NULL THEN NULL ELSE CASE WHEN Op2 = 0 THEN 0 ELSE ROUND(Op1/Op2, 0)*Op2 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpCEILING'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2Static=1">
CEILING(<xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op2 = 0 THEN 0 ELSE CEILING(Op1/Op2)*Op2 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op1 IS NULL THEN NULL ELSE CASE WHEN Op2 = 0 THEN 0 ELSE CEILING(Op1/Op2)*Op2 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpISO.CEILING'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2Static=1">
CEILING(<xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op2 = 0 THEN 0 ELSE CEILING(Op1/Op2)*Op2 END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, ABS(<xsl:value-of select="$Op2"/>) AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN Op1 IS NULL THEN NULL ELSE CASE WHEN Op2 = 0 THEN 0 ELSE CEILING(Op1/Op2)*Op2 END END FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, ABS(<xsl:value-of select="$Op2"/>) AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpLOG">
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
<xsl:when test="name()='OpLOG'">LOG(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
</xsl:choose>
</xsl:template>
<!--
Binary text functions expressions where NULL considered as 0.
-->
<!--Left, Right-->
<xsl:template match="OpLeft|OpRight">
<xsl:variable name="funcName">
<xsl:choose>
<xsl:when test="name()='OpLeft'">	LEFT			</xsl:when>
<xsl:when test="name()='OpRight'">	RIGHT			</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:variable name="op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"> (<xsl:apply-templates select="./*[2]"/>) </xsl:when>
<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[2]"/>, 0) </xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$funcName"/>(<xsl:apply-templates select="./*[1]"/>,<xsl:value-of select="$op2"/>)
</xsl:template>

<!--Rept-->
<xsl:template match="OpRept">
<xsl:variable name="op1">
<xsl:call-template name="OpCast">
<xsl:with-param name="target-type" select="'String'"/>
<xsl:with-param name="value-node" select="./*[1]"/>
</xsl:call-template>
</xsl:variable>
<xsl:variable name="op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"> (<xsl:apply-templates select="./*[2]"/>) </xsl:when>
<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[2]"/>, 0) </xsl:otherwise>
</xsl:choose>
</xsl:variable>
REPLICATE(<xsl:value-of select="$op1"/>, <xsl:value-of select="$op2"/>)
</xsl:template>

<xsl:template match="OpExact">
<xsl:variable name="op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"> (<xsl:apply-templates select="./*[1]"/>) </xsl:when>
<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[1]"/>, '') </xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"> (<xsl:apply-templates select="./*[2]"/>) </xsl:when>
<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[2]"/>, '') </xsl:otherwise>
</xsl:choose>
</xsl:variable>
(SELECT CASE WHEN DATALENGTH(AuxTable.Op1) = DATALENGTH(AuxTable.Op2) AND AuxTable.Op1 = AuxTable.Op2 COLLATE Latin1_General_Bin THEN 1 ELSE 0 END FROM (SELECT <xsl:value-of select="$op1"/> AS Op1, <xsl:value-of select="$op2"/> AS Op2) AS AuxTable)
</xsl:template>

<xsl:template match="OpConcatenate">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
CAST(<xsl:apply-templates select="./*[1]"/> AS nvarchar(4000)) + (<xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
(SELECT COALESCE(CAST(AuxTable.Op1 AS nvarchar(4000))+ AuxTable.Op2, AuxTable.Op1) FROM (SELECT (<xsl:apply-templates select="./*[1]"/>) AS Op1, (<xsl:apply-templates select="./*[2]"/>) AS Op2) as AuxTable)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
(SELECT COALESCE(CAST(<xsl:apply-templates select="./*[1]"/> AS nvarchar(4000)) + AuxTable.Op2, AuxTable.Op2) FROM (SELECT (<xsl:apply-templates select="./*[2]"/>) AS Op2) as AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(CAST(AuxTable.Op1 AS nvarchar(4000))+ AuxTable.Op2, AuxTable.Op1, AuxTable.Op2) FROM (SELECT (<xsl:apply-templates select="./*[1]"/>) AS Op1, (<xsl:apply-templates select="./*[2]"/>) AS Op2) as AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="OpHash">
CHECKSUM(<xsl:call-template name="print-children-list"/>)
</xsl:template>

<!--Two OpHash below should have different orders of input params.-->
<xsl:template match="OpHash64">
<xsl:apply-templates select="./OpHash[1]"/> + 4294967296 * <xsl:apply-templates select="./OpHash[2]"/>
</xsl:template>

<!--Left, Right for new DQ-->
<xsl:template match="OpLEFT|OpRIGHT|OpREPT">
<xsl:variable name="op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpLEFT'">LEFT(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$op2"/>)</xsl:when>
<!-- RIGHT includes padding spaces for CHAR/NCHAR -->
<xsl:when test="name()='OpRIGHT'">RIGHT(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$op2"/>)</xsl:when>
<xsl:when test="name()='OpREPT'">REPLICATE(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$op2"/>)</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpCONCATENATE|OpEXACT">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='uniqueidentifier'">
CAST(<xsl:apply-templates select="./*[1]"/> AS VARCHAR(64))
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='uniqueidentifier'">
COALESCE(CAST(<xsl:apply-templates select="./*[1]"/> AS VARCHAR(64)), '')
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[1]"/>, '')
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='uniqueidentifier'">
CAST(<xsl:apply-templates select="./*[2]"/> AS VARCHAR(64))
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='uniqueidentifier'">
COALESCE(CAST(<xsl:apply-templates select="./*[2]"/> AS VARCHAR(64)), '')
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, '')
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<!-- Intentional difference for simplified SQL generation: DAX CONCATENATE(BLANK(), BLANK()) returns BLANK(), SQL returns empty string. -->
<!-- Concatenating CHAR/NCHAR includes padding spaces in between. Leave users to trim strings themselves. -->
<xsl:when test="name()='OpCONCATENATE'">(<xsl:value-of select="$Op1"/> + <xsl:value-of select="$Op2"/>)</xsl:when>
<!-- Funny: EXACT(BLANK(), "") returns true. -->
<!-- Unicode code and non-unicode of same content don't match exactly. -->
<!-- DATALENGTH of CHAR/NCHAR includes padding spaces. -->
<xsl:when test="name()='OpEXACT'">(SELECT CASE WHEN DATALENGTH(Op1) = DATALENGTH(Op2) AND Op1 = Op2 COLLATE Latin1_General_Bin THEN 1 ELSE 0 END FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)</xsl:when>
</xsl:choose>
</xsl:template>


<!--
Ternary+ text functions expressions where NULL for index and length considered as 0.
-->
<!--Mid-->
<xsl:template match="OpMid">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"> (<xsl:apply-templates select="./*[2]"/>) </xsl:when>
<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[2]"/>, 0) </xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op3">
<xsl:choose>
<xsl:when test="@Op3Nullable = 'false'"> (<xsl:apply-templates select="./*[3]"/>) </xsl:when>
<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[3]"/>, 0) </xsl:otherwise>
</xsl:choose>
</xsl:variable>
SUBSTRING(<xsl:apply-templates select="./*[1]"/>,<xsl:value-of select="$Op2"/>,<xsl:value-of select="$Op3"/>)
</xsl:template>

<!-- Substitute                                                           -->
<xsl:template match="OpSubstitute">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false' and @Op3Nullable = 'false' ">
REPLACE(<xsl:apply-templates select="./*[1]"/>, <xsl:apply-templates select="./*[2]"/>, <xsl:apply-templates select="./*[3]"/>)
</xsl:when>
<xsl:when test="@Op3Nullable = 'false'">
COALESCE(REPLACE(<xsl:apply-templates select="./*[1]"/>, <xsl:apply-templates select="./*[2]"/>, <xsl:apply-templates select="./*[3]"/>), N'')
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(REPLACE(AuxTable.Op1, AuxTable.Op2, COALESCE(AuxTable.Op3, N'')), AuxTable.Op1)
FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2, <xsl:apply-templates select="./*[3]"/> AS Op3) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!--Replace-->
<xsl:template match="OpReplace">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"> (<xsl:apply-templates select="./*[1]"/>) </xsl:when>
<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[1]"/>, N'') </xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op3">
<xsl:choose>
<xsl:when test="@Op3Nullable = 'false'"> (<xsl:apply-templates select="./*[3]"/>) </xsl:when>
<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[3]"/>, 0) </xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op4">
<xsl:choose>
<xsl:when test="@Op4Nullable = 'false'"> (<xsl:apply-templates select="./*[4]"/>) </xsl:when>
<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[4]"/>, N'') </xsl:otherwise>
</xsl:choose>
</xsl:variable>
STUFF(<xsl:value-of select="$Op1"/>, <xsl:apply-templates select="./*[2]"/>,
<xsl:value-of select="$Op3"/>, <xsl:value-of select="$Op4"/>)
</xsl:template>

<!-- OpSearch																																				-->
<xsl:template match="OpSearch">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, N'')
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="./Parameter[1] or ./InlineParameter[1]">
<xsl:variable name="value">
<xsl:choose>
<xsl:when test="./Parameter[1]">
<xsl:variable name="reference">
<xsl:value-of select="./Parameter[1]/@ref"/>
</xsl:variable>
<xsl:value-of select="/Statement/Parameters/Parameter[@id=$reference]/text()"/>
</xsl:when>
<xsl:when test="./InlineParameter[1]">
<xsl:value-of select="./InlineParameter[1]/Parameter/text()"/>
</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="substring($value,2,1)='%'">
CAST(
(SELECT CASE WHEN AuxTable.Result > 0 THEN 1 ELSE AuxTable.Op4 END
FROM (SELECT PATINDEX(<xsl:apply-templates select="./*[1]"/>, SUBSTRING(<xsl:value-of select="$Op2"/>, <xsl:apply-templates select="./*[3]"/>, 2097152)) AS Result,
<xsl:apply-templates select="./*[4]"/> as Op4) AS AuxTable)
AS bigint)
</xsl:when>
<xsl:otherwise>
CAST(
(SELECT CASE WHEN AuxTable.Result > 0 THEN AuxTable.Result + AuxTable.Op3 - 1 ELSE AuxTable.Op4 END
FROM (SELECT PATINDEX(<xsl:apply-templates select="./*[1]"/>, SUBSTRING(<xsl:value-of select="$Op2"/>, AuxTable2.Op3, 2097152)) AS Result, AuxTable2.Op3 AS Op3, AuxTable2.Op4 AS Op4
FROM (SELECT <xsl:apply-templates select="./*[3]"/> AS Op3, <xsl:apply-templates select="./*[4]"/> as Op4) AS AuxTable2 ) AS AuxTable)
AS bigint)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:message terminate="yes">SQL90 cartridge error: OpSearch: first parameter is expected to be constant string</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!--Mid for new DQ-->
<xsl:template match="OpMID">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='uniqueidentifier'">
CAST(<xsl:apply-templates select="./*[1]"/> AS VARCHAR(64))
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op3">
<xsl:choose>
<xsl:when test="@Op3Nullable = 'false'"><xsl:apply-templates select="./*[3]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[3]"/>, 0) </xsl:otherwise>
</xsl:choose>
</xsl:variable>
SUBSTRING(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op3"/>)
</xsl:template>

<!--Search for new DQ-->
<!-- When searching for '', DAX returns 1, CHARINDEX returns 0, PATINDEX returns 1 when Op2 is not '' as pattern becomes '%%' -->
<!-- Need not check if Op1 is UID since any non static Op1 is not pushable -->
<xsl:template match="OpSEARCH|OpPATTERNSEARCH|OpFIND">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"><xsl:apply-templates select="./*[1]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, '')</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='uniqueidentifier'">
CAST(<xsl:apply-templates select="./*[2]"/> AS VARCHAR(64))
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='uniqueidentifier'">
COALESCE(CAST(<xsl:apply-templates select="./*[2]"/> AS VARCHAR(64)), '')
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, '')
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpSEARCH' or name()='OpPATTERNSEARCH'">
<xsl:choose>
<xsl:when test="./Parameter[1] or ./InlineParameter[1]">
<xsl:choose>
<xsl:when test="name()='OpSEARCH'">
<xsl:choose>
<xsl:when test="@Op3Static=1 and @Op4Static=0">
CHARINDEX(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN AuxTable.Result > 0 THEN AuxTable.Result ELSE <xsl:apply-templates select="./*[4]"/> END
FROM (SELECT CHARINDEX(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>, <xsl:apply-templates select="./*[3]"/>) AS Result) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpPATTERNSEARCH'">
<xsl:variable name="value">
<xsl:choose>
<xsl:when test="./Parameter[1]">
<xsl:variable name="reference">
<xsl:value-of select="./Parameter[1]/@ref"/>
</xsl:variable>
<xsl:value-of select="/Statement/Parameters/Parameter[@id=$reference]/text()"/>
</xsl:when>
<xsl:when test="./InlineParameter[1]">
<xsl:value-of select="./InlineParameter[1]/Parameter/text()"/>
</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="substring($value,1,1)='%'">
(SELECT CASE WHEN AuxTable.Result > 0 THEN 1 ELSE <xsl:apply-templates select="./*[4]"/> END
FROM (SELECT PATINDEX('%' + <xsl:value-of select="$Op1"/> + '%', SUBSTRING(<xsl:value-of select="$Op2"/>, <xsl:apply-templates select="./*[3]"/>, 2097152)) AS Result) AS AuxTable)
</xsl:when>
<xsl:when test="@Op3Static=1 and @Op4Static=0">
PATINDEX('%' + <xsl:value-of select="$Op1"/> + '%', <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN AuxTable.Result > 0 THEN AuxTable.Result + AuxTable.Op3 - 1 ELSE <xsl:apply-templates select="./*[4]"/> END
FROM (SELECT PATINDEX('%' + <xsl:value-of select="$Op1"/> + '%', SUBSTRING(<xsl:value-of select="$Op2"/>, AuxTable2.Op3, 2097152)) AS Result, AuxTable2.Op3 AS Op3
FROM (SELECT <xsl:apply-templates select="./*[3]"/> AS Op3) AS AuxTable2 ) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:message terminate="yes">Cartridge error: OpSEARCH/OpPATTERNSEARCH: first parameter is expected to be a constant string</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpFIND'">
<xsl:choose>
<xsl:when test="@Op3Static=1 and @Op4Static=0">
CHARINDEX(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/> COLLATE Latin1_General_CS_AS)
</xsl:when>
<xsl:otherwise>
(SELECT CASE WHEN AuxTable.Result > 0 THEN AuxTable.Result ELSE <xsl:apply-templates select="./*[4]"/> END
FROM (SELECT CHARINDEX(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/> COLLATE Latin1_General_CS_AS, <xsl:apply-templates select="./*[3]"/>) AS Result) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpSUBSTITUTE">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='uniqueidentifier'">
CAST(<xsl:apply-templates select="./*[2]"/> AS VARCHAR(64))
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='uniqueidentifier'">
COALESCE(CAST(<xsl:apply-templates select="./*[2]"/> AS VARCHAR(64)), '')
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, '')
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op3">
<xsl:choose>
<xsl:when test="@Op3Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op3SourceProviderType='uniqueidentifier'">
CAST(<xsl:apply-templates select="./*[3]"/> AS VARCHAR(64))
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[3]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op3SourceProviderType='uniqueidentifier'">
COALESCE(CAST(<xsl:apply-templates select="./*[3]"/> AS VARCHAR(64)), '')
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[3]"/>, '')
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
REPLACE(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op3"/>)
</xsl:template>

<!-- OpDate/OpTime                                                           -->
<xsl:template match="OpDate|OpTime">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op3">
<xsl:choose>
<xsl:when test="@Op3Nullable = 'false'">
(<xsl:apply-templates select="./*[3]"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[3]"/>, 0)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpDate'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' or @Op2Nullable = 'false' or @Op3Nullable = 'false'">
DATEADD(mm, ((SELECT CASE WHEN AuxTable.Op1 &lt; 1900 THEN AuxTable.Op1 ELSE AuxTable.Op1 - 1900 END
FROM (SELECT <xsl:value-of select="$Op1"/> AS Op1) as AuxTable) )*12 + <xsl:value-of select="$Op2"/> - 1, 0) + (<xsl:value-of select="$Op3"/> - 1)
</xsl:when>
<xsl:otherwise>
(SELECT	COALESCE(AuxTable3.Op1 + AuxTable3.Op3, AuxTable3.Op1 - 1, AuxTable3.Op3 - 1)
FROM (SELECT COALESCE(DATEADD(MM, AuxTable2.Op1 + AuxTable2.Op2, 0), DATEADD(MM, AuxTable2.Op1 - 1, 0), DATEADD(MM, AuxTable2.Op2, 0)) AS Op1, AuxTable2.Op3 AS Op3
FROM (SELECT (CASE WHEN AuxTable.Op1 &lt; 1900 THEN AuxTable.Op1 ELSE AuxTable.Op1 - 1900 END)*12 AS Op1, AuxTable.Op2 - 1 AS Op2, AuxTable.Op3 - 1 AS Op3
FROM (SELECT <xsl:apply-templates select="./*[1]"/> AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2, <xsl:apply-templates select="./*[3]"/> AS Op3) AS AuxTable) AS AuxTable2) AS AuxTable3)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpTime'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' or @Op2Nullable = 'false' or @Op3Nullable = 'false'">
DATEADD(ss, (<xsl:value-of select="$Op1"/>*3600 + <xsl:value-of select="$Op2"/>*60 + <xsl:value-of select="$Op3"/>)%(3600*24), -2)
</xsl:when>
<xsl:otherwise>
(SELECT	DATEADD(ss, AuxTable2.Op1%(3600*24), -2)
FROM (SELECT COALESCE(AuxTable.Op1 + AuxTable.Op2 + AuxTable.Op3, AuxTable.Op1 + AuxTable.Op2, AuxTable.Op1 + AuxTable.Op3,
AuxTable.Op2 + AuxTable.Op3, AuxTable.Op1, AuxTable.Op2, AuxTable.Op3) AS Op1
FROM (SELECT (<xsl:apply-templates select="./*[1]"/>)*3600 AS Op1, (<xsl:apply-templates select="./*[2]"/>)*60 AS Op2 , <xsl:apply-templates select="./*[3]"/> AS Op3) AS AuxTable) AS AuxTable2)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpEOMonth|OpEDate">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[1]"/>, CAST(-2 AS datetime))
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpEOMonth'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' or @Op2Nullable = 'false' or @Op3Nullable = 'false'">
DATEADD(dd, -1, DATEADD(mm, DATEDIFF(m, 0, <xsl:value-of select="$Op1"/>) + 1 + <xsl:value-of select="$Op2"/>, 0))
</xsl:when>
<xsl:otherwise>
(SELECT DATEADD(dd, -1, DATEADD(mm, COALESCE(AuxTable.Op1 + 1 + AuxTable.Op2, AuxTable.Op1 + 1, AuxTable.Op2), 0))
FROM (SELECT DATEDIFF(m, 0, <xsl:apply-templates select="./*[1]"/>) AS Op1, <xsl:apply-templates select="./*[2]"/> AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpEDate'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' or @Op2Nullable = 'false' or @Op3Nullable = 'false'">
(SELECT DATEADD(mm, AuxTable.Op2, AuxTable.Op1) FROM (SELECT DATEDIFF(dd, 0, <xsl:value-of select="$Op1"/>) AS Op1, <xsl:value-of select="$Op2"/> AS Op2) AS AuxTable)
</xsl:when>
<xsl:otherwise>
(SELECT COALESCE(DATEADD(mm, AuxTable.Op2, AuxTable.Op1), DATEADD(mm, AuxTable.Op2, CAST(-2 AS datetime)), DATEADD(mm, 0, AuxTable.Op1))
FROM (SELECT DATEDIFF(dd, 0, <xsl:apply-templates select="./*[1]"/>) AS Op1, <xsl:apply-templates select="./*[2]"/> + 0 AS Op2) AS AuxTable)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpWeekday1|OpWeekday2|OpWeekday3">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[1]"/>, CAST(-2 AS datetime))
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpWeekday1'">
CAST((DATEPART(dw, CAST(<xsl:value-of select="$Op1"/> AS datetime)) + @@DATEFIRST - 1) % 7 + 1 AS bigint)
</xsl:when>
<xsl:when test="name()='OpWeekday2'">
CAST((DATEPART(dw, CAST(<xsl:value-of select="$Op1"/> AS datetime)) + @@DATEFIRST - 2) % 7 + 1 AS bigint)
</xsl:when>
<xsl:when test="name()='OpWeekday3'">
CAST((DATEPART(dw, CAST(<xsl:value-of select="$Op1"/> AS datetime)) + @@DATEFIRST - 2) % 7 AS bigint)
</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpDATE|OpTIME">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:apply-templates select="./*[1]"/>
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
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
<xsl:choose>
<!-- For DATE, cast to DATETIME is just to be consistent with the SQL90 implementation. There are remaining issues of valid date range and mixing with DATE/DATETIME2/etc. -->
<xsl:when test="name()='OpDATE'">
CAST(DATEFROMPARTS(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op3"/>) AS DATETIME)
</xsl:when>
<xsl:when test="name()='OpTIME'">
DATEADD(DD, -2, CAST(TIMEFROMPARTS(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op3"/>, 0, 0) AS DATETIME))
</xsl:when>
</xsl:choose>
</xsl:template>

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
<xsl:when test="name()='OpEOMONTH'">EOMONTH(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
<!-- For EDATE, cast to DATE is to truncate the time portion. But the result would be DATE which has other problems when mixing with DATETIME/DATETIME2/etc. -->
<xsl:when test="name()='OpEDATE'">DATEADD(mm, <xsl:value-of select="$Op2"/>, CAST(<xsl:apply-templates select="./*[1]"/> AS DATE))</xsl:when>
</xsl:choose>
</xsl:template>
<xsl:template match="OpDATEDIFF">
<xsl:variable name="Interval">
<xsl:choose>
<xsl:when test="@Interval = 'YEAR'">YEAR</xsl:when>
<xsl:when test="@Interval = 'QUARTER'">QUARTER</xsl:when>
<xsl:when test="@Interval = 'MONTH'">MONTH</xsl:when>
<xsl:when test="@Interval = 'WEEK'">WEEK</xsl:when>
<xsl:when test="@Interval = 'DAY'">DAY</xsl:when>
<xsl:when test="@Interval = 'HOUR'">HOUR</xsl:when>
<xsl:when test="@Interval = 'MINUTE'">MINUTE</xsl:when>
<xsl:when test="@Interval = 'SECOND'">SECOND</xsl:when>
</xsl:choose>
</xsl:variable>
DATEDIFF(<xsl:value-of select="$Interval"/>, <xsl:apply-templates select="./*[1]"/>, <xsl:apply-templates select="./*[2]"/>)
</xsl:template>

<!-- Coalesce                                               -->
<xsl:template match="Coalesce">
COALESCE
(
<xsl:call-template name="print-children-list"/>
)
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
<xsl:when test="$type-val = 'DBTYPE_BSTR'">    nvarchar     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_WSTR'">    nvarchar     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_STR'">     varchar      </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_BOOL'">    bit          </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I1'">      tinyint      </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I2'">      smallint     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I4'">      int          </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I8'">      bigint       </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI1'">     tinyint      </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI2'">     smallint     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI4'">     int          </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI8'">     bigint       </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_R4'">      real         </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_R8'">      float        </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_DATE'">    datetime     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_DBTIMESTAMP'">    datetime     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_CY'">      money        </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_VARIANT'"> sql_variant  </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_GUID'"> uniqueidentifier  </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_ByteArray'"> varbinary  </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_DECIMAL'"> decimal      </xsl:when>
</xsl:choose>
<xsl:apply-templates select="./Size"/>
<xsl:apply-templates select="./Precision"/>
<xsl:apply-templates select="./Scale"/>
</xsl:template>
<!-- True and False                                                       -->
<xsl:template match="True">
<xsl:choose>
<xsl:when test="@SqlBool = 'true'">1=1</xsl:when>
<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="False">
<xsl:choose>
<xsl:when test="@SqlBool = 'true'">1=0</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
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

<!-- OpCast                                                             -->
<!-- Known types:                                                       -->
<!--     Double                                                         -->
<!--     Integer                                                        -->
<!--     Currency                                                       -->
<!--     SqlBool                                                        -->
<!--     SqlBit                                                         -->
<!--     Datetime                                                       -->
<!--     String                                                         -->
<xsl:template name="OpCast" match="OpCast">
<xsl:param name="param-type" select="@Op1Type"/>
<xsl:param name="target-type" select="@ResultType"/>
<xsl:param name="unicode" select="@Unicode"/>
<xsl:param name="source-target-type" select="@SourceTargetType"/>
<xsl:param name="value-node" select="./*[1]"/>
<xsl:choose>

<xsl:when test="$target-type = 'Double'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset'">
CAST(CAST(<xsl:apply-templates select="$value-node"/> AS DATETIME) + 2 AS FLOAT)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> + 2 AS FLOAT)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END AS FLOAT)
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset'">
CAST(CAST(<xsl:apply-templates select="$value-node"/> AS DATETIME) + 2 AS FLOAT)
</xsl:when>
<xsl:when test="@Op1SourceProviderType='datetime' or @Op1SourceProviderType='smalldatetime'">
CAST(<xsl:apply-templates select="$value-node"/> + 2 AS FLOAT)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS FLOAT)
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'Integer'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset'">
CAST(CAST(<xsl:apply-templates select="$value-node"/> AS DATETIME) + 2 AS BIGINT)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> + 2 AS BIGINT)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="$param-type = 'Double' or $param-type = 'Currency'">
(SELECT CAST(Op1 + CASE WHEN Op1 &lt; 0 THEN -0.5 ELSE 0.5 END AS BIGINT) FROM (SELECT <xsl:apply-templates select="$value-node"/> AS Op1) AS AuxTable)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END AS BIGINT)
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset'">
CAST(CAST(<xsl:apply-templates select="$value-node"/> AS DATETIME) + 2 AS BIGINT)
</xsl:when>
<xsl:when test="@Op1SourceProviderType='datetime' or @Op1SourceProviderType='smalldatetime'">
CAST(<xsl:apply-templates select="$value-node"/> + 2 AS BIGINT)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> as BIGINT)
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'Currency'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset'">
CAST(CAST(<xsl:apply-templates select="$value-node"/> AS DATETIME) + 2 AS MONEY)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> + 2 AS MONEY)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END AS MONEY)
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='date' or @Op1SourceProviderType='datetime2' or @Op1SourceProviderType='datetimeoffset'">
CAST(CAST(<xsl:apply-templates select="$value-node"/> AS DATETIME) + 2 AS MONEY)
</xsl:when>
<xsl:when test="@Op1SourceProviderType='datetime' or @Op1SourceProviderType='smalldatetime'">
CAST(<xsl:apply-templates select="$value-node"/> + 2 AS MONEY)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS MONEY)
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'SqlBool'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
(<xsl:apply-templates select="$value-node"/> &lt;&gt; CAST(-2 AS DATETIME))
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
<xsl:apply-templates select="$value-node"/>
</xsl:when>
<xsl:when test="$param-type = 'String'">
(CAST(<xsl:apply-templates select="$value-node"/> AS BIT) = 1)
</xsl:when>
<xsl:otherwise>
(<xsl:apply-templates select="$value-node"/> &lt;&gt; 0)
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'SqlBit'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
CAST(CAST(<xsl:apply-templates select="$value-node"/> AS DATETIME) + 2 AS BIT)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END AS BIT)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS BIT)
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'Datetime'">
<xsl:choose>
<xsl:when test="$param-type = 'SqlBool'">
(CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END AS DATETIME) - 2)
</xsl:when>
<xsl:when test="$param-type = 'Double'
or $param-type = 'Integer'
or $param-type = 'Currency'
or $param-type = 'SqlBit'">
(CAST(<xsl:apply-templates select="$value-node"/> AS DATETIME) - 2)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS DATETIME)
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'String'">
<xsl:choose>
<xsl:when test="$param-type = 'SqlBit'">
(CASE WHEN <xsl:apply-templates select="$value-node"/> = 1 THEN 'TRUE' ELSE 'FALSE' END)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 'TRUE' ELSE 'FALSE' END)
</xsl:when>
<xsl:when test="$unicode = 'true'">
CAST(<xsl:apply-templates select="$value-node"/> AS NVARCHAR(4000))
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS VARCHAR(4000))
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$source-target-type != ''">
CAST(<xsl:apply-templates select="$value-node"/> AS <xsl:apply-templates select="$source-target-type"/>)
</xsl:when>

<xsl:otherwise>
<xsl:message terminate="yes">SQL90 cartridge error: OpCast: ResultType is not specified</xsl:message>
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
<!-- OpRank|OpDenseRank|RowNumber|Ntile -->
<xsl:template match="OpRank|OpDenseRank|OpRowNumber|OpNtile">
<xsl:variable name="rank_function">
<xsl:choose>
<xsl:when test="name()='OpRank'"> RANK() </xsl:when>
<xsl:when test="name()='OpDenseRank'"> DENSE_RANK() </xsl:when>
<xsl:when test="name()='OpRowNumber'"> ROW_NUMBER() </xsl:when>
<xsl:when test="name()='OpNtile'"> NTILE(<xsl:apply-templates select="./*[1]"/>) </xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$rank_function"/>
OVER
(
<xsl:apply-templates select="./PartitionBy"/>
<xsl:apply-templates select="./OrderBy"/>
)
</xsl:template>

<xsl:template match="PartitionBy">
PARTITION BY <xsl:call-template name="print-children-list"/>
</xsl:template>

<!-- Literal -->
<xsl:template match="Literal">
<xsl:value-of select="."/>
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
<xsl:param name="unicode" select="."/>
<xsl:choose>
<xsl:when test="$unicode != 'false'"><xsl:value-of select="$UnicodeStringPrefix"/></xsl:when>
</xsl:choose>
<xsl:value-of select="$StringQuotingCharacter"/>
<xsl:call-template name="normalize-entity-aux">
<xsl:with-param name="entity" select="$string"/>
<xsl:with-param name="end-quoting-char" select="$StringQuotingCharacter"/>
</xsl:call-template>
<xsl:value-of select="$StringQuotingCharacter"/>
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
<xsl:param name="value-node" select="."/>
<xsl:param name="operator" select="','"/>
<xsl:param name="prefix" select="''"/>

<xsl:call-template name="print-list">
<xsl:with-param name="value-node" select="$value-node/*"/>
<xsl:with-param name="operator" select="$operator"/>
<xsl:with-param name="prefix" select="$prefix"/>
</xsl:call-template>
</xsl:template>

<!-- Print a list                                                     -->
<xsl:template name="print-list">
<xsl:param name="operator" select="','"/>
<xsl:param name="value-node" select="."/>
<xsl:param name="prefix" select="''"/>

<xsl:for-each select="$value-node">
<xsl:call-template name="print-element-optional-prefix">
<xsl:with-param name="value-node" select="."/>
<xsl:with-param name="prefix" select="$prefix"/>
</xsl:call-template>
<xsl:if test="position()!=last()">
<xsl:value-of select="$operator"/>
</xsl:if>
</xsl:for-each>
</xsl:template>

<!-- Print a list of pairs connected by =                             -->
<xsl:template name="print-children-pair-list">
<xsl:param name="value-node1" select="."/>
<xsl:param name="value-node2" select="."/>
<xsl:param name="prefix1" select="''"/>
<xsl:param name="prefix2" select="''"/>
<xsl:param name="operator" select="' AND '"/>
<xsl:param name="connector" select="' = '"/>

<xsl:for-each select="$value-node1/*">
<xsl:call-template name="print-element-optional-prefix">
<xsl:with-param name="value-node" select="."/>
<xsl:with-param name="prefix" select="$prefix1"/>
</xsl:call-template>
<xsl:value-of select="$connector"/>
<xsl:call-template name="print-element-optional-prefix">
<xsl:with-param name="value-node" select="$value-node2/*[position()]"/>
<xsl:with-param name="prefix" select="$prefix2"/>
</xsl:call-template>
<xsl:if test="position()!=last()">
<xsl:value-of select="$operator"/>
</xsl:if>
</xsl:for-each>
</xsl:template>

<!-- Print an element giving it an optional prefix                    -->
<xsl:template name="print-element-optional-prefix">
<xsl:param name="value-node" select="."/>
<xsl:param name="prefix" select="''"/>

<xsl:for-each select="$value-node">
<xsl:variable name="element">
<xsl:apply-templates select="."/>
</xsl:variable>
<xsl:choose>
<xsl:when test="$prefix = ''">
<xsl:value-of select="$element"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="concat($prefix, '.', $element)"/>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
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
<xsl:when test="$db-type = 'DBTYPE_STR'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/><xsl:with-param name="unicode" select="false"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_BOOL'">CAST(<xsl:value-of select="$value"/> AS bit)</xsl:when>
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
<xsl:when test="$db-type = 'DBTYPE_DATE'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/><xsl:with-param name="unicode" select="false"/></xsl:call-template> AS datetime)</xsl:when>
<xsl:when test="$db-type = 'DBTYPE_DBTIME'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS time)</xsl:when>
<xsl:when test="$db-type = 'DBTYPE_DBTIMESTAMP'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS datetime)</xsl:when>
<xsl:when test="$db-type = 'DBTYPE_CY'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS money)</xsl:when>
<xsl:when test="$db-type = 'DBTYPE_VARIANT'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_GUID'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_ByteArray'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_DECIMAL'"><xsl:value-of select="$value"/></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_EMPTY'">NULL</xsl:when>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>
