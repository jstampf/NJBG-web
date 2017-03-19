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
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="MegaMenu" TagName="MENU" src="~/DesktopModules/EasyDNNmegaMenu/Menu.ascx" %>
<%@ Register TagPrefix="StyleWizard" TagName="Skin" Src="~/DesktopModules/EasyDNNstyleWizard/SkinObjects/Skin.ascx" %>
<dnn:META ID="META1" runat="server" Name="viewport" Content="width=device-width,initial-scale=1,maximum-scale=1" />
<dnn:DnnCssInclude runat="server" id="FontAwesome" FilePath="common/css/font-awesome.min.css" PathNameAlias="SkinPath" Priority="10" />
<dnn:DnnCssInclude runat="server" id="bootstrapcss" FilePath="bootstrap/css/bootstrap.min.css" PathNameAlias="SkinPath" Priority="10" />
<dnn:DnnCssInclude runat="server" id="VisionBaseStyle" FilePath="common/css/base.css" PathNameAlias="SkinPath" Priority="10" />
<dnn:DnnJsInclude ID="bootstrapJS" runat="server" FilePath="bootstrap/js/bootstrap.min.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude ID="customJS" runat="server" FilePath="common/js/main-scripts.js" PathNameAlias="SkinPath" />
<StyleWizard:Skin runat="server" id="VisionStyleWizard" />

