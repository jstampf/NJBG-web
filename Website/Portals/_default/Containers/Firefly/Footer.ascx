<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="StyleWizard" TagName="Container" Src="~/DesktopModules/EasyDNNstyleWizard/SkinObjects/Container.ascx" %>
<div class="<StyleWizard:Container runat="server" id="FireflyContainer" templateGroup="footer" />">
	<h2><dnn:TITLE runat="server" id="dnnTITLE" /></h2>
	<div class="EDC_content-pane-holder">
		<div id="ContentPane" runat="server"></div>
		<div class="EDC_clear"></div>
	</div>
</div>
