<%@ control language="C#" autoeventwireup="true" inherits="EasyDNNSolutions.Modules.EasyDNNRotator.Administration.CropContent, App_Web_cropcontent.ascx.74110c5a" %>
<asp:Literal runat="server" ID="infoMessage" />
<asp:Panel id="pnlAdmin" runat="server">
	<script type="text/javascript">
		//<![CDATA[
		jQuery(document).ready(function(){
			var editscreenW = <%=ViewState["hfScreenWedit"]%> + 200;
			var editscreenH = <%=ViewState["hfScreenHedit"]%> + 200;
			var cropzoomMain = jQuery('#cropzoomMain').cropzoom({
				width: editscreenW,
				height: editscreenH,
				bgColor: '#E1E1E1',
				enableRotation: true,
				enableZoom: true,
				selector:{
					centered: true,
					borderColor: 'red',
					borderColorHover: 'blue',
					showPositionsOnDrag: true,
					showDimetionsOnDrag: true,
					w:<%=ViewState["hfScreenWedit"]%>,
					h:<%=ViewState["hfScreenHedit"]%>,
					maxWidth:<%=ViewState["hfScreenWedit"]%>,
					maxHeight:<%=ViewState["hfScreenHedit"]%>
					},
				image:{
					source: '<%=ViewState["hfImageURLOrgedit"]%>',
					x:0,
					y:0,
					width: <%=ViewState["hfImageEdW"]%>,
					height: <%=ViewState["hfImageEdH"]%>,
					minZoom: 10,
					maxZoom: 500,
					startZoom:0,
					useStartZoomAsMinZoom:false,
					snapToContainer: false
				}
			});
			jQuery('.send_dataMain').click(function () {
				cropzoomMain.send('<%=ModulePath%>ImageService.ashx', 'POST', { ID: 11, ImageName: '<%=ViewState["hfImageUNameEdit"] %>', ImageUrlEdit: '<%=ViewState["hfImageURLedit"] %>', JpegQuality: '<%=GlobalJpegQuality %>' },function (imgRet){
					jQuery(".resultMain").find(".txtMain").hide();
					jQuery("#generatedMain").attr("src", imgRet+"?timestamp=" + new Date().getTime()).show();
				});
			});

			var cropzoomThumb = jQuery('#cropzoomThumb').cropzoom({
				width:editscreenW,
				height:editscreenH,
				bgColor:'#E1E1E1',
				enableRotation:true,
				enableZoom:true,
				selector:{
					centered: true,
					borderColor: 'red',
					borderColorHover: 'blue',
					showPositionsOnDrag: false,
					showDimetionsOnDrag: false,
					w:<%=ViewState["hfThumbW"]%>,
					h:<%=ViewState["hfThumbH"]%>,
					maxWidth:<%=ViewState["hfThumbW"]%>,
					maxHeight:<%=ViewState["hfThumbH"]%>
					},
				image: {
					source: '<%=ViewState["hfImageURLOrgedit"]%>',
					x: 0,
					y: 0,
					width: <%=ViewState["hfImageEdW"]%>,
					height: <%=ViewState["hfImageEdH"]%>,
					minZoom: 10,
					maxZoom: 500,
					startZoom:0,
					useStartZoomAsMinZoom:false,
					snapToContainer: false
				}
			});
			jQuery('.send_dataThumb').click(function () {
				cropzoomThumb.send('<%=ModulePath%>ImageService.ashx', 'POST', { ID: 12, ImageName: "thumb_<%=ViewState["hfImageUNameEdit"] %>", ImageUrlEdit: "<%=ViewState["hfImageURLedit"] %>thumb/", JpegQuality: '<%=GlobalJpegQuality %>' }, function (imgRet) {
					jQuery(".resultThumb").find(".txtThumb").hide();
					jQuery("#generatedThumb").attr("src", imgRet+"?timestamp=" + new Date().getTime()).show();
				});
			});
		});
		//]]>
	</script>
	<div id="EDRAdminContent">
		<div class="topBarWrapper">
			<div class="wrapper">
				<ul class="links">
					<li>
						<asp:Label runat="server" ID="lblCropContent" resourcekey="lblCropContent" Text="Crop Content" />
					</li>
				</ul>
				<ul class="actions">
					<li class="close">
						<asp:HyperLink ID="btnTopclose" runat="server" Text="Exit" resourcekey="btnTopclose" />
					</li>
				</ul>
			</div>
		</div>
		<div class="mainContentWrapper">
			<asp:Panel ID="pnlEditContent" runat="server" Visible="True" class="contentSectionWrapper color3">
				<asp:Panel ID="pnlGVRotatorContent" runat="server" Visible="False">
					<asp:ObjectDataSource ID="odsNewsCropContent" runat="server" OnSelected="odsNewsCropContent_Selected" TypeName="EasyDNNSolutions.Modules.EasyDNNRotator.HTMLRotatorData" SelectMethod="GetNewsItemsLoc"
						OnSelecting="odsNewsCropContent_Selecting">
						<SelectParameters>
							<asp:Parameter Name="PortalID" Type="Int32" />
							<asp:Parameter Name="UserID" Type="Int32" />
							<asp:Parameter Name="RotatorModuleID" Type="Int32" />
							<asp:Parameter Name="CategoryIDList" Type="String" />
							<asp:Parameter Name="PublishDate" Type="DateTime" />
							<asp:Parameter Name="ExpireDate" Type="DateTime" />
							<asp:Parameter Name="OrderBy" Type="String" />
							<asp:Parameter Name="OrderBy2" Type="String" />
							<asp:Parameter Name="OrderBy3" Type="String" />
							<asp:Parameter Name="Featured" Type="Boolean" />
							<asp:Parameter Name="OnlyEvents" Type="Boolean" />
							<asp:Parameter Name="AllEvents" Type="Boolean" />
							<asp:Parameter Name="StartDate" Type="DateTime" />
							<asp:Parameter Name="EditPermission" Type="Int32" />
							<asp:Parameter Name="OnlyWithImage" Type="Boolean" />
							<asp:Parameter Name="OpenInTab" Type="Int32" />
							<asp:Parameter Name="OpenInModule" Type="Int32" />
							<asp:Parameter Name="Randomize" Type="Boolean" />
							<asp:Parameter Name="DescriptionSource" Type="Int32" />
							<asp:Parameter Name="LocaleCode" Type="String" />
							<asp:Parameter Name="AllCategories" Type="Boolean" />
							<asp:Parameter Name="RowCount" Type="Int32" />

							<asp:Parameter Name="IsSocialInstance" Type="Boolean" />

							<asp:Parameter Name="DNNUserID" Type="Int32" />
							<asp:Parameter Name="DNNGroupID" Type="Int32" />
							<asp:Parameter Name="ShowAllAuthors" Type="Boolean" />
						</SelectParameters>
					</asp:ObjectDataSource>
					<asp:ObjectDataSource ID="odsNewsCropContentPartition" runat="server" OnSelected="odsNewsCropContent_Selected" TypeName="EasyDNNSolutions.Modules.EasyDNNRotator.HTMLRotatorData"
						SelectMethod="GetNewsItemsAndPartitonLoc" OnSelecting="odsNewsCropContentPartition_Selecting">
						<SelectParameters>
							<asp:Parameter Name="PortalID" Type="Int32" />
							<asp:Parameter Name="UserID" Type="Int32" />
							<asp:Parameter Name="RotatorModuleID" Type="Int32" />
							<asp:Parameter Name="CategoryIDList" Type="String" />
							<asp:Parameter Name="PublishDate" Type="DateTime" />
							<asp:Parameter Name="ExpireDate" Type="DateTime" />
							<asp:Parameter Name="OrderBy" Type="String" />
							<asp:Parameter Name="OrderBy2" Type="String" />
							<asp:Parameter Name="OrderBy3" Type="String" />
							<asp:Parameter Name="Featured" Type="Boolean" />
							<asp:Parameter Name="OnlyEvents" Type="Boolean" />
							<asp:Parameter Name="AllEvents" Type="Boolean" />
							<asp:Parameter Name="StartDate" Type="DateTime" />
							<asp:Parameter Name="EditPermission" Type="Int32" />
							<asp:Parameter Name="OnlyWithImage" Type="Boolean" />
							<asp:Parameter Name="OpenInTab" Type="Int32" />
							<asp:Parameter Name="OpenInModule" Type="Int32" />
							<asp:Parameter Name="Randomize" Type="Boolean" />
							<asp:Parameter Name="DescriptionSource" Type="Int32" />
							<asp:Parameter Name="LocaleCode" Type="String" />
							<asp:Parameter Name="AllCategories" Type="Boolean" />
							<asp:Parameter Name="RowCount" Type="Int32" />
							<asp:Parameter Name="numPerCategory" Type="Int32" />
							<asp:Parameter Name="IsSocialInstance" Type="Boolean" />
							<asp:Parameter Name="DNNUserID" Type="Int32" />
							<asp:Parameter Name="DNNGroupID" Type="Int32" />
							<asp:Parameter Name="ShowAllAuthors" Type="Boolean" />
						</SelectParameters>
					</asp:ObjectDataSource>
					<asp:ObjectDataSource ID="odsGalleryCropContent" runat="server" SelectMethod="SelectGalleryLocContent" TypeName="EasyDNNSolutions.Modules.EasyDNNRotator.Gallery.GalleryContentDB"
						OnSelected="odsGalleryCropContent_Selected" OnSelecting="odsGalleryCropContent_Selecting">
						<SelectParameters>
							<asp:Parameter Name="RotatorID" Type="Int32" />
							<asp:Parameter Name="Limit" Type="Int32" />
							<asp:Parameter Name="Type" Type="String" />
							<asp:Parameter Name="LocalCode" Type="String" />
							<asp:Parameter Name="Randomize" Type="Boolean" />
						</SelectParameters>
					</asp:ObjectDataSource>
					<asp:ObjectDataSource ID="odsGravityGalleryCropContent" runat="server" SelectMethod="GetGalleriesByCategoryWithFirstPictureForCropContent" TypeName="EasyDNNSolutions.Modules.EasyDNNRotator.Gallery.GalleryContentDB"
						OnSelected="odsGravityGalleryCropContent_Selected" OnSelecting="odsGravityGalleryCropContent_Selecting">
						<SelectParameters>
							<asp:Parameter Name="ModuleID" Type="Int32" />
							<asp:Parameter Name="localeCode" Type="String" />
							<asp:Parameter Name="UserID" Type="Int32" />
							<asp:Parameter Name="DisplayAllCategories" Type="Boolean" />
							<asp:Parameter Name="RotatorTypeID" Type="Int32" />
							<asp:Parameter Name="OrderBy" Type="String" />
							<asp:Parameter Name="OrderType" Type="String" />
							<asp:Parameter Name="OpenInGalleryModuleID" Type="Int32" />
							<asp:Parameter Name="NumToRotate" Type="Int32" />
						</SelectParameters>
					</asp:ObjectDataSource>
					<div class="editInfo">
						<asp:Label ID="lblGvContentcaption" runat="server" Text="Items in List" EnableViewState="False" Visible="False" />
					</div>
					<div class="sectionHeader">
						<div class="titleAndNumber cropContentTitleAndNumber">
							<h4>
								<asp:Label ID="lblCropContentTitle" runat="server" resourcekey="lblCropContentTitle" Text="&lt;b&gt;Crop&lt;/b&gt; Pictures" />
							</h4>
							<p>
								<asp:Label ID="lblCropContentTitleAdjust" resourcekey="lblCropContentTitleAdjust" runat="server" Text="Crop picturs from saved content" />
							</p>
						</div>
					</div>
					<div class="listItems">
						<asp:GridView ID="gvEditContent" runat="server" AutoGenerateColumns="False" ShowFooter="True" CssClass="listItemsTable" EnableModelValidation="True" DataKeyNames="ContentID,ContentType" AllowPaging="false" AllowSorting="false" OnRowCommand="gvEditContent_RowCommand" Visible="false" OnRowDataBound="gvEditContent_RowDataBound" OnPageIndexChanging="gvEditContent_PageIndexChanging">
							<Columns>
								<asp:TemplateField HeaderText="CROP">
									<ItemTemplate>
										<div class="itemActions itemPrimaryActions">
											<asp:LinkButton ID="lbEditRotationItem" resourcekey="lbEditRotationItem" runat="server" CommandArgument='<%#Eval("ContentID") %>' CommandName="CROP" CssClass="cropAction" CausesValidation="False" Text="CROP tool"></asp:LinkButton>
										</div>
									</ItemTemplate>
									<HeaderStyle Width="80px" />
									<ItemStyle CssClass="actionsCell" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Title" SortExpression="Title">
									<ItemTemplate>
										<asp:Label ID="lblEditRotatorTitle" runat="server" Text='<%# Bind("Title") %>' />
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox ID="tbEditRotatorTitle" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
									</EditItemTemplate>
									<HeaderStyle Width="240px" />
								</asp:TemplateField>
								<asp:BoundField DataField="Link" HeaderText="Link">
									<HeaderStyle Width="240px" />
								</asp:BoundField>
								<asp:BoundField DataField="DateCreated" HeaderText="Date Created" ReadOnly="True" DataFormatString="{0:dd.MM.yyyy}" SortExpression="DateCreated">
									<HeaderStyle Width="80px" />
								</asp:BoundField>
								<asp:TemplateField HeaderText="Image">
									<ItemTemplate>
										<div class="thumbnail">
											<asp:Image ID="Image1" ImageUrl='<%#gVImageSelector(Eval("FileLocation"),Eval("ContentType"),Eval("FileSystemName"))%>' runat="server" />
										</div>
									</ItemTemplate>
									<HeaderStyle Width="80px" />
								</asp:TemplateField>
							</Columns>
							<FooterStyle CssClass="itemsListFooter" />
							<HeaderStyle CssClass="itemsListheader" />
							<PagerStyle CssClass="contentPagination" />
							<EditRowStyle CssClass="editItemState" />
						</asp:GridView>
						<asp:GridView ID="gvEditNewsContent" runat="server" AllowPaging="false" AllowSorting="false" AutoGenerateColumns="false" EnableModelValidation="true" CssClass="listItemsTable" Visible="false" OnRowCommand="gvEditNewsContent_RowCommand" OnPageIndexChanging="gvEditNewsContent_PageIndexChanging">
							<Columns>
								<asp:TemplateField HeaderText="CROP">
									<ItemTemplate>
										<div class="itemActions itemPrimaryActions">
											<asp:LinkButton ID="lbEditNewsItem" resourcekey="lbEditNewsItem" runat="server" CommandArgument='<%#Eval("ArticleID") %>' CommandName="CROPNews" CssClass="cropAction" CausesValidation="False" Text="CROP tool"></asp:LinkButton>
										</div>
									</ItemTemplate>
									<HeaderStyle Width="80px" />
									<ItemStyle CssClass="actionsCell" />
								</asp:TemplateField>
								<asp:BoundField DataField="Title" HeaderText="Title">
									<HeaderStyle Width="550px" />
								</asp:BoundField>
								<asp:BoundField DataField="PublishDate" HeaderText="Publish Date" DataFormatString="{0:dd.MM.yyyy}">
									<HeaderStyle Width="90px" />
								</asp:BoundField>
								<asp:TemplateField HeaderText="Image">
									<ItemTemplate>
										<div class="thumbnail">
											<asp:Image ID="Image1" ImageUrl='<%#gvnewsImageUrl(Eval("FileSystemName"))%>' runat="server" />
										</div>
									</ItemTemplate>
									<HeaderStyle Width="80px" />
								</asp:TemplateField>
							</Columns>
							<FooterStyle CssClass="itemsListFooter" />
							<HeaderStyle CssClass="itemsListheader" />
							<PagerStyle CssClass="contentPagination" />
							<EditRowStyle CssClass="editItemState" />
						</asp:GridView>
						<asp:GridView ID="gvGalleryCropContent" runat="server" AllowPaging="true" AllowSorting="false" AutoGenerateColumns="False" EnableModelValidation="True" CssClass="listItemsTable" Visible="false" OnRowCommand="gvGalleryCropContent_RowCommand" DataSourceID="odsGalleryCropContent">
							<AlternatingRowStyle CssClass="intgrid1" />
							<Columns>
								<asp:TemplateField HeaderText="CROP">
									<ItemTemplate>
										<div class="itemActions itemPrimaryActions">
											<asp:LinkButton ID="lbEditNewsItem" resourcekey="lbEditNewsItem" runat="server" CommandArgument='<%#Eval("PictureID") %>' CommandName="CROPGallery" CssClass="cropAction" CausesValidation="False" Text="CROP tool"></asp:LinkButton>
										</div>
									</ItemTemplate>
									<HeaderStyle Width="80px" />
									<ItemStyle CssClass="actionsCell" />
								</asp:TemplateField>
								<asp:BoundField DataField="Title" HeaderText="Title">
									<HeaderStyle HorizontalAlign="Left" Width="550px" />
								</asp:BoundField>
								<asp:TemplateField HeaderText="Image">
									<ItemTemplate>
										<div class="thumbnail">
											<asp:Image ID="Image1" ImageUrl='<%#gvGalleryImageUrl(Eval("FileName"))%>' runat="server" />
										</div>
									</ItemTemplate>
									<HeaderStyle Width="80px" />
								</asp:TemplateField>
							</Columns>
							<FooterStyle CssClass="itemsListFooter" />
							<HeaderStyle CssClass="itemsListheader" />
							<PagerStyle CssClass="contentPagination" />
							<EditRowStyle CssClass="editItemState" />
						</asp:GridView>
						<asp:GridView ID="gvGravityCropContent" runat="server" AllowPaging="true" AllowSorting="false" AutoGenerateColumns="false" EnableModelValidation="true" CssClass="listItemsTable" Visible="false" OnRowCommand="gvGravityGalleryCropContent_RowCommand" DataSourceID="odsGravityGalleryCropContent">
							<AlternatingRowStyle CssClass="intgrid1" />
							<Columns>
								<asp:TemplateField HeaderText="CROP">
									<ItemTemplate>
										<div class="itemActions itemPrimaryActions">
											<asp:LinkButton ID="lbEditNewsItem" resourcekey="lbEditNewsItem" runat="server" CommandArgument='<%#Eval("PictureID") %>' CommandName="CROPGallery" CssClass="cropAction" CausesValidation="False" Text="CROP tool"></asp:LinkButton>
										</div>
									</ItemTemplate>
									<HeaderStyle Width="80px" />
									<ItemStyle CssClass="actionsCell" />
								</asp:TemplateField>
								<asp:BoundField DataField="Title" HeaderText="Title">
									<HeaderStyle HorizontalAlign="Left" Width="550px" />
								</asp:BoundField>
								<asp:TemplateField HeaderText="Image">
									<ItemTemplate>
										<div class="thumbnail">
											<asp:Image ID="Image1" ImageUrl='<%#gvGalleryImageUrl(Eval("FileName"))%>' runat="server" />
										</div>
									</ItemTemplate>
									<HeaderStyle Width="80px" />
								</asp:TemplateField>
							</Columns>
							<FooterStyle CssClass="itemsListFooter" />
							<HeaderStyle CssClass="itemsListheader" />
							<PagerStyle CssClass="contentPagination" />
							<EditRowStyle CssClass="editItemState" />
						</asp:GridView>
					</div>
				</asp:Panel>
				<asp:Panel ID="pnlMainCropPanel" runat="server" Visible="false">
					<div class="cropButtonsContainer">
						<asp:LinkButton ID="lbCropMainImg" resourcekey="lbCropMainImg" runat="server" CssClass="topLiButton active" Text="CROP MAIN IMAGE" OnClick="lbCropMainImg_Click" />
						<asp:LinkButton ID="lbCropThumbImg" resourcekey="lbCropThumbImg" runat="server" CssClass="topLiButton" Text="CROP THUMBNAIL IMAGE" OnClick="lbCropThumbImg_Click" />
					</div>
					<asp:Panel ID="pnlimageMainCroper" runat="server" Visible="false" class="cropWrapper">
						<div>
							<div id="cropzoomMain" class="cropContainer">
							</div>
							<div class="mainActions">
								<span id="lbMainCropSave" class="cropSave send_dataMain"><%=SaveAndClose%></span>
								<asp:LinkButton ID="lbBottomClose" runat="server" OnClick="lbCloseCropEdit_Click" CssClass="downClose"><%=Close%></asp:LinkButton>
							</div>
							<div style="clear: both">
							</div>
							<div class="infoDiv">
								<asp:Label ID="CropedMainInfo" resourcekey="CropedMainInfo" runat="server" Text="Results of croping:" Style="" CssClass="cropResultLabel" />
							</div>
							<div class="resultMain thumbnail" style="margin-left: auto; margin-right: auto; width: <%=ViewState["hfScreenWedit"]%>px; height: <%=ViewState["hfScreenHedit"]%>px;">
								<div class="txtMain">
									<%=HereYouWillSeeMainImage%>
								</div>
								<img id="generatedMain" src="#" alt="" style="display: none" />
							</div>
						</div>
					</asp:Panel>
					<asp:Panel ID="pnlimageThumbCroper" runat="server" Visible="false" EnableViewState="False" class="cropWrapper">
						<div class="imagesThumb">
							<div id="cropzoomThumb" class="cropContainer">
							</div>
							<div class="mainActions">
								<span class="cropSave send_dataThumb"><%=SaveAndClose%></span>
								<asp:LinkButton ID="lbCloseCropThumb" runat="server" CssClass="downClose grey" OnClick="lbCloseCropEdit_Click"><%=Close%></asp:LinkButton>
							</div>
							<div class="infoDiv">
								<asp:Label ID="CropedThumbInfo" resourcekey="CropedThumbInfo" runat="server" Text="Results of croping:" CssClass="cropResultLabel" />
							</div>
							<div class="resultThumb thumbnail" style="margin-left: auto; margin-right: auto; width: <%=ViewState["hfThumbW"]%>px; height: <%=ViewState["hfThumbH"]%>px;">
								<div class="txtThumb">
									<%=Result%>
								</div>
								<img id="generatedThumb" src="#" alt="" style="display: none" />
							</div>
						</div>
					</asp:Panel>
				</asp:Panel>
				<div class="editInfo">
					<asp:Label ID="lblErrorEditSave" runat="server" />
				</div>
				<asp:Label ID="lblGvListContentErr" runat="server" EnableViewState="false" />
			</asp:Panel>
		</div>
	</div>
</asp:Panel>
