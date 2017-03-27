<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="META" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="StyleWizard" TagName="Skin" Src="~/DesktopModules/EasyDNNstyleWizard/SkinObjects/Skin.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<dnn:META ID="META1" runat="server" Name="viewport" Content="width=device-width,initial-scale=1,maximum-scale=1" />

<dnn:STYLES runat="server" id="FireflyBaseStyle" Name="FireflySkinBase" StyleSheet="common/base.css" UseSkinPath="true" />
<dnn:STYLES runat="server" id="bootstrapCustom" Name="bootstrapCustom" StyleSheet="common/bootstrapCustom.css" UseSkinPath="true" />
<StyleWizard:Skin runat="server" id="FireflyStyleWizard" />

<dnn:DnnJsInclude runat="server" FilePath="js/main-scripts.js" PathNameAlias="SkinPath" />

<div class="EasyDNNSkin_Firefly" id="top">
	<div class="EDS_header">
		<div class="EDS_logo"><dnn:LOGO id="dnnLogo" runat="server" /></div>
		<div class="EDS_loginLinks">
			<dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
			<ul class="EDS_headerLinks">
				<li class="EDN_social">
					<!-- AddThis Button BEGIN -->
					<div class="addthis_toolbox addthis_default_style">
						<a class="addthis_counter addthis_pill_style"></a>
					</div>
					<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-52a856ee165a8bdf"></script>
					<!-- AddThis Button END -->
				</li>
				<li class="EDN_rss"><a href="#"><span>RSS</span></a></li>
			</ul>
			<dnn:USER ID="dnnUser" runat="server" LegacyMode="false" /> 
		</div>
		<div class="EDS_search">
			<dnn:SEARCH ID="dnnSearch" runat="server" Submit="Search" ShowSite="false" ShowWeb="false" />
		</div>
	</div>
	<div class="EDS_content-bg">
		<div class="responsAbilityMenu">
			<div class="raMenuTriggerWrapper"><span class="raMenuTrigger"><span>Menu</span></span></div>
			<div class="raMenuWrapper">
				<dnn:MENU ID="main_menu" MenuStyle="DNNStandard" runat="server" />
			</div>
			<div class="EDS_language">
				<dnn:LANGUAGE runat="server" id="dnnLANGUAGE" showMenu="False" showLinks="True" />
			</div>
		</div>
		<div class="responsAbilityMenuPlaceholder"></div>
		<div class="EDS_topWideBackground">
			<div class="EDS_topWide" runat="server" id="TopPaneWide"></div>
			<div class="EDS_top1" runat="server" id="TopPane1"></div>
		</div>
		<div class="EDS_top2" runat="server" id="TopPane2"></div>
		<div class="EDS_top3" runat="server" id="TopPane3"></div>
		<div class="EDS_top-pane" runat="server" id="TopPane"></div>
		<div class="EDS_content EDS_no-background">
			<div class="EDS_content-top" runat="server" id="ContentTop"></div>
			<div class="EDS_clear"></div>
			<section class="row-fluid">
				<div class="span3">
					<div runat="server" id="RowOne_Grid3_Pane" class="RowOne_Grid3_Pane"></div>
				</div>
				<div class="span9">
					<div runat="server" id="RowOne_Grid9_Pane" class="RowOne_Grid9_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span4">
					<div runat="server" id="RowTwo_Grid4_Pane" class="RowTwo_Grid4_Pane"></div>
				</div>
				<div class="span8">
					<div runat="server" id="RowTwo_Grid8_Pane" class="RowTwo_Grid8_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span5">
					<div runat="server" id="RowThree_Grid5_Pane" class="RowThree_Grid5_Pane"></div>
				</div>
				<div class="span7">
					<div runat="server" id="RowThree_Grid7_Pane" class="RowThree_Grid7_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span6">
					<div runat="server" id="RowFour_Grid6_Pane1" class="RowFour_Grid6_Pane1"></div>
				</div>
				<div class="span6">
					<div runat="server" id="RowFour_Grid6_Pane2" class="RowFour_Grid6_Pane2"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span7">
					<div runat="server" id="RowFive_Grid7_Pane" class="RowFive_Grid7_Pane"></div>
				</div>
				<div class="span5">
					<div runat="server" id="RowFive_Grid5_Pane" class="RowFive_Grid5_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span8">
					<div runat="server" id="RowSix_Grid8_Pane" class="RowSix_Grid8_Pane"></div>
				</div>
				<div class="span4">
					<div runat="server" id="RowSix_Grid4_Pane" class="RowSix_Grid4_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span9">
					<div runat="server" id="RowSeven_Grid9_Pane" class="RowSeven_Grid9_Pane"></div>
				</div>
				<div class="span3">
					<div runat="server" id="RowSeven_Grid3_Pane" class="RowSeven_Grid3_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span4">
					<div runat="server" id="RowEight_Grid4_Pane1" class="RowEight_Grid4_Pane1"></div>
				</div>
				<div class="span4">
					<div runat="server" id="RowEight_Grid4_Pane2" class="RowEight_Grid4_Pane2"></div>
				</div>
				<div class="span4">
					<div runat="server" id="RowEight_Grid4_Pane3" class="RowEight_Grid4_Pane3"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span3">
					<div runat="server" id="RowNine_Grid3_Pane1" class="RownNine_Grid3_Pane1"></div>
				</div>
				<div class="span3">
					<div runat="server" id="RowNine_Grid3_Pane2" class="RowNine_Grid3_Pane2"></div>
				</div>
				<div class="span3">
					<div runat="server" id="RowNine_Grid3_Pane3" class="RowNine_Grid3_Pane3"></div>
				</div>
				<div class="span3">
					<div runat="server" id="RowNine_Grid3_Pane4" class="RowNine_Grid3_Pane4"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span12">
					<div runat="server" id="ContentPane" class="ContentPane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span4">
					<div runat="server" id="RowTen_Grid4_Pane1" class="RowTen_Grid4_Pane1"></div>
				</div>
				<div class="span4">
					<div runat="server" id="RowTen_Grid4_Pane2" class="RowTen_Grid4_Pane2"></div>
				</div>
				<div class="span4">
					<div runat="server" id="RowTen_Grid4_Pane3" class="RowTen_Grid4_Pane3"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span9">
					<div runat="server" id="RowEleven_Grid9_Pane" class="RowEleven_Grid9_Pane"></div>
				</div>
				<div class="span3">
					<div runat="server" id="RowEleven_Grid3_Pane" class="RowEleven_Grid3_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span8">
					<div runat="server" id="RowTwelve_Grid8_Pane" class="RowTwelve_Grid8_Pane"></div>
				</div>
				<div class="span4">
					<div runat="server" id="RowTwelve_Grid4_Pane" class="RowTwelve_Grid4_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span7">
					<div runat="server" id="RowThirteen_Grid7_Pane" class="RowThirteen_Grid7_Pane"></div>
				</div>
				<div class="span5">
					<div runat="server" id="RowThirteen_Grid5_Pane" class="RowThirteen_Grid5_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span6">
					<div runat="server" id="RowFourteen_Grid6_Pane1" class="RowFourteen_Grid6_Pane1"></div>
				</div>
				<div class="span6">
					<div runat="server" id="RowFourteen_Grid6_Pane2" class="RowFourteen_Grid6_Pane2"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span5">
					<div runat="server" id="RowFifteen_Grid5_Pane" class="RowFifteen_Grid5_Pane"></div>
				</div>
				<div class="span7">
					<div runat="server" id="RowFifteen_Grid7_Pane" class="RowFifteen_Grid7_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span4">
					<div runat="server" id="RowSixteen_Grid4_Pane" class="RowSixteen_Grid4_Pane"></div>
				</div>
				<div class="span8">
					<div runat="server" id="RowSixteen_Grid8_Pane" class="RowSixteen_Grid8_Pane"></div>
				</div>
			</section>
			<section class="row-fluid">
				<div class="span3">
					<div runat="server" id="RowSeventeen_Grid3_Pane" class="RowSeventeen_Grid3_Pane"></div>
				</div>
				<div class="span9">
					<div runat="server" id="RowSeventeen_Grid9_Pane" class="RowSeventeen_Grid9_Pane"></div>
				</div>
			</section>
			<div class="row-fluid">
				<div class="span12">
					<div runat="server" id="ContentBottom" class="BottomPane"></div>
				</div>
			</div>
			<div class="EDS_clear"></div>
		</div>
		<div class="EDS_bottom1" runat="server" id="BottomPane1"></div>
		<div class="EDS_bottom2" runat="server" id="BottomPane2"></div>
		<div class="EDS_bottom3" runat="server" id="BottomPane3"></div>
	</div>
	<div class="EDS_bottom-content-bg">
		<div class="EDS_bottom-content">
			<div class="EDS_bottom-box" runat="server" id="FooterBox1"></div>
			<div class="EDS_bottom-box" runat="server" id="FooterBox2"></div>
			<div class="EDS_bottom-box EDS_third-bottom-box" runat="server" id="FooterBox3"></div>
			<div class="EDS_bottom-box" runat="server" id="FooterBox4"></div>
			<div class="EDS_clear"></div>
		</div>
	</div>
	<div class="EDS_footer">
		<div class="EDS_footer-logo"><dnn:LOGO id="dnnLogo2" runat="server" /></div>
		<div class="EDS_copyright">
			<p><dnn:COPYRIGHT ID="dnnCopyright" runat="server" /></p>
			<p><dnn:TERMS ID="dnnTerms" runat="server" /> | <dnn:PRIVACY ID="dnnPrivacy" runat="server" /></p>
		</div>
	</div>
</div>
<div id="EDS_toTop"></div>
