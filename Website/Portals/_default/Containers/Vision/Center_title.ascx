<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="StyleWizard" TagName="Container" Src="~/DesktopModules/EasyDNNstyleWizard/SkinObjects/Container.ascx" %>
<div class="<StyleWizard:Container runat="server" id="VisionContainer" templateGroup="centerTitle" />">
	<h2 class="EDC_container-title"><dnn:TITLE runat="server" id="dnnTITLE" /></h2>
	<div id="ContentPane" runat="server"></div>
</div>

