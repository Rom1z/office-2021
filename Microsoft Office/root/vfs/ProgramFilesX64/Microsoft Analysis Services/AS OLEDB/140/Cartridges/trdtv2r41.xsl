<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0" xmlns:mssqlcrt="urn:sql-microsoft-com:sqlcrt" xmlns:mssqldbg="urn:sql-microsoft-com:sqldbg">
<xsl:output method="xml" indent="yes"/>

<!-- This ALWAYS GENERATED file contains the definitions for the cartridges
Microsoft Cartridge Interfaces (Analysis Services 2005)
(C) Copyright 1988 - 2003 By Microsoft Corporation.      -->


<!-- Area of Custom parametrizations: these may be modified by customers for specific query customizations  -->
<!-- post-select-query-hint will append the customer-defined string at the end of the generated SELECT statement - e.g. WITH UR -->
<xsl:param name="post-select-query-hint"></xsl:param>


<!-- Teradata V2R41 pluggable cartridge -->

<!-- Area of STANDARD parametrizations: these are externally passed   -->
<xsl:param name="in_CanUseParams">yes</xsl:param>
<xsl:param name="in_IdentStartQuotingCharacter">"</xsl:param>
<xsl:param name="in_IdentEndQuotingCharacter">"</xsl:param>
<xsl:param name="in_StringStartQuotingCharacter">'</xsl:param>
<xsl:param name="in_StringEndQuotingCharacter">'</xsl:param>
<xsl:param name="in_DateValueFormat">CAST('{0:yyyy-MM-dd HH':'mm':'ss}' AS timestamp)</xsl:param>
<xsl:param name="in_DateColumnFormat">CAST("{0}" AS timestamp)</xsl:param>

<!-- Area of CORE parametrizations: These are externally checked      -->
<mssqlcrt:provider type="prefix" managed="yes" native="yes">Teradata</mssqlcrt:provider>
<mssqlcrt:parameter-style native="unnamed" managed="unnamed"/>
<mssqlcrt:dq-datetime-format>YYYY-MM-DD HH:MM:SS</mssqlcrt:dq-datetime-format>

<mssqlcrt:capabilities>
<mssqlcrt:supports-data-sampling/>
<mssqlcrt:supports-update/>
<mssqlcrt:supports-insert/>
<mssqlcrt:supports-subselect/>
<mssqlcrt:supports-table-alias/>
<mssqlcrt:supports-column-alias/>
<mssqlcrt:supports-top-clause/>
<mssqlcrt:supports-union/>
<mssqlcrt:supports-union-all/>
<mssqlcrt:supports-datetime-format>YYYY-MM-DD HH:MM:SS</mssqlcrt:supports-datetime-format>
<mssqlcrt:supports-real-time/>
<mssqlcrt:supports-joins/>
<mssqlcrt:supports-distinct-count/>
<mssqlcrt:supports-top/>
<mssqlcrt:supports-not-operator/>
<!--Parameters are disabled for teradata(in DQ mode) because Auxtables are disabled(No Correlation in FROM clause) and we cannot replace repeated parameters-->
<!--<mssqlcrt:supports-params/>-->
<mssqlcrt:not-supports-in-clause-withexpression/>

<mssqlcrt:supports-weeknum-return-type>1</mssqlcrt:supports-weeknum-return-type>
<mssqlcrt:supports-weeknum-return-type>17</mssqlcrt:supports-weeknum-return-type>
<mssqlcrt:supports-weeknum-return-type>21</mssqlcrt:supports-weeknum-return-type>
<mssqlcrt:pattern-search-expression-type>POSIX</mssqlcrt:pattern-search-expression-type>

<mssqlcrt:limit-table-identifier-length>30</mssqlcrt:limit-table-identifier-length>
<mssqlcrt:limit-column-identifier-length>30</mssqlcrt:limit-column-identifier-length>
<mssqlcrt:limit-parameter-count>2100</mssqlcrt:limit-parameter-count>
<mssqlcrt:limit-in-operator-list-size>2100</mssqlcrt:limit-in-operator-list-size>
<mssqlcrt:limit-temptable-row-count>0</mssqlcrt:limit-temptable-row-count>
<mssqlcrt:limit-batch-insert-count>0</mssqlcrt:limit-batch-insert-count>
</mssqlcrt:capabilities>

<mssqlcrt:schema-classes>
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

<!-- ENGINEERING Functions -->
<mssqlcrt:supports-func>BITAND</mssqlcrt:supports-func>
<mssqlcrt:supports-func>BITLSHIFT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>BITRSHIFT</mssqlcrt:supports-func>
<mssqlcrt:supports-func>BITOR</mssqlcrt:supports-func>
<mssqlcrt:supports-func>BITXOR</mssqlcrt:supports-func>

<!-- INFO Functions -->
<mssqlcrt:supports-func>CONTAINSROW</mssqlcrt:supports-func>
<mssqlcrt:supports-func>ISBLANK</mssqlcrt:supports-func>

<!-- LOGICAL Functions -->
<mssqlcrt:supports-func>IF</mssqlcrt:supports-func>
<mssqlcrt:supports-func>IF.EAGER</mssqlcrt:supports-func>

<!-- DATETIME Functions -->
<mssqlcrt:supports-func>DATE</mssqlcrt:supports-func>
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

<!-- STRING Functions -->
<mssqlcrt:supports-func>COMBINEVALUES</mssqlcrt:supports-func>
<mssqlcrt:supports-func>CONCATENATE</mssqlcrt:supports-func>
<mssqlcrt:supports-func>DATEVALUE</mssqlcrt:supports-func>
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
<blob/>
<byte/>
<varbyte/>
<blob/>
<clob/>
<char>STR</char>
<character>STR</character>
<varchar>STR</varchar>
<longvarchar>STR</longvarchar>
<graphic/>
<clob/>
<decimal>R8</decimal>
<numeric>R8</numeric>
<float>R8</float>
<real>R8</real>
<doubleprecision>R8</doubleprecision>
<bigint>I8</bigint>
<integer>I8</integer>
<byteint>I8</byteint>
<smallint>I8</smallint>
<number>R8</number>
<date>DATE</date>
<time/>
<timewithzone/>
<timestamp>DATE</timestamp>
<timestampwithzone/>
<interval/> <!-- Is this returned by any provider? -->
<intervalyear/>
<intervalyeartomonth/>
<intervalmonth/>
<intervalday/>
<intervaldaytohour/>
<intervaldaytominute/>
<intervaldaytosecond/>
<intervalhour/>
<intervalhourtominute/>
<intervalhourtosecond/>
<intervalminute/>
<intervalminutetosecond/>
<intervalsecond/>
<perioddate/>
<periodtime/>
<periodtimewithtimezone/>
<periodtimestamp/>
<periodtimestampwithtimezone/>
</supportedtypes>
<agg_upcast>
<byteint/>
<smallint/>
<integer/>
</agg_upcast>
<leaf_cast>
<clob>long varchar</clob>
<date>timestamp</date>
<!--<time>timestamp</time>-->
</leaf_cast>
<fixed_length_string_types>
<char/>
<character/>
</fixed_length_string_types>
<date format="yyyy-mm-dd">
<date/>
</date>
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
<xsl:variable name="StringStartQuotingCharacter" select="normalize-space($in_StringStartQuotingCharacter)"/>
<xsl:variable name="StringEndQuotingCharacter" select="normalize-space($in_StringEndQuotingCharacter)"/>

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

