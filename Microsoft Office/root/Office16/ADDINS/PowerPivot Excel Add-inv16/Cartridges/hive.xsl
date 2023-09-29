<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0" xmlns:mssqlcrt="urn:sql-microsoft-com:sqlcrt" xmlns:mssqldbg="urn:sql-microsoft-com:sqldbg">
	<xsl:output method="xml" indent="yes"/>

	<!-- This ALWAYS GENERATED file contains the definitions for the cartridges
	             Microsoft Cartridge Interfaces (Analysis Services 2005)
	             (C) Copyright 1988 - 2003 By Microsoft Corporation.      -->


	<!-- Area of Custom parametrizations: these may be modified by customers for specific query customizations  -->
	<!-- post-select-query-hint will append the customer-defined string at the end of the generated SELECT statement - e.g. WITH UR -->
	<xsl:param name="post-select-query-hint"></xsl:param>

  <!-- Hadoop Hive pluggable cartridge                              -->
  <!-- this cartridge targets Spark and Impala as well (not just old-fashioned Hive)-->
  <!-- datasources running both in HDI, On-prem and on AWS                          -->

  <!-- Area of STANDARD parametrizations: these are externally passed   -->
  <xsl:param name="in_CanUseParams">no</xsl:param>
  <xsl:param name="in_IdentStartQuotingCharacter">`</xsl:param>
  <xsl:param name="in_IdentEndQuotingCharacter">`</xsl:param>
  <xsl:param name="in_StringStartQuotingCharacter">'</xsl:param>
  <xsl:param name="in_StringEndQuotingCharacter">'</xsl:param>

  <!-- Area of CORE parametrizations: These are externally checked      -->
  <mssqlcrt:provider type="prefix" managed="yes" native="yes">Hive</mssqlcrt:provider>
  <mssqlcrt:provider type="prefix" managed="yes" native="yes">Spark SQL</mssqlcrt:provider>
  <mssqlcrt:provider type="prefix" managed="yes" native="yes">TEXT</mssqlcrt:provider>
	<mssqlcrt:provider type="prefix" managed="yes" native="yes">Impala</mssqlcrt:provider> 
  <mssqlcrt:parameter-style native="unnamed" managed="named"/>

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
    <mssqlcrt:supports-datetime-format>YYYY-MM-DD HH:MM:SS</mssqlcrt:supports-datetime-format>
    <mssqlcrt:supports-fast-writeback>TABLOCK,FIRE_TRIGGERS</mssqlcrt:supports-fast-writeback>
    <mssqlcrt:supports-recursive-select>1</mssqlcrt:supports-recursive-select>
    <mssqlcrt:supports-materialized-view>2</mssqlcrt:supports-materialized-view>
    <mssqlcrt:supports-real-time/>
    <mssqlcrt:supports-joins/>
    <mssqlcrt:supports-apply/>
    <mssqlcrt:supports-distinct-count/>
    <mssqlcrt:supports-boolean-type/>
    <mssqlcrt:supports-top/>
    <!-- mssqlcrt:supports-materialized-view-prevalidation -->

    <mssqlcrt:limit-materialized-view-column-count>16</mssqlcrt:limit-materialized-view-column-count>
    <mssqlcrt:limit-table-identifier-length>64</mssqlcrt:limit-table-identifier-length>
    <mssqlcrt:limit-column-identifier-length>64</mssqlcrt:limit-column-identifier-length>
    <mssqlcrt:limit-parameter-count>2100</mssqlcrt:limit-parameter-count>
	<mssqlcrt:limit-in-operator-list-size>2100</mssqlcrt:limit-in-operator-list-size>
    <mssqlcrt:limit-temptable-row-count>0</mssqlcrt:limit-temptable-row-count>
    <mssqlcrt:limit-batch-insert-count>0</mssqlcrt:limit-batch-insert-count>

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

	<!-- Generated statement packaging                                    -->
	<xsl:template match="/">
		<xsl:element name="Statement">

			<!-- Generate query                                           -->
			<xsl:element name="Text">
				<xsl:apply-templates select="./Statement/*[1]"/>
			</xsl:element>

			<!-- Generate parameters                                      -->
			<xsl:if test="count(./Statement/Parameters/Parameter)!=0 and ((normalize-space($UseParams)='yes') or (normalize-space($UseParams)='nosubsel'))">
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
	
	<!-- Top clause                                                       -->
	<xsl:template match="Top">
		LIMIT <xsl:value-of select="."/>
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
					<xsl:when test="name(..) != 'Statement' and name(..) != 'Insert' and name(..) != 'Union' and name(..) != 'UnionAll'">
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

				SELECT 
				<xsl:apply-templates select="./Distinct"/>
				<xsl:apply-templates select="./ColumnExpressions"/>
				<xsl:apply-templates select="./Sources"/>
				<xsl:apply-templates select="./Where"/>
				<xsl:apply-templates select="./GroupBy"/>
				<xsl:apply-templates select="./OrderBy"/>
				<xsl:apply-templates select="./Top"/>
        
				<xsl:if test="name(..) = 'Statement'">
					<xsl:text> </xsl:text><xsl:value-of select="$post-select-query-hint"/>
				</xsl:if>
				<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert' and name(..) != 'Union' and name(..) != 'UnionAll'">
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

	<!-- Insert statement                                                 -->
	<xsl:template match="Insert">
		INSERT INTO <xsl:apply-templates select="./Target"/>
		<xsl:apply-templates select="./Select"/>
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

	<!-- As construction for SQL 90 takes care of CTEs                    -->
	<xsl:template match="As">
		<xsl:choose>
			<xsl:when test="name(./*[2]) = 'Table'">
				<xsl:apply-templates select="./*[1]"/><xsl:text> </xsl:text><xsl:apply-templates select="./*[2]"/>
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
      <xsl:apply-templates select="./*[2]"/>
      <xsl:call-template name="JoinType"/> 
      <xsl:apply-templates select="./*[3]"/>
      on
      <xsl:apply-templates select="./On/*"/>
    </xsl:template>

    <xsl:template name="JoinType">
      <xsl:variable name="value-node">
        <xsl:value-of select="normalize-space(./JoinType/text())"/>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$value-node = 'LeftOuterJoin'">        left outer join        </xsl:when>
        <xsl:when test="$value-node = 'RightOuterJoin'">       right outer join        </xsl:when>
        <xsl:when test="$value-node = 'FullOuterJoin'">        full outer join        </xsl:when>
        <xsl:when test="$value-node = 'InnerJoin'">            join        </xsl:when>
      </xsl:choose>
    </xsl:template>

    <xsl:template match="CrossJoin">
      <xsl:apply-templates select="./*[1]"/> Cross Join <xsl:apply-templates select="./*[2]"/>
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