<div class="EasyDNNSkin_Vision" id="top">
	<div class="EDS_header-bg">
		<div class="EDS_header">
			<div class="login-wrapper">
				<div id="login">
					<dnn:LOGIN ID="LOGIN1" runat="server" LegacyMode="false" /><dnn:USER ID="USER1" runat="server" LegacyMode="false" />
				</div>
			</div>
			<div class="logo"><dnn:LOGO id="dnnLogo" runat="server" /></div>
			<div class="language-search">
				<div class="language">
					<dnn:LANGUAGE runat="server" id="dnnLANGUAGE" showMenu="False" showLinks="True" />
				</div>
				<div class="search">
					<dnn:SEARCH ID="dnnSearch" runat="server" Submit="Search" ShowSite="false" ShowWeb="false" />
				</div>
			</div>
			<div class="EDS_clear"></div>
		</div>
		<div class="responsAbilityMenu">
			<div class="raMenuTriggerWrapper"><span class="raMenuTrigger"><span><%= Localization.GetString("Menu.Text", skinpath + "App_LocalResources/localization.ascx.resx") %></span></span></div>
			<div class="raMenuWrapper">
				<div id="dnn_main_menu">
					<MegaMenu:MENU ID="main_menu" runat="server" />
				</div>
			</div>
		</div>
		<div class="responsAbilityMenuPlaceholder"></div>
	</div>
	<div class="EDS_content-background">
		<div class="EDS_subheader-bg">
			<div class="EDS_subheaderWide" runat="server" id="SubheaderWide"></div>
			<div class="EDS_subheader-container">
				<div class="EDS_subheader-sidebar" runat="server" id="SubheaderSidebar"></div>
				<div class="EDS_subheader" runat="server" id="Subheader"></div>
				<div class="EDS_clear"></div>
			</div>
		</div>
		<div class="EDS_top-content-bg-above">
			<div class="EDS_top-content-above-pane" runat="server" id="TopContentAbove"></div>
		</div>
		<div class="EDS_top-content-bg">
			<div class="EDS_top-content-pane" runat="server" id="TopContent"></div>
		</div>
		<div class="EDS_content-bg">
			<div class="EDS_topContentWide" runat="server" id="TopContentWide"></div>
			<div class="EDS_content clearfix">
				<div class="row">
					<div class="col-sm-12">
						<div runat="server" id="TopPane" class="TopPane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div runat="server" id="RowOne_Grid3_Pane" class="RowOne_Grid3_Pane"></div>
					</div>
					<div class="col-sm-9">
						<div runat="server" id="RowOne_Grid9_Pane" class="RowOne_Grid9_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div runat="server" id="RowTwo_Grid4_Pane" class="RowTwo_Grid4_Pane"></div>
					</div>
					<div class="col-sm-8">
						<div runat="server" id="RowTwo_Grid8_Pane" class="RowTwo_Grid8_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<div runat="server" id="RowThree_Grid5_Pane" class="RowThree_Grid5_Pane"></div>
					</div>
					<div class="col-sm-7">
						<div runat="server" id="RowThree_Grid7_Pane" class="RowThree_Grid7_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div runat="server" id="RowFour_Grid6_Pane1" class="RowFour_Grid6_Pane1"></div>
					</div>
					<div class="col-sm-6">
						<div runat="server" id="RowFour_Grid6_Pane2" class="RowFour_Grid6_Pane2"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-7">
						<div runat="server" id="RowFive_Grid7_Pane" class="RowFive_Grid7_Pane"></div>
					</div>
					<div class="col-sm-5">
						<div runat="server" id="RowFive_Grid5_Pane" class="RowFive_Grid5_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<div runat="server" id="RowSix_Grid8_Pane" class="RowSix_Grid8_Pane"></div>
					</div>
					<div class="col-sm-4">
						<div runat="server" id="RowSix_Grid4_Pane" class="RowSix_Grid4_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-9">
						<div runat="server" id="RowSeven_Grid9_Pane" class="RowSeven_Grid9_Pane"></div>
					</div>
					<div class="col-sm-3">
						<div runat="server" id="RowSeven_Grid3_Pane" class="RowSeven_Grid3_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div runat="server" id="RowEight_Grid4_Pane1" class="RowEight_Grid4_Pane1"></div>
					</div>
					<div class="col-sm-4">
						<div runat="server" id="RowEight_Grid4_Pane2" class="RowEight_Grid4_Pane2"></div>
					</div>
					<div class="col-sm-4">
						<div runat="server" id="RowEight_Grid4_Pane3" class="RowEight_Grid4_Pane3"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div runat="server" id="RowNine_Grid3_Pane1" class="RownNine_Grid3_Pane1"></div>
					</div>
					<div class="col-sm-3">
						<div runat="server" id="RowNine_Grid3_Pane2" class="RowNine_Grid3_Pane2"></div>
					</div>
					<div class="col-sm-3">
						<div runat="server" id="RowNine_Grid3_Pane3" class="RowNine_Grid3_Pane3"></div>
					</div>
					<div class="col-sm-3">
						<div runat="server" id="RowNine_Grid3_Pane4" class="RowNine_Grid3_Pane4"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div runat="server" id="ContentPane" class="ContentPane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div runat="server" id="RowTen_Grid4_Pane1" class="RowTen_Grid4_Pane1"></div>
					</div>
					<div class="col-sm-4">
						<div runat="server" id="RowTen_Grid4_Pane2" class="RowTen_Grid4_Pane2"></div>
					</div>
					<div class="col-sm-4">
						<div runat="server" id="RowTen_Grid4_Pane3" class="RowTen_Grid4_Pane3"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-9">
						<div runat="server" id="RowEleven_Grid9_Pane" class="RowEleven_Grid9_Pane"></div>
					</div>
					<div class="col-sm-3">
						<div runat="server" id="RowEleven_Grid3_Pane" class="RowEleven_Grid3_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<div runat="server" id="RowTwelve_Grid8_Pane" class="RowTwelve_Grid8_Pane"></div>
					</div>
					<div class="col-sm-4">
						<div runat="server" id="RowTwelve_Grid4_Pane" class="RowTwelve_Grid4_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-7">
						<div runat="server" id="RowThirteen_Grid7_Pane" class="RowThirteen_Grid7_Pane"></div>
					</div>
					<div class="col-sm-5">
						<div runat="server" id="RowThirteen_Grid5_Pane" class="RowThirteen_Grid5_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div runat="server" id="RowFourteen_Grid6_Pane1" class="RowFourteen_Grid6_Pane1"></div>
					</div>
					<div class="col-sm-6">
						<div runat="server" id="RowFourteen_Grid6_Pane2" class="RowFourteen_Grid6_Pane2"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<div runat="server" id="RowFifteen_Grid5_Pane" class="RowFifteen_Grid5_Pane"></div>
					</div>
					<div class="col-sm-7">
						<div runat="server" id="RowFifteen_Grid7_Pane" class="RowFifteen_Grid7_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div runat="server" id="RowSixteen_Grid4_Pane" class="RowSixteen_Grid4_Pane"></div>
					</div>
					<div class="col-sm-8">
						<div runat="server" id="RowSixteen_Grid8_Pane" class="RowSixteen_Grid8_Pane"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div runat="server" id="RowSeventeen_Grid3_Pane" class="RowSeventeen_Grid3_Pane"></div>
					</div>
					<div class="col-sm-9">
						<div runat="server" id="RowSeventeen_Grid9_Pane" class="RowSeventeen_Grid9_Pane"></div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="col-sm-12">
						<div runat="server" id="BottomPane" class="BottomPane"></div>
					</div>
				</div>
			</div>
			<div class="EDS_bottom1">
				<div class="EDS_bottom1-pane" runat="server" id="Bottom1"></div>
			</div>
			<div class="EDS_bottom2">
				<div class="EDS_bottom2-pane" runat="server" id="Bottom2"></div>
			</div>
		</div>
		<div class="EDS_bottom-content-bg">
			<div class="EDS_bottom-content">
				<div runat="server" id="FooterBox1" class="box"></div>
				<div runat="server" id="FooterBox2" class="box"></div>
				<div runat="server" id="FooterBox3" class="box three"></div>
				<div runat="server" id="FooterBox4" class="box"></div>
				<div class="EDS_clear"></div>
			</div>
		</div>
		<div class="EDS_clear"></div>
	</div>
</div>
<div class="EDS_footer-bg">
	<div class="EDS_footer">
		<a class="top-link" id="EDS_toTop" href="#top" title="Go to top"><span>Go to top</span></a>
		<p class="copyright"><dnn:COPYRIGHT ID="dnnCopyright" runat="server" /></p>
		<p class="terms"><dnn:TERMS ID="dnnTerms" runat="server" />  |  <dnn:PRIVACY ID="dnnPrivacy" runat="server" /></p>
	</div>
</div>
<span class="eds_backToTop"><span><%= Localization.GetString("BackToTop.Text", skinpath + "App_LocalResources/localization.ascx.resx") %></span></span>