<!-- Sample statement                                                 -->
<xsl:template match="Sample">
<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert'">
(
</xsl:if>
<xsl:apply-templates select="./*[1]"/>
SAMPLE <xsl:apply-templates select="./*[2]"/>
<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert'">
)
</xsl:if>
</xsl:template>

<!-- Max Row Count clause                                             -->
<xsl:template match="MaxRowCount">
<xsl:value-of select="."/>
</xsl:template>

<!-- Top clause																											 -->
<xsl:template match="Top">
TOP <xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./TopPercent"/> <xsl:apply-templates select="./TopWithTies"/> <xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="TopPercent">
PERCENT
</xsl:template>

<xsl:template match="TopWithTies">
WITH TIES
</xsl:template>

<!-- Select statement                                                 -->
<xsl:template match="Select">
<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert' and name(..) != 'Sample' and name(..) != 'Union' and name(..) != 'UnionAll'">
(
</xsl:if>
SELECT <xsl:apply-templates select="./Top"/>
<xsl:apply-templates select="./Distinct"/>
<xsl:apply-templates select="./ColumnExpressions"/>
<xsl:apply-templates select="./Sources"/>
<xsl:apply-templates select="./Where"/>
<xsl:apply-templates select="./GroupBy"/>
<xsl:apply-templates select="./OrderBy"/>

<xsl:if test="name(..) = 'Statement'">
<xsl:text> </xsl:text><xsl:value-of select="$post-select-query-hint"/>
</xsl:if>
<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert' and name(..) != 'Sample' and name(..) != 'Union' and name(..) != 'UnionAll'">
)
</xsl:if>
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
DROP <xsl:apply-templates select="./*"/>
</xsl:template>

<!-- Create statement                                                 -->
<xsl:template match="Create">
CREATE <xsl:apply-templates select="./*[1]"/>
<xsl:choose>
<xsl:when test="name(./*[1]) = 'Table'">( <xsl:apply-templates select="./*[2]"/> )</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="Distinct">
DISTINCT
</xsl:template>

<xsl:template match="As">
<xsl:apply-templates select="./*[1]"/> AS <xsl:apply-templates select="./*[2]"/>
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
<xsl:template match="Sources">
FROM <xsl:call-template name="print-children-list"/>
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

<xsl:template match="Insert/Target/ColumnUpdates/Assign/SQLColumn[1]|Update/Target/ColumnUpdates/Assign/SQLColumn[1]">
<!-- The table name is not printed for LHS of assignments in insert -->
<xsl:apply-templates select="./Column"/>
</xsl:template>

