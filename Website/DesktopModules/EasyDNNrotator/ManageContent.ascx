<%@ control language="C#" inherits="EasyDNNSolutions.Modules.EasyDNNRotator.Administration.ManageContent, App_Web_managecontent.ascx.74110c5a" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<asp:Literal runat="server" ID="infoMessage" />
<asp:Panel id="pnlAdmin" runat="server">
	<script type="text/javascript">
		/*<![CDATA[*/
		<%=uploadOptionsJS%>

		jQuery(document).ready(function ($) {
			<%=lastModifiedListsJS%>
			<%=uploadJS%>
			<%=dateTimePickerJS%>
		});
		/*]]>*/
	</script>
	<asp:HiddenField ID="hfCurrentManagment" runat="server" />
	<div id="EDRAdminContent">
		<div class="flashMessages"></div>
		<div class="topBarWrapper">
			<div class="wrapper">
				<ul class="links">
					<li>
						<asp:Label runat="server" ID="lblManagmentSectionTitle" />
					</li>
				</ul>
				<ul class="actions">
					<li class="back">
						<asp:LinkButton ID="btnBackManagment" runat="server" Text="Back" Visible="false" OnClick="btnBackManagment_Click" />
					</li>
					<li class="close">
						<asp:HyperLink ID="btnClose" runat="server" Text="Close" resourcekey="btnCloseManageContent" />
					</li>
				</ul>
			</div>
		</div>
		<div class="mainContentWrapper">
			<asp:Label ID="lblInfoMessages" runat="server" EnableViewState="false" Visible="false" />
			<asp:Panel ID="pnlLastModGals" runat="server">
				<div class="lastModifiedGalleries">
					<div class="lastAddedModifiedGalleriesHeader">
						<h3>
							<asp:Label ID="lblLastModifiedListsTitle" resourcekey="lblLastModifiedListsTitle.Text" runat="server" Text="&lt;b&gt;Last&lt;/b&gt; added/modified Lists" CssClass="lastaddedtitle" />
						</h3>
						<span class="lastModifiedGalleriesHeaderToggle">Open/Close</span>
					</div>
					<div class="lastModifiedGalleriesToggleWrapper">
						<div class="lastAddedModifiedGalleriesListWrapper">
							<div>
								<asp:ObjectDataSource ID="odsLastModList" runat="server" SelectMethod="GetLastModLists" TypeName="EasyDNNSolutions.Modules.EasyDNNRotator.HTMLRotatorData">
									<SelectParameters>
										<asp:Parameter Name="PortalID" Type="Int32" />
										<asp:ControlParameter ControlID="ddlNumLastLists" DefaultValue="5" Name="NumToGet" PropertyName="SelectedValue" Type="Int32" />
									</SelectParameters>
								</asp:ObjectDataSource>
								<asp:Repeater ID="dlLastModified" runat="server" DataSourceID="odsLastModList" OnItemCommand="dlLastModified_ItemCommand">
									<HeaderTemplate>
										<ul class="lastAddedModifiedGalleriesList">
									</HeaderTemplate>
									<ItemTemplate>
										<li>
											<asp:LinkButton ID="lbGalleryLastModifiedName" runat="server" CommandArgument='<%#((DataRowView)Container.DataItem)["ListID"]%>' CommandName="Open" CssClass="lastmodgallery"><%#((DataRowView)Container.DataItem)["Name"]%></asp:LinkButton>
											<asp:Label ID="lblGalleryLastModifiedDate" runat="server" Text='<%#String.Format("({0})",((DataRowView)Container.DataItem)["LastModified"])%>' CssClass="labeltext" />
										</li>
									</ItemTemplate>
									<FooterTemplate>
										</ul>
									</FooterTemplate>
								</asp:Repeater>
								<div class="numberOfGalleriesPerPage">
									<dnn:Label ID="lblNumberOfLastModifiedListsPerPage" runat="server" ControlName="ddlNumOfListSelect" HelpKey="lblNumberOfLastModifiedListsPerPage.HelpKey" CssClass="labeltext" HelpText="Select the number of Lists to display on one page:" ResourceKey="lblNumberOfLastModifiedListsPerPage.Text"
										Text="Select the number of lists per page:" />
									<div class="styledSelect smallSelect">
										<asp:DropDownList ID="ddlNumLastLists" runat="server" AutoPostBack="True" CssClass="ddlpageitems">
											<asp:ListItem Value="10" Text="10" />
											<asp:ListItem Value="20" Text="20" />
											<asp:ListItem Value="30" Text="30" />
										</asp:DropDownList>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</asp:Panel>
			<asp:Panel ID="pnlManageCategories" runat="server" CssClass="contentSectionWrapper color1">
				<div class="sectionHeader">
					<div class="titleAndNumber categoriesTitleAndNumber">
						<h4>
							<asp:Label ID="lblManageCategoriesTitle" resourcekey="lblManageCategoriesTitle.Text" runat="server" CssClass="Categorytitle" Text="Manage &lt;/br&gt; categories" />
						</h4>
						<p>
							<asp:Label ID="lblNumOfCats" runat="server" Text="Number of categories:" resourcekey="lblNumOfCats.Text" />
							<asp:Label ID="lblCategoriesNumber" runat="server" />
						</p>
					</div>
					<asp:Panel ID="pnlAddCategoryBox" runat="server" DefaultButton="btnCategoryAdd" CssClass="headerActionBox">
						<h4>
							<asp:Label ID="lblAddNewCategory" resourcekey="lblAddNewCategory.Text" runat="server" CssClass="AddNewCategory" Text="Add NEW Category" />
						</h4>
						<div>
							<div>
								<asp:RequiredFieldValidator ID="rfvCategoryName" resourcekey="rfvValue.ErrorMessage" runat="server" ControlToValidate="tbxRotatorCategoryName" Display="Dynamic" ErrorMessage="This field is required" ValidationGroup="vgAddCategory" CssClass="smallInfo warning" />
								<dnn:Label ID="lblEnterNewCategoryName" runat="server" HelpText="Enter the name for the new category." ControlName="tbxRotatorCategoryName" Text="Category name:" ResourceKey="lblEnterNewCategoryName.Text" CssClass="tooltip" HelpKey="lblEnterNewCategoryName.HelpKey" />
								<asp:TextBox ID="tbxRotatorCategoryName" runat="server" CssClass="box1" ValidationGroup="vgAddCategory" />
								<dnn:Label ID="lblEnterNewCategoryDescription" runat="server" ControlName="tbxRotatorCategoryDescr" HelpText="Enter the description for the new category." Text="Description:" ResourceKey="lblEnterNewCategoryDescription.Text" CssClass="tooltip" HelpKey="lblEnterNewCategoryDescription.HelpKey" />
								<asp:TextBox ID="tbxRotatorCategoryDescr" runat="server" CssClass="box1" />
							</div>
							<asp:LinkButton ID="btnCategoryAdd" runat="server" CssClass="headerActionButton" OnClick="btnCategoryAdd_Click" ValidationGroup="vgAddCategory" ToolTip="Add Category" resourcekey="btnCategoryAdd.Text" Text="Add" />
						</div>
					</asp:Panel>
				</div>
				<asp:Panel ID="pnlCategoryList" runat="server">
					<asp:ObjectDataSource ID="odsCategory" runat="server" SelectMethod="GetAllLocCategoryOnPortal" TypeName="EasyDNNSolutions.Modules.EasyDNNRotator.HTMLRotatorData" UpdateMethod="InsertUpdateRotatorCategory" DeleteMethod="DeleteCategory">
						<DeleteParameters>
							<asp:Parameter Name="CategoryID" Type="Int32" />
						</DeleteParameters>
						<SelectParameters>
							<asp:Parameter Name="PortalID" Type="Int32" />
							<asp:Parameter Name="LocalCode" Type="String" />
						</SelectParameters>
						<UpdateParameters>
							<asp:Parameter Name="CategoryID" Type="Int32" />
							<asp:Parameter Name="PortalID" Type="Int32" />
							<asp:Parameter Name="Name" Type="String" />
							<asp:Parameter Name="Description" Type="String" />
							<asp:Parameter Name="Position" Type="Int32" />
						</UpdateParameters>
					</asp:ObjectDataSource>
					<div class="listItems">
						<asp:Label ID="lblCategoryErr" runat="server" EnableViewState="False" CssClass="infoMessages info static" Visible="false" />
						<asp:GridView ID="gvRotatorCategory" runat="server" DataSourceID="odsCategory" AutoGenerateColumns="False" DataKeyNames="CategoryID" Border="0" GridLines="None" CssClass="listItemsTable" ShowFooter="True" AllowPaging="True" AllowSorting="True" EnableModelValidation="True" OnRowCommand="gvRotatorCategory_RowCommand" OnSelectedIndexChanged="gvRotatorCategory_SelectedIndexChanged" OnRowDataBound="gvRotatorCategory_RowDataBound" OnRowDeleted="gvRotatorCategory_RowDeleted" OnDataBound="gvRotatorCategory_DataBound" OnRowUpdating="gvRotatorCategory_RowUpdating" OnRowUpdated="gvRotatorCategory_RowUpdated" OnPreRender="gvRotatorCategory_PreRender">
							<Columns>
								<asp:TemplateField ShowHeader="False" HeaderText="Actions">
									<ItemTemplate>
										<div class="itemActions itemPrimaryActions">
											<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%#Eval("CategoryID") %>' CommandName="Select" CssClass="openAction" Text="Open" resourcekey="lbSelect.Text" />
											<asp:LinkButton ID="lbContentInlineEdit" runat="server" CausesValidation="False" CommandName="Edit" CssClass="editAction" Text="Edit" resourcekey="lbEdit.Text" />
											<asp:LinkButton ID="lblCategoryDel" runat="server" CausesValidation="False" CommandName="Delete" CssClass="deleteAction" Text="Delete" resourcekey="lbDelete.Text" OnClientClick="return confirm('Are you sure you want to delete this category?');" />
										</div>
										<div class="itemActions itemSecondaryActions">
											<asp:LinkButton ID="lbCategoryLocalization" runat="server" CausesValidation="False" CommandArgument='<%#Eval("CategoryID") %>' CommandName="CategoryLocalization" resourcekey="lbContentLocalization.Text" Text="Content Localization" CssClass="categorycontrollinklight" Font-Size="Smaller" Visible='<%#LocalizationEnabled%>' />
										</div>
									</ItemTemplate>
									<EditItemTemplate>
										<div class="itemActions itemEditActions">
											<asp:LinkButton ID="lbContentInlineUpdate" runat="server" CausesValidation="True" CommandName="Update" CssClass="itemEditUpdate" Text="Update" />
											<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="itemEditCancel" />
										</div>
									</EditItemTemplate>
									<ItemStyle CssClass="actionsCell" />
								</asp:TemplateField>
								<asp:BoundField DataField="CategoryID" HeaderText="Id" ReadOnly="True" SortExpression="CategoryID"></asp:BoundField>
								<asp:TemplateField HeaderText="Name" SortExpression="Name">
									<ItemTemplate>
										<asp:LinkButton ID="lbCategoriesOpenCategoryName" runat="server" CommandArgument='<%#Eval("CategoryID") %>' CommandName="CategoryName" Text='<%# Bind("Name") %>' />
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' />
									</EditItemTemplate>
									<HeaderStyle Width="150" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Description">
									<EditItemTemplate>
										<asp:TextBox ID="tbgvCategoryDescriptionEdit" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" MaxLength="800" Height="85" Width="240" />
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="lblgvCategoryDescription" runat="server" Text='<%# ((DataRowView)Container.DataItem)["Description"] %>' />
									</ItemTemplate>
									<HeaderStyle Width="290" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Created" InsertVisible="false" SortExpression="DateCreated">
									<ItemTemplate>
										<asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("DateCreated")).AddMinutes(PortalSettings.TimeZoneOffset).ToShortDateString() %>' />
									</ItemTemplate>
									<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80" />
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="No. of Lists" InsertVisible="false" SortExpression="NumOfLists">
									<ItemTemplate>
										<asp:Label ID="lblNoOfLists" runat="server" Text='<%# Bind("NumOfLists") %>' />
									</ItemTemplate>
									<HeaderStyle Width="135" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Position" SortExpression="Position">
									<EditItemTemplate>
										<asp:TextBox ID="tbxEditPositionValCategory" runat="server" CssClass="xsmall textCenter" Text='<%# Bind("Position")%>' Enabled="false" />
									</EditItemTemplate>
									<ItemTemplate>
										<div>
											<asp:TextBox ID="tbxPositionValCategory" runat="server" CssClass="xsmall textCenter" Text='<%#((DataRowView)Container.DataItem)["Position"]%>' />
											<asp:LinkButton ID="imgBtnUPCategory" runat="server" CausesValidation="false" CommandArgument='<%#Eval("CategoryID") %>' CommandName="imgBtnUPCmdCategory" CssClass="move moveUp" />
											<asp:LinkButton ID="imgBtnDownCategory" runat="server" CausesValidation="false" CommandArgument='<%#Eval("CategoryID") %>' CommandName="imgBtnDOWNCmdCategory" CssClass="move moveDown" />
										</div>
									</ItemTemplate>
									<FooterTemplate>
										<div class="positionItems">
											<asp:LinkButton ID="btnCategorySavePosition" runat="server" CssClass="savePositions" OnClick="CategorySavePositions" Text="Save Positions" CommandName="save" />
											<asp:LinkButton ID="btnRearrangeCategoryPositions" runat="server" OnClick="CategorySavePositions" CommandName="reorder" ToolTip="Rearrange category position numbers." CssClass="rearangePositions" />
										</div>
									</FooterTemplate>
									<ItemStyle CssClass="arrangeItems" />
								</asp:TemplateField>
							</Columns>
							<FooterStyle CssClass="itemsListFooter" />
							<HeaderStyle CssClass="itemsListheader" />
							<PagerStyle CssClass="contentPagination" />
							<EditRowStyle CssClass="editItemState" />
						</asp:GridView>
					</div>
					<div runat="server" id="categoryNumberOfItems" class="numberOfItemsPerPage">
						<dnn:Label ID="lblNumberOfCatSelect" runat="server" ControlName="ddlNumberOfCatSelect" HelpText="Select the number of categories to display on one page." Text="Categories per page:" ResourceKey="lblNumberOfCatSelect.Text" CssClass="labeltext" HelpKey="lblNumberOfCatSelect.HelpKey" />
						<div class="styledSelect">
							<asp:DropDownList ID="ddlNumberOfCatSelect" runat="server" AutoPostBack="True" CssClass="ddlpageitems" OnSelectedIndexChanged="ddlNumberOfCatSelect_SelectedIndexChanged">
								<asp:ListItem Value="10" Text="10" />
								<asp:ListItem Value="30" Text="30" />
								<asp:ListItem Value="50" Text="50" />
								<asp:ListItem Value="80" Text="80" />
								<asp:ListItem Value="100" Text="100" />
							</asp:DropDownList>
						</div>
					</div>
				</asp:Panel>
				<asp:Panel ID="pnlCategoryLocalization" Visible="false" runat="server" CssClass="listItems">
					<div class="additionalOptions color1">
						<h2>
							<asp:Label ID="lblCategoryLocalization" resourcekey="lblCategoryLocalization.Text" runat="server" Text="Category Localization" CssClass="contenttitle" />
						</h2>
						<table class="additionalOptionsList fullWidthTable bottomTdBorders textLeft">
							<tr>
								<td>
									<asp:Label ID="lblDefaultPortalLang" runat="server" />
								</td>
								<td>
									<asp:Label ID="lblCategoryGVInfoLocalization" CssClass="contenttitle" runat="server" />
								</td>
							</tr>
							<tr>
								<td colspan="2"></td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblCategoryGVSelectLocalization" runat="server" HelpText="Select language for localization" ControlName="ddlCategoryGVSelectLocalization" HelpKey="lblSelectLangForLocalization.HelpKey" ResourceKey="lblSelectLangForLocalization.Text" Text="Select language to localize" />
								</td>
								<td>
									<div class="styledSelect large">
										<asp:DropDownList ID="ddlCategoryGVSelectLocalization" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoryGVSelectLocalization_SelectedIndexChanged"></asp:DropDownList>
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblCategoryGVLoadFromLocalized" runat="server" HelpText="Load values from selected language" ResourceKey="lblLoadLocalizedLangFrom.Text" HelpKey="lblLoadLocalizedLangFrom.HelpKey" ControlName="ddlLocLangSelect" Text="Load values from:" />
								</td>
								<td>
									<div class="styledSelect">
										<asp:DropDownList ID="ddlLocLangSelect" runat="server"></asp:DropDownList>
									</div>
									<div class="itemActions itemEditActions">
										<asp:LinkButton ID="btnLoadLocProc" runat="server" Text="Load" CausesValidation="false" resourcekey="btnLoadLocalization" ToolTip="Load Localized values" OnClick="btnLoadLocProc_Click" CssClass="itemEditCopy" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblCategoryGVNameLoc" ControlName="tbxCategoryGVNameLoc" runat="server" HelpText="Enter Name" Text="Name:" ResourceKey="lblCategoryGVNameLoc.Text" HelpKey="lblCategoryGVNameLoc.HelpKey" />
								</td>
								<td>
									<asp:TextBox ID="tbxCategoryGVNameLoc" runat="server" CssClass="large" />
									<asp:RequiredFieldValidator ID="rfvtbxCategoryGVNameLoc" runat="server" Display="Dynamic" ControlToValidate="tbxCategoryGVNameLoc" ResourceKey="rfvValue.Text" ValidationGroup="CategoryLocValidation" ErrorMessage="This field is required" CssClass="smallInfo error" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblCategoryGVDescriptionLoc" runat="server" ControlName="tbxCategoryGVDescriptionLoc" HelpText="Enter Description" ResourceKey="lblCategoryGVDescriptionLoc.Text" HelpKey="lblCategoryGVDescriptionLoc.HelpKey" Text="Description:" />
								</td>
								<td>
									<asp:TextBox ID="tbxCategoryGVDescriptionLoc" runat="server" CssClass="large" />
								</td>
							</tr>
						</table>
						<div class="mainActions">
							<asp:LinkButton ID="btnCategoryGVDSaveLoc" runat="server" CssClass="downSaveClose" OnClick="btnCategoryGVDSaveLoc_Click" resourcekey="btnSaveLocalization.Text" ToolTip="Save Localization" Style="margin-right: 5px;" ValidationGroup="CategoryLocValidation" Text="Save" />
							<asp:LinkButton ID="btnCategoryGVCloseLoc" runat="server" CssClass="downClose" OnClick="btnCategoryGVCloseLoc_Click" resourcekey="btnCloseLocalization.Text" ToolTip="Close Localization" Text="Close" CausesValidation="false" />
						</div>
					</div>
				</asp:Panel>
			</asp:Panel>
			<asp:Panel ID="pnlManageLists" runat="server" Visible="false" CssClass="contentSectionWrapper color2">
				<div class="sectionHeader">
					<div class="titleAndNumber galleriesTitleAndNumber">
						<h4>
							<asp:Label ID="lblManageListTitle" resourcekey="lblManageListTitle.Text" runat="server" Text="Manage &lt;/br&gt; Lists" />
						</h4>
						<p>
							<asp:Label ID="lblNumberOfLists" runat="server" Text="Number of Lists:" resourcekey="lblNumberOfLists.Text" />
							<asp:Label ID="lblListsNumber" runat="server" CssClass="numberOfItemsInSection" />
						</p>
					</div>
					<asp:Panel ID="pnlAddListBox" runat="server" DefaultButton="btnListAdd" CssClass="headerActionBox">
						<h4>
							<asp:Label ID="lblAddNewList" resourcekey="lblAddNewList.Text" runat="server" Text="Add NEW List" />
						</h4>
						<div>
							<div>
								<asp:RequiredFieldValidator ID="rfvRotatorListName" runat="server" ControlToValidate="tbxRotatorListName" ErrorMessage="This field is required." ValidationGroup="RotatorListAdd" Display="Dynamic" resourcekey="rfvValue.ErrorMessage" CssClass="smallInfo warning" />
								<dnn:Label ID="lblEnterNewListName" runat="server" ControlName="tbxRotatorListName" HelpText="Enter the name of new list." Text="List name:" ResourceKey="lblEnterNewListName.Text" HelpKey="lblEnterNewListName.HelpKey" />
								<asp:TextBox ID="tbxRotatorListName" runat="server" ValidationGroup="RotatorListAdd" />
								<dnn:Label ID="lblEnterNewListDescription" runat="server" ControlName="tbxRotatorListdescr" HelpText="Enter description of new list." Text="List description:" ResourceKey="lblEnterNewListDescription.Text" HelpKey="lblEnterNewListDescription.HelpKey" />
								<asp:TextBox ID="tbxRotatorListdescr" runat="server" />
							</div>
							<asp:LinkButton ID="btnListAdd" runat="server" OnClick="btnListAdd_Click" ValidationGroup="RotatorListAdd" ToolTip="Add List" CssClass="headerActionButton" resourcekey="btnListAdd.Text" Text="Add" />
						</div>
					</asp:Panel>
				</div>
				<div class="selectedCategory">
					<asp:Label ID="lblSelectedCatategory" runat="server" Text="Selected category:" ResourceKey="lblSelectedCatName.Text" />
					<asp:Label ID="lblSelectedCategoryName" runat="server" />
				</div>
				<asp:Panel ID="pnlRotatorLists" runat="server">
					<div class="listItems">
						<asp:ObjectDataSource ID="odsRottatorList" runat="server" SelectMethod="GetAllLocListsInCategory" TypeName="EasyDNNSolutions.Modules.EasyDNNRotator.HTMLRotatorData" DeleteMethod="DeleteList" UpdateMethod="InsertUpdateRotatorList">
							<DeleteParameters>
								<asp:Parameter Name="ListID" Type="Int32" />
							</DeleteParameters>
							<SelectParameters>
								<asp:Parameter Name="CategoryID" Type="Int32" />
								<asp:Parameter Name="LocalCode" Type="String" />
							</SelectParameters>
							<UpdateParameters>
								<asp:Parameter Name="ListID" Type="Int32" />
								<asp:Parameter Name="CategoryID" Type="Int32" />
								<asp:Parameter Name="Name" Type="String" />
								<asp:Parameter Name="Description" Type="String" />
								<asp:Parameter Name="Owner" Type="Int32" />
								<asp:Parameter Name="Position" Type="Int32" />
							</UpdateParameters>
						</asp:ObjectDataSource>
						<asp:Label ID="lblgvRotatListsErr" runat="server" EnableViewState="False" CssClass="infoMessages info static" Visible="false" />
						<asp:GridView CssClass="listItemsTable" ID="gvRotatorList" runat="server" AutoGenerateColumns="False" DataKeyNames="ListID" EnableModelValidation="True" ShowFooter="True" AllowPaging="True" AllowSorting="True" DataSourceID="odsRottatorList" OnSelectedIndexChanged="gvRotatorList_SelectedIndexChanged" GridLines="None" OnRowDeleted="gvRotatorList_RowDeleted" OnRowCommand="gvRotatorList_RowCommand" OnRowDataBound="gvRotatorList_RowDataBound" OnDataBound="gvRotatorList_DataBound" OnRowUpdating="gvRotatorList_RowUpdating" OnRowDeleting="gvRotatorList_RowDeleting" OnPreRender="gvRotatorList_PreRender">
							<Columns>
								<asp:TemplateField ShowHeader="False" HeaderText="Actions">
									<ItemTemplate>
										<div class="itemActions itemPrimaryActions">
											<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Open" CssClass="openAction" CommandArgument='<%#Eval("ListID") %>' resourcekey="lbSelect.Text" />
											<asp:LinkButton ID="lbManageListsEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="editAction" resourcekey="lbEdit.Text" />
											<asp:LinkButton ID="lbListItemDel" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="deleteAction" OnClientClick="return confirm('Are you sure you want to delete this list?');" resourcekey="lbDelete.Text" /><br />
										</div>
										<div class="itemActions itemSecondaryActions">
											<asp:LinkButton ID="lbListLocalization" runat="server" CausesValidation="False" CommandArgument='<%#Eval("ListID") %>' CommandName="ListLocalization" Text="Content Localization" resourcekey="lbContentLocalization.Text" Font-Size="Smaller" Visible='<%#LocalizationEnabled%>' />
										</div>
									</ItemTemplate>
									<EditItemTemplate>
										<div class="itemActions itemEditActions">
											<asp:LinkButton ID="lbManageListsUpdate" runat="server" CssClass="itemEditUpdate" CausesValidation="True" CommandName="Update" Text="Update" />
											<asp:LinkButton ID="lbManageListsCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="itemEditCancel" />
										</div>
									</EditItemTemplate>
									<ItemStyle CssClass="actionsCell" />
								</asp:TemplateField>
								<asp:BoundField DataField="ListID" HeaderText="Id" ReadOnly="True" SortExpression="ListID">
									<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" />
									<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" />
								</asp:BoundField>
								<asp:TemplateField HeaderText="Name" SortExpression="Name">
									<ItemTemplate>
										<asp:LinkButton ID="lbLinkOpenByName" runat="server" CommandArgument='<%#Eval("ListID") %>' CommandName="ListName" Text='<%# Bind("Name") %>' />
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' />
									</EditItemTemplate>
									<HeaderStyle Width="120" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Description">
									<EditItemTemplate>
										<asp:TextBox ID="tbListDescription" runat="server" Text='<%# Bind("Description") %>' Height="85" Width="180" MaxLength="800" TextMode="MultiLine" />
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="lblListDescription" runat="server" Text='<%# Bind("Description") %>' />
									</ItemTemplate>
									<HeaderStyle Width="180" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Created" SortExpression="DateCreated">
									<ItemTemplate>
										<asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("DateCreated")).AddMinutes(PortalSettings.TimeZoneOffset).ToShortDateString() %>' />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="NumOfItems" HeaderText="No. of Items" ReadOnly="True" SortExpression="NumOfItems"></asp:BoundField>
								<asp:TemplateField HeaderText="Position" SortExpression="Position">
									<EditItemTemplate>
										<asp:TextBox ID="tbxEditPositionValList" runat="server" CssClass="xsmall textCenter" Text='<%# Bind("Position")%>' Enabled="false" />
									</EditItemTemplate>
									<ItemTemplate>
										<div>
											<asp:TextBox ID="tbxPositionValList" runat="server" CssClass="xsmall textCenter" Text='<%# Bind("Position")%>' />
											<asp:LinkButton ID="imgBtnUPList" runat="server" CausesValidation="false" CommandArgument='<%#Eval("ListID") %>' CommandName="imgBtnUPCmdList" CssClass="move moveUp" />
											<asp:LinkButton ID="imgBtnDownList" runat="server" CausesValidation="false" CommandArgument='<%#Eval("ListID") %>' CommandName="imgBtnDOWNCmdList" CssClass="move moveDown" />
										</div>
									</ItemTemplate>
									<ItemStyle CssClass="arrangeItems" />
									<FooterTemplate>
										<div class="positionItems">
											<asp:LinkButton ID="btnListSavePosition" runat="server" CssClass="savePositions" OnClick="ListSavePositions" Text="Save Positions" CommandName="save" />
											<asp:LinkButton ID="btnRearrangeListPositions" runat="server" OnClick="ListSavePositions" ToolTip="Rearrange list position numbers." CommandName="reorder" CssClass="rearangePositions" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
							</Columns>
							<FooterStyle CssClass="itemsListFooter" />
							<HeaderStyle CssClass="itemsListheader" />
							<PagerStyle CssClass="contentPagination" />
							<EditRowStyle CssClass="editItemState" />
						</asp:GridView>
					</div>
					<div runat="server" id="listNumberOfItems" class="numberOfItemsPerPage">
						<dnn:Label ID="lblNumberOfListsSelect" runat="server" ControlName="ddlNumberOfListsSelect" HelpText="Select the number of Lists to display on one page." Text="Lists per page:" ResourceKey="lblNumberOfListsSelect.Text" CssClass="labeltext" HelpKey="lblNumberOfListsSelect.HelpKey" />
						<div class="styledSelect">
							<asp:DropDownList ID="ddlNumberOfListsSelect" runat="server" AutoPostBack="True" CssClass="ddlpageitems" OnSelectedIndexChanged="ddlNumberOfListsSelect_SelectedIndexChanged">
								<asp:ListItem Value="10" Text="10" />
								<asp:ListItem Value="30" Text="30" />
								<asp:ListItem Value="50" Text="50" />
								<asp:ListItem Value="80" Text="80" />
								<asp:ListItem Value="100" Text="100" />
							</asp:DropDownList>
						</div>
					</div>
				</asp:Panel>
				<asp:Panel ID="pnlListsLocalization" Visible="false" runat="server" CssClass="listItems">
					<div class="additionalOptions color2">
						<h2>
							<asp:Label ID="lblListLocalization" resourcekey="lblListLocalization.Text" runat="server" Text="List Localization" />
						</h2>
						<table class="additionalOptionsList fullWidthTable bottomTdBorders textLeft">
							<tr>
								<td>
									<asp:Label ID="lblListDefaultLang" CssClass="contenttitle" runat="server" />
								</td>
								<td>
									<asp:Label ID="lblListsGVInfoLocalization" runat="server" CssClass="contenttitle" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblListsGVSelectLocalization" runat="server" HelpText="Select language for localization" ControlName="ddlListsGVSelectLocalization" HelpKey="lblSelectLangForLocalization.HelpKey" ResourceKey="lblSelectLangForLocalization.Text" Text="Select language" />
								</td>
								<td>
									<div class="styledSelect large">
										<asp:DropDownList ID="ddlListsGVSelectLocalization" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlListsGVSelectLocalization_SelectedIndexChanged" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblListLoadVal" runat="server" HelpText="Load values from selected language" ControlName="ddlListLoadVal" ResourceKey="lblLoadLocalizedLangFrom.Text" HelpKey="lblLoadLocalizedLangFrom.HelpKey" Text="Load values from:" />
								</td>
								<td>
									<div class="styledSelect large">
										<asp:DropDownList ID="ddlListLoadVal" runat="server" />
									</div>
									<div class="itemActions itemEditActions">
										<asp:LinkButton ID="btnListLoadVal" runat="server" Text="Load" CausesValidation="false" resourcekey="btnLoadLocalization.Text" ToolTip="Load Localized values" OnClick="btnListLoadVal_Click" CssClass="itemEditCopy" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblListNameLoc" runat="server" HelpText="Enter Name" ControlName="tbxListGVNameLoc" Text="Name:" ResourceKey="lblListNameLoc.Text" HelpKey="lblListNameLoc.HelpKey" />
								</td>
								<td>
									<asp:TextBox ID="tbxListGVNameLoc" runat="server" CssClass="large" />
									<asp:RequiredFieldValidator ID="rfvListGVNameLoc" runat="server" Display="Dynamic" ErrorMessage="This field is requierd!" resourcekey="rfvValue.ErrorMessage" ValidationGroup="ListLocValidation" ControlToValidate="tbxListGVNameLoc" CssClass="smallInfo error" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblListDescriptionLoc" runat="server" ControlName="tbxListGVDescriptionLoc" HelpText="Enter Description" ResourceKey="lblListDescriptionLoc.Text" HelpKey="lblListDescriptionLoc.HelpKey" Text="Description:" />
								</td>
								<td>
									<asp:TextBox ID="tbxListGVDescriptionLoc" runat="server" CssClass="large" />
								</td>
							</tr>
						</table>
						<div class="mainActions">
							<asp:LinkButton ID="btnListGVDSaveLoc" runat="server" Text="Save" ValidationGroup="ListLocValidation" resourcekey="btnSaveLocalization.Text" ToolTip="Save Localization" OnClick="btnListGVDSaveLoc_Click" CssClass="downSaveClose" />
							<asp:LinkButton ID="btnListGVCloseLoc" runat="server" Text="Close" resourcekey="btnCloseLocalization.Text" ToolTip="Close Localization" CausesValidation="false" OnClick="btnListGVCloseLoc_Click" CssClass="downClose" />
						</div>
					</div>
				</asp:Panel>
			</asp:Panel>
			<asp:Panel ID="pnlContentAdministration" runat="server" Visible="false" CssClass="contentSectionWrapper color3">
				<asp:Panel ID="pnlMediaManagerTopHeader" runat="server" Visible="false" CssClass="sectionHeader">
					<div class="titleAndNumber mediaManagerTitleAndNumber">
						<h4>
							<asp:Label ID="lblMediaManagerTitle" resourcekey="lblMediaManagerTitle.Text" runat="server" CssClass="MediaManagerTitle" Text="&lt;b&gt;Media&lt;/b&gt; Manager" />
						</h4>
						<p>
							<asp:Label ID="lblAddEditDeleteTitle" resourcekey="lblAddEditDeleteTitle.Text" runat="server" Text="Add | Edit | Delete" />
							<asp:Label ID="lblImagesVideoAudioTitle" resourcekey="lblImagesVideoAudioTitle.Text" runat="server" Text="Images | Video | HTML" CssClass="numberOfItemsInSection" />
						</p>
					</div>
				</asp:Panel>
				<asp:Panel ID="pnlRotatorContentList" runat="server" Visible="false">
					<div class="headerActionBox elementInlineBlock">
						<h4>
							<asp:Label ID="lblMoveCopyTitle" resourcekey="lblMoveCopyTitle.Text" runat="server" CssClass="MoveCopyTitle" Text="Move or copy List to another category:" />
						</h4>
						<div>
							<div class="styledSelect">
								<asp:DropDownList ID="ddlCategorySelect" runat="server" DataTextField="CategoryName" DataValueField="CategoryID"></asp:DropDownList>
							</div>
							<asp:LinkButton ID="btnMoveList" runat="server" Text="Move" resourcekey="btnMoveList.Text" CssClass="headerActionButton moveCopy" OnClick="btnMoveList_Click" />
							<asp:LinkButton ID="btnCopyList" runat="server" Text="Copy" resourcekey="btnCopyList.Text" CssClass="headerActionButton moveCopy" OnClick="btnCopyList_Click" />
						</div>
						<asp:Label ID="lblMoveCopyListInfo" runat="server" Visible="false" CssClass="smallInfo info" />
					</div>
					<div class="selectedCategory selectedCategoryMediaManager">
						<asp:Label ID="lblSelectedCatName" runat="server" Text="Selected category name:" resourcekey="lblSelectedCatName.Text" />
						<asp:Label ID="lblSelectedCategoryNameContentView" runat="server" CssClass="selectedCategoryName" />
					</div>
					<div class="selectedCategory">
						<asp:Label ID="lblSelectedListNameTitle" runat="server" Text="Selected List Name:" resourcekey="lblSelectedListNameTitle.Text" />
						<asp:Label ID="lblSelectedListName" runat="server" CssClass="selectedCategoryName" />
					</div>
					<p class="numberOfMediaFiles">
						<asp:Label ID="lblNumberOfMediaFiles" runat="server" Text="Number of media files in List:" CssClass="labeltext2" resourcekey="lblNumberOfMediaFiles.Text" />
						<asp:Label ID="lblImagesNumber" runat="server" CssClass="labeltext2" />
					</p>
					<p class="numberOfMediaFiles">
						<asp:Label ID="lblSelectedListID" runat="server" Text="Selected List ID:" Visible="false" resourcekey="lblSelectedListID" />
						<asp:Label ID="lblSelectedDataKey2" runat="server" Visible="false" />
					</p>
					<div class="listItems">
						<asp:Label ID="lblGvListContentErr" runat="server" EnableViewState="False" CssClass="infoMessages info static" Visible="false" />
						<asp:ObjectDataSource ID="odsModuleContent" runat="server" SelectMethod="GetContentByListIDAdmin" DeleteMethod="ContentDelete" TypeName="EasyDNNSolutions.Modules.EasyDNNRotator.Entities.RotatorContentDB">
							<DeleteParameters>
								<asp:Parameter Name="ContentID" Type="Int32" />
								<asp:Parameter Name="ContentType" Type="String" />
							</DeleteParameters>
							<SelectParameters>
								<asp:Parameter Name="ListID" Type="Int32" />
								<asp:Parameter Name="Limit" Type="Int32" />
								<asp:Parameter Name="Type" Type="String" />
								<asp:Parameter Name="LocalCode" Type="String" />
								<asp:Parameter Name="Randomize" Type="Boolean" />
								<asp:Parameter Name="HideUnlocalizedItems" Type="Boolean" />
							</SelectParameters>
						</asp:ObjectDataSource>
						<asp:GridView ID="gvEditContent"
							DataSourceID="odsModuleContent"
							runat="server"
							AutoGenerateColumns="False"
							EnableModelValidation="True"
							CssClass="listItemsTable"
							DataKeyNames="ContentID,ContentType"
							ShowFooter="True" GridLines="None"
							AllowPaging="True" AllowSorting="True"
							OnRowCommand="gvEditContent_RowCommand"
							Visible="false"
							OnDataBound="gvEditContent_DataBound"
							OnRowDeleted="gvEditContent_RowDeleted"
							OnRowDeleting="gvEditContent_RowDeleting"
							OnPreRender="gvEditContent_PreRender">
							<Columns>
								<asp:TemplateField>
									<ItemTemplate>
										<div class="styledCheckbox noLabel">
											<asp:CheckBox ID="chkRows" runat="server" Text="Select" />
										</div>
									</ItemTemplate>
									<FooterTemplate>
										<div class="itemActions footerActions">
											<asp:LinkButton ID="lbCheckAll" runat="server" CommandName="CheckAll" Text="Select All" />
											<asp:LinkButton ID="lblUnCheckAll" runat="server" CommandName="UnCheckAll" Text="Deselect All" />
											<asp:LinkButton ID="lbDelSelected" runat="server" CommandName="delSelected" Text="Delete Selected" />
										</div>
										<div class="positionItems">
											<asp:LinkButton ID="btnContentSavePosition" runat="server" CssClass="savePositions" OnClick="ContentSavePositions" Text="Save Positions" CommandName="save" />
											<asp:LinkButton ID="btnRearrangeContentPositions" runat="server" OnClick="ContentSavePositions" ToolTip="Rearrange content position numbers." CssClass="rearangePositions" CommandName="reorder" />
										</div>
									</FooterTemplate>
								</asp:TemplateField>
								<asp:TemplateField ShowHeader="False" HeaderText="Actions">
									<ItemTemplate>
										<div class="itemActions itemPrimaryActions">
											<asp:LinkButton ID="lbEditRotationItem" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Select" Text="Edit" CssClass="editAction" resourcekey="lbEdit.Text" />
											<asp:LinkButton ID="lbDeleteRotatorInline" runat="server" CausesValidation="False" CommandName="Delete" CssClass="deleteAction" Text="Delete" resourcekey="lbDelete.Text" OnClientClick="return confirm('Are you sure you want to delete this item?');" />
										</div>
										<div class="itemActions itemSecondaryActions">
											<asp:LinkButton ID="lbMediaMove" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Move" CssClass="gallerycontrollinklight" Text="Move/Copy" resourcekey="lbMediaMoveCopy.Text" />
											<asp:LinkButton ID="lbContentGVLocalization" runat="server" CausesValidation="False" CommandArgument='<%#Eval("ContentID")%>' CommandName='<%#ReturnRotatorType(Eval("ContentType"))%>' CssClass="gallerycontrollink" Text="Content Localization" resourcekey="lbContentLocalization.Text" Visible='<%#LocalizationEnabled%>' />
										</div>
									</ItemTemplate>
									<ItemStyle CssClass="actionsCell" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Title" SortExpression="Title">
									<ItemTemplate>
										<asp:Label ID="lblEditRotatorTitle" runat="server" Text='<%# Bind("Title") %>' />
									</ItemTemplate>
									<HeaderStyle Width="200" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Description" Visible="false">
									<ItemTemplate>
										<asp:Label ID="lblMediaDescription" runat="server" Text='<%# Bind("Description") %>' />
									</ItemTemplate>
									<HeaderStyle Width="150" />
								</asp:TemplateField>
								<asp:BoundField DataField="Link" HeaderText="Link">
									<HeaderStyle Width="215px" />
								</asp:BoundField>
								<asp:TemplateField HeaderText="Content">
									<ItemTemplate>
										<div class="thumbnail">
											<asp:Image ID="imgContent" ImageUrl='<%#gVImageSelector(Eval("FileLocation"),Eval("ContentType"),Eval("FileSystemName"),Eval("ThumbLocation"),Eval("ThumbSystemName"))%>' runat="server" />
										</div>
									</ItemTemplate>
									<ItemStyle CssClass="thumbnailCell" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Position" SortExpression="Position">
									<ItemTemplate>
										<div>
											<asp:TextBox ID="tbxPositionVal" runat="server" CssClass="xsmall textCenter" Text='<%#Eval("Position")%>' />
											<asp:LinkButton ID="imgBtnUP" runat="server" CausesValidation="false" CommandArgument='<%#Eval("ContentID") %>' CommandName="imgBtnUPCmd" CssClass="move moveUp" />
											<asp:LinkButton ID="imgBtnDown" runat="server" CausesValidation="false" CommandArgument='<%#Eval("ContentID") %>' CommandName="imgBtnDownCmd" CssClass="move moveDown" />
										</div>
									</ItemTemplate>
									<ItemStyle CssClass="arrangeItems" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Type" SortExpression="MediaType">
									<ItemTemplate>
										<asp:Label ID="lblMediaType" runat="server" Text='<%# Bind("ContentType") %>' CssClass='<%# String.Format("mediaType type{0}", (((DataRowView)Container.DataItem)["ContentType"]).ToString().Replace(" ",""))%>' />
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
							<FooterStyle CssClass="itemsListFooter" />
							<HeaderStyle CssClass="itemsListheader" />
							<PagerStyle CssClass="contentPagination" />
							<EditRowStyle CssClass="editItemState" />
						</asp:GridView>
						<div runat="server" id="contentNumberOfItems" class="numberOfItemsPerPage">
							<dnn:Label ID="lblNumberOfContentGrid" runat="server" ControlName="ddlNumberOfContentGrid" HelpText="Select the number of content to display on one page." Text="Content per page:" ResourceKey="lblNumberOfContentGrid.Text" CssClass="labeltext" HelpKey="lblNumberOfContentGrid.HelpKey" />
							<div class="styledSelect">
								<asp:DropDownList ID="ddlNumberOfContentGrid" runat="server" AutoPostBack="True" CssClass="ddlpageitems" OnSelectedIndexChanged="ddlNumberOfContentGrid_SelectedIndexChanged">
									<asp:ListItem Value="10" Text="10" />
									<asp:ListItem Value="30" Text="30" />
									<asp:ListItem Value="50" Text="50" />
									<asp:ListItem Value="80" Text="80" />
									<asp:ListItem Value="100" Text="100" />
									<asp:ListItem Value="200" Text="200" />
								</asp:DropDownList>
							</div>
						</div>
					</div>
				</asp:Panel>
				<asp:Panel ID="pnlAddContent" runat="server" Visible="false">
					<asp:Label ID="lblUploadMediaStatus" runat="server" Visible="false" />
					<ul class="mediaSelect">
						<li class="imageUpload">
							<asp:LinkButton ID="btnAddImages" runat="server" CausesValidation="False" Text="images" OnClick="btnAddImages_Click" resourcekey="btnAddImages.Text" CssClass="active" />
						</li>
						<li class="videoUpload">
							<asp:LinkButton ID="btnAddVideo" CausesValidation="False" runat="server" Text="video" OnClick="btnAddVideo_Click" resourcekey="btnAddVideo.Text" />
						</li>
						<li class="addHtml">
							<asp:LinkButton ID="btnHTMLContent" runat="server" Text="HTML" OnClick="btnHTMLContent_Click" resourcekey="btnAddHTML.Text" CausesValidation="False" />
						</li>
					</ul>
					<asp:Panel ID="pnlViewAddImage" runat="server" Visible="True" CssClass="contentSection imageUpload">
						<div class="specialOptions">
							<h2>
								<asp:Label ID="lblAddImages" resourcekey="lblAddImages.Text" runat="server" Text="Add images" />
							</h2>
							<div class="optionsList">
								<asp:RadioButtonList ID="rblImageUploadTypeSelect" runat="server" AutoPostBack="True" CssClass="styledRadio" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblImageUploadTypeSelect_SelectedIndexChanged">
									<asp:ListItem resourcekey="liSingleImageUpload" Text="Upload single image" Value="singleUpload" />
									<asp:ListItem resourcekey="liMultiImageUpload" Text="Upload multiple images" Value="multiUpload" Selected="True" />
								</asp:RadioButtonList>
							</div>
						</div>
						<asp:Panel ID="pnlSingleImageUpload" runat="server" Visible="false" CssClass="content">
							<div class="optionsPanel">
								<table>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAddImageTitle" runat="server" Text="Title:" ControlName="tbxTitle" HelpText="Enter a title." ResourceKey="lblAddImageTitle.Text" HelpKey="lblAddImageTitle.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxTitle" runat="server" CssClass="large" EnableViewState="False" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAddImageSubTitle" runat="server" Text="SubTitle:" ControlName="tbxSubTitle" HelpText="Enter a subtitle." ResourceKey="lblAddImageSubTitle.Text" HelpKey="lblAddImageSubTitle.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxSubTitle" runat="server" CssClass="large" EnableViewState="False" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAddImageDescription" runat="server" Text="Description:" ControlName="txtHTMLDescription" HelpText="Enter a description." ResourceKey="lblAddImageDescription.Text" HelpKey="lblAddImageDescription.HelpKey" />
										</td>
										<td>
											<div>
												<dnn:TextEditor ID="txtHTMLDescription" runat="server" Width="600px" Height="350px" EnableTheming="False" EnableViewState="True" ChooseRender="True" ChooseMode="True" HtmlEncode="False" style="width: 500px;" />
											</div>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAddImageLink" runat="server" Text="OnClick redirect to URL:" ControlName="tbxLink" HelpText="Enter a link where a visitor will be redirected if he or she clicks on a slide. The redirect option has to be enabled in the rotator settings." ResourceKey="lblAddImageLink.Text" HelpKey="lblAddImageLink.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxLink" runat="server" CssClass="large" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAddImage" runat="server" Text="Image:" ControlName="fuImage" HelpText="Select picture for upload (jpeg, jpg, gif, bmp)." ResourceKey="lblAddImage.Text" HelpKey="lblAddImage.HelpKey" />
										</td>
										<td>
											<asp:FileUpload ID="fuImage" runat="server" />
											<asp:Label ID="lblImageError" runat="server" CssClass="smallInfo error" Visible="false" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblStartExpire" runat="server" Text="Set start and end date:" HelpText="This option enables you to set a start date and time, and an end date and time. A slide will be displayed from the start date and time and it will stop to display at the end date and time." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
										</td>
										<td>
											<div class="styledCheckbox noLabel">
												<asp:CheckBox ID="cbStartExpire" runat="server" Checked="false" Text="Mora biti" />
											</div>
										</td>
									</tr>
								</table>
								<div id="divImageStartExpire" runat="server" style="display: none;" cssclass="paddingTop">
									<div class="optionsPanel">
										<table>
											<tr>
												<td class="labels">
													<dnn:Label ID="lblStartDate" runat="server" HelpText="A start date and time for displaying slides." Text="Start date and time: " ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
												</td>
												<td>
													<asp:TextBox ID="tbxStartDate" runat="server" CssClass="textCenter" ValidationGroup="vgAddArticle" Width="90px" />
													<i class="fa fa-calendar"></i>
													<asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="tbxStartDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="vgAddArticle" CssClass="smallInfo error inline" />
													<asp:Label ID="lblPubDateError" Display="Dynamic" ResourceKey="lblPubDateError" runat="server" Text="Invalid date." Visible="false" CssClass="smallInfo error" />
													<asp:TextBox ID="tbxStartTime" runat="server" ValidationGroup="vgAddArticle" Width="70px" />
													<i class="fa fa-clock-o"></i>
													<asp:RegularExpressionValidator ID="revStartTime" runat="server" ControlToValidate="tbxStartTime" Display="Dynamic" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAddArticle" CssClass="smallInfo error inline" />
													<asp:RequiredFieldValidator ID="rfvStartTime" runat="server" ControlToValidate="tbxStartTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="vgAddArticle" CssClass="smallInfo error inline" />
												</td>
											</tr>
											<tr>
												<td class="labels">
													<dnn:Label ID="lblEndDate" runat="server" HelpText="An end date and time for displaying slides." Text="End date and time:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
												</td>
												<td>
													<asp:TextBox ID="tbxEndDate" runat="server" CssClass="textCenter" ValidationGroup="vgAddArticle" Width="90px" />
													<i class="fa fa-calendar"></i>
													<asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="tbxEndDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="vgAddArticle" CssClass="smallInfo error inline" />
													<asp:Label ID="lblExpireDateError" resourcekey="lblExpireDateError" runat="server" Display="Dynamic" Text="Invalid date." Visible="false" CssClass="small textCenter" />
													<asp:TextBox ID="tbxEndTime" runat="server" ValidationGroup="vgAddArticle" Width="70px" />
													<i class="fa fa-clock-o"></i>
													<asp:RegularExpressionValidator ID="revEndTime" runat="server" Display="Dynamic" ControlToValidate="tbxEndTime" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAddArticle" CssClass="smallInfo error inline" />
													<asp:RequiredFieldValidator ID="rfvEndTime" runat="server" ControlToValidate="tbxEndTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="vgAddArticle" CssClass="smallInfo error inline" />
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							<asp:Label ID="lblAddResultInfo" runat="server" EnableViewState="False" CssClass="infoMessages success" Visible="false" />
							<div class="mainActions">
								<asp:LinkButton ID="btnSave" runat="server" resourcekey="btnUpload.Text" Text="Upload" OnClick="btnSave_Click" CausesValidation="true" ValidationGroup="vgAddArticle" CssClass="upload" />
							</div>
						</asp:Panel>
						<asp:Panel ID="pnlMultiImageUpload" runat="server" Visible="true" CssClass="content">
							<div class="optionsPanel">
								<table>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblImgMultiUploadTitle" runat="server" Text="Title:" ControlName="tbxImgMultiUploadTitle" HelpText="Enter title." ResourceKey="lblAddImageTitle.Text" HelpKey="lblAddImageTitle.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxImgMultiUploadTitle" runat="server" CssClass="large" EnableViewState="False" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblImgMultiUploadSubTitle" runat="server" Text="SubTitle:" ControlName="tbxImgMultiUploadSubTitle" HelpText="Enter subtitle." ResourceKey="lblAddImageSubTitle.Text" HelpKey="lblAddImageSubTitle.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxImgMultiUploadSubTitle" runat="server" CssClass="large" EnableViewState="False" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblImgMultiUploadDesc" runat="server" Text="Description:" ControlName="txtImgMultiUploadDesc" HelpText="Enter description of image." ResourceKey="lblAddImageDescription.Text" HelpKey="lblAddImageDescription.HelpKey" />
										</td>
										<td>
											<dnn:TextEditor ID="tbxImgMultiUploadDesc" runat="server" Height="350px" Width="600px" EnableTheming="True" EnableViewState="True" ChooseRender="True" ChooseMode="True" HtmlEncode="False" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblResizeImages" runat="server" HelpText="Proportionally resize the image." ControlName="tbxMultiPictureW" Text="Resize" ResourceKey="lblResizeImages.Text" HelpKey="lblResizeImages.HelpKey" />
										</td>
										<td>
											<div class="styledCheckbox noLabel">
												<asp:CheckBox ID="cbResizeImages" runat="server" Checked="false" AutoPostBack="True" OnCheckedChanged="cbResizeImages_CheckedChanged" Text="Resize when uploading" />
											</div>
											<asp:Panel ID="pnlMultiImgUploadResize" runat="server" Visible="false" CssClass="paddingTop">
												<dnn:Label ID="lblMultiPictureWH" runat="server" HelpText="Enter the desired image dimensions." ControlName="tbxMultiPictureW" Text="Resize width / height:" ResourceKey="lblMultiPictureWH.Text" HelpKey="lblMultiPictureWH.HelpKey" />
												<asp:TextBox ID="tbxMultiPictureW" runat="server" ValidationGroup="vgMultiImg" CssClass="small textCenter" Text="800" />
												<asp:TextBox ID="tbxMultiPictureH" runat="server" CssClass="small textCenter" Text="600" />
												<asp:CompareValidator ID="cvMultiPictureW" runat="server" ControlToValidate="tbxMultiPictureW" ErrorMessage="Please enter number only." Operator="DataTypeCheck" Type="Integer" ValidationGroup="vgEditVideo" CssClass="smallInfo error" />
												<asp:CompareValidator ID="cvMultiPictureH" runat="server" ControlToValidate="tbxMultiPictureW" ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadHeight.ErrorMessage" Type="Integer" ValidationGroup="vgMultiImg" CssClass="smallInfo error" />
											</asp:Panel>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblImgMultiUploadLink" runat="server" Text="Link:" ControlName="tbxImgMultiUploadLink" HelpText="Enter Link." ResourceKey="lblAddImageLink.Text" HelpKey="lblAddImageLink.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxImgMultiUploadLink" runat="server" CssClass="large" />
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblEmbedMultiStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
										</td>
										<td>
											<div class="styledCheckbox noLabel">
												<asp:CheckBox ID="cbMultiStartExpire" runat="server" Checked="false" Text="Add start/expire date:" />
											</div>
										</td>
									</tr>
								</table>
								<asp:Panel ID="divMultiImageStartExpire" runat="server" Style="display: none;" CssClass="content paddingTop">
									<div class="optionsPanel">
										<table>
											<tr>
												<td class="labels">
													<dnn:Label ID="lblMultiStartDate" runat="server" HelpText="Items will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
												</td>
												<td>
													<asp:TextBox ID="tbxMultiStartDate" runat="server" CssClass="text_generic center" ValidationGroup="MultiUpload" Width="90px" />
													<i class="fa fa-calendar"></i>
													<asp:RequiredFieldValidator ID="rfvMultiStartDate" runat="server" ControlToValidate="tbxMultiStartDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="MultiUpload" CssClass="smallInfo error inline" />
													<asp:Label ID="lblMultiPubDateError" ResourceKey="lblPubDateError" runat="server" Text="Invalid date." Display="Dynamic" Visible="false" CssClass="smallInfo error inline" />
													<asp:TextBox ID="tbxMultiStartTime" runat="server" ValidationGroup="MultiUpload" Width="70px" />
													<i class="fa fa-clock-o"></i>
													<asp:RegularExpressionValidator ID="revMultiStartTime" runat="server" ControlToValidate="tbxMultiStartTime" Display="Dynamic" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="MultiUpload" CssClass="smallInfo error inline" />
													<asp:RequiredFieldValidator ID="rfvMultiStartTime" runat="server" ControlToValidate="tbxMultiStartTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="MultiUpload" CssClass="smallInfo error inline" />
												</td>
											</tr>
											<tr>
												<td class="labels">
													<dnn:Label ID="lblMultiEndDate" runat="server" HelpText="Items will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
												</td>
												<td>
													<asp:TextBox ID="tbxMultiEndDate" runat="server" CssClass="text_generic center" ValidationGroup="MultiUpload" Width="90px" />
													<i class="fa fa-calendar"></i>
													<asp:RequiredFieldValidator ID="rfvMultiEndDate" runat="server" ControlToValidate="tbxMultiEndDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="MultiUpload" CssClass="smallInfo error inline" />
													<asp:Label ID="lblMultiExpireDateError" resourcekey="lblExpireDateError" runat="server" Text="Invalid date." Display="Dynamic" Visible="false" CssClass="smallInfo error inline" />
													<asp:TextBox ID="tbxMultiEndTime" runat="server" ValidationGroup="MultiUpload" Width="70px" />
													<i class="fa fa-clock-o"></i>
													<asp:RegularExpressionValidator ID="revMultiEndTime" runat="server" ControlToValidate="tbxMultiEndTime" Display="Dynamic" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="MultiUpload" CssClass="smallInfo error inline" />
													<asp:RequiredFieldValidator ID="rfvMultiEndTime" runat="server" ControlToValidate="tbxMultiEndTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="MultiUpload" CssClass="smallInfo error inline" />
												</td>
											</tr>
										</table>
									</div>
								</asp:Panel>
								<table class="contentTables">
									<tr>
										<td colspan="2">
											<asp:Label ID="lblMultiImageUploadMessage" runat="server" EnableViewState="False" />
										</td>
									</tr>
								</table>
								<asp:Panel ID="pnlImageUploadUploadify" runat="server">
									<table class="contentTables">
										<tr>
											<td>
												<dnn:Label ID="Label15" runat="server" Text="Image:" ControlName="fuImage" HelpText="Select picture for upload (jpeg, jpg, gif, bmp)." ResourceKey="lblAddImage.Text" HelpKey="lblAddImage.HelpKey" />
											</td>
											<td class="multi">
												<div style="display: block; float: left; margin-left: 30px; padding-top: 4px;">
													<asp:FileUpload ID="fuImgMulti" runat="server" EnableTheming="True" />
												</div>
												<div style="display: block; float: left; margin-left: 15px;">
													<a class="btnUpload" href="javascript:jQuery('#<%=fuImgMulti.ClientID%>').uploadifyUpload();">
														<%=startUpload%></a> <a href="javascript:jQuery('#<%=fuImgMulti.ClientID%>').uploadifyClearQueue();">
															<%=ClearQueue%>
														</a>
												</div>
												<div id="ListOfPictures" style="height: auto; margin-top: 60px; padding: 5px; width: 400px;">
												</div>
											</td>
										</tr>
									</table>
									<div class="saveLoader">
										<asp:Label ID="lblSaveingInfo" CssClass="loadSettingsInfo" runat="server" Text="Processing files please wait." Style="display: none; padding-bottom: 15px;" />
										<img id="saveLoaderGif" src="<%=ModulePath%>Images/saveloader.gif" alt="AnimaedGif" class="centerLoad" style="display: none; margin-left: auto; margin-right: auto; padding-bottom: 15px;" />
									</div>
								</asp:Panel>
								<asp:Panel ID="pnlImageUploadfineUploader" runat="server" Visible="False">
									<div id="galleryImageFineUploaderContainer" class="EDS_simpleFineUploader">
										<div class="uploader">
										</div>
										<div class="uploadControls">
											<div class="actions">
												<span class="action fileSelection">
													<asp:Label ID="galleryFineUploaderSelectFiles" runat="server" resourcekey="fineUploaderSelectFiles" Text="Select images" />
													<span class="dnnInputFileWrapper">
														<input type="file" value="" multiple="multiple" /></span> </span><span class="action upload">
															<asp:Label ID="galleryFineUploaderStartUpload" runat="server" resourcekey="fineUploaderStartUpload" Text="Start upload" />
														</span>
											</div>
											<div class="dndContainer">
												<p>
													<asp:Label ID="galleryFineUploaderDragImagesHere" runat="server" resourcekey="fineUploaderDragImagesHere" Text="Drag images here" />
												</p>
											</div>
										</div>
										<div class="uploadDetails">
											<ol class="fileUploadList"></ol>
										</div>
									</div>
								</asp:Panel>
								<div style="display: none; line-height: 0pt;">
									<asp:Button ID="btnSaveMultiImageUpload" runat="server" OnClick="btnSaveMultiImageUpload_Click" />
								</div>
								<asp:Label ID="lblImgMultiUploadInfo" runat="server" />
							</div>
						</asp:Panel>
					</asp:Panel>
					<asp:Panel ID="pnlAddVideo" runat="server" Visible="false" CssClass="contentSection videoUpload">
						<div class="specialOptions">
							<h2>
								<asp:Label ID="lblAddVideo" resourcekey="lblAddVideo.Text" runat="server" Text="Add video" />
							</h2>
							<div class="optionsList">
								<asp:RadioButtonList ID="rblVideoUploadTypeSelect" runat="server" AutoPostBack="True" CssClass="styledRadio" RepeatDirection="Horizontal" resourcekey="rblVideoUploadTypeSelectResource1" OnSelectedIndexChanged="rblVideoUploadTypeSelect_SelectedIndexChanged">
									<asp:ListItem resourcekey="liUploadVideo" Text="Upload Video" Value="pnlUploadVideo" Selected="True" />
									<asp:ListItem resourcekey="liEmbedVideo" Text="Embed video" Value="pnlUploadEmbed" />
									<asp:ListItem resourcekey="liExternalVideoLink" Text="Add external video link" Value="pnlUploadAmazonS3" />
								</asp:RadioButtonList>
							</div>
						</div>
						<asp:Panel ID="pnlUploadVideo" runat="server" Visible="false" CssClass="content">
							<div class="optionsPanel">
								<table>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAddVideoTitle" runat="server" Text="Title:" HelpText="Enter title." ResourceKey="lblAddVideoTitle.Text" HelpKey="lblAddVideoTitle.HelpKey" ControlName="tbxVideoTitle" />
										</td>
										<td>
											<asp:TextBox ID="tbxVideoTitle" runat="server" EnableViewState="False" CssClass="large" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblVideoUploadDescription" runat="server" ControlName="tbVideoUploadDescription" HelpKey="lblVideoUploadDescription.HelpKey" HelpText="Enter a description:" ResourceKey="lblVideoUploadDescription.Text" Text="Description:" />
										</td>
										<td>
											<asp:TextBox ID="tbVideoUploadDescription" runat="server" Height="150px" MaxLength="4000" TextMode="MultiLine" CssClass="large" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblVideoUploadWidth" runat="server" ControlName="tbVideoUploadWidth" HelpKey="lblVideoUploadWidth.HelpKey" HelpText="Enter a width of a video in pixels. " ResourceKey="lblVideoUploadWidth.Text" Text="Width of video:" />
										</td>
										<td>
											<asp:TextBox ID="tbVideoUploadWidth" runat="server" ValidationGroup="vgVideoUpload" CssClass="small textCenter" Text="480" />
											<asp:CompareValidator ID="cvVideoUploadWidth" runat="server" Display="Dynamic" ControlToValidate="tbVideoUploadWidth" ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadWidth.ErrorMessage" Type="Integer" ValidationGroup="vgVideoUpload" CssClass="smallInfo error"></asp:CompareValidator>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblVideoUploadHeight" runat="server" ControlName="tbVideoUploadHeight" HelpKey="lblVideoUploadHeight.HelpKey" HelpText="Enter the video height to be used when displaying video." ResourceKey="lblVideoUploadHeight.Text" Text="Height of video:" />
										</td>
										<td>
											<asp:TextBox ID="tbVideoUploadHeight" runat="server" CssClass="small textCenter" Text="360" />
											<asp:CompareValidator ID="cvVideoUploadHeight" runat="server" Display="Dynamic" ControlToValidate="tbVideoUploadHeight" ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadHeight.ErrorMessage" Type="Integer" ValidationGroup="vgVideoUpload" CssClass="smallInfo error"></asp:CompareValidator>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblVideoThumb" runat="server" ControlName="rblVideoThumbnailSelect" HelpKey="lblVideoThumb.HelpKey" HelpText="Upload a new thumbnail for the video or use a predefined thumbnail." ResourceKey="lblVideoThumb.Text" Text="Video thumbnail:" />
										</td>
										<td>
											<asp:RadioButtonList ID="rblVideoThumbnailSelect" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblVideoThumbnailSelect_SelectedIndexChanged" CssClass="styledRadio small">
												<asp:ListItem resourcekey="ddlliVideoThumbStandard.Text" Selected="True" Text="Use standard image" Value="standardThumb" />
												<asp:ListItem resourcekey="ddlliVideoThumbUpload.Text" Text="Upload thumbnail" Value="uploadThumb" />
											</asp:RadioButtonList>
											<asp:Panel ID="pnlVideoThumbUpload" runat="server" Visible="false" CssClass="paddingTop">
												<dnn:Label ID="lblVideoThumbUpload" runat="server" Text="Select Thumbnail:" HelpText="Select thumbnail to upload. (Thumbnail is uploaded to List Content, location - Portals/PortalID/EasyDNNRotator/Originals/ListID/VideoThumb/)" ResourceKey="lblVideoThumbUpload.Text" HelpKey="lblVideoThumbUpload.HelpKey" ControlName="fuVideoThumb" />
												<asp:FileUpload ID="fuVideoThumb" runat="server" />
											</asp:Panel>
											<asp:Panel runat="server" ID="pnlVideoStandardThumb" Visible="false" CssClass="paddingTop">
												<dnn:Label ID="lblVideoStandardThumb" runat="server" Text="Select predefined thumbnail:" HelpText="Select one of predefined thumbnails. Location - ModulePath/Thumbs/Video." ResourceKey="lblVideoStandardThumbSelect.Text" HelpKey="lblVideoStandardThumbSelect.HelpKey" ControlName="ddlVideoThumbSelect" />
												<div class="styledSelect">
													<asp:DropDownList ID="ddlVideoThumbSelect" runat="server" />
												</div>
												<asp:RequiredFieldValidator ID="rfvVideoThumbSelect" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlVideoThumbSelect" ValidationGroup="vgAddVideo" InitialValue="0" resourcekey="rfvValue.ErrorMessage" Display="Dynamic" CssClass="smallInfo error" />
											</asp:Panel>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAddVideoUpload" runat="server" Text="Upload video file:" HelpText="Select video for upload (mp4, flv, swf)." ResourceKey="lblAddVideoUpload.Text" HelpKey="lblAddVideoUpload.HelpKey" ControlName="FuVideoUpload" />
										</td>
										<td>
											<asp:FileUpload ID="FuVideoUpload" runat="server" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblVideoStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
										</td>
										<td>
											<div class="styledCheckbox noLabel">
												<asp:CheckBox ID="cbVideoStartExpire" runat="server" Checked="false" Text="Add start/expire date" />
											</div>
										</td>
									</tr>
								</table>
							</div>
							<asp:Panel ID="divVideoStartExpire" runat="server" Style="display: none;" CssClass="paddingTop optionsPanel">
								<table>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblVideoStartDate" runat="server" HelpText="Video will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxVideoStartDate" runat="server" ValidationGroup="vgAddVideo" Width="90px" />
											<i class="fa fa-calendar"></i>
											<asp:RequiredFieldValidator ID="rfvVideoStartDate" runat="server" ControlToValidate="tbxVideoStartDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="vgAddVideo" CssClass="smallInfo error" />
											<asp:Label ID="lblVideoPubDateError" ResourceKey="lblPubDateError" runat="server" Display="Dynamic" Text="Invalid date." Visible="false" CssClass="smallInfo error" />
											<asp:TextBox ID="tbxVideoStartTime" runat="server" ValidationGroup="vgAddVideo" Width="70px" CssClass="text_generic center" />
											<i class="fa fa-clock-o"></i>
											<asp:RegularExpressionValidator ID="revVideoStartTime" runat="server" ControlToValidate="tbxVideoStartTime" Display="Dynamic" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAddVideo" CssClass="smallInfo error" />
											<asp:RequiredFieldValidator ID="rfvVideoStartTime" runat="server" ControlToValidate="tbxVideoStartTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="vgAddVideo" CssClass="smallInfo error" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblVideoEndDate" runat="server" HelpText="Image will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxVideoEndDate" runat="server" ValidationGroup="vgAddVideo" Width="90px" />
											<i class="fa fa-calendar"></i>
											<asp:RequiredFieldValidator ID="rfvVideoEndDate" runat="server" ControlToValidate="tbxVideoEndDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="vgAddVideo" CssClass="smallInfo error" />
											<asp:Label ID="lblVideoExpireDateError" resourcekey="lblExpireDateError" runat="server" Text="Invalid date." Display="Dynamic" Visible="false" CssClass="smallInfo error" />
											<asp:TextBox ID="tbxVideoEndTime" runat="server" ValidationGroup="vgAddVideo" Width="70px" />
											<i class="fa fa-clock-o"></i>
											<asp:RegularExpressionValidator ID="revVideoEndTime" runat="server" Display="Dynamic" ControlToValidate="tbxVideoEndTime" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAddVideo" CssClass="smallInfo error" />
											<asp:RequiredFieldValidator ID="rfvVideoEndTime" runat="server" ControlToValidate="tbxVideoEndTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="vgAddVideo" CssClass="smallInfo error" />
										</td>
									</tr>
								</table>
							</asp:Panel>
							<asp:Label ID="lblVideoErr" runat="server" EnableViewState="False" CssClass="infoMessages error static" Visible="false" />
							<div class="mainActions">
								<asp:LinkButton ID="btnvideoUpload" runat="server" Text="Upload" ValidationGroup="vgAddVideo" resourcekey="btnUpload.Text" CausesValidation="True" OnClick="btnvideoUpload_Click" CssClass="upload" />
							</div>
						</asp:Panel>
						<asp:Panel ID="pnlUploadEmbed" runat="server" Visible="false" CssClass="content">
							<h4>
								<dnn:Label ID="lblEmbedVideoTitle" ResourceKey="lblEmbedVideoTitle" runat="server" Text="Embed Video" HelpText="Embed video from various video sites." CssClass="subtitleregion" HelpKey="lblEmbedVideoTitle.HelpText" />
							</h4>
							<div class="optionsList">
								<asp:RadioButtonList ID="rblEmbedVideoSourceSelect" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblVideoSources_SelectedIndexChanged" CssClass="styledRadio">
									<asp:ListItem Value="YouTube" Text="YouTube" />
									<asp:ListItem Value="Vimeo" Text="Vimeo" />
									<asp:ListItem Value="Dailymotion" Text="Dailymotion" />
									<asp:ListItem Value="Metacafe" Text="Metacafe" />
									<asp:ListItem Value="bitsrun" Text="Bits on the Run" />
									<asp:ListItem Value="Others" Text="Others" />
								</asp:RadioButtonList>
								<asp:RequiredFieldValidator ID="rfvEmbedVideoSourceSelect" runat="server" ControlToValidate="rblEmbedVideoSourceSelect" ErrorMessage="Please select." ValidationGroup="EmbedVideo" resourcekey="rfvEmbedVideoSourceSelectResource1.ErrorMessage" />
							</div>
							<div class="optionsPanel">
								<table>
									<tr runat="server" id="rowEmbedVideoCode">
										<td class="labels">
											<dnn:Label ID="lblEmbedVideoCode" ResourceKey="lblEmbedVideoCode.Text" runat="server" Text="Embed code:" ControlName="tbxFlashEmbedUrl" HelpText="Enter video embed code." HelpKey="lblEmbedVideoCode.HelpText" />
										</td>
										<td>
											<asp:TextBox ID="tbxFlashEmbedUrl" runat="server" CssClass="large" MaxLength="2500" TextMode="MultiLine" Height="150px" ValidationGroup="EmbedVideoUpload" />
											<asp:RequiredFieldValidator ID="rfvEmbedVideoCode" Display="Dynamic" runat="server" ControlToValidate="tbxFlashEmbedUrl" ErrorMessage="This filed is required." ValidationGroup="EmbedVideoUpload" resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage" CssClass="smallInfo error" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblEembedVideoUrl" ResourceKey="lblEembedVideoUrl.Text" runat="server" Text="Video url:" ControlName="tbEmbedShortUrl" HelpText="Enter video url." HelpKey="lblEembedVideoUrl.HelpText" />
										</td>
										<td>
											<asp:TextBox ID="tbEmbedShortUrl" runat="server" CssClass="large" ValidationGroup="EmbedVideoUpload" />
											<asp:RequiredFieldValidator ID="rfvEmbedVideoURL" Display="Dynamic" runat="server" ControlToValidate="tbEmbedShortUrl" ErrorMessage="This filed is required." ValidationGroup="EmbedVideoUpload" resourcekey="rfvEmbedVideoURLResource1.ErrorMessage" CssClass="smallInfo error" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblEmbedVideoEnterTitle" ResourceKey="lblEmbedVideoEnterTitle.Text" runat="server" Text="Video title:" ControlName="tbxFlashEmbedTitle" HelpText="Enter video title." HelpKey="lblEmbedVideoEnterTitle.HelpText" />
										</td>
										<td>
											<asp:TextBox ID="tbxFlashEmbedTitle" runat="server" CssClass="large" ValidationGroup="EmbedVideoUpload" />
											<asp:RequiredFieldValidator ID="rfvEmbedVideoTitle" Display="Dynamic" runat="server" ControlToValidate="tbxFlashEmbedTitle" ErrorMessage="This filed is required." ValidationGroup="EmbedVideoUpload" resourcekey="rfvEmbedVideoTitleResource1.ErrorMessage" CssClass="smallInfo error" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblEmbedVideoDescription" ResourceKey="lblEmbedVideoDescription.Text" runat="server" Text="Description:" ControlName="tbFlashEmbedDescription" HelpText="Enter a description." HelpKey="lblEmbedVideoDescription.HelpText" />
										</td>
										<td>
											<asp:TextBox ID="tbxFlashEmbedDescription" runat="server" Height="150px" TextMode="MultiLine" CssClass="large" MaxLength="4000" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblEmbedVideoThumb" runat="server" ControlName="rblEmbedVideoThumbnailSelect" HelpKey="lblVideoThumb.HelpKey" HelpText="Upload the thumbnail for video file or use standard image. Some rotators must have thumbnail to work properly." ResourceKey="lblVideoThumb.Text" Text="Video Thumbnail:" />
										</td>
										<td>
											<asp:RadioButtonList ID="rblEmbedVideoThumbnail" runat="server" OnSelectedIndexChanged="rblEVThumbCreate_SelectedIndexChanged" AutoPostBack="True" RepeatDirection="Horizontal" CssClass="styledRadio small">
												<asp:ListItem Selected="True" Value="Autocreate" Text="Auto create thumbnail" />
												<asp:ListItem Value="Upload" Text="Upload thumbnail" />
												<asp:ListItem Value="standard" Text="Use standard image" />
											</asp:RadioButtonList>
											<div id="divEVEFileUpload" runat="server" style="display: none" class="paddingTop">
												<asp:FileUpload ID="fuEmbedAddThumb" runat="server" />
											</div>
											<div id="divEVESelectThumb" runat="server" style="display: none" class="paddingTop">
												<div class="styledSelect">
													<asp:DropDownList ID="ddlVUEVSelectThumbnail" runat="server" CausesValidation="True" ValidationGroup="EmbedVideoUpload" />
												</div>
												<asp:RequiredFieldValidator ID="rfvVUEVSelectThumbnail" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlVUEVSelectThumbnail" ValidationGroup="EmbedVideoUpload" InitialValue="0" resourcekey="rfvValue.ErrorMessage" Display="Dynamic" Enabled="false" CssClass="smallInfo error" />
											</div>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblEmbedEmbedVideoStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
										</td>
										<td>
											<div class="styledCheckbox noLabel">
												<asp:CheckBox ID="cbEmbedVideoStartExpire" runat="server" Checked="false" Text="Add start/expire date" />
											</div>
										</td>
									</tr>
								</table>
								<asp:Panel ID="divEmbedVideoStartExpire" runat="server" CssClass="optionsPanel paddingTop">
									<table>
										<tr>
											<td class="labels">
												<dnn:Label ID="lblEmbedVideoStartDate" runat="server" HelpText="EmbedVideo will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
											</td>
											<td>
												<asp:TextBox ID="tbxEmbedVideoStartDate" runat="server" ValidationGroup="EmbedVideoUpload" Width="90px" />
												<i class="fa fa-calendar"></i>
												<asp:RequiredFieldValidator ID="rfvEmbedVideoStartDate" runat="server" ControlToValidate="tbxEmbedVideoStartDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="EmbedVideoUpload" CssClass="smallInfo error" />
												<asp:Label ID="lblEmbedVideoPubDateError" ResourceKey="lblPubDateError" runat="server" Display="Dynamic" Text="Invalid date." Visible="false" CssClass="smallInfo error" />
												<asp:TextBox ID="tbxEmbedVideoStartTime" runat="server" ValidationGroup="EmbedVideoUpload" Width="70px" CssClass="textCenter" />
												<i class="fa fa-clock-o"></i>
												<asp:RegularExpressionValidator ID="revEmbedVideoStartTime" runat="server" ControlToValidate="tbxEmbedVideoStartTime" ErrorMessage="hh:mm" Display="Dynamic" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="EmbedVideoUpload" CssClass="smallInfo error" />
												<asp:RequiredFieldValidator ID="rfvEmbedVideoStartTime" runat="server" ControlToValidate="tbxEmbedVideoStartTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="EmbedVideoUpload" CssClass="smallInfo error" />
											</td>
										</tr>
										<tr>
											<td class="labels">
												<dnn:Label ID="lblEmbedVideoEndDate" runat="server" HelpText="Image will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
											</td>
											<td>
												<asp:TextBox ID="tbxEmbedVideoEndDate" runat="server" CssClass="textCenter" ValidationGroup="EmbedVideoUpload" Width="90px" />
												<i class="fa fa-calendar"></i>
												<asp:RequiredFieldValidator ID="rfvEmbedVideoEndDate" runat="server" ControlToValidate="tbxEmbedVideoEndDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="EmbedVideoUpload" CssClass="smallInfo error" />
												<asp:Label ID="lblEmbedVideoExpireDateError" resourcekey="lblExpireDateError" runat="server" Display="Dynamic" Text="Invalid date." Visible="false" CssClass="smallInfo error" />
												<asp:TextBox ID="tbxEmbedVideoEndTime" runat="server" ValidationGroup="EmbedVideoUpload" Width="70px" CssClass="textCenter" />
												<i class="fa fa-clock-o"></i>
												<asp:RegularExpressionValidator ID="revEmbedVideoEndTime" runat="server" ControlToValidate="tbxEmbedVideoEndTime" Display="Dynamic" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="EmbedVideoUpload" CssClass="smallInfo error" />
												<asp:RequiredFieldValidator ID="rfvEmbedVideoEndTime" runat="server" ControlToValidate="tbxEmbedVideoEndTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="EmbedVideoUpload" CssClass="smallInfo error" />
											</td>
										</tr>
									</table>
								</asp:Panel>
							</div>
							<asp:Label ID="lblEmbedInfo" runat="server" EnableViewState="False" CssClass="infoMessages error static" Visible="false" />
							<div class="mainActions">
								<asp:LinkButton ID="btnAddEmbedVideo" runat="server" OnClick="btnAddEmbedFlash_Click" Text="Upload" ValidationGroup="EmbedVideoUpload" resourcekey="btnAddEmbedVideoResource1" CssClass="add" />
							</div>
						</asp:Panel>
						<asp:Panel ID="pnlUploadAmazonS3" runat="server" Visible="false" CssClass="content">
							<div class="optionsPanel">
								<table>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAmazonVideoURL" runat="server" Text="External video URL link:" HelpText="Aamazon S3..." ControlName="tbxAmazonVideoURL" />
										</td>
										<td>
											<asp:TextBox ID="tbxAmazonVideoURL" runat="server" CssClass="large" ValidationGroup="vgAmazonVideoUpload" />
											<asp:RequiredFieldValidator ID="rfvAmazonVideoURL" runat="server" Display="Dynamic" ControlToValidate="tbxAmazonVideoURL" ErrorMessage="This filed is required." resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAmazonVideotitle" runat="server" Text="Title:" HelpText="Enter a title." ControlName="tbxAmazonVideotitle" ResourceKey="lblAmazonVideotitle.Text" HelpKey="lblAmazonVideotitle.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxAmazonVideotitle" runat="server" EnableViewState="False" CssClass="large" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAmazonVideoUploadDescription" runat="server" ControlName="tbxAmazonVideoUploadDescription" HelpText="Enter the video description:" Text="Description:" ResourceKey="lblAmazonVideoUploadDescription.Text" HelpKey="lblAmazonVideoUploadDescription.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxAmazonVideoUploadDescription" runat="server" Height="150px" MaxLength="4000" TextMode="MultiLine" CssClass="large" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAmazonVideoUploadWidth" runat="server" ControlName="tbxAmazonVideoUploadWidth" HelpText="Enter a width of a video in pixels." Text="Width of video:" ResourceKey="lblAmazonVideoUploadWidth.Text" HelpKey="lblAmazonVideoUploadWidth.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxAmazonVideoUploadWidth" runat="server" ValidationGroup="vgAmazonVideoUpload" CssClass="small textCenter" Text="480" />
											<asp:CompareValidator ID="cvAmazonVideoUploadWidth" Display="Dynamic" runat="server" ControlToValidate="tbxAmazonVideoUploadWidth" ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadWidth.ErrorMessage" Type="Integer" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error"></asp:CompareValidator>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAmazonVideoUploadHeight" runat="server" ControlName="tbxAmazonVideoUploadHeight" HelpText="Enter a height of a video in pixels." Text="Height of video:" ResourceKey="lblAmazonVideoUploadHeight.Text" HelpKey="lblAmazonVideoUploadHeight.HelpKey" />
										</td>
										<td>
											<asp:TextBox ID="tbxAmazonVideoUploadHeight" runat="server" CssClass="small textCenter" ValidationGroup="vgAmazonVideoUpload" Text="360" />
											<asp:CompareValidator ID="cvAmazonVideoUploadHeight" runat="server" Display="Dynamic" ControlToValidate="tbxAmazonVideoUploadHeight" ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadHeight.ErrorMessage" Type="Integer" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error"></asp:CompareValidator>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblAmazonVideoThumb" runat="server" ControlName="rblVideoThumbnailSelect" HelpText="Upload a new thumbnail for the video or use a predefined thumbnail." Text="Video thumbnail:" ResourceKey="lblAmazonVideoThumb.Text" HelpKey="lblAmazonVideoThumb.HelpKey" />
										</td>
										<td>
											<asp:RadioButtonList ID="rblAmazonVideoThumb" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblAmazonVideoThumb_SelectedIndexChanged" CssClass="styledRadio small">
												<asp:ListItem resourcekey="ddlliVideoThumbStandard.Text" Selected="True" Text="Use standard image" Value="standardThumb" />
												<asp:ListItem resourcekey="ddlliVideoThumbUpload.Text" Text="Upload thumbnail" Value="uploadThumb" />
											</asp:RadioButtonList>
											<asp:Panel ID="pnlAmazonVideoThumbUpload" runat="server" Visible="false" CssClass="paddingTop">
												<dnn:Label ID="lblAmazonVideoThumbUpload" runat="server" Text="Select Thumbnail:" HelpText="Select thumbnail to upload. (Thumbnail is uploaded to List Content, location - Portals/PortalID/EasyDNNRotator/Originals/ListID/VideoThumb/)" ControlName="fuAmazonVideoThumb"></dnn:Label>
												<asp:FileUpload ID="fuAmazonVideoThumb" runat="server" />
											</asp:Panel>
											<asp:Panel runat="server" ID="pnlAmazonVideoStandardThumb" Visible="false" CssClass="paddingTop">
												<dnn:Label ID="lblAmazonVideoStandardThumb" runat="server" Text="Select predefined thumbnail:" HelpText="Select one of predefined thumbnails. Location - ModulePath/Thumbs/Video." ControlName="ddlAmazonVideoThumbSelect" ResourceKey="lblVideoStandardThumbSelect.Text." />
												<div class="styledSelect">
													<asp:DropDownList ID="ddlAmazonVideoThumbSelect" runat="server"></asp:DropDownList>
												</div>
												<asp:RequiredFieldValidator ID="rfvAmazonVideoThumbSelect" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlAmazonVideoThumbSelect" ValidationGroup="vgAmazonVideoUpload" InitialValue="0" resourcekey="rfvValue.ErrorMessage" Display="Dynamic" CssClass="smallInfo error" />
											</asp:Panel>
										</td>
									</tr>
									<tr>
										<td>
											<dnn:Label ID="lblEmbedAmazonVideoStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
										</td>
										<td>
											<div class="styledCheckbox noLabel">
												<asp:CheckBox ID="cbAmazonVideoStartExpire" runat="server" Checked="false" Text="Add start/expire date" />
											</div>
										</td>
									</tr>
								</table>
								<asp:Panel ID="divAmazonVideoStartExpire" runat="server" Style="display: none;" CssClass="optionsPanel paddingTop">
									<table>
										<tr>
											<td class="labels">
												<dnn:Label ID="lblAmazonVideoStartDate" runat="server" HelpText="Items will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
											</td>
											<td>
												<asp:TextBox ID="tbxAmazonVideoStartDate" runat="server" CssClass="textCenter" ValidationGroup="vgAmazonVideoUpload" Width="90px" />
												<i class="fa fa-calendar"></i>
												<asp:RequiredFieldValidator ID="rfvAmazonVideoStartDate" runat="server" ControlToValidate="tbxAmazonVideoStartDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error" />
												<asp:Label ID="lblAmazonVideoPubDateError" ResourceKey="lblPubDateError" runat="server" Display="Dynamic" Text="Invalid date." Visible="false" />
												<asp:TextBox ID="tbxAmazonVideoStartTime" runat="server" ValidationGroup="vgAmazonVideoUpload" CssClass="textCenter small" />
												<i class="fa fa-clock-o"></i>
												<asp:RegularExpressionValidator ID="revAmazonVideoStartTime" runat="server" ControlToValidate="tbxAmazonVideoStartTime" ErrorMessage="hh:mm" Display="Dynamic" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error" />
												<asp:RequiredFieldValidator ID="rfvAmazonVideoStartTime" runat="server" ControlToValidate="tbxAmazonVideoStartTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error" />
											</td>
										</tr>
										<tr>
											<td class="labels">
												<dnn:Label ID="lblAmazonVideoEndDate" runat="server" HelpText="Items will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
											</td>
											<td>
												<asp:TextBox ID="tbxAmazonVideoEndDate" runat="server" CssClass="textCenter" ValidationGroup="vgAmazonVideoUpload" Width="90px" />
												<i class="fa fa-calendar"></i>
												<asp:RequiredFieldValidator ID="rfvAmazonVideoEndDate" runat="server" ControlToValidate="tbxAmazonVideoEndDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error" />
												<asp:Label ID="lblAmazonVideoExpireDateError" resourcekey="lblExpireDateError" runat="server" Display="Dynamic" Text="Invalid date." Visible="false" CssClass="smallInfo error" />
												<asp:TextBox ID="tbxAmazonVideoEndTime" runat="server" ValidationGroup="vgAmazonVideoUpload" CssClass="textCenter small" />
												<i class="fa fa-clock-o"></i>
												<asp:RegularExpressionValidator ID="revAmazonVideoEndTime" runat="server" Display="Dynamic" ControlToValidate="tbxAmazonVideoEndTime" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error" />
												<asp:RequiredFieldValidator ID="rfvAmazonVideoEndTime" runat="server" ControlToValidate="tbxAmazonVideoEndTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error" />
											</td>
										</tr>
									</table>
								</asp:Panel>
							</div>
							<asp:Label ID="lblAmazonVideoErr" runat="server" EnableViewState="False" CssClass="infoMessages error static" Visible="false" />
							<div class="mainActions">
								<asp:LinkButton ID="btnAmazonVideoUpload" runat="server" Text="Upload" ValidationGroup="vgAmazonVideoUpload" resourcekey="btnUpload.Text" CausesValidation="True" OnClick="btnAmazonVideoUpload_Click" CssClass="add" />
							</div>
						</asp:Panel>
					</asp:Panel>
					<asp:Panel ID="pnlViewAddHTML" runat="server" Visible="false" CssClass="contentSection addHtml">
						<div class="specialOptions">
							<h2>
								<asp:Label ID="lblAddHTML" resourcekey="lblAddHTML.Text" runat="server" Text="Add HTML" />
							</h2>
						</div>
						<div class="content">
							<div class="optionsPanel">
								<table>
									<tr>
										<td colspan="2">
											<dnn:Label ID="lblAddHTMLTitle" runat="server" Text="Title:" HelpText="Enter a title." ResourceKey="lblAddHTMLTitle.Text" HelpKey="lblAddHTMLTitle.HelpKey" ControlName="tbxHTMLContentTitle" />
											<asp:TextBox ID="tbxHTMLContentTitle" runat="server" CssClass="fullWidth" EnableViewState="False" />
										</td>
									</tr>
									<tr>
										<td>
											<dnn:Label ID="lblAddHTMLContent" runat="server" HelpText="Add the slide content in HTML form. Some slideshows don't support HTML.  " Text="HTML:" ResourceKey="lblAddHTMLContent.Text" HelpKey="lblAddHTMLContent.HelpKey" ControlName="txtHTMLContent" />
										</td>
										<td></td>
									</tr>
									<tr>
										<td colspan="2">
											<dnn:TextEditor ID="txtHTMLContent" runat="server" ChooseMode="True" ChooseRender="True" EnableTheming="True" EnableViewState="True" Height="500px" HtmlEncode="False" Width="1090px" />
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblHTMLThumb" runat="server" ControlName="rblHTMLThumb" HelpKey="lblHTMLThumb.HelpKey" HelpText="Upload a new thumbnail for the slide or use a predefined thumbnail. Some slideshows require a thumbnail to work correctly. ." ResourceKey="lblHTMLThumb.Text" Text="Thumbnail for slide:" />
										</td>
										<td>
											<asp:RadioButtonList ID="rblHTMLThumbSelect" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblHTMLThumbSelect_SelectedIndexChanged" CssClass="styledRadio small">
												<asp:ListItem resourcekey="ddlliVideoThumbStandard.Text" Selected="True" Text="Use standard image" Value="standardThumb" />
												<asp:ListItem resourcekey="ddlliVideoThumbUpload.Text" Text="Upload thumbnail" Value="uploadThumb" />
											</asp:RadioButtonList>
											<asp:Panel ID="pnlHTMLThumbUpload" runat="server" Visible="false" CssClass="paddingTop">
												<dnn:Label ID="lblHTMLThumbUpload" runat="server" Text="Select Thumbnail:" HelpText="Select thumbnail to upload. (Thumbnail is uploaded to List Content, location - Portals/PortalID/EasyDNNRotator/Originals/ListID/HTML/)" ResourceKey="lblHTMLThumbUpload.Text" HelpKey="lblHTMLThumbUpload.HelpKey" ControlName="fuHTMLThumb" />
												<asp:FileUpload ID="fuHTMLThumb" runat="server" />
											</asp:Panel>
											<asp:Panel runat="server" ID="pnlHTMLStandardThumb" Visible="false" CssClass="paddingTop">
												<dnn:Label ID="lblHTMLStandardThumb" runat="server" Text="Select standard thumbnail:" HelpText="Select one of predefined thumbnails. Location - ModulePath/Thumbs/HTML/." ResourceKey="lblHTMLStandardThumbSelect.Text" HelpKey="lblHTMLStandardThumbSelect.HelpKey" ControlName="ddlHTMLThumbSelect" />
												<div class="styledSelect">
													<asp:DropDownList ID="ddlHTMLThumbSelect" runat="server" />
												</div>
												<asp:RequiredFieldValidator ID="rfvHTMLThumbSelect" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlHTMLThumbSelect" ValidationGroup="vgAddHTML" InitialValue="0" resourcekey="rfvValue.ErrorMessage" Display="Dynamic" CssClass="smallInfo error" />
											</asp:Panel>
										</td>
									</tr>
									<tr>
										<td class="labels">
											<dnn:Label ID="lblHTMLStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
										</td>
										<td>
											<div class="styledCheckbox noLabel">
												<asp:CheckBox ID="cbHTMLStartExpire" runat="server" Checked="false" Text="Add start/expire date" />
											</div>
										</td>
									</tr>
								</table>
								<asp:Panel ID="divHTMLStartExpire" runat="server" Style="display: none;" CssClass="optionsPanel paddingTop">
									<table>
										<tr>
											<td class="labels">
												<dnn:Label ID="lblHTMLStartDate" runat="server" HelpText="HTML will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
											</td>
											<td>
												<asp:TextBox ID="tbxHTMLStartDate" runat="server" CssClass="textCenter" ValidationGroup="vgAddHTML" Width="90px" />
												<i class="fa fa-calendar"></i>
												<asp:RequiredFieldValidator ID="rfvHTMLStartDate" runat="server" ControlToValidate="tbxHTMLStartDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="vgAddHTML" CssClass="smallInfo error" />
												<asp:Label ID="lblHTMLPubDateError" ResourceKey="lblPubDateError" runat="server" Display="Dynamic" Text="Invalid date." Visible="false" CssClass="smallInfo error" />
												<asp:TextBox ID="tbxHTMLStartTime" runat="server" ValidationGroup="vgAddHTML" Width="70px" CssClass="textCenter" />
												<i class="fa fa-clock-o"></i>
												<asp:RegularExpressionValidator ID="revHTMLStartTime" runat="server" ControlToValidate="tbxHTMLStartTime" ErrorMessage="hh:mm" Display="Dynamic" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAddHTML" CssClass="smallInfo error" />
												<asp:RequiredFieldValidator ID="rfvHTMLStartTime" runat="server" ControlToValidate="tbxHTMLStartTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="vgAddHTML" CssClass="smallInfo error" />
											</td>
										</tr>
										<tr>
											<td class="labels">
												<dnn:Label ID="lblHTMLEndDate" runat="server" HelpText="Image will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
											</td>
											<td>
												<asp:TextBox ID="tbxHTMLEndDate" runat="server" CssClass="textCenter" ValidationGroup="vgAddHTML" Width="90px" />
												<i class="fa fa-calendar"></i>
												<asp:RequiredFieldValidator ID="rfvHTMLEndDate" runat="server" ControlToValidate="tbxHTMLEndDate" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="vgAddHTML" CssClass="smallInfo error" />
												<asp:Label ID="lblHTMLExpireDateError" resourcekey="lblExpireDateError" runat="server" Text="Invalid date." Visible="false" Display="Dynamic" CssClass="smallInfo error" />
												<asp:TextBox ID="tbxHTMLEndTime" runat="server" ValidationGroup="vgAddHTML" Width="70px" CssClass="textCenter" />
												<i class="fa fa-clock-o"></i>
												<asp:RegularExpressionValidator ID="revHTMLEndTime" runat="server" ControlToValidate="tbxHTMLEndTime" ErrorMessage="hh:mm" Display="Dynamic" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAddHTML" CssClass="smallInfo error" />
												<asp:RequiredFieldValidator ID="rfvHTMLEndTime" runat="server" ControlToValidate="tbxHTMLEndTime" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="vgAddHTML" CssClass="smallInfo error" />
											</td>
										</tr>
									</table>
								</asp:Panel>
								<asp:Label ID="lblHTMLUploadInfo" runat="server" EnableViewState="False" CssClass="infoMessages error static" Visible="false" />
								<div class="mainActions">
									<asp:LinkButton ID="btnAddHTMLContent" runat="server" resourcekey="btnUpload.Text" Text="Upload" OnClick="btnHTMLSave_Click" CausesValidation="true" ValidationGroup="vgAddHTML" CssClass="add" />
								</div>
							</div>
						</div>
					</asp:Panel>
				</asp:Panel>
				<asp:Panel ID="pnlEditContent" runat="server" Visible="false">
					<asp:Panel ID="pnlEditRotationItem" runat="server" Visible="false" CssClass="listItems additionalOptions imageEdit">
						<h2>
							<asp:Label ID="lblEditImageContentTitle" resourcekey="lblEditImageContentTitle.Text" runat="server" Text="Edit image content" />
						</h2>
						<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
							<tr>
								<td colspan="2" class="textRight">
									<div class="itemActions itemEditActions">
										<asp:LinkButton ID="btnLocalizeImageContent" runat="server" Text="Localize content" ResourceKey="btnLocalizeContent.Text" ToolTip="Localize Content" OnClick="btnLocalizeImageContent_Click" CssClass="itemEditUpdate" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditImageTitle" runat="server" Text="Title:" ControlName="tbEditTitle" HelpText="Enter title." ResourceKey="lblEditImageTitle.Text" HelpKey="lblEditImageTitle.HelpKey" />
								</td>
								<td>
									<asp:TextBox ID="tbEditTitle" runat="server" CssClass="large" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditImageSubtitle" runat="server" HelpText="Enter Subtitle." ControlName="tbxEnterSubtitle" Text="Subtitle:" ResourceKey="lblEditImageSubtitle.Text" HelpKey="lblEditImageSubtitle.HelpKey" />
								</td>
								<td>
									<asp:TextBox ID="tbxEnterSubtitle" runat="server" CssClass="large" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditImageDescription" runat="server" Text="Description:" ControlName="txtEditHTMLDescription" HelpText="Enter description of image." ResourceKey="lblEditImageDescription.Text" HelpKey="lblEditImageDescription.HelpKey" />
								</td>
								<td>
									<dnn:TextEditor ID="txtEditHTMLDescription" runat="server" Height="350px" Width="600px" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditImageLink" runat="server" Text="Link:" ControlName="tbEditLink" HelpText="Link for image content." ResourceKey="lblEditImageLink.Text" HelpKey="lblEditImageLink.HelpKey" />
								</td>
								<td>
									<asp:TextBox ID="tbEditLink" runat="server" CssClass="large" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditImageDirectory" runat="server" Text="Image Directory:" ControlName="lblimgDirectoryVal" HelpText="Image path." ResourceKey="lblEditImageDirectory.Text" HelpKey="lblEditImageDirectory.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblimgDirectoryVal" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditImageName" runat="server" Text="Image Saved Name:" ControlName="lblimgSavedNameVal" HelpText="Name of image file." ResourceKey="lblEditImageName.Text" HelpKey="lblEditImageName.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblimgSavedNameVal" runat="server" Text="Label" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditImageThumb" runat="server" Text="Thumb picture:" ControlName="imgpictureThumb" HelpText="Thumb picture" ResourceKey="lblEditImageThumb.Text" HelpKey="lblEditImageThumb.HelpKey" />
								</td>
								<td>
									<asp:HyperLink ID="hyppictureThumb" Target="_blank" runat="server" CssClass="thumbnail">
										<asp:Image ID="imgpictureThumb" runat="server" />
									</asp:HyperLink>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lbleditImageChangePicture" runat="server" ControlName="fuPictureUpdate" Text="Change current Picture:" HelpText="Upload and change picture." ResourceKey="lbleditImageChangePicture.Text" HelpKey="lbleditImageChangePicture.HelpKey" />
								</td>
								<td>
									<asp:FileUpload ID="fuPictureUpdate" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
								</td>
								<td>
									<div class="styledCheckbox noLabel">
										<asp:CheckBox ID="cbEditStartExpire" runat="server" Checked="false" Text="Add start/expire date" />
									</div>
								</td>
							</tr>
						</table>
						<asp:Panel ID="divEditImageStartExpire" runat="server" Style="display: none;">
							<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditStartDate" runat="server" HelpText="Items will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditStartDate" runat="server" CssClass="textCenter" ValidationGroup="vgImageEdit" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditStartDate" runat="server" ControlToValidate="tbxEditStartDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="vgImageEdit" />
										<asp:Label ID="lblEditPubDateError" ResourceKey="lblPubDateError" runat="server" CssClass="smallInfo error" Text="Invalid date." Visible="false" />
										<asp:TextBox ID="tbxEditStartTime" runat="server" ValidationGroup="vgImageEdit" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditStartTime" runat="server" ControlToValidate="tbxEditStartTime" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgImageEdit" CssClass="smallInfo error" />
										<asp:RequiredFieldValidator ID="rfvEditStartTime" runat="server" ControlToValidate="tbxEditStartTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="vgImageEdit" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditEndDate" runat="server" HelpText="Items will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditEndDate" runat="server" CssClass="textCenter" ValidationGroup="vgImageEdit" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditEndDate" runat="server" ControlToValidate="tbxEditEndDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ValidationGroup="vgImageEdit" ResourceKey="rfvEndDate.ErrorMessage" />
										<asp:Label ID="lblEditExpireDateError" resourcekey="lblExpireDateError" runat="server" Text="Invalid date." Visible="false" CssClass="smallInfo error" />
										<asp:TextBox ID="tbxEditEndTime" runat="server" ValidationGroup="vgImageEdit" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditEndTime" runat="server" ControlToValidate="tbxEditEndTime" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgImageEdit" CssClass="smallInfo error" />
										<asp:RequiredFieldValidator ID="rfvEditEndTime" runat="server" ControlToValidate="tbxEditEndTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="vgImageEdit" />
									</td>
								</tr>
							</table>
						</asp:Panel>
						<asp:Label ID="lblErrorEditSave" runat="server" EnableViewState="False" CssClass="infoMessages error static" Visible="false" />
						<div class="mainActions">
							<asp:LinkButton ID="btnEditContSave" runat="server" Text="Save" OnClick="btnEditContSave_Click" ResourceKey="btnEditImageSave.Text" ToolTip="Save Edit Image" CausesValidation="False" CssClass="downSaveClose" />
							<asp:LinkButton ID="btnCancle" runat="server" Text="Close" OnClick="btnCancle_Click" ResourceKey="btnEditImageclose.Text" ToolTip="Close Edit Image" CssClass="downClose" />
						</div>
					</asp:Panel>
					<asp:Panel ID="pnlAmazonEditVideo" runat="server" Visible="false" CssClass="listItems additionalOptions videoEdit">
						<h2>
							<asp:Label ID="lblAmazonEditVideoInfo" runat="server" Text="Edit External video link" />
						</h2>
						<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
							<tr>
								<td colspan="2" class="textRight">
									<div class="itemActions itemEditActions">
										<asp:LinkButton ID="Button1" runat="server" Text="Localize content" ResourceKey="btnLocalizeContent.Text" ToolTip="Localize Content" OnClick="btnVideoContentLoc_Click" CssClass="itemEditUpdate" Visible='<%#LocalizationEnabled%>' />
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblAmazonEditVideoURL" runat="server" Text="External video URL link:" HelpText="Aamazon S3..." ControlName="tbxAmazonEditVideoURL" />
								</td>
								<td>
									<asp:TextBox ID="tbxAmazonEditVideoURL" runat="server" CssClass="large" ValidationGroup="vgAmazonVideoUpload" />
									<asp:RequiredFieldValidator ID="rfvAmazonEditVideoURL" runat="server" ControlToValidate="tbxAmazonEditVideoURL" ErrorMessage="This filed is required." resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblAmazonEditVideoTitle" runat="server" Text="Title:" HelpText="Enter title." ControlName="tbxAmazonVideoTitle" />
								</td>
								<td>
									<asp:TextBox ID="tbxAmazonEditVideoTitle" runat="server" CssClass="large" EnableViewState="False" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblAmazonEditVideoDescription" runat="server" ControlName="tbxAmazonVideoUploadDescription" HelpText="Enter the video description:" Text="Description:" />
								</td>
								<td>
									<asp:TextBox ID="tbxAmazonEditVideoDescription" runat="server" CssClass="large" Height="150px" MaxLength="4000" TextMode="MultiLine" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblAmazonEditUploadWidth" runat="server" ControlName="tbxAmazonEditUploadWidth" HelpText="Enter the video width to be used displaying video." Text="Video width:" />
								</td>
								<td>
									<asp:TextBox ID="tbxAmazonEditUploadWidth" runat="server" ValidationGroup="vgAmazonVideoUpload" CssClass="small textCenter" Text="480" />
									<asp:CompareValidator ID="cvAmazonEditUploadWidth" runat="server" ControlToValidate="tbxAmazonEditUploadWidth" ErrorMessage="Please enter number only." Operator="DataTypeCheck" Type="Integer" ValidationGroup="vgAmazonVideoUpload"></asp:CompareValidator>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblAmazonEditUploadHeight" runat="server" ControlName="tbxAmazonEditUploadHeight" HelpText="Enter the video height to be used when displaying video." Text="Video height:" />
								</td>
								<td>
									<asp:TextBox ID="tbxAmazonEditUploadHeight" runat="server" CssClass="small textCenter" ValidationGroup="vgAmazonVideoUpload" Text="360" />
									<asp:CompareValidator ID="cvAmazonEditUploadHeight" runat="server" ControlToValidate="tbxAmazonEditUploadHeight" ErrorMessage="Please enter number only." Operator="DataTypeCheck" Type="Integer" ValidationGroup="vgAmazonVideoUpload"></asp:CompareValidator>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblAmazonEditVideoPathinfo" runat="server" Text="External video URL link:" ControlName="lblAmazonEditVideoPath" HelpText="External video URL link." />
								</td>
								<td>
									<asp:Label ID="lblAmazonEditVideoPath" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblAmazonEditVideoThumbDirectory" runat="server" Text="Video thumb directory path:" ControlName="lblAmazonditVideothumbPath" HelpText="Video thumb path." />
								</td>
								<td>
									<asp:Label ID="lblAmazonEditVideoThumbPath" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="Label9" runat="server" ControlName="lblAmazonEditVideoThumbName" Text="Video thumb saved name:" />
								</td>
								<td>
									<asp:Label ID="lblAmazonEditVideoThumbName" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblAmazonEditVideoThumbinfo" runat="server" ControlName="imgpictureThumb" Text="Video Thumb:" />
								</td>
								<td>
									<asp:HyperLink ID="hylAmazonEditVideoThumb" runat="server" Target="_blank" CssClass="thumbnail">
										<asp:Image ID="imgAmazonEditVideoThumb" runat="server" />
									</asp:HyperLink>
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblAmazonEditVideoThumbUpdate" runat="server" ControlName="rblAmazonEditVideoThumbSelect" HelpText="Update the thumbnail for video file or use standard image. Some rotators must have thumbnail to work properly." Text="Update Video Thumbnail:" />
								</td>
								<td>
									<asp:RadioButtonList ID="rblAmazonEditVideoThumbSelect" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblAmazonEditVideoThumbSelect_SelectedIndexChanged" CssClass="styledRadio small">
										<asp:ListItem resourcekey="NoUpdateThumb.Text" Selected="True" Text="Don't update thumb" Value="NoUpdateThumb" />
										<asp:ListItem resourcekey="ddlliVideoThumbStandard.Text" Text="Use standard image" Value="standardThumb" />
										<asp:ListItem resourcekey="ddlliVideoThumbUpload.Text" Text="Upload thumbnail" Value="uploadThumb" />
									</asp:RadioButtonList>
									<asp:Panel ID="pnlAmazonEditVideoThumbUpload" runat="server" Visible="false" CssClass="paddingTop">
										<dnn:Label ID="lblAmazonEditVideoThumbUpload" runat="server" ControlName="fuAmazonEditVideoThumb" HelpText="Select thumbnail to upload. (Thumbnail is uploaded to List Content, location - Portals/PortalID/EasyDNNRotator/Originals/ListID/VideoThumb/)" Text="Select Thumbnail:" />
										<asp:FileUpload ID="fuAmazonEditVideoThumb" runat="server" />
									</asp:Panel>
									<asp:Panel ID="pnlAmazonEditVideoThumbSelect" runat="server" Visible="false" CssClass="paddingTop">
										<dnn:Label ID="lblAmazonEditVideoThumbSelect" runat="server" ControlName="ddlAmazonEditVideoThumbSelect" HelpText="Select one of predefined thumbnails. Location - ModulePath/Thumbs/Video." Text="Select standard thumbnail:" />
										<div class="styledSelect">
											<asp:DropDownList ID="ddlAmazonEditVideoThumbSelect" runat="server"></asp:DropDownList>
										</div>
										<asp:RequiredFieldValidator ID="rfvAmazonEditVideoThumbSelect" runat="server" ControlToValidate="ddlAmazonEditVideoThumbSelect" Display="Dynamic" ErrorMessage="RequiredFieldValidator" InitialValue="0" resourcekey="rfvValue.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error" />
									</asp:Panel>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditAmazonVideoStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
								</td>
								<td>
									<div class="styledCheckbox noLabel">
										<asp:CheckBox ID="cbEditAmazonVideoStartExpire" runat="server" Checked="false" Text="Add start/expire date" />
									</div>
								</td>
							</tr>
						</table>
						<asp:Panel ID="divEditAmazonVideoStartExpire" runat="server" Style="display: none;">
							<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditAmazonVideoStartDate" runat="server" HelpText="Items will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditAmazonVideoStartDate" runat="server" CssClass="textCenter" ValidationGroup="vgAmazonVideoUpload" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditAmazonVideoStartDate" runat="server" ControlToValidate="tbxEditAmazonVideoStartDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" />
										<asp:Label ID="lblEditAmazonVideoPubDateError" ResourceKey="lblPubDateError" runat="server" CssClass="smallInfo error" Text="Invalid date." Visible="false" />
										<asp:TextBox ID="tbxEditAmazonVideoStartTime" runat="server" ValidationGroup="vgAmazonVideoUpload" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditAmazonVideoStartTime" runat="server" ControlToValidate="tbxEditAmazonVideoStartTime" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAmazonVideoUpload" />
										<asp:RequiredFieldValidator ID="rfvEditAmazonVideoStartTime" runat="server" ControlToValidate="tbxEditAmazonVideoStartTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditAmazonVideoEndDate" runat="server" HelpText="Items will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditAmazonVideoEndDate" runat="server" CssClass="textCenter" ValidationGroup="vgAmazonVideoUpload" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditAmazonVideoEndDate" runat="server" ControlToValidate="tbxEditAmazonVideoEndDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" />
										<asp:Label ID="lblEditAmazonVideoExpireDateError" resourcekey="lblExpireDateError" runat="server" Text="Invalid date." Visible="false" CssClass="smallInfo error" />
										<asp:TextBox ID="tbxEditAmazonVideoEndTime" runat="server" ValidationGroup="vgAmazonVideoUpload" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditAmazonVideoEndTime" runat="server" ControlToValidate="tbxEditAmazonVideoEndTime" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgAmazonVideoUpload" CssClass="smallInfo error" />
										<asp:RequiredFieldValidator ID="rfvEditAmazonVideoEndTime" runat="server" ControlToValidate="tbxEditAmazonVideoEndTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="vgAmazonVideoUpload" />
									</td>
								</tr>
							</table>
						</asp:Panel>
						<asp:Label ID="lblAmazonEditVideoErrInfo" runat="server" EnableViewState="false" CssClass="infoMessages error static" Visible="false" />
						<div class="mainActions">
							<asp:LinkButton ID="btnAmazonEditVideoUpdate" runat="server" Text="Save" ValidationGroup="vgAmazonVideoUpload" resourcekey="btnEditVideoUpdate.Text" CausesValidation="True" OnClick="btnAmazonEditVideoUpdate_Click" CssClass="downSaveClose" />
							<asp:LinkButton ID="Button3" runat="server" Text="Close" OnClick="btnCancle_Click" ResourceKey="btnEditVideoClose.Text" ToolTip="Close Edit Video" CssClass="downClose" />
						</div>
					</asp:Panel>
					<asp:Panel ID="pnlEditVideo" runat="server" Visible="false" CssClass="listItems additionalOptions videoEdit">
						<h2>
							<asp:Label ID="lblEditVideoInfo" resourcekey="lblEditVideo.Text" runat="server" Text="Edit video" />
						</h2>
						<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
							<tr>
								<td colspan="2" class="textRight">
									<div class="itemActions itemEditActions">
										<asp:LinkButton ID="btnEditVideoLocalize" runat="server" Text="Localize content" ResourceKey="btnLocalizeContent.Text" ToolTip="Localize Content" OnClick="btnVideoContentLoc_Click" CssClass="itemEditUpdate" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditVideoTitle" runat="server" Text="Title:" HelpText="Enter title." ResourceKey="lblAddVideoTitle.Text" HelpKey="lblAddVideoTitle.HelpKey" ControlName="tbxVideoTitle" />
								</td>
								<td>
									<asp:TextBox ID="tbxEditVideoTitle" runat="server" CssClass="large" EnableViewState="False" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditVideoDescription" runat="server" ControlName="tbVideoUploadDescription" HelpKey="lblVideoUploadDescription.HelpKey" HelpText="Enter the video description:" ResourceKey="lblVideoUploadDescription.Text" Text="Description:" />
								</td>
								<td>
									<asp:TextBox ID="tbxEditVideoDescription" runat="server" Height="150px" MaxLength="4000" TextMode="MultiLine" CssClass="large" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditUploadWidth" runat="server" ControlName="tbVideoUploadWidth" HelpKey="lblVideoUploadWidth.HelpKey" HelpText="Enter the video width to be used displaying video." ResourceKey="lblVideoUploadWidth.Text" Text="Video width:" />
								</td>
								<td>
									<asp:TextBox ID="tbxEditUploadWidth" runat="server" ValidationGroup="vgVideoUpload" CssClass="small textCenter" Text="480" />
									<asp:CompareValidator ID="cvEditUploadWidth" runat="server" ControlToValidate="tbxEditUploadWidth" ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadWidth.ErrorMessage" Type="Integer" ValidationGroup="vgEditVideo"></asp:CompareValidator>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="Label10" runat="server" ControlName="tbVideoUploadHeight" HelpKey="VideoUploadHeight.HelpKey" HelpText="Enter the video height to be used when displaying video." ResourceKey="lblVideoUploadHeight.Text" Text="Video height:" />
								</td>
								<td>
									<asp:TextBox ID="tbxEditUploadHeight" runat="server" CssClass="small textCenter" Text="360" />
									<asp:CompareValidator ID="cvEditUploadHeight" runat="server" ControlToValidate="tbxEditUploadHeight" ErrorMessage="Please enter number only." Operator="DataTypeCheck" resourcekey="cvVideoUploadHeight.ErrorMessage" Type="Integer" ValidationGroup="vgEditVideo"></asp:CompareValidator>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditVideoPathinfo" runat="server" Text="Video Directory path:" ControlName="lblEditVideoPath" HelpText="Video path." ResourceKey="lblEditVideoDirectory.Text" HelpKey="lblEditVideoDirectory.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblEditVideoPath" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditVideoNameInfo" runat="server" Text="Video Saved Name:" ControlName="lblimgSavedNameVal" HelpText="Name of video file." ResourceKey="lblEditVideoName.Text" HelpKey="lblEditVideoName.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblEditVideoName" runat="server" Text="Label" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="Label3" runat="server" Text="Video thumb directory path:" ControlName="lblEditVideoPath" HelpText="Video thumb path." ResourceKey="lblEditVideoThumbDirectory.Text" HelpKey="lblEditVideoThumbDirectory.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblEditVideothumbPath" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="Label8" runat="server" ControlName="lblimgSavedNameVal" HelpKey="lblEditVideoThumbName.HelpKey" HelpText="Name of video thumb file." ResourceKey="lblEditVideoThumbName.Text" Text="Video thumb saved name:" />
								</td>
								<td>
									<asp:Label ID="lblEditVideoThumbName" runat="server" Text="Label" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditVideoThumbinfo" runat="server" ControlName="imgpictureThumb" HelpKey="lblEditVideoThumb.HelpKey" HelpText="Video Thumb" ResourceKey="lblEditVideoThumb.Text" Text="Video Thumb:" />
								</td>
								<td>
									<asp:HyperLink ID="hylEditVideoThumb" runat="server" Target="_blank" CssClass="thumbnail">
										<asp:Image ID="IimgEditVideoThumb" runat="server" />
									</asp:HyperLink>
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditVideoThumbUpdate" runat="server" ControlName="rblVideoThumbnailSelect" HelpKey="lblEditVideoThumbUpdate.HelpKey" HelpText="Update the thumbnail for video file or use standard image. Some rotators must have thumbnail to work properly." ResourceKey="lblEditVideoThumbUpdate.Text" Text="Update Video Thumbnail:" />
								</td>
								<td>
									<asp:RadioButtonList ID="rblEditVideoThumbSelect" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblEditVideoThumbSelect_SelectedIndexChanged" CssClass="styledRadio small">
										<asp:ListItem resourcekey="NoUpdateThumb.Text" Selected="True" Text="Don't update thumb" Value="NoUpdateThumb" />
										<asp:ListItem resourcekey="ddlliVideoThumbStandard.Text" Text="Use standard image" Value="standardThumb" />
										<asp:ListItem resourcekey="ddlliVideoThumbUpload.Text" Text="Upload thumbnail" Value="uploadThumb" />
									</asp:RadioButtonList>
									<asp:Panel ID="pnlEditVideoThumbUpload" runat="server" Visible="false" CssClass="paddingTop">
										<dnn:Label ID="lblEditVideoThumbUpload" runat="server" ControlName="fuEditVideoThumb" HelpKey="lblVideoThumbUpload.HelpKey" HelpText="Select thumbnail to upload. (Thumbnail is uploaded to List Content, location - Portals/PortalID/EasyDNNRotator/Originals/ListID/VideoThumb/)" ResourceKey="lblVideoThumbUpload.Text" Text="Select Thumbnail:" />
										<asp:FileUpload ID="fuEditVideothumb" runat="server" />
									</asp:Panel>
									<asp:Panel ID="pnlEditVideoThumbSelect" runat="server" Visible="false" CssClass="paddingTop">
										<dnn:Label ID="lblEditVideoThumbSelect" runat="server" ControlName="ddlEditVideoThumbSelect" HelpKey="lblVideoStandardThumbSelect.HelpKey" HelpText="Select one of predefined thumbnails. Location - ModulePath/Thumbs/Video." ResourceKey="lblVideoStandardThumbSelect.Text" Text="Select standard thumbnail:" />
										<div class="styledSelect">
											<asp:DropDownList ID="ddlEditVideoThumbSelect" runat="server"></asp:DropDownList>
										</div>
										<asp:RequiredFieldValidator ID="rfvEditVideoThumbSelect" runat="server" ControlToValidate="ddlEditVideoThumbSelect" Display="Dynamic" ErrorMessage="RequiredFieldValidator" InitialValue="0" resourcekey="rfvValue.ErrorMessage" ValidationGroup="vgEditVideo" CssClass="smallInfo error" />
									</asp:Panel>
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="Label7" runat="server" ControlName="rblEditVideoUpdate" HelpKey="lblAddVideoUpdate.HelpKey" HelpText="Update video." ResourceKey="lblAddVideoUpdate.Text" Text="Video update:" />
								</td>
								<td>
									<asp:RadioButtonList ID="rblEditVideoUpdate" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblEditVideoUpdate_SelectedIndexChanged" CssClass="styledRadio small">
										<asp:ListItem Selected="True" Text="Dont update video" Value="NoUpdateVideo" />
										<asp:ListItem Text="Update Video" Value="updateVideo" />
									</asp:RadioButtonList>
									<asp:Panel ID="pnlEditVideoVUpdate" runat="server" Visible="false" CssClass="paddingTop">
										<dnn:Label ID="lblEditVideofu" runat="server" ControlName="fuEditVideo" HelpKey="lblAddVideoUpload.HelpKey" HelpText="Select video for upload (mp4, flv, swf)." ResourceKey="lblAddVideoUpload.Text" Text="Video:" />
										<asp:FileUpload ID="fuEditVideo" runat="server" Width="400px" />
									</asp:Panel>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditVideoStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
								</td>
								<td>
									<div class="styledCheckbox noLabel">
										<asp:CheckBox ID="cbEditVideoStartExpire" runat="server" Checked="false" Text="Add start/expire date" />
									</div>
								</td>
							</tr>
						</table>
						<asp:Panel ID="divEditVideoStartExpire" runat="server" Style="display: none;">
							<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditVideoStartDate" runat="server" HelpText="Items will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditVideoStartDate" runat="server" CssClass="textCenter" ValidationGroup="vgEditVideo" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditVideoStartDate" runat="server" ControlToValidate="tbxEditVideoStartDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="vgEditVideo" />
										<asp:Label ID="lblEditVideoPubDateError" ResourceKey="lblPubDateError" runat="server" Text="Invalid date." Visible="false" CssClass="smallInfo error" />
										<asp:TextBox ID="tbxEditVideoStartTime" runat="server" ValidationGroup="tbxEditVideoStartDate" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditVideoStartTime" runat="server" ControlToValidate="tbxEditVideoStartTime" CssClass="smallInfo error" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgEditVideo" />
										<asp:RequiredFieldValidator ID="rfvEditVideoStartTime" runat="server" ControlToValidate="tbxEditVideoStartTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="vgEditVideo" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditVideoEndDate" runat="server" HelpText="Items will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditVideoEndDate" runat="server" CssClass="textCenter" ValidationGroup="vgEditVideo" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditVideoEndDate" runat="server" ControlToValidate="tbxEditVideoEndDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="vgEditVideo" />
										<asp:Label ID="lblEditVideoExpireDateError" resourcekey="lblExpireDateError" runat="server" CssClass="smallInfo error" Text="Invalid date." Visible="false" />
										<asp:TextBox ID="tbxEditVideoEndTime" runat="server" ValidationGroup="vgEditVideo" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditVideoEndTime" runat="server" ControlToValidate="tbxEditVideoEndTime" CssClass="smallInfo error" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgEditVideo" />
										<asp:RequiredFieldValidator ID="rfvEditVideoEndTime" runat="server" ControlToValidate="tbxEditVideoEndTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="vgEditVideo" />
									</td>
								</tr>
							</table>
						</asp:Panel>
						<asp:Label ID="lblEditVideoErrInfo" runat="server" EnableViewState="false" Visible="false" />
						<div class="mainActions">
							<asp:LinkButton ID="btnEditVideoUpdate" runat="server" Text="Save" ValidationGroup="vgEditVideo" resourcekey="btnEditVideoUpdate.Text" CausesValidation="True" OnClick="btnEditVideoUpdate_Click" CssClass="downSaveClose" />
							<asp:LinkButton ID="Button2" runat="server" Text="Close" OnClick="btnCancle_Click" ResourceKey="btnEditVideoClose.Text" ToolTip="Close Edit Video" CssClass="downClose" />
						</div>
					</asp:Panel>
					<asp:Panel ID="pnleditEmbedVideo" runat="server" Visible="false" CssClass="listItems additionalOptions videoEdit">
						<h2>
							<asp:Label ID="lblEditEmbedVideo" resourcekey="lblEditVideo.Text" runat="server" Text="Edit Embed video" />
						</h2>
						<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
							<tr>
								<td class="textRight" colspan="2">
									<div class="itemActions itemEditActions">
										<asp:LinkButton ID="btnEditEmbedLocalize" runat="server" Text="Localize content" ResourceKey="btnLocalizeContent.Text" ToolTip="Localize Content" OnClick="btnEmbedVideoContentLoc_Click" CssClass="itemEditUpdate" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditEmbedCode" ResourceKey="lblEmbedVideoCode" runat="server" Text="Embed code:" ControlName="tbxFlashEmbedUrl" HelpText="Enter video embed code:" HelpKey="lblEmbedVideoCode.HelpText" />
								</td>
								<td>
									<asp:TextBox ID="tbxEditEmbedUrl" runat="server" CssClass="large" MaxLength="2500" TextMode="MultiLine" Height="150px" ValidationGroup="EmbedVideo" />
									<asp:RequiredFieldValidator ID="rfvEditEmbedUrl" runat="server" ControlToValidate="tbxEditEmbedUrl" ErrorMessage="This filed is required." ValidationGroup="EditEmbedVideo" resourcekey="rfvEmbedVideoCodeResource1.ErrorMessage" CssClass="smallInfo error" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditEmbedShortUrl" ResourceKey="lblEembedVideoUrl" runat="server" Text="Video url:" ControlName="tbEmbedShortUrl" HelpText="Enter video url:" HelpKey="lblEembedVideoUrl.HelpText" />
								</td>
								<td>
									<asp:TextBox ID="tbxEditEmbedShortUrl" runat="server" CssClass="large" ValidationGroup="EmbedVideo" />
									<asp:RequiredFieldValidator ID="rfvEditEmbedShortUrl" runat="server" ControlToValidate="tbxEditEmbedShortUrl" ErrorMessage="This filed is required." ValidationGroup="EditEmbedVideo" resourcekey="rfvEmbedVideoURLResource1.ErrorMessage" CssClass="smallInfo error" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditEmbedTitle" ResourceKey="lblEmbedVideoEnterTitle" runat="server" Text="Video title:" ControlName="tbxFlashEmbedTitle" HelpText="Enter video title." HelpKey="lblEmbedVideoEnterTitle.HelpText" />
								</td>
								<td>
									<asp:TextBox ID="tbxEditEmbedTitle" runat="server" CssClass="large" ValidationGroup="EditEmbedVideo" />
									<asp:RequiredFieldValidator ID="rfvEditEmbedTitle" runat="server" ControlToValidate="tbxEditEmbedTitle" ErrorMessage="This filed is required." ValidationGroup="EditEmbedVideo" resourcekey="rfvEmbedVideoTitleResource1.ErrorMessage" CssClass="smallInfo error" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditEmbedDescription" ResourceKey="lblEmbedVideoDescription" runat="server" Text="Description:" ControlName="tbFlashEmbedDescription" HelpText="Enter video description." HelpKey="lblEmbedVideoDescription.HelpText" />
								</td>
								<td>
									<asp:TextBox ID="tbxEditEmbedDescription" runat="server" Height="150px" TextMode="MultiLine" CssClass="large" MaxLength="4000" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditEmbedThumbPath" runat="server" Text="Thumb directory path:" ControlName="lblimgDirectoryVal" HelpText="Embed video thumb path." ResourceKey="lblEditImageDirectory.Text" HelpKey="lblEditImageDirectory.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblEditEmbedThumbPathVal" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditEmbedVideoThumbName" runat="server" Text="Name of Thumb:" ControlName="lblimgSavedNameVal" HelpText="Name of thumb file." ResourceKey="lblEditImageName.Text" HelpKey="lblEditImageName.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblEditEmbedVideoThumbNameVal" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEmbedVideoThumbPic" runat="server" Text="Thumb picture:" ControlName="imgpictureThumb" HelpText="Thumb picture" ResourceKey="lblEditImageThumb.Text" HelpKey="lblEditImageThumb.HelpKey" />
								</td>
								<td>
									<asp:HyperLink ID="hyEditEmbedVideoThumbPic" Target="_blank" runat="server" CssClass="thumbnail">
										<asp:Image ID="imgEditEmbedVideoThumbPic" runat="server" />
									</asp:HyperLink>
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblChangeEditEmbedThumb" runat="server" ControlName="rblHTMLThumb" HelpKey="lblEditHTMLThumb.HelpKey" HelpText="Upload the thumbnail for Embed video content or use standard image. Some rotators must have thumbnail to work properly." ResourceKey="lblEditHTMLThumb.Text" Text="Change HTML Thumbnail:" />
								</td>
								<td>
									<asp:RadioButtonList ID="rblEditEmbedVideoThumbChange" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblEditEmbedVideoThumbChange_SelectedIndexChanged" CssClass="styledRadio small">
										<asp:ListItem resourcekey="NoUpdateThumb.Text" Selected="True" Text="Don't update thumb" Value="NoUpdateThumb" />
										<asp:ListItem resourcekey="ddlliVideoThumbStandard.Text" Text="Use standard image" Value="standardThumb" />
										<asp:ListItem resourcekey="ddlliVideoThumbUpload.Text" Text="Upload thumbnail" Value="uploadThumb" />
									</asp:RadioButtonList>
									<asp:Panel ID="pnlEditEmbedUploadThumb" runat="server" Visible="false" CssClass="paddingTop">
										<dnn:Label ID="Label17" runat="server" Text="Select Thumbnail:" HelpText="Select thumbnail to upload. (Thumbnail is uploaded to List Content, location - Portals/PortalID/EasyDNNRotator/Originals/ListID/Embed/)" ResourceKey="lblHTMLThumbUpload.Text" HelpKey="lblHTMLThumbUpload.HelpKey" ControlName="fuEditEmbedUploadThumb" />
										<asp:FileUpload ID="fuEditEmbedUploadThumb" runat="server" />
									</asp:Panel>
									<asp:Panel runat="server" ID="pnlEditEmbedStandardThumb" Visible="false" CssClass="paddingTop">
										<dnn:Label ID="Label18" runat="server" Text="Select standard thumbnail:" HelpText="Select one of predefined thumbnails. Location - ModulePath/Thumbs/HTML/." ResourceKey="lblHTMLStandardThumbSelect.Text" HelpKey="lblHTMLStandardThumbSelect.HelpKey" ControlName="ddlEditHTMLThumbSelect"></dnn:Label>
										<div class="styledSelect">
											<asp:DropDownList ID="ddlEditEmbedThumbSelect" runat="server"></asp:DropDownList>
										</div>
										<asp:RequiredFieldValidator ID="rfvEditEmbedThumbSelect" runat="server" ErrorMessage="rfvEditEmbedThumbSelect" ControlToValidate="ddlEditEmbedThumbSelect" ValidationGroup="EditEmbedVideo" InitialValue="0" resourcekey="rfvValue.ErrorMessage" Display="Dynamic" CssClass="smallInfo error" />
									</asp:Panel>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditEmbedVideoStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
								</td>
								<td>
									<div class="styledCheckbox noLabel">
										<asp:CheckBox ID="cbEditEmbedVideoStartExpire" runat="server" Checked="false" Text="Add start/expire date" />
									</div>
								</td>
							</tr>
						</table>
						<asp:Panel ID="divEditEmbedVideoStartExpire" runat="server" Style="display: none;">
							<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditEmbedVideoStartDate" runat="server" HelpText="Items will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditEmbedVideoStartDate" runat="server" CssClass="textCenter" ValidationGroup="EditEmbedVideo" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditEmbedVideoStartDate" runat="server" ControlToValidate="tbxEditEmbedVideoStartDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="EditEmbedVideo" />
										<asp:Label ID="lblEditEmbedVideoPubDateError" ResourceKey="lblPubDateError" runat="server" CssClass="smallInfo error" Text="Invalid date." Visible="false" />
										<asp:TextBox ID="tbxEditEmbedVideoStartTime" runat="server" ValidationGroup="EditEmbedVideo" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditEmbedVideoStartTime" runat="server" ControlToValidate="tbxEditEmbedVideoStartTime" CssClass="smallInfo error" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="EditEmbedVideo" />
										<asp:RequiredFieldValidator ID="rfvEditEmbedVideoStartTime" runat="server" ControlToValidate="tbxEditEmbedVideoStartTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="EditEmbedVideo" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditEmbedVideoEndDate" runat="server" HelpText="Items will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditEmbedVideoEndDate" runat="server" CssClass="textCenter" ValidationGroup="EditEmbedVideo" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditEmbedVideoEndDate" runat="server" ControlToValidate="tbxEditEmbedVideoEndDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="EditEmbedVideo" />
										<asp:Label ID="lblEditEmbedVideoExpireDateError" resourcekey="lblExpireDateError" runat="server" CssClass="smallInfo error" Text="Invalid date." Visible="false" />
										<asp:TextBox ID="tbxEditEmbedVideoEndTime" runat="server" ValidationGroup="EditEmbedVideo" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditEmbedVideoEndTime" runat="server" ControlToValidate="tbxEditEmbedVideoEndTime" CssClass="smallInfo error" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="EditEmbedVideo" />
										<asp:RequiredFieldValidator ID="rfvEditEmbedVideoEndTime" runat="server" ControlToValidate="tbxEditEmbedVideoEndTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="EditEmbedVideo" />
									</td>
								</tr>
							</table>
						</asp:Panel>
						<asp:Label ID="lblEditEmbedInfo" runat="server" EnableViewState="false" Visible="false" />
						<div class="mainActions">
							<asp:LinkButton ID="btnEditEmbedFlash_Click" runat="server" Text="Save" ResourceKey="btnEditHTMLSave.Text" ToolTip="Update Embed Video" CausesValidation="True" ValidationGroup="EditEmbedVideo" OnClick="btnEditEmbedFlash_Click_Click" CssClass="downSaveClose" />
							<asp:LinkButton ID="btnEditEmbedClose" runat="server" Text="Close" OnClick="btnCancle_Click" ResourceKey="btnEditHTMLClose.Text" ToolTip="Close Edit Embed Video" CssClass="downClose" />
						</div>
					</asp:Panel>
					<asp:Panel ID="pnlEditHTMLRotatorItem" runat="server" Visible="false" CssClass="listItems additionalOptions htmlEdit">
						<h2>
							<asp:Label ID="lblEditHTMLContentTitle" resourcekey="lblEditHTMLContentTitle.Text" runat="server" Text="Edit HTML rotator item:" />
						</h2>
						<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
							<tr>
								<td class="textRight" colspan="2">
									<div class="itemActions itemEditActions">
										<asp:LinkButton ID="btnHTMLContentLoc" runat="server" Text="Localize content" ResourceKey="btnLocalizeContent.Text" ToolTip="Localize Content" OnClick="btnHTMLContentLoc_Click" CssClass="itemEditUpdate" />
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditHTMLTitle" runat="server" Text="Title:" ControlName="tbxEditHTMLTitle" HelpText="Enter title." ResourceKey="lblEditHTMLTitle.Text" HelpKey="lblEditHTMLTitle.HelpKey" />
								</td>
								<td>
									<asp:TextBox ID="tbxEditHTMLTitle" runat="server" CssClass="large" EnableViewState="False" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<dnn:Label ID="lblEditHTMLContent" runat="server" ControlName="txtEditHTMLUpdate" HelpText="HTML content of one item." Text="HTML Content:" ResourceKey="lblEditHTMLContent.Text" HelpKey="lblEditHTMLContent.HelpKey" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<dnn:TextEditor ID="txtEditHTMLUpdate" runat="server" Height="500px" Width="1090px" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditHTMLThumbPath" runat="server" Text="Thumb Directory Path:" ControlName="lblimgDirectoryVal" HelpText="Thumb Image path." ResourceKey="lblEditImageDirectory.Text" HelpKey="lblEditImageDirectory.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblEditHTMLThumbPathVal" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditHTMLThumbName" runat="server" Text="Name of Thumb:" ControlName="lblimgSavedNameVal" HelpText="Name of thumb file." ResourceKey="lblEditImageName.Text" HelpKey="lblEditImageName.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblEditHTMLThumbNameVal" runat="server" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditHTMLThumbPicture" runat="server" Text="Thumb picture:" ControlName="imgpictureThumb" HelpText="Thumb picture" ResourceKey="lblEditImageThumb.Text" HelpKey="lblEditImageThumb.HelpKey" />
								</td>
								<td>
									<asp:HyperLink ID="hylEditHtmlThumb" Target="_blank" runat="server" CssClass="thumbnail">
										<asp:Image ID="imgEditHTMLThumb" runat="server" />
									</asp:HyperLink>
								</td>
							</tr>
							<tr>
								<td class="subjectName short textTop">
									<dnn:Label ID="lblEditHTML" runat="server" ControlName="rblHTMLThumb" HelpKey="lblEditHTMLThumb.HelpKey" HelpText="Upload the thumbnail for HTML content or use standard image. Some rotators must have thumbnail to work properly." ResourceKey="lblEditHTMLThumb.Text" Text="Change HTML Thumbnail:" />
								</td>
								<td>
									<asp:RadioButtonList ID="rblEditHTMLThumbChange" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblEditHTMLThumbChange_SelectedIndexChanged" CssClass="styledRadio small">
										<asp:ListItem resourcekey="NoUpdateThumb.Text" Selected="True" Text="Don't update thumb" Value="NoUpdateThumb" />
										<asp:ListItem resourcekey="ddlliVideoThumbStandard.Text" Text="Use standard image" Value="standardThumb" />
										<asp:ListItem resourcekey="ddlliVideoThumbUpload.Text" Text="Upload thumbnail" Value="uploadThumb" />
									</asp:RadioButtonList>
									<asp:Panel ID="pnlEditHTMLThumbUpload" runat="server" Visible="false" CssClass="paddingTop">
										<dnn:Label ID="Label4" runat="server" Text="Select Thumbnail:" HelpText="Select thumbnail to upload. (Thumbnail is uploaded to List Content, location - Portals/PortalID/EasyDNNRotator/Originals/ListID/HTML/)" ResourceKey="lblHTMLThumbUpload.Text" HelpKey="lblHTMLThumbUpload.HelpKey" ControlName="fuEditHTMLThumb" />
										<asp:FileUpload ID="fuEditHTMLThumb" runat="server" />
									</asp:Panel>
									<asp:Panel runat="server" ID="pnlEditHTMLThumbSelect" Visible="false" CssClass="paddingTop">
										<dnn:Label ID="Label6" runat="server" Text="Select standard thumbnail:" HelpText="Select one of predefined thumbnails. Location - ModulePath/Thumbs/HTML/." ResourceKey="lblHTMLStandardThumbSelect.Text" HelpKey="lblHTMLStandardThumbSelect.HelpKey" ControlName="ddlEditHTMLThumbSelect"></dnn:Label>
										<div class="styledSelect">
											<asp:DropDownList ID="ddlEditHTMLThumbSelect" runat="server"></asp:DropDownList>
										</div>
										<asp:RequiredFieldValidator ID="rfvEditHTMLThumbSelect" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlEditHTMLThumbSelect" ValidationGroup="vgEditHTML" InitialValue="0" resourcekey="rfvValue.ErrorMessage" Display="Dynamic" />
									</asp:Panel>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblEditHTMLStartExpire" runat="server" Text="Add start/expire date:" HelpText="Add start/expire date." ResourceKey="lblStartExpire.Text" HelpKey="lblStartExpire.HelpKey" />
								</td>
								<td>
									<div class="styledCheckbox noLabel">
										<asp:CheckBox ID="cbEditHTMLStartExpire" runat="server" Checked="false" Text="Add start/expire date" />
									</div>
								</td>
							</tr>
						</table>
						<asp:Panel ID="divEditHTMLStartExpire" runat="server" Style="display: none;">
							<table class="additionalOptionsList fullWidthTable noTdBorders noTableBorder">
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditHTMLStartDate" runat="server" HelpText="Items will show up after start datetime." Text="Start datetime:" ResourceKey="lblStartDate.Text" HelpKey="lblStartDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditHTMLStartDate" runat="server" CssClass="textCenter" ValidationGroup="vgEditHTML" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditHTMLStartDate" runat="server" ControlToValidate="tbxEditHTMLStartDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvStartDate.ErrorMessage" ValidationGroup="vgEditHTML" />
										<asp:Label ID="lblEditHTMLPubDateError" ResourceKey="lblPubDateError" runat="server" CssClass="smallInfo error" Text="Invalid date." Visible="false" />
										<asp:TextBox ID="tbxEditHTMLStartTime" runat="server" ValidationGroup="vgEditHTML" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditHTMLStartTime" runat="server" ControlToValidate="tbxEditHTMLStartTime" CssClass="smallInfo error" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgEditHTML" />
										<asp:RequiredFieldValidator ID="rfvEditHTMLStartTime" runat="server" ControlToValidate="tbxEditHTMLStartTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="rfvStartTime.ErrorMessage" ValidationGroup="vgEditHTML" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEditHTMLEndDate" runat="server" HelpText="Items will stop showing up after end datetime." Text="End datetime:" ResourceKey="lblEndDate.Text" HelpKey="lblEndDate.HelpKey" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditHTMLEndDate" runat="server" CssClass="textCenter" ValidationGroup="vgEditHTML" Width="90px" />
										<i class="fa fa-calendar"></i>
										<asp:RequiredFieldValidator ID="rfvEditHTMLEndDate" runat="server" ControlToValidate="tbxEditHTMLEndDate" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Date required." ResourceKey="rfvEndDate.ErrorMessage" ValidationGroup="vgEditHTML" />
										<asp:Label ID="lblEditHTMLExpireDateError" resourcekey="lblExpireDateError" runat="server" CssClass="smallInfo error" Text="Invalid date." Visible="false" />
										<asp:TextBox ID="tbxEditHTMLEndTime" runat="server" ValidationGroup="vgEditHTML" CssClass="textCenter small" />
										<i class="fa fa-clock-o"></i>
										<asp:RegularExpressionValidator ID="revEditHTMLEndTime" runat="server" ControlToValidate="tbxEditHTMLEndTime" CssClass="smallInfo error" ErrorMessage="hh:mm" ValidationExpression="([0-1]?[0-9]|2[0-3]):([0-5][0-9])" ValidationGroup="vgEditHTML" />
										<asp:RequiredFieldValidator ID="rfvEditHTMLEndTime" runat="server" ControlToValidate="tbxEditHTMLEndTime" CssClass="smallInfo error" Display="Dynamic" ErrorMessage="Time required." ResourceKey="revEndTime.ErrorMessage" ValidationGroup="vgEditHTML" />
									</td>
								</tr>
							</table>
						</asp:Panel>
						<asp:Label ID="lblEditHTMLErr" runat="server" EnableViewState="false" Visible="false" />
						<div class="mainActions">
							<asp:LinkButton ID="btnEditHTMLUpdate" runat="server" Text="Save" OnClick="btnEditHTMLContSave_Click" ResourceKey="btnEditHTMLSave.Text" ToolTip="Update HTML" CausesValidation="True" ValidationGroup="vgEditHTML" CssClass="downSaveClose" />
							<asp:LinkButton ID="btnEditHTMLCancle" runat="server" Text="Close" OnClick="btnCancle_Click" ResourceKey="btnEditHTMLClose.Text" ToolTip="Close Edit HTML" CssClass="downClose" />
						</div>
					</asp:Panel>
				</asp:Panel>
				<asp:Panel ID="pnlContentLocalization" runat="server" Visible="false">
					<asp:Panel ID="pnlEditImageContentLocalize" Visible="false" runat="server" CssClass="listItems">
						<div class="additionalOptions color3">
							<h2>
								<asp:Label ID="lblImageLocalization" resourcekey="lblImageLocalization.Text" runat="server" Text="Image Content Localization" />
							</h2>
							<table class="additionalOptionsList fullWidthTable bottomTdBorders textLeft">
								<tr>
									<td>
										<asp:Label ID="lblImageDefaultLang" runat="server" />
									</td>
									<td>
										<asp:Label ID="lblInfoLanguageLoad" runat="server" />
									</td>
									<tr>
										<td class="subjectName short">
											<dnn:Label ID="lblImageSelectLanguageLoc" runat="server" HelpText="Select language for localization" Text="Select language" ResourceKey="lblSelectLangForLocalization.Text" HelpKey="lblSelectLangForLocalization.HelpKey" ControlName="ddlImageSelectLanguageLoc" />
										</td>
										<td>
											<div class="styledSelect large">
												<asp:DropDownList ID="ddlImageSelectLanguageLoc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlImageSelectLanguageLoc_SelectedIndexChanged"></asp:DropDownList>
											</div>
										</td>
									</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblImgLoadLang" runat="server" HelpText="Load values from selected language" Text="Load values from:" ResourceKey="lblLoadLocalizedLangFrom.Text" HelpKey="lblLoadLocalizedLangFrom.HelpKey" ControlName="ddlImageLoadLangVal" />
									</td>
									<td>
										<div class="styledSelect large">
											<asp:DropDownList ID="ddlImageLoadLangVal" runat="server"></asp:DropDownList>
										</div>
										<div class="itemActions itemEditActions">
											<asp:LinkButton ID="btnImageLoadLangVal" runat="server" Text="Load values" CausesValidation="false" OnClick="btnImageLoadLangVal_Click" resourcekey="btnLoadLocalization.Text" ToolTip="LoadLocalized values" CssClass="itemEditCopy" />
										</div>
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblImageTitleLoc" runat="server" HelpText="Enter title." Text="Title:" ResourceKey="lblImageTitleLoc.Text" HelpKey="lblImageTitleLoc.HelpKey" ControlName="tbxImageTitleLoc" />
									</td>
									<td>
										<asp:TextBox ID="tbxImageTitleLoc" runat="server" CssClass="large" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblImageSubTitleLoc" runat="server" HelpText="Enter Subtitle." Text="Subtitle:" ResourceKey="lblImageSubTitleLoc.Text" HelpKey="lblImageSubTitleLoc.HelpKey" ControlName="tbxImageSubTitleLoc" />
									</td>
									<td>
										<asp:TextBox ID="tbxImageSubTitleLoc" runat="server" CssClass="large" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short textTop">
										<dnn:Label ID="lblImageDescriptionLoc" runat="server" Text="Description:" HelpText="Enter description of image." ResourceKey="lblImageDescriptionLoc.Text" HelpKey="lblImageDescriptionLoc.HelpKey" ControlName="txtImageDescriptionLoc" />
									</td>
									<td>
										<dnn:TextEditor ID="txtImageDescriptionLoc" runat="server" Height="350px" Width="600px" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblImageLinkLoc" runat="server" Text="Link:" HelpText="Enter link." ResourceKey="lblImageLinkLoc.Text" HelpKey="lblImageLinkLoc.HelpKey" ControlName="tbxImagelinkLoc" />
									</td>
									<td>
										<asp:TextBox ID="tbxImagelinkLoc" runat="server" CssClass="large" />
									</td>
								</tr>
							</table>
							<div class="mainActions">
								<asp:LinkButton ID="btnImageLocalizeSave" runat="server" Text="Save" resourcekey="btnSaveLocalization.Text" ToolTip="Save Localization" OnClick="ContentLocalizationSave" CssClass="downSaveClose" CommandName="image" />
								<asp:LinkButton ID="btnImageLocalizeCancel" runat="server" Text="Close" resourcekey="btnCloseLocalization.Text" ToolTip="Close Localization" OnClick="btnCancle_Click" CssClass="downClose" />
							</div>
						</div>
					</asp:Panel>
					<asp:Panel ID="pnlEditHTMLContentLocalize" runat="server" Visible="false" CssClass="listItems">
						<div class="additionalOptions color3">
							<h2>
								<asp:Label ID="lblHTMLLocalization" resourcekey="lblHTMLLocalization.Text" runat="server" Text="HTML Content Localization" />
							</h2>
							<table class="additionalOptionsList fullWidthTable bottomTdBorders textLeft">
								<tr>
									<td>
										<asp:Label ID="lblHTMLDefaultLang" runat="server" />
									</td>
									<td>
										<asp:Label ID="lblHTMLInfoLanguageLoad" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblHTMLContentLocalizeSelect" runat="server" ResourceKey="lblSelectLangForLocalization.Text" HelpKey="lblSelectLangForLocalization.HelpKey" ControlName="ddlHTMLContentLocalizeSelect" Text="Select language" />
									</td>
									<td>
										<div class="styledSelect large">
											<asp:DropDownList ID="ddlHTMLContentLocalizeSelect" runat="server" CssClass="large" AutoPostBack="True" OnSelectedIndexChanged="ddlHTMLContentLocalizeSelect_SelectedIndexChanged"></asp:DropDownList>
										</div>
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblHTMLLangLoad" runat="server" HelpText="Load values from selected language" ResourceKey="lblLoadLocalizedLangFrom.Text" HelpKey="lblLoadLocalizedLangFrom.HelpKey" ControlName="ddlHTMLLangLoad" Text="Load values from:" />
									</td>
									<td>
										<div class="styledSelect large">
											<asp:DropDownList ID="ddlHTMLLangLoad" runat="server" CssClass="large"></asp:DropDownList>
										</div>
										<div class="itemActions itemEditActions">
											<asp:LinkButton ID="btnHTMLLangLoad" runat="server" Text="Load values" CausesValidation="false" OnClick="btnHTMLLangLoad_Click" CssClass="itemEditCopy" />
										</div>
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblHTMLContentLocalizeTitle" runat="server" HelpText="Enter title." ResourceKey="lblHTMLContentLocalizeTitle.Text" HelpKey="lblHTMLContentLocalizeTitle.HelpKey" ControlName="tbxEditHTMLContentLocalizeTitle" Text="Title:" />
									</td>
									<td>
										<asp:TextBox ID="tbxEditHTMLContentLocalizeTitle" runat="server" EnableViewState="False" CssClass="large" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short textTop">
										<dnn:Label ID="lblHTMLContentLocalizeDescription" runat="server" HelpText="Add HTML content." ResourceKey="lblHTMLContentLocalizeDescription.Text" HelpKey="lblHTMLContentLocalizeDescription.HelpKey" ControlName="txtEditHTMLContentLocalizeDescription"
											Text="HTML Content:" />
									</td>
									<td>
										<dnn:TextEditor ID="txtEditHTMLContentLocalizeDescription" runat="server" Height="300" CssClass="large" />
									</td>
								</tr>
							</table>
							<div class="mainActions">
								<asp:LinkButton ID="btnEditHTMLLocSave" runat="server" Text="Save" OnClick="ContentLocalizationSave" CommandName="html" resourcekey="btnSaveLocalization.Text" ToolTip="Save Localization" CausesValidation="false" CssClass="downSaveClose" />
								<asp:LinkButton ID="btnEditHTMLLocClose" runat="server" Text="Close" resourcekey="btnCloseLocalization.Text" ToolTip="Close Localization" OnClick="btnEditHTMLLocClose_Click" CssClass="downClose" />
							</div>
						</div>
					</asp:Panel>
					<asp:Panel ID="pnlVideoContentLocalize" runat="server" Visible="false" CssClass="listItems">
						<div class="additionalOptions color3">
							<h2>
								<asp:Label ID="lblVideoLocalization" resourcekey="lblVideoLocalization.Text" runat="server" Text="Video Content Localization" />
							</h2>
							<table class="additionalOptionsList fullWidthTable bottomTdBorders textLeft">
								<tr>
									<td>
										<asp:Label ID="lblVideoDefaultLang" runat="server" />
									</td>
									<td>
										<asp:Label ID="lblVideoInfoLanguageLoad" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblVideoContentLocalizeSelect" runat="server" ResourceKey="lblSelectLangForLocalization.Text" HelpKey="lblSelectLangForLocalization.HelpKey" ControlName="ddlVideoContentLocalizeSelect" Text="Select language" />
									</td>
									<td>
										<div class="styledSelect large">
											<asp:DropDownList ID="ddlVideoContentLocalizeSelect" runat="server" CssClass="large" AutoPostBack="True" OnSelectedIndexChanged="ddlVideoContentLocalizeSelect_SelectedIndexChanged"></asp:DropDownList>
										</div>
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblVideoLangLoad" runat="server" HelpText="Load values from selected language" ResourceKey="lblLoadLocalizedLangFrom.Text" HelpKey="lblLoadLocalizedLangFrom.HelpKey" ControlName="ddlVideoLangLoad" Text="Load values from:" />
									</td>
									<td>
										<div class="styledSelect large">
											<asp:DropDownList ID="ddlVideoLangLoad" runat="server" CssClass="large"></asp:DropDownList>
										</div>
										<div class="itemActions itemEditActions">
											<asp:LinkButton ID="btnVideoLangLoad" runat="server" Text="Load values" CausesValidation="false" OnClick="btnVideoLoadLangVal_Click" CssClass="itemEditCopy" />
										</div>
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblVideoContentLocalizeTitle" runat="server" HelpText="Enter title." ResourceKey="lblVideoContentLocalizeTitle.Text" HelpKey="lblVideoContentLocalizeTitle.HelpKey" ControlName="tbxVideoContentLocalizeTitle" Text="Title:" />
									</td>
									<td>
										<asp:TextBox ID="tbxVideoContentLocalizeTitle" runat="server" CssClass="large" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short textTop">
										<dnn:Label ID="lblVideoContentLocalizeDescription" runat="server" HelpText="Add Video description." ResourceKey="lblVideoContentLocalizeDescription.Text" HelpKey="lblVideoContentLocalizeDescription.HelpKey" ControlName="tbxVideoContentLocalizeDescription" Text="Video description:" />
									</td>
									<td>
										<asp:TextBox ID="tbxVideoContentLocalizeDescription" runat="server" Height="150px" TextMode="MultiLine" CssClass="large" />
									</td>
								</tr>
							</table>
							<div class="mainActions">
								<asp:LinkButton ID="btnVideoLocSave" runat="server" Text="Save" OnClick="ContentLocalizationSave" CommandName="video" resourcekey="btnSaveLocalization.Text" ToolTip="Save Localization" CausesValidation="false" CssClass="downSaveClose" />
								<asp:LinkButton ID="btnVideoLocClose" runat="server" Text="Close" resourcekey="btnCloseLocalization.Text" ToolTip="Close Localization" OnClick="btnVideoLocClose_Click" CssClass="downClose" />
							</div>
						</div>
					</asp:Panel>
					<asp:Panel ID="pnlEmbedVideoContentLocalize" runat="server" Visible="false" CssClass="listItems">
						<div class="additionalOptions color3">
							<h2>
								<asp:Label ID="lblEmbedVideoLocalization" resourcekey="lblHTMLLocalization.Text" runat="server" Text="Video Content Localization" />
							</h2>
							<table class="additionalOptionsList fullWidthTable bottomTdBorders textLeft">
								<tr>
									<td>
										<asp:Label ID="lblEmbedVideoDefaultLang" runat="server" />
									</td>
									<td>
										<asp:Label ID="lblEmbedVideoInfoLanguageLoad" runat="server" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEmbedVideoContentLocalizeSelect" runat="server" ResourceKey="lblSelectLangForLocalization.Text" HelpKey="lblSelectLangForLocalization.HelpKey" ControlName="ddlEmbedVideoContentLocalizeSelect" Text="Select language" />
									</td>
									<td>
										<div class="styledSelect large">
											<asp:DropDownList ID="ddlEmbedVideoContentLocalizeSelect" runat="server" CssClass="large" AutoPostBack="True" OnSelectedIndexChanged="ddlEmbedVideoContentLocalizeSelect_SelectedIndexChanged"></asp:DropDownList>
										</div>
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEmbedVideoLangLoad" runat="server" HelpText="Load values from selected language" ResourceKey="lblLoadLocalizedLangFrom.Text" HelpKey="lblLoadLocalizedLangFrom.HelpKey" ControlName="ddlEmbedVideoLangLoad" Text="Load values from:" />
									</td>
									<td>
										<div class="styledSelect large">
											<asp:DropDownList ID="ddlEmbedVideoLangLoad" runat="server" CssClass="large"></asp:DropDownList>
										</div>
										<div class="itemActions itemEditActions">
											<asp:LinkButton ID="btnEmbedVideoLangLoad" runat="server" Text="Load values" CausesValidation="false" OnClick="btnEmbedVideoLoadLangVal_Click" CssClass="itemEditCopy" />
										</div>
									</td>
								</tr>
								<tr>
									<td class="subjectName short">
										<dnn:Label ID="lblEmbedVideoContentLocalizeTitle" runat="server" HelpText="Enter title." ResourceKey="lblEmbedVideoContentLocalizeTitle.Text" HelpKey="lblEmbedVideoContentLocalizeTitle.HelpKey" ControlName="tbxEmbedVideoContentLocalizeTitle" Text="Title:" />
									</td>
									<td>
										<asp:TextBox ID="tbxEmbedVideoContentLocalizeTitle" runat="server" CssClass="large" />
									</td>
								</tr>
								<tr>
									<td class="subjectName short textTop">
										<dnn:Label ID="lblEmbedVideoContentLocalizeDescription" runat="server" HelpText="Add Video description." ResourceKey="lblEmbedVideoContentLocalizeDescription.Text" HelpKey="lblEmbedVideoContentLocalizeDescription.HelpKey" ControlName="tbxEmbedVideoContentLocalizeDescription" Text="Video description:" />
									</td>
									<td>
										<asp:TextBox ID="tbxEmbedVideoContentLocalizeDescription" runat="server" Height="150px" TextMode="MultiLine" CssClass="large" />
									</td>
								</tr>
							</table>
							<div class="mainActions">
								<asp:LinkButton ID="btnEmbedVideoLocSave" runat="server" Text="Save" OnClick="ContentLocalizationSave" CommandName="embed" resourcekey="btnSaveLocalization.Text" ToolTip="Save Localization" CausesValidation="false" CssClass="downSaveClose" />
								<asp:LinkButton ID="btnEmbedVideoLocClose" runat="server" Text="Close" resourcekey="btnCloseLocalization.Text" ToolTip="Close Localization" OnClick="btnEmbedVideoLocClose_Click" CssClass="downClose" />
							</div>
						</div>
					</asp:Panel>
				</asp:Panel>
				<asp:Panel ID="pnlMoveMedia" runat="server" Visible="false" CssClass="listItems">
					<div class="additionalOptions color2">
						<h2>
							<asp:Label ID="lblMoveORCopyMedia" runat="server" Text="Move or copy selected media" resourcekey="lblMoveORCopyMedia.Text" />
						</h2>
						<table class="additionalOptionsList noTdBorders bottomTdBorders noTableBorder fullWidthTable">
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblMediaMoveID" ResourceKey="lblMediaMoveID.Text" runat="server" HelpText="ID of the selected media." Text="ID:" HelpKey="lblMediaMoveID.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblMoveMediaID2" runat="server" Text="ID" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblMediaMoveType" ResourceKey="lblMediaMoveType.Text" runat="server" HelpText="Type of the selected media." Text="Type:" HelpKey="lblMediaMoveType.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblMediaMoveType2" runat="server" Text="ID" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblMoveMediaTitle" ResourceKey="lblMoveMediaTitle.Text" runat="server" Text="Title:" HelpText="Title of the selected media." HelpKey="lblMoveMediaTitle.HelpKey" />
								</td>
								<td>
									<asp:Label ID="lblMoveMediaTitle2" runat="server" Text="Title" />
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblMoveMediaSelectCategory" ResourceKey="lblMoveMediaSelectCategory.Text" runat="server" Text="Select category:" HelpText="Select the category to move or copy media to:" HelpKey="lblMoveMediaSelectCategory.HelpKey" />
								</td>
								<td>
									<div class="styledSelect large">
										<asp:DropDownList ID="ddlMoveCategory" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="CategoryID" OnSelectedIndexChanged="ddlMoveCategory_SelectedIndexChanged"></asp:DropDownList>
									</div>
								</td>
							</tr>
							<tr>
								<td class="subjectName short">
									<dnn:Label ID="lblMedijaMoveListSelect" ResourceKey="lblMedijaMoveListSelect.Text" runat="server" Text="Select List:" HelpText="Select the list to move or copy media to:" HelpKey="lblMedijaMoveListSelect.HelpKey" />
								</td>
								<td>
									<div class="styledSelect large">
										<asp:DropDownList ID="ddlMMSelectList" runat="server" DataTextField="Name" DataValueField="ListID" />
									</div>
								</td>
							</tr>
						</table>
						<asp:Label ID="lblInfoMoveCopy" runat="server" EnableViewState="False" CssClass="infoMessages error static" Visible="false" />
						<div class="mainActions">
							<asp:LinkButton ID="btnCopyContent" runat="server" Text="Copy" Width="90px" resourcekey="btnMoveMediaCopy.Text" OnClick="btnCopyContent_Click" CssClass="copy" />
							<asp:LinkButton ID="btnMoveContent" runat="server" Text="Move" Width="90px" resourcekey="btnMoveMediaMove.Text" OnClick="btnMoveContent_Click" CssClass="moveAction" />
							<asp:LinkButton ID="btnMoveMediaCancel" runat="server" Text="Close" Width="90px" resourcekey="btnMoveMediaClose.Text" OnClick="btnMoveMediaCancel_Click" CssClass="downClose" />
						</div>
					</div>
				</asp:Panel>
			</asp:Panel>
		</div>
	</div>
</asp:Panel>
