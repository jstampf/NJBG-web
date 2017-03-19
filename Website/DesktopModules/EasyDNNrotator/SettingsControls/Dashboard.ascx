<%@ control language="C#" autoeventwireup="true" inherits="EasyDNNSolutions.Modules.EasyDNNRotator.Administration.Dashboard, App_Web_dashboard.ascx.6c6e5e37" %>
<asp:Literal runat="server" ID="infoMessage" />
<asp:Panel id="pnlAdmin" runat="server">
	<div id="EDRAdminContent">
		<div class="topBarWrapper">
			<div class="wrapper">
				<ul class="links">
					<li>
						<asp:Label ID="lblDashboardTitle" runat="server" Text="Rotator Dashboard" resourcekey="lblDashboardTitle" />
					</li>
				</ul>
				<ul class="actions">
					<li class="close">
						<asp:HyperLink ID="lbPowerOff" runat="server" ToolTip="Close" Text="Exit" resourcekey="lbPowerOff" />
					</li>
				</ul>
			</div>
		</div>
		<div class="mainContentWrapper">
			<div class="contentSectionWrapper color1">
				<div class="main_content dashboard">
					<ul class="links">
						<li>
							<asp:HyperLink runat="server" ID="lbManageContent" class="icon gallery" resourcekey="lbManageContent">Manage content (add/edit media)</asp:HyperLink></li>
						<li>
							<asp:HyperLink runat="server" ID="lbRotatorSettings" class="icon module_settings" resourcekey="lbRotatorSettings">Rotator settings (setup rotator display)</asp:HyperLink></li>
					</ul>
					<ul class="links">
						<li>
							<asp:HyperLink runat="server" ID="lbCropTool" class="icon crop_tool" resourcekey="lbCropTool">Crop tool</asp:HyperLink></li>
					</ul>
					<ul class="links bigger_margin">
						<li>
							<asp:HyperLink runat="server" ID="lbGeneralSettings" class="icon general_settings" resourcekey="lbGeneralSettings">General settings</asp:HyperLink></li>
						<li>
							<asp:HyperLink runat="server" ID="hlDataImportExport" class="icon customfields_export" resourcekey="hlDataImportExport">Export/Import</asp:HyperLink></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</asp:Panel>
