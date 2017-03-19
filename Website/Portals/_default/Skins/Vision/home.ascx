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
<StyleWizard:Skin runat="server" id="VisionStyleWizard" templateGroup="home" />

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
			<div class="EDS_content">
				<div class="EDS_contentAbove" runat="server" id="ContentPane"></div>
				<div class="EDS_panes-holder">
					<div class="EDS_two-column-content" runat="server" id="ContentPaneTwoColumnLeft"></div>
					<div class="EDS_two-column-sidebar" runat="server" id="RightPaneTwoColumn"></div>
				</div>
				<div class="EDS_clear"></div>
				<div class="EDS_three-column-sidebar-left" runat="server" id="LeftPaneThreeColumn"></div>
				<div class="EDS_three-column-content" runat="server" id="ContentPaneCenterThreeColumn"></div>
				<div class="EDS_three-column-sidebar-right" runat="server" id="RightPaneThreeColumn"></div>
				<div class="EDS_clear"></div>
				<div class="EDS_bottom-content-pane" runat="server" id="BottomContent"></div>
				<div class="EDS_clear"></div>
				<div class="EDS_panes-holder-invert">
					<div class="EDS_two-column-sidebar" runat="server" id="LeftPaneTwoColumn"></div>
					<div class="EDS_two-column-content" runat="server" id="ContentPaneTwoColumnRight"></div>
				</div>
				<div class="EDS_clear"></div>
				<div class="EDS_bottom-content-pane" runat="server" id="BottomContent2"></div>
				<div class="EDS_clear"></div>
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
