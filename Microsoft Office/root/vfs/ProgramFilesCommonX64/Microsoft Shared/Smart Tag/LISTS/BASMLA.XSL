<?xml version="1.0" ?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:b="http://schemas.microsoft.com/office/word/2004/10/bibliography" xmlns:t="http://www.microsoft.com/temp">
  <xsl:output method="text" encoding="us-ascii"/>



  
  <xsl:template match="*" mode="outputHtml2">
    <xsl:apply-templates mode="outputHtml"/>
  </xsl:template>

  <xsl:template name="StringFormatDot">
    <xsl:param name="format" />
    <xsl:param name="parameters" />

    <xsl:variable name="prop_EndChars">
      <xsl:call-template name="templ_prop_EndChars"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$format = ''"></xsl:when>
      <xsl:when test="substring($format, 1, 2) = '%%'">
        <xsl:text>%</xsl:text>
        <xsl:call-template name="StringFormatDot">
          <xsl:with-param name="format" select="substring($format, 3)" />
          <xsl:with-param name="parameters" select="$parameters" />
        </xsl:call-template>
        <xsl:if test="string-length($format)=2">
          <xsl:call-template name="templ_prop_Dot"/>
        </xsl:if>
      </xsl:when>
      <xsl:when test="substring($format, 1, 1) = '%'">
        <xsl:variable name="pos" select="substring($format, 2, 1)" />
        <xsl:apply-templates select="msxsl:node-set($parameters)/t:params/t:param[position() = $pos]" mode="outputHtml2"/>
        <xsl:call-template name="StringFormatDot">
          <xsl:with-param name="format" select="substring($format, 3)" />
          <xsl:with-param name="parameters" select="$parameters" />
        </xsl:call-template>
        <xsl:if test="string-length($format)=2">
          <xsl:variable name="temp2">
            <xsl:call-template name="handleSpaces">
              <xsl:with-param name="field" select="msxsl:node-set($parameters)/t:params/t:param[position() = $pos]"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="lastChar">
            <xsl:value-of select="substring($temp2, string-length($temp2))"/>
          </xsl:variable>
          <xsl:if test="not(contains($prop_EndChars, $lastChar))">
            <xsl:call-template name="templ_prop_Dot"/>
          </xsl:if>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring($format, 1, 1)" />
        <xsl:call-template name="StringFormatDot">
          <xsl:with-param name="format" select="substring($format, 2)" />
          <xsl:with-param name="parameters" select="$parameters" />
        </xsl:call-template>
        <xsl:if test="string-length($format)=1">
          <xsl:if test="not(contains($prop_EndChars, $format))">
            <xsl:call-template name="templ_prop_Dot"/>
          </xsl:if>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="StringFormat">
    <xsl:param name="format" />
    <xsl:param name="parameters" />
    <xsl:choose>
      <xsl:when test="$format = ''"></xsl:when>
      <xsl:when test="substring($format, 1, 2) = '%%'">
        <xsl:text>%</xsl:text>
        <xsl:call-template name="StringFormat">
          <xsl:with-param name="format" select="substring($format, 3)" />
          <xsl:with-param name="parameters" select="$parameters" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="substring($format, 1, 1) = '%'">
        <xsl:variable name="pos" select="substring($format, 2, 1)" />
        <xsl:apply-templates select="msxsl:node-set($parameters)/t:params/t:param[position() = $pos]" mode="outputHtml2"/>
        <xsl:call-template name="StringFormat">
          <xsl:with-param name="format" select="substring($format, 3)" />
          <xsl:with-param name="parameters" select="$parameters" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring($format, 1, 1)" />
        <xsl:call-template name="StringFormat">
          <xsl:with-param name="format" select="substring($format, 2)" />
          <xsl:with-param name="parameters" select="$parameters" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  

  <xsl:template name="templ_str_OnlineCap" >
    <xsl:text>Online</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_OnlineUnCap" >
    <xsl:text>online</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_FiledCap" >
    <xsl:text>Filed %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PatentFiledCap" >
    <xsl:text>Patent %1, filed %2</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_InCap" >
    <xsl:text>In</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_InNameCap" >
    <xsl:text>In %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_WithUnCap" >
    <xsl:text>%1 with %2</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_VersionShortCap" >
    <xsl:text>Vers.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_InterviewCap" >
    <xsl:text>Interview</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_InterviewWithCap" >
    <xsl:text>Interview with %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_InterviewByCap" >
    <xsl:text>Interview by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ByCap" >
    <xsl:text>By %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_AndUnCap" >
    <xsl:text>and</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_AndOthersUnCap" >
    <xsl:text>et al.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_MotionPictureCap" >
    <xsl:text>Motion Picture</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PatentCap" >
    <xsl:text>Patent %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditionShortUnCap" >
    <xsl:text>ed.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditionUnCap" >
    <xsl:text>edition</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_RetrievedFromCap" >
    <xsl:text>Retrieved %1 from %2</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_RetrievedCap" >
    <xsl:text>Retrieved %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_FromCap" >
    <xsl:text>From %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_FromUnCap" >
    <xsl:text>from %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_NoDateShortUnCap" >
    <xsl:text>n.d.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_NumberShortCap" >
    <xsl:text>No. %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_NumberShortUnCap" >
    <xsl:text>no. %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PatentNumberShortCap" >
    <xsl:text>Patent No. %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PagesCountinousShort" >
    <xsl:text>pp.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PageShort" >
    <xsl:text>p.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_SineNomineShort" >
    <xsl:text>s.n.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_SineLocoShort" >
    <xsl:text>s.l.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_SineLocoSineNomineShort" >
    <xsl:text>s.l. : s.n.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_VolumeShortCap" >
    <xsl:text>Vol.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_VolumeShortUnCap" >
    <xsl:text>vol.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_VolumesShortUnCap" >
    <xsl:text>vols.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_VolumesShortCap" >
    <xsl:text>Vols.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_VolumeCap" >
    <xsl:text>Volume</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_AuthorShortUnCap" >
    <xsl:text>auth.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_BookAuthorShortUnCap" >
    <xsl:text>book auth.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ArtistShortUnCap" >
    <xsl:text>art.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ReporterShortUnCap" >
    <xsl:text>rep.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_WriterCap" >
    <xsl:text>Writer</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_WritersCap" >
    <xsl:text>Writers</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_WriterShortUnCap" >
    <xsl:text>writ.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ConductedByCap" >
    <xsl:text>Conducted by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ConductedByUnCap" >
    <xsl:text>conducted by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ConductorCap" >
    <xsl:text>Conductor</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ConductorsCap" >
    <xsl:text>Conductors</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ConductorShortCap" >
    <xsl:text>Cond.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ConductorShortUnCap" >
    <xsl:text>cond.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ConductorsShortCap" >
    <xsl:text>Conds.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ConductorsShortUnCap" >
    <xsl:text>conds.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CounselShortUnCapIso" >
    <xsl:text>consl.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CounselShortUnCap" >
    <xsl:text>counsl.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_DirectedByCap" >
    <xsl:text>Directed by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_DirectedByUnCap" >
    <xsl:text>directed by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_DirectorCap" >
    <xsl:text>Director</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_DirectorsCap" >
    <xsl:text>Directors</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_DirectorShortCap" >
    <xsl:text>Dir.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_DirectorShortUnCap" >
    <xsl:text>dir.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_DirectorsShortCap" >
    <xsl:text>Dirs.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_DirectorsShortUnCap" >
    <xsl:text>dirs.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditedByCap" >
    <xsl:text>Edited by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditedByUnCap" >
    <xsl:text>edited by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditorCap" >
    <xsl:text>Editor</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditorsCap" >
    <xsl:text>Editors</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditorShortCap" >
    <xsl:text>Ed.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditorShortUnCap" >
    <xsl:text>ed.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditorsShortCap" >
    <xsl:text>Eds.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditorsShortUnCap" >
    <xsl:text>eds.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_EditorShortUnCapGost" >
    <xsl:text>edt.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_IntervieweeShortUnCap" >
    <xsl:text>interv.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_InterviewerCap" >
    <xsl:text>Interviewer</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_InterviewersCap" >
    <xsl:text>Interviewers</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_InventorShortUnCap" >
    <xsl:text>invent.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PerformedByCap" >
    <xsl:text>Performed by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PerformedByUnCap" >
    <xsl:text>performed by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PerformerCap" >
    <xsl:text>Performer</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PerformersCap" >
    <xsl:text>Performers</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PerformerShortCap" >
    <xsl:text>Perf.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PerformerShortUnCap" >
    <xsl:text>perf.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PerformersShortCap" >
    <xsl:text>Perfs.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_PerformersShortUnCap" >
    <xsl:text>perfs.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ProducedByCap" >
    <xsl:text>Produced by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ProducedByUnCap" >
    <xsl:text>produced by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ProducerCap" >
    <xsl:text>Producer</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ProducersCap" >
    <xsl:text>Producers</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ProductionCompanyShortCap" >
    <xsl:text>Prod.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ProducerShortCap" >
    <xsl:text>Prod.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ProducersShortCap" >
    <xsl:text>Prods.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ProducerShortUnCap" >
    <xsl:text>prod.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_TranslatedByCap" >
    <xsl:text>Translated by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_TranslatedByUnCap" >
    <xsl:text>translated by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_TranslatorCap" >
    <xsl:text>Translator</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_TranslatorsCap" >
    <xsl:text>Translators</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_TranslatorShortCap" >
    <xsl:text>Trans.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_TranslatorShortUnCap" >
    <xsl:text>trans.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_TranslatorsShortCap" >
    <xsl:text>Trans.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_TranslatorsShortUnCap" >
    <xsl:text>trans.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_TranslatorShortUnCapIso" >
    <xsl:text>tran.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ComposerCap" >
    <xsl:text>Composer</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ComposersCap" >
    <xsl:text>Composers</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ComposerShortCap" >
    <xsl:text>Comp.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ComposersShortCap" >
    <xsl:text>Comps.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_ComposerShortUnCapIso" >
    <xsl:text>comps.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CompiledByCap" >
    <xsl:text>Compiled by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CompiledByUnCap" >
    <xsl:text>compiled by %1</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CompilerCap" >
    <xsl:text>Compiler</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CompilersCap" >
    <xsl:text>Compilers</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CompilerShortCap" >
    <xsl:text>Comp.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CompilerShortUnCap" >
    <xsl:text>comp.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CompilersShortCap" >
    <xsl:text>Comps.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_str_CompilersShortUnCap" >
    <xsl:text>comps.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_EndChars" >
    <xsl:text>.!?</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_NormalizeSpace" >
    <xsl:text>yes</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Space" >
    <xsl:text> </xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_NonBreakingSpace" >
    <xsl:text></xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ListSeparator" >
    <xsl:text>, </xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Dot" >
    <xsl:text>.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_DotInitial" >
    <xsl:text>.</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_GroupSeparator" >
    <xsl:text>; </xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_EnumSeparator" >
    <xsl:text>: </xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Equal" >
    <xsl:text>=</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Enum" >
    <xsl:text>:</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_OpenQuote" >
    <xsl:text>"</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_CloseQuote" >
    <xsl:text>"</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_OpenBracket" >
    <xsl:text>(</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_CloseBracket" >
    <xsl:text>)</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_FromToDash" >
    <xsl:text>-</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_OpenLink" >
    <xsl:text>&lt;</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_CloseLink" >
    <xsl:text>&gt;</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_AuthorsSeparator" >
    <xsl:text>, </xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SimpleAuthor_F" >
    <xsl:text>%F</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SimpleAuthor_M" >
    <xsl:text>%M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SimpleAuthor_L" >
    <xsl:text>%L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SimpleDate_D" >
    <xsl:text>%D</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SimpleDate_M" >
    <xsl:text>%M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SimpleDate_Y" >
    <xsl:text>%Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_SameAuthor" >
    <xsl:text>&#8212;</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_MainAuthor_FML" >
    <xsl:text>%L, %F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_MainAuthor_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_MainAuthor_ML" >
    <xsl:text>%L, %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_MainAuthor_FL" >
    <xsl:text>%L, %F</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_OtherAuthors_FML" >
    <xsl:text>%F %M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_OtherAuthors_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_OtherAuthors_ML" >
    <xsl:text>%M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_OtherAuthors_FL" >
    <xsl:text>%L %F</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_SecondaryAuthors_FML" >
    <xsl:text>%F %M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_SecondaryAuthors_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_SecondaryAuthors_ML" >
    <xsl:text>%M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_SecondaryAuthors_FL" >
    <xsl:text>%F %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_Date_DMY" >
    <xsl:text>%D %M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_Date_DM" >
    <xsl:text>%D %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_Date_MY" >
    <xsl:text>%M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_MLA_Date_DY" >
    <xsl:text>%D %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_MainAuthors_FML" >
    <xsl:text>%L, %f %m</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_MainAuthors_FM" >
    <xsl:text>%f %m</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_MainAuthors_ML" >
    <xsl:text>%L, %m</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_MainAuthors_FL" >
    <xsl:text>%L, %f</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_SecondaryAuthors_FML" >
    <xsl:text>%f %m %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_SecondaryAuthors_FM" >
    <xsl:text>%f %m</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_SecondaryAuthors_ML" >
    <xsl:text>%m %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_SecondaryAuthors_FL" >
    <xsl:text>%f %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_BeforeLastAuthor" >
    <xsl:text>&amp;</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_GeneralOpen" >
    <xsl:text>(</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_GeneralClose" >
    <xsl:text>)</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_SecondaryOpen" >
    <xsl:text>[</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_SecondaryClose" >
    <xsl:text>]</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Hyphens" >
    <xsl:text>&#x2010;&#x002d;&#x00AD;&#x2011;&#x2012;&#x2013;&#x2014;&#x2015;</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_Date_DMY" >
    <xsl:text>%Y, %M %D</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_Date_DM" >
    <xsl:text>%M %D</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_Date_MY" >
    <xsl:text>%Y, %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_Date_DY" >
    <xsl:text>%Y, %D</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_DateAccessed_DMY" >
    <xsl:text>%M %D, %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_DateAccessed_DM" >
    <xsl:text>%M %D</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_DateAccessed_MY" >
    <xsl:text>%M, %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_DateAccessed_DY" >
    <xsl:text>%D, %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_DateCourt_DMY" >
    <xsl:text>%M %D, %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_DateCourt_DM" >
    <xsl:text>%M %D</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_DateCourt_MY" >
    <xsl:text>%M, %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_APA_DateCourt_DY" >
    <xsl:text>%D, %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_SameAuthor" >
    <xsl:text>&#8212;</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_MainAuthor_FML" >
    <xsl:text>%L, %F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_MainAuthor_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_MainAuthor_ML" >
    <xsl:text>%L, %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_MainAuthor_FL" >
    <xsl:text>%L, %F</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_OtherAuthors_FML" >
    <xsl:text>%F %M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_OtherAuthors_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_OtherAuthors_ML" >
    <xsl:text>%M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_OtherAuthors_FL" >
    <xsl:text>%F %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_SecondaryAuthors_FML" >
    <xsl:text>%F %M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_SecondaryAuthors_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_SecondaryAuthors_ML" >
    <xsl:text>%M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_SecondaryAuthors_FL" >
    <xsl:text>%F %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_Date_DMY" >
    <xsl:text>%D %M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_Date_DM" >
    <xsl:text>%D %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_Date_MY" >
    <xsl:text>%M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Chicago_Date_DY" >
    <xsl:text>%D %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_MainAuthors_FML" >
    <xsl:text>%L, %F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_MainAuthors_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_MainAuthors_ML" >
    <xsl:text>%L, %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_MainAuthors_FL" >
    <xsl:text>%L, %F</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_SecondaryAuthors_FML" >
    <xsl:text>%F %M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_SecondaryAuthors_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_SecondaryAuthors_ML" >
    <xsl:text>%M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_SecondaryAuthors_FL" >
    <xsl:text>%F %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_SameAuthor" >
    <xsl:text>&#8212;</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_GeneralOpen" >
    <xsl:text>[</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_GeneralClose" >
    <xsl:text>]</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_Date_DMY" >
    <xsl:text>%D %M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_Date_DM" >
    <xsl:text>%D %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_Date_MY" >
    <xsl:text>%M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_Date_DY" >
    <xsl:text>%D %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_DateAccessed_DMY" >
    <xsl:text>%M %D %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_DateAccessed_DM" >
    <xsl:text>%M %D</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_DateAccessed_MY" >
    <xsl:text>%M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_ISO690_DateAccessed_DY" >
    <xsl:text>%D %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_Authors_FML" >
    <xsl:text>%L %F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_Authors_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_Authors_ML" >
    <xsl:text>%L %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_Authors_FL" >
    <xsl:text>%L %F</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_Date_DMY" >
    <xsl:text>%D %M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_Date_DM" >
    <xsl:text>%D %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_Date_MY" >
    <xsl:text>%M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_Date_DY" >
    <xsl:text>%D %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_GeneralOpen" >
    <xsl:text>[</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_GeneralClose" >
    <xsl:text>]</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_OneSlash" >
    <xsl:text>/</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_Gost_TwoSlash" >
    <xsl:text>//</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_MainAuthors_FML" >
    <xsl:text>%L, %F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_MainAuthors_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_MainAuthors_ML" >
    <xsl:text>%L, %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_MainAuthors_FL" >
    <xsl:text>%L, %F</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_SecondaryAuthors_FML" >
    <xsl:text>%F %M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_SecondaryAuthors_FM" >
    <xsl:text>%F %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_SecondaryAuthors_ML" >
    <xsl:text>%M %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_SecondaryAuthors_FL" >
    <xsl:text>%F %L</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_SameAuthor" >
    <xsl:text>&#8212;</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_GeneralOpen" >
    <xsl:text>[</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_GeneralClose" >
    <xsl:text>]</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_Date_DMY" >
    <xsl:text>%D %M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_Date_DM" >
    <xsl:text>%D %M</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_Date_MY" >
    <xsl:text>%M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_Date_DY" >
    <xsl:text>%D %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_DateAccessed_DMY" >
    <xsl:text>%M %D %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_DateAccessed_DM" >
    <xsl:text>%M %D</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_DateAccessed_MY" >
    <xsl:text>%M %Y</xsl:text>
  </xsl:template>
  <xsl:template name="templ_prop_SIST_DateAccessed_DY" >
    <xsl:text>%D %Y</xsl:text>
  </xsl:template>

  

  










  

  <xsl:template match="/">


    <xsl:choose>
      
      
      <xsl:when test="b:Version">
        <xsl:text>2005.12.07</xsl:text>
      </xsl:when>
      <xsl:when test="b:OfficeStyleKey">
        <xsl:text>MLA</xsl:text>
      </xsl:when>

      
      

      

      <xsl:when test="b:GetImportantFields">
        <b:ImportantFields>
          <xsl:choose>
            <xsl:when test="b:GetImportantFields/b:SourceType='Book'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:City</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Publisher</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='BookSection'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Author/b:BookAuthor/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:BookTitle</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Pages</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:City</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Publisher</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='JournalArticle'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:JournalName</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Pages</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='ArticleInAPeriodical'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:PeriodicalTitle</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Month</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Day</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Pages</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='ConferenceProceedings'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Pages</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:ConferenceName</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:City</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Publisher</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='Report'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Publisher</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:City</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:ThesisType</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='SoundRecording'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Composer/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Author/b:Conductor/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Author/b:Performer/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:AlbumTitle</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:City</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='Performance'">
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Author/b:Writer/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Author/b:Performer/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Theater</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:City</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Month</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Day</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='Art'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Artist/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Institution</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:PublicationTitle</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:City</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='DocumentFromInternetSite'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:InternetSiteTitle</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Month</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Day</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:MonthAccessed</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:DayAccessed</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:YearAccessed</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:URL</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='InternetSite'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Month</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Day</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:MonthAccessed</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:DayAccessed</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:YearAccessed</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:URL</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='Film'">
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Author/b:Performer/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Author/b:Director/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='Interview'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Interviewee/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Author/b:Interviewer/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Month</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Day</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='Patent'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Inventor/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Month</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Day</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:CountryRegion</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:PatentNumber</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='ElectronicSource'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:City</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Month</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Day</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='Case'">
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:CaseNumber</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Court</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Month</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Day</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
            </xsl:when>

            <xsl:when test="b:GetImportantFields/b:SourceType='Misc'">
              <b:ImportantField>
                <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Title</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:PublicationTitle</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Month</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Day</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Year</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:City</xsl:text>
              </b:ImportantField>
              <b:ImportantField>
                <xsl:text>b:Publisher</xsl:text>
              </b:ImportantField>
            </xsl:when>

          </xsl:choose>
        </b:ImportantFields>
      </xsl:when>

      <xsl:when test="b:Citation">

        <xsl:variable name="ListPopulatedWithMain">
          <xsl:call-template name="populateMain">
            <xsl:with-param name="Type">b:Citation</xsl:with-param>
          </xsl:call-template>
        </xsl:variable>



        <html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">
          <head>
          </head>
          <body>
            <xsl:element name="p">
              <xsl:if test="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:FirstAuthor">
                <xsl:call-template name="templ_prop_OpenBracket"/>
              </xsl:if>

              <xsl:if test="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:PagePrefix">
                <xsl:value-of select="/b:Citation/b:PagePrefix"/>
              </xsl:if>

              <xsl:variable name="type">
                <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:SourceType"/>
              </xsl:variable>

              <xsl:variable name="showTitle">
                <xsl:if test="not(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:NoTitle) and (string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:ShortTitle)>0 or string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Title)>0)">
                  <xsl:text>yes</xsl:text>
                </xsl:if>
              </xsl:variable>


              <xsl:variable name="authorMain">
                <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main"/>
              </xsl:variable>

              <xsl:variable name="displayedAuthor">
                <xsl:if test="string-length($authorMain)>0">
                  <xsl:text>yes</xsl:text>
                </xsl:if>
              </xsl:variable>

              <xsl:variable name="title">
                <xsl:if test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:ShortTitle)=0">
                  <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Title"/>
                </xsl:if>
                <xsl:if test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:ShortTitle)>0">
                  <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:ShortTitle"/>
                </xsl:if>
              </xsl:variable>


              <xsl:if test="string-length($title)=0 and string-length($authorMain)=0 and string-length(b:Year)=0">
                <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Tag"/>
              </xsl:if>


              <xsl:choose>
                <xsl:when test="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:NoAuthor or $displayedAuthor!='yes'">
                  <xsl:choose>
                    <xsl:when test="string-length($showTitle)>0 and ($type='DocumentFromInternetSite' or $type='InternetSite' or $type='ElectronicSource')">
                      <xsl:call-template name="templ_prop_OpenQuote"/>
                      <xsl:value-of select="$title"/>
                      <xsl:call-template name="templ_prop_CloseQuote"/>
                    </xsl:when>
                    <xsl:when test="string-length($showTitle)>0 and ($type='Book' or $type='BookSection' or $type='JournalArticle' or $type='ArticleInAPeriodical' or $type='ConferenceProceedings' or $type='Report')">
                      <i>
                        <xsl:value-of select="$title"/>
                      </i>
                    </xsl:when>
                    <xsl:when test="string-length($showTitle)>0">
                      <xsl:value-of select="$title"/>
                    </xsl:when>
                  </xsl:choose>
                </xsl:when>

                <xsl:otherwise>



                  <xsl:if test="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:NonUniqueMiddle">

                    <xsl:if test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:First)>0">
                      <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:First"/>
                      <xsl:call-template name="templ_prop_Space"/>
                    </xsl:if>
                  </xsl:if>

                  <xsl:if test="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:NonUniqueLastName">
                    <xsl:if test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:Middle)>0">
                      <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:Middle"/>
                      <xsl:call-template name="templ_prop_Space"/>
                    </xsl:if>
                  </xsl:if>

                  <xsl:if test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:Last)>0">
                    <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:Last"/>
                  </xsl:if>

                  <xsl:choose>
                    <xsl:when test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[3]/b:Last)>0">
                      <xsl:call-template name="templ_prop_ListSeparator"/>
                      <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[2]/b:Last"/>
                      <xsl:call-template name="templ_prop_Space"/>
                      <xsl:call-template name="templ_str_AndUnCap"/>
                      <xsl:call-template name="templ_prop_Space"/>
                      <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[3]/b:Last"/>
                    </xsl:when>
                    <xsl:when test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[2]/b:Last)>0">
                      <xsl:call-template name="templ_prop_Space"/>
                      <xsl:call-template name="templ_str_AndUnCap"/>
                      <xsl:call-template name="templ_prop_Space"/>
                      <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[2]/b:Last"/>
                    </xsl:when>
                  </xsl:choose>

                  <xsl:if test="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:DoAndOther">
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:call-template name="templ_str_AndOthersUnCap"/>
                  </xsl:if>

                  <xsl:if test="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:RepeatedAuthor and (string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:ShortTitle)>0 or (string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Title)>0 and not(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:NoTitle)))">
                    <xsl:if test="string-length($showTitle) and string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:Last)>0">
                      <xsl:call-template name="templ_prop_ListSeparator"/>
                    </xsl:if>
                    <xsl:choose>
                      <xsl:when test="string-length($showTitle)>0 and ($type='DocumentFromInternetSite' or $type='InternetSite' or $type='ElectronicSource')">
                        <xsl:call-template name="templ_prop_OpenQuote"/>
                        <xsl:value-of select="$title"/>
                        <xsl:call-template name="templ_prop_CloseQuote"/>
                      </xsl:when>
                      <xsl:when test="string-length($showTitle)>0 and ($type='Book' or $type='BookSection' or $type='JournalArticle' or $type='ArticleInAPeriodical' or $type='ConferenceProceedings' or $type='Report')">
                        <i>
                          <xsl:value-of select="$title"/>
                        </i>
                      </xsl:when>
                      <xsl:when test="string-length($showTitle)>0">
                        <xsl:value-of select="$title"/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:if>


                  <xsl:if test="not(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:NonUniqueMiddle) or string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:First)=0">



                    <xsl:if test="not(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:NonUniqueLastName) or string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:Middle)=0">

                      <xsl:if test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[1]/b:Last)=0">

                        <xsl:if test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[3]/b:Last)=0">
                          <xsl:if test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Author/b:Main/b:NameList/b:Person[2]/b:Last)=0">

                            <xsl:if test="not(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:DoAndOther)">

                              <xsl:if test="string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:ShortTitle)=0 and string-length(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Title)=0 ">

                                <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Source/b:Tag"/>

                              </xsl:if>

                            </xsl:if>
                          </xsl:if>

                        </xsl:if>

                      </xsl:if>
                    </xsl:if>
                  </xsl:if>



                </xsl:otherwise>
              </xsl:choose>



              <xsl:choose>
                <xsl:when test="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Pages">
                  <xsl:if test="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Volume">
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Volume"/>
                    <xsl:call-template name="templ_prop_EnumSeparator"/>
                  </xsl:if>
                  <xsl:if test="not(msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Volume)">
                    <xsl:call-template name="templ_prop_Space"/>
                  </xsl:if>
                  <xsl:value-of select="msxsl:node-set($ListPopulatedWithMain)/b:Citation/b:Pages"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:if test="/b:Citation/b:Volume">
                    <xsl:call-template name="templ_prop_ListSeparator"/>
                    <xsl:call-template name="templ_str_VolumeShortUnCap"/>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:value-of select="/b:Citation/b:Volume"/>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>








              <xsl:if test="/b:Citation/b:PageSuffix">
                <xsl:value-of select="/b:Citation/b:PageSuffix"/>
              </xsl:if>

              <xsl:if test="/b:Citation/b:LastAuthor">
                <xsl:call-template name="templ_prop_CloseBracket"/>
              </xsl:if>
              <xsl:if test="not(/b:Citation/b:LastAuthor)">
                <xsl:call-template name="templ_prop_GroupSeparator"/>
              </xsl:if>


            </xsl:element>
          </body>
        </html>
      </xsl:when>
      <xsl:when test="b:Bibliography">


        

        <html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">
          <head>
            
          </head>
          <body>

            

            <xsl:variable name="ListPopulatedWithMain">
              <xsl:call-template name="populateMain">
                <xsl:with-param name="Type">b:Bibliography</xsl:with-param>
              </xsl:call-template>
            </xsl:variable>

            
            
            <xsl:variable name="sList">
              <xsl:call-template name="sortedList">
                <xsl:with-param name="sourceRoot">
                  <xsl:copy-of select="$ListPopulatedWithMain"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:variable>

            

            <xsl:variable name="dups">
              <xsl:for-each select="msxsl:node-set($sList)/b:Bibliography/b:Source">
                <b:author>
                  <xsl:call-template name="formatMain"/>
                </b:author>
              </xsl:for-each>
            </xsl:variable>

            <xsl:for-each select="msxsl:node-set($sList)/b:Bibliography/b:Source">
              <xsl:element name="p">
                <xsl:attribute name="class">
                  <xsl:value-of select="'Bibliography'"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                  <xsl:value-of select="'margin-left:.5in;text-indent:-.5in'"/>
                </xsl:attribute>


                

                

                

                <xsl:variable name="cEditors">
                  <xsl:value-of select="count(b:Author/b:Editor/b:NameList/b:Person)"/>
                </xsl:variable>

                <xsl:variable name="cTranslators">
                  <xsl:value-of select="count(b:Author/b:Translator/b:NameList/b:Person)"/>
                </xsl:variable>

                <xsl:variable name="cComposers">
                  <xsl:value-of select="count(b:Author/b:Composer/b:NameList/b:Person)"/>
                </xsl:variable>

                <xsl:variable name="cCompilers">
                  <xsl:value-of select="count(b:Author/b:Compiler/b:NameList/b:Person)"/>
                </xsl:variable>

                <xsl:variable name="cPerformers">
                  <xsl:value-of select="count(b:Author/b:Performer/b:NameList/b:Person)"/>
                </xsl:variable>

                <xsl:variable name="cDirectors">
                  <xsl:value-of select="count(b:Author/b:Director/b:NameList/b:Person)"/>
                </xsl:variable>

                <xsl:variable name="cProducers">
                  <xsl:value-of select="count(b:Author/b:ProducerName/b:NameList/b:Person)"/>
                </xsl:variable>

                <xsl:variable name="cConductors">
                  <xsl:value-of select="count(b:Author/b:Conductor/b:NameList/b:Person)"/>
                </xsl:variable>

                

                

                <xsl:variable name="actIndex" select="position()"/>
                <xsl:variable name="lastIndex" select="position() - 1"/>

                <xsl:variable name="actAuthor">
                  <xsl:value-of select="msxsl:node-set($dups)/b:author[$actIndex]"/>
                </xsl:variable>

                <xsl:variable name="lastAuthor">
                  <xsl:value-of select="msxsl:node-set($dups)/b:author[$lastIndex]"/>
                </xsl:variable>

                <xsl:variable name="author">
                  <xsl:choose>
                    <xsl:when test="position()=1">
                      <xsl:call-template name="formatAuthor"/>
                    </xsl:when>
                    <xsl:when test="$actAuthor=$lastAuthor and string-length($actAuthor)>0 ">
                      <xsl:call-template name="templ_prop_MLA_SameAuthor"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="formatAuthor"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>

                


                <xsl:variable name="compiler">
                  <xsl:call-template name="formatCompiler"/>
                </xsl:variable>

                <xsl:variable name="compilerLF">
                  <xsl:call-template name="formatCompilerLF"/>
                </xsl:variable>

                <xsl:variable name="editor">
                  <xsl:call-template name="formatEditor"/>
                </xsl:variable>

                <xsl:variable name="editorLF">
                  <xsl:call-template name="formatEditorLF"/>
                </xsl:variable>

                <xsl:variable name="translator">
                  <xsl:call-template name="formatTranslator"/>
                </xsl:variable>

                <xsl:variable name="translatorLF">
                  <xsl:call-template name="formatTranslatorLF"/>
                </xsl:variable>

                <xsl:variable name="performer">
                  <xsl:call-template name="formatPerformer"/>
                </xsl:variable>

                <xsl:variable name="intervieweeLF">
                  <xsl:call-template name="formatIntervieweeLF"/>
                </xsl:variable>

                <xsl:variable name="producerName">
                  <xsl:call-template name="formatProducerName"/>
                </xsl:variable>

                <xsl:variable name="interviewer">
                  <xsl:call-template name="formatInterviewer"/>
                </xsl:variable>

                <xsl:variable name="interviewerLF">
                  <xsl:call-template name="formatInterviewerLF"/>
                </xsl:variable>

                <xsl:variable name="writer">
                  <xsl:call-template name="formatWriter"/>
                </xsl:variable>

                <xsl:variable name="director">
                  <xsl:call-template name="formatDirector"/>
                </xsl:variable>

                <xsl:variable name="inventorLF">
                  <xsl:call-template name="formatInventorLF"/>
                </xsl:variable>

                <xsl:variable name="bookAuthor">
                  <xsl:call-template name="formatBookAuthor"/>
                </xsl:variable>

                <xsl:variable name="sectionAuthor">
                  <xsl:call-template name="formatAuthor"/>
                </xsl:variable>

                <xsl:variable name="performerLF">
                  <xsl:call-template name="formatPerformerLF"/>
                </xsl:variable>

                <xsl:variable name="conductorLF">
                  <xsl:call-template name="formatConductorLF"/>
                </xsl:variable>

                <xsl:variable name="conductor">
                  <xsl:call-template name="formatConductor"/>
                </xsl:variable>

                <xsl:variable name="composerLF">
                  <xsl:call-template name="formatComposerLF"/>
                </xsl:variable>

                <xsl:variable name="composer">
                  <xsl:call-template name="formatComposer"/>
                </xsl:variable>

                <xsl:variable name="artist">
                  <xsl:call-template name="formatArtistLF"/>
                </xsl:variable>



                

                <xsl:variable name="date">
                  <xsl:call-template name="formatDate"/>
                </xsl:variable>

                <xsl:variable name="dateDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$date"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="dateAccessed">
                  <xsl:call-template name="formatDateAccessed"/>
                </xsl:variable>

                <xsl:variable name="dateAccessedDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$dateAccessed"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="tempCPcY">
                  <xsl:call-template name="templateCPcY"/>
                </xsl:variable>

                <xsl:variable name="tempCPY">
                  <xsl:call-template name="templateCPY"/>
                </xsl:variable>

                <xsl:variable name="tempIYP">
                  <xsl:call-template name="templateIYP"/>
                </xsl:variable>

                <xsl:variable name="tempVYP">
                  <xsl:call-template name="templateVYP"/>
                </xsl:variable>

                <xsl:variable name="tempDEP">
                  <xsl:call-template name="templateDEP"/>
                </xsl:variable>

                <xsl:variable name="tempTC">
                  <xsl:call-template name="templateTC"/>
                </xsl:variable>

                <xsl:variable name="tempIC">
                  <xsl:call-template name="templateIC"/>
                </xsl:variable>

                <xsl:variable name="tempIY">
                  <xsl:call-template name="templateIY"/>
                </xsl:variable>

                <xsl:variable name="tempDY">
                  <xsl:call-template name="templateDY"/>
                </xsl:variable>

                <xsl:variable name="tempCPD">
                  <xsl:call-template name="templateCPD"/>
                </xsl:variable>

                <xsl:variable name="tempSC">
                  <xsl:call-template name="templateSC"/>
                </xsl:variable>

                <xsl:variable name="tempCP">
                  <xsl:call-template name="templateCP"/>
                </xsl:variable>

                <xsl:variable name="tempCD">
                  <xsl:call-template name="templateCD"/>
                </xsl:variable>

                <xsl:variable name="tempVIYP">
                  <xsl:call-template name="templateVIYP"/>
                </xsl:variable>

                <xsl:variable name="tempDaU">
                  <xsl:variable name="temporaryDaU">

                    <xsl:value-of select="$dateAccessed"/>

                    <xsl:if test="string-length(dateAccessedDot)>0 and string-length(b:URL)>0">
                      <xsl:call-template name="templ_prop_Space"/>
                    </xsl:if>

                    <xsl:if test="string-length(b:URL)>0">
                      <xsl:call-template name="templ_prop_OpenLink"/>
                      <xsl:value-of select="b:URL"/>
                      <xsl:call-template name="templ_prop_CloseLink"/>
                    </xsl:if>
                  </xsl:variable>

                  <xsl:call-template name="appendFieldNoHandleSpaces_Dot">
                    <xsl:with-param name="field" select="$temporaryDaU"/>
                  </xsl:call-template>
                </xsl:variable>



                



                <xsl:variable name="titleDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Title"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="albumTitleDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:AlbumTitle"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="pagesDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Pages"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="bookTitleDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:BookTitle"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="conferenceNameDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:ConferenceName"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="broadcasterDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Broadcaster"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="interviewTitle">
                  <xsl:call-template name="handleSpaces">
                    <xsl:with-param name="field" select="b:Title"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="interviewTitleDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Title"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="publicationTitle">
                  <xsl:call-template name="handleSpaces">
                    <xsl:with-param name="field" select="b:PublicationTitle"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="publicationTitleDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:PublicationTitle"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="URL">
                  <xsl:value-of select="b:URL"/>
                </xsl:variable>

                <xsl:variable name="cityDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:City"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="institutionDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Institution"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="courtDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Court"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="thesisTypeDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:ThesisType"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="journalNameDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:JournalName"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="journalName">
                  <xsl:call-template name="handleSpaces">
                    <xsl:with-param name="field" select="b:JournalName"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="internetSiteTitleDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:InternetSiteTitle"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="mediumDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Medium"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="issueDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Issue"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="productionCompanyDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:ProductionCompany"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="editionDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Edition"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="broadcastTitle">
                  <xsl:call-template name="handleSpaces">
                    <xsl:with-param name="field" select="b:BroadcastTitle"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="versionDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:Version"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="broadcastTitleDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:BroadcastTitle"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="periodicalTitleDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="b:PeriodicalTitle"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="periodicalTitle">
                  <xsl:call-template name="handleSpaces">
                    <xsl:with-param name="field" select="b:PeriodicalTitle"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="productionCompany">
                  <xsl:call-template name="handleSpaces">
                    <xsl:with-param name="field" select="b:ProductionCompany"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="caseNumber">
                  <xsl:call-template name="handleSpaces">
                    <xsl:with-param name="field" select="b:CaseNumber"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="broadcaster">
                  <xsl:call-template name="handleSpaces">
                    <xsl:with-param name="field" select="b:Broadcaster"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="volume">
                  <xsl:call-template name="handleSpaces">
                    <xsl:with-param name="field" select="b:Volume"/>
                  </xsl:call-template>
                </xsl:variable>


                

                <xsl:variable name="prefixVersionDot">
                  <xsl:if test="string-length($versionDot)>0">
                    <xsl:call-template name="templ_str_VersionShortCap"/>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:value-of select="$versionDot"/>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="prefixEditorDot">
                  <xsl:if test="string-length($editor)>0">
                    <xsl:if test="$cEditors > 1">
                      <xsl:call-template name="templ_str_EditorShortCap"/>
                    </xsl:if>
                    <xsl:if test="$cEditors = 1">
                      <xsl:call-template name="templ_str_EditorShortCap"/>
                    </xsl:if>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$editor"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="prefixTranslatorDot">
                  <xsl:if test="string-length($translator)>0">
                    <xsl:if test="$cTranslators > 1">
                      <xsl:call-template name="templ_str_TranslatorsShortCap"/>
                    </xsl:if>
                    <xsl:if test="$cTranslators = 1">
                      <xsl:call-template name="templ_str_TranslatorShortCap"/>
                    </xsl:if>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$translator"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>



                <xsl:variable name="prefixDirectorDot">
                  <xsl:if test="string-length($director)>0">
                    <xsl:if test="$cDirectors > 1">
                      <xsl:call-template name="templ_str_DirectorsShortCap"/>
                    </xsl:if>
                    <xsl:if test="$cDirectors = 1">
                      <xsl:call-template name="templ_str_DirectorShortCap"/>
                    </xsl:if>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$director"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="prefixPerformerDot">
                  <xsl:if test="string-length($performer)>0">
                    <xsl:if test="$cPerformers > 1">
                      <xsl:call-template name="templ_str_PerformerShortCap"/>
                    </xsl:if>
                    <xsl:if test="$cPerformers = 1">
                      <xsl:call-template name="templ_str_PerformerShortCap"/>
                    </xsl:if>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$performer"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="sufixEditorLFDot">
                  <xsl:if test="string-length($editorLF)>0">
                    <xsl:value-of select="$editorLF"/>
                    <xsl:call-template name="templ_prop_ListSeparator"/>
                    <xsl:if test="$cEditors > 1">
                      <xsl:call-template name="templ_str_EditorsShortUnCap"/>
                    </xsl:if>
                    <xsl:if test="$cEditors = 1">
                      <xsl:call-template name="templ_str_EditorShortUnCap"/>
                    </xsl:if>
                  </xsl:if>
                </xsl:variable>


                <xsl:variable name="prefixConductorDot">
                  <xsl:if test="string-length($conductor)>0">
                    <xsl:if test="$cConductors > 1">
                      <xsl:call-template name="templ_str_ConductorsShortUnCap"/>
                    </xsl:if>
                    <xsl:if test="$cConductors = 1">
                      <xsl:call-template name="templ_str_ConductorShortUnCap"/>
                    </xsl:if>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$conductor"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="prefixComposerDot">
                  <xsl:if test="string-length($composer)>0">
                    <xsl:if test="$cComposers > 1">
                      <xsl:call-template name="templ_str_ComposersShortCap"/>
                    </xsl:if>
                    <xsl:if test="$cComposers = 1">
                      <xsl:call-template name="templ_str_ComposerShortCap"/>
                    </xsl:if>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$composer"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="prefixCompilerDot">
                  <xsl:if test="string-length($compiler)>0">
                    <xsl:if test="$cCompilers > 1">
                      <xsl:call-template name="templ_str_CompilersShortCap"/>
                    </xsl:if>
                    <xsl:if test="$cCompilers = 1">
                      <xsl:call-template name="templ_str_CompilerShortCap"/>
                    </xsl:if>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$compiler"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="sufixCompilerLFDot">
                  <xsl:if test="string-length($compilerLF)>0">
                    <xsl:value-of select="$compilerLF"/>
                    <xsl:call-template name="templ_prop_ListSeparator"/>
                    <xsl:if test="$cCompilers > 1">
                      <xsl:call-template name="templ_str_CompilersShortUnCap"/>
                    </xsl:if>
                    <xsl:if test="$cCompilers = 1">
                      <xsl:call-template name="templ_str_CompilerShortUnCap"/>
                    </xsl:if>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="prefixVolumeDot">
                  <xsl:if test="string-length($volume)>0">
                    <xsl:call-template name="templ_str_VolumeShortCap"/>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$volume"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="sufixTranslatorLFDot">
                  <xsl:if test="string-length($translatorLF)>0">
                    <xsl:value-of select="$translatorLF"/>
                    <xsl:call-template name="templ_prop_ListSeparator"/>
                    <xsl:if test="$cTranslators > 1">
                      <xsl:call-template name="templ_str_TranslatorsShortUnCap"/>
                    </xsl:if>
                    <xsl:if test="$cTranslators = 1">
                      <xsl:call-template name="templ_str_TranslatorShortUnCap"/>
                    </xsl:if>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="str_NumberShortCap">
                  <xsl:call-template name="templ_str_NumberShortCap"/>
                </xsl:variable>

                <xsl:variable name="prefixCaseNoDot">
                  <xsl:if test="string-length($caseNumber)>0">

                    <xsl:call-template name="StringFormatDot">
                      <xsl:with-param name="format" select="$str_NumberShortCap"/>

                      <xsl:with-param name="parameters">
                        <t:params>
                          <t:param>
                            <xsl:value-of select="$caseNumber"/>
                          </t:param>
                        </t:params>
                      </xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="existProd">
                  <xsl:if test="string-length(normalize-space($producerName))>0">
                    <xsl:text>N</xsl:text>
                  </xsl:if>
                  <xsl:if test="string-length(normalize-space(b:ProductionCompany))">
                    <xsl:text>C</xsl:text>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="prodDot">
                  <xsl:if test="string-length($producerName)>0">
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$producerName"/>
                    </xsl:call-template>
                  </xsl:if>

                  <xsl:if test="string-length($producerName)=0 and string-length($productionCompany)">
                    <xsl:call-template name="appendField_Dot">
                      <xsl:with-param name="field" select="$productionCompany"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:variable>


                <xsl:variable name="prefixProdDot">
                  <xsl:if test="string-length($producerName)>0 or string-length($productionCompany)>0">
                    <xsl:if test="$cProducers > 1">
                      <xsl:call-template name="templ_str_ProducersShortCap"/>
                      <xsl:call-template name="templ_prop_Space"/>
                    </xsl:if>
                    <xsl:if test="$cProducers = 1">
                      <xsl:call-template name="templ_str_ProducerShortCap"/>
                      <xsl:call-template name="templ_prop_Space"/>
                    </xsl:if>
                    
                    <xsl:value-of select="$prodDot"/>
                  </xsl:if>
                </xsl:variable>

                <xsl:variable name="producerNameDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$producerName"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="tempProdPr">
                  <xsl:if test="string-length($producerName)>0">
                    <xsl:call-template name="templ_str_ProducerShortCap"/>
                    <xsl:call-template name="templ_prop_Space"/>
                    <xsl:value-of select="$producerNameDot"/>
                  </xsl:if>
                </xsl:variable>


                

                <xsl:variable name="authorDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$author"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="sectionAuthorDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$sectionAuthor"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="bookAuthorDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$bookAuthor"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="performerLFDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$performerLF"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="artistDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$artist"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="interviewerDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$interviewer"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="intervieweeLFDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$intervieweeLF"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="conductorLFDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$conductorLF"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="inventorLFDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$inventorLF"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="writerDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$writer"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="composerLFDot">
                  <xsl:call-template name="appendField_Dot">
                    <xsl:with-param name="field" select="$composerLF"/>
                  </xsl:call-template>
                </xsl:variable>





                

                <xsl:choose>
                  <xsl:when test="b:SourceType='Book'">
                    <xsl:choose>

                      
                      <xsl:when test="string-length($editor)>0 and string-length($author)=0">

                        <xsl:if test="string-length($sufixEditorLFDot)>0">
                          <xsl:value-of select="$sufixEditorLFDot"/>
                        </xsl:if>


                        <xsl:if test="string-length($titleDot)>0">

                          <xsl:if test="string-length($sufixEditorLFDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$titleDot"/>
                          </u>
                        </xsl:if>


                        <xsl:if test="string-length($prefixTranslatorDot)>0">

                          <xsl:if test="string-length($sufixEditorLFDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$prefixTranslatorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPY)>0">
                          <xsl:if test="string-length($sufixEditorLFDot)>0 or string-length($titleDot)>0 or string-length($prefixTranslatorDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPY"/>
                        </xsl:if>

                      </xsl:when>



                      
                      <xsl:when test="string-length($translator)>0 and string-length($author)=0">

                        <xsl:if test="string-length($sufixTranslatorLFDot)>0">
                          <xsl:value-of select="$sufixTranslatorLFDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($sufixTranslatorLFDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$titleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPY)>0">
                          <xsl:if test="string-length($sufixTranslatorLFDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPY"/>
                        </xsl:if>

                      </xsl:when>
                      
                      <xsl:otherwise>


                        <xsl:if test="string-length($authorDot)>0">
                          <xsl:value-of select="$authorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($authorDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$titleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($prefixEditorDot)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>
                          <xsl:value-of select="$prefixEditorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($prefixTranslatorDot)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($prefixEditorDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$prefixTranslatorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPY)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($prefixEditorDot)>0 or string-length($prefixTranslatorDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPY"/>
                        </xsl:if>

                      </xsl:otherwise>


                    </xsl:choose>
                  </xsl:when>



                  <xsl:when test="b:SourceType='BookSection'">


                    <xsl:if test="string-length($sectionAuthorDot)>0">
                      <xsl:value-of select="$sectionAuthorDot"/>
                    </xsl:if>



                    <xsl:if test="string-length($titleDot)>0">

                      <xsl:if test="string-length($sectionAuthorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:call-template name="templ_prop_OpenQuote"/>

                      <xsl:value-of select="$titleDot"/>

                      <xsl:call-template name="templ_prop_CloseQuote"/>
                    </xsl:if>


                    <xsl:if test="string-length($bookAuthorDot)>0">
                      <xsl:if test="string-length($sectionAuthorDot)>0 or string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$bookAuthorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($bookTitleDot)>0">
                      <xsl:if test="string-length($sectionAuthorDot)>0 or string-length($titleDot)>0 or string-length($bookAuthorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <u>
                        <xsl:value-of select="$bookTitleDot"/>
                      </u>
                    </xsl:if>

                    <xsl:if test="string-length($prefixEditorDot)>0">
                      <xsl:if test="string-length($sectionAuthorDot)>0 or string-length($titleDot)>0 or string-length($bookAuthorDot)>0 or string-length($bookTitleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixEditorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixTranslatorDot)>0">
                      <xsl:if test="string-length($sectionAuthorDot)>0 or string-length($titleDot)>0 or string-length($bookAuthorDot)>0 or string-length($bookTitleDot)>0 or string-length($prefixEditorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixTranslatorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($tempCPY)>0">
                      <xsl:if test="string-length($sectionAuthorDot)>0 or string-length($titleDot)>0 or string-length($bookAuthorDot)>0 or string-length($bookTitleDot)>0 or string-length($prefixEditorDot)>0 or string-length($prefixTranslatorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempCPY"/>
                    </xsl:if>

                    <xsl:if test="string-length($pagesDot)>0">
                      <xsl:if test="string-length($sectionAuthorDot)>0 or string-length($titleDot)>0 or string-length($bookAuthorDot)>0 or string-length($bookTitleDot)>0 or string-length($prefixEditorDot)>0 or string-length($prefixTranslatorDot)>0 or string-length($tempCPY)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$pagesDot"/>
                    </xsl:if>

                  </xsl:when>


                  <xsl:when test="b:SourceType='JournalArticle'">

                    <xsl:if test="string-length($authorDot)>0">
                      <xsl:value-of select="$authorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($titleDot)>0">
                      <xsl:if test="string-length($authorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:call-template name="templ_prop_OpenQuote"/>

                      <xsl:value-of select="$titleDot"/>

                      <xsl:call-template name="templ_prop_CloseQuote"/>
                    </xsl:if>

                    <xsl:if test="string-length($journalName)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <u>
                        <xsl:value-of select="$journalName"/>
                      </u>
                    </xsl:if>

                    <xsl:if test="string-length($tempVIYP)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($journalName)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempVIYP"/>
                    </xsl:if>

                  </xsl:when>




                  <xsl:when test="b:SourceType='ConferenceProceedings'">

                    <xsl:choose>
                      
                      <xsl:when test="string-length($editor)>0 and string-length($author)=0">

                        <xsl:if test="string-length($sufixEditorLFDot)>0">
                          <xsl:value-of select="$sufixEditorLFDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($sufixEditorLFDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:call-template name="templ_prop_OpenQuote"/>

                          <xsl:value-of select="$titleDot"/>

                          <xsl:call-template name="templ_prop_CloseQuote"/>
                        </xsl:if>

                        <xsl:if test="string-length($conferenceNameDot)>0">
                          <xsl:if test="string-length($sufixEditorLFDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$conferenceNameDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPY)>0">
                          <xsl:if test="string-length($sufixEditorLFDot)>0 or string-length($titleDot)>0 or string-length($conferenceNameDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPY"/>
                        </xsl:if>


                        <xsl:if test="string-length($pagesDot)>0">
                          <xsl:if test="string-length($sufixEditorLFDot)>0 or string-length($titleDot)>0 or string-length($conferenceNameDot)>0 or string-length($tempCPY)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$pagesDot"/>
                        </xsl:if>


                      </xsl:when>


                      
                      <xsl:otherwise>

                        <xsl:if test="string-length($authorDot)>0">
                          <xsl:value-of select="$authorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($authorDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:call-template name="templ_prop_OpenQuote"/>

                          <xsl:value-of select="$titleDot"/>

                          <xsl:call-template name="templ_prop_CloseQuote"/>
                        </xsl:if>

                        <xsl:if test="string-length($conferenceNameDot)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$conferenceNameDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($prefixEditorDot)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($conferenceNameDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$prefixEditorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPY)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($conferenceNameDot)>0 or string-length($prefixEditorDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPY"/>
                        </xsl:if>

                        <xsl:if test="string-length($pagesDot)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($conferenceNameDot)>0 or string-length($prefixEditorDot)>0 or string-length($tempCPY)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$pagesDot"/>
                        </xsl:if>

                      </xsl:otherwise>

                    </xsl:choose>

                  </xsl:when>



                  <xsl:when test="b:SourceType='Report'">

                    <xsl:choose>
                      
                      <xsl:when test="string-length($cityDot)>0">


                        <xsl:if test="string-length($authorDot)>0">
                          <xsl:value-of select="$authorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($authorDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$titleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($thesisTypeDot)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$thesisTypeDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($institutionDot)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($thesisTypeDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$institutionDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPY)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($thesisTypeDot)>0 or string-length($institutionDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPY"/>
                        </xsl:if>

                      </xsl:when>


                      
                      <xsl:otherwise>
                        <xsl:if test="string-length($authorDot)>0">
                          <xsl:value-of select="$authorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($authorDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:call-template name="templ_prop_OpenQuote"/>

                          <xsl:value-of select="$titleDot"/>

                          <xsl:call-template name="templ_prop_CloseQuote"/>
                        </xsl:if>

                        <xsl:if test="string-length($thesisTypeDot)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$thesisTypeDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($tempIY)>0">
                          <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($thesisTypeDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempIY"/>
                        </xsl:if>

                      </xsl:otherwise>


                    </xsl:choose>
                  </xsl:when>



                  <xsl:when test="b:SourceType='SoundRecording'">
                    <xsl:choose>
                      
                      <xsl:when test="string-length($performerLF)>0">

                        <xsl:if test="string-length($performerLFDot)>0">
                          <xsl:value-of select="$performerLFDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($performerLFDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:call-template name="templ_prop_OpenQuote"/>
                          <xsl:value-of select="$titleDot"/>
                          <xsl:call-template name="templ_prop_CloseQuote"/>
                        </xsl:if>

                        <xsl:if test="string-length($albumTitleDot)>0">
                          <xsl:if test="string-length($performerLFDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$albumTitleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($prefixConductorDot)>0">
                          <xsl:if test="string-length($performerLFDot)>0 or string-length($titleDot)>0 or string-length($albumTitleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$prefixConductorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($prefixComposerDot)>0">
                          <xsl:if test="string-length($performerLFDot)>0 or string-length($titleDot)>0 or string-length($albumTitleDot)>0 or string-length($prefixConductorDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:variable name="str_ByCap">
                            <xsl:call-template name="templ_str_ByCap"/>
                          </xsl:variable>

                          <xsl:call-template name="StringFormatDot">
                            <xsl:with-param name="format" select="$str_ByCap"/>
                            <xsl:with-param name="parameters">
                              <t:params>
                                <t:param>
                                  <xsl:value-of select="$composer"/>
                                </t:param>
                              </t:params>
                            </xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>

                        <xsl:if test="string-length($tempProdPr)>0">
                          <xsl:if test="string-length($performerLFDot)>0 or string-length($titleDot)>0 or string-length($albumTitleDot)>0 or string-length($prefixConductorDot)>0 or string-length($prefixComposerDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempProdPr"/>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPcY)>0">
                          <xsl:if test="string-length($performerLFDot)>0 or string-length($titleDot)>0 or string-length($albumTitleDot)>0 or string-length($prefixConductorDot)>0 or string-length($prefixComposerDot)>0 or string-length($tempProdPr)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPcY"/>
                        </xsl:if>


                      </xsl:when>

                      
                      <xsl:when test="string-length($conductorLFDot)>0">

                        <xsl:if test="string-length($conductorLFDot)>0">
                          <xsl:value-of select="$conductorLFDot"/>
                        </xsl:if>


                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($conductorLFDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:call-template name="templ_prop_OpenQuote"/>
                          <xsl:value-of select="$titleDot"/>
                          <xsl:call-template name="templ_prop_CloseQuote"/>
                        </xsl:if>

                        <xsl:if test="string-length($albumTitleDot)>0">
                          <xsl:if test="string-length($conductorLFDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$albumTitleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($prefixComposerDot)>0">
                          <xsl:if test="string-length($conductorLFDot)>0 or string-length($titleDot)>0 or string-length($albumTitleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:variable name="str_ByCap">
                            <xsl:call-template name="templ_str_ByCap"/>
                          </xsl:variable>

                          <xsl:call-template name="StringFormatDot">
                            <xsl:with-param name="format" select="$str_ByCap"/>
                            <xsl:with-param name="parameters">
                              <t:params>
                                <t:param>
                                  <xsl:value-of select="$composer"/>
                                </t:param>
                              </t:params>
                            </xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>

                        <xsl:if test="string-length($tempProdPr)>0">
                          <xsl:if test="string-length($conductorLFDot)>0 or string-length($titleDot)>0 or string-length($albumTitleDot)>0 or string-length($prefixComposerDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempProdPr"/>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPcY)>0">
                          <xsl:if test="string-length($conductorLFDot)>0 or string-length($titleDot)>0 or string-length($albumTitleDot)>0 or string-length($prefixComposerDot)>0 or string-length($tempProdPr)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPcY"/>
                        </xsl:if>

                      </xsl:when>

                      
                      <xsl:otherwise>

                        <xsl:if test="string-length($composerLFDot)>0">
                          <xsl:value-of select="$composerLFDot"/>
                        </xsl:if>


                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($composerLFDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:call-template name="templ_prop_OpenQuote"/>
                          <xsl:value-of select="$titleDot"/>
                          <xsl:call-template name="templ_prop_CloseQuote"/>
                        </xsl:if>

                        <xsl:if test="string-length($albumTitleDot)>0">
                          <xsl:if test="string-length($composerLFDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$albumTitleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($tempProdPr)>0">
                          <xsl:if test="string-length($composerLFDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempProdPr"/>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPcY)>0">
                          <xsl:if test="string-length($composerLFDot)>0 or string-length($titleDot)>0 or string-length($albumTitleDot)>0 or string-length($tempProdPr)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPcY"/>
                        </xsl:if>


                      </xsl:otherwise>



                    </xsl:choose>
                  </xsl:when>


                  <xsl:when test="b:SourceType='Performance'">




                    <xsl:if test="string-length($titleDot)>0">
                      <u>
                        <xsl:value-of select="$titleDot"/>
                      </u>
                    </xsl:if>


                    <xsl:if test="string-length($writerDot)>0">
                      <xsl:if test="string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>
                      <xsl:variable name="str_ByCap">
                        <xsl:call-template name="templ_str_ByCap"/>
                      </xsl:variable>

                      <xsl:call-template name="StringFormatDot">
                        <xsl:with-param name="format" select="$str_ByCap"/>
                        <xsl:with-param name="parameters">
                          <t:params>
                            <t:param>
                              <xsl:value-of select="$writer"/>
                            </t:param>
                          </t:params>
                        </xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:if test="string-length($prefixDirectorDot)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($writerDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixDirectorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixPerformerDot)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($writerDot)>0 or string-length($prefixDirectorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixPerformerDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($tempTC)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($writerDot)>0 or string-length($prefixDirectorDot)>0 or string-length($prefixPerformerDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempTC"/>
                    </xsl:if>


                    <xsl:if test="string-length($dateDot)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($writerDot)>0 or string-length($prefixDirectorDot)>0 or string-length($prefixPerformerDot)>0 or string-length($tempTC)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$dateDot"/>
                    </xsl:if>


                  </xsl:when>


                  <xsl:when test="b:SourceType='Art'">


                    <xsl:choose>
                      
                      <xsl:when test="string-length($publicationTitle)>0">

                        <xsl:if test="string-length($artistDot)>0">
                          <xsl:value-of select="normalize-space($artistDot)"/>
                        </xsl:if>

                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($artistDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$titleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($institutionDot)>0">
                          <xsl:if test="string-length($artistDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$institutionDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($publicationTitleDot)>0">
                          <xsl:if test="string-length($artistDot)>0 or string-length($titleDot)>0 or string-length($institutionDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$publicationTitleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($tempCPY)>0">
                          <xsl:if test="string-length($artistDot)>0 or string-length($titleDot)>0 or string-length($institutionDot)>0 or string-length($publicationTitle)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempCPY"/>
                        </xsl:if>

                        <xsl:if test="string-length($pagesDot)>0">
                          <xsl:if test="string-length($artistDot)>0 or string-length($titleDot)>0 or string-length($institutionDot)>0 or string-length($publicationTitle)>0 or string-length($tempCPY)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$pagesDot"/>
                        </xsl:if>

                      </xsl:when>

                      
                      <xsl:otherwise>

                        <xsl:if test="string-length($artistDot)>0">
                          <xsl:value-of select="normalize-space($artistDot)"/>
                        </xsl:if>


                        <xsl:if test="string-length($titleDot)>0">
                          <xsl:if test="string-length($artistDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <u>
                            <xsl:value-of select="$titleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($tempIC)>0">
                          <xsl:if test="string-length($artistDot)>0 or string-length($titleDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$tempIC"/>
                        </xsl:if>

                        <xsl:if test="string-length($pagesDot)>0">
                          <xsl:if test="string-length($artistDot)>0 or string-length($titleDot)>0 or string-length($tempIC)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>

                          <xsl:value-of select="$pagesDot"/>
                        </xsl:if>

                      </xsl:otherwise>

                    </xsl:choose>



                  </xsl:when>

                  <xsl:when test="b:SourceType='DocumentFromInternetSite'">



                    <xsl:if test="string-length($authorDot)>0">
                      <xsl:value-of select="$authorDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($titleDot)>0">
                      <xsl:if test="string-length($authorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:call-template name="templ_prop_OpenQuote"/>
                      <xsl:value-of select="$titleDot"/>
                      <xsl:call-template name="templ_prop_CloseQuote"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixVersionDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>
                      <xsl:value-of select="$prefixVersionDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($dateDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($versionDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$dateDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($internetSiteTitleDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($versionDot)>0 or string-length($dateDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <u>
                        <xsl:value-of select="$internetSiteTitleDot"/>
                      </u>
                    </xsl:if>


                    <xsl:if test="string-length($prefixEditorDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($versionDot)>0 or string-length($dateDot)>0 or string-length($internetSiteTitleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixEditorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prodDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($versionDot)>0 or string-length($dateDot)>0 or string-length($internetSiteTitleDot)>0 or string-length($prefixEditorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prodDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($tempDaU)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($versionDot)>0 or string-length($dateDot)>0 or string-length($internetSiteTitleDot)>0 or string-length($prefixEditorDot)>0 or string-length($prodDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempDaU"/>
                    </xsl:if>

                  </xsl:when>




                  <xsl:when test="b:SourceType='InternetSite'">

                    <xsl:if test="string-length($authorDot)>0">
                      <xsl:value-of select="$authorDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($titleDot)>0">
                      <xsl:if test="string-length($authorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <u>
                        <xsl:value-of select="$titleDot"/>
                      </u>
                    </xsl:if>

                    <xsl:if test="string-length($prefixEditorDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixEditorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixVersionDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($prefixEditorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixVersionDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($dateDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($prefixEditorDot)>0 or string-length($versionDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$dateDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prodDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($prefixEditorDot)>0 or string-length($versionDot)>0 or string-length($dateDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prodDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($tempDaU)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($prefixEditorDot)>0 or string-length($versionDot)>0 or string-length($dateDot)>0 or string-length($prodDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempDaU"/>
                    </xsl:if>

                  </xsl:when>




                  <xsl:when test="b:SourceType='Patent'">



                    <xsl:if test="string-length($inventorLFDot)>0">
                      <xsl:value-of select="$inventorLFDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($titleDot)>0">
                      <xsl:if test="string-length($inventorLFDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$titleDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixEditorDot)>0">
                      <xsl:if test="string-length($inventorLFDot)>0 or string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixEditorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixTranslatorDot)>0">
                      <xsl:if test="string-length($inventorLFDot)>0 or string-length($titleDot)>0 or string-length($prefixEditorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixTranslatorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($tempCP)>0">
                      <xsl:if test="string-length($inventorLFDot)>0 or string-length($titleDot)>0 or string-length($prefixEditorDot)>0 or string-length($prefixTranslatorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempCP"/>
                    </xsl:if>

                    <xsl:if test="string-length($dateDot)>0">
                      <xsl:if test="string-length($inventorLFDot)>0 or string-length($titleDot)>0 or string-length($prefixEditorDot)>0 or string-length($prefixTranslatorDot)>0 or string-length($tempCP)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$dateDot"/>
                    </xsl:if>

                  </xsl:when>



                  <xsl:when test="b:SourceType='Case'">


                    <xsl:if test="string-length($titleDot)>0">
                      <xsl:value-of select="$titleDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixCaseNoDot)>0">
                      <xsl:if test="string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixCaseNoDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($courtDot)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($prefixCaseNoDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$courtDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($tempCD)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($prefixCaseNoDot)>0 or string-length($courtDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempCD"/>
                    </xsl:if>

                  </xsl:when>



                  <xsl:when test="b:SourceType='Misc'">

                    <xsl:if test="string-length($authorDot)>0">
                      <xsl:value-of select="$authorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($titleDot)>0">
                      <xsl:if test="string-length($authorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:call-template name="templ_prop_OpenQuote"/>
                      <xsl:value-of select="$titleDot"/>
                      <xsl:call-template name="templ_prop_CloseQuote"/>
                    </xsl:if>

                    <xsl:if test="string-length($publicationTitleDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <u>
                        <xsl:value-of select="$publicationTitleDot"/>
                      </u>
                    </xsl:if>

                    <xsl:if test="string-length($prefixVolumeDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixVolumeDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($issueDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($prefixVolumeDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$issueDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixEditorDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($prefixVolumeDot)>0 or string-length($issueDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixEditorDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($prefixTranslatorDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($prefixVolumeDot)>0 or string-length($issueDot)>0 or string-length($prefixEditorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixTranslatorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixCompilerDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($prefixVolumeDot)>0 or string-length($issueDot)>0 or string-length($prefixEditorDot)>0 or string-length($prefixTranslatorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixCompilerDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($tempCPD)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($prefixVolumeDot)>0 or string-length($issueDot)>0 or string-length($prefixEditorDot)>0 or string-length($prefixTranslatorDot)>0 or string-length($prefixCompilerDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempCPD"/>
                    </xsl:if>

                    <xsl:if test="string-length($pagesDot)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($prefixVolumeDot)>0 or string-length($issueDot)>0 or string-length($prefixEditorDot)>0 or string-length($prefixTranslatorDot)>0 or string-length($prefixCompilerDot)>0 or string-length($tempCPD)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$pagesDot"/>
                    </xsl:if>


                  </xsl:when>




                  <xsl:when test="b:SourceType='ElectronicSource'">

                    <xsl:variable name="lfAuthor">
                      <xsl:if test="string-length($authorDot)>0">
                        <xsl:value-of select="$authorDot"/>
                      </xsl:if>


                      <xsl:if test="string-length($authorDot)=0 and string-length($sufixEditorLFDot)>0">
                        <xsl:value-of select="$sufixEditorLFDot"/>
                      </xsl:if>

                      <xsl:if test="string-length($authorDot)=0 and string-length($sufixEditorLFDot)=0 and string-length($sufixTranslatorLFDot)>0">
                        <xsl:value-of select="$sufixTranslatorLFDot"/>
                      </xsl:if>

                      <xsl:if test="string-length($authorDot)=0 and string-length($sufixEditorLFDot)=0 and string-length($sufixTranslatorLFDot)=0 and string-length($sufixCompilerLFDot)>0">
                        <xsl:value-of select="$sufixCompilerLFDot"/>
                      </xsl:if>
                    </xsl:variable>

                    <xsl:value-of select="$lfAuthor"/>

                    <xsl:if test="string-length($titleDot)>0 and string-length($publicationTitleDot)>0">
                      <xsl:if test="string-length($lfAuthor)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:call-template name="templ_prop_OpenQuote"/>
                      <xsl:value-of select="$titleDot"/>
                      <xsl:call-template name="templ_prop_CloseQuote"/>
                    </xsl:if>

                    <xsl:if test="string-length($titleDot)>0 and string-length($publicationTitleDot)=0">
                      <xsl:if test="string-length($lfAuthor)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <u>
                        <xsl:value-of select="$titleDot"/>
                      </u>
                    </xsl:if>

                    <xsl:if test="string-length($publicationTitleDot)>0">
                      <xsl:if test="string-length($lfAuthor)>0 or string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <u>
                        <xsl:value-of select="$publicationTitleDot"/>
                      </u>
                    </xsl:if>

                    <xsl:if test="string-length($editionDot)>0">
                      <xsl:if test="string-length($lfAuthor)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$editionDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixVolumeDot)>0">
                      <xsl:if test="string-length($lfAuthor)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($editionDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixVolumeDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($mediumDot)>0">
                      <xsl:if test="string-length($lfAuthor)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($editionDot)>0 or string-length($prefixVolumeDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$mediumDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($authorDot)>0 and string-length($prefixEditorDot)>0">
                      <xsl:if test="string-length($lfAuthor)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($editionDot)>0 or string-length($prefixVolumeDot)>0 or string-length($mediumDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixEditorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixTranslatorDot)>0 and (string-length($authorDot)>0 or (string-length($authorDot)=0 and  string-length($sufixEditorLFDot)>0 ))">
                      <xsl:if test="string-length($lfAuthor)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($editionDot)>0 or string-length($prefixVolumeDot)>0 or string-length($mediumDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixTranslatorDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixCompilerDot)>0 and (string-length($authorDot)>0 or (string-length($authorDot)=0 and  (string-length($sufixEditorLFDot)>0 or string-length($sufixTranslatorLFDot)>0)))">
                      <xsl:if test="string-length($lfAuthor)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($editionDot)>0 or string-length($prefixVolumeDot)>0 or string-length($mediumDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixCompilerDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($prefixProdDot)>0">
                      <xsl:if test="string-length($lfAuthor)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($editionDot)>0 or string-length($prefixVolumeDot)>0 or string-length($mediumDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixProdDot"/>
                    </xsl:if>

                    <xsl:if test="string-length($tempCPD)>0">
                      <xsl:if test="string-length($lfAuthor)>0 or string-length($titleDot)>0 or string-length($publicationTitleDot)>0 or string-length($editionDot)>0 or string-length($prefixVolumeDot)>0 or string-length($mediumDot)>0 or string-length($prefixProdDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempCPD"/>
                    </xsl:if>



                  </xsl:when>


                  <xsl:when test="b:SourceType='ArticleInAPeriodical'">


                    <xsl:if test="string-length($authorDot)>0">
                      <xsl:value-of select="$authorDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($titleDot)>0">
                      <xsl:if test="string-length($authorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:call-template name="templ_prop_OpenQuote"/>

                      <xsl:value-of select="$titleDot"/>

                      <xsl:call-template name="templ_prop_CloseQuote"/>
                    </xsl:if>

                    <xsl:if test="string-length($periodicalTitle)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <u>
                        <xsl:value-of select="$periodicalTitle"/>
                      </u>
                    </xsl:if>

                    <xsl:if test="string-length($tempDEP)>0">
                      <xsl:if test="string-length($authorDot)>0 or string-length($titleDot)>0 or string-length($periodicalTitle)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempDEP"/>
                    </xsl:if>

                  </xsl:when>


                  <xsl:when test="b:SourceType='Film'">

                    <xsl:if test="string-length($titleDot)>0">
                      <u>
                        <xsl:value-of select="$titleDot"/>
                      </u>
                    </xsl:if>

                    <xsl:if test="string-length($writerDot)>0">
                      <xsl:if test="string-length($titleDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>
                      <xsl:variable name="str_ByCap">
                        <xsl:call-template name="templ_str_ByCap"/>
                      </xsl:variable>

                      <xsl:call-template name="StringFormatDot">
                        <xsl:with-param name="format" select="$str_ByCap"/>
                        <xsl:with-param name="parameters">
                          <t:params>
                            <t:param>
                              <xsl:value-of select="$writer"/>
                            </t:param>
                          </t:params>
                        </xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>

                    <xsl:if test="string-length($prefixDirectorDot)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($writerDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixDirectorDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($prefixPerformerDot)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($writerDot)>0 or string-length($prefixDirectorDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixPerformerDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($prefixProdDot)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($writerDot)>0 or string-length($prefixDirectorDot)>0 or string-length($prefixPerformerDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$prefixProdDot"/>
                    </xsl:if>


                    <xsl:if test="string-length($tempDY)>0">
                      <xsl:if test="string-length($titleDot)>0 or string-length($writerDot)>0 or string-length($prefixDirectorDot)>0 or string-length($prefixProdDot)>0 or string-length($prefixPerformerDot)>0">
                        <xsl:call-template name="templ_prop_Space"/>
                      </xsl:if>

                      <xsl:value-of select="$tempDY"/>
                    </xsl:if>

                  </xsl:when>


                  <xsl:when test="b:SourceType='Interview'">

                    <xsl:choose>
                      
                      <xsl:when test="string-length($broadcaster)>0">

                        <xsl:if test="string-length($intervieweeLFDot)>0">
                          <xsl:value-of select="$intervieweeLFDot"/>
                        </xsl:if>

                        <xsl:choose>
                          <xsl:when test="string-length($interviewTitleDot)=0 and string-length($broadcastTitleDot)=0 and string-length($interviewerDot)=0">
                            <xsl:if test="string-length($intervieweeLFDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>

                            <xsl:call-template name="templ_str_InterviewCap"/>
                            <xsl:call-template name="templ_prop_Dot"/>
                          </xsl:when>


                          <xsl:when test="string-length($interviewTitleDot)=0 and string-length($broadcastTitleDot)=0 and string-length($interviewerDot)>0">
                            <xsl:if test="string-length($intervieweeLFDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>
                            <xsl:variable name="str_InterviewWithCap">
                              <xsl:call-template name="templ_str_InterviewWithCap"/>
                            </xsl:variable>

                            <xsl:call-template name="StringFormatDot">
                              <xsl:with-param name="format" select="$str_InterviewWithCap"/>
                              <xsl:with-param name="parameters">
                                <t:params>
                                  <t:param>
                                    <xsl:value-of select="$interviewer"/>
                                  </t:param>
                                </t:params>
                              </xsl:with-param>
                            </xsl:call-template>
                          </xsl:when>

                          <xsl:when test="string-length($interviewTitleDot)=0 and string-length($broadcastTitleDot)>0 and string-length($interviewerDot)=0">
                            <xsl:if test="string-length($intervieweeLFDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>

                            <xsl:call-template name="templ_str_InterviewCap"/>
                            <xsl:call-template name="templ_prop_Dot"/>
                          </xsl:when>

                          <xsl:when test="string-length($interviewTitleDot)=0 and string-length($broadcastTitleDot)>0 and string-length($interviewerDot)>0">
                            <xsl:if test="string-length($intervieweeLFDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>

                            <xsl:variable name="str_InterviewWithCap">
                              <xsl:call-template name="templ_str_InterviewWithCap"/>
                            </xsl:variable>

                            <xsl:call-template name="StringFormatDot">
                              <xsl:with-param name="format" select="$str_InterviewWithCap"/>
                              <xsl:with-param name="parameters">
                                <t:params>
                                  <t:param>
                                    <xsl:value-of select="$interviewer"/>
                                  </t:param>
                                </t:params>
                              </xsl:with-param>
                            </xsl:call-template>
                          </xsl:when>

                          <xsl:when test="string-length($interviewTitleDot)>0 and string-length($broadcastTitleDot)=0 and string-length($interviewerDot)=0">
                            <xsl:if test="string-length($intervieweeLFDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>

                            <u>
                              <xsl:value-of select="$interviewTitleDot"/>
                            </u>
                          </xsl:when>

                          <xsl:when test="string-length($interviewTitleDot)>0 and string-length($broadcastTitleDot)=0 and string-length($interviewerDot)>0">
                            <xsl:if test="string-length($intervieweeLFDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>

                            <xsl:variable name="str_WithUnCap">
                              <xsl:call-template name="templ_str_WithUnCap"/>
                            </xsl:variable>

                            <xsl:call-template name="StringFormatDot">
                              <xsl:with-param name="format" select="$str_WithUnCap"/>
                              <xsl:with-param name="parameters">
                                <t:params>
                                  <t:param>
                                    <u>
                                      <xsl:value-of select="$interviewTitleDot"/>
                                    </u>
                                  </t:param>
                                  <t:param>
                                    <xsl:value-of select="$interviewerDot"/>
                                  </t:param>
                                </t:params>
                              </xsl:with-param>
                            </xsl:call-template>
                          </xsl:when>

                          <xsl:when test="string-length($interviewTitleDot)>0 and string-length($broadcastTitleDot)>0 and string-length($interviewerDot)=0">
                            <xsl:if test="string-length($intervieweeLFDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>

                            <xsl:call-template name="templ_prop_OpenQuote"/>
                            <xsl:value-of select="$interviewTitle"/>
                            <xsl:call-template name="templ_prop_CloseQuote"/>
                          </xsl:when>

                          <xsl:when test="string-length($interviewTitleDot)>0 and string-length($broadcastTitleDot)>0 and string-length($interviewerDot)>0">
                            <xsl:if test="string-length($intervieweeLFDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>

                            <xsl:variable name="str_WithUnCap">
                              <xsl:call-template name="templ_str_WithUnCap"/>
                            </xsl:variable>

                            <xsl:call-template name="StringFormatDot">
                              <xsl:with-param name="format" select="$str_WithUnCap"/>
                              <xsl:with-param name="parameters">
                                <t:params>
                                  <t:param>
                                    <xsl:call-template name="templ_prop_OpenQuote"/>
                                    <xsl:value-of select="$interviewTitle"/>
                                    <xsl:call-template name="templ_prop_CloseQuote"/>
                                  </t:param>
                                  <t:param>
                                    <xsl:value-of select="$interviewerDot"/>
                                  </t:param>
                                </t:params>
                              </xsl:with-param>
                            </xsl:call-template>
                          </xsl:when>
                        </xsl:choose>

                        <xsl:if test="string-length($broadcastTitleDot)>0">
                          <xsl:call-template name="templ_prop_Space"/>

                          <u>
                            <xsl:value-of select="$broadcastTitleDot"/>
                          </u>
                        </xsl:if>


                        <xsl:if test="string-length($broadcasterDot)>0">
                          <xsl:call-template name="templ_prop_Space"/>
                          <xsl:value-of select="$broadcasterDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($tempSC)>0">
                          <xsl:call-template name="templ_prop_Space"/>
                          <xsl:value-of select="$tempSC"/>
                        </xsl:if>

                        <xsl:if test="string-length($dateDot)>0">
                          <xsl:call-template name="templ_prop_Space"/>
                          <xsl:value-of select="$dateDot"/>
                        </xsl:if>

                      </xsl:when>

                      
                      <xsl:otherwise>


                        <xsl:if test="string-length($intervieweeLFDot)>0">
                          <xsl:value-of select="$intervieweeLFDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($interviewTitle)>0">

                          <xsl:if test="string-length($broadcastTitleDot)>0">
                            <xsl:if test="string-length($intervieweeLFDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>

                            <xsl:call-template name="templ_prop_OpenQuote"/>
                            <xsl:value-of select="$interviewTitleDot"/>
                            <xsl:call-template name="templ_prop_CloseQuote"/>
                          </xsl:if>


                          <xsl:if test="string-length($broadcastTitleDot)=0">
                            <xsl:if test="string-length($intervieweeLFDot)>0 or string-length($broadcastTitleDot)>0">
                              <xsl:call-template name="templ_prop_Space"/>
                            </xsl:if>

                            <u>
                              <xsl:value-of select="$interviewTitle"/>
                            </u>
                          </xsl:if>
                        </xsl:if>

                        <xsl:if test="string-length($interviewTitleDot)=0">
                          <xsl:if test="string-length($intervieweeLFDot)>0">
                            <xsl:call-template name="templ_prop_Space"/>
                          </xsl:if>
                          <xsl:call-template name="templ_str_InterviewCap"/>
                          <xsl:call-template name="templ_prop_Dot"/>
                        </xsl:if>




                        <xsl:if test="string-length($broadcastTitleDot)>0">
                          <xsl:call-template name="templ_prop_Space"/>

                          <u>
                            <xsl:value-of select="$broadcastTitleDot"/>
                          </u>
                        </xsl:if>

                        <xsl:if test="string-length($interviewerDot)>0">
                          <xsl:call-template name="templ_prop_Space"/>

                          <xsl:value-of select="$interviewerDot"/>
                        </xsl:if>


                        <xsl:if test="string-length($prefixEditorDot)>0">
                          <xsl:call-template name="templ_prop_Space"/>

                          <xsl:value-of select="$prefixEditorDot"/>
                        </xsl:if>

                        <xsl:if test="string-length($prefixTranslatorDot)>0">
                          <xsl:call-template name="templ_prop_Space"/>

                          <xsl:value-of select="$prefixTranslatorDot"/>
                        </xsl:if>



                        <xsl:if test="string-length($tempCPD)>0">
                          <xsl:call-template name="templ_prop_Space"/>

                          <xsl:value-of select="$tempCPD"/>
                        </xsl:if>

                        <xsl:if test="string-length($pagesDot)>0">
                          <xsl:call-template name="templ_prop_Space"/>

                          <xsl:value-of select="$pagesDot"/>
                        </xsl:if>


                      </xsl:otherwise>
                    </xsl:choose>


                  </xsl:when>


                  




                </xsl:choose>
              </xsl:element>
              
            </xsl:for-each>
          </body>
        </html>
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="sortedList">
    <xsl:param name="sourceRoot"/>
    
    <xsl:apply-templates select="msxsl:node-set($sourceRoot)/*">
      
      <xsl:sort select="b:Author/b:Main/b:NameList/b:Person[1]/b:Last" />
      
      <xsl:sort select="b:Author/b:Main/b:NameList/b:Person[1]/b:First" />
      
      <xsl:sort select="b:Author/b:Main/b:NameList/b:Person[1]/b:Middle"/>
      
    </xsl:apply-templates>
    
  </xsl:template>


  <xsl:template match="*">

    <xsl:element name="{name()}" namespace="{namespace-uri()}">
      <xsl:for-each select="@*">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates>
        <xsl:sort select="b:Author/b:Main/b:NameList/b:Person[1]/b:Last"/>
        <xsl:sort select="b:Author/b:Main/b:NameList/b:Person[1]/b:First"/>
      </xsl:apply-templates>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template name="formatMainAuthor">
    <xsl:call-template name="formatNameCore">
      <xsl:with-param name="FML">
        <xsl:call-template name="templ_prop_MLA_MainAuthor_FML"/>
      </xsl:with-param>
      <xsl:with-param name="FM">
        <xsl:call-template name="templ_prop_MLA_MainAuthor_FM"/>
      </xsl:with-param>
      <xsl:with-param name="ML">
        <xsl:call-template name="templ_prop_MLA_MainAuthor_ML"/>
      </xsl:with-param>
      <xsl:with-param name="FL">
        <xsl:call-template name="templ_prop_MLA_MainAuthor_FL"/>
      </xsl:with-param>
      <xsl:with-param name="upperLast">no</xsl:with-param>
      <xsl:with-param name="withDot">no</xsl:with-param>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="formatSecondaryName">
    <xsl:call-template name="formatNameCore">
      <xsl:with-param name="FML">
        <xsl:call-template name="templ_prop_MLA_SecondaryAuthors_FML"/>
      </xsl:with-param>
      <xsl:with-param name="FM">
        <xsl:call-template name="templ_prop_MLA_SecondaryAuthors_FM"/>
      </xsl:with-param>
      <xsl:with-param name="ML">
        <xsl:call-template name="templ_prop_MLA_SecondaryAuthors_ML"/>
      </xsl:with-param>
      <xsl:with-param name="FL">
        <xsl:call-template name="templ_prop_MLA_SecondaryAuthors_FL"/>
      </xsl:with-param>
      <xsl:with-param name="upperLast">no</xsl:with-param>
      <xsl:with-param name="withDot">no</xsl:with-param>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="formatOtherAuthors">
    <xsl:call-template name="formatNameCore">
      <xsl:with-param name="FML">
        <xsl:call-template name="templ_prop_MLA_OtherAuthors_FML"/>
      </xsl:with-param>
      <xsl:with-param name="FM">
        <xsl:call-template name="templ_prop_MLA_OtherAuthors_FM"/>
      </xsl:with-param>
      <xsl:with-param name="ML">
        <xsl:call-template name="templ_prop_MLA_OtherAuthors_ML"/>
      </xsl:with-param>
      <xsl:with-param name="FL">
        <xsl:call-template name="templ_prop_MLA_OtherAuthors_FL"/>
      </xsl:with-param>
      <xsl:with-param name="upperLast">no</xsl:with-param>
      <xsl:with-param name="withDot">no</xsl:with-param>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="formatPersonSeperator">

    <xsl:choose>
      <xsl:when test="count(../b:Person) > 3 and position() = 1">
        <xsl:call-template name="templ_prop_ListSeparator"/>
        <xsl:call-template name="templ_str_AndOthersUnCap"/>
      </xsl:when>
      <xsl:when test="count(../b:Person) > 3 and position() >= 2">
      </xsl:when>
      <xsl:when test="3 >= count(../b:Person) and position() = count(../b:Person) - 1">
        <xsl:call-template name="templ_prop_Space"/>
        <xsl:call-template name="templ_str_AndUnCap"/>
        <xsl:call-template name="templ_prop_Space"/>
      </xsl:when>
      <xsl:when test="position() = count(../b:Person)">
        <xsl:text></xsl:text>
      </xsl:when>
      <xsl:when test="3 > position()">
        <xsl:call-template name="templ_prop_ListSeparator"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="formatPersonsAuthor">
    <xsl:for-each select="b:NameList/b:Person">
      <xsl:if test="position() = 1">
        <xsl:call-template name="formatMainAuthor"/>
      </xsl:if>
      <xsl:if test="3 >= count(../b:Person) and 3 >= position() and position() != 1">
        <xsl:call-template name="formatOtherAuthors"/>
      </xsl:if>
      <xsl:call-template name="formatPersonSeperator"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatPersons">
    <xsl:for-each select="b:NameList/b:Person">
      <xsl:if test="(count(../b:Person) > 3 and 1 = position()) or (3 >= count(../b:Person))">
        <xsl:call-template name="formatSecondaryName"/>
      </xsl:if>
      <xsl:call-template name="formatPersonSeperator"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatAuthor">
    <xsl:for-each select="b:Author/b:Author">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatMain">
    <xsl:for-each select="b:Author/b:Main">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatBookAuthor">
    <xsl:for-each select="b:Author/b:BookAuthor">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>



  <xsl:template name="formatEditorLF">
    <xsl:for-each select="b:Author/b:Editor">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatTranslatorLF">
    <xsl:for-each select="b:Author/b:Translator">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatPerformerLF">
    <xsl:for-each select="b:Author/b:Performer">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatConductorLF">
    <xsl:for-each select="b:Author/b:Conductor">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatComposerLF">
    <xsl:for-each select="b:Author/b:Composer">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatArtistLF">
    <xsl:for-each select="b:Author/b:Artist">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatInventorLF">
    <xsl:for-each select="b:Author/b:Inventor">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatIntervieweeLF">
    <xsl:for-each select="b:Author/b:Interviewee">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatInterviewerLF">
    <xsl:for-each select="b:Author/b:Interviewer">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatCompilerLF">
    <xsl:for-each select="b:Author/b:Compiler">
      <xsl:call-template name="formatPersonsAuthor"/>
    </xsl:for-each>
  </xsl:template>












  <xsl:template name="formatEditor">
    <xsl:for-each select="b:Author/b:Editor">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatTranslator">
    <xsl:for-each select="b:Author/b:Translator">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatPerformer">
    <xsl:for-each select="b:Author/b:Performer">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>



  <xsl:template name="formatConductor">
    <xsl:for-each select="b:Author/b:Conductor">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatComposer">
    <xsl:for-each select="b:Author/b:Composer">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatInterviewer">
    <xsl:for-each select="b:Author/b:Interviewer">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatWriter">
    <xsl:for-each select="b:Author/b:Writer">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatDirector">
    <xsl:for-each select="b:Author/b:Director">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatProducerName">
    <xsl:for-each select="b:Author/b:ProducerName">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="formatCompiler">
    <xsl:for-each select="b:Author/b:Compiler">
      <xsl:call-template name="formatPersons"/>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="formatDate">
    <xsl:param name="appendSpace"/>
    <xsl:call-template name="formatDateCore">
      <xsl:with-param name="day">
        <xsl:call-template name="handleSpaces">
          <xsl:with-param name="field" select="b:Day"/>
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="month">
        <xsl:call-template name="handleSpaces">
          <xsl:with-param name="field" select="b:Month"/>
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="year">
        <xsl:call-template name="handleSpaces">
          <xsl:with-param name="field" select="b:Year"/>
        </xsl:call-template>
      </xsl:with-param>

      <xsl:with-param name="DMY">
        <xsl:call-template name="templ_prop_MLA_Date_DMY"/>
      </xsl:with-param>
      <xsl:with-param name="DM">
        <xsl:call-template name="templ_prop_MLA_Date_DM"/>
      </xsl:with-param>
      <xsl:with-param name="MY">
        <xsl:call-template name="templ_prop_MLA_Date_MY"/>
      </xsl:with-param>
      <xsl:with-param name="DY">
        <xsl:call-template name="templ_prop_MLA_Date_DY"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="formatDateAccessed">
    <xsl:call-template name="formatDateCore">
      <xsl:with-param name="day">
        <xsl:call-template name="handleSpaces">
          <xsl:with-param name="field" select="b:DayAccessed"/>
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="month">
        <xsl:call-template name="handleSpaces">
          <xsl:with-param name="field" select="b:MonthAccessed"/>
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="year">
        <xsl:call-template name="handleSpaces">
          <xsl:with-param name="field" select="b:YearAccessed"/>
        </xsl:call-template>
      </xsl:with-param>

      <xsl:with-param name="DMY">
        <xsl:call-template name="templ_prop_MLA_Date_DMY"/>
      </xsl:with-param>
      <xsl:with-param name="DM">
        <xsl:call-template name="templ_prop_MLA_Date_DM"/>
      </xsl:with-param>
      <xsl:with-param name="MY">
        <xsl:call-template name="templ_prop_MLA_Date_MY"/>
      </xsl:with-param>
      <xsl:with-param name="DY">
        <xsl:call-template name="templ_prop_MLA_Date_DY"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>


  
  
  
  
  <xsl:template name="MainContributors">
    <xsl:param name="SourceRoot"/>
    <xsl:choose>
      <xsl:when test="./b:SourceType='Book'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Editor/b:NameList/b:Person)>0">Editor</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Translator/b:NameList/b:Person)>0">Translator</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='BookSection'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
          <xsl:when test="string-length(./b:Author/b:BookAuthor/b:NameList/b:Person)>0">BookAuthor</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='JournalArticle'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='ArticleInAPeriodical'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Editor/b:NameList/b:Person)>0">Editor</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='ConferenceProceedings'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='Report'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='SoundRecording'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Artist/b:NameList/b:Person)>0">Artist</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Performer/b:NameList/b:Person)>0">Performer</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Composer/b:NameList/b:Person)>0">Composer</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='Performance'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Writer/b:NameList/b:Person)>0">Writer</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Performer/b:NameList/b:Person)>0">Performer</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Director/b:NameList/b:Person)>0">Director</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='Art'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Artist/b:NameList/b:Person)>0">Artist</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='DocumentFromInternetSite'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='InternetSite'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='Film'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Writer/b:NameList/b:Person)>0">Writer</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Performer/b:NameList/b:Person)>0">Performer</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Director/b:NameList/b:Person)>0">Director</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='Interview'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Interviewee/b:NameList/b:Person)>0">Interviewee</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Editor/b:NameList/b:Person)>0">Editor</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Translator/b:NameList/b:Person)>0">Translator</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='Patent'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Inventor/b:NameList/b:Person)>0">Inventor</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Editor/b:NameList/b:Person)>0">Editor</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Translator/b:NameList/b:Person)>0">Translator</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='ElectronicSource'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Editor/b:NameList/b:Person)>0">Editor</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='Case'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Reporter/b:NameList/b:Person)>0">Reporter</xsl:when>
        </xsl:choose>
      </xsl:when>

      <xsl:when test="./b:SourceType='Misc'">
        <xsl:choose>
          <xsl:when test="string-length(./b:Author/b:Author/b:NameList/b:Person)>0">Author</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Editor/b:NameList/b:Person)>0">Editor</xsl:when>
          <xsl:when test="string-length(./b:Author/b:Translator/b:NameList/b:Person)>0">Translator</xsl:when>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  
  <xsl:template name="populateMain">
    <xsl:param name="Type"/>
    
    <xsl:element name="{$Type}">
      

      <xsl:for-each select="/*[$Type]/b:Source">
        
        <xsl:variable name="MostImportantAuthorLocalName">
          
          <xsl:call-template name="MainContributors"/>
        </xsl:variable>
        <xsl:element name="{'b:Source'}">
          
          <xsl:if test="$Type='b:Citation'">
            
            <b:Title>
              
              <xsl:if test="string-length(b:Title)>0">
                <xsl:value-of select="b:Title"/>
              </xsl:if>
              
              <xsl:if test="string-length(b:Title)=0">
                <xsl:choose>
                  <xsl:when test="b:SourceType='Book' or
                                  b:SourceType='JournalArticle' or
                                  b:SourceType='ConferenceProceedings' or
                                  b:SourceType='Report' or
                                  b:SourceType='Performance' or
                                  b:SourceType='Film' or
                                  b:SourceType='Patent' or
                                  b:SourceType='Case'">

                    <xsl:value-of select="b:ShortTitle"/>
                  </xsl:when>

                  <xsl:when test="b:SourceType='BookSection'">
                    <xsl:variable name="shortTitle" select="b:ShortTitle"/>
                    <xsl:variable name="bookTitle" select="b:BookTitle"/>

                    <xsl:choose>
                      <xsl:when test="string-length($shortTitle)>0">
                        <xsl:value-of select="$shortTitle"/>
                      </xsl:when>
                      <xsl:when test="string-length($bookTitle)>0">
                        <xsl:value-of select="$bookTitle"/>
                      </xsl:when>
                    </xsl:choose>

                  </xsl:when>

                  <xsl:when test="b:SourceType='ArticleInAPeriodical'">
                    <xsl:variable name="shortTitle" select="b:ShortTitle"/>
                    <xsl:variable name="periodicalTitle" select="b:PeriodicalTitle"/>

                    <xsl:choose>
                      <xsl:when test="string-length($shortTitle)>0">
                        <xsl:value-of select="$shortTitle"/>
                      </xsl:when>
                      <xsl:when test="string-length($periodicalTitle)>0">
                        <xsl:value-of select="$periodicalTitle"/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:when>

                  <xsl:when test="b:SourceType='InternetSite' or
                                  b:SourceType='DocumentFromInternetSite'">
                    <xsl:variable name="shortTitle" select="b:ShortTitle"/>
                    <xsl:variable name="internetSiteTitle" select="b:InternetSiteTitle"/>

                    <xsl:choose>
                      <xsl:when test="string-length($shortTitle)>0">
                        <xsl:value-of select="$shortTitle"/>
                      </xsl:when>
                      <xsl:when test="string-length($internetSiteTitle)>0">
                        <xsl:value-of select="$internetSiteTitle"/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:when>

                  <xsl:when test="b:SourceType='ElectronicSource' or
                                  b:SourceType='Art' or
                                  b:SourceType='Misc'">
                    <xsl:variable name="shortTitle" select="b:ShortTitle"/>
                    <xsl:variable name="publicationTitle" select="b:PublicationTitle"/>

                    <xsl:choose>
                      <xsl:when test="string-length($shortTitle)>0">
                        <xsl:value-of select="$shortTitle"/>
                      </xsl:when>
                      <xsl:when test="string-length($publicationTitle)>0">
                        <xsl:value-of select="$publicationTitle"/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:when>

                  <xsl:when test="b:SourceType='SoundRecording'">
                    <xsl:variable name="shortTitle" select="b:ShortTitle"/>
                    <xsl:variable name="albumTitle" select="b:AlbumTitle"/>

                    <xsl:choose>
                      <xsl:when test="string-length($shortTitle)>0">
                        <xsl:value-of select="$shortTitle"/>
                      </xsl:when>
                      <xsl:when test="string-length($albumTitle)>0">
                        <xsl:value-of select="$albumTitle"/>
                      </xsl:when>
                    </xsl:choose>
                  </xsl:when>

                  <xsl:when test="b:SourceType='Interview'">
                    <xsl:variable name="shortTitle" select="b:ShortTitle"/>
                    
                    <xsl:variable name="broadcastTitle" select="b:BroadcastTitle"/>
                    

                    <xsl:choose>
                      <xsl:when test="string-length($shortTitle)>0">
                        <xsl:value-of select="$shortTitle"/>
                      </xsl:when>
                      
                      <xsl:when test="string-length($broadcastTitle)>0">
                        <xsl:value-of select="$broadcastTitle"/>
                      </xsl:when>
                      
                    </xsl:choose>
                  </xsl:when>

                </xsl:choose>
              </xsl:if>
            </b:Title>
          </xsl:if>
          <b:Author>
            
            <b:Main>
              <b:NameList>
                <xsl:for-each select="./b:Author/*[local-name()=$MostImportantAuthorLocalName]/b:NameList/b:Person">
                  <b:Person>
                    
                    <b:Last>
                      <xsl:value-of select="./b:Last"/>
                    </b:Last>
                    <b:First>
                      <xsl:value-of select="./b:First"/>
                    </b:First>
                    <b:Middle>
                      <xsl:value-of select="./b:Middle"/>
                    </b:Middle>
                    <b:PostFix>
                      <xsl:value-of select="./b:PostFix"/>
                    </b:PostFix>
                  </b:Person>
                </xsl:for-each>
              </b:NameList>
            </b:Main>
            <xsl:for-each select="./b:Author/*">
              
              
              <xsl:element name="{name()}" namespace="{namespace-uri()}">
                <xsl:call-template name="copyNameNodes"/>
                
              </xsl:element>
              
            </xsl:for-each>
          </b:Author>
          <xsl:for-each select="*">
            
            <xsl:if test="name()!='Author' and not(name()='Title' and $Type='b:Citation')">
              <xsl:element name="{name()}" namespace="{namespace-uri()}">
                <xsl:call-template name="copyNodes"/>
                
              </xsl:element>
            </xsl:if>
          </xsl:for-each>
        </xsl:element>
        <xsl:for-each select="../*">
          
          <xsl:if test="name()!='Source'">
            <xsl:element name="{name()}" namespace="{namespace-uri()}">
              <xsl:call-template name="copyNodes"/>
              
            </xsl:element>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
      
      <xsl:copy-of select="/*[$Type]/b:Locals"/>
    </xsl:element>
  </xsl:template>

  
  <xsl:template name="copyNameNodes">
    <b:NameList>
      <xsl:for-each select="b:NameList/b:Person">
        
        <b:Person>
          
          <xsl:if test="string-length(./b:Last)>0">
            
            <b:Last>
              <xsl:value-of select="./b:Last"/>
            </b:Last>
          </xsl:if>
          <xsl:if test="string-length(./b:Middle)>0">
            <b:Middle>
              <xsl:value-of select="./b:Middle"/>
            </b:Middle>
          </xsl:if>
          <xsl:if test="string-length(./b:First)>0">
            <b:First>
              <xsl:value-of select="./b:First"/>
            </b:First>
          </xsl:if>
          <xsl:if test="string-length(./b:PostFix)">
            <b:PostFix>
              <xsl:value-of select="./b:PostFix"/>
            </b:PostFix>
          </xsl:if>
        </b:Person>
      </xsl:for-each>
    </b:NameList>
  </xsl:template>

  
  <xsl:template name="copyNodes">
    <xsl:value-of select="."/>

  </xsl:template>

  <xsl:template name="copyNodes2">
    <xsl:for-each select="@*">
      <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
        <xsl:value-of select="."/>
      </xsl:attribute>
    </xsl:for-each>
    <xsl:for-each select="*">
      <xsl:element name="{name()}" namespace="{namespace-uri()}">
        <xsl:call-template name="copyNodes2"/>
        
      </xsl:element>
    </xsl:for-each>

  </xsl:template>


  <xsl:template name="handleSpaces">
    <xsl:param name="field"/>

    <xsl:variable name="prop_NormalizeSpace">
      <xsl:call-template name="templ_prop_NormalizeSpace"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$prop_NormalizeSpace='yes'">
        <xsl:value-of select="normalize-space($field)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$field"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="appendField_Dot">
    <xsl:param name="field"/>

    <xsl:variable name="temp">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$field"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="prop_EndChars">
      <xsl:call-template name="templ_prop_EndChars"/>
    </xsl:variable>

    <xsl:variable name="lastChar">
      <xsl:value-of select="substring($temp, string-length($temp))"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="string-length($temp) = 0">
      </xsl:when>
      <xsl:when test="contains($prop_EndChars, $lastChar)">
        <xsl:value-of select="$temp"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$temp"/>
        <xsl:call-template name="templ_prop_Dot"/>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>


  <xsl:template name="appendFieldNoHandleSpaces_Dot">
    <xsl:param name="field"/>

    <xsl:variable name="lastChar">
      <xsl:value-of select="substring($field, string-length($field))"/>
    </xsl:variable>

    <xsl:variable name="prop_EndChars">
      <xsl:call-template name="templ_prop_EndChars"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="string-length($field) = 0">
      </xsl:when>
      <xsl:when test="contains($prop_EndChars, $lastChar)">
        <xsl:value-of select="$field"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$field"/>
        <xsl:call-template name="templ_prop_Dot"/>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>


  <xsl:template name="templateA">
    <xsl:param name="first"/>
    <xsl:param name="second"/>
    <xsl:param name="third"/>

    <xsl:variable name="tempFirst">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$first"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="tempSecond">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$second"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="tempThird">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$third"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="temp">
      <xsl:if test="string-length($tempFirst)>0">
        <xsl:value-of select="$tempFirst"/>
      </xsl:if>

      <xsl:if test="string-length($tempFirst)>0 and (string-length($tempSecond)>0 or string-length($tempThird)>0)">
        <xsl:call-template name="templ_prop_EnumSeparator"/>
      </xsl:if>

      <xsl:if test="string-length($tempSecond)>0">
        <xsl:value-of select="$tempSecond"/>
      </xsl:if>

      <xsl:if test="string-length($tempSecond)>0 and string-length($tempThird)>0">
        <xsl:call-template name="templ_prop_ListSeparator"/>
      </xsl:if>

      <xsl:if test="string-length($tempThird)>0">
        <xsl:value-of select="$tempThird"/>
      </xsl:if>
    </xsl:variable>

    <xsl:call-template name="appendFieldNoHandleSpaces_Dot">
      <xsl:with-param name="field" select="$temp"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="templateB">
    <xsl:param name="first"/>
    <xsl:param name="second"/>

    <xsl:variable name="tempFirst">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$first"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="tempSecond">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$second"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="temp">
      <xsl:if test="string-length($tempFirst)>0">
        <xsl:value-of select="$tempFirst"/>
      </xsl:if>

      <xsl:if test="string-length($tempFirst)>0 and string-length($tempSecond)>0">
        <xsl:call-template name="templ_prop_EnumSeparator"/>
      </xsl:if>

      <xsl:if test="string-length($tempSecond)>0">
        <xsl:value-of select="$tempSecond"/>
      </xsl:if>

    </xsl:variable>

    <xsl:call-template name="appendFieldNoHandleSpaces_Dot">
      <xsl:with-param name="field" select="$temp"/>
    </xsl:call-template>

  </xsl:template>

  <xsl:template name="templateC">
    <xsl:param name="first"/>
    <xsl:param name="second"/>

    <xsl:variable name="tempFirst">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$first"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="tempSecond">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$second"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="temp">
      <xsl:if test="string-length($tempFirst)>0">
        <xsl:value-of select="$tempFirst"/>
      </xsl:if>

      <xsl:if test="string-length($tempFirst)>0 and string-length($tempSecond)>0">
        <xsl:call-template name="templ_prop_ListSeparator"/>
      </xsl:if>

      <xsl:if test="string-length($tempSecond)>0">
        <xsl:value-of select="$tempSecond"/>
      </xsl:if>

    </xsl:variable>

    <xsl:call-template name="appendFieldNoHandleSpaces_Dot">
      <xsl:with-param name="field" select="$temp"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="templateD">
    <xsl:param name="first"/>
    <xsl:param name="second"/>
    <xsl:param name="third"/>

    <xsl:variable name="tempFirst">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$first"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="tempSecond">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$second"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="tempThird">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$third"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="temp">
      <xsl:if test="string-length($tempFirst)>0">
        <xsl:value-of select="$tempFirst"/>
      </xsl:if>

      <xsl:if test="string-length($tempFirst)>0 and string-length($tempSecond)>0">
        <xsl:call-template name="templ_prop_Space"/>
      </xsl:if>

      <xsl:if test="string-length($tempSecond)>0">
        <xsl:call-template name="templ_prop_OpenBracket"/>
        <xsl:value-of select="$tempSecond"/>
        <xsl:call-template name="templ_prop_CloseBracket"/>
      </xsl:if>

      <xsl:if test="(string-length($tempFirst)>0 or string-length($tempSecond)>0) and string-length($tempThird)>0">
        <xsl:call-template name="templ_prop_EnumSeparator"/>
      </xsl:if>

      <xsl:if test="string-length($tempThird)>0">
        <xsl:value-of select="$tempThird"/>
      </xsl:if>
    </xsl:variable>

    <xsl:call-template name="appendFieldNoHandleSpaces_Dot">
      <xsl:with-param name="field" select="$temp"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="templateE">
    <xsl:param name="first"/>
    <xsl:param name="second"/>
    <xsl:param name="third"/>

    <xsl:variable name="tempFirst">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$first"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="tempSecond">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$second"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="tempThird">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$third"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="temp">
      <xsl:if test="string-length($tempFirst)>0">
        <xsl:value-of select="$tempFirst"/>
      </xsl:if>

      <xsl:if test="string-length($tempFirst)>0 and string-length($tempSecond)>0">
        <xsl:call-template name="templ_prop_ListSeparator"/>
      </xsl:if>

      <xsl:if test="string-length($tempSecond)>0">
        <xsl:value-of select="$tempSecond"/>
      </xsl:if>

      <xsl:if test="(string-length($tempFirst)>0 or string-length($tempSecond)>0) and string-length($tempThird)>0">
        <xsl:call-template name="templ_prop_EnumSeparator"/>
      </xsl:if>

      <xsl:if test="string-length($tempThird)>0">
        <xsl:value-of select="$tempThird"/>
      </xsl:if>
    </xsl:variable>

    <xsl:call-template name="appendFieldNoHandleSpaces_Dot">
      <xsl:with-param name="field" select="$temp"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="templateCPY">
    <xsl:call-template name="templateA">
      <xsl:with-param name="first" select="b:City"/>
      <xsl:with-param name="second" select="b:Publisher"/>
      <xsl:with-param name="third" select="b:Year"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateCPcY">
    <xsl:call-template name="templateA">
      <xsl:with-param name="first" select="b:City"/>
      <xsl:with-param name="second" select="b:ProductionCompany"/>
      <xsl:with-param name="third" select="b:Year"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateIYP">
    <xsl:call-template name="templateD">
      <xsl:with-param name="first" select="b:Issue"/>
      <xsl:with-param name="second" select="b:Year"/>
      <xsl:with-param name="third" select="b:Pages"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateVYP">
    <xsl:call-template name="templateD">
      <xsl:with-param name="first" select="b:Volume"/>
      <xsl:with-param name="second" select="b:Year"/>
      <xsl:with-param name="third" select="b:Pages"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateDEP">

    <xsl:variable name="date">
      <xsl:call-template name="formatDate"/>
    </xsl:variable>

    <xsl:variable name="editionTemp">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="b:Edition"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="edition">
      <xsl:choose>
        <xsl:when test="string-length($editionTemp)>0">
          <xsl:value-of select="$editionTemp"/>
          <xsl:call-template name="templ_prop_Space"/>
          <xsl:call-template name="templ_str_EditionShortUnCap"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:call-template name="templateE">
      <xsl:with-param name="first" select="$date"/>
      <xsl:with-param name="second" select="$edition"/>
      <xsl:with-param name="third" select="b:Pages"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateTC">
    <xsl:call-template name="templateC">
      <xsl:with-param name="first" select="b:Theater"/>
      <xsl:with-param name="second" select="b:City"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateIC">
    <xsl:call-template name="templateC">
      <xsl:with-param name="first" select="b:Institution"/>
      <xsl:with-param name="second" select="b:City"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateIY">
    <xsl:call-template name="templateC">
      <xsl:with-param name="first" select="b:Institution"/>
      <xsl:with-param name="second" select="b:Year"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="templateDY">
    <xsl:call-template name="templateC">
      <xsl:with-param name="first" select="b:Distributor"/>
      <xsl:with-param name="second" select="b:Year"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateCPD">
    <xsl:variable name="date">
      <xsl:call-template name="formatDate"/>
    </xsl:variable>

    <xsl:call-template name="templateA">
      <xsl:with-param name="first" select="b:City"/>
      <xsl:with-param name="second" select="b:Publisher"/>
      <xsl:with-param name="third" select="$date"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateSC">
    <xsl:call-template name="templateC">
      <xsl:with-param name="first" select="b:Station"/>
      <xsl:with-param name="second" select="b:City"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="templateCP">
    <xsl:variable name="patentTemp">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="b:PatentNumber"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="str_PatentCap">
      <xsl:call-template name="templ_str_PatentCap"/>
    </xsl:variable>

    <xsl:variable name="patent">
      <xsl:choose>
        <xsl:when test="string-length($patentTemp)>0">
          <xsl:call-template name="StringFormat">
            <xsl:with-param name="format" select="$str_PatentCap"/>

            <xsl:with-param name="parameters">
              <t:params>
                <t:param>
                  <xsl:value-of select="$patentTemp"/>
                </t:param>
              </t:params>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="templateB">
      <xsl:with-param name="first" select="b:CountryRegion"/>
      <xsl:with-param name="second" select="$patent"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="templateCD">
    <xsl:variable name="date">
      <xsl:call-template name="formatDate"/>
    </xsl:variable>
    <xsl:call-template name="templateB">
      <xsl:with-param name="first" select="b:City"/>
      <xsl:with-param name="second" select="$date"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="templateVIYP">

    <xsl:variable name="volume">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="b:Volume"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="issue">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="b:Issue"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="year">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="b:Year"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="pages">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="b:Pages"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="temp">
      <xsl:if test="string-length($volume)>0">
        <xsl:value-of select="$volume"/>
      </xsl:if>

      <xsl:if test="string-length($volume)>0 and string-length($issue)>0">
        <xsl:call-template name="templ_prop_Dot"/>
      </xsl:if>

      <xsl:if test="string-length($issue)>0">
        <xsl:value-of select="$issue"/>
      </xsl:if>

      <xsl:if test="string-length($year)>0">
        <xsl:call-template name="templ_prop_Space"/>
        <xsl:call-template name="templ_prop_OpenBracket"/>
        <xsl:value-of select="$year"/>
        <xsl:call-template name="templ_prop_CloseBracket"/>
      </xsl:if>

      <xsl:if test="(string-length($volume)>0 or string-length($issue)>0 or string-length($year)>0) and (string-length($pages)>0)">
        <xsl:call-template name="templ_prop_EnumSeparator"/>
      </xsl:if>

      <xsl:if test="string-length($pages)>0">
        <xsl:value-of select="$pages"/>
      </xsl:if>
    </xsl:variable>

    <xsl:call-template name="appendField_Dot">
      <xsl:with-param name="field" select="$temp"/>
    </xsl:call-template>


  </xsl:template>
  <xsl:template name="need_Dot">
    <xsl:param name="field"/>

    <xsl:variable name="temp">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$field"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="prop_EndChars">
      <xsl:call-template name="templ_prop_EndChars"/>
    </xsl:variable>

    <xsl:variable name="lastChar">
      <xsl:value-of select="substring($temp, string-length($temp))"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="string-length($temp) = 0">
      </xsl:when>
      <xsl:when test="contains($prop_EndChars, $lastChar)">
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="templ_prop_Dot"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  

  <xsl:template name="formatNameCore">
    <xsl:param name="FML"/>
    <xsl:param name="FM"/>
    <xsl:param name="ML"/>
    <xsl:param name="FL"/>
    <xsl:param name="upperLast"/>
    <xsl:param name="withDot"/>

    <xsl:variable name="first">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="b:First"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="middle">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="b:Middle"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="last">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="b:Last"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="format">
      <xsl:choose>
        <xsl:when test="string-length($first) = 0 and string-length($middle) = 0 and string-length($last) = 0 ">
        </xsl:when>
        <xsl:when test="string-length($first) = 0 and string-length($middle) = 0 and string-length($last) != 0 ">
          <xsl:call-template name="templ_prop_SimpleAuthor_L" />
        </xsl:when>
        <xsl:when test="string-length($first) = 0 and string-length($middle) != 0 and string-length($last) = 0 ">
          <xsl:call-template name="templ_prop_SimpleAuthor_M" />
        </xsl:when>
        <xsl:when test="string-length($first) = 0 and string-length($middle) != 0 and string-length($last) != 0 ">
          <xsl:value-of select="$ML"/>
        </xsl:when>
        <xsl:when test="string-length($first) != 0 and string-length($middle) = 0 and string-length($last) = 0 ">
          <xsl:call-template name="templ_prop_SimpleAuthor_F" />
        </xsl:when>
        <xsl:when test="string-length($first) != 0 and string-length($middle) = 0 and string-length($last) != 0 ">
          <xsl:value-of select="$FL"/>
        </xsl:when>
        <xsl:when test="string-length($first) != 0 and string-length($middle) != 0 and string-length($last) = 0 ">
          <xsl:value-of select="$FM"/>
        </xsl:when>
        <xsl:when test="string-length($first) != 0 and string-length($middle) != 0 and string-length($last) != 0 ">
          <xsl:value-of select="$FML"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:call-template name="StringFormatName">
      <xsl:with-param name="format" select="$format"/>
      <xsl:with-param name="upperLast" select="$upperLast"/>
      <xsl:with-param name="withDot" select="$withDot"/>
    </xsl:call-template>

  </xsl:template>

  <xsl:template name="formatDateCorePrivate">
    <xsl:param name="DMY"/>
    <xsl:param name="DM"/>
    <xsl:param name="MY"/>
    <xsl:param name="DY"/>

    <xsl:param name="day"/>
    <xsl:param name="month"/>
    <xsl:param name="year"/>

    <xsl:param name="withDot"/>

    <xsl:variable name="format">
      <xsl:choose>
        <xsl:when test="string-length($day) = 0 and string-length($month) = 0 and string-length($year) = 0 ">
        </xsl:when>
        <xsl:when test="string-length($day) = 0 and string-length($month) = 0 and string-length($year) != 0 ">
          <xsl:call-template name="templ_prop_SimpleDate_Y" />
        </xsl:when>
        <xsl:when test="string-length($day) = 0 and string-length($month) != 0 and string-length($year) = 0 ">
          <xsl:call-template name="templ_prop_SimpleDate_M" />
        </xsl:when>
        <xsl:when test="string-length($day) = 0 and string-length($month) != 0 and string-length($year) != 0 ">
          <xsl:value-of select="$MY"/>
        </xsl:when>
        <xsl:when test="string-length($day) != 0 and string-length($month) = 0 and string-length($year) = 0 ">
          <xsl:call-template name="templ_prop_SimpleDate_D" />
        </xsl:when>
        <xsl:when test="string-length($day) != 0 and string-length($month) = 0 and string-length($year) != 0 ">
          <xsl:value-of select="$DY"/>
        </xsl:when>
        <xsl:when test="string-length($day) != 0 and string-length($month) != 0 and string-length($year) = 0 ">
          <xsl:value-of select="$DM"/>
        </xsl:when>
        <xsl:when test="string-length($day) != 0 and string-length($month) != 0 and string-length($year) != 0 ">
          <xsl:value-of select="$DMY"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:call-template name="StringFormatDate">
      <xsl:with-param name="format" select="$format"/>

      <xsl:with-param name="day" select="$day"/>
      <xsl:with-param name="month" select="$month"/>
      <xsl:with-param name="year" select="$year"/>

      <xsl:with-param name="withDot" select="$withDot"/>
    </xsl:call-template>

  </xsl:template>

  <xsl:template name="StringFormatName">
    <xsl:param name="format" />
    <xsl:param name="withDot" />
    <xsl:param name="upperLast"/>

    <xsl:variable name="prop_EndChars">
      <xsl:call-template name="templ_prop_EndChars"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$format = ''"></xsl:when>
      <xsl:when test="substring($format, 1, 2) = '%%'">
        <xsl:text>%</xsl:text>
        <xsl:call-template name="StringFormatName">
          <xsl:with-param name="format" select="substring($format, 3)" />
          <xsl:with-param name="withDot" select="$withDot" />
          <xsl:with-param name="upperLast" select="$upperLast" />
        </xsl:call-template>
        <xsl:if test="string-length($format)=2 and withDot = 'yes' and not(contains($prop_EndChars, '%'))">
          <xsl:call-template name="templ_prop_Dot"/>
        </xsl:if>
      </xsl:when>
      <xsl:when test="substring($format, 1, 1) = '%'">
        <xsl:variable name="what" select="substring($format, 2, 1)" />

        <xsl:choose>
          <xsl:when test="(what = 'l' or what = 'L') and upperLast = 'yes'">
            <span style='text-transform: uppercase;'>
              <xsl:call-template name="formatNameOneItem">
                <xsl:with-param name="format" select="$what"/>
              </xsl:call-template>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="formatNameOneItem">
              <xsl:with-param name="format" select="$what"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="StringFormatName">
          <xsl:with-param name="format" select="substring($format, 3)" />
          <xsl:with-param name="withDot" select="$withDot" />
          <xsl:with-param name="upperLast" select="$upperLast" />
        </xsl:call-template>
        <xsl:if test="string-length($format)=2 and withDot='yes'">
          <xsl:variable name="temp2">
            <xsl:call-template name="handleSpaces">
              <xsl:with-param name="field">
                <xsl:call-template name="formatNameOneItem">
                  <xsl:with-param name="format" select="$what"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="lastChar">
            <xsl:value-of select="substring($temp2, string-length($temp2))"/>
          </xsl:variable>
          <xsl:if test="not(contains($prop_EndChars, $lastChar))">
            <xsl:call-template name="templ_prop_Dot"/>
          </xsl:if>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring($format, 1, 1)" />
        <xsl:call-template name="StringFormatName">
          <xsl:with-param name="format" select="substring($format, 2)" />
          <xsl:with-param name="withDot" select="$withDot" />
          <xsl:with-param name="upperLast" select="$upperLast" />
        </xsl:call-template>
        <xsl:if test="string-length($format)=1">
          <xsl:if test="withDot = 'yes' and not(contains($prop_EndChars, $format))">
            <xsl:call-template name="templ_prop_Dot"/>
          </xsl:if>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="StringFormatDate">
    <xsl:param name="format" />

    <xsl:param name="day"/>
    <xsl:param name="month"/>
    <xsl:param name="year"/>

    <xsl:param name="withDot" />

    <xsl:variable name="prop_EndChars">
      <xsl:call-template name="templ_prop_EndChars"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$format = ''"></xsl:when>
      <xsl:when test="substring($format, 1, 2) = '%%'">
        <xsl:text>%</xsl:text>
        <xsl:call-template name="StringFormatDate">
          <xsl:with-param name="format" select="substring($format, 3)" />
          <xsl:with-param name="day" select="$day"/>
          <xsl:with-param name="month" select="$month"/>
          <xsl:with-param name="year" select="$year"/>
          <xsl:with-param name="withDot" select="$withDot" />
        </xsl:call-template>
        <xsl:if test="string-length($format)=2 and withDot = 'yes' and not(contains($prop_EndChars, '%'))">
          <xsl:call-template name="templ_prop_Dot"/>
        </xsl:if>
      </xsl:when>
      <xsl:when test="substring($format, 1, 1) = '%'">
        <xsl:variable name="what" select="substring($format, 2, 1)" />
        <xsl:choose>
          <xsl:when test="$what = 'D'">
            <xsl:value-of select="$day"/>
          </xsl:when>
          <xsl:when test="$what = 'M'">
            <xsl:value-of select="$month"/>
          </xsl:when>
          <xsl:when test="$what = 'Y'">
            <xsl:value-of select="$year"/>
          </xsl:when>
        </xsl:choose>
        <xsl:call-template name="StringFormatDate">
          <xsl:with-param name="format" select="substring($format, 3)" />
          <xsl:with-param name="day" select="$day"/>
          <xsl:with-param name="month" select="$month"/>
          <xsl:with-param name="year" select="$year"/>
          <xsl:with-param name="withDot" select="$withDot" />
        </xsl:call-template>
        <xsl:if test="string-length($format)=2 and withDot='yes'">
          <xsl:variable name="temp2">
            <xsl:call-template name="handleSpaces">
              <xsl:with-param name="field">
                <xsl:call-template name="formatNameOneItem">
                  <xsl:with-param name="format" select="$what"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="lastChar">
            <xsl:value-of select="substring($temp2, string-length($temp2))"/>
          </xsl:variable>
          <xsl:if test="not(contains($prop_EndChars, $lastChar))">
            <xsl:call-template name="templ_prop_Dot"/>
          </xsl:if>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring($format, 1, 1)" />
        <xsl:call-template name="StringFormatDate">
          <xsl:with-param name="format" select="substring($format, 2)" />
          <xsl:with-param name="day" select="$day"/>
          <xsl:with-param name="month" select="$month"/>
          <xsl:with-param name="year" select="$year"/>
          <xsl:with-param name="withDot" select="$withDot" />
        </xsl:call-template>
        <xsl:if test="string-length($format)=1">
          <xsl:if test="withDot = 'yes' and not(contains($prop_EndChars, $format))">
            <xsl:call-template name="templ_prop_Dot"/>
          </xsl:if>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="formatDateCore">
    <xsl:param name="day"/>
    <xsl:param name="month"/>
    <xsl:param name="year"/>
    <xsl:param name="displayND"/>

    <xsl:param name="DMY"/>
    <xsl:param name="DM"/>
    <xsl:param name="MY"/>
    <xsl:param name="DY"/>

    <xsl:choose>
      <xsl:when test="string-length($year)=0">
        <xsl:if test="$displayND = 'yes'">
          <xsl:call-template name="templ_str_NoDateShortUnCap"/>
        </xsl:if>
      </xsl:when>
      <xsl:when test="string-length($month)=0">
        <xsl:value-of select="$year"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="formatDateCorePrivate">
          <xsl:with-param name="day" select="$day"/>
          <xsl:with-param name="month" select="$month"/>
          <xsl:with-param name="year" select="$year"/>

          <xsl:with-param name="DMY" select="$DMY"/>
          <xsl:with-param name="DM" select="$DM"/>
          <xsl:with-param name="MY" select="$MY"/>
          <xsl:with-param name="DY" select="$DY"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template name="formatNameOneItem">
    <xsl:param name="format"/>

    <xsl:choose>
      <xsl:when test="$format = 'F'">
        <xsl:value-of select="b:First"/>
      </xsl:when>
      <xsl:when test="$format = 'L'">
        <xsl:value-of select="b:Last"/>
      </xsl:when>
      <xsl:when test="$format = 'M'">
        <xsl:value-of select="b:Middle"/>
      </xsl:when>
      <xsl:when test="$format = 'f'">
        <xsl:call-template name="formatNameInitial">
          <xsl:with-param name="name" select="b:First"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$format = 'm'">
        <xsl:call-template name="formatNameInitial">
          <xsl:with-param name="name" select="b:Middle"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$format = 'l'">
        <xsl:call-template name="formatNameInitial">
          <xsl:with-param name="name" select="b:Last"/>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>

  </xsl:template>

  <xsl:template name="formatNameInitial">
    <xsl:param name="name"/>
    <xsl:variable name="temp">
      <xsl:call-template name="handleSpaces">
        <xsl:with-param name="field" select="$name"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="prop_APA_Hyphens">
      <xsl:call-template name="templ_prop_Hyphens"/>
    </xsl:variable>

    <xsl:if test="string-length($temp)>0">

      <xsl:variable name="tempWithoutSpaces">
        <xsl:value-of select="translate($temp, '&#32;&#160;', '')"/>
        
      </xsl:variable>

      <xsl:if test="not(contains($prop_APA_Hyphens, substring($tempWithoutSpaces, 1, 1)))">
        <xsl:value-of select="substring($tempWithoutSpaces, 1, 1)"/>
        <xsl:call-template name="templ_prop_DotInitial"/>
      </xsl:if>

      <xsl:call-template name="handleHyphens">
        <xsl:with-param name="name" select="$tempWithoutSpaces"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="handleHyphens">
    <xsl:param name="name"/>

    <xsl:variable name="prop_APA_Hyphens">
      <xsl:call-template name="templ_prop_Hyphens"/>
    </xsl:variable>

    <xsl:if test="string-length($name)>=2">
      <xsl:choose>
        <xsl:when test="contains($prop_APA_Hyphens, substring($name, 1, 1))">
          <xsl:value-of select="substring($name, 1, 2)"/>
          <xsl:call-template name="templ_prop_DotInitial"/>

          <xsl:call-template name="handleHyphens">
            <xsl:with-param name="name" select="substring($name, 3)"/>
          </xsl:call-template>
        </xsl:when>

        <xsl:otherwise>
          <xsl:call-template name="handleHyphens">
            <xsl:with-param name="name" select="substring($name, 2)"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:if>

  </xsl:template>


</xsl:stylesheet>