<xsl:template match="OpOrderExpression">
		<xsl:choose>
			<xsl:when test="@Op1Type = 'SqlBool'">
				(CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL THEN FALSE ELSE <xsl:apply-templates select="./*[1]"/> END)
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
						COALESCE(<xsl:apply-templates select="./*[1]"/>, <xsl:call-template name="print-datetime-origin-value"/>)
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

	<xsl:template match="Exists">
		EXISTS (<xsl:apply-templates select="./*"/>)
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
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="OrderExpression">
		<xsl:apply-templates select="./*[1]"/>
		<xsl:apply-templates select="./Asc"/>
		<xsl:apply-templates select="./Desc"/>
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
			<xsl:when test="$UseParams = 'yes' or $UseParams = 'nosubsel'">
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
				(CASE WHEN COUNT(*) = COUNT(<xsl:apply-templates select="./*[1]"/>) THEN ((SELECT MIN(<xsl:apply-templates select="./*[1]"/>)) UNION (SELECT MAX(<xsl:apply-templates select="./*[1]"/>))) ELSE ((SELECT MIN(<xsl:apply-templates select="./*[1]"/>)) UNION (SELECT NULL)) END)
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
	<xsl:template match="OpCountSubqueryRows">
		SUM(CAST(1 AS BIGINT)) OVER ()
	</xsl:template>


	<!-- Binary expressions                                               -->
	<!-- Equal/NotEqual/Greater/GreaterOrEqual/Less/LessOrEqual/In/And/Or/Plus/Minus/Divide/Multiply
	     expressions                                                      -->
	<xsl:template match="Equal|NotEqual|Greater|GreaterOrEqual|Less|LessOrEqual|In|And|Or|Plus|Minus|Divide|Multiply">
		<xsl:variable name="operator">
			<xsl:choose>
				<xsl:when test="name()='Equal'">			=		</xsl:when>
				<xsl:when test="name()='NotEqual'">			&lt;&gt;	</xsl:when>
				<xsl:when test="name()='Greater'">			&gt;		</xsl:when>
				<xsl:when test="name()='GreaterOrEqual'"><![CDATA[	>=		]]></xsl:when>
				<xsl:when test="name()='Less'">				&lt;	</xsl:when>
				<xsl:when test="name()='LessOrEqual'">		&lt;=	</xsl:when>
				<xsl:when test="name()='In'">				IN		</xsl:when>
				<xsl:when test="name()='And'">				AND		</xsl:when>
				<xsl:when test="name()='Or'">				OR		</xsl:when>
				<xsl:when test="name()='Plus'">				+		</xsl:when>
				<xsl:when test="name()='Minus'">			-		</xsl:when>
				<xsl:when test="name()='Divide'">			/		</xsl:when>
				<xsl:when test="name()='Multiply'">			*		</xsl:when>
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

	<!--
		Unary expressions where NULL considered as BLANK value(more like 0).
	-->

	<!-- Not																													 -->
	<xsl:template match="Not">
		NOT(<xsl:apply-templates select="./*[1]"/>)
	</xsl:template>

	<xsl:template match="OpNot">
		NOT(<xsl:apply-templates select="./*[1]"/>)
	</xsl:template>
	
	<!-- OpNot_Deprecated and BitNot																											-->
	<!-- Do not use SQL NOT because we need to handle UNKNOWN in a special way -->
	<xsl:template match="OpNot_Deprecated">
		(CASE WHEN (<xsl:apply-templates select="./*[1]"/>) THEN FALSE ELSE TRUE END)
	</xsl:template>

	<xsl:template match="BitNot">
		 <xsl:choose>
			 <xsl:when test="@Op1Nullable = 'false'">
				 NOT <xsl:apply-templates select="./*[1]"/>
			 </xsl:when>
			 <xsl:otherwise>
				 COALESCE(NOT <xsl:apply-templates select="./*[1]"/>, TRUE)
			 </xsl:otherwise>
		 </xsl:choose>
	</xsl:template>

	<!-- UnaryMinus																													 -->
	<xsl:template match="UnaryMinus">
		-(<xsl:apply-templates select="./*[1]"/>)
	</xsl:template>

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

	<!-- Unary Excel math functions that NULL is a fixed point. -->
	<xsl:template match="OpSqr">
		POWER(<xsl:apply-templates select="./*[1]"/>,2)
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
	    COUNT(<xsl:apply-templates select="./*[1]"/> <xsl:apply-templates select="./*[2]"/>)
	</xsl:template>

