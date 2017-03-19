<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="StyleWizard" TagName="Container" Src="~/DesktopModules/EasyDNNstyleWizard/SkinObjects/Container.ascx" %>
<div class="<StyleWizard:Container runat="server" id="VisionContainer" templateGroup="withoutTitleNoPadding" />">
	<div id="ContentPane" runat="server"></div>
</div>