<xsl:template match="Create/ColumnDefinitions/SQLColumn">
<xsl:apply-templates select="./Column"/>
<xsl:apply-templates select="./Type"/>
<xsl:apply-templates select="./Usage"/>
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
</xsl:template>

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
COALESCE(<xsl:apply-templates select="./*[1]"/>, CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS timestamp))
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
cast(COUNT ( <xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./*[2]"/> ) as bigint)
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
<xsl:when test="$type-val = 'DBTYPE_BSTR'">    varchar     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_WSTR'">    varchar     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_STR'">     varchar      </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_BOOL'">    byteint      </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I1'">      tinyint      </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I2'">      smallint     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I4'">      int      </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_I8'">      bigint       </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI1'">     tinyint      </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI2'">     smallint     </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI4'">     int      </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_UI8'">     bigint       </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_R4'">      real         </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_R8'">      float        </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_DATE'">    timestamp </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_DBTIMESTAMP'">    timestamp    </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_CY'">      DECIMAL(19, 4)        </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_VARIANT'"> sql_variant  </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_GUID'"> varchar  </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_ByteArray'"> varbyte  </xsl:when>
<xsl:when test="$type-val = 'DBTYPE_DECIMAL'"> decimal      </xsl:when>
</xsl:choose>
<xsl:apply-templates select="./Size"/>
<xsl:apply-templates select="./Precision"/>
<xsl:apply-templates select="./Scale"/>
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
<xsl:when test="$db-type = 'DBTYPE_BOOL'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS BYTEINT)</xsl:when>
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
<xsl:when test="$db-type = 'DBTYPE_DATE'">TIMESTAMP<xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_DBDATE'">DATE<xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_DBTIMESTAMP'">TIMESTAMP<xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_CY'">CAST(<xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS DECIMAL(19, 4))</xsl:when>
<xsl:when test="$db-type = 'DBTYPE_VARIANT'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_GUID'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_ByteArray'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
<xsl:when test="$db-type = 'DBTYPE_DECIMAL'"><xsl:value-of select="$value"/></xsl:when>
</xsl:choose>
</xsl:template>

<!-- Null                                                         -->
<xsl:template match="Null">null</xsl:template>
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
TRIM(LEADING FROM <xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpTrimRight">
TRIM(TRAILING FROM <xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpTrim">
TRIM(BOTH FROM <xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpLOWER">LOWER(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpUPPER">UPPER(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpLEN">CHARACTER_LENGTH(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpTRIM">TRIM(BOTH FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>

<!-- VALUE("") returns 0 in Teradata but raises error in DAX -->
<xsl:template match="OpVALUE">CAST(<xsl:apply-templates select="./*[1]"/> AS FLOAT)</xsl:template>

<!-- Only supports strings in pure date format, unable to extract date portion from a string in timestamp format as in DAX -->
<xsl:template match="OpDATEVALUE">CAST(<xsl:apply-templates select="./*[1]"/> AS DATE)</xsl:template>

<!-- Only supports strings in pure time format, unable to extract time portion from a string in timestamp format as in DAX -->
<xsl:template match="OpTIMEVALUE">CAST('1899-12-30 ' || TO_CHAR(CAST(<xsl:apply-templates select="./*[1]"/> AS TIME)) AS TIMESTAMP)</xsl:template>

<xsl:template match="OpUNICHAR">CHR(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpUNICODE">ASCII(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<!--
Unary expressions where NULL considered as BLANK value(more like 0).
-->

<!-- Not -->
<xsl:template match="Not">
NOT(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpNot">(NOT <xsl:apply-templates select="./*[1]"/>)</xsl:template>

<!-- OpNot and BitNot -->
<!-- Do not use SQL NOT because we need to handle UNKNOWN in a special way -->
<xsl:template match="OpNot_Deprecated">
(CASE WHEN (<xsl:apply-templates select="./*[1]"/>) THEN 0 ELSE 1 END)
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

<!-- UnaryMinus	-->
<xsl:template match="UnaryMinus">(-<xsl:apply-templates select="./*[1]"/>)</xsl:template>

<!-- Unary Excel math functions that NULL is a fixed point. -->
<xsl:template match="OpAbs|OpCeiling|OpFloor|OpSign|OpSqrt">
<xsl:variable name="OpName">
<xsl:choose>
<xsl:when test="name()='OpAbs'">ABS</xsl:when>
<xsl:when test="name()='OpCeiling'">CEILING</xsl:when>
<xsl:when test="name()='OpFloor'">FLOOR</xsl:when>
<xsl:when test="name()='OpSign'">SIGN</xsl:when>
<xsl:when test="name()='OpSqrt'">SQRT</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:value-of select="$OpName"/>(<xsl:apply-templates select="./*[1]"/>)
</xsl:template>

<xsl:template match="OpSqr">
POWER(<xsl:apply-templates select="./*[1]"/> , 2)
</xsl:template>

<!-- Unary Excel math functions that NULL is NOT a fixed point. -->
<xsl:template match="OpExp|OpLn|OpLg">
<xsl:variable name="OpName">
<xsl:choose>
<xsl:when test="name()='OpExp'">EXP</xsl:when>
<xsl:when test="name()='OpLn'">LN</xsl:when>
<xsl:when test="name()='OpLg'">LOG</xsl:when>
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
CAST(COUNT(<xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./*[2]"/>) AS BIGINT)
</xsl:template>

<!-- FUTURE: Avoid the redundant COUNT_BIG(DISTINCT ), either by using a subquery, or doing a projection on the results -->
<xsl:template match="OpDistinctCount">
(CAST(COUNT(DISTINCT <xsl:apply-templates select="./*[1]"/>) AS BIGINT) + MAX(CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL THEN 1 ELSE 0 END))
</xsl:template>

<!-- FUTURE: Avoid the redundant COUNT_BIG(DISTINCT ), either by using a subquery, or doing a projection on the results -->
<xsl:template match="OpDistinctCountSkipBlank">
CAST(COUNT(DISTINCT <xsl:apply-templates select="./*[1]"/>) AS BIGINT)
</xsl:template>


<xsl:template match="OpABS">ABS(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSQRT">SQRT(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<!-- We have a known issue here, where round tripping 0 (integer) from Engine to Teradata would send it as a float, SIGN(CAST(0 as FLOAT)) = 1 in Teradata -->
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
FUTURE: alleonov: maybe replace prefix Op with something else
-->
<!--Comparisons-->
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
<xsl:when test="@Op1Type = 'String'">COALESCE(<xsl:apply-templates select="./*[1]"/>, '')</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">
<xsl:choose>
<xsl:when test="@Op1SourceProviderType='Date'">
COALESCE(<xsl:apply-templates select="./*[1]"/>, DATE<xsl:value-of select="$DateStringForOriginDate"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[1]"/>, TIMESTAMP<xsl:value-of select="$TimestampStringForOriginDate"/>)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:when test="@Op2Type = 'String'">COALESCE(<xsl:apply-templates select="./*[2]"/>, '')</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">
<xsl:choose>
<xsl:when test="@Op2SourceProviderType='Date'">
COALESCE(<xsl:apply-templates select="./*[2]"/>, DATE<xsl:value-of select="$DateStringForOriginDate"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[2]"/>, TIMESTAMP<xsl:value-of select="$TimestampStringForOriginDate"/>)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
(<xsl:value-of select="$Op1"/> <xsl:value-of select="$operator"/> <xsl:value-of select="$Op2"/>)
</xsl:template>

<!-- OpIs-->
<xsl:template match="OpIs">
<xsl:choose>
<!--We need to investigate more if we hit an issue with collation of strings. As of now we are falling back to default behavior-->
<xsl:when test="(@Op1Nullable = 'false' or @Op2Nullable = 'false') and @ResolveCollationConflict='true'">
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' or @Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@OpsAreColRefs = 'true' and @ResolveCollationConflict='true'">
<!--It's illegal to repeat query parameters more than once, so we can use only column references here.-->
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> OR <xsl:apply-templates select="./*[1]"/> IS NULL AND <xsl:apply-templates select="./*[2]"/> IS NULL)
</xsl:when>
<xsl:when test="@OpsAreColRefs = 'true'">
<!--It's illegal to repeat query parameters more than once, so we can use only column references here.-->
(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> OR <xsl:apply-templates select="./*[1]"/> IS NULL AND <xsl:apply-templates select="./*[2]"/> IS NULL)
</xsl:when>
<xsl:when test="./*[1][self::Null]">
(<xsl:apply-templates select="./*[2]"/> IS NULL)
</xsl:when>
<xsl:when test="./*[2][self::Null]">
(<xsl:apply-templates select="./*[1]"/> IS NULL)
</xsl:when>
<xsl:otherwise>
<!--Do the same as in "OpsAreColRefs = 'true'" branch, but repeating parameters only once here -> expression is more complicated.-->
((CASE WHEN <xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> OR <xsl:apply-templates select="./*[1]"/> IS NULL AND <xsl:apply-templates select="./*[2]"/> IS NULL THEN 1 ELSE 0 END) = 1)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictGreater-->
<xsl:template match="OpStrictGreater">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &gt; <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[2]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END
END) = 1)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[2]"/> &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END
END) = 1)
</xsl:when>
<xsl:otherwise>
((CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[2]"/> &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[2]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END END
END) = 1)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictLess-->
<xsl:template match="OpStrictLess">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &lt; <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[2]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END
END) = 1)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[2]"/> &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END
END) = 1)
</xsl:when>
<xsl:otherwise>
((CASE WHEN <xsl:apply-templates select="./*[2]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[2]"/> &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END END
END) = 1)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictLessOrEqual-->
<xsl:template match="OpStrictLessOrEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &lt;= <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
((CASE WHEN (<xsl:apply-templates select="./*[2]"/>) IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END
END) = 0)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[2]"/> &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END
END) = 0)
</xsl:when>
<xsl:otherwise>
((CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[2]"/> &lt; <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[2]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt;= <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &gt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END END
END) = 0)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictGreaterOrEqual-->
<xsl:template match="OpStrictGreaterOrEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &gt;= <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
((CASE WHEN (<xsl:apply-templates select="./*[2]"/>) IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END
END) = 0)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[2]"/> &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END
END) = 0)
</xsl:when>
<xsl:otherwise>
((CASE WHEN <xsl:apply-templates select="./*[2]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:value-of select="$Op1Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL
THEN CASE WHEN <xsl:apply-templates select="./*[2]"/> &gt;= <xsl:value-of select="$Op2Zero"/> THEN 1 ELSE 0 END
ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> &lt; <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END END
END) = 0)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictNotEqual-->
<xsl:template match="OpStrictNotEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> &lt;&gt; <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[2]"/> IS NULL THEN 0 ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END END) = 0)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL THEN 0 ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END END) = 0)
</xsl:when>
<xsl:when test="./*[1][self::Null]">
(<xsl:apply-templates select="./*[2]"/> IS NOT NULL)
</xsl:when>
<xsl:when test="./*[2][self::Null]">
(<xsl:apply-templates select="./*[1]"/> IS NOT NULL)
</xsl:when>
<xsl:otherwise>
((CASE WHEN <xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> OR <xsl:apply-templates select="./*[1]"/> IS NULL AND <xsl:apply-templates select="./*[2]"/> IS NULL THEN 1 ELSE 0 END) = 0)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpStrictEqual-->
<xsl:template match="OpStrictEqual">
<xsl:variable name="Op1Zero">
<xsl:choose>
<xsl:when test="@Op1Type = 'String'">''</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2Zero">
<xsl:choose>
<xsl:when test="@Op2Type = 'String'">''</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP)</xsl:when>
<xsl:otherwise>0</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/>)</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[2]"/> IS NULL THEN 0 ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END END) = 1)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
((CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL THEN 0 ELSE CASE WHEN <xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> THEN 1 ELSE 0 END END) = 1)
</xsl:when>
<xsl:when test="./*[1][self::Null]">
(<xsl:apply-templates select="./*[2]"/> IS NULL)
</xsl:when>
<xsl:when test="./*[2][self::Null]">
(<xsl:apply-templates select="./*[1]"/> IS NULL)
</xsl:when>
<xsl:otherwise>
((CASE WHEN <xsl:apply-templates select="./*[1]"/> = <xsl:apply-templates select="./*[2]"/> OR <xsl:apply-templates select="./*[1]"/> IS NULL AND <xsl:apply-templates select="./*[2]"/> IS NULL THEN 1 ELSE 0 END) = 1)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpAdd-->
<xsl:template match="OpAdd">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Type != 'Datetime' and @Op2Type = 'Datetime'">
(<xsl:apply-templates select="./*[1]"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'Datetime'"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>
</xsl:when>
<xsl:when test="@Op1Type = 'Datetime' and @Op2Type != 'Datetime'">
(<xsl:apply-templates select="./*[2]"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="OpCastDatetime">
<xsl:choose>
<xsl:when test="@Op2Type != 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="@Op2Type"/>
<xsl:with-param name="target-type" select="'Datetime'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>
</xsl:when>
<xsl:when test="@Op1Type != 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="@Op1Type"/>
<xsl:with-param name="target-type" select="'Datetime'"/>
<xsl:with-param name="value-node" select="./*[1]"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false' and @Op1Type = 'Datetime' and @Op2Type = 'Datetime' ">
(<xsl:apply-templates select="./*[1]"/> + <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
(<xsl:value-of select="$Op1"/> + <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' and @Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/> + <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND, <xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' and @Op2Type = 'Datetime'">
COALESCE(<xsl:value-of select="$Op1"/> + <xsl:value-of select="$Op2"/>, <xsl:value-of select="$OpCastDatetime"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
COALESCE(<xsl:apply-templates select="./*[1]"/> + <xsl:value-of select="$Op2"/>, <xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false' and @Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/> + <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND, <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false' and @Op1Type = 'Datetime'">
COALESCE(<xsl:value-of select="$Op1"/> + <xsl:value-of select="$Op2"/>, <xsl:value-of select="$OpCastDatetime"/>)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'">
COALESCE(<xsl:value-of select="$Op1"/> + <xsl:apply-templates select="./*[2]"/>, <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/> + <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND, <xsl:apply-templates select="./*[1]"/>, <xsl:apply-templates select="./*[2]"/>)
</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/> + <xsl:value-of select="$Op2"/>, <xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$OpCastDatetime"/>)
</xsl:when>
<xsl:when test="@Op2Type = 'Datetime'">
COALESCE(<xsl:value-of select="$Op1"/> + <xsl:apply-templates select="./*[2]"/>, <xsl:apply-templates select="./*[2]"/>, <xsl:value-of select="$OpCastDatetime"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[1]"/> +  <xsl:apply-templates select="./*[2]"/> , <xsl:apply-templates select="./*[1]"/>, <xsl:apply-templates select="./*[2]"/>)
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- OpSubtract -->
<xsl:template match="OpSubtract">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Type != 'Datetime' and @Op2Type = 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="@Op1Type"/>
<xsl:with-param name="target-type" select="'Datetime'"/>
<xsl:with-param name="value-node" select="./*[1]"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[1]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Type = 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'Datetime'"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="value-node" select="./*[2]"/>
</xsl:call-template>
</xsl:when>
<xsl:when test="@Op1Type = 'Datetime' and @Op2Type != 'Datetime'">
(<xsl:apply-templates select="./*[2]"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND)
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="./*[2]"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<!--Try cast operator rather than hardcoding op2 conversion to datetime. Below variable reference has a problem that need to be resolved-->
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false' and @Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
(<xsl:value-of select="$Op1"/> - <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
(<xsl:apply-templates select="./*[1]"/> - <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false' and @Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/> - <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND, <xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:when test="@Op1Nullable = 'false'">
COALESCE(<xsl:apply-templates select="./*[1]"/> - <xsl:value-of select="$Op2"/>, <xsl:apply-templates select="./*[1]"/>)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false' and @Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/> - <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND
, CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP) - <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND)
</xsl:when>
<xsl:when test="@Op2Nullable = 'false'and @Op1Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/> - <xsl:value-of select="$Op2"/>, CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP) - <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="@Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/> - <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND,
<xsl:apply-templates select="./*[1]"/>, CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP) - <xsl:value-of select="$Op2"/> * 86400 * INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND)
</xsl:when>
<xsl:when test="@Op1Type = 'Datetime'">
COALESCE(<xsl:apply-templates select="./*[1]"/> - <xsl:value-of select="$Op2"/> , <xsl:apply-templates select="./*[1]"/>, CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP) - <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:otherwise>
COALESCE(<xsl:apply-templates select="./*[1]"/> - <xsl:value-of select="$Op2"/>, <xsl:apply-templates select="./*[1]"/>, -<xsl:value-of select="$Op2"/>)
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

<!-- OpMultiply -->
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
so using direct cast. It gives us desired result here. -->
CAST(<xsl:apply-templates select="./*[1]"/> * <xsl:apply-templates select="./*[2]"/> AS DECIMAL(19, 4))
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
(CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL THEN NULL ELSE CASE WHEN <xsl:value-of select="$Op2"/> IS NULL OR <xsl:value-of select="$Op2"/> = 0 THEN <xsl:apply-templates select="./*[3]"/> ELSE <xsl:apply-templates select="./*[1]"/> / <xsl:value-of select="$Op2"/> END END)
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

<!-- OpPOWER|OpQUOTIENT|OpROUND|OpROUNDUP|OpMROUND|OpCEILING|OpISO.CEILING|OpROUNDDOWN|OpTRUNC these functions are only supported with Teradata 14.0 and above -->
<xsl:template match="OpPOWER|OpQUOTIENT|OpROUND|OpROUNDUP|OpMROUND|OpCEILING|OpISO.CEILING|OpROUNDDOWN|OpTRUNC">
<xsl:variable name="Op1">
<xsl:apply-templates select="./*[1]"/>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpPOWER'">
POWER(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="name()='OpQUOTIENT'">
CAST((<xsl:value-of select="$Op1"/> / <xsl:value-of select="$Op2"/>) AS INTEGER)
</xsl:when>
<xsl:when test="name()='OpROUND'">
ROUND(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="name()='OpROUNDDOWN' or name() = 'OpTRUNC'">
TRUNC(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="name()='OpROUNDUP'">
CEIL(ABS(<xsl:value-of select="$Op1"/>) * POWER(10.0, <xsl:value-of select="$Op2"/>)) * SIGN(<xsl:value-of select="$Op1"/>) /  POWER(10.0, <xsl:value-of select="$Op2"/>)
</xsl:when>
<xsl:when test="name()='OpMROUND'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
(CASE WHEN <xsl:value-of select="$Op2"/> = 0 THEN 0 ELSE ROUND(<xsl:value-of select="$Op1"/>/<xsl:value-of select="$Op2"/>, 0)*<xsl:value-of select="$Op2"/> END)
</xsl:when>
<xsl:otherwise>
(CASE WHEN <xsl:value-of select="$Op1"/> IS NULL THEN NULL ELSE CASE WHEN <xsl:value-of select="$Op2"/> = 0 THEN 0 ELSE ROUND(<xsl:value-of select="$Op1"/>/<xsl:value-of select="$Op2"/>, 0)*<xsl:value-of select="$Op2"/> END END)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpCEILING'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2Static=1">
CEIL(<xsl:value-of select="$Op1"/>)
</xsl:when>
<xsl:otherwise>
(CASE WHEN <xsl:value-of select="$Op2"/> = 0 THEN 0 ELSE CEIL(<xsl:value-of select="$Op1"/>/<xsl:value-of select="$Op2"/>)*<xsl:value-of select="$Op2"/> END)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
(CASE WHEN <xsl:value-of select="$Op1"/> IS NULL THEN NULL ELSE CASE WHEN <xsl:value-of select="$Op2"/> = 0 THEN 0 ELSE CEIL(<xsl:value-of select="$Op1"/>/<xsl:value-of select="$Op2"/>)*<xsl:value-of select="$Op2"/> END END)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpISO.CEILING'">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'">
<xsl:choose>
<xsl:when test="@Op2Static=1">
CEIL(<xsl:value-of select="$Op1"/>)
</xsl:when>
<xsl:otherwise>
(CASE WHEN <xsl:value-of select="$Op2"/> = 0 THEN 0 ELSE CEIL(<xsl:value-of select="$Op1"/>/ABS(<xsl:value-of select="$Op2"/>))*ABS(<xsl:value-of select="$Op2"/>) END)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
(CASE WHEN <xsl:value-of select="$Op1"/> IS NULL THEN NULL ELSE CASE WHEN <xsl:value-of select="$Op2"/> = 0 THEN 0 ELSE CEIL(<xsl:value-of select="$Op1"/>/ABS(<xsl:value-of select="$Op2"/>))*ABS(<xsl:value-of select="$Op2"/>) END END)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:template>


<!--
String functions with two or more arguments for Teradata
-->

<xsl:template match="OpMID">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op3">
<xsl:choose>
<xsl:when test="@Op3Nullable = 'false'"><xsl:apply-templates select="./*[3]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[3]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
SUBSTR(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op3"/>)
</xsl:template>

<xsl:template match="OpLEFT|OpRIGHT|OpREPT">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpLEFT'">SUBSTR(<xsl:apply-templates select="./*[1]"/>, 1, <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpRIGHT'">SUBSTR(<xsl:apply-templates select="./*[1]"/>, CHARACTER_LENGTH(<xsl:apply-templates select="./*[1]"/>) - <xsl:value-of select="$Op2"/> + 1, <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpREPT'">RPAD('', CHARACTER_LENGTH(<xsl:apply-templates select="./*[1]"/>) * <xsl:value-of select="$Op2"/>, <xsl:apply-templates select="./*[1]"/>)</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpCONCATENATE">
<!-- CONCATENATE(BLANK(), BLANK()) would return "" instead of BLANK -->
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"><xsl:apply-templates select="./*[1]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, '')</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, '')</xsl:otherwise>
</xsl:choose>
</xsl:variable>
(<xsl:value-of select="$Op1"/> || <xsl:value-of select="$Op2"/>)
</xsl:template>

<xsl:template match="OpSUBSTITUTE">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, '')</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op3">
<xsl:choose>
<xsl:when test="@Op3Nullable = 'false'"><xsl:apply-templates select="./*[3]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[3]"/>, '')</xsl:otherwise>
</xsl:choose>
</xsl:variable>
OREPLACE(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op3"/>)
</xsl:template>

<xsl:template match="OpSEARCH|OpPATTERNSEARCH|OpFIND">
<!-- Teradata supports regular expressions starting from Teradata 14. TODO: Split Teradata cartridges by versions. -->
<!-- Use POSITION when search from the beginning, INSTR when not. INSTR seems to be case sensitive by default. -->
<!-- Unlike DAX, INSTR and REGEXP_INSTR cannot find empty string, on the other hand, POSITION can. TODO: DAX has bug when search empty string not from the beginning. -->
<!-- Since we cannot use subquery in scalar expressions, we perform search twice except for SEARCH/FIND(find_text, within_text, start_num, 0), a very inefficient workaround since we cannot solve the problem at a higher level. -->
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="@Op1Nullable = 'false'"><xsl:apply-templates select="./*[1]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[1]"/>, '')</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, '')</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpSEARCH' or name()='OpPATTERNSEARCH'">
<xsl:choose>
<xsl:when test="./Parameter[1] or ./InlineParameter[1]">
<xsl:choose>
<xsl:when test="name()='OpSEARCH'">
<xsl:choose>
<xsl:when test="@Op4Static=0">
<xsl:choose>
<xsl:when test="@Op3Static=1">
POSITION(<xsl:value-of select="$Op1"/> IN (<xsl:value-of select="$Op2"/> (NOT CASESPECIFIC)))
</xsl:when>
<xsl:otherwise>
INSTR(UPPER(<xsl:value-of select="$Op2"/>), UPPER(<xsl:value-of select="$Op1"/>), <xsl:apply-templates select="./*[3]"/>)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
(CASE WHEN INSTR(UPPER(<xsl:value-of select="$Op2"/>), UPPER(<xsl:value-of select="$Op1"/>), <xsl:apply-templates select="./*[3]"/>) > 0 THEN INSTR(UPPER(<xsl:value-of select="$Op2"/>), UPPER(<xsl:value-of select="$Op1"/>), <xsl:apply-templates select="./*[3]"/>) ELSE <xsl:apply-templates select="./*[4]"/> END)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:when test="name()='OpPATTERNSEARCH'">
<xsl:choose>
<xsl:when test="@Op4Static=0">
REGEXP_INSTR(<xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op1"/>, <xsl:apply-templates select="./*[3]"/>, 1, 0, 'i')
</xsl:when>
<xsl:otherwise>
(CASE WHEN REGEXP_INSTR(<xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op1"/>, <xsl:apply-templates select="./*[3]"/>, 1, 0, 'i') > 0 THEN REGEXP_INSTR(<xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op1"/>, <xsl:apply-templates select="./*[3]"/>, 1, 0, 'i') ELSE <xsl:apply-templates select="./*[4]"/> END)
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
<xsl:choose>
<xsl:when test="@Op3Static=1">
POSITION(<xsl:value-of select="$Op1"/> IN (<xsl:value-of select="$Op2"/> (CASESPECIFIC)))
</xsl:when>
<xsl:otherwise>
INSTR(<xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op1"/>, <xsl:apply-templates select="./*[3]"/>)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
(CASE WHEN INSTR(<xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op1"/>, <xsl:apply-templates select="./*[3]"/>) > 0 THEN INSTR(<xsl:value-of select="$Op2"/>, <xsl:value-of select="$Op1"/>, <xsl:apply-templates select="./*[3]"/>) ELSE <xsl:apply-templates select="./*[4]"/> END)
</xsl:otherwise>
</xsl:choose>
</xsl:when>
</xsl:choose>
</xsl:template>


<xsl:template match="OpYEAR">EXTRACT(YEAR FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpQUARTER">CEIL(EXTRACT(MONTH FROM <xsl:apply-templates select="./*[1]"/>)/3.0)</xsl:template>
<xsl:template match="OpMONTH">EXTRACT(MONTH FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpDAY">EXTRACT(DAY FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>

<xsl:template match="OpWEEKNUM">
<xsl:choose>
<!-- Teradata returns 0 for the first partial week while DAX returns 1. We cannot simply add 1 since Teradata would return 1 if first week is a full week. -->
<xsl:when test="@WeekBeginsOn='Sunday' and @System='1'">(WEEKNUMBER_OF_YEAR(<xsl:apply-templates select="./*[1]"/>, 'Teradata') + CASE WHEN WEEKNUMBER_OF_YEAR(CAST((EXTRACT(YEAR FROM <xsl:apply-templates select="./*[1]"/>) - 1900) * 10000 + 101 AS DATE)) = 0 THEN 1 ELSE 0 END)</xsl:when>
<xsl:when test="@WeekBeginsOn='Monday' and @System='2'">WEEKNUMBER_OF_YEAR(<xsl:apply-templates select="./*[1]"/>, 'ISO')</xsl:when>
<xsl:otherwise>
<xsl:message terminate="yes">Cartridge error: Unsupported parameters for OpWEEKNUM.</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="OpWEEKDAY">
<xsl:choose>
<xsl:when test="@WeekBeginsOn='Sunday' and @FirstDayIndex='1'">DAYNUMBER_OF_WEEK(<xsl:apply-templates select="./*[1]"/>, 'Teradata')</xsl:when>
<xsl:when test="@WeekBeginsOn='Monday' and @FirstDayIndex='1'">DAYNUMBER_OF_WEEK(<xsl:apply-templates select="./*[1]"/>, 'ISO')</xsl:when>
<xsl:when test="@WeekBeginsOn='Tuesday' and @FirstDayIndex='1'">DAYNUMBER_OF_WEEK(<xsl:apply-templates select="./*[1]"/> - INTERVAL '2' DAY, 'Teradata')</xsl:when>
<xsl:when test="@WeekBeginsOn='Wednesday' and @FirstDayIndex='1'">DAYNUMBER_OF_WEEK(<xsl:apply-templates select="./*[1]"/> - INTERVAL '3' DAY, 'Teradata')</xsl:when>
<xsl:when test="@WeekBeginsOn='Thursday' and @FirstDayIndex='1'">DAYNUMBER_OF_WEEK(<xsl:apply-templates select="./*[1]"/> - INTERVAL '4' DAY, 'Teradata')</xsl:when>
<xsl:when test="@WeekBeginsOn='Friday' and @FirstDayIndex='1'">DAYNUMBER_OF_WEEK(<xsl:apply-templates select="./*[1]"/> - INTERVAL '5' DAY, 'Teradata')</xsl:when>
<xsl:when test="@WeekBeginsOn='Saturday' and @FirstDayIndex='1'">DAYNUMBER_OF_WEEK(<xsl:apply-templates select="./*[1]"/> - INTERVAL '6' DAY, 'Teradata')</xsl:when>
<xsl:when test="@WeekBeginsOn='Monday' and @FirstDayIndex='0'">(DAYNUMBER_OF_WEEK(<xsl:apply-templates select="./*[1]"/> - INTERVAL '1' DAY, 'Teradata') - 1)</xsl:when>
<xsl:otherwise>
<xsl:message terminate="yes">Cartridge error: Unsupported parameters for OpWEEKDAY.</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="OpHOUR">EXTRACT(HOUR FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpMINUTE">EXTRACT(MINUTE FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSECOND">EXTRACT(SECOND FROM <xsl:apply-templates select="./*[1]"/>)</xsl:template>

<!-- Teradata requires all three components to be in valid range, does not accept input such as DATE(2016, 2, 30) to perform date shifting as in Excel -->
<!-- For the same reason, there is no point coalescing three arguments to 0 which is outside valid range in all three cases. -->
<xsl:template match="OpDATE">CAST((<xsl:apply-templates select="./*[1]"/> - 1900) * 10000 + <xsl:apply-templates select="./*[2]"/> * 100 + <xsl:apply-templates select="./*[3]"/> AS DATE)</xsl:template>

<xsl:template match="OpTIME">
<!-- DAX treats TIME(BLANK, BLANK, BLANK) specially but not when all arguments are not BLANK. -->
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
<!-- TODO: Revisit our design to make TIME() fall on 1899/12/30. This will confuse DQ users in most cases. -->
<!-- TimestampStringForOriginDate is a string literal, not timestamp, using it here makes code less readable. -->
<!-- All bets are off when values of each component exceed normal hour/minute/second range. -->
(timestamp'1899-12-30 00:00:00' + CAST(<xsl:value-of select="$Op1"/> AS INTERVAL HOUR) + CAST(<xsl:value-of select="$Op2"/> AS INTERVAL MINUTE) + CAST(<xsl:value-of select="$Op3"/> AS INTERVAL SECOND))
</xsl:template>

<xsl:template match="OpEDATE|OpEOMONTH">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpEDATE'">ADD_MONTHS(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpEOMONTH'">LAST_DAY(ADD_MONTHS(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>))</xsl:when>
</xsl:choose>
</xsl:template>

<!-- True and False                                                       -->
<xsl:template match="True">
<xsl:choose>
<xsl:when test="@SqlBool = 'true'">
1=1
</xsl:when>
<xsl:otherwise>
1
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="False">
<xsl:choose>
<xsl:when test="@SqlBool = 'true'">
1=0
</xsl:when>
<xsl:otherwise>
0
</xsl:otherwise>
</xsl:choose>
</xsl:template>


<!-- Cast                                                             -->
<xsl:template match="Cast">
CAST(<xsl:apply-templates select="./*[1]"/> AS <xsl:apply-templates select="./*[2]"/>)
</xsl:template>
<!--Global Variables for IntegerToTimeStamp Conversion-->
<xsl:variable name="DateStringForOriginDate">'1899-12-30'</xsl:variable>
<xsl:variable name="TimestampStringForOriginDate">'1899-12-30 00:00:00.000'</xsl:variable>
<xsl:variable name="TimestampStringForSQLBoolTrue">'1899-12-31 00:00:00.000'</xsl:variable>
<xsl:variable name="IntervalDayToSecondString">'0000 00:00:01.000000'</xsl:variable>

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
<xsl:param name="source-target-type" select="@SourceTargetType"/>
<xsl:param name="op1-source-provider-type" select="@Op1SourceProviderType"/>
<xsl:param name="value-node" select="./*[1]"/>
<xsl:choose>
<xsl:when test="$target-type = 'Double'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
((CAST(<xsl:apply-templates select="$value-node"/> as DATE) - CAST(<xsl:value-of select="$DateStringForOriginDate"/> AS DATE))
+ CAST(EXTRACT(HOUR from <xsl:apply-templates select="$value-node"/>) AS DOUBLE PRECISION) /24
+ CAST(EXTRACT(MINUTE from <xsl:apply-templates select="$value-node"/>) AS DOUBLE PRECISION)/(1440)
+ CAST(EXTRACT(SECOND from <xsl:apply-templates select="$value-node"/>) AS DOUBLE PRECISION)/(86400))
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END AS FLOAT)
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="$op1-source-provider-type='IntervalDayToHour'">
(EXTRACT(DAY FROM <xsl:apply-templates select="$value-node"/>) + EXTRACT(HOUR FROM <xsl:apply-templates select="$value-node"/>) / 2.4E1)
</xsl:when>
<xsl:when test="$op1-source-provider-type='IntervalDayToMinute'">
(EXTRACT(DAY FROM <xsl:apply-templates select="$value-node"/>) + (EXTRACT(HOUR FROM <xsl:apply-templates select="$value-node"/>) * 60 + EXTRACT(MINUTE FROM <xsl:apply-templates select="$value-node"/>)) / 1.44E3)
</xsl:when>
<xsl:when test="$op1-source-provider-type='IntervalDayToSecond'">
(EXTRACT(DAY FROM <xsl:apply-templates select="$value-node"/>) + (EXTRACT(HOUR FROM <xsl:apply-templates select="$value-node"/>) * 3600 + EXTRACT(MINUTE FROM <xsl:apply-templates select="$value-node"/>) * 60 + EXTRACT(SECOND FROM <xsl:apply-templates select="$value-node"/>)) / 8.64E4)
</xsl:when>
<xsl:when test="$op1-source-provider-type='IntervalHour'">
(CAST(<xsl:apply-templates select="$value-node"/> AS FLOAT) / 2.4E1)
</xsl:when>
<xsl:when test="$op1-source-provider-type='IntervalHourToMinute'">
((EXTRACT(HOUR FROM <xsl:apply-templates select="$value-node"/>) * 60 + EXTRACT(MINUTE FROM <xsl:apply-templates select="$value-node"/>)) / 1.44E3)
</xsl:when>
<xsl:when test="$op1-source-provider-type='IntervalHourToSecond'">
((EXTRACT(HOUR FROM <xsl:apply-templates select="$value-node"/>) * 3600 + EXTRACT(MINUTE FROM <xsl:apply-templates select="$value-node"/>) * 60 + EXTRACT(SECOND FROM <xsl:apply-templates select="$value-node"/>)) / 8.64E4)
</xsl:when>
<xsl:when test="$op1-source-provider-type='IntervalMinute'">
(CAST(<xsl:apply-templates select="$value-node"/> AS FLOAT) / 1.44E3)
</xsl:when>
<xsl:when test="$op1-source-provider-type='IntervalMinuteToSecond'">
((EXTRACT(MINUTE FROM <xsl:apply-templates select="$value-node"/>) * 60 + EXTRACT(SECOND FROM <xsl:apply-templates select="$value-node"/>)) / 8.64E4)
</xsl:when>
<xsl:when test="$op1-source-provider-type='IntervalSecond'">
(CAST(<xsl:apply-templates select="$value-node"/> AS FLOAT) / 8.64E4)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS FLOAT)
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'Integer'">
<xsl:variable name="Op1">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="'Datetime'"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="value-node" select="./*[1]"/>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates select="$value-node"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
CAST(<xsl:value-of select="$Op1"/> + CASE WHEN <xsl:value-of select="$Op1"/> &lt; 0 THEN -0.5 ELSE 0.5 END AS BIGINT)
</xsl:when>
<xsl:when test="$param-type = 'Double' or $param-type = 'Currency'">
CAST(<xsl:value-of select="$Op1"/> + CASE WHEN <xsl:value-of select="$Op1"/> &lt; 0 THEN -0.5 ELSE 0.5 END AS BIGINT)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END AS BIGINT)
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="$op1-source-provider-type='IntervalDayToHour' or
$op1-source-provider-type='IntervalDayToMinute' or
$op1-source-provider-type='IntervalDayToSecond' or
$op1-source-provider-type='IntervalHour' or
$op1-source-provider-type='IntervalHourToMinute' or
$op1-source-provider-type='IntervalHourToSecond' or
$op1-source-provider-type='IntervalMinute' or
$op1-source-provider-type='IntervalMinuteToSecond' or
$op1-source-provider-type='IntervalSecond'">
CAST(ROUND(
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="$param-type"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="source-target-type" select="$source-target-type"/>
<xsl:with-param name="op1-source-provider-type" select="$op1-source-provider-type"/>
<xsl:with-param name="value-node" select="./*[1]"/>
</xsl:call-template>
, 0) AS BIGINT)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS BIGINT)
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'Currency'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
((CAST(<xsl:apply-templates select="$value-node"/> AS DATE) - CAST(<xsl:value-of select="$DateStringForOriginDate"/> AS DATE) AS DECIMAL(19, 4)) + CAST(EXTRACT(HOUR FROM <xsl:apply-templates select="$value-node"/>) AS DECIMAL(19, 4)) / 24 + CAST(EXTRACT(MINUTE FROM <xsl:apply-templates select="$value-node"/>) AS DECIMAL(19, 4))/(24*60) + CAST(EXTRACT(SECOND FROM <xsl:apply-templates select="$value-node"/>))/(24*60*60))
</xsl:when>
<xsl:when test="$param-type = 'Double'">
CAST(ROUND(<xsl:value-of select="$value-node"/>, 4) AS DECIMAL(19, 4))
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END AS DECIMAL(19, 4))
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="$op1-source-provider-type='IntervalDayToHour' or
$op1-source-provider-type='IntervalDayToMinute' or
$op1-source-provider-type='IntervalDayToSecond' or
$op1-source-provider-type='IntervalHour' or
$op1-source-provider-type='IntervalHourToMinute' or
$op1-source-provider-type='IntervalHourToSecond' or
$op1-source-provider-type='IntervalMinute' or
$op1-source-provider-type='IntervalMinuteToSecond' or
$op1-source-provider-type='IntervalSecond'">
CAST(ROUND(
<xsl:call-template name="OpCast">
<xsl:with-param name="param-type" select="$param-type"/>
<xsl:with-param name="target-type" select="'Double'"/>
<xsl:with-param name="source-target-type" select="$source-target-type"/>
<xsl:with-param name="op1-source-provider-type" select="$op1-source-provider-type"/>
<xsl:with-param name="value-node" select="./*[1]"/>
</xsl:call-template>
, 4) AS DECIMAL(19, 4))
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS DECIMAL(19, 4))
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'SqlBool'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
(<xsl:apply-templates select="$value-node"/> &lt;&gt; CAST(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP))
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
<xsl:apply-templates select="$value-node"/>
</xsl:when>
<xsl:when test="$param-type = 'String'">
(CAST(<xsl:apply-templates select="$value-node"/> AS BYTEINT) = 1)
</xsl:when>
<xsl:otherwise>
(<xsl:apply-templates select="$value-node"/> &lt;&gt; 0)
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'SqlBit'">
<xsl:choose>
<xsl:when test="$param-type = 'Datetime'">
(CAST(CAST(<xsl:apply-templates select="$value-node"/> AS DATE) - CAST(<xsl:value-of select="$DateStringForOriginDate"/> AS DATE) AS BYTEINT))
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS BYTEINT)
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'Datetime'">
<xsl:choose>
<!-- select cast(1 as DATETIME) -2 =  1899-12-31 00:00:00.000, select cast(0 as DATETIME) -2 = 1899-12-30 00:00:00.000  -->
<xsl:when test="$param-type = 'SqlBool'">
CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN <xsl:value-of select="$TimestampStringForSQLBoolTrue"/> ELSE <xsl:value-of select="$TimestampStringForOriginDate"/> END AS TIMESTAMP)
</xsl:when>
<xsl:when test="$param-type = 'Double'
or $param-type = 'Integer'
or $param-type = 'Currency'
or $param-type = 'SqlBit'">
cast(<xsl:value-of select="$TimestampStringForOriginDate"/> AS TIMESTAMP) + ((<xsl:apply-templates select="$value-node"/>)*86400* INTERVAL <xsl:value-of select="$IntervalDayToSecondString"/> DAY TO SECOND)
</xsl:when>
<xsl:otherwise>
CAST(<xsl:apply-templates select="$value-node"/> AS TIMESTAMP)
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:when test="$target-type = 'String'">
<xsl:choose>
<xsl:when test="$param-type = 'SqlBit'">
(CASE WHEN <xsl:apply-templates select="$value-node"/> = 1 THEN (U&amp;'TRUE' UESCAPE '&#038;') ELSE (U&amp;'FALSE' UESCAPE '&#038;') END)
</xsl:when>
<xsl:when test="$param-type = 'SqlBool'">
(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN (U&amp;'TRUE' UESCAPE '&#038;') ELSE (U&amp;'FALSE' UESCAPE '&#038;') END)
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
<xsl:message terminate="yes">tdtv2r41 cartridge error: OpCast: ResultType is not specified</xsl:message>
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
<!-- OpBITLSHIFT|OpBITRSHIFT -->
<xsl:template match="OpBITLSHIFT|OpBITRSHIFT">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:choose>
<xsl:when test="name()='OpBITLSHIFT'">SHIFTLEFT(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpBITRSHIFT'">SHIFTRIGHT(<xsl:apply-templates select="./*[1]"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
</xsl:choose>
</xsl:template>
<xsl:template match="OpBITAND">
BITAND(<xsl:apply-templates select="./*[1]"/>, <xsl:apply-templates select="./*[2]"/>)
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
<xsl:when test="name()='OpBITOR'">BITOR(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpBITXOR'">BITXOR(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
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
<xsl:when test="name()='OpLOG10'">LOG(<xsl:value-of select="$Op1"/>)</xsl:when>
</xsl:choose>
</xsl:template>

<xsl:template match="OpASIN">ASIN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpATAN">ATAN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpDEGREES">(<xsl:apply-templates select="./*[1]"/> * 5.72957795130823E1)</xsl:template>

<!-- Teradata does not support scalar subselects referring to from Tables which means that we have to repeat the operands
which means that we cannot use paramaters for Teradata -->
<xsl:template match="OpMOD">
<xsl:variable name="Op2">
<xsl:choose>
<xsl:when test="@Op2Nullable = 'false'"><xsl:apply-templates select="./*[2]"/></xsl:when>
<xsl:otherwise>COALESCE(<xsl:apply-templates select="./*[2]"/>, 0)</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<!-- MOD in Teradata behaves differently for Op1 and Op2 having opposite signs -->
(<xsl:apply-templates select="./*[1]"/> - <xsl:apply-templates select="./*[2]"/> * FLOOR(<xsl:apply-templates select="./*[1]"/> / <xsl:apply-templates select="./*[2]"/>))
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
<xsl:when test="name()='OpMAX'">GREATEST(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
<xsl:when test="name()='OpMIN'">LEAST(<xsl:value-of select="$Op1"/>, <xsl:value-of select="$Op2"/>)</xsl:when>
</xsl:choose>
</xsl:template>

<!-- LOG differ from DAX by converting BLANK to 0 to keep SQL expressions simple -->
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
(LN(<xsl:value-of select="$Op1"/>) / LN(<xsl:value-of select="$Op2"/>))
</xsl:template>

<xsl:template match="OpRADIANS">(<xsl:apply-templates select="./*[1]"/> * 1.74532925199433E-2)</xsl:template>
<xsl:template match="OpSIN">SIN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSINH">SINH(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
<xsl:template match="OpSQRTPI">SQRT(<xsl:apply-templates select="./*[1]"/> * 3.14159265358979E0)</xsl:template>
<xsl:template match="OpTAN">TAN(<xsl:apply-templates select="./*[1]"/>)</xsl:template>
</xsl:stylesheet>