<xsl:template match="OpDistinctCount">
	(COUNT(DISTINCT <xsl:apply-templates select="./*[1]"/>) + MAX(CASE WHEN <xsl:apply-templates select="./*[1]"/> IS NULL THEN 1 ELSE 0 END))
</xsl:template>

<xsl:template match="OpDistinctCountSkipBlank">
	COUNT(DISTINCT <xsl:apply-templates select="./*[1]"/>)
</xsl:template>
	
	<!--
		Binary expressions where NULL considered as BLANK value(more like 0).
		FUTURE: alleonov: maybe replace prefix Op with something else
	-->
	<!--Comparisons-->
	<xsl:template match="OpGreater|OpLess|OpNotEqual|OpEqual|OpGreaterOrEqual|OpLessOrEqual">
		<xsl:variable name="operator">
			<xsl:choose>
				<xsl:when test="name()='OpGreater'">		&gt;			</xsl:when>
				<xsl:when test="name()='OpLess'">				&lt;			</xsl:when>
				<xsl:when test="name()='OpNotEqual'">		&lt;&gt;	</xsl:when>
				<xsl:when test="name()='OpEqual'">			=					</xsl:when>
				<xsl:when test="name()='OpGreaterOrEqual'">			&gt;=		</xsl:when>
				<xsl:when test="name()='OpLessOrEqual'">				&lt;=	</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Op1">
			<xsl:choose>
				<xsl:when test="@Op1Nullable = 'false'"> (<xsl:apply-templates select="./*[1]"/>) </xsl:when>
				<xsl:when test="@Op1Type = 'String'"> COALESCE(<xsl:apply-templates select="./*[1]"/>, '') </xsl:when>
				<xsl:when test="@Op1Type = 'Datetime'"> COALESCE(<xsl:apply-templates select="./*[1]"/>, 
					<xsl:call-template name="print-datetime-origin-value"/>) 
				</xsl:when>
				<xsl:when test="@Op1Type = 'SqlBool'"> COALESCE(<xsl:apply-templates select="./*[1]"/>, FALSE) </xsl:when>
				<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[1]"/>, 0) </xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="Op2">
			<xsl:choose>
				<xsl:when test="@Op2Nullable = 'false'"> (<xsl:apply-templates select="./*[2]"/>) </xsl:when>
				<xsl:when test="@Op2Type = 'String'"> COALESCE(<xsl:apply-templates select="./*[2]"/>, '') </xsl:when>
				<xsl:when test="@Op2Type = 'Datetime'"> COALESCE(<xsl:apply-templates select="./*[2]"/>, 
					<xsl:call-template name="print-datetime-origin-value"/>)
				</xsl:when>
				<xsl:when test="@Op1Type = 'SqlBool'"> COALESCE(<xsl:apply-templates select="./*[1]"/>, FALSE) </xsl:when>
				<xsl:otherwise> COALESCE(<xsl:apply-templates select="./*[2]"/>, 0) </xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="$Op1"/> <xsl:value-of select="$operator"/> <xsl:value-of select="$Op2"/>
	</xsl:template>

	<!-- OpIs-->
	<xsl:template match="OpIs">
		<xsl:choose>
			<xsl:when test="@Op1Nullable = 'false' or @Op2Nullable = 'false'">
				(<xsl:apply-templates select="./*[1]"/>) = (<xsl:apply-templates select="./*[2]"/>)
			</xsl:when>
			<xsl:otherwise>
				<!--It's illegal to repeat query parameters more than once, so we can use only column references here.-->
				((<xsl:apply-templates select="./*[1]"/>) = (<xsl:apply-templates select="./*[2]"/>) OR (<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) IS NULL)
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
<!-- OpStrictGreater-->
  <xsl:template match="OpStrictGreater">
    <xsl:variable name="Op1Zero">
      <xsl:choose>
        <xsl:when test="@Op1Type = 'String'">''</xsl:when>
        <xsl:when test="@Op1Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:when test="@Op1Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="Op2Zero">
      <xsl:choose>
        <xsl:when test="@Op2Type = 'String'">''</xsl:when>
        <xsl:when test="@Op2Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:when test="@Op2Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/>) &gt; (<xsl:apply-templates select="./*[2]"/>)</xsl:when>      
      <xsl:when test="@Op1Nullable = 'false'">(((<xsl:apply-templates select="./*[2]"/>) IS NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt;= (<xsl:value-of select="$Op1Zero"/>)) OR ((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt; (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>
      <xsl:when test="@Op2Nullable = 'false'">(((<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) &lt; (<xsl:value-of select="$Op2Zero"/>)) OR ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt; (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>
      <xsl:otherwise>(((<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) &lt; (<xsl:value-of select="$Op2Zero"/>)) OR ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[2]"/>) IS NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt;= (<xsl:value-of select="$Op1Zero"/>)) OR ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt; (<xsl:apply-templates select="./*[2]"/>)))</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- OpStrictLess-->
  <xsl:template match="OpStrictLess">
    <xsl:variable name="Op1Zero">
      <xsl:choose>
        <xsl:when test="@Op1Type = 'String'">''</xsl:when>
        <xsl:when test="@Op1Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:when test="@Op1Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="Op2Zero">
      <xsl:choose>
        <xsl:when test="@Op2Type = 'String'">''</xsl:when>
        <xsl:when test="@Op2Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:when test="@Op2Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/>) &lt; (<xsl:apply-templates select="./*[2]"/>)</xsl:when>
      <xsl:when test="@Op1Nullable = 'false'">(((<xsl:apply-templates select="./*[2]"/>) IS NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt; (<xsl:value-of select="$Op1Zero"/>)) OR ((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt; (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>
      <xsl:when test="@Op2Nullable = 'false'">(((<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) &gt;= (<xsl:value-of select="$Op2Zero"/>)) OR ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt; (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>
      <xsl:otherwise>(((<xsl:apply-templates select="./*[2]"/>) IS NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt; (<xsl:value-of select="$Op1Zero"/>)) OR ((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) &gt;= (<xsl:value-of select="$Op2Zero"/>)) OR ((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt; (<xsl:apply-templates select="./*[2]"/>)))</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- OpStrictLessOrEqual-->
  <xsl:template match="OpStrictLessOrEqual">
    <xsl:variable name="Op1Zero">
      <xsl:choose>
        <xsl:when test="@Op1Type = 'String'">''</xsl:when>
        <xsl:when test="@Op1Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:when test="@Op1Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="Op2Zero">
      <xsl:choose>
        <xsl:when test="@Op2Type = 'String'">''</xsl:when>
        <xsl:when test="@Op2Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:when test="@Op2Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/>) &lt;= (<xsl:apply-templates select="./*[2]"/>)</xsl:when>
      <xsl:when test="@Op1Nullable = 'false'">(((<xsl:apply-templates select="./*[2]"/>) IS NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt; (<xsl:value-of select="$Op1Zero"/>)) OR ((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt;= (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>
      <xsl:when test="@Op2Nullable = 'false'">(((<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) &gt;= (<xsl:value-of select="$Op2Zero"/>)) OR ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt;= (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>
      <xsl:otherwise>(((<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) &gt;= (<xsl:value-of select="$Op2Zero"/>)) OR ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[2]"/>) IS NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt; (<xsl:value-of select="$Op1Zero"/>)) OR ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt;= (<xsl:apply-templates select="./*[2]"/>)))</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- OpStrictGreaterOrEqual-->
  <xsl:template match="OpStrictGreaterOrEqual">
    <xsl:variable name="Op1Zero">
      <xsl:choose>
        <xsl:when test="@Op1Type = 'String'">''</xsl:when>
        <xsl:when test="@Op1Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:when test="@Op1Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="Op2Zero">
      <xsl:choose>
        <xsl:when test="@Op2Type = 'String'">''</xsl:when>
        <xsl:when test="@Op2Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:when test="@Op2Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/>) &gt;= (<xsl:apply-templates select="./*[2]"/>)</xsl:when>
      <xsl:when test="@Op1Nullable = 'false'">(((<xsl:apply-templates select="./*[2]"/>) IS NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt;= (<xsl:value-of select="$Op1Zero"/>)) OR ((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt;= (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>
      <xsl:when test="@Op2Nullable = 'false'">(((<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) &lt; (<xsl:value-of select="$Op2Zero"/>)) OR ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt;= (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>      
      <xsl:otherwise>(((<xsl:apply-templates select="./*[2]"/>) IS NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt;= (<xsl:value-of select="$Op1Zero"/>)) OR ((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) &lt; (<xsl:value-of select="$Op2Zero"/>)) OR ((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &gt;= (<xsl:apply-templates select="./*[2]"/>)))</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- OpStrictNotEqual-->
  <xsl:template match="OpStrictNotEqual">
    <xsl:variable name="Op1Zero">
      <xsl:choose>
        <xsl:when test="@Op1Type = 'String'">''</xsl:when>
        <xsl:when test="@Op1Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:when test="@Op1Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="Op2Zero">
      <xsl:choose>
        <xsl:when test="@Op2Type = 'String'">''</xsl:when>
        <xsl:when test="@Op2Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:when test="@Op2Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/>) &lt;&gt; (<xsl:apply-templates select="./*[2]"/>)</xsl:when>
      <xsl:when test="@Op1Nullable = 'false'">((<xsl:apply-templates select="./*[2]"/>) IS NULL OR ((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt;&gt; (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>
      <xsl:when test="@Op2Nullable = 'false'">((<xsl:apply-templates select="./*[1]"/>) IS NULL OR ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) &lt;&gt; (<xsl:apply-templates select="./*[2]"/>)))</xsl:when>                  
      <xsl:otherwise>((<xsl:apply-templates select="./*[1]"/>) &lt;&gt; (<xsl:apply-templates select="./*[2]"/>) AND ((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL OR (<xsl:apply-templates select="./*[2]"/>) IS NOT NULL))</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- OpStrictEqual-->
  <xsl:template match="OpStrictEqual">
    <xsl:variable name="Op1Zero">
      <xsl:choose>
        <xsl:when test="@Op1Type = 'String'">''</xsl:when>
        <xsl:when test="@Op1Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:when test="@Op1Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="Op2Zero">
      <xsl:choose>
        <xsl:when test="@Op2Type = 'String'">''</xsl:when>
        <xsl:when test="@Op2Type = 'SqlBool'">FALSE</xsl:when>
        <xsl:when test="@Op2Type = 'Datetime'">
					<xsl:call-template name="print-datetime-origin-value"/>
				</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">(<xsl:apply-templates select="./*[1]"/>) = (<xsl:apply-templates select="./*[2]"/>)</xsl:when>
      <xsl:when test="@Op1Nullable = 'false'">((<xsl:apply-templates select="./*[2]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) = (<xsl:apply-templates select="./*[2]"/>))</xsl:when>
      <xsl:when test="@Op2Nullable = 'false'">((<xsl:apply-templates select="./*[1]"/>) IS NOT NULL AND (<xsl:apply-templates select="./*[1]"/>) = (<xsl:apply-templates select="./*[2]"/>))</xsl:when>            
      <xsl:otherwise>((<xsl:apply-templates select="./*[1]"/>) = (<xsl:apply-templates select="./*[2]"/>) OR ((<xsl:apply-templates select="./*[1]"/>) IS NULL AND (<xsl:apply-templates select="./*[2]"/>) IS NULL))</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

	<!-- OpAdd-->
	<xsl:template match="OpAdd">
		<!--Only either Op1 or Op2 can be present in the queries, not both-->
		<xsl:variable name="Op1">
			<xsl:choose>
				<xsl:when test="@Op1Type = 'Datetime'">
					<xsl:call-template name="OpCast">
						<xsl:with-param name="param-type" select="'Datetime'"/>
						<xsl:with-param name="target-type" select="'Double'"/>
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
				<xsl:otherwise>
					<xsl:apply-templates select="./*[2]"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="@Op1Type = 'Datetime' and @Op2Type = 'Datetime'">
				COALESCE(CAST(FROM_UNIXTIME(CAST(((<xsl:value-of select="$Op1"/>) + (<xsl:value-of select="$Op2"/>) - 25569)*86400 AS bigint)) AS TIMESTAMP), (<xsl:apply-templates select="./*[1]"/>), (<xsl:apply-templates select="./*[2]"/>))
			</xsl:when>
			<xsl:when test="@Op1Type = 'Datetime'">
				CAST(COALESCE(FROM_UNIXTIME(CAST((<xsl:value-of select="$Op1"/> + <xsl:value-of select="$Op2"/> -25569) *86400 AS bigint)) , CAST((<xsl:apply-templates select="./*[1]"/>) AS String), FROM_UNIXTIME(CAST((<xsl:value-of select="$Op2"/> -25569) *86400 AS bigint))) AS timestamp)
			</xsl:when>
			<xsl:when test="@Op2Type = 'Datetime'">
				CAST(COALESCE(FROM_UNIXTIME(CAST((<xsl:value-of select="$Op1"/> + <xsl:value-of select="$Op2"/> -25569) *86400 AS bigint)) , FROM_UNIXTIME(CAST((<xsl:value-of select="$Op1"/> -25569) *86400 AS bigint)), CAST((<xsl:apply-templates select="./*[2]"/>) AS String)) AS timestamp)
			</xsl:when>
			<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
				(<xsl:apply-templates select="./*[1]"/>) + (<xsl:value-of select="$Op2"/>)
			</xsl:when>
			<xsl:when test="@Op1Nullable = 'false'">
				COALESCE((<xsl:apply-templates select="./*[1]"/>) + (<xsl:value-of select="$Op2"/>), (<xsl:apply-templates select="./*[1]"/>)) 
			</xsl:when>
			<xsl:when test="@Op2Nullable = 'false'">
				COALESCE((<xsl:value-of select="$Op1"/>) + (<xsl:apply-templates select="./*[2]"/>), (<xsl:apply-templates select="./*[2]"/>))
			</xsl:when>			
			<xsl:otherwise>
				COALESCE((<xsl:apply-templates select="./*[1]"/>) + (<xsl:apply-templates select="./*[2]"/>), (<xsl:apply-templates select="./*[1]"/>), (<xsl:apply-templates select="./*[2]"/>))
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- OpSubtract																													 -->
	<xsl:template match="OpSubtract">
		<xsl:variable name="Op1">
			<xsl:choose>
				<xsl:when test="@Op1Type = 'Datetime'">
					<xsl:call-template name="OpCast">
						<xsl:with-param name="param-type" select="'Datetime'"/>
						<xsl:with-param name="target-type" select="'Double'"/>
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
				<xsl:otherwise>
					<xsl:apply-templates select="./*[2]"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="@Op1Type = 'Datetime'">
				CAST(COALESCE(FROM_UNIXTIME(CAST(((<xsl:value-of select="$Op1"/>) - (<xsl:value-of select="$Op2"/>) -25569)*86400 AS bigint)), CAST((<xsl:apply-templates select="./*[1]"/>) AS String), FROM_UNIXTIME(CAST((-1 * (<xsl:value-of select="$Op2"/>) -25569)*86400 AS bigint))) AS timestamp)
			</xsl:when>			
			<xsl:when test="@Op2Type = 'Datetime'">
				CAST(COALESCE(FROM_UNIXTIME(CAST(((<xsl:value-of select="$Op1"/>) - (<xsl:value-of select="$Op2"/>) -25569)*86400 AS bigint)) , FROM_UNIXTIME(CAST((<xsl:value-of select="$Op1"/> -25569) *86400 AS bigint)), FROM_UNIXTIME(CAST((-1 * (<xsl:value-of select="$Op2"/>) -25569)*86400 AS bigint))) AS timestamp)
			</xsl:when>
			<xsl:when test="@Op1Nullable = 'false' and @Op2Nullable = 'false'">
				(<xsl:apply-templates select="./*[1]"/>) - (<xsl:value-of select="$Op2"/>)
			</xsl:when>
			<xsl:when test="@Op1Nullable = 'false'">
				COALESCE((<xsl:apply-templates select="./*[1]"/>) - (<xsl:value-of select="$Op2"/>), (<xsl:apply-templates select="./*[1]"/>)) 
			</xsl:when>
			<xsl:when test="@Op2Nullable = 'false'">
				COALESCE((<xsl:apply-templates select="./*[1]"/>) - (<xsl:value-of select="$Op2"/>), -(<xsl:value-of select="$Op2"/>)) 
			</xsl:when>
			<xsl:otherwise>
				COALESCE((<xsl:apply-templates select="./*[1]"/>) - (<xsl:value-of select="$Op2"/>), (<xsl:apply-templates select="./*[1]"/>), -(<xsl:value-of select="$Op2"/>)) 
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- OpDivide																													 -->
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
				(<xsl:apply-templates select="./*[1]"/>) / (<xsl:value-of select="$Op2"/>)
			</xsl:when>
			<xsl:otherwise>
				(<xsl:apply-templates select="./*[1]"/>) / COALESCE(<xsl:value-of select="$Op2"/>, 0)
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- OpMultiply																													 -->
	<xsl:template match="OpMultiply">
		<xsl:choose>			
			<xsl:when test="@Op1Type = 'Currency' and @Op2Type = 'Currency'">
				(<xsl:apply-templates select="./*[1]"/>) *
				(<xsl:call-template name="OpCast">
					<xsl:with-param name="param-type" select="'Currency'"/>
					<xsl:with-param name="target-type" select="'Double'"/>
					<xsl:with-param name="value-node" select="./*[2]"/>
				</xsl:call-template>)
			</xsl:when>
			<xsl:when test="@Op1Type = 'Double' and @Op2Type = 'Currency' or @Op2Type = 'Double' and @Op1Type = 'Currency'">
				<!--FUTURE: RT: it's impossible to use <xsl:call-template name="OpCast"/> here,
						so using direct cast. It gives us desired result here.					-->
				CAST((<xsl:apply-templates select="./*[1]"/>) * (<xsl:apply-templates select="./*[2]"/>) AS double)
			</xsl:when>
			<xsl:otherwise>
				(<xsl:apply-templates select="./*[1]"/>) * (<xsl:apply-templates select="./*[2]"/>)
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- OpSafeDivide																													 -->
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
		(CASE
			WHEN (<xsl:apply-templates select="./*[1]"/>) IS NULL
		THEN NULL
		ELSE
		(CASE
		WHEN (<xsl:value-of select="$Op2"/>) IS NULL OR (<xsl:value-of select="$Op2"/>) = 0
					THEN (<xsl:apply-templates select="./*[3]"/>)
					ELSE
						(<xsl:apply-templates select="./*[1]"/>) / (<xsl:value-of select="$Op2"/>)
				END)
			END)				
	</xsl:template>

	<xsl:template match="OpInList">
		(<xsl:call-template name="print-children-list"></xsl:call-template>)
	</xsl:template>

	<xsl:template match="OpIn|OpNaryOr">
		<xsl:variable name="operator">
			<xsl:choose>
				<xsl:when test="name()='OpIn'"			> IN </xsl:when>
				<xsl:when test="name()='OpNaryOr'"		> OR </xsl:when>
			</xsl:choose>
		</xsl:variable>
		(
		<xsl:call-template name="print-children-list">
			<xsl:with-param name="operator" select="$operator"/>
		</xsl:call-template>
		)
	</xsl:template>

	<!-- OpOr|OpAnd																													 -->
	<xsl:template match="OpOr|OpAnd">
	<xsl:variable name="operator">
			<xsl:choose>
				<xsl:when test="name()='OpOr'">		OR	</xsl:when>
				<xsl:when test="name()='OpAnd'">	AND	</xsl:when>
			</xsl:choose>
		</xsl:variable>
	(<xsl:apply-templates select="./*[1]"/>) <xsl:value-of select="$operator"/> (<xsl:apply-templates select="./*[2]"/>)
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
				<xsl:when test="name()='IsNull'">			IS NULL		</xsl:when>
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
			<xsl:when test="$type-val = 'DBTYPE_BSTR'">    string       </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_WSTR'">    string       </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_STR'">     varchar      </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_BOOL'">    boolean      </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_I1'">      tinyint      </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_I2'">      smallint     </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_I4'">      int          </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_I8'">      bigint       </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_UI1'">     tinyint      </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_UI2'">     smallint     </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_UI4'">     int          </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_UI8'">     bigint       </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_R4'">      float        </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_R8'">      double       </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_DATE'">    timestamp    </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_DBTIMESTAMP'">    timestamp     </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_CY'">      decimal(19,4)       </xsl:when>
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
		TRUE
	</xsl:template>

	<xsl:template match="False">
		FALSE
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
	<!--     Timestamp                                                      -->
	<!--     String                                                         -->
	<xsl:template name="OpCast" match="OpCast">
		<xsl:param name="param-type" select="@Op1Type"/>
		<xsl:param name="target-type" select="@ResultType"/>
		<xsl:param name="value-node" select="./*[1]"/>
		<xsl:choose>

			<xsl:when test="$target-type = 'Double'">
				<xsl:choose>
					<xsl:when test="$param-type = 'Datetime'">
						(UNIX_TIMESTAMP(<xsl:apply-templates select="$value-node"/>)/86400 + 25569)
					</xsl:when>
					<xsl:when test="$param-type = 'SqlBool'">
						(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1.0 ELSE 0.0 END)
					</xsl:when>
					<xsl:otherwise>
						CAST(<xsl:apply-templates select="$value-node"/> AS float)
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>

			<xsl:when test="$target-type = 'Integer'">
				<xsl:choose>
					<xsl:when test="$param-type = 'Datetime'">
						CAST(ROUND(UNIX_TIMESTAMP(<xsl:apply-templates select="$value-node"/>)/86400 +25569, 0) AS bigint)
					</xsl:when>
					<xsl:when test="$param-type = 'Double' or $param-type = 'Currency'">
						CAST(ROUND((<xsl:apply-templates select="$value-node"/>), 0) AS bigint)
					</xsl:when>
					<xsl:when test="$param-type = 'SqlBool'">
						(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END)
					</xsl:when>
					<xsl:otherwise>
						CAST(<xsl:apply-templates select="$value-node"/> as bigint)
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$target-type = 'Currency'">
				<xsl:choose>
					<xsl:when test="$param-type = 'Datetime'">
						CAST((UNIX_TIMESTAMP(<xsl:apply-templates select="$value-node"/>)/86400 + 25569) AS decimal(19,4))
					</xsl:when>
					<xsl:when test="$param-type = 'SqlBool'">
						CAST(CASE WHEN <xsl:apply-templates select="$value-node"/> THEN 1 ELSE 0 END AS decimal(19,4))
					</xsl:when>
					<xsl:otherwise>
						CAST(<xsl:apply-templates select="$value-node"/> AS decimal(19,4))
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$target-type = 'SqlBool'">
				<xsl:choose>
					<xsl:when test="$param-type = 'Datetime'">
						((<xsl:apply-templates select="$value-node"/>) &lt;&gt;
						<xsl:call-template name="print-datetime-origin-value"/>)
					</xsl:when>
					<xsl:when test="$param-type = 'SqlBool'">
						<xsl:apply-templates select="$value-node"/>
					</xsl:when>					
					<xsl:when test="$param-type = 'String'">
						CAST(TRIM(<xsl:apply-templates select="$value-node"/>) AS BOOLEAN)
					</xsl:when>
					<xsl:otherwise>
						(<xsl:apply-templates select="$value-node"/>) &lt;&gt; 0
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$target-type = 'Datetime'">
				<xsl:choose>
					<xsl:when test="$param-type = 'SqlBool'">
						CAST(CASE WHEN (<xsl:apply-templates select="$value-node"/>) THEN '1899-12-31 00:00:00' ELSE '1899-12-30 00:00:00' END AS timestamp)
					</xsl:when>
					<xsl:when test="$param-type = 'Double'
										or $param-type = 'Integer'
										or $param-type = 'Currency'">
						CAST(FROM_UNIXTIME(CAST((<xsl:apply-templates select="$value-node"/> - 25569)*86400 AS Bigint)) AS timestamp)
					</xsl:when>
					<xsl:otherwise>
						CAST(<xsl:apply-templates select="$value-node"/> AS timestamp)
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>

			<xsl:when test="$target-type = 'String'">
						CAST(<xsl:apply-templates select="$value-node"/> AS string)
			</xsl:when>
			
			<xsl:otherwise>
				<xsl:message terminate="yes">Hive cartridge error: OpCast: ResultType is not specified</xsl:message>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- OpCase                                                           -->
	<xsl:template match="OpCase">
		CASE
		<xsl:for-each select="IfClause">
			<xsl:apply-templates select="./Condition"/>
		</xsl:for-each>
		<xsl:apply-templates select="./Else"/>
		END
	</xsl:template>

	<xsl:template match="Condition">
		WHEN (<xsl:apply-templates select="./*[1]"/>)
		<xsl:apply-templates select="following-sibling::Then[1]"/>
	</xsl:template>

	<xsl:template match="Then">
	THEN (<xsl:apply-templates select="./*[1]"/>)
	</xsl:template>

	<xsl:template match="Else">
		ELSE (<xsl:apply-templates select="./*[1]"/>)
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
			<xsl:when test="$db-type = 'DBTYPE_STR'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_BOOL'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_I1'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_I2'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_I4'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_I8'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_UI1'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_UI2'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_UI4'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_UI8'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_R4'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_R8'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS double)</xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_DATE'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS timestamp)</xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_DBTIMESTAMP'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS timestamp)</xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_CY'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS decimal(19, 4))</xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_VARIANT'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_GUID'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_ByteArray'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_DECIMAL'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_EMPTY'">NULL</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- Set datetime default value                   -->
	<xsl:template name="print-datetime-origin-value">
		CAST('1899-12-30' AS timestamp)
	</xsl:template>
</xsl:stylesheet>
