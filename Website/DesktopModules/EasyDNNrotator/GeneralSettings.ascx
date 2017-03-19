<%@ control language="C#" autoeventwireup="true" inherits="EasyDNNSolutions.Modules.EasyDNNRotator.Administration.GeneralSettings, App_Web_generalsettings.ascx.74110c5a" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<link href="<%=ModulePath%>css/AdminUpload.css" rel="stylesheet" type="text/css" />

<div id="EDRAdminContent">
	<div class="topBarWrapper">
		<div class="wrapper">
			<ul class="links">
				<li>
					<asp:Label runat="server" ID="lblGeneralSettings" Text="General Settings" />
				</li>
			</ul>
			<ul class="actions">
				<li class="close">
					<asp:HyperLink ID="btnExit" runat="server" Text="Exit" />
				</li>
			</ul>
		</div>
	</div>
	<div class="mainContentWrapper">
		<div class="contentSectionWrapper">
			<div class="sectionBox noShadow noBorder settingsList paddingTop">
				<div class="settingsTable paddingTop">
					<table>
						<tr class="color2HighLighted">
							<td colspan="2" class="textCenter" style="width:100%">
								<asp:Label ID="lblControlsAccess" runat="server" Text="Manage content and rotator settings control access" resourcekey="lblControlsAccess" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="additionalOptions color1">
									<asp:GridView ID="gvRotatorPremissions" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None" CssClass="additionalOptionsList textCenter clearWidth">
										<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
										<Columns>
											<asp:TemplateField HeaderText="Role" SortExpression="Role">
												<ItemTemplate>
													<asp:Label ID="lblRoleName" runat="server" Text='<%# Bind("RoleName") %>' />
													<asp:HiddenField ID="hfRoleId" runat="server" Value='<%# Bind("RoleId") %>' />
												</ItemTemplate>
												<ItemStyle CssClass="roleName" />
											</asp:TemplateField>
											<asp:TemplateField HeaderText="ManageContent">
												<ItemTemplate>
													<asp:CheckBox ID="cbManageContent" runat="server" Checked='<%# Bind("ManageContent") %>' />
												</ItemTemplate>
												<ItemStyle />
											</asp:TemplateField>
											<asp:TemplateField HeaderText="RotatorSettings">
												<ItemTemplate>
													<asp:CheckBox ID="cbEditSettings" runat="server" Checked='<%# Bind("EditSettings") %>' />
												</ItemTemplate>
												<ItemStyle />
											</asp:TemplateField>
										</Columns>
										<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
										<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
										<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
										<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
										<EditRowStyle BackColor="#999999" />
										<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
									</asp:GridView>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<asp:Panel ID="pnlNewsIntegration" runat="server" Visible="false" CssClass="settingsTable">
					<table>
						<tr class="color2HighLighted">
							<td colspan="2" class="textCenter">
								<asp:Label ID="lblNewsOptions" runat="server" Text="NEWS module integration options:" ResourceKey="lblNewsOptions" />
							</td>
						</tr>
						<tr>
							<td>
								<dnn:Label ID="lblNewsCleanUpTime" runat="server" Text="Clean up pictures that are unused for:" HelpText="Rotator module automatically creates thumbs and pictures depending on user permission, after some time pictures are not used by rotator so they must be deleted. Enter cleanup time in days." ResourceKey="lblNewsCleanUpTime" HelpKey="lblNewsCleanUpTime.HelpText" />
							</td>
							<td>
								<asp:TextBox ID="tbxNewsCleanUpTime" runat="server" Text="30" CausesValidation="True" MaxLength="3" />
								<asp:RequiredFieldValidator ID="rfvRotatorBorderSize" runat="server" ControlToValidate="tbxNewsCleanUpTime" Display="Dynamic" ErrorMessage="Enter Value!" ValidationGroup="CleanNews" SetFocusOnError="true" ResourceKey="rfvRotatorBorderSize" CssClass="smallInfo error" />
								<asp:RangeValidator ID="rvRotatorBorderSize" runat="server" ControlToValidate="tbxNewsCleanUpTime" Display="Dynamic" ErrorMessage="Range between 1 and 999." MaximumValue="999" MinimumValue="1" Type="Integer" ValidationGroup="CleanNews" SetFocusOnError="true" ResourceKey="rvRotatorBorderSize" CssClass="smallInfo error" />
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<asp:Label ID="lblNewsIntegrationInfo" runat="server" EnableViewState="false" CssClass="infoMesssages info" />
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<div class="itemActions itemEditActions">
									<asp:LinkButton ID="btnClearByRotator" runat="server" Text="Delete unused news module files in rotator folder and Database" OnClick="btnClearByRotator_Click" ValidationGroup="CleanNews" CausesValidation="true" ResourceKey="btnClearByRotator" CssClass="itemEditRemove" />
								</div>
							</td>
						</tr>
					</table>
				</asp:Panel>
				<asp:Label ID="lblSaveInfo" runat="server" EnableViewState="false" CssClass="infoMessages info" Visible="false" />
				<div class="mainActions">
					<asp:LinkButton ID="btnSaveSettings" runat="server" Text="Save settings" OnClick="btnSaveSettings_Click" ResourceKey="btnSaveSettings" CssClass="downSaveClose" />
					<asp:LinkButton ID="btnSaveClose" runat="server" Text="Save &amp; Close" OnClick="btnSaveClose_Click" ResourceKey="btnSaveClose" CssClass="downClose" />
				</div>
			</div>
		</div>
	</div>
</div>
