<%@ control language="C#" autoeventwireup="true" inherits="EasyDNNSolutions.Modules.EasyDNNRotator.Administration.DataExportImport, App_Web_dataexportimport.ascx.6c6e5e37" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div id="EDRAdminContent">
	<div class="topBarWrapper">
		<div class="wrapper">
			<ul class="links">
				<li>
					<span><%=TopTitle%></span>
				</li>
			</ul>
			<ul class="actions">
				<li class="close">
					<asp:LinkButton ID="btnExit" runat="server" OnClick="btnExit_Click" Text="Exit" />
				</li>
			</ul>
		</div>
	</div>
	<div class="mainContentWrapper">
		<div class="contentSectionWrapper">

			<div class="main_content dashboard">
				<ul class="links">
					<li>
						<asp:LinkButton runat="server" ID="lbImport" resourcekey="lbImport" class="icon content_import" Text="Import" OnClick="lbImport_Click" /></li>
					<li>
						<asp:LinkButton runat="server" ID="lbExport" resourcekey="lbExport" class="icon content_export" Text="Export" OnClick="lbExport_Click" />
					</li>
				</ul>
			</div>
			<div class="settingsList">
				<div class="settings_category_container">
					<div class="edn_admin_progress_overlay_container settingsTable">
						<table id="tblImportUploadHeader" runat="server" cellpadding="0" cellspacing="0">
							<tr class="color2HighLighted">
								<td class="textCenter">
									<span><%=ImportXMLfile%></span>
								</td>
							</tr>
						</table>
						<table id="tblImportModeSelect" runat="server" cellpadding="0" cellspacing="0">
							<tr>
								<td class="labels">
									<dnn:Label ID="lblSelectImportMethod" ResourceKey="lblSelectImportMethod" runat="server" HelpText="Select to import or upload file. Existing files are located in: /portals/portalnumber/EasyDNNRotatorExport/RotatorExport/" Text="Please select:"></dnn:Label>
								</td>
								<td>
									<asp:RadioButtonList ID="rblImportModeSelect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblImportModeSelect_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass="styledRadio small">
										<asp:ListItem resourcekey="liImport" Selected="True" Value="import">Import existing file</asp:ListItem>
										<asp:ListItem resourcekey="liUpload" Value="upload">Upload</asp:ListItem>
									</asp:RadioButtonList>
								</td>
							</tr>
						</table>
						<table id="tblImportExistingFile" runat="server" cellpadding="0" cellspacing="0">
							<tr>
								<td class="labels">
									<dnn:Label ID="lblSelectFileToImport" ResourceKey="lblSelectFileToImport" runat="server" HelpText="Select file to import. Existing files are located in: /portals/portalnumber/EasyDNNRotatorExport/RotatorExport/" Text="Select file to import:"></dnn:Label>
								</td>
								<td>
									<div class="styledSelect">
										<asp:DropDownList ID="ddlImportXMLFile" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlImportXMLFile_SelectedIndexChanged"></asp:DropDownList>
									</div>
								</td>
							</tr>
							<tr>
								<td class="labels">
									<dnn:Label ID="lblFileOperations" ResourceKey="lblFileOperations" runat="server" HelpText="File actions." Text="File actions:" />
								</td>
								<td>
									<div class="itemActions itemEditActions">
										<asp:Button ID="btnDeleteExistingXML" resourcekey="btnDeleteExistingXML" runat="server" Text="Delete" OnClick="btnDeleteExistingXML_Click" OnClientClick="return confirm('Are you sure you want to delete selected item?');" CssClass="itemEditRemove" />
										<asp:Button ID="btnDownloadExistingXML" resourcekey="btnDownloadExistingXML" runat="server" Text="Download XML file" OnCommand="btnDownloadExistingXML_Command" CssClass="itemEditAdd" />
										<asp:Button ID="btnDownloadExistingZIP" resourcekey="btnDownloadExistingZIP" runat="server" Text="Download ZIP file" OnClick="btnDownloadExistingZIP_Click" Visible="False" CssClass="itemEditAdd" />
									</div>
								</td>
							</tr>
						</table>
						<table id="tblSelectAuthorAdCategory" runat="server" cellpadding="0" cellspacing="0">
							<tr>
								<td class="labels">
									<dnn:Label ID="lblSelectUploader" ResourceKey="lblSelectUploader" runat="server" HelpText="Select media uploader - if no user is selected current user will be added as media uploader." Text="Select media uploader:" />
								</td>
								<td>
									<div class="styledSelect">
										<asp:DropDownList ID="ddlRoles" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged" CssClass="ddlgeneral">
											<asp:ListItem Value="-1">Select role</asp:ListItem>
										</asp:DropDownList>
									</div>
									<div class="styledSelect">
										<asp:DropDownList ID="ddlAuthors" runat="server" AppendDataBoundItems="True" CssClass="ddlgeneral">
											<asp:ListItem Value="-1">Select uploader</asp:ListItem>
										</asp:DropDownList>
									</div>
								</td>
							</tr>
						</table>
						<table id="tblUplaodXMLFile" runat="server" cellpadding="0" cellspacing="0" visible="false">
							<tr>
								<td class="labels">
									<dnn:Label ID="lblSelectXMLFile" ResourceKey="lblSelectXMLFile" runat="server" HelpText="Select XML file." Text="Select XML file:" />
								</td>
								<td>
									<asp:FileUpload ID="fuXMLFileUpload" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="labels">
									<dnn:Label ID="lblSelectZipResource" ResourceKey="lblSelectZipResource" runat="server" HelpText="Select zip file with resources." Text="Select zip resources file:" />
								</td>
								<td>
									<asp:FileUpload ID="fuZipFileUpload" runat="server" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="mainActions">
										<asp:LinkButton ID="btnXMLFileUpload" resourcekey="btnXMLFileUpload" runat="server" Text="Upload" OnClick="btnXMLFileUpload_Click" CssClass="upload" />
									</div>
								</td>
							</tr>
						</table>
						<asp:UpdatePanel ID="upImport" runat="server" UpdateMode="Conditional">
							<ContentTemplate>
								<asp:UpdateProgress ID="upImportOverlay" runat="server" AssociatedUpdatePanelID="upImport" DisplayAfter="300" DynamicLayout="true">
									<ProgressTemplate>
										<div class="edn_admin_progress_overlay">
											<asp:Label ID="lblImportInfo" resourcekey="lblImportInfo" runat="server" Text="Importing data may take a few minutes to finish. Please wait." CssClass="infoMessages info" />
										</div>
									</ProgressTemplate>
								</asp:UpdateProgress>
								<div id="tblImportFromExistingFile" runat="server" class="mainActions">
									<asp:LinkButton ID="btnImportFromExistingXML" resourcekey="btnImportFromExistingXML" OnClientClick="return confirm('Are you sure you want to import?');" runat="server" Text="Import" OnClick="btnImportFromXML_Click" CssClass="upload" />
								</div>
								<asp:Label runat="server" ID="liInfoMessages" EnableViewState="false" Visible="false" />
							</ContentTemplate>
						</asp:UpdatePanel>
					</div>
					<asp:UpdatePanel ID="upExportData" runat="server" UpdateMode="Conditional" Visible="False">
						<ContentTemplate>
							<div class="edn_admin_progress_overlay_container settingsTable">
								<asp:UpdateProgress ID="upExportOverlay" runat="server" AssociatedUpdatePanelID="upExportData" DisplayAfter="300" DynamicLayout="true">
									<ProgressTemplate>
										<div class="edn_admin_progress_overlay">
											<asp:Label ID="lblExportInfo" resourcekey="lblExportInfo" runat="server" Style="width: 50%; display: block; margin-left: auto; margin-right: auto;" Text="Exporting files may take a few minutes to finish. Please wait." Font-Size="Large" />
										</div>
									</ProgressTemplate>
								</asp:UpdateProgress>
								<table>
									<tr class="color2HighLighted">
										<td colspan="2">
											<span><%=ExportDatatoXMLFile%></span>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<asp:Label ID="lblExportFileName" resourcekey="lblExportFileName" runat="server" Text="Enter file name:"></asp:Label></td>
										<td>
											<asp:TextBox ID="tbExportFileName" runat="server" CssClass="large"></asp:TextBox>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<asp:Label ID="lblCreateZipWithData" resourcekey="lblCreateZipWithData" runat="server" Text="Create zip file with images:"></asp:Label>
										</td>
										<td>
											<div class="styledCheckbox noLabel">
												<asp:CheckBox ID="cbCreateZipFile" runat="server" Checked="True" Text="Create zip file with images:" />
											</div>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<asp:Label ID="lblExportAllcategories" resourcekey="lblExportAllcategories" runat="server" Text="Export all categories:"></asp:Label></td>
										<td>
											<div class="styledCheckbox noLabel">
												<asp:CheckBox ID="cbExportAllcategories" runat="server" Checked="True" AutoPostBack="True" OnCheckedChanged="cbExportAllcategories_CheckedChanged" Text="Export all categories:" />
											</div>
										</td>
									</tr>
									<tr id="trSelectCategoriesToExport" runat="server" visible="false">
										<td class="labels">
											<asp:Label ID="lblSelectCategoriesToExport" resourcekey="lblSelectCategoriesToExport" runat="server" Text="Select categories to export:"></asp:Label></td>
										<td>
											<asp:CheckBoxList ID="cblSelectCategoriesToExport" runat="server" DataTextField="CategoryName" DataValueField="CategoryID" RepeatColumns="2" CssClass="styledCheckbox"/>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div class="mainActions">
												<asp:LinkButton ID="btnExportToXMLFile" resourcekey="btnExportToXMLFile" runat="server" Text="Export to XML file" OnClick="btnExportToXMLFile_Click" CssClass="copy" />
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<asp:Label ID="lblExportInfoMessage" runat="server" EnableViewState="False" CssClass="infoMessages info" Visible="false" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<asp:Label ID="lblExportXMLMessage" runat="server" Text="" />
										</td>
										<td>
											<div class="itemActions itemEditActions">
												<asp:HyperLink ID="hlExportXMLMessage" resourcekey="hlExportXMLMessage" runat="server" Visible="false" Text="Download file." CssClass="itemEditAdd"></asp:HyperLink>
											</div>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<asp:Label ID="lblExportZipMessage" runat="server" Text="" />
										</td>
										<td>
											<div class="itemActions itemEditActions">
												<asp:HyperLink ID="hlDownloadZipFile" resourcekey="hlDownloadZipFile" runat="server" Visible="false" Text="Download file." CssClass="itemEditAdd"></asp:HyperLink>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</ContentTemplate>
					</asp:UpdatePanel>
				</div>
			</div>
		</div>
	</div>
</div>

