<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0" xmlns:mssqlcrt="urn:sql-microsoft-com:sqlcrt" xmlns:mssqldbg="urn:sql-microsoft-com:sqldbg">
	<xsl:output method="xml" indent="yes"/>

	<!-- This ALWAYS GENERATED file contains the definitions for the cartridges
	             Microsoft Cartridge Interfaces (Analysis Services 2005)
	             (C) Copyright 1988 - 2003 By Microsoft Corporation.      -->


	<!-- Area of Custom parametrizations: these may be modified by customers for specific query customizations  -->
	<!-- post-select-query-hint will append the customer-defined string at the end of the generated SELECT statement - e.g. WITH UR -->
	<xsl:param name="post-select-query-hint"></xsl:param>

<!-- Sybase ASE 15 pluggable cartridge					-->


<!-- Area of STANDARD parametrizations: These may be passed in externally.	-->

<xsl:param name="in_CanUseParams">yes</xsl:param>
<xsl:param name="in_IdentStartQuotingCharacter">[</xsl:param>
<xsl:param name="in_IdentEndQuotingCharacter">]</xsl:param>
<xsl:param name="in_StringStartQuotingCharacter">N'</xsl:param>
<xsl:param name="in_StringEndQuotingCharacter">'</xsl:param>


<!-- Area of CORE parametrizations: These are externally checked.	-->

<!-- Provider Names 							-->
<mssqlcrt:provider type="prefix" managed="no" native="yes">SQL Server</mssqlcrt:provider>
<mssqlcrt:provider type="prefix" managed="no" native="yes">ASE Server</mssqlcrt:provider>
<mssqlcrt:parameter-style native="unnamed"/>

<!-- Capabilities 							-->
<mssqlcrt:capabilities>
<!-- Supported Capabilities 						-->
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
    <mssqlcrt:supports-join/>
    <mssqlcrt:supports-params/>

<!-- Unsupported capabilities 						-->
    <!-- mssqlcrt:supports-isolated-transaction-in-snapshot-mode 						-->
    <!-- mssqlcrt:supports-data-sampling: Sybase ASE does not support data sampling 				-->
    <!-- mssqlcrt:supports-remote-query:  Sybase ASE does not have support for an OPENROWSET-style construct 	-->
    <!-- mssqlcrt:supports-top-clause:    TOP cannot be used in subqueries in Sybase ASE 			-->
    <!-- mssqlcrt:supports-recursive-select-subquery: 	Sybase ASE does not support common table expressions 	-->
    <!-- mssqlcrt:supports-recursive-select: 		Sybase ASE does not support common table expressions 	-->
    <!-- mssqlcrt:supports-fast-writeback:	Sybase ASE OLE DB does not support IRowsetFastLoad 		-->
    <!-- mssqlcrt:supports-materialized-view: 	Sybase ASE does not support indexed views 			-->
    <!-- mssqlcrt:supports-materialized-view-prevalidation: Sybase ASE does not support indexed views 		-->

<!-- Limits 								-->
    <!-- Database identifier: 30 bytes / 3 bytes max per UTF-8 character 					-->
    <mssqlcrt:limit-database-identifier-length>10</mssqlcrt:limit-database-identifier-length>

    <!-- Table and Column identifiers: 255 bytes / 3 bytes max per UTF-8 character 				-->
    <mssqlcrt:limit-table-identifier-length>85</mssqlcrt:limit-table-identifier-length>
    <mssqlcrt:limit-column-identifier-length>85</mssqlcrt:limit-column-identifier-length>

    <!-- Don't throttle connections -->
    <!-- mssqlcrt:limit-max-connections-count>10</mssqlcrt:limit-max-connections-count -->

    <!-- Materialized views are unsupported 									-->
    <mssqlcrt:limit-materialized-view-column-count>-1</mssqlcrt:limit-materialized-view-column-count>

    <!-- Remote queries are unsupported, so remote connection strings are too 					-->

</mssqlcrt:capabilities>

<!-- Types								-->
<mssqlcrt:schema-classes>
  <!-- Sybase ASE 15 includes an ADO client, but not an implementation of IDbSchema, so it isn't included here	-->
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

	<!-- Select statement                                                 -->
	<xsl:template match="Select">
		<xsl:if test="name(..) != 'Statement' and name(..) != 'Insert' and name(..) != 'Sample' and name(..) != 'Union' and name(..) != 'UnionAll'">
			(
		</xsl:if>
		SELECT <xsl:apply-templates select="./Distinct"/>
			<xsl:apply-templates select="./ColumnExpressions"/>
			<xsl:apply-templates select="./Sources"/>
			<xsl:apply-templates select="./Where"/>
			<xsl:apply-templates select="./GroupBy"/>
			<xsl:apply-templates select="./Having"/>
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
			<xsl:when test="$type-val = 'DBTYPE_BSTR'">    nvarchar	    </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_WSTR'">    univarchar   </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_STR'">     varchar      </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_BOOL'">    bit          </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_I1'">      tinyint      </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_I2'">      smallint     </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_I4'">      int          </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_I8'">      bigint       </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_UI1'">     tinyint      </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_UI2'">     unsigned smallint </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_UI4'">     unsigned int      </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_UI8'">     unsigned bigint   </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_R4'">      real         </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_R8'">      float        </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_DATE'">    datetime     </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_DBTIMESTAMP'">    datetime     </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_CY'">        money        </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_VARIANT'">   varbinary  </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_GUID'">      varchar  </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_ByteArray'"> varbinary  </xsl:when>
			<xsl:when test="$type-val = 'DBTYPE_DECIMAL'">   decimal      </xsl:when>
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
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">
				<xsl:value-of select="$operator"/>
			</xsl:if>
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
			<xsl:when test="$db-type = 'DBTYPE_BOOL'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS bit)</xsl:when>
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
			<xsl:when test="$db-type = 'DBTYPE_DATE'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS datetime)</xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_DBTIMESTAMP'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS datetime)</xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_CY'">CAST( <xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template> AS money)</xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_VARIANT'"><xsl:value-of select="$value"/></xsl:when>
                        <xsl:when test="$db-type = 'DBTYPE_GUID'"><xsl:call-template name="quote-string"><xsl:with-param name="string" select="$value"/></xsl:call-template></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_ByteArray'"><xsl:value-of select="$value"/></xsl:when>
			<xsl:when test="$db-type = 'DBTYPE_DECIMAL'"><xsl:value-of select="$value"/></xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
