<%@ control language="C#" inherits="EasyDNNSolutions.Modules.EasyDNNRotator.Administration.EditEasyDNNRotator, App_Web_editeasydnnrotator.ascx.74110c5a" autoeventwireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="eds" Namespace="EasyDNNSolutions.Modules.EasyDNNRotator.CustomControls" Assembly="App_SubCode_EasyDNNrotator, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" %>
<asp:Literal runat="server" ID="infoMessage" />
<asp:Panel id="pnlAdmin" runat="server">
	<script type="text/javascript">
		//<![CDATA[

		<%=PortalSharingJS%>

		function CategoryClientValidate(source, arguments) {
			if (jQuery('#<%=cbDisplayAllCategories.ClientID%>')[0].checked)
				return;

			var checkedCount = jQuery('#<%=phDinamicTreeView.ID%>advanced_tree_view_categor_selector').find('input[type="checkbox"]').filter(':checked').length;
			if (checkedCount > 0) {
				arguments.IsValid = true;
			} else {
				arguments.IsValid = false;
				jQuery('#advanced_tree_view_categor_selector').find('input[type="checkbox"]').focus();
			}
		}

		jQuery(function ($) {
			var $tvAuthorAndGroupSelection = $('#<%=tvAuthorAndGroupSelection.ClientID%>')

			$tvAuthorAndGroupSelection
				.EDS_TreeViewSelector({
					state_checkbox: $('<input type="checkbox" />').prop('checked', true)
				});

			$('input[type="checkbox"]', $tvAuthorAndGroupSelection)
				.each(function () {
					var $this = $(this);

					if (!$this[0].checked)
						return;

					$this.parents('table').eq(0).next('div').find('input[type="checkbox"]')
						.each(function () {
							this.checked = true;
							this.disabled = true;
						});

				});

			$('#<%=ddlCRSliderHAsRatio.ClientID%>').change(function () {
				var $trHeightReferencesWidthContainer = $('#<%=trHeightReferencesWidthContainer.ClientID%>');

				if (this.value == 'True')
					$trHeightReferencesWidthContainer.css('display', '');
				else
					$trHeightReferencesWidthContainer.css('display', 'none');
			});

		});

		function pageLoad(sender, args) {
			if (args.get_isPartialLoad()) {
				<%=PortalSharingJS%>

				var $category_menue_items = $('.edn_advanced_tree_view li');

				$category_menue_items.click(function (e) {
					var $target = $(e.target),
						$clicked,
						$child_list,
						$expand_collapse;

					if ($target.is('div') || $target.is('a.expand_collapse')) {
						$clicked = $(this);
						$child_list = $clicked.find('> ul');
						$expand_collapse = $clicked.find('> div > a.expand_collapse');

						if ($child_list.length == 1) {
							if ($child_list.is(':visible')) {
								$child_list.slideUp(200);
								$expand_collapse.removeClass('collapse');
							} else {
								$child_list.slideDown(200);
								$expand_collapse.addClass('collapse');
							}
						}

						return false;
					}
				});

				(function ($) {

					function CategoryClientValidate(source, arguments) {
						if (jQuery('#<%=cbDisplayAllCategories.ClientID%>')[0].checked)
							return;

						var checkedCount = jQuery('#<%=phDinamicTreeView.ID%>advanced_tree_view_categor_selector').find('input[type="checkbox"]').filter(':checked').length;
						if (checkedCount > 0) {
							arguments.IsValid = true;
						} else {
							arguments.IsValid = false;
							jQuery('#advanced_tree_view_categor_selector').find('input[type="checkbox"]').focus();
						}
					}

					$('#<%=ddlCRSliderHAsRatio.ClientID%>').change(function () {
						var $trHeightReferencesWidthContainer = $('#<%=trHeightReferencesWidthContainer.ClientID%>');

						if (this.value == 'True')
							$trHeightReferencesWidthContainer.css('display', '');
						else
							$trHeightReferencesWidthContainer.css('display', 'none');
					});

					$('.onOffToggle input[type="checkbox"]').each(function () {
						var $this = $(this),
							$onOffElement = $this.parents('.onOffToggle').first(),
							$showHideElement = $this.parents('.settings_table').next();

						if (this.checked) {
							$showHideElement.slideDown(200);
						}
						else {
							$showHideElement.slideUp(200);
						}

						$onOffElement.toggleClass('off', !this.checked);
					});
				})(jQuery);
			}
		}
		//]]>
	</script>
	<asp:Label ID="lblUseGeneralSettingsAll" resourcekey="lblUseGeneralSettingsAll" runat="server" Text="Please contact your administrator to activate the module." Visible="false" />
	<div runat="server" id="wrapperSettings">
		<div id="EDRAdminContent">
			<div class="flashMessages">
			</div>
			<div class="topBarWrapper">
				<div class="wrapper">
					<ul class="links">
						<li><span>Rotator Settings</span> </li>
					</ul>
					<ul class="actions">
						<li class="close">
							<asp:HyperLink ID="btnTopclose" runat="server" Text="Exit" resourcekey="btnTopclose" />
						</li>
					</ul>
				</div>
			</div>
			<div class="mainContentWrapper">
				<div class="contentSectionWrapper color1">
					<div class="sectionHeader">
						<div class="titleAndNumber settingsTitle">
							<h4>
								<asp:Label ID="lblGallerySettingsTitle" runat="server" resourcekey="lblGallerySettingsTitle" CssClass="gallerysettings" Text="&lt;b&gt;Rotator&lt;/b&gt; Settings" />
							</h4>
							<p>
								<asp:Label ID="lblGallerySettingsTitleAdjust" resourcekey="lblGallerySettingsTitleAdjust" runat="server" CssClass="adjustview" Text="Adjust your Rotator for perfect view" />
							</p>
						</div>
					</div>
					<div class="contentSection gallerySettings">
						<asp:Panel ID="pnlRotatorBase" runat="server">
							<div class="specialOptions">
								<h2>
									<asp:Label ID="lblSelectViewTypeInfo" resourcekey="lblSelectViewTypeInfo" runat="server" Text="Select Rotator type:" EnableViewState="False" CssClass="topSettingsPodnaslov" />
								</h2>
							</div>
							<div class="content noTopPadding">
								<eds:EdsRadioButtonList ID="rblSelectViewType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblSelectViewType_SelectedIndexChanged" CssClass="styledRadio displayType" RepeatLayout="Flow" RepeatColumns="25" RepeatDirection="Vertical">
									<asp:ListItem Value="mostPopular" Cssclass="displaySettingsTitle normalRadioButton" resourcekey="MostPopularDisplays">Most Popular Displays</asp:ListItem>
									<asp:ListItem Value="1" CssClass="displayTypeThumbnail fourInRow chameleonRotator normalRadioButton"><span class="presetName">Chameleon Rotator</span><span>(Images, Video and HTML)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="10" CssClass="displayTypeThumbnail fourInRow multiCarouselRotator normalRadioButton"><span class="presetName">MultiCarousel Rotator</span><span>(Images, Video and HTML)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="14" CssClass="displayTypeThumbnail fourInRow tabRotator normalRadioButton"><span class="presetName">Tab Rotator</span><span>(Images, Video (Youtube, Vimeo) and HTML)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="13" CssClass="displayTypeThumbnail fourInRow sizeShifterRotator normalRadioButton"><span class="presetName">SizeShifter Rotator</span><span>(Images)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="15" CssClass="displayTypeThumbnail fourInRow carousel3DRotator normalRadioButton"><span class="presetName">Carousel 3D Rotator</span><span>(Images, Video (Youtube, Vimeo) and HTML)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="16" CssClass="displayTypeThumbnail fourInRow testimonialsRotator normalRadioButton"><span class="presetName">Testimonials Rotator</span><span>(Images, Video (Youtube, Vimeo) and HTML)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="17" CssClass="displayTypeThumbnail fourInRow deviceRotator normalRadioButton"><span class="presetName">Device Rotator</span><span>(Images, Video (Youtube, Vimeo) and HTML)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="18" CssClass="displayTypeThumbnail fourInRow thumbnailRotator normalRadioButton"><span class="presetName">Thumbnail Rotator</span><span>(Images, Video (Youtube, Vimeo) and HTML)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="12" CssClass="displayTypeThumbnail fourInRow newsTickerRotator normalRadioButton"><span class="presetName">NewsTicker Rotator</span><span>(Title)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="19" CssClass="displayTypeThumbnail fourInRow sliderWithAnimatedLayers normalRadioButton"><span class="presetName">Slider With Animated Layers Rotator</span><span>(HTML, Images and Video)</span><span class="aditional">responsive</span></asp:ListItem>
									<asp:ListItem Value="other" CssClass="displaySettingsTitle normalRadioButton" resourcekey="OtherDisplays">Other Displays</asp:ListItem>
									<asp:ListItem Value="2" CssClass="threeInRow normalRadioButton" Text="Advanced Rotator (Images)" />
									<asp:ListItem Value="11" CssClass="threeInRow normalRadioButton" Text="PokerCarousel Rotator (Images)" />
									<asp:ListItem Value="5" CssClass="threeInRow normalRadioButton" Text="Flash Cube Rotator (Flash(flv), Video(mp4) and Images)" />
								</eds:EdsRadioButtonList>
								<asp:Panel ID="pnlContentSourceSelection" runat="server" CssClass="contentSection selectSource negativeMargins40 separator">
									<div class="specialOptions">
										<h2>
											<asp:Label ID="lblSelectContentSource" resourcekey="lblSelectContentSource" runat="server" Text="Select content source:" EnableViewState="False" />
										</h2>
										<div class="optionsList">
											<asp:RadioButtonList ID="rblContentSourceSelection" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblContentSourceSelection_SelectedIndexChanged" CssClass="styledRadio" RepeatDirection="Horizontal">
												<asp:ListItem Value="0" Selected="True" resourcekey="liList" Text="Lists" />
												<asp:ListItem Value="1" Enabled="false" resourcekey="liNewsModule" Text="News module" />
												<asp:ListItem Value="2" Enabled="false" resourcekey="liGalleryModule" Text="Gallery module" />
												<asp:ListItem Value="3" Enabled="false" resourcekey="liGravityGallery" Text="Gravity gallery" />
											</asp:RadioButtonList>
										</div>
									</div>
								</asp:Panel>
								<asp:UpdatePanel ID="upNewsContentSource" runat="server" Visible="false">
									<ContentTemplate>
										<div class="paddingTopBottom">
											<div class="edn_admin_progress_overlay_container">
												<asp:UpdateProgress ID="uppNewsContentSource" runat="server" AssociatedUpdatePanelID="upNewsContentSource" DisplayAfter="100" DynamicLayout="true">
													<ProgressTemplate>
														<div class="edn_admin_progress_overlay">
														</div>
													</ProgressTemplate>
												</asp:UpdateProgress>
												<div class="optionsPanel paddingTopBottom">
													<asp:Label ID="lblInfoIntegrateOptions" resourcekey="lblInfoIntegrateOptions" runat="server" Text="News module integration options:" EnableViewState="False" CssClass="panelSubtitle" />
													<table>
														<tr id="trPortalSharing" runat="server">
															<td class="labels">
																<dnn:Label ID="lblPortalSharing" runat="server" Text="Portal sharing:" HelpText="Select data source portal." ControlName="ddlPortalSharing" HelpKey="lblPortalSharing.HelpText" ResourceKey="lblPortalSharing" />
															</td>
															<td>
															<%--	<asp:DropDownList ID="ddlPortalSharing" runat="server" AutoPostBack="True" DataTextField="PortalName" DataValueField="PortalIDFrom" OnSelectedIndexChanged="ddlPortalSharing_SelectedIndexChanged" />--%>
																<asp:ListBox runat="server" ID="lbSharingPortalID" SelectionMode="Multiple"></asp:ListBox>
																<asp:HiddenField runat="server" ID="hfSelectedSharingPortalID"  />
																<div class="itemActions itemEditActions">
																	<asp:Button ID="btnSharingPortal" runat="server" Text="Set portals" OnClick="btnSharingPortal_Click" CssClass="itemEditAdd" />
																</div>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblPermissionSource" runat="server" Text="Select permission source:" HelpText="Here you can select which permissions will be used by the rotator module to display articles to the users. In the rotator there are no permissions that could limit users' ability to see articles, but the rotator module can load permissions from the news module, thus displaying articles in accordance with permissions from the news module to the users. Available choices are None, Portal and Module. If None is selected, the rotator module will use no permissions at all. If Portal is selected, the rotator module will use permissions set up to be valid across the whole DNN portal for EasyDNNnews module. If Module is selected, you can choose between some of the EasyDNNnews module's instances on the portal whose permissions will be used."
																	ResourceKey="lblPermissionSource" HelpKey="lblPermissionSource.HelpText" />
															</td>
															<td>
																<asp:RadioButtonList ID="rblPermissionSource" runat="server" OnSelectedIndexChanged="rblPermissionSource_SelectedIndexChanged" AutoPostBack="true" RepeatDirection="Horizontal" CssClass="styledRadio small">
																	<asp:ListItem Selected="true" Text="None" Value="0" resourcekey="liNone" />
																	<asp:ListItem Text="Portal" Value="1" resourcekey="liPortal" />
																	<asp:ListItem Text="Module" Value="2" resourcekey="liModule" />
																</asp:RadioButtonList>
																<asp:Panel ID="pnlCategoryModuleInherite" runat="server" Visible="false" CssClass="paddingTop">
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlPermFromModuleInstance" runat="server" />
																	</div>
																</asp:Panel>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblUseScheduler" runat="server" Text="Enable clean-up for this instance:" HelpText="If this option is selected, the scheduler will automatically clean up the images and thumbnails not used in the rotator anymore. Images used in the news module will not be subjected to this clean-up."
																	ResourceKey="lblUseScheduler" HelpKey="lblUseScheduler.HelpText" />
															</td>
															<td>
																<div class="styledCheckbox noLabel">
																	<asp:CheckBox ID="cbUseScheduler" runat="server" Checked="false" OnCheckedChanged="cbUseScheduler_CheckedChanged" AutoPostBack="true" Text="Enable clean-up for this instance" />
																</div>
															</td>
														</tr>
													</table>
													<asp:Panel ID="pnlScheduleCleanUptime" runat="server" Visible="false" CssClass="optionsPanel paddingTopBottom">
														<table>
															<tr>
																<td class="labels">
																	<dnn:Label ID="lblNewsCleanUpTime" runat="server" Text="Clean up images not used after:" HelpText="Here you can set up the number of days prior to the clean-up of images." ResourceKey="lblNewsCleanUpTime" HelpKey="lblNewsCleanUpTime.HelpText" />
																</td>
																<td>
																	<asp:TextBox ID="tbxNewsCleanUpTime" runat="server" CssClass="small textCenter" Text="30" />&nbsp;<asp:Label ID="lblNewsCleanUpTimeDays" runat="server" resourcekey="lblNewsCleanUpTimeDays" Text="day(s)." />
																</td>
															</tr>
														</table>
													</asp:Panel>
													<table>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblOpenInNewsModule" runat="server" Text="Select instance of the news module where articles will be opened:" HelpText="If you have multiple instances of the news module on your portal, here you can select that instance of the news module where you wish the article details to be opened."
																	ControlName="ddlSelectNewsLinkOpen" ResourceKey="lblOpenInNewsModule" HelpKey="lblOpenInNewsModule.HelpText" />
															</td>
															<td>
																<div class="styledSelect large">
																	<asp:DropDownList ID="ddlSelectNewsLinkOpen" runat="server" />
																</div>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblNewsCategoriesSelect" runat="server" Text="Select categories for articles to be displayed from:" HelpText="Select the categories for the articles to be displayed from. 'Display All Articles' will display articles from all categories. If you unselect 'Display All Articles', you can choose individual categories for the articles to be displayed from."
																	ResourceKey="lblNewsCategoriesSelect" HelpKey="lblNewsCategoriesSelect.HelpText" />
															</td>
															<td>
																<div class="styledCheckbox">
																	<asp:CheckBox ID="cbDisplayAllCategories" resourcekey="cbDisplayAllCategories" runat="server" Checked="True" OnCheckedChanged="cbDisplayAllCategories_CheckedChanged" Text="Display all categories." AutoPostBack="True" />
																</div>
																<div id="rowNewsCategoriesSelect" runat="server" visible="false" class="paddingTop">
																	<asp:PlaceHolder ID="phDinamicTreeView" runat="server" />
																	<asp:CustomValidator ID="cvDinamicTreeView" resourcekey="cvDinamicTreeView" runat="server" ClientValidationFunction="CategoryClientValidate" Display="Dynamic" Enabled="true" ErrorMessage="Please select at least one category." ForeColor="Red" ValidationGroup="SettingsSave"
																		SetFocusOnError="true" CssClass="smallInfo error" />
																</div>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblShowAllAuthors" runat="server" Text="Select authors whose articles will be displayed:" HelpText="Select the authors from the news module whose articles you wish to be displayed in the rotator. 'Display All Authors' will display the articles by all authors. If you unselect 'Display All Authors', you can choose individual authors whose articles you wish to be displayed in the rotator."
																	ResourceKey="lblShowAllAuthors" HelpKey="lblShowAllAuthors.HelpText" />
															</td>
															<td>
																<div class="styledCheckbox">
																	<asp:CheckBox ID="cbShowAllAuthors" resourcekey="cbShowAllAuthors" runat="server" Checked="True" Text="Display all authors." AutoPostBack="True" OnCheckedChanged="cbShowAllAuthors_CheckedChanged" />
																</div>
																<div id="rowNewsAuthorsSelect" runat="server" visible="false" class="paddingTop clearWidth">
																	<asp:TreeView ID="tvAuthorAndGroupSelection" runat="server" ExpandDepth="0" ImageSet="Contacts" NodeIndent="25" CssClass="clearWidth">
																		<HoverNodeStyle Font-Underline="False" />
																		<NodeStyle Font-Size="12px" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
																		<ParentNodeStyle Font-Bold="True" />
																		<SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" VerticalPadding="0px" />
																	</asp:TreeView>
																	<asp:CustomValidator ID="cvAuthorsTreeview" runat="server" ClientValidationFunction="ClientValidateAuthors" Display="Dynamic" Enabled="False" ErrorMessage="Please select at least one author." resourcekey="cvAuthorsTreeview.ErrorMessage" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error"></asp:CustomValidator>
																</div>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblFeaturedArticles" runat="server" Text="Display Featured articles only:" HelpText="If this option is selected, the rotator will only display those articles that are marked as Featured articles in the news module." HelpKey="lblFeaturedArticles.HelpText"
																	ResourceKey="lblFeaturedArticles" />
															</td>
															<td>
																<div class="styledCheckbox noLabel">
																	<asp:CheckBox ID="cbDisplayfeaturedArticles" runat="server" Checked="False" Text="Display Featured articles only" />
																</div>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblNewsFilterBy" runat="server" Text="Display articles and events:" HelpText="This option allows for displaying articles only, or events only, or both." HelpKey="lblNewsFilterBy.HelpText" ResourceKey="lblNewsFilterBy" />
															</td>
															<td>
																<div class="styledCheckbox">
																	<asp:CheckBox ID="cbFilterByArticles" runat="server" Text="Articles" Checked="True" />
																	&nbsp;
																	<asp:CheckBox ID="cbFilterByEvents" runat="server" Text="Events" Checked="True" AutoPostBack="true" OnCheckedChanged="cbFilterByEvents_CheckedChanged" />
																</div>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblShowOnlyEventsLimit" runat="server" HelpText="Set the criteria to display events whose start date has ended. The option 'Show all' will display all events, disregarding the fact that they have already ended. We can enter the number of days to be set in the past for past events in the field 'Limit to number of days in the past'. If the set value is 0, the criterion for the event's listing will be the current date. In that case, neither of the past events will be displayed."
																	Text="Displaying of past events:" HelpKey="lblShowOnlyEventsLimit.HelpText" ResourceKey="lblShowOnlyEventsLimit" />
															</td>
															<td>
																<table class="clearWidth textLeft nowrap">
																	<tr>
																		<td>
																			<asp:RadioButtonList ID="rblLimitBackEvents" runat="server" RepeatDirection="Horizontal" CssClass="styledRadio small">
																				<asp:ListItem Value="All" resourcekey="liShowAll" Text="ShowAll" />
																				<asp:ListItem Value="Limit" resourcekey="liLimitDays" Text="Limit to number of days:" Selected="True" />
																			</asp:RadioButtonList>
																		</td>
																		<td>&nbsp;
																		</td>
																		<td>
																			<asp:TextBox ID="tbxPastEventLimit" runat="server" CssClass="small textCenter" Text="0" Enabled="false" MaxLength="3" ValidationGroup="SettingsSave" />
																		</td>
																	</tr>
																</table>
																<asp:RequiredFieldValidator ID="rfvPastEventLimit" runat="server" resourcekey="rfvPastEventLimit.ErrorMessage" ControlToValidate="tbxPastEventLimit" Display="Dynamic" ErrorMessage="This filed is required." SetFocusOnError="True" ValidationGroup="SettingsSave"
																	Enabled="false" CssClass="smallInfo error" />
																<asp:CompareValidator ID="cvPastEventLimit" runat="server" resourcekey="cvPastEventLimit.ErrorMessage" ControlToValidate="tbxPastEventLimit" Display="Dynamic" ErrorMessage="Please enter number only." Operator="DataTypeCheck" Type="Integer" ValidationGroup="SettingsSave"
																	Enabled="false" CssClass="smallInfo error" />
																<asp:RangeValidator ID="rvPastEventLimit" runat="server" resourcekey="rvPastEventLimit.ErrorMessage" ControlToValidate="tbxPastEventLimit" Display="Dynamic" ErrorMessage="Range between 0 and 999" MaximumValue="999" MinimumValue="0" SetFocusOnError="true"
																	Type="Integer" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblDynamicallyFilterByCategory" runat="server" Text="Dynamically display current category's content:" HelpText="If this option is selected, the rotator will only display articles from the currently selected category of the news module, while navigating through multiple news categories on the page."
																	HelpKey="lblDynamicallyFilterByCategory.HelpText" ResourceKey="lblDynamicallyFilterByCategory" />
															</td>
															<td>
																<div class="styledCheckbox noLabel">
																	<asp:CheckBox ID="cbDynamicallyFilterByCategory" runat="server" Checked="False" Text="Dynamically display current category's content" />
																</div>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblFilterByArticleTags" runat="server" Text="Dynamically display related articles:" HelpText="If this option is selected, the rotator will only display related articles by tags if article is beeing viewed." HelpKey="lblFilterByArticleTags.HelpText"
																	ResourceKey="lblFilterByArticleTags" />
															</td>
															<td>
																<div class="styledCheckbox noLabel">
																	<asp:CheckBox ID="cbFilterByArticleTags" runat="server" Checked="False" Text="Dynamically display current category's content" />
																</div>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblOrderArticlesBy" runat="server" HelpText="Choose the manner of listing the articles loaded from the news module." Text="Order articles by:" ControlName="ddlOrderRotationBy1" ResourceKey="lblOrderArticlesBy" HelpKey="lblOrderArticlesBy.HelpText" />
															</td>
															<td>
																<p>
																	1.&nbsp;<span class="styledSelect"><asp:DropDownList ID="ddlOrderRotationBy1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="MultiOdrerBySelection">
																	</asp:DropDownList>
																	</span><span class="styledSelect">
																		<asp:DropDownList ID="ddlAscOrder1" runat="server">
																			<asp:ListItem Value="DESC" resourcekey="liDescending">Descending</asp:ListItem>
																			<asp:ListItem Value="ASC" resourcekey="liAscending">Ascending</asp:ListItem>
																		</asp:DropDownList>
																	</span>
																</p>
																<p>
																	2.&nbsp;<span class="styledSelect"><asp:DropDownList ID="ddlOrderRotationBy2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="MultiOdrerBySelection">
																	</asp:DropDownList>
																	</span><span class="styledSelect">
																		<asp:DropDownList ID="ddlAscOrder2" runat="server">
																			<asp:ListItem Value="DESC" resourcekey="liDescending">Descending</asp:ListItem>
																			<asp:ListItem Value="ASC" resourcekey="liAscending">Ascending</asp:ListItem>
																		</asp:DropDownList>
																	</span>
																</p>
																<p>
																	3.&nbsp;<span class="styledSelect"><asp:DropDownList ID="ddlOrderRotationBy3" runat="server" AutoPostBack="True" Enabled="False">
																	</asp:DropDownList>
																	</span><span class="styledSelect">
																		<asp:DropDownList ID="ddlAscOrder3" runat="server" Enabled="False">
																			<asp:ListItem Value="DESC" resourcekey="liDescending">Descending</asp:ListItem>
																			<asp:ListItem Value="ASC" resourcekey="liAscending">Ascending</asp:ListItem>
																		</asp:DropDownList>
																	</span>
																</p>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblNewsSelectMethod" runat="server" Text="Limiting number of articles:" ControlName="tbxNumOfNewsPerCat" HelpText="Choose between two options. The first one, 'Display all articles from selected categories' will display all articles from selected categories, disregarding how many of them there are. The other option, 'Display a set number of articles from each category' limits the overall number of articles to be loaded from each selected category."
																	ResourceKey="lblNewsSelectMethod" HelpKey="lblNewsSelectMethod.HelpText" />
															</td>
															<td>
																<asp:RadioButtonList ID="rblNewsSelectMethod" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblNewsSelectMethod_SelectedIndexChanged" CssClass="styledRadio small">
																	<asp:ListItem resourcekey="liDisplayallarticles" Value="0" Selected="True" Text="Display all articles from selected categories." />
																	<asp:ListItem resourcekey="liDisplaymaximumnumber" Value="1" Text="Display maximum number of articles per category." />
																</asp:RadioButtonList>
															</td>
														</tr>
														<tr runat="server" id="rowNewsNumOfNewsPerCat" visible="false">
															<td class="labels"></td>
															<td>
																<asp:Label ID="lblNumOfNewsPerCat" resourcekey="lblNumOfNewsPerCat" runat="server" Text="Maximum number of articles per category:" ControlName="tbxNumOfNewsPerCat" />
																<asp:TextBox ID="tbxNumOfNewsPerCat" runat="server" CssClass="small textCenter" ControlToValidate="tbxNumOfNewsPerCat" Text="4" ValidationGroup="SettingsSave" />
																<asp:RequiredFieldValidator ID="rfvNumOfNewsPerCat" SetFocusOnError="true" resourcekey="rfvNumOfNewsPerCat.ErrorMessage" runat="server" ErrorMessage="Required Field!" ControlToValidate="tbxNumOfNewsPerCat" Display="Dynamic" ValidationGroup="SettingsSave"
																	CssClass="smallInfo error" />
																<asp:RangeValidator ID="rvNumOfNewsPerCat" SetFocusOnError="true" resourcekey="rvNumOfNewsPerCat.ErrorMessage" runat="server" ErrorMessage="Range 1-50" ControlToValidate="tbxNumOfNewsPerCat" MaximumValue="50" MinimumValue="1" Type="Integer" Display="Dynamic"
																	ValidationGroup="SettingsSave" CssClass="smallInfo error" />
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblNewsDescriptionSource" runat="server" Text="Select description source:" ControlName="rblNewsDescriptionSource" HelpText="Choose between two options. The first one, 'Use article summary as description' takes the article's summary and uses it as description in the rotator. The other option, 'Use article content as description' takes the article's content and uses it as description in the rotator."
																	ResourceKey="lblNewsDescriptionSource" HelpKey="lblNewsDescriptionSource.HelpText" />
															</td>
															<td>
																<asp:RadioButtonList ID="rblNewsDescriptionSource" runat="server" RepeatDirection="Vertical" CssClass="styledRadio small">
																	<asp:ListItem resourcekey="liNewssummaryasdescription" Selected="True" Value="1" Text="News summary as description" />
																	<asp:ListItem resourcekey="liNewscontentasdescription" Value="2" Text="News content as description" />
																</asp:RadioButtonList>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblnsOnlyWithImages" runat="server" Text="Display articles with main article image only:" HelpText="If this option is selected, the rotator will only display those articles from the news module that contain a main article image. The main article image can be added from add/edit form of the news module."
																	ResourceKey="lblnsOnlyWithImages" HelpKey="lblnsOnlyWithImages.HelpText" />
															</td>
															<td>
																<div class="styledCheckbox noLabel">
																	<asp:CheckBox ID="cbnsOnlyWithImages" runat="server" Enabled="False" Checked="True" Text="Display articles with main article image only" />
																</div>
															</td>
														</tr>
														<tr runat="server" id="tblRowIsSocialInstance" style="background: #D1EBFA; display: none;">
															<td class="labels" style="border: 1px solid #AAD6F1; border-right: 0;">
																<dnn:Label ID="lblIsSocialInstance" runat="server" Text="Community mode:" HelpText="Displays user's and group's articles on the Activity feed. The articles are filtered by the UserID or GroupID querystring. If this option is enabled and the querystring UserID or GroupID is missing, then the articles won't show up."
																	ControlName="cbIsSocialInstance" ResourceKey="lblIsSocialInstance" HelpKey="lblIsSocialInstance.HelpText" />
															</td>
															<td style="border: 1px solid #AAD6F1; border-left: 0;">
																<div class="styledCheckbox noLabel">
																	<asp:CheckBox ID="cbIsSocialInstance" Text="Community mode" runat="server" Checked="false" OnCheckedChanged="cbIsSocialInstance_CheckedChanged" AutoPostBack="true" />
																</div>
															</td>
														</tr>
													</table>
												</div>
											</div>
										</div>
									</ContentTemplate>
								</asp:UpdatePanel>
								<asp:UpdatePanel ID="upRotatorListContentSource" runat="server">
									<ContentTemplate>
										<div class="paddingTopBottom">
											<div class="edn_admin_progress_overlay_container">
												<asp:UpdateProgress ID="uppRotatorListContentSource" runat="server" AssociatedUpdatePanelID="upRotatorListContentSource" DisplayAfter="100" DynamicLayout="true">
													<ProgressTemplate>
														<div class="edn_admin_progress_overlay">
														</div>
													</ProgressTemplate>
												</asp:UpdateProgress>
												<div class="optionsPanel paddingTopBottom">
													<asp:Label ID="lblSelectList" resourcekey="lblSelectList" runat="server" Text="Select List for Rotation:" EnableViewState="False" CssClass="panelSubtitle" />
													<table>
														<tr>
															<td class="labels textMiddle">
																<asp:Label ID="lblSelectCategoryddl" resourcekey="lblSelectCategoryddl" runat="server" Text="Select category: " />
															</td>
															<td>
																<div class="styledSelect middle higher">
																	<asp:DropDownList ID="ddlSelectCategoryRS" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSelectCategoryRS_SelectedIndexChanged" AppendDataBoundItems="True" />
																</div>
																<span class="itemActions itemEditActions big">
																	<asp:LinkButton ID="goToContentManagement" resourcekey="goToContentManagement" runat="server" Text="Content Management" OnClick="goToContentManagement_Click" CssClass="itemEditAdd" />
																</span>
																<asp:RequiredFieldValidator ID="rfvSelectCategoryddl" runat="server" ControlToValidate="ddlSelectCategoryRS" ErrorMessage="Please select Category." SetFocusOnError="True" ValidationGroup="SettingsSave" resourcekey="rfvCategorySelect.ErrorMessage" InitialValue="0"
																	Display="Dynamic" CssClass="smallInfo error inline" />
															</td>
														</tr>
														<tr>
															<td class="labels textMiddle">
																<asp:Label ID="lblSelectListddl" resourcekey="lblSelectListddl" runat="server" Text="Select list:" />
															</td>
															<td>
																<div class="styledSelect middle higher">
																	<asp:DropDownList ID="ddlSelectListRS" runat="server" CausesValidation="True" ValidationGroup="SettingsSave" SetFocusOnError="True" />
																</div>
																<asp:RequiredFieldValidator ID="rfvSelectListRS" runat="server" ControlToValidate="ddlSelectListRS" ErrorMessage="Please select List." SetFocusOnError="True" ValidationGroup="SettingsSave" resourcekey="rfvListSelect.ErrorMessage" InitialValue="0" CssClass="smallInfo error inline" />
															</td>
														</tr>
													</table>
													<asp:Label ID="lblCategoryListSelectInfo" runat="server" class="infoMessages warning static" EnableViewState="false" Visible="false" />
												</div>
											</div>
										</div>
									</ContentTemplate>
								</asp:UpdatePanel>
								<asp:UpdatePanel ID="upGalleryContentSource" runat="server" Visible="false">
									<ContentTemplate>
										<div class="paddingTopBottom">
											<div class="edn_admin_progress_overlay_container">
												<asp:UpdateProgress ID="uppGalleryContentSource" runat="server" AssociatedUpdatePanelID="upGalleryContentSource" DisplayAfter="100" DynamicLayout="true">
													<ProgressTemplate>
														<div class="edn_admin_progress_overlay">
														</div>
													</ProgressTemplate>
												</asp:UpdateProgress>
												<div class="optionsPanel paddingTopBottom">
													<asp:Label ID="lblSelectGalleryforRotation" resourcekey="lblSelectGalleryforRotation" runat="server" Text="Select Gallery for Rotation:" EnableViewState="False" CssClass="panelSubtitle" />
													<table>
														<tr>
															<td class="labels">
																<asp:Label ID="lblSelectGalleryCategory" resourcekey="lblSelectGalleryCategory" runat="server" Text="Select category:" />
															</td>
															<td>
																<div class="styledSelect">
																	<asp:DropDownList ID="ddlGalleryCategorySelect" runat="server" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlGalleryCategorySelect_SelectedIndexChanged" />
																</div>
																<span class="itemActions itemEditActions">
																	<asp:LinkButton ID="btnGaleryContentManagement" resourcekey="btnGaleryContentManagement" runat="server" Text="Content Management" OnClick="goToGalleryContentManagement_Click" CssClass="itemEditAdd" />
																</span>
																<asp:RequiredFieldValidator ID="rfvGalleryCategorySelect" runat="server" ControlToValidate="ddlGalleryCategorySelect" ErrorMessage="Please select Category." SetFocusOnError="True" ValidationGroup="SettingsSave" resourcekey="rfvCategorySelect.ErrorMessage"
																	InitialValue="0" Display="Dynamic" CssClass="smallInfo error inline" />
															</td>
														</tr>
														<tr>
															<td class="labels">
																<asp:Label ID="lblGalleryGaleries" resourcekey="lblGalleryGaleries" runat="server" Text="Select gallery:" />
															</td>
															<td>
																<div class="styledSelect">
																	<asp:DropDownList ID="ddlGalleryGalleriesSelect" runat="server" CausesValidation="True" ValidationGroup="SettingsSave" SetFocusOnError="True" />
																</div>
																<asp:RequiredFieldValidator ID="rfvGalleryGalleriesSelect" runat="server" ControlToValidate="ddlGalleryGalleriesSelect" ErrorMessage="Please select List." SetFocusOnError="True" ValidationGroup="SettingsSave" resourcekey="rfvListSelect.ErrorMessage" InitialValue="0"
																	CssClass="smallInfo error inline" />
															</td>
														</tr>
													</table>
													<asp:Label ID="lblCategoryGallerySelectInfo" runat="server" class="infoMessages warning static" EnableViewState="false" Visible="false" />
												</div>
											</div>
										</div>
									</ContentTemplate>
								</asp:UpdatePanel>
								<asp:UpdatePanel ID="upGravityGalleryContentSource" runat="server" Visible="false">
									<ContentTemplate>
										<div class="paddingTopBottom">
											<div class="edn_admin_progress_overlay_container">
												<asp:UpdateProgress ID="uppGravityGalleryContentSource" runat="server" AssociatedUpdatePanelID="upGravityGalleryContentSource" DisplayAfter="100" DynamicLayout="true">
													<ProgressTemplate>
														<div class="edn_admin_progress_overlay">
														</div>
													</ProgressTemplate>
												</asp:UpdateProgress>
												<div class="optionsPanel paddingTopBottom">
													<asp:Label ID="lblGravityGallery" resourcekey="lblGravityGallery" runat="server" Text="Gravity gallery settings" EnableViewState="False" CssClass="panelSubtitle" />
													<table>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblGravityUseScheduler" runat="server" Text="Enable clean-up for this instance:" HelpText="If this option is selected, the scheduler will automatically clean up the images and thumbnails not used in the rotator anymore. Images used in the gallery module will not be subjected to this clean-up."
																	ResourceKey="lblGravityUseScheduler" HelpKey="lblGravityUseScheduler.HelpText" />
															</td>
															<td>
																<div class="styledCheckbox noLabel">
																	<asp:CheckBox ID="cbGravityUseScheduler" runat="server" Checked="false" OnCheckedChanged="cbGravityUseScheduler_CheckedChanged" AutoPostBack="true" Text="Enable clean-up for this instance:" />
																</div>
															</td>
														</tr>
													</table>
													<asp:Panel ID="pnlGravityScheduleCleanUptime" runat="server" Visible="false" CssClass="optionsPanel paddingTopBottom">
														<table>
															<tr>
																<td class="labels">
																	<dnn:Label ID="lblGravityCleanUpTime" runat="server" Text="Clean up images not used after:" HelpText="Here you can set up the number of days prior to the clean-up of images." ResourceKey="lblGravityCleanUpTime" HelpKey="lblGravityCleanUpTime.HelpText" />
																</td>
																<td>
																	<asp:TextBox ID="tbxGravityCleanUpTime" runat="server" CssClass="small textCenter" Text="30" />&nbsp;<asp:Label ID="lblGravityCleanUpTimeDays" runat="server" resourcekey="lblGravityCleanUpTimeDays" Text="day(s)." />
																</td>
															</tr>
														</table>
													</asp:Panel>
													<table>
														<tr id="trGalleryPortalSharing" runat="server" visible="false">
															<td class="labels">
																<dnn:Label ID="lblGalleryPortalSharing" runat="server" Text="Portal sharing:" HelpText="Select data source portal." ControlName="ddlGalleryPortalSharing" HelpKey="lblGalleryPortalSharing.HelpText" ResourceKey="lblGalleryPortalSharing" />
															</td>
															<td>
																<div class="styledSelect">
																	<asp:DropDownList ID="ddlGalleryPortalSharing" runat="server" AutoPostBack="True" DataTextField="PortalName" DataValueField="PortalIDFrom" OnSelectedIndexChanged="ddlGalleryPortalSharing_SelectedIndexChanged" />
																</div>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblGravityWhereToOpen" runat="server" Text="Select instance of the gallery module where gallery will be opened:" HelpText="Where gallery will be opened when clicked." ControlName="ddlGravityWhereToOpen" />
															</td>
															<td>
																<div class="styledSelect large">
																	<asp:DropDownList ID="ddlGravityWhereToOpen" runat="server" />
																</div>
																<asp:RequiredFieldValidator InitialValue="0" ID="rfvGravityWhereToOpen" Display="Dynamic" ValidationGroup="SettingsSave" runat="server" ControlToValidate="ddlGravityWhereToOpen" ErrorMessage="Select instance." SetFocusOnError="true" CssClass="smallInfo error"></asp:RequiredFieldValidator>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblGravityOrderBy" runat="server" HelpText="Choose the manner of listing the galleries loaded from the news module." Text="Order galleries by:" ControlName="ddlGravityOrderBy" ResourceKey="lblGravityOrderBy" HelpKey="lblGravityOrderBy.HelpText" />
															</td>
															<td>
																<span class="styledSelect">
																	<asp:DropDownList ID="ddlGravityOrderBy" runat="server">
																		<asp:ListItem resourcekey="liPublishdate" Selected="True" Value="PublishDate" Text="Publish date" />
																		<asp:ListItem resourcekey="liLastmodified" Value="DateLastModified" Text="Last modified" />
																		<asp:ListItem resourcekey="liGalleryName" Value="GalleryName" Text="Gallery name" />
																		<asp:ListItem resourcekey="liNumberofviews" Value="NumberOfViews" Text="Number of views" />
																	</asp:DropDownList>
																</span><span class="styledSelect">
																	<asp:DropDownList ID="ddlGravityOrderByType" runat="server">
																		<asp:ListItem Value="DESC" resourcekey="liDescending">Descending</asp:ListItem>
																		<asp:ListItem Value="ASC" resourcekey="liAscending">Ascending</asp:ListItem>
																	</asp:DropDownList>
																</span>
															</td>
														</tr>
														<tr>
															<td class="labels">
																<dnn:Label ID="lblGravityAllCategories" runat="server" Text="All Categories:" HelpText="Galleries from all categories." ResourceKey="lblGravityAllCategories" HelpKey="lblGravityAllCategories.HelpText" />
															</td>
															<td>
																<div class="styledCheckbox">
																	<asp:CheckBox ID="cbGravityAllCategories" resourcekey="cbGravityAllCategories" runat="server" Checked="True" OnCheckedChanged="cbGravityAllCategories_CheckedChanged" Text="Display all categories." AutoPostBack="True" />
																</div>
															</td>
														</tr>
													</table>
													<asp:Panel ID="pnlGravitySelectCategories" runat="server" CssClass="optionsPanel paddingTop" Visible="false">
														<table>
															<tr>
																<td class="labels">
																	<asp:Label ID="lblAvailableCategories" runat="server" Text="Available categories" Font-Bold="true" />
																</td>
																<td></td>
																<td>
																	<asp:Label ID="lblSelectedCategories" runat="server" Text="Selected Categories" Font-Bold="true" />
																</td>
															</tr>
															<tr>
																<td class="labels">
																	<asp:ListBox ID="lboxNotSelectedCategories" runat="server" Style="min-width: 250px; min-height: 250px;" SelectionMode="Multiple" />
																</td>
																<td class="textMiddle textCenter">
																	<div class="itemActions itemEditActions">
																		<asp:Button ID="btnRemoveCategory" runat="server" Text="<<" OnClick="btnRemoveCategory_Click" ToolTip="Remove" ValidationGroup="vgSelectedCategories" CausesValidation="true" CssClass="itemEditRemove" />
																		<asp:Button ID="btnAddCategory" runat="server" Text=">>" OnClick="btnAddCategory_Click" ToolTip="Add" ValidationGroup="vgNotSelectedCategories" CausesValidation="true" CssClass="itemEditAdd" />
																	</div>
																</td>
																<td>
																	<asp:ListBox ID="lboxSelectedCategories" runat="server" Style="min-width: 250px; min-height: 250px;" SelectionMode="Multiple" ValidationGroup="SettingsSave" />
																</td>
															</tr>
															<tr>
																<td class="textcenter" colspan="2">
																	<asp:RequiredFieldValidator ID="rfvNotSelectedCategories" ValidationGroup="vgNotSelectedCategories" ControlToValidate="lboxNotSelectedCategories" runat="server" ErrorMessage="Please select categorie to add!" Display="Dynamic" SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvSelectedCategories" ValidationGroup="vgSelectedCategories" ControlToValidate="lboxSelectedCategories" runat="server" ErrorMessage="Please select categorie to remove!" Display="Dynamic" SetFocusOnError="True" CssClass="smallInfo error" />
																</td>
															</tr>
														</table>
													</asp:Panel>
													<asp:Panel ID="pnlGravitySelectGalleries" runat="server" CssClass="optionsPanel paddingTopBottom" Visible="false">
														<table>
															<tr>
																<td class="labels">
																	<asp:ListBox ID="lboxNotSelectedGalleries" runat="server" Style="min-width: 250px; min-height: 250px; vertical-align: middle;" SelectionMode="Multiple" />
																</td>
																<td class="textMiddle textCenter">
																	<div class="itemActions itemEditActions">
																		<asp:Button ID="btnRemoveGallery" runat="server" Text="<<" OnClick="btnRemoveGallery_Click" ToolTip="Remove" ValidationGroup="vgSelectedGalleries" CausesValidation="true" CssClass="itemEditRemove" />
																		<asp:Button ID="btnAddGallery" runat="server" Text=">>" OnClick="btnAddGallery_Click" ToolTip="Add" ValidationGroup="vgNotSelectedGalleries" CausesValidation="true" CssClass="itemEditAdd" />
																	</div>
																</td>
																<td>
																	<asp:ListBox ID="lboxSelectedGalleries" runat="server" Style="min-width: 250px; min-height: 250px;" SelectionMode="Multiple" ValidationGroup="SettingsSave" />
																</td>
															</tr>
															<tr>
																<td class="textCenter" colspan="2">
																	<asp:RequiredFieldValidator ID="rfvNotSelectedGalleries" ValidationGroup="vgNotSelectedGalleries" ControlToValidate="lboxNotSelectedGalleries" runat="server" ErrorMessage="Please select gallery to add!" Display="Dynamic" SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvSelectedGalleries" ValidationGroup="vgSelectedGalleries" ControlToValidate="lboxSelectedGalleries" runat="server" ErrorMessage="Please select gallery to remove!" Display="Dynamic" SetFocusOnError="True" CssClass="smallInfo error" />
																</td>
															</tr>
														</table>
													</asp:Panel>
													<asp:Label ID="lblGravityGalleryInfo" runat="server" class="infoMessages warning static" EnableViewState="false" Visible="false" />
												</div>
											</div>
										</div>
									</ContentTemplate>
								</asp:UpdatePanel>
								<asp:Panel ID="pnlModuleVisibility" runat="server" CssClass="contentSection moduleVisibility negativeMargins40 separator">
									<div class="specialOptions">
										<h2>
											<dnn:Label ID="lblModuleVisibility" runat="server" Text="Module visibility:" HelpText="Here you can set when you wish the module to be visible on the page. If 'Module always visible' option is selected, the module is visible all the time. If 'Show module only when the news module displays the list of articles' option is selected, the rotator will only be visible when the news module displays the list of articles, yet it won't be visible when article details are displayed. If 'Show module only when the news module displays article details' option is selected, the rotator will only be visible when article details are displayed, yet it won't be visible when the list of articles is displayed. Note: The module is always visible to admin and host users."
												ResourceKey="lblModuleVisibility" HelpKey="lblModuleVisibility.HelpText" />
										</h2>
										<div class="optionsList">
											<asp:RadioButtonList ID="rblModuleVisibility" runat="server" CssClass="styledRadio small" RepeatDirection="Horizontal">
												<asp:ListItem Selected="True" Text="Default (always show module)" Value="0" />
												<asp:ListItem Text="Show rotator only if article list mode" Value="1" />
												<asp:ListItem Text="Show rotator only if article details mode" Value="2" />
											</asp:RadioButtonList>
										</div>
									</div>
								</asp:Panel>
								<div runat="server" id="pnlLocalization" class="contentSection localization paddingTop negativeMargins40">
									<div class="specialOptions">
										<h2>
											<span>
												<%=LocalizationText%></span>
										</h2>
										<div class="optionsList">
											<dnn:Label ID="lblHideUnlocalizedItems" runat="server" Text="Don't show unlocalized items:" HelpText="Unlocalized content won't show when localization selected." ResourceKey="lblHideUnlocalizedItems" HelpKey="lblHideUnlocalizedItems.HelpText" />
											<div class="styledCheckbox noLabel displayInline">
												<asp:CheckBox ID="cbHideUnlocalizedItems" runat="server" Text="Don't show unlocalized items:" />
											</div>
										</div>
									</div>
								</div>
								<div class="contentSection cacheContent paddingTopBottom negativeMargins40">
									<div class="specialOptions">
										<h2>
											<dnn:Label ID="lblCacheContent" runat="server" Text="Cache content:" HelpText="If this option is switched on, the rotator's content will be cached. The rotator uses DNN portal's cache settings (Host > Host Settings > Advanced > Performance Settings)."
												ResourceKey="lblCacheContent" HelpKey="lblCacheContent.HelpText" />
										</h2>
										<div class="optionsList">
											<div class="styledCheckbox noLabel displayInline">
												<asp:CheckBox ID="cbCacheContent" runat="server" Checked="True" Text="Cache content" />
											</div>
										</div>
									</div>
								</div>
								<asp:UpdatePanel ID="upRotatorSettings" runat="server" UpdateMode="Always">
									<ContentTemplate>
										<div class="edn_admin_progress_overlay_container negativeMargins40">
											<asp:UpdateProgress ID="uppRotatorSettings" runat="server" AssociatedUpdatePanelID="upRotatorSettings" DisplayAfter="100" DynamicLayout="true">
												<ProgressTemplate>
													<div class="edn_admin_progress_overlay">
													</div>
												</ProgressTemplate>
											</asp:UpdateProgress>
											<asp:Panel runat="server" ID="pnlRotatorSettings" Visible="false">
												<asp:Panel ID="pnlGlobalRotatorSettings" runat="server" Visible="false" CssClass="settingsList">
													<asp:HiddenField ID="hfPermissionsState" runat="server" EnableViewState="true" Value="collapsed" />
													<h3>
														<asp:Label ID="lblRotatorSettingsNameHeader" runat="server" />
													</h3>
													<div class="settingsTable">
														<table>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblLoadSettingsHead" resourcekey="lblLoadSettingsHead" runat="server" Text="Load Settings" />
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<asp:DataList ID="dlPreSettingsLoad" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" class="predefinedThumbnails" OnItemCommand="dlPreSettingsLoad_ItemCommand">
																		<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
																		<ItemTemplate>
																			<div class="thumbnail">
																				<asp:Image ID="imgThumbPreSet" CssClass="presetImage" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImageURL") %>' />
																				<h5 class="presetName">
																					<asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' />
																				</h5>
																				<asp:LinkButton ID="lbLoadXmlPreSet" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FileName") %>' CommandName="Load" CssClass="selectPreSettings"><span><%=LoadText%></span></asp:LinkButton>
																			</div>
																		</ItemTemplate>
																	</asp:DataList>
																</td>
															</tr>
															<tr class="color6HighLighted">
																<td colspan="2" style="padding: 10px 40px;">
																	<i class="fa fa-chevron-right">&nbsp;</i><asp:Label ID="lblLoadMainSettings" resourcekey="lblLoadMainSettings" runat="server" Text="OR select from list" EnableViewState="False" />
																	<div class="styledSelect large" style="vertical-align: top;">
																		<asp:DropDownList ID="ddlRotatorLoadSettings" runat="server" />
																		<dnn:Label ID="lblRotatorLoadSettings" runat="server" HelpText="Settings from other Module instance(DB), and XML files(ModulePath/PreSettings/)." Text="" ControlName="ddlRotatorLoadSettings" HelpKey="lblRotatorLoadSettings.HelpText" />
																	</div>
																	<div class="itemActions itemEditActions">
																		<asp:LinkButton ID="lbLoadSelectedSettings" runat="server" CssClass="itemEditAdd" OnClick="lbLoadSettingsFromDdl" CausesValidation="false"><%=LoadText%></asp:LinkButton>
																	</div>
																	<asp:Label ID="lblLoadSettingsInfo" runat="server" CssClass="infoMessages info" EnableViewState="false" Visible="false" />
																</td>
															</tr>
														</table>
													</div>
												</asp:Panel>
												<asp:Panel ID="pnlRotatorParametersContainer" runat="server" Visible="false" CssClass="settingsList">
													<div class="settingsTable">
														<table>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblRotatorInfoTheme" resourcekey="lblRotatorInfoTheme" runat="server" Text="Theme select:" EnableViewState="False" />
																</td>
															</tr>
															<tr>
																<td colspan="2"></td>
															</tr>
															<tr runat="server" id="trAscxControlSelect">
																<td>
																	<dnn:Label ID="lblRotatorTemplate" runat="server" Text="Select custom template:" HelpText="Select original or custom template control" ControlName="ddlRotatorTemplate" ResourceKey="lblRotatorTemplate" HelpKey="lblRotatorTemplate.HelpText" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlRotatorTemplate" runat="server" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblRotatorTheme" runat="server" HelpText="Select theme and style for rotator." Text="Select theme and style:" ControlName="ddlRotatorTheme" ResourceKey="lblRotatorTheme" HelpKey="lblRotatorTheme.HelpText" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlRotatorTheme" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRotatorTheme_SelectedIndexChanged" OnDataBound="ddlRotatorTheme_DataBound" />
																	</div>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlCssClassSelect" runat="server" />
																	</div>
																</td>
															</tr>
															<tr runat="server" id="rowThemeArrows">
																<td>
																	<dnn:Label ID="lblthemeArrows" runat="server" HelpText="Select arrows type and style." Text="Select arrows type and style:" ControlName="ddlThemeArrows" ResourceKey="lblthemeArrows" HelpKey="lblthemeArrows.HelpText" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlThemeArrows" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlThemeArrows_SelectedIndexChanged" />
																	</div>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlThemeArrowsClass" runat="server" />
																	</div>
																</td>
															</tr>
															<tr id="rowHtmTemplate" runat="server">
																<td>
																	<dnn:Label ID="lblHtmTemplate" runat="server" Text="Select custom htm template:" HelpText="Template is located at ../Controls/ControlName/static/themes/templates/ You can edit, modify, create new templates and combine them with tokens." ControlName="ddlHtmTemplate"
																		ResourceKey="lblHtmTemplate" HelpKey="lblHtmTemplate.HelpText" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlHtmTemplate" runat="server" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="ddlHtmTemplate_SelectedIndexChanged" />
																	</div>
																</td>
															</tr>
															<tr id="rowShadowSelect" runat="server">
																<td>
																	<dnn:Label ID="lblShadowSelect" runat="server" HelpText="Select main container shadow." Text="Select main container shadow:" ControlName="ddlShadowSelect" ResourceKey="lblShadowSelect" HelpKey="lblShadowSelect.HelpText" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlShadowSelect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlShadowSelect_SelectedIndexChanged" />
																	</div>
																</td>
															</tr>
															<tr id="rowShadowStyle" runat="server">
																<td>
																	<dnn:Label ID="lblShadowStyle" runat="server" HelpText="Select main container shadow style." Text="Select shadow style:" ControlName="ddlShadowStyle" ResourceKey="lblShadowStyle" HelpKey="lblShadowStyle.HelpText" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlShadowStyle" runat="server" />
																	</div>
																</td>
															</tr>
															<tr id="rowBorderStyle" runat="server">
																<td>
																	<dnn:Label ID="lblChameleonBorder" runat="server" HelpText="Main container border size and color." Text="Border size and color:" ResourceKey="lblChameleonBorder" HelpKey="lblChameleonBorder.HelpText" />
																</td>
																<td>
																	<script type="text/javascript">
																		jQuery(document).ready(function ($) {
																			$('#<%=tbxRotatorBorderColor.ClientID%>').ColorPicker({
																				onSubmit: function (hsb, hex, rgb, el) {
																					$(el).val(hex).ColorPickerHide();
																					$('#' + el.id + '1').css('backgroundColor', '#' + hex);
																				},
																				onBeforeShow: function () {
																					$(this).ColorPickerSetColor(this.value);
																				}
																			}).bind('keyup', function () {
																				$(this).ColorPickerSetColor(this.value);
																			});
																		});
																	</script>
																	<asp:TextBox ID="tbxRotatorBorderSize" runat="server" Width="50px" CssClass="boxposition" MaxLength="3" ValidationGroup="SettingsSave">0</asp:TextBox>&nbsp - &nbsp
																	<asp:RequiredFieldValidator ID="rfvRotatorBorderSize" resourcekey="rfvRotatorBorderSize.ErrorMessage" runat="server" ControlToValidate="tbxRotatorBorderSize" Display="Dynamic" ErrorMessage="Enter Value! " ValidationGroup="SettingsSave" SetFocusOnError="true" />
																	<asp:RangeValidator ID="rvRotatorBorderSize" resourcekey="rvRotatorBorderSize.ErrorMessage" runat="server" ControlToValidate="tbxRotatorBorderSize" Display="Dynamic" ErrorMessage="Range between 0 and 999" MaximumValue="999" MinimumValue="0" Type="Integer"
																		ValidationGroup="SettingsSave" SetFocusOnError="true" />
																	<div id="<%=tbxRotatorBorderColor.ClientID%>1" style="width: 20px; height: 20px; border-width: thin; border-style: solid; background-color: #<%=tbxRotatorBorderColor.Text%>; display: inline-block; margin: auto;">
																	</div>
																	#
																	<asp:TextBox ID="tbxRotatorBorderColor" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">ffffff</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvRotatorBorderColor" resourcekey="rfvRotatorBorderColor.ErrorMessage" runat="server" ControlToValidate="tbxRotatorBorderColor" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" />
																	<asp:RegularExpressionValidator ID="revRotatorBorderColor" resourcekey="revRotatorBorderColor.ErrorMessage" runat="server" ControlToValidate="tbxRotatorBorderColor" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$"
																		ValidationGroup="SettingsSave" />
																</td>
															</tr>
															<tr>
																<td colspan="2"></td>
															</tr>
															<tr runat="server" id="rowCropMethode">
																<td>
																	<dnn:Label ID="lblCropMethod" runat="server" ControlName="rblCropMethod" HelpText="Resizes main image with selected method when generating images." Text="Main image resize:" ResourceKey="lblCropMethod" HelpKey="lblCropMethod.HelpText" />
																</td>
																<td>
																	<asp:RadioButtonList ID="rblCropMethod" runat="server" RepeatDirection="Horizontal" CssClass="styledRadio small">
																		<asp:ListItem resourcekey="liResizeandcrop" Text="Resize and crop" Value="0" Selected="True" />
																		<asp:ListItem resourcekey="liProportionallyresize" Text="Proportionally resize" Value="1" />
																	</asp:RadioButtonList>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblJpegImageQuality" runat="server" ControlName="tbxJpegQuality" HelpText="Jpeg compression quality. (1 - 100)" Text="Jpeg compression quality:" ResourceKey="lblJpegImageQuality" HelpKey="lblJpegImageQuality.HelpText" />
																</td>
																<td>
																	<asp:TextBox ID="tbxJpegQuality" runat="server" MaxLength="3" ValidationGroup="SettingsSave" CssClass="small textCenter">97</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvtbxJpegQuality" resourcekey="rfvtbxJpegQuality.ErrorMessage" runat="server" ControlToValidate="tbxJpegQuality" Display="Dynamic" ErrorMessage="Enter Value! " SetFocusOnError="true" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvtbxJpegQuality" resourcekey="rvtbxJpegQuality.ErrorMessage" runat="server" ControlToValidate="tbxJpegQuality" Display="Dynamic" ErrorMessage="Range between 1 and 100" MaximumValue="100" MinimumValue="1" SetFocusOnError="true"
																		Type="Integer" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblNumToRotate" runat="server" ControlName="tbxRotatorNumToRotate" HelpText="Number of items that will be rotated. (0 for all)" Text="Number of items that will be rotated:" ResourceKey="lblNumToRotate" HelpKey="lblNumToRotate.HelpText" />
																</td>
																<td>
																	<asp:TextBox ID="tbxRotatorNumToRotate" runat="server" MaxLength="3" ValidationGroup="SettingsSave" CssClass="small textCenter">20</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvNumToRotate" resourcekey="rfvNumToRotate.ErrorMessage" runat="server" ControlToValidate="tbxRotatorNumToRotate" Display="Dynamic" ErrorMessage="Enter Value! " SetFocusOnError="true" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvNumToRotate" resourcekey="rvNumToRotate.ErrorMessage" runat="server" ControlToValidate="tbxRotatorNumToRotate" Display="Dynamic" ErrorMessage="Range between 0 and 200" MaximumValue="200" MinimumValue="0" SetFocusOnError="true"
																		Type="Integer" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblRandomizeContent" runat="server" ControlName="cbRandomizeContent" HelpText="Selected content is randomized." Text="Randomize content:" ResourceKey="lblRandomizeContent" HelpKey="lblRandomizeContent.HelpText" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbRandomizeContent" runat="server" Text="Randomize content" />
																	</div>
																</td>
															</tr>
															<tr id="rowjsFallback" runat="server">
																<td>
																	<dnn:Label ID="lbljsFallback" runat="server" ControlName="cbjsFallback" HelpText="Shows first image of selected list." Text="If JavaScript is disabled, use fallback:" ResourceKey="lbljsFallback" HelpKey="lbljsFallback.HelpText" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbjsFallback" runat="server" Text="If JavaScript is disabled, use fallback" />
																	</div>
																</td>
															</tr>
														</table>
													</div>
													<script type="text/javascript">
														jQuery(document).ready(function () {
															jQuery(".schemaPrev").show();
															jQuery('.schemaPrev').click(function () {
																jQuery(".slidingDiv").slideToggle();
																jQuery(".rightGoTo").slideToggle();
																jQuery('.lblschemePre').text(jQuery('.lblschemePre').text() == '<%=HideSketch%>' ? '<%=ShowSketch%>' : '<%=HideSketch%>'); return false;
															});
														});
													</script>
													<asp:Panel ID="pnlChameleonRotator" runat="server" Visible="false" CssClass="settingsTable paddingTop">
														<a id="maincontainer"></a>
														<div class="schemaPrev">
															<a id="CRtopPreView"></a>
															<asp:Label ID="lblschemaPre1" resourcekey="lblschemaPre1" class="lblschemePre" runat="server" Text="Hide Sketch" />
														</div>
														<div class="slidingDiv paddingTopBottom" style="text-align: center;">
															<img src="<%=ModulePath%>Images/chameleonPrew.jpg" alt="Rotator Preview" usemap="#Map" style="border: 0;" />
															<map name="Map" id="Map">
																<area shape="rect" coords="517,14,732,51" href="#maincontainer" alt="Main panel" />
																<area shape="rect" coords="632,109,774,142" href="#itempanel" alt="Item panel" />
																<area shape="rect" coords="653,154,768,215" href="#socialbuttons" alt="Social Buttons" />
																<area shape="rect" coords="627,239,778,279" href="#pagination" alt="Pagination" />
																<area shape="rect" coords="432,318,674,358" href="#thumbnailspanel" alt="Thumbnails Panel" />
																<area shape="rect" coords="87,329,325,364" href="#CRplaystopbutton" alt="Play stop button" />
																<area shape="rect" coords="5,228,140,288" href="#CRautoplayindicator" alt="Auto play indicator" />
																<area shape="rect" coords="3,100,154,171" href="#navigationarrows" alt="Navigation arrows" />
																<area shape="rect" coords="18,6,338,45" href="#CRtitledescriptionpanel" alt="Title description panel" />
															</map>
														</div>
														<table>
															<tr class="rotatorPanel">
																<td colspan="2" class="textCenter" style="background-color: #636363;">
																	<asp:Label ID="lblCRMainPanel" resourcekey="lblCRMainPanel" runat="server" EnableViewState="False" Text="Main container:" />
																</td>
															</tr>
															<tr>
																<td></td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCRWH" runat="server" Text="Rotator Width / Height:" ResourceKey="lblCRWH.Text" HelpKey="lblCRWH.Help" HelpText="The width/height of the rotator. Nothing in the rotator can be displayed outside of this container."></dnn:Label>
																</td>
																<td>
																	<asp:TextBox ID="tbxCRSliderW" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="750" />
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlCRSliderWAsRatio" runat="server">
																			<asp:ListItem Value="False">px</asp:ListItem>
																			<asp:ListItem Value="True">%</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																	<asp:TextBox ID="tbxCRSliderH" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="400" />
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlCRSliderHAsRatio" runat="server">
																			<asp:ListItem Value="False">px</asp:ListItem>
																			<asp:ListItem Value="True">%</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																	<asp:RequiredFieldValidator resourcekey="rfvCRSliderW.ErrorMessage" ID="rfvCRSliderW" runat="server" ControlToValidate="tbxCRSliderW" Display="Dynamic" ErrorMessage="Width Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator resourcekey="rfvCRSliderH.ErrorMessage" ID="rfvCRSliderH" runat="server" ControlToValidate="tbxCRSliderH" Display="Dynamic" ErrorMessage="Height Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvCRSliderW" resourcekey="rvCRSliderW.ErrorMessage" runat="server" ControlToValidate="tbxCRSliderW" Display="Dynamic" ErrorMessage=" (W) between 1 and 5000 px. " MaximumValue="5000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																		SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvCRSliderH" resourcekey="rvCRSliderH.ErrorMessage" runat="server" ControlToValidate="tbxCRSliderH" Display="Dynamic" EnableViewState="False" ErrorMessage="(H) between 1 and 2000 px." MaximumValue="2000" MinimumValue="0" Type="Integer"
																		ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	<a id="itempanel"></a>
																</td>
															</tr>
															<tr runat="server" id="trHeightReferencesWidthContainer" style="display: none;">
																<td>
																	<dnn:Label ID="lblChameleonHeightReferencesWidth" runat="server" Text="Proportionaly resize:" HelpText="Calculate the rotator's height as a ratio of it's width, i.e. if the height is set to 50%, the rotator's height will be exactely half of it's width."
																		ResourceKey="lblChameleonHeightReferencesWidth" HelpKey="lblChameleonHeightReferencesWidth.HelpText" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbChameleonHeightReferencesWidth" runat="server" Checked="false" Text="Proportionaly resize" />
																	</div>
																</td>
															</tr>
														</table>
														<table class="settings_table">
															<tr class="rotatorPanel">
																<td class="textCenter" style="background-color: #FB815A;">
																	<span class="onOffToggle">
																		<asp:CheckBox ID="cbMPDisplay" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="true" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																	<asp:Label ID="lblMainPanelTitle" ResourceKey="lblMainPanelTitle" runat="server" EnableViewState="False" Text="Item panel:" />
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlMPDisplay" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblCRMainPictureWH" runat="server" HelpText="Width and height of main picture AND Container in pixels." Text="Item Width / Height:" />
																	</td>
																	<td>
																		<asp:TextBox ID="tbxCRMainPictureW" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">750</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlMPItemWAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxCRMainPictureH" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">400</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlMPItemHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvCRMainPictureW" resourcekey="rfvCRMainPictureW.ErrorMessage" runat="server" ControlToValidate="tbxCRMainPictureW" Display="Dynamic" ErrorMessage="Width Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RequiredFieldValidator ID="rfvCRMainPictureH" resourcekey="rfvCRMainPictureH.ErrorMessage" runat="server" ControlToValidate="tbxCRMainPictureH" Display="Dynamic" ErrorMessage="Height Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCRMainPictureW" resourcekey="rvCRMainPictureW.ErrorMessage" runat="server" ControlToValidate="tbxCRMainPictureW" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680 px " MaximumValue="7680" MinimumValue="1" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCRMainPictureH" resourcekey="rvCRMainPictureH.ErrorMessage" runat="server" ControlToValidate="tbxCRMainPictureH" Display="Dynamic" EnableViewState="False" ErrorMessage="(H) between 1 and 1200 px." MaximumValue="1200" MinimumValue="1"
																			Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblMPPosV" runat="server" Text="Vertical Position and Offset:" HelpText="Vertical Position. If Top then offset is calculated from top, else Bottom." ControlName="ddlMPPosV" />
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlMPPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxMPPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">0</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlMPPosVAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvMPPosVOff" resourcekey="rfvMPPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxMPPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvMPPosVOff" resourcekey="rvMPPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxMPPosVOff" Display="Dynamic" ErrorMessage="Positive number (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblMPPosH" runat="server" Text="Horizontal Position and Offset:" HelpText="Horizontal Position. If Left then offset is calculated from left, else Right." ControlName="ddlMPPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlMPPosH" runat="server">
																				<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																				<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxMPPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">0</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlMPPosHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvMPPosHOff" resourcekey="rfvMPPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxMPPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvMPPosHOff" resourcekey="rvMPPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxMPPosHOff" Display="Dynamic" ErrorMessage="Range between (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblMPTransDuration" runat="server" Text="Transition Duration:" HelpText="Main Panel Transition Duration." ControlName="tbxMPTransDuration" ResourceKey="lblMPTransDuration" HelpKey="lblMPTransDuration.HelpText"></dnn:Label>
																	</td>
																	<td>
																		<asp:TextBox ID="tbxMPTransDuration" runat="server" CssClass="small textCenter" ValidationGroup="SettingsSave">800</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvMPTransDuration" resourcekey="rfvMPTransDuration.ErrorMessage" runat="server" ControlToValidate="tbxMPTransDuration" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" />
																		<asp:RangeValidator ID="rvtbxMPTransDuration" resourcekey="rvtbxMPTransDuration.ErrorMessage" runat="server" ControlToValidate="tbxMPTransDuration" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" />
																	</td>
																</tr>
																<tr>
																	<td class="textTop">
																		<%=Effects%>
																	</td>
																	<td>
																		<div class="collapsable_box">
																			<p class="switch styledCheckbox">
																				<asp:CheckBox ID="cbMPEffFade" resourcekey="cbMPEffFade" runat="server" Checked="true" Text="Fade" />
																			</p>
																		</div>
																		<div class="collapsable_box">
																			<p class="switch styledCheckbox">
																				<asp:CheckBox ID="cbMPEffSlide" resourcekey="cbMPEffSlide" runat="server" Checked="true" Text="Slide" />
																			</p>
																			<div class="collapsableContent paddingTopBottom" runat="server" id="pnlMOEffSlide">
																				<asp:RadioButtonList ID="rblMPEffSlideType" runat="server" RepeatDirection="Horizontal" CssClass="styledRadio small">
																					<asp:ListItem resourcekey="liSelectdirections" Value="select_directions" Selected="True" Text="Select directions" />
																					<asp:ListItem resourcekey="liForcehorizontalsliding" Value="force_horizontal" Text="Force horizontal sliding" />
																					<asp:ListItem resourcekey="liForceverticalsliding" Value="force_vertical" Text="Force vertical sliding" />
																				</asp:RadioButtonList>
																				<div id="rblMPEffSlideSelectDirections" runat="server" class="paddingTop">
																					<table class="styledCheckbox">
																						<tr>
																							<td>
																								<asp:CheckBox ID="cbMPEffSlideUp" resourcekey="liUp" runat="server" Checked="true" Text="Up" />
																							</td>
																							<td>&nbsp;
																							</td>
																							<td>
																								<asp:CheckBox ID="cbMPEffSlideDown" resourcekey="liDown" runat="server" Checked="true" Text="Down" />
																							</td>
																						</tr>
																						<tr>
																							<td>
																								<asp:CheckBox ID="cbMPEffSlideLeft" resourcekey="liLeft" runat="server" Checked="true" Text="Left" />
																							</td>
																							<td>&nbsp;
																							</td>
																							<td>
																								<asp:CheckBox ID="cbMPEffSlideRight" resourcekey="liRight" runat="server" Checked="true" Text="Right" />
																							</td>
																						</tr>
																					</table>
																				</div>
																				<script type="text/javascript">
																					/* <[CDATA[ */
																					jQuery(document).ready(function ($) {
																						var $select_directions_switch = $('#<%=rblMPEffSlideType.ClientID%>_0, #<%=rblMPEffSlideType.ClientID%>_1, #<%=rblMPEffSlideType.ClientID%>_2'),
																							$target = $('#<%=rblMPEffSlideSelectDirections.ClientID%>');

																						$select_directions_switch.bind('change', function () {
																							if (this.id == '<%=rblMPEffSlideType.ClientID%>_0')
																								$target.slideDown('200');
																							else
																								$target.slideUp('200');
																						});
																					});
																					/* ]]> */
																				</script>
																			</div>
																		</div>
																		<div class="collapsable_box" runat="server" id="divCRStripes">
																			<p class="switch styledCheckbox">
																				<asp:CheckBox ID="cbMPEffStripes" runat="server" Checked="true" Text="Stripes" />
																			</p>
																			<div class="collapsableContent" runat="server" id="pnlMPEffStripes">
																				<p class="option">
																					<label for="<%=tbxMPEffStripesNumOf.ClientID%>">
																						<%=Numberofstripes%></label>
																					<asp:TextBox ID="tbxMPEffStripesNumOf" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">15</asp:TextBox>
																					<asp:RequiredFieldValidator ID="rfvMPEffStripesNumOf" resourcekey="rfvMPEffStripesNumOf.ErrorMessage" runat="server" ControlToValidate="tbxMPEffStripesNumOf" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																						CssClass="smallInfo error" />
																					<asp:RangeValidator ID="rvMPEffStripesNumOf" resourcekey="rvMPEffStripesNumOf.ErrorMessage" runat="server" ControlToValidate="tbxMPEffStripesNumOf" Display="Dynamic" ErrorMessage="Positive number (0 - 1000). " MaximumValue="1000" MinimumValue="0" Type="Integer"
																						ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																				</p>
																				<p class="option">
																					<label for="<%=ddlMPEffStripesOrientation.ClientID%>">
																						<%=Orientation%></label>
																					<div class="styledSelect middle">
																						<asp:DropDownList ID="ddlMPEffStripesOrientation" runat="server">
																							<asp:ListItem resourcekey="liHorizontal" Value="horizontal">Horizontal</asp:ListItem>
																							<asp:ListItem resourcekey="liVertical" Value="vertical">Vertical</asp:ListItem>
																						</asp:DropDownList>
																					</div>
																					<div class="styledCheckbox displayInline">
																						<asp:CheckBox ID="cbMPEffStripesRandOrient" resourcekey="liRandomize" runat="server" Checked="true" Text="Randomize" />
																					</div>
																				</p>
																				<p class="option">
																					<label for="<%=ddlMPEffStripesDirection.ClientID%>">
																						Direction:</label>
																					<div class="styledSelect middle">
																						<asp:DropDownList ID="ddlMPEffStripesDirection" runat="server">
																							<asp:ListItem resourcekey="liBottom/Right" Value="0">Bottom/Right</asp:ListItem>
																							<asp:ListItem resourcekey="liTop/Left" Value="1">Top/Left</asp:ListItem>
																							<asp:ListItem resourcekey="Alternating" Value="2">Alternating</asp:ListItem>
																						</asp:DropDownList>
																					</div>
																					<div class="styledCheckbox displayInline">
																						<asp:CheckBox ID="cbMPEffStripesRandDirect" resourcekey="liRandomize" runat="server" Checked="true" Text="Randomize" />
																					</div>
																				</p>
																				<p class="option">
																					<label for="<%=ddlMPEffStripesStartAt.ClientID%>">
																						Start at:</label>
																					<div class="styledSelect middle">
																						<asp:DropDownList ID="ddlMPEffStripesStartAt" runat="server">
																							<asp:ListItem resourcekey="liTop/Left" Value="0">Top/Left</asp:ListItem>
																							<asp:ListItem resourcekey="liBottom/Right" Value="1">Bottom/Right</asp:ListItem>
																							<asp:ListItem resourcekey="liCenter" Value="2">Center</asp:ListItem>
																							<asp:ListItem resourcekey="liOuter" Value="3">Outer</asp:ListItem>
																						</asp:DropDownList>
																					</div>
																					<div class="styledCheckbox displayInline">
																						<asp:CheckBox ID="cbMPEffStripesRandStartAt" resourcekey="liRandomize" runat="server" Checked="true" Text="Randomize" />
																					</div>
																				</p>
																			</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblKeyBrowse" runat="server" Text="Keyboard Navigation:" HelpText="Keyboard Navigation" ControlName="cbKeyBrowse"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbKeyBrowse" runat="server" Checked="true" Text="Keyboard Navigation" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblRediOnClick" runat="server" Text="Redirect on click:" HelpText="Redirect on click" ControlName="cbRediOnClick"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbRediOnClick" runat="server" Checked="true" Text="Redirect on click" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblRediOnClickTarget" runat="server" Text="Redirect On Click Target:" HelpText="Redirect On Click Target" ControlName="ddlRediOnClickTarget"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlRediOnClickTarget" runat="server">
																				<asp:ListItem resourcekey="liSelf" Value="_self" Selected="True">Self</asp:ListItem>
																				<asp:ListItem resourcekey="liBlank" Value="_blank">Blank</asp:ListItem>
																				<asp:ListItem resourcekey="liParent" Value="_parent">Parent</asp:ListItem>
																				<asp:ListItem resourcekey="liTopTarget" Value="_top">Top</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblChameleonDragNavigation" runat="server" Text="Touch & swipe:" HelpText="This option enables support for touch input devices such as iPhone, iPad... The chameleon can be controlled by mouse dragging or moving." ControlName="cbChameleonDragNavigation"
																			ResourceKey="lblChameleonDragNavigation" HelpKey="lblChameleonDragNavigation.HelpText" />
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbChameleonDragNavigation" runat="server" Checked="true" Text="Touch & swipe:" />
																		</div>
																	</td>
																</tr>
																<tr id="Tr1" runat="server">
																	<td>
																		<dnn:Label ID="lblChameleonStrechImage" runat="server" ControlName="cbStrechImage" HelpText="If an image is smaller than the item panel, it will be stretched out to fit the panel." Text="Stretch smaller images:" ResourceKey="lblChameleonStrechImage" HelpKey="lblChameleonStrechImage.HelpText" />
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbChameleonStrechImage" runat="server" Text="Stretch smaller images" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblCRmainPanelImageAlign" runat="server" Text="Align image in main panel:" HelpText="Alignes image in main panel like selected value." ControlName="ddlCRmainPanelImageAlign" ResourceKey="lblCRmainPanelImageAlign" HelpKey="lblCRmainPanelImageAlign.HelpText" />
																	</td>
																	<td>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlCRmainPanelImageAlign" runat="server" OnSelectedIndexChanged="ddlCRmainPanelImageAlign_SelectedIndexChanged" AutoPostBack="true">
																				<asp:ListItem resourcekey="liCenter-center" Value="0" Selected="True" Text="Center-center" />
																				<asp:ListItem resourcekey="liTop-left" Value="1" Text="Top-left" />
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
															</table>
															<a id="thumbnailspanel"></a>
															<div class="rightGoToContainer">
																<a href="#CRtopPreView" class="rightGoTo">
																	<%=BacktoSketch%></a>
															</div>
														</asp:Panel>
														<table class="settings_table">
															<tr class="rotatorPanel">
																<td class="textCenter" style="background-color: #F951B0;">
																	<asp:Label ID="lblCRThumbs" resourcekey="lblCRThumbs" runat="server" EnableViewState="false" Text="Thumbnails panel:" />
																	<span class="onOffToggle">
																		<asp:CheckBox ID="cbThumbsDisplay" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="true" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlThumbsDisplay" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblThumbPagiDirection" runat="server" Text="Thumbnails Orientation:" HelpText="Thumbnails Orientation" ControlName="ddlThumbPagiDirection"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlThumbPagiDirection" runat="server">
																				<asp:ListItem resourcekey="liHorizontal" Value="horizontal">Horizontal</asp:ListItem>
																				<asp:ListItem resourcekey="liVertical" Value="vertical">Vertical</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblCRThumbWH" runat="server" Text="Thumb Picture Width / Height:" HelpText="Width, height of the thumbs in pixels"></dnn:Label>
																	</td>
																	<td>
																		<asp:TextBox ID="tbxCRThumbW" runat="server" CssClass="small textCenter" ValidationGroup="SettingsSave">100</asp:TextBox>
																		/
																		<asp:TextBox ID="tbxCRThumbH" runat="server" CssClass="small textcenter" MaxLength="6" ValidationGroup="SettingsSave">46</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvCRThumbW" resourcekey="rfvCRThumbW.ErrorMessage" runat="server" ControlToValidate="tbxCRThumbW" Display="Dynamic" ErrorMessage="Width Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RequiredFieldValidator ID="rfvCRThumbH" resourcekey="rfvCRThumbH.ErrorMessage" runat="server" ControlToValidate="tbxCRThumbH" Display="Dynamic" ErrorMessage="Height Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCRThumbW" resourcekey="rvCRThumbW.ErrorMessage" runat="server" ControlToValidate="tbxCRThumbW" Display="Dynamic" ErrorMessage="(W) 10 - 800 px. " MaximumValue="800" MinimumValue="10" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCRThumbH" resourcekey="rvCRThumbH.ErrorMessage" runat="server" ControlToValidate="tbxCRThumbH" Display="Dynamic" EnableViewState="False" ErrorMessage="(H) 10 - 800 px." MaximumValue="800" MinimumValue="10" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblThumbContWH" runat="server" Text="Container Width / Height:" HelpText="The size of the container in witch all thumbnails are positioned"></dnn:Label>
																	</td>
																	<td>
																		<asp:TextBox ID="tbxThumbContW" runat="server" CssClass="small textCenter" ValidationGroup="SettingsSave">720</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlThumbContWAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		/
																		<asp:TextBox ID="tbxThumbContH" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">50</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlThumbContHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvThumbContW" resourcekey="rfvThumbContW.ErrorMessage" runat="server" ControlToValidate="tbxThumbContW" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvThumbContW" resourcekey="rvThumbContW.ErrorMessage" runat="server" ControlToValidate="tbxThumbContW" Display="Dynamic" ErrorMessage="Positive number (0 - 1920). " MaximumValue="1920" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RequiredFieldValidator ID="rfvThumbContH" resourcekey="rfvThumbContH.ErrorMessage" runat="server" ControlToValidate="tbxThumbContH" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" />
																		<asp:RangeValidator ID="rvThumbContH" resourcekey="rvThumbContH.ErrorMessage" runat="server" ControlToValidate="tbxThumbContH" Display="Dynamic" ErrorMessage="Positive number (0 - 1080). " MaximumValue="1080" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblThumbContPosV" runat="server" Text="Container Vertical position and Offset:" HelpText="Container Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlThumbContPosV"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlThumbContPosV" runat="server">
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxThumbContPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">0</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlThumbContPosVAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvThumbContPosVOff" resourcekey="rfvThumbContPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxThumbContPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvThumbContPosVOff" resourcekey="rvThumbContPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxThumbContPosVOff" Display="Dynamic" ErrorMessage="Positive number (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000"
																			Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblThumiContPosH" runat="server" Text="Container Horizontal position and Offset:" HelpText="Container Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlThumiContPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlThumiContPosH" runat="server">
																				<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																				<asp:ListItem resourcekey="liLeft" Value="left" Selected="True">Left</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxThumbContPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">15</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlThumbContPosHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvThumbContPosHOff" resourcekey="rfvThumbContPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxThumbContPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvThumbContPosHOff" resourcekey="rvThumbContPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxThumbContPosHOff" Display="Dynamic" ErrorMessage="Positive number (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000"
																			Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblThumbsAutoHide" runat="server" Text="Auto Hide:" HelpText="Auto hide thumbnails" ControlName="cbThumbsAutoHide"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbThumbsAutoHide" runat="server" Text="Auto Hide" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblThumbsHideSpeed" runat="server" Text="Hide Speed:" HelpText="Thumbs Hide Speed" ControlName="tbxThumbsHideSpeed"></dnn:Label>
																	</td>
																	<td>
																		<asp:TextBox ID="tbxThumbsHideSpeed" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">250</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvThumbsHideSpeed" resourcekey="rfvThumbsHideSpeed.ErrorMessage" runat="server" ControlToValidate="tbxThumbsHideSpeed" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvThumbsHideSpeed" resourcekey="rvThumbsHideSpeed.ErrorMessage" runat="server" ControlToValidate="tbxThumbsHideSpeed" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblThumbCaptions" runat="server" Text="Display Caption:" HelpText="Display each item's title over it's thumbnail if it has one" ControlName="cbThumbCaptions" />
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbThumbCaptions" runat="server" Text="Display Caption" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblThumbTitleLenght" runat="server" HelpText="Number of characters in title string to display in thumb caption" Text="Caption title lenght:" ControlName="tbxThumbTitleLenght" />
																	</td>
																	<td>
																		<asp:TextBox ID="tbxThumbTitleLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">50</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvThumbTitleLenght" resourcekey="rfvThumbTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxThumbTitleLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvThumbTitleLenght" resourcekey="rvThumbTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxThumbTitleLenght" Display="Dynamic" ErrorMessage="1 - 500 " MaximumValue="500" MinimumValue="1" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblThumbPagiDuration" runat="server" Text="Page switching duration:" HelpText="The time (in milliseconds) that the thumbnails page switch effect will take" ControlName="tbxThumbPagiDuration"></dnn:Label>
																	</td>
																	<td>
																		<asp:TextBox ID="tbxThumbPagiDuration" runat="server" Width="60px" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">250</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvThumbPagiDuration" resourcekey="rfvThumbPagiDuration.ErrorMessage" runat="server" ControlToValidate="tbxThumbPagiDuration" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvThumbPagiDuration" resourcekey="rvThumbPagiDuration.ErrorMessage" runat="server" ControlToValidate="tbxThumbPagiDuration" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblThumbPagiEasing" runat="server" Text="Page switching easing:" HelpText="The easing function that the thumbnails page switch effect will use. The default is swing." ControlName="ddlThumbPagiEasing"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlThumbPagiEasing" runat="server" Width="80px">
																				<asp:ListItem resourcekey="liSwing" Value="swing">Swing</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="textTop">
																		<dnn:Label ID="lblCRTooltips" runat="server" Text="Tooltips:" HelpText="Tooltip settings." ControlName="cbCRTooltips" ResourceKey="lblCRTooltips" HelpKey="lblCRTooltips.HelpText"></dnn:Label>
																	</td>
																	<td>
																		<div class="collapsable_box">
																			<p class="switch styledCheckbox">
																				<asp:CheckBox ID="cbCRTooltips" resourcekey="cbCRTooltips" runat="server" Text="Enable" />
																			</p>
																			<div class="collapsableContent" runat="server" id="pnlTooltips" style="display: none">
																				<table class="nowrap textLeft" style="width: 450px !important">
																					<tr>
																						<td>
																							<dnn:Label ID="lblCRTooltipTitle" runat="server" Text="Display title in tooltip:" HelpText="Displays title in tooltip." ControlName="cbCRTooltipTitle" ResourceKey="lblCRTooltipTitle"></dnn:Label>
																						</td>
																						<td>
																							<div class="styledCheckbox noLabel">
																								<asp:CheckBox ID="cbCRTooltipTitle" runat="server" Checked="true" Text="Display title in tooltip" />
																							</div>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<dnn:Label ID="lblCRTooltipTitleLenght" runat="server" HelpText="Number of characters in title string to display in Item Container" Text="Title lenght:" ControlName="tbxCRTooltipTitleLenght" ResourceKey="lblCRTooltipTitleLenght" />
																						</td>
																						<td>
																							<asp:TextBox ID="tbxCRTooltipTitleLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">25</asp:TextBox>
																							<asp:RequiredFieldValidator ID="rfvCRTooltipTitleLenght" resourcekey="rfvCRTooltipTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxCRTooltipTitleLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																								CssClass="smallInfo error" />
																							<asp:RangeValidator ID="rvCRTooltipTitleLenght" resourcekey="rvCRTooltipTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxCRTooltipTitleLenght" Display="Dynamic" ErrorMessage="0 - 500 " MaximumValue="500" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																								SetFocusOnError="True" CssClass="smallInfo error" />
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<dnn:Label ID="lblCRTooltipDescript" runat="server" Text="Display description in tooltip:" HelpText="Displays description in tooltip." ControlName="cbCRTooltipDescript" ResourceKey="lblCRTooltipDescript"></dnn:Label>
																						</td>
																						<td>
																							<div class="styledCheckbox noLabel">
																								<asp:CheckBox ID="cbCRTooltipDescript" runat="server" Text="Display description in tooltip:" />
																							</div>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<dnn:Label ID="lblCRTooltipDescriptLenght" runat="server" HelpText="Number of characters in description string to display in tooltip. Depends on html css tags in string." Text="Description lenght:" ControlName="tbxCRTooltipDescriptLenght" ResourceKey="lblCRTooltipDescriptLenght" />
																						</td>
																						<td>
																							<asp:TextBox ID="tbxCRTooltipDescriptLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">100</asp:TextBox>
																							<asp:RequiredFieldValidator ID="rfvCRTooltipDescriptLenght" resourcekey="rfvCRTooltipDescriptLenght.ErrorMessage" runat="server" ControlToValidate="tbxCRTooltipDescriptLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																								CssClass="smallInfo error" />
																							<asp:RangeValidator ID="rvCRTooltipDescriptLenght" resourcekey="rvCRTooltipDescriptLenght.ErrorMessage" runat="server" ControlToValidate="tbxCRTooltipDescriptLenght" Display="Dynamic" ErrorMessage="0 - 4000 " MaximumValue="4000" MinimumValue="0" Type="Integer"
																								ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<dnn:Label ID="lblCRToolTipPosition" runat="server" Text="Position:" HelpText="Position of tooltip box." ControlName="ddlCRToolTipPosition" ResourceKey="lblCRToolTipPosition"></dnn:Label>
																						</td>
																						<td>
																							<div class="styledSelect">
																								<asp:DropDownList ID="ddlCRToolTipPosition" runat="server">
																									<asp:ListItem resourcekey="liTop" Value="topcenter" Text="Top" />
																									<asp:ListItem resourcekey="liRight" Value="rightcenter" Text="Right" />
																									<asp:ListItem resourcekey="liBottom" Value="bottomcenter" Text="Bottom" />
																									<asp:ListItem resourcekey="liLeft" Value="leftcenter" Text="Left" />
																								</asp:DropDownList>
																							</div>
																						</td>
																					</tr>
																					<tr>
																						<td>
																							<dnn:Label ID="lblCRToolTipClasss" runat="server" Text="Style:" HelpText="Css styles for tooltip." ControlName="ddlCRToolTipClasss" ResourceKey="lblCRToolTipClasss"></dnn:Label>
																						</td>
																						<td>
																							<div class="styledSelect">
																								<asp:DropDownList ID="ddlCRToolTipClasss" runat="server">
																									<asp:ListItem resourcekey="ligrey" Text="grey" Value="grey" />
																									<asp:ListItem resourcekey="lired" Text="red" Value="red" />
																									<asp:ListItem resourcekey="ligreen" Text="green" Value="green" />
																									<asp:ListItem resourcekey="liblue" Text="blue" Value="blue" />
																								</asp:DropDownList>
																							</div>
																						</td>
																					</tr>
																				</table>
																			</div>
																		</div>
																	</td>
																</tr>
															</table>
															<a id="CRtitledescriptionpanel"></a>
															<div class="rightGoToContainer">
																<a href="#CRtopPreView" class="rightGoTo">
																	<%=BacktoSketch%></a>
															</div>
														</asp:Panel>
														<table class="settings_table">
															<tr class="rotatorPanel">
																<td class="textCenter" style="background-color: #FCC761;">
																	<asp:Label ID="lblCRItemInfo" resourcekey="lblCRItemInfo" runat="server" EnableViewState="False" Text="Title/description panel:" />
																	<span class="onOffToggle">
																		<asp:CheckBox ID="cbItemInfDisplay" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="True" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlItemInfDisplay" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblItemInfWH" runat="server" Text="Width / Height:" HelpText="Title, description Container Width / Height in pixels" ControlName="tbxItemInfHeight" />
																	</td>
																	<td>
																		<asp:TextBox ID="tbxItemInfWidth" runat="server" CssClass="small textCenter" ValidationGroup="SettingsSave">750</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlItemInfWAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		/
																		<asp:TextBox ID="tbxItemInfHeight" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">100</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlItemInfHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvItemInfWidth" resourcekey="rfvItemInfWidth.ErrorMessage" runat="server" ControlToValidate="tbxItemInfWidth" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvItemInfWidth" resourcekey="rvItemInfWidth.ErrorMessage" runat="server" ControlToValidate="tbxItemInfWidth" Display="Dynamic" ErrorMessage="Positive number (0 - 1920). " MaximumValue="1920" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RequiredFieldValidator ID="rfvItemInfHeight" resourcekey="rfvItemInfHeight.ErrorMessage" runat="server" ControlToValidate="tbxItemInfHeight" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvItemInfHeight" resourcekey="rvItemInfHeight.ErrorMessage" runat="server" ControlToValidate="tbxItemInfHeight" Display="Dynamic" ErrorMessage="Positive number (0 - 1080). " MaximumValue="1080" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblItemInfPosV" runat="server" Text="Vertical position and Offset:" HelpText="Conteiner Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlItemInfPosV" />
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlItemInfPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxItemInfPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">0</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlItemInfPosVAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvItemInfPosVOff" resourcekey="rfvItemInfPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxItemInfPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvItemInfPosVOff" resourcekey="rvItemInfPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxItemInfPosVOff" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblItemInfPosH" runat="server" Text="Horizontal position and Offset:" HelpText="Conteiner Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlItemInfPosH" />
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlItemInfPosH" runat="server">
																				<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																				<asp:ListItem resourcekey="liLeft" Value="left" Selected="True">Left</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxItemInfPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">347</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlItemInfPosHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvItemInfPosHOff" resourcekey="rfvItemInfPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxItemInfPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvItemInfPosHOff" resourcekey="rvItemInfPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxItemInfPosHOff" Display="Dynamic" ErrorMessage="Positive number (0 - 20000)." MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblItemInfTitleLenght" runat="server" HelpText="Number of characters in title string to display in Item Container" Text="Title lenght:" ControlName="tbxCRTitleLenght" />
																	</td>
																	<td>
																		<asp:TextBox ID="tbxItemInfTitleLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">50</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvItemInfTitleLenght" resourcekey="rfvItemInfPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxItemInfTitleLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvItemInfTitleLenght" resourcekey="rvItemInfTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxItemInfTitleLenght" Display="Dynamic" ErrorMessage="0 - 500 " MaximumValue="500" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblItemInfDescriptionLenght" runat="server" HelpText="Number of characters in description string to display in Item Container. Depends on html css tags in string" Text="Description lenght:" ControlName="tbxCRDescriptionLenght" />
																	</td>
																	<td>
																		<asp:TextBox ID="tbxItemInfDescriptionLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">500</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvItemInfDescriptionLenght" resourcekey="rfvItemInfPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxItemInfDescriptionLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvItemInfDescriptionLenght" resourcekey="rvItemInfDescriptionLenght.ErrorMessage" runat="server" ControlToValidate="tbxItemInfDescriptionLenght" Display="Dynamic" ErrorMessage="0 - 4000 " MaximumValue="4000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblChameleonStripHtml" runat="server" HelpText="Only text is displayed in rotator description place." Text="Strip HTML from description:" ControlName="cbChameleonStripHtmlDesc" ResourceKey="lblChameleonStripHtml" />
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbChameleonStripHtmlDesc" runat="server" Text="Strip HTML from description" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblcrResizeToContent" runat="server" Text="Resize to content:" HelpText="Title, description box resizes depending on text lenght." ControlName="crResizeToContent" ResourceKey="lblcrResizeToContent" />
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbcrResizeToContent" runat="server" Text="Resize to content" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblcrShowOnHover" runat="server" Text="Auto hide:" HelpText="Auto hide title/description panel." ControlName="cbcrShowOnHover" ResourceKey="lblcrShowOnHover" />
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbcrShowOnHover" runat="server" Checked="false" Text="Auto hide:" />
																		</div>
																	</td>
																</tr>
															</table>
															<a id="navigationarrows"></a>
															<div class="rightGoToContainer">
																<a href="#CRtopPreView" class="rightGoTo">
																	<%=BacktoSketch%></a>
															</div>
														</asp:Panel>
														<table class="settings_table">
															<tr class="rotatorPanel">
																<td class="textCenter" style="background-color: #50B8DB;">
																	<asp:Label ID="lblCRArrows" resourcekey="lblCRArrows" runat="server" EnableViewState="False" Text="Navigation arrows:" />
																	<span class="onOffToggle">
																		<asp:CheckBox ID="cbArrDisplay" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="True" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlArrDisplay" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblArrAutoHide" runat="server" Text="Auto Hide:" HelpText="Auto hide arrows" ControlName="cbArrAutoHid" />
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbArrAutoHide" runat="server" Text="Auto Hide" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblArrHideSpeed" runat="server" Text="Auto Hide Speed:" HelpText="Auto Hide Speed" ControlName="tbxAPIndHeight" />
																	</td>
																	<td>
																		<asp:TextBox ID="tbxArrHideSpeed" runat="server" CssClass="small textCenter" ValidationGroup="SettingsSave">250</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvArrHideSpeed" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxArrHideSpeed" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvArrHideSpeed" resourcekey="rvArrHideSpeed.ErrorMessage" runat="server" ControlToValidate="tbxArrHideSpeed" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblArrPrevPosV" runat="server" Text="Previous Arrow Vertical position and Offset:" HelpText="Arrow Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlArrPrevPosV"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlArrPrevPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxArrPrevPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">183</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlArrPrevPosVAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvArrPrevPosVOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxArrPrevPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvArrPrevPosVOff" resourcekey="rvArrPrevPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxArrPrevPosVOff" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblArrPrevPosH" runat="server" Text="Previous Arrow Horizontal position and Offset:" HelpText="Arrow Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlArrPrevPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlArrPrevPosH" runat="server">
																				<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																				<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxArrPrevPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">0</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlArrPrevPosHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvArrPrevPosHOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxArrPrevPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvArrPrevPosHOff" resourcekey="rvArrPrevPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxArrPrevPosHOff" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblArrNextPosV" runat="server" Text="Next Arrow Vertical position and Offset:" HelpText="Arrow Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlArrNextPosV"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlArrNextPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxArrNextPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">183</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlArrnextPosVAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvArrNextPosVOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxArrNextPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvArrNextPosVOff" resourcekey="rvArrNextPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxArrNextPosVOff" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblArrNextPosH" runat="server" Text="Next Arrow Horizontal position and Offset:" HelpText="Arrow Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlArrNextPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlArrNextPosH" runat="server">
																				<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																				<asp:ListItem resourcekey="liRight" Value="right" Selected="True">Right</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxArrNextPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">0</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlArrnextPosHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvArrNextPosHOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxArrNextPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvArrNextPosHOff" resourcekey="rvArrNextPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxArrNextPosHOff" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
															</table>
															<a id="CRautoplayindicator"></a>
															<div class="rightGoToContainer">
																<a href="#CRtopPreView" class="rightGoTo">
																	<%=BacktoSketch%></a>
															</div>
														</asp:Panel>
														<table class="settings_table">
															<tr class="rotatorPanel">
																<td class="textCenter" style="background-color: #BF68DD;">
																	<asp:Label ID="lblCRAutoplay" resourcekey="lblCRAutoplay" runat="server" EnableViewState="False" Text="Autoplay:" />
																	<span class="onOffToggle">
																		<asp:CheckBox ID="cbCRAPEnabled" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="True" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlCRAEnabled" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblCRAPInterval" runat="server" Text="Interval:" HelpText="Autoplay interval" ControlName="tbxAPInterval"></dnn:Label>
																	</td>
																	<td>
																		<asp:TextBox ID="tbxAPInterval" runat="server" CssClass="small textCenter" MaxLength="7" ValidationGroup="SettingsSave">5000</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvAPInterval" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxAPInterval" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvAPInterval" resourcekey="rvAPInterval.ErrorMessage" runat="server" ControlToValidate="tbxAPInterval" Display="Dynamic" ErrorMessage="Positive number (0 - 1000000). " MaximumValue="1000000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblAPPauseOnHover" runat="server" Text="Pause On Hover:" HelpText="Pause On Hover" ControlName="cbAPPauseOnHover"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbAPPauseOnHover" runat="server" Checked="true" Text="Pause On Hover" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblAPIndiDisplay" runat="server" Text="Display Indicator:" HelpText="Display Indicator" ControlName="cbAPIndiDisplay"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbAPIndiDisplay" runat="server" Checked="true" Text="Display Indicator" />
																		</div>
																	</td>
																</tr>
															</table>
															<asp:Panel ID="pnlCRAPIndPosition" runat="server" class="settingsTable">
																<table class="settings_table">
																	<tr>
																		<td>
																			<dnn:Label ID="lblAPIndPosV" runat="server" Text="Indicator Vertical Position:" HelpText="Indicator Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlAPIndPosV"></dnn:Label>
																		</td>
																		<td>
																			<div class="styledSelect small">
																				<asp:DropDownList ID="ddlAPIndPosV" runat="server">
																					<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																					<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																				</asp:DropDownList>
																			</div>
																			<asp:TextBox ID="tbxAPIndPosVOff" runat="server" CssClass="small textCenter" MaxLength="7" ValidationGroup="SettingsSave">0</asp:TextBox>
																			<div class="styledSelect">
																				<asp:DropDownList ID="ddlAPindPosVAsRatio" runat="server">
																					<asp:ListItem Value="False">px</asp:ListItem>
																					<asp:ListItem Value="True">%</asp:ListItem>
																				</asp:DropDownList>
																			</div>
																			<asp:RequiredFieldValidator ID="rfvAPIndPosVOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxAPIndPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																			<asp:RangeValidator ID="rvAPIndPosVOff" resourcekey="rvAPIndPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxAPIndPosVOff" Display="Dynamic" ErrorMessage="Positive number (0 - 1000000). " MaximumValue="20000" MinimumValue="-20000" Type="Integer"
																				ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<dnn:Label ID="lblAPIndPosH" runat="server" Text="Indicator Horizontal Position and Offset:" HelpText="Indicator Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlAPIndPosH"></dnn:Label>
																		</td>
																		<td>
																			<div class="styledSelect small">
																				<asp:DropDownList ID="ddlAPIndPosH" runat="server">
																					<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																					<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																				</asp:DropDownList>
																			</div>
																			<asp:TextBox ID="tbxAPIndPosHOff" runat="server" CssClass="small textCenter" MaxLength="7" ValidationGroup="SettingsSave">0</asp:TextBox>
																			<div class="styledSelect">
																				<asp:DropDownList ID="ddlAPindPosHAsRatio" runat="server">
																					<asp:ListItem Value="False">px</asp:ListItem>
																					<asp:ListItem Value="True">%</asp:ListItem>
																				</asp:DropDownList>
																			</div>
																			<asp:RequiredFieldValidator ID="rfvAPIndPosHOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxAPIndPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																			<asp:RangeValidator ID="rvAPIndPosHOff" resourcekey="rvAPIndPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxAPIndPosHOff" Display="Dynamic" ErrorMessage="Positive number (0 - 1000000). " MaximumValue="20000" MinimumValue="-20000" Type="Integer"
																				ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<dnn:Label ID="lblAPIndOrientation" runat="server" Text="Indicator Orientation:" HelpText="Indicator Orientation" ControlName="ddlAPIndOrientation"></dnn:Label>
																		</td>
																		<td>
																			<div class="styledSelect">
																				<asp:DropDownList ID="ddlAPIndOrientation" runat="server">
																					<asp:ListItem resourcekey="liHorizontal" Value="horizontal">Horizontal</asp:ListItem>
																					<asp:ListItem resourcekey="liVertical" Value="vertical">Vertical</asp:ListItem>
																				</asp:DropDownList>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<dnn:Label ID="lblAPIndFlipDriect" runat="server" Text="Flip Direction:" HelpText="If the direction is flipped, the indicator will &quot;fill up&quot; from the other side" ControlName="cbAPIndFlipDriect"></dnn:Label>
																		</td>
																		<td>
																			<asp:CheckBox ID="cbAPIndFlipDriect" runat="server" Text="Flip Direction" />
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="styledCheckbox noLabel">
																				<dnn:Label ID="lblAPIndWH" runat="server" Text="Indicator Width / Height:" HelpText="Indicator Width / Height" ControlName="tbxAPIndPosVOff"></dnn:Label>
																			</div>
																		</td>
																		<td>
																			<asp:TextBox ID="tbxAPIndWidth" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">750</asp:TextBox>
																			<div class="styledSelect">
																				<asp:DropDownList ID="ddlAPindWAsRatio" runat="server">
																					<asp:ListItem Value="False">px</asp:ListItem>
																					<asp:ListItem Value="True">%</asp:ListItem>
																				</asp:DropDownList>
																			</div>
																			/
																			<asp:TextBox ID="tbxAPIndHeight" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">2</asp:TextBox>
																			<div class="styledSelect">
																				<asp:DropDownList ID="ddlAPindHAsRatio" runat="server">
																					<asp:ListItem Value="False">px</asp:ListItem>
																					<asp:ListItem Value="True">%</asp:ListItem>
																				</asp:DropDownList>
																			</div>
																			<asp:RequiredFieldValidator ID="rfvAPIndWidth" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxAPIndWidth" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																			<asp:RangeValidator ID="rvAPIndWidth" resourcekey="rvAPIndWidth.ErrorMessage" runat="server" ControlToValidate="tbxAPIndWidth" Display="Dynamic" ErrorMessage="Positive number (0 - 1920). " MaximumValue="1920" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																				SetFocusOnError="True" CssClass="smallInfo error" />
																			<asp:RequiredFieldValidator ID="rfvAPIndHeight" runat="server" ControlToValidate="tbxAPIndHeight" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																			<asp:RangeValidator ID="rvAPIndHeight" resourcekey="rvAPIndHeight.ErrorMessage" runat="server" ControlToValidate="tbxAPIndHeight" Display="Dynamic" ErrorMessage="Positive number (0 - 1200). " MaximumValue="1200" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																				SetFocusOnError="True" CssClass="smallInfo error" />
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<dnn:Label ID="lblCRVideoAutoPlay" runat="server" Text="Auto start video:" HelpText="Video starts automatically." ControlName="cbCRVideoAutoPlay" />
																		</td>
																		<td>
																			<div class="styledCheckbox noLabel">
																				<asp:CheckBox ID="cbCRVideoAutoPlay" runat="server" Text="Auto start video:" />
																			</div>
																		</td>
																	</tr>
																</table>
																<a id="CRplaystopbutton"></a>
																<div class="rightGoToContainer">
																	<a href="#CRtopPreView" class="rightGoTo">
																		<%=BacktoSketch%></a>
																</div>
															</asp:Panel>
														</asp:Panel>
														<table class="settings_table">
															<tr class="rotatorPanel">
																<td class="textCenter" style="background-color: #75F1E6;">
																	<asp:Label ID="lblCRAutoplayToggle" resourcekey="lblCRAutoplayToggle" runat="server" EnableViewState="False" Text="Play/stop button:" />
																	<span class="onOffToggle">
																		<asp:CheckBox ID="cbAPTDisplay" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="True" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlAPTDisplay" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblAPTAutoHide" runat="server" Text="Auto Hide:" HelpText="Auto hide play/stop button" ControlName="cbAPTAutoHide"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbAPTAutoHide" runat="server" Text="Auto Hide" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblAPTHideSpeed" runat="server" Text="Auto Hide Speed:" HelpText="Auto Hide Speed" ControlName="tbxAPTHideSpeed"></dnn:Label>
																	</td>
																	<td>
																		<asp:TextBox ID="tbxAPTHideSpeed" runat="server" CssClass="small textCenter" ValidationGroup="SettingsSave">250</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvAPTHideSpeed" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxAPTHideSpeed" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" />
																		<asp:RangeValidator ID="rvAPTHideSpeed" resourcekey="rvAPTHideSpeed.ErrorMessage" runat="server" ControlToValidate="tbxAPTHideSpeed" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblAPTPosV" runat="server" Text="Vertical position and Offset:" HelpText="Conteiner Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlAPTPosV"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlAPTPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxAPTPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">183</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlATTPosVAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvAPTPosVOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxAPTPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvAPTPosVOff" resourcekey="rvAPTPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxAPTPosVOff" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblAPTPosH" runat="server" Text="Horizontal position and Offset:" HelpText="Conteiner Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlAPTPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlAPTPosH" runat="server">
																				<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																				<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxAPTPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">347</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlATTPosHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvAPTPosHOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxAPTPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvAPTPosHOff" resourcekey="rvAPTPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxAPTPosHOff" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																			SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
															</table>
															<a id="pagination"></a>
															<div class="rightGoToContainer">
																<a href="#CRtopPreView" class="rightGoTo">
																	<%=BacktoSketch%></a>
															</div>
														</asp:Panel>
														<table class="settings_table">
															<tr class="rotatorPanel">
																<td class="textCenter" style="background-color: #79C326;">
																	<asp:Label ID="lblPagination" resourcekey="lblPagination" runat="server" EnableViewState="False" Text="Pagination:" />
																	<span class="onOffToggle">
																		<asp:CheckBox ID="cbPagiDisplay" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="True" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlPagiDisplay" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblPagiPageAtOnce" runat="server" Text="Number of pages at once:" HelpText="The maximum number of pages that will be visible" ControlName="tbxPagiPageAtOnce"></dnn:Label>
																	</td>
																	<td>
																		<asp:TextBox ID="tbxPagiPageAtOnce" runat="server" CssClass="small textCenter" ValidationGroup="SettingsSave">0</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvPagiPageAtOnce" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxPagiPageAtOnce" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvPagiPageAtOnce" resourcekey="rvPagiPageAtOnce.ErrorMessage" runat="server" ControlToValidate="tbxPagiPageAtOnce" Display="Dynamic" ErrorMessage="Positive number (0 - 20000). " MaximumValue="20000" MinimumValue="0" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblPagiDirection" runat="server" Text="Direction:" HelpText="Pagination Direction" ControlName="ddlPagiDirection"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlPagiDirection" runat="server">
																				<asp:ListItem resourcekey="liHorizontal" Value="horizontal">Horizontal</asp:ListItem>
																				<asp:ListItem resourcekey="liVertical" Value="vertical">Vertical</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblPagiPosV" runat="server" Text="Vertical Position and Offset:" HelpText="Pagination Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlPagiPosV"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlPagiPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxPagiPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">120</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlPagiPosVAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvPagiPosVOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxPagiPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvPagiPosVOff" resourcekey="rvPagiPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxPagiPosVOff" Display="Dynamic" ErrorMessage="Positive number (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblPagiPosH" runat="server" Text="Horizontal Position and Offset:" HelpText="Pagination Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlPagiPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlPagiPosH" runat="server">
																				<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																				<asp:ListItem resourcekey="liRight" Value="right" Selected="True">Right</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxPagiPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">20</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlPagiPosHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvPagiPosHOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxPagiPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvPagiPosHOff" resourcekey="rvPagiPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxPagiPosHOff" Display="Dynamic" ErrorMessage="Positive number (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
															</table>
															<a id="socialbuttons"></a>
															<div class="rightGoToContainer">
																<a href="#CRtopPreView" class="rightGoTo">
																	<%=BacktoSketch%></a>
															</div>
														</asp:Panel>
														<table class="settings_table">
															<tr class="rotatorPanel">
																<td class="textCenter" style="background-color: #BEBDDD;">
																	<asp:Label ID="lblCRSocialButtons" resourcekey="lblCRSocialButtons" runat="server" EnableViewState="False" Text="Social buttons:" />
																	<span class="onOffToggle">
																		<asp:CheckBox ID="cbSocialDisplay" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="True" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlSocialDisplay" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblSocialDirection" runat="server" Text="Social Buttons Orientation:" HelpText="Social Buttons Orientation" ControlName="ddlSocialDirection"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlSocialDirection" runat="server">
																				<asp:ListItem resourcekey="liHorizontal" Value="horizontal">Horizontal</asp:ListItem>
																				<asp:ListItem resourcekey="liVertical" Value="vertical">Vertical</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblSocialPosV" runat="server" Text="Vertical Position and Offset:" HelpText="Social Buttons Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlSocialPosV"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlSocialPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxSocialPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">58</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlSocialPosVAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvSocialPosVOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSocialPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvSocialPosVOff" resourcekey="rvSocialPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxSocialPosVOff" Display="Dynamic" ErrorMessage="Positive number (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblSocialPosH" runat="server" Text="Horizontal Position and Offset:" HelpText="Social Buttons Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlSocialPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlSocialPosH" runat="server">
																				<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																				<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxSocialPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">35</asp:TextBox>
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlSocialPosHAsRatio" runat="server">
																				<asp:ListItem Value="False">px</asp:ListItem>
																				<asp:ListItem Value="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:RequiredFieldValidator ID="rfvSocialPosHOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSocialPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvSocialPosHOff" resourcekey="rvSocialPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxSocialPosHOff" Display="Dynamic" ErrorMessage="Positive number (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000" Type="Integer"
																			ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblSocialLoadAfterEffect" runat="server" Text="Social Buttons Load After Effect:" HelpText="If enabled, the social buttons for the current item will load only after the it's transition effect has completed" ControlName="cbSocialLoadAfterEffect"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbSocialLoadAfterEffect" runat="server" Checked="true" Text="Social Buttons Load After Effect" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblSocialButtFace" runat="server" Text="Show Facebook Button:" HelpText="Show Facebook Button" ControlName="cbSocialButtFace"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbSocialButtFace" runat="server" Checked="true" Text="Show Facebook Button" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblSocialButtGoogle" runat="server" Text="Show Google Button:" HelpText="Show Google Button" ControlName="cbSocialButtGoogle"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbSocialButtGoogle" runat="server" Checked="true" Text="Show Google Button" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblSocialButtTwitter" runat="server" Text="Show Twitter Button:" HelpText="Show Twitter Button" ControlName="cbSocialButtTwitter"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbSocialButtTwitter" runat="server" Checked="true" Text="Show Twitter Button" />
																		</div>
																	</td>
																</tr>
															</table>
															<div class="rightGoToContainer">
																<a href="#CRtopPreView" class="rightGoTo">
																	<%=BacktoSketch%></a>
															</div>
														</asp:Panel>
													</asp:Panel>
													<asp:Panel ID="pnlAdvancedRSettings" runat="server" Visible="false" class="settingsTable">
														<a id="imagepanel"></a>
														<div class="schemaPrev">
															<a id="ARtopPreView"></a>
															<asp:Label ID="lblAdvancedShowHide" resourcekey="lblAdvancedShowHide" class="lblschemePre" runat="server" Text="Hide Sketch" Style="margin-right: 20px;"></asp:Label>
														</div>
														<div class="slidingDiv" style="text-align: center;">
															<img src="<%=ModulePath%>Images/advancedPrew.jpg" alt="Rotator Preview" usemap="#Map1" style="border: 0;" />
															<map name="Map1" id="Map1">
																<area shape="rect" coords="123,12,348,55" href="#imagepanel" alt="Image panel" />
																<area shape="rect" coords="489,6,726,47" href="#playstopbutton" alt="Play stop button" />
																<area shape="rect" coords="4,189,146,249" href="#ARautoplayindicator" alt="Auto play indicator" />
																<area shape="rect" coords="92,314,419,351" href="#ARtitledescriptionpanel" alt="Title description panel" />
																<area shape="rect" coords="427,287,611,329" href="#listpanel" alt="List panel" />
															</map>
														</div>
														<table class="settings_table">
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblARMainImageTitle" resourcekey="lblARMainImageTitle" runat="server" EnableViewState="False" Text="Image panel:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblARMainPictureWH" runat="server" HelpText="Width and height of main picture and container in pixels." Text="Picture and container width / height:" ResourceKey="lblARMainPictureWH" />
																</td>
																<td>
																	<asp:TextBox ID="tbxARMainPictureW" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">550</asp:TextBox>
																	/
																	<asp:TextBox ID="tbxARMainPictureH" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">380</asp:TextBox>
																	px
																	<asp:RequiredFieldValidator ID="rfvARMainPictureW" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxARMainPictureW" Display="Dynamic" ErrorMessage="Width Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvARMainPictureH" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxARMainPictureH" Display="Dynamic" ErrorMessage="Height Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvARMainPictureW" resourcekey="rvARMainPictureW.ErrorMessage" runat="server" ControlToValidate="tbxARMainPictureW" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680 px " MaximumValue="7680" MinimumValue="1" Type="Integer"
																		SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvARMainPictureH" resourcekey="rvARMainPictureH.ErrorMessage" runat="server" ControlToValidate="tbxARMainPictureH" Display="Dynamic" EnableViewState="False" ErrorMessage="(H) between 1 and 1200 px" MaximumValue="1200" MinimumValue="1"
																		Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblDelay" runat="server" HelpText="The global time delay for image rotation in milliseconds. If delay is set per item, it will take precedence over this global delay" Text="Delay:" ControlName="tbxDelay" ResourceKey="lblDelay" />
																</td>
																<td>
																	<asp:TextBox ID="tbxDelay" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">5000</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvDelay" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxDelay" Display="Dynamic" ErrorMessage="Enter Delay Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" />
																	<asp:RangeValidator ID="rvDelay" resourcekey="rvDelay.ErrorMessage" runat="server" ControlToValidate="tbxDelay" Display="Dynamic" ErrorMessage="Any positive number." MaximumValue="20000" MinimumValue="1" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblTransition" runat="server" HelpText="The global transition use for images. If transition is set per item, it will take precedence over this global transition." Text="Transition:" ControlName="ddlTransition" ResourceKey="lblTransition" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlTransition" runat="server" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblTransitionSpeed" runat="server" HelpText="The transition speed/duration use for image transition in milliseconds." Text="Transition speed:" ControlName="tbxTransitionSpeed" ResourceKey="lblTransitionSpeed" />
																</td>
																<td>
																	<asp:TextBox ID="tbxTransitionSpeed" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">800</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvTransitionSpeed" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxTransitionSpeed" Display="Dynamic" ErrorMessage="Transition Speed Value!  " SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvTransitionSpeed" resourcekey="rvTransitionSpeed.ErrorMessage" runat="server" ControlToValidate="tbxTransitionSpeed" Display="Dynamic" ErrorMessage="Any positive number." MaximumValue="5000" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSizeBlock" runat="server" HelpText="The size of the blocks use for block transitions." Text="Size of block:" ControlName="tbxSizeBlock" ResourceKey="lblSizeBlock" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSizeBlock" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">75</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvSizeBlock" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSizeBlock" Display="Dynamic" ErrorMessage="Block Size Value!  " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvSizeBlock" resourcekey="rvSizeBlock.ErrorMessage" runat="server" ControlToValidate="tbxSizeBlock" Display="Dynamic" ErrorMessage="Any positive number." MaximumValue="5000" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblVerStrip" runat="server" Text="Size of vertical stripe:" HelpText="Size of stripes." ControlName="tbxSizeVStripe" ResourceKey="lblVerStrip" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSizeVStripe" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">50</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvSizeVStripe" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSizeVStripe" Display="Dynamic" ErrorMessage="Size of the vertical stripes!  " SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvSizeVStripe" resourcekey="rvSizeVStripe.ErrorMessage" runat="server" ControlToValidate="tbxSizeVStripe" Display="Dynamic" ErrorMessage="Any positive number." MaximumValue="5000" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblHorizonStrip" runat="server" HelpText="The size of the horizontal stripes use for horizontal stripe transitions." Text="Size of horizontal stripe:" ControlName="tbxSizeHStripe" ResourceKey="lblHorizonStrip" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSizeHStripe" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">50</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvSizeHStripe" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSizeHStripe" Display="Dynamic" ErrorMessage="Size of the horizontal stripes!  " SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvSizeHStripe" resourcekey="rvSizeHStripe.ErrorMessage" runat="server" ControlToValidate="tbxSizeHStripe" Display="Dynamic" ErrorMessage="Any positive number." MaximumValue="5000" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblDelayBlock" runat="server" HelpText="The delay until the next block transition occurs in sequence. (in milliseconds)" Text="Delay of block:" ControlName="tbxDelayB" ResourceKey="lblDelayBlock" />
																</td>
																<td>
																	<asp:TextBox ID="tbxDelayB" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">30</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvDelayB" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxDelayB" Display="Dynamic" ErrorMessage="Block Delay Value!  " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvDelayB" resourcekey="rvDelayB.ErrorMessage" runat="server" ControlToValidate="tbxDelayB" Display="Dynamic" ErrorMessage="Any positive number." MaximumValue="5000" MinimumValue="1" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblDelayVS" runat="server" Text="Delay of vertical stripe:" HelpText="Delay of Vertical Stripe." ControlName="tbxDelayVS" ResourceKey="lblDelayVS" />
																</td>
																<td>
																	<asp:TextBox ID="tbxDelayVS" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">90</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvDelayVS" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxDelayVS" Display="Dynamic" ErrorMessage="Vertical Delay Value!  " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvDelayVS" resourcekey="rvDelayVS.ErrorMessage" runat="server" ControlToValidate="tbxDelayVS" Display="Dynamic" ErrorMessage="Any positive number." MaximumValue="5000" MinimumValue="1" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblDelayHS" runat="server" HelpText="The delay until the next horizontal stripe transition occurs in sequence. (in milliseconds)" Text="Delay horizontal stripe:" ControlName="tbxDelayHS" />
																</td>
																<td>
																	<asp:TextBox ID="tbxDelayHS" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">180</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvDelayHS" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxDelayHS" Display="Dynamic" ErrorMessage="Horizontal Delay Value!  " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvDelayHS" resourcekey="rvDelayHS.ErrorMessage" runat="server" ControlToValidate="tbxDelayHS" Display="Dynamic" ErrorMessage="Any positive number." MaximumValue="5000" MinimumValue="1" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblAutoCenter" runat="server" Text="Auto center images." HelpText="Auto center images." ControlName="cbAutoCenterImages" ResourceKey="lblAutoCenter" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbAutoCenterImages" runat="server" Checked="True" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblPouseMouseover" runat="server" HelpText="Rotation pauses on mouseover and resumes on mouseout." Text="Rotation pause:" ControlName="cbRotationPause" ResourceKey="lblPouseMouseover" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbRotationPause" runat="server" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblShuffle" runat="server" HelpText="To specify if items are displayed in random order." Text="Shuffle Items:" ControlName="cbShuffle" ResourceKey="lblShuffle" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbShuffle" runat="server" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblPlayOnce" runat="server" HelpText="Specify if rotation plays only once through." Text="Play only once:" ControlName="cbPlayOnlyOnce" ResourceKey="lblPlayOnce" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbPlayOnlyOnce" runat="server" />
																	</div>
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<a id="listpanel" />
																	<div class="rightGoToContainer">
																		<a href="#ARtopPreView" class="rightGoTo">
																			<%=BacktoSketch%></a>
																	</div>
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblListItemEdit" resourcekey="lblListItemEdit" runat="server" EnableViewState="False" Text="List panel:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblItemSeize" runat="server" Text="List item width / height:" HelpText="The width, height a list item in pixel." ResourceKey="lblItemSeize" />
																</td>
																<td>
																	<asp:TextBox ID="tbxItemW" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">300</asp:TextBox>
																	/
																	<asp:TextBox ID="tbxItemH" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">95</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvItemW" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxItemW" Display="Dynamic" ErrorMessage="Width Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvItemH" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxItemH" Display="Dynamic" ErrorMessage="Height Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvItemW" resourcekey="rvItemW.ErrorMessage" runat="server" ControlToValidate="tbxItemW" Display="Dynamic" ErrorMessage="(W) 0 - 1920. " MaximumValue="1920" MinimumValue="0" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvItemH" resourcekey="rvItemH.ErrorMessage" runat="server" ControlToValidate="tbxItemH" Display="Dynamic" EnableViewState="False" ErrorMessage="(H) 0 - 1200." MaximumValue="1200" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblARThumbWH" runat="server" Text="Thumb picture width / height:" HelpText="Width, height of thumb in pixels." ResourceKey="lblARThumbWH" />
																</td>
																<td>
																	<asp:TextBox ID="tbxARThumbW" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">90</asp:TextBox>
																	/
																	<asp:TextBox ID="tbxARThumbH" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">70</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvARThumbW" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxARThumbW" Display="Dynamic" ErrorMessage="Width Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" />
																	<asp:RequiredFieldValidator ID="rfvARThumbH" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxARThumbH" Display="Dynamic" ErrorMessage="Height Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" />
																	<asp:RangeValidator ID="rvARThumbW" resourcekey="rvARThumbW.ErrorMessage" runat="server" ControlToValidate="tbxARThumbW" Display="Dynamic" ErrorMessage="(W) 10 - 1920 px. " MaximumValue="1920" MinimumValue="10" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvARThumbH" resourcekey="rvARThumbH.ErrorMessage" runat="server" ControlToValidate="tbxARThumbH" Display="Dynamic" EnableViewState="False" ErrorMessage="(H) 10 - 1200 px." MaximumValue="1200" MinimumValue="10" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblNumListItems" runat="server" HelpText="Number of list items in list items container." Text="Number items in list:" ControlName="tbxNumOfItems" ResourceKey="lblNumListItems" />
																</td>
																<td>
																	<asp:TextBox ID="tbxNumOfItems" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">4</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvNumOfItems" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxNumOfItems" Display="Dynamic" ErrorMessage="Enter Number Of Items!" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvARTitleLenght0" resourcekey="rvARTitleLenght0.ErrorMessage" runat="server" ControlToValidate="tbxNumOfItems" Display="Dynamic" ErrorMessage="0 - 500 " MaximumValue="500" MinimumValue="0" SetFocusOnError="True" Type="Integer"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblARTitleLenght" runat="server" HelpText="Number of characters in title string to display in list item and description container." Text="Title lenght:" ControlName="tbxARTitleLenght" ResourceKey="lblARTitleLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxARTitleLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">50</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvARTitleLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxARTitleLenght" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvARTitleLenght" resourcekey="rvARTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxARTitleLenght" Display="Dynamic" ErrorMessage="0 - 500 " MaximumValue="500" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblARSubTitleLenght" runat="server" HelpText="Number of characters in subtitle string to display in list item." Text="Subtitle lenght:" ControlName="tbxARSubTitleLenght" ResourceKey="lblARSubTitleLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxARSubTitleLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">80</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvARSubTitleLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxARSubTitleLenght" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvARSubTitleLenght" resourcekey="rvARSubTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxARSubTitleLenght" Display="Dynamic" ErrorMessage="0 - 500 " MaximumValue="500" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblAlignList" runat="server" HelpText="Aligne list left or right acording main rotator width." Text="Aligne List:" ControlName="ddlAlignList" ResourceKey="lblAlignList" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlAlignList" runat="server">
																			<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																			<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblScrollingType" runat="server" HelpText="The scrolling type use for navigating the list. If you specify &quot;none&quot;, navigation of list is done through item click." Text="Scroling type in list:" ControlName="ddlScrollingType" ResourceKey="lblScrollingType" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlScrollingType" runat="server">
																			<asp:ListItem resourcekey="liMousemove" Selected="True" Value="mouse_move">Mouse move</asp:ListItem>
																			<asp:ListItem resourcekey="liMouseover" Value="mouse_over">Mouse over</asp:ListItem>
																			<asp:ListItem resourcekey="liMouseclick" Value="mouse_click">Mouse click</asp:ListItem>
																			<asp:ListItem resourcekey="liNone" Value="none">None</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblImageRotationStart0" runat="server" HelpText="Specify if image rotation initially starts." Text="Image rotation initially starts:" ControlName="cbImageRotationStart" ResourceKey="lblImageRotationStart0" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbImageRotationStart" runat="server" Checked="True" Text="Image rotation initially starts" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblAutoAdjust" runat="server" HelpText="Items position are automatically adjusted when image rotates." Text="Auto adjust:" ControlName="cbAutoAdjust" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbAutoAdjust" runat="server" Checked="True" Text="Auto adjust" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblScrollBar" runat="server" HelpText="To specify if the scroll bar indicator is visible." Text="Scroll bar visible:" ControlName="cbScrollVis" ResourceKey="lblScrollBar" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbScrollVis" runat="server" Checked="True" Text="Scroll bar visible" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblDisplayThumb" runat="server" Text="Display thumbs:" HelpText="Display thumbs in list container." ControlName="cbDisplayThumb" ResourceKey="lblDisplayThumb" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbDisplayThumb" runat="server" Checked="True" Text="Display thumbs" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSelArrow" runat="server" HelpText="To specify if the selected item's arrow is visible." Text="Display selected arrow:" ControlName="cbDisplaySel" ResourceKey="lblSelArrow" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbDisplaySel" runat="server" Checked="True" Text="Display selected arrow" />
																	</div>
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<a id="ARtitledescriptionpanel" />
																	<div class="rightGoToContainer">
																		<a href="#ARtopPreView" class="rightGoTo">
																			<%=BacktoSketch%></a>
																	</div>
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblTbxoptions" resourcekey="lblTbxoptions" runat="server" EnableViewState="False" Text="Title/description panel:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblTBWH" runat="server" HelpText="Dimensions of text box on top of main picture." Text="Container width / height" ResourceKey="lblTBWH" />
																</td>
																<td>
																	<asp:TextBox ID="tbTBW" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">520</asp:TextBox>
																	/
																	<asp:TextBox ID="tbTBH" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">50</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvtbW" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbTBW" Display="Dynamic" ErrorMessage="Width Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvARtbTBW" resourcekey="rvARtbTBW.ErrorMessage" runat="server" ControlToValidate="tbTBW" Display="Dynamic" ErrorMessage="1 - 1920" MaximumValue="1920" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvtbH" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbTBH" Display="Dynamic" ErrorMessage="Height Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvARtbTBH" resourcekey="rvARtbTBH.ErrorMessage" runat="server" ControlToValidate="tbTBH" Display="Dynamic" ErrorMessage="1 - 1200" MaximumValue="1200" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblTBPosTop" runat="server" HelpText="Margin top for text box." Text="Position top:" ControlName="tbPosTop" ResourceKey="lblTBPosTop" />
																</td>
																<td>
																	<asp:TextBox ID="tbPosTop" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">260</asp:TextBox>&nbsp;px
																	<asp:RequiredFieldValidator ID="rfvtbPosTop" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbPosTop" Display="Dynamic" ErrorMessage="Margin top Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvtbPosTop" resourcekey="rvtbPosTop.ErrorMessage" runat="server" ControlToValidate="tbPosTop" Display="Dynamic" ErrorMessage="0 - 1200" MaximumValue="1200" MinimumValue="0" SetFocusOnError="True" Type="Integer" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblTBPosLeft" runat="server" HelpText="Margin left of text box." Text="Position left:" ControlName="tbPosLeft" ResourceKey="lblTBPosLeft" />
																</td>
																<td>
																	<asp:TextBox ID="tbPosLeft" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">15</asp:TextBox>&nbsp;px
																	<asp:RequiredFieldValidator ID="rfvtbPosLeft" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbPosLeft" Display="Dynamic" ErrorMessage="Margin left Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvtbPosLeft" resourcekey="rvtbPosLeft.ErrorMessage" runat="server" ControlToValidate="tbPosLeft" Display="Dynamic" ErrorMessage="0 - 1920" MaximumValue="1920" MinimumValue="0" SetFocusOnError="True" Type="Integer" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblTBTitleLenght" runat="server" HelpText="Number of characters in title string to display in text box. Depends on html css tags in string." Text="Title lenght:" ControlName="tbxTBTitleLenght" ResourceKey="lblTBTitleLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxTBTitleLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">20</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvTBTitleLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxTBTitleLenght" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvTBTitleLenght" resourcekey="rvTBTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxTBTitleLenght" Display="Dynamic" ErrorMessage="0 - 4000 " MaximumValue="4000" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblARDescriptionLenght" runat="server" HelpText="Number of characters in description string to display in text box. Depends on html css tags in string." Text="Description lenght:" ControlName="tbxARDescriptionLenght" ResourceKey="lblARDescriptionLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxARDescriptionLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">100</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvARDescriptionLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxARDescriptionLenght" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvARDescriptionLenght" resourcekey="rvARDescriptionLenght.ErrorMessage" runat="server" ControlToValidate="tbxARDescriptionLenght" Display="Dynamic" ErrorMessage="0 - 4000 " MaximumValue="4000" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblTexBoxTran" runat="server" Text="Title, Desctiption container transition:" HelpText="Item container transition effects." ControlName="ddlTBtrans" ResourceKey="lblTexBoxTran" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlTBtrans" runat="server">
																			<asp:ListItem resourcekey="liFade" Value="fade">Fade</asp:ListItem>
																			<asp:ListItem resourcekey="liExpandup" Value="up">Expand up</asp:ListItem>
																			<asp:ListItem resourcekey="liExpanddown" Value="down">Expand down</asp:ListItem>
																			<asp:ListItem resourcekey="liExpandleft" Value="left">Expand left</asp:ListItem>
																			<asp:ListItem resourcekey="liExpandright" Value="right">Expand right</asp:ListItem>
																			<asp:ListItem resourcekey="liNone" Value="none">None</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblcbTISync" runat="server" HelpText="If true, text box appears after image transition is completed." Text="Text - image sync:" ControlName="cbTISync" ResourceKey="lblcbTISync" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbTISync" runat="server" Text="Text - image sync" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lbltxtBoxMouse0" runat="server" HelpText="Text box appears only on mouseover and hides on mouseout." Text="Text box appears on mouseover:" ControlName="cbTBappears" ResourceKey="lbltxtBoxMouse0" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbTBappears" runat="server" Text="Text box appears on mouseover" />
																	</div>
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<a id="playstopbutton" />
																	<div class="rightGoToContainer">
																		<a href="#ARtopPreView" class="rightGoTo">
																			<%=BacktoSketch%></a>
																	</div>
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblDisplayOptions" resourcekey="lblDisplayOptions" runat="server" EnableViewState="False" Text="Play/stop button:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCPappears" runat="server" HelpText="Control panel appears only on mouseover and hides on mouseout." Text="Control panel appears:" ControlName="cbCPappears" ResourceKey="lblCPappears" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbCPappears" runat="server" Text="Control panel appears" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblDisplayButton" runat="server" HelpText="To specify if the play/pause button is visible." Text="Display play button:" ControlName="cbDPlayButton" ResourceKey="lblDisplayButton" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbDPlayButton" runat="server" Checked="True" Text="Display play button" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCurrImageNum" runat="server" HelpText="To specify if the current image number is visible." Text="Display image number:" ControlName="cbDImageNum" ResourceKey="lblCurrImageNum" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbDImageNum" runat="server" Checked="True" Text="Display image number" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblcpalig" runat="server" HelpText="The alignment of the control panel." Text="Control panel aligement:" ControlName="ddlCPAlign" ResourceKey="lblcpalig" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlCPAlign" runat="server">
																			<asp:ListItem resourcekey="liTopright" Value="TR">Top right</asp:ListItem>
																			<asp:ListItem resourcekey="liTopcenter" Value="TC">Top center</asp:ListItem>
																			<asp:ListItem resourcekey="liTopleft" Value="TL">Top left</asp:ListItem>
																			<asp:ListItem resourcekey="liBottomright" Value="BR">Bottom right</asp:ListItem>
																			<asp:ListItem resourcekey="liBottomcenter" Value="BC">Bottom center</asp:ListItem>
																			<asp:ListItem resourcekey="liBottomleft" Value="BL">Bottom left</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<a id="ARautoplayindicator" />
																	<div class="rightGoToContainer">
																		<a href="#ARtopPreView" class="rightGoTo">
																			<%=BacktoSketch%></a>
																	</div>
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblARAutoplayIndicator" resourcekey="lblARAutoplayIndicator" runat="server" EnableViewState="False" Text="Autoplay indicator:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lbltimeindicator" runat="server" HelpText="To specify if the timer indicator bar is visible." Text="Display timer indicator:" ControlName="cbDisplayTimer" ResourceKey="lbltimeindicator" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbDisplayTimer" runat="server" Checked="True" Text="Display timer indicator" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lbltimeralign" runat="server" HelpText="The alignment of the timer indicator." Text="Timer aligement:" ControlName="ddlTimerAlign" ResourceKey="lbltimeralign" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlTimerAlign" runat="server">
																			<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
														</table>
													</asp:Panel>
													<asp:Panel ID="pnlFCRotator" runat="server" Visible="false" class="settingsTable">
														<script type="text/javascript">
															jQuery(document).ready(function ($) {
																$('#<%=tbxFCRLoaderColor.ClientID%>, #<%=tbxFCRInnerSideColor.ClientID%>, #<%=tbxFCRMenuColor1.ClientID%>, #<%=tbxFCRMenuColor2.ClientID%>, #<%=tbxFCRMenuColor3.ClientID%>, #<%=tbxFCRControlColor1.ClientID%>, #<%=tbxFCRControlColor2.ClientID%>, #<%=tbxFCRTooltipColor.ClientID%>, #<%=tbxFCRInfoBackground.ClientID%>, #<%=tbxFCRTooltipTextColor.ClientID%>').ColorPicker({
																	onSubmit: function (hsb, hex, rgb, el) {
																		$(el).val(hex).ColorPickerHide();
																		$('#' + el.id + '1').css('backgroundColor', '#' + hex);
																	},
																	onBeforeShow: function () {
																		$(this).ColorPickerSetColor(this.value);
																	}
																}).bind('keyup', function () {
																	$(this).ColorPickerSetColor(this.value);
																});
															});
														</script>
														<table class="settings_table">
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblFCROptions" runat="server" EnableViewState="False" Text="Rotator options:" resourcekey="lblFCROptions" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCMainPictureWH" runat="server" HelpText="Width and height of main picture and container in pixels." Text="Picture and container width / height:" ResourceKey="lblFCMainPictureWH" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCMainPictureW" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="750" />
																	/
																	<asp:TextBox ID="tbxFCMainPictureH" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="400" />
																	<asp:RequiredFieldValidator ID="rfvFCMainPictureW" runat="server" ControlToValidate="tbxFCMainPictureW" Display="Dynamic" ErrorMessage="Width Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvFCMainPictureH" runat="server" ControlToValidate="tbxFCMainPictureH" Display="Dynamic" ErrorMessage="Height Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvFCMainPictureW" runat="server" ControlToValidate="tbxFCMainPictureW" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680 px " MaximumValue="7680" MinimumValue="1" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		ResourceKey="rvFCMainPictureW.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvFCMainPictureH" runat="server" ControlToValidate="tbxFCMainPictureH" Display="Dynamic" EnableViewState="False" ErrorMessage="(H) between 1 and 1200 px" MaximumValue="1200" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ResourceKey="rvFCMainPictureH.ErrorMessage" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRFCRLoaderColor" runat="server" HelpText="Color of the cubes before the first image appears, also the color of the back sides of the cube, which become visible at some transition types." Text="Loader color:" ResourceKey="lblFCRFCRLoaderColor" />
																</td>
																<td>
																	<div id="<%=tbxFCRLoaderColor.ClientID%>1" class="colorPickBox" style="background-color: #<%=tbxFCRLoaderColor.Text%>;">
																	</div>
																	#<asp:TextBox ID="tbxFCRLoaderColor" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="333333" />
																	<asp:RequiredFieldValidator ID="rfvFCRLoaderColor" runat="server" ControlToValidate="tbxFCRLoaderColor" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="revFCRLoaderColor" runat="server" ControlToValidate="tbxFCRLoaderColor" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ResourceKey="revFCRLoaderColor.ErrorMessage"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRInnerSideColor" runat="server" HelpText="Color of the inner sides of the cube when sliced." Text="Inner side color:" ResourceKey="lblFCRInnerSideColor" />
																</td>
																<td>
																	<div id="<%=tbxFCRInnerSideColor.ClientID%>1" class="colorPickBox" style="width: 20px; height: 20px; border-width: thin; border-style: solid; background-color: #<%=tbxFCRInnerSideColor.Text%>; display: inline-block;">
																	</div>
																	#<asp:TextBox ID="tbxFCRInnerSideColor" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="222222" />
																	<asp:RequiredFieldValidator ID="rfvFCRInnerSideColor" runat="server" ControlToValidate="tbxFCRInnerSideColor" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="revFCRInnerSideColor" runat="server" ControlToValidate="tbxFCRInnerSideColor" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ResourceKey="revFCRInnerSideColor.ErrorMessage"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRSideShadowAlpha" runat="server" HelpText="Sides get darker when moved away from the front. This is the degree of darkness - 0 == no change, 1 == 100% black." Text="Side shadow alpha:" ResourceKey="lblFCRSideShadowAlpha" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRSideShadowAlpha" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="0.8" />
																	<asp:RequiredFieldValidator ID="rfvFCRSideShadowAlpha" runat="server" ControlToValidate="tbxFCRSideShadowAlpha" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvFCRSideShadowAlpha" runat="server" ControlToValidate="tbxFCRSideShadowAlpha" Display="Dynamic" EnableViewState="False" ErrorMessage="Between 0 - 1." MaximumValue="1" MinimumValue="0" SetFocusOnError="True" Type="Double" ValidationGroup="SettingsSave"
																		ResourceKey="rvFCRSideShadowAlpha.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRDropShadowAlpha" runat="server" HelpText="Alpha of the drop shadow - 0 == no shadow, 1 == opaque." Text="Drop shadow alpha:" ResourceKey="lblFCRDropShadowAlpha" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRDropShadowAlpha" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="0.7" />
																	<asp:RequiredFieldValidator ID="rfvFCRDropShadowAlpha" runat="server" ControlToValidate="tbxFCRDropShadowAlpha" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvFCRDropShadowAlpha" runat="server" ControlToValidate="tbxFCRDropShadowAlpha" Display="Dynamic" EnableViewState="False" ErrorMessage="Between 0 - 1." MaximumValue="1" MinimumValue="0" SetFocusOnError="True" Type="Double" ValidationGroup="SettingsSave"
																		ResourceKey="rvFCRDropShadowAlpha.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblvDropShadowDistance" runat="server" HelpText="Distance of the shadow from the bottom of the image." Text="Drop shadow distance:" ResourceKey="lblvDropShadowDistance" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRDropShadowDistance" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="25" />
																	<asp:RequiredFieldValidator ID="rfvFCRDropShadowDistance" runat="server" ControlToValidate="tbxFCRDropShadowDistance" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRDropShadowScale" runat="server" HelpText="As the shadow is blurred, it appears wider that the actual image, when not resized. Thus it�s a good idea to make it slightly smaller. - 1 would be no resizing at all." Text="Drop shadow scale:"
																		ResourceKey="lblFCRDropShadowScale" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRDropShadowScale" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="0.95" />
																	<asp:RequiredFieldValidator ID="rfvFCRDropShadowScale" runat="server" ControlToValidate="tbxFCRDropShadowScale" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvFCRDropShadowScale" runat="server" ControlToValidate="tbxFCRDropShadowScale" Display="Dynamic" EnableViewState="False" ErrorMessage="Between 0 - 1." MaximumValue="1" MinimumValue="0" SetFocusOnError="True" Type="Double" ValidationGroup="SettingsSave"
																		ResourceKey="rvFCRDropShadowScale.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRDropShadowBlurX" runat="server" HelpText="Blur of the drop shadow on the x-axis." Text="Drop shadow blur X:" ResourceKey="lblFCRDropShadowBlurX" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRDropShadowBlurX" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="40" />
																	<asp:RequiredFieldValidator ID="rfvFCRDropShadowBlurX" runat="server" ControlToValidate="tbxFCRDropShadowBlurX" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRDropShadowBlurY" runat="server" HelpText="Blur of the drop shadow on the y-axis." Text="Drop shadow blur Y:" ResourceKey="lblFCRDropShadowBlurY" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRDropShadowBlurY" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="4" />
																	<asp:RequiredFieldValidator ID="rfvFCRDropShadowBlurY" runat="server" ControlToValidate="tbxFCRDropShadowBlurY" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblFCRMenu" runat="server" EnableViewState="False" Text="Menu options:" ResourceKey="lblFCRMenu" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRMenuDistanceX" runat="server" HelpText="Distance between two menu items (from center to center)." Text="Menu distance X:" ResourceKey="lblFCRMenuDistanceX" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRMenuDistanceX" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="20" />
																	<asp:RequiredFieldValidator ID="rfvFCRMenuDistanceX" runat="server" ControlToValidate="tbxFCRMenuDistanceX" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRMenuDistanceY" runat="server" HelpText="Distance of the menu from the bottom of the image." Text="Menu distance Y:" ResourceKey="lblFCRMenuDistanceY" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRMenuDistanceY" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="50" />
																	<asp:RequiredFieldValidator ID="rfvFCRMenuDistanceY" runat="server" ControlToValidate="tbxFCRMenuDistanceY" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRMenuColor1" runat="server" HelpText="Color of an inactive menu item." Text="Menu color 1:" ResourceKey="lblFCRMenuColor1" />
																</td>
																<td>
																	<div id="<%=tbxFCRMenuColor1.ClientID%>1" class="colorPickBox" style="background-color: #<%=tbxFCRMenuColor1.Text%>;">
																	</div>
																	#<asp:TextBox ID="tbxFCRMenuColor1" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="999999" />
																	<asp:RequiredFieldValidator ID="rfvFCRMenuColor1" runat="server" ControlToValidate="tbxFCRMenuColor1" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="evFCRMenuColor1" runat="server" ControlToValidate="tbxFCRMenuColor1" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ValidationGroup="SettingsSave" ResourceKey="evFCRMenuColor1.ErrorMessage"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRMenuColor2" runat="server" HelpText="Color of an active menu item." Text="Menu color 2:" ResourceKey="lblFCRMenuColor2" />
																</td>
																<td>
																	<div id="<%=tbxFCRMenuColor2.ClientID%>1" class="colorPickBox" style="width: 20px; height: 20px; border-width: thin; border-style: solid; background-color: #<%=tbxFCRMenuColor2.Text%>; display: inline-block;">
																	</div>
																	#<asp:TextBox ID="tbxFCRMenuColor2" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="333333" />
																	<asp:RequiredFieldValidator ID="rfvFCRMenuColor2" runat="server" ControlToValidate="tbxFCRMenuColor2" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="revFCRMenuColor2" runat="server" ControlToValidate="tbxFCRMenuColor2" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ValidationGroup="SettingsSave"
																		ResourceKey="revFCRMenuColor2.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRMenuColor3" runat="server" HelpText="Color of the inner circle of an active menu item. Should equal the background color of the whole thing." Text="Menu color 3:" ResourceKey="lblFCRMenuColor3" />
																</td>
																<td>
																	<div id="<%=tbxFCRMenuColor3.ClientID%>1" class="colorPickBox" style="width: 20px; height: 20px; border-width: thin; border-style: solid; background-color: #<%=tbxFCRMenuColor3.Text%>; display: inline-block;">
																	</div>
																	#<asp:TextBox ID="tbxFCRMenuColor3" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="FFFFFF" />
																	<asp:RequiredFieldValidator ID="rfvFCRMenuColor3" runat="server" ControlToValidate="tbxFCRMenuColor3" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="revFCRMenuColor3" runat="server" ControlToValidate="tbxFCRMenuColor3" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ValidationGroup="SettingsSave"
																		ResourceKey="revFCRMenuColor3.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblFCRControl" runat="server" EnableViewState="False" Text="Control options:" ResourceKey="lblFCRControl" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRControlSize" runat="server" HelpText="Size of the controls, which appear on rollover (play, stop, info, link)." Text="Control size:" ResourceKey="lblFCRControlSize" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRControlSize" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="50" />
																	<asp:RequiredFieldValidator ID="rfvFCRControlSize" runat="server" ControlToValidate="tbxFCRControlSize" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRControlDistance" runat="server" HelpText="Distance between the controls (from the borders)." Text="Control distance:" ResourceKey="lblFCRControlDistance" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRControlDistance" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="20" />
																	<asp:RequiredFieldValidator ID="rfvFCRControlDistance" runat="server" ControlToValidate="tbxFCRControlDistance" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRControlColor1" runat="server" HelpText="Background color of the controls." Text="Control color 1:" ResourceKey="lblFCRControlColor1" />
																</td>
																<td>
																	<div id="<%=tbxFCRControlColor1.ClientID%>1" class="colorPickBox" style="background-color: #<%=tbxFCRControlColor1.Text%>;">
																	</div>
																	#<asp:TextBox ID="tbxFCRControlColor1" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="222222" />
																	<asp:RequiredFieldValidator ID="rfvFCRControlColor1" runat="server" ControlToValidate="tbxFCRControlColor1" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="revFCRControlColor1" runat="server" ControlToValidate="tbxFCRControlColor1" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ValidationGroup="SettingsSave"
																		ResourceKey="tbxFCRControlColor1.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRControlColor2" runat="server" HelpText="Font color of the controls." Text="Control color 2:" ResourceKey="lblFCRControlColor2" />
																</td>
																<td>
																	<div id="<%=tbxFCRControlColor2.ClientID%>1" class="colorPickBox" style="background-color: #<%=tbxFCRControlColor2.Text%>;">
																	</div>
																	#<asp:TextBox ID="tbxFCRControlColor2" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="FFFFFF" />
																	<asp:RequiredFieldValidator ID="rfvFCRControlColor2" runat="server" ControlToValidate="tbxFCRControlColor2" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="revFCRControlColor2" runat="server" ControlToValidate="tbxFCRControlColor2" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ValidationGroup="SettingsSave"
																		ResourceKey="revFCRControlColor2.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRControlAlpha" runat="server" HelpText="Alpha of a control, when mouse is not over." Text="Control alpha:" ResourceKey="lblFCRControlAlpha" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRControlAlpha" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="0.8" />
																	<asp:RequiredFieldValidator ID="rfvFCRControlAlpha" runat="server" ControlToValidate="tbxFCRControlAlpha" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRControlAlphaOver" runat="server" HelpText="Alpha of a control, when mouse is over." Text="Control alpha over:" ResourceKey="lblFCRControlAlphaOver" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRControlAlphaOver" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="0.95" />
																	<asp:RequiredFieldValidator ID="rfvFCRControlAlphaOver" runat="server" ControlToValidate="tbxFCRControlAlphaOver" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRControlsX" runat="server" HelpText="X-position of the point, which aligns the controls (measured from [0,0] of the image)." Text="Controls X:" ResourceKey="lblFCRControlsX" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRControlsX" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="120" />
																	<asp:RequiredFieldValidator ID="rfvFCRControlsX" runat="server" ControlToValidate="tbxFCRControlsX" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRControlsY" runat="server" HelpText="Y-position of the point, which aligns the controls (measured from [0,0] of the image)." Text="Controls Y:" ResourceKey="lblFCRControlsY" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRControlsY" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="40" />
																	<asp:RequiredFieldValidator ID="rfvFCRControlsY" runat="server" ControlToValidate="tbxFCRControlsY" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRControlsAlign" runat="server" HelpText="Type of alignment from the point [controlsX, controlsY] - can be center, left or right." Text="Controls align:" ResourceKey="lblFCRControlsAlign" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlFCRControlsAlign" runat="server">
																			<asp:ListItem Value="center" Text="Center" ResourceKey="liCenter" />
																			<asp:ListItem Value="left" Text="Left" ResourceKey="liLeft" />
																			<asp:ListItem Value="right" Text="Right" ResourceKey="liRight" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblFCRTooltip" runat="server" EnableViewState="False" Text="Tooltip options:" ResourceKey="lblFCRTooltip" /></h3>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTooltipHeight" runat="server" HelpText="Height of the tooltip surface in the menu." Text="Tooltip height:" ResourceKey="lblFCRTooltipHeight" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRTooltipHeight" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="30" />
																	<asp:RequiredFieldValidator ID="rfvFCRTooltipHeight" runat="server" ControlToValidate="tbxFCRTooltipHeight" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTooltipColor" runat="server" HelpText="Color of the tooltip surface in the menu." Text="Tooltip color:" ResourceKey="lblFCRTooltipColor" />
																</td>
																<td>
																	<div id="<%=tbxFCRTooltipColor.ClientID%>1" class="colorPickBox" style="background-color: #<%=tbxFCRTooltipColor.Text%>;">
																	</div>
																	#<asp:TextBox ID="tbxFCRTooltipColor" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="222222" />
																	<asp:RequiredFieldValidator ID="rfvFCRTooltipColor" runat="server" ControlToValidate="tbxFCRTooltipColor" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="revFCRTooltipColor" runat="server" ControlToValidate="tbxFCRTooltipColor" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ValidationGroup="SettingsSave"
																		ResourceKey="revFCRTooltipColor.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTooltipTextY" runat="server" HelpText="Y-distance of the tooltip text field from the top of the tooltip." Text="Tooltip text Y:" ResourceKey="lblFCRTooltipTextY" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRTooltipTextY" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="5" />
																	<asp:RequiredFieldValidator ID="rfvFCRTooltipTextY" runat="server" ControlToValidate="tbxFCRTooltipTextY" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTooltipTextStyle" runat="server" HelpText="The style of the tooltip text, specified in the CSS file." Text="Tooltip text style:" ResourceKey="lblFCRTooltipTextStyle" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRTooltipTextStyle" runat="server" CssClass="small textCenter" MaxLength="20" ValidationGroup="SettingsSave" Text="P-Italic" />
																	<asp:RequiredFieldValidator ID="rfvFCRTooltipTextStyle" runat="server" ControlToValidate="tbxFCRTooltipTextStyle" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTooltipTextColor" runat="server" HelpText="Color of the tooltip text." Text="Tooltip text color:" ResourceKey="lblFCRTooltipTextColor" />
																</td>
																<td>
																	<div id="<%=tbxFCRTooltipTextColor.ClientID%>1" class="colorPickBox" style="background-color: #<%=tbxFCRTooltipTextColor.Text%>;">
																	</div>
																	#<asp:TextBox ID="tbxFCRTooltipTextColor" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="FFFFFF" />
																	<asp:RequiredFieldValidator ID="rfvFCRTooltipTextColor" runat="server" ControlToValidate="tbxFCRTooltipTextColor" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="revFCRTooltipTextColor" runat="server" ControlToValidate="tbxFCRTooltipTextColor" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ValidationGroup="SettingsSave"
																		ResourceKey="revFCRTooltipTextColor.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTooltipMarginLeft" runat="server" HelpText="Margin of the text to the left end of the tooltip." Text="Tooltip margin left:" ResourceKey="lblFCRTooltipMarginLeft" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRTooltipMarginLeft" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="5" />
																	<asp:RequiredFieldValidator ID="rfvFCRTooltipMarginLeft" runat="server" ControlToValidate="tbxFCRTooltipMarginLeft" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTooltipMarginRight" runat="server" HelpText="Margin of the text to the right end of the tooltip." Text="Tooltip margin right:" ResourceKey="lblFCRTooltipMarginRight" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRTooltipMarginRight" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="7" />
																	<asp:RequiredFieldValidator ID="rfvFCRTooltipMarginRight" runat="server" ControlToValidate="tbxFCRTooltipMarginRight" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTooltipTextSharpness" runat="server" HelpText="Sharpness of the tooltip text (-400 to 400) - see Adobe Docs." Text="Tooltip text sharpness:" ResourceKey="lblFCRTooltipTextSharpness" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRTooltipTextSharpness" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="50" />
																	<asp:RequiredFieldValidator ID="rfvFCRTooltipTextSharpness" runat="server" ControlToValidate="tbxFCRTooltipTextSharpness" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTooltipTextThickness" runat="server" HelpText="Thickness of the tooltip text (-400 to 400) - see Adobe Docs." Text="Tooltip text thickness:" ResourceKey="lblFCRTooltipTextThickness" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRTooltipTextThickness" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="-100" />
																	<asp:RequiredFieldValidator ID="rfvFCRTooltipTextThickness" runat="server" ControlToValidate="tbxFCRTooltipTextThickness" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblFCRInfoBox" runat="server" EnableViewState="False" Text="Info box options:" ResourceKey="lblFCRInfoBox" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRInfoWidth" runat="server" HelpText="The width of the info text field." Text="Info width:" ResourceKey="lblFCRInfoWidth" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRInfoWidth" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="400" />
																	<asp:RequiredFieldValidator ID="rfvFCRInfoWidth" runat="server" ControlToValidate="tbxFCRInfoWidth" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRInfoBackground" runat="server" HelpText="The background color of the info text field." Text="Info background:" ResourceKey="lblFCRInfoBackground" />
																</td>
																<td>
																	<div id="<%=tbxFCRInfoBackground.ClientID%>1" class="colorPickBox" style="background-color: #<%=tbxFCRInfoBackground.Text%>;">
																	</div>
																	#<asp:TextBox ID="tbxFCRInfoBackground" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="FFFFFF" />
																	<asp:RequiredFieldValidator ID="rfvFCRInfoBackground" runat="server" ControlToValidate="tbxFCRInfoBackground" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																	<asp:RegularExpressionValidator ID="revFCRInfoBackground" runat="server" ControlToValidate="tbxFCRInfoBackground" ErrorMessage="Enter color value." SetFocusOnError="True" ValidationExpression="^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$" ValidationGroup="SettingsSave"
																		ResourceKey="revFCRInfoBackground.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRInfoBackgroundAlpha" runat="server" HelpText="The alpha of the background of the info text, the image shines through, when smaller than 1." Text="Info background alpha:" ResourceKey="lblFCRInfoBackgroundAlpha" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRInfoBackgroundAlpha" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="0.95" />
																	<asp:RequiredFieldValidator ID="rfvFCRInfoBackgroundAlpha" runat="server" ControlToValidate="tbxFCRInfoBackgroundAlpha" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRInfoMargin" runat="server" HelpText="The margin of the text field in the info section to all sides." Text="Info margin:" ResourceKey="lblFCRInfoMargin" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRInfoMargin" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="15" />
																	<asp:RequiredFieldValidator ID="rfvFCRInfoMargin" runat="server" ControlToValidate="tbxFCRInfoMargin" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRInfoSharpness" runat="server" HelpText="Sharpness of the info text (see above)." Text="Info sharpness:" ResourceKey="lblFCRInfoSharpness" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRInfoSharpness" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="0" />
																	<asp:RequiredFieldValidator ID="rfvFCRInfoSharpness" runat="server" ControlToValidate="tbxFCRInfoSharpness" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRInfoThickness" runat="server" HelpText="Sharpness of the info text (see above)." Text="Info thickness:" ResourceKey="lblFCRInfoThickness" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRInfoThickness" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="0" />
																	<asp:RequiredFieldValidator ID="rfvFCRInfoThickness" runat="server" ControlToValidate="tbxFCRInfoThickness" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblFCRTrans" runat="server" EnableViewState="False" Text="Transition options:" ResourceKey="lblFCRTrans" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTransition" runat="server" Text="Transition effect:" HelpText="Select transition effect." ResourceKey="lblFCRTransition" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlFCRTransition" runat="server" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRPieces" runat="server" HelpText="Number of pieces to which the image is sliced." Text="Number of pieces:" ResourceKey="lblFCRPieces" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRPieces" runat="server" CssClass="small textCenter" TabIndex="6" ValidationGroup="SettingsSave" Text="9" />
																	<asp:RequiredFieldValidator ID="rfvFCRPieces" runat="server" ControlToValidate="tbxFCRPieces" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRTime" runat="server" HelpText="Time for one cube to turn." Text="Time for one cube to turn:" ResourceKey="lblFCRTime" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRTime" runat="server" CssClass="small textCenter" MaxLength="6" TabIndex="6" ValidationGroup="SettingsSave" Text="1.2" />
																	<asp:RequiredFieldValidator ID="rfvFCRTime" runat="server" ControlToValidate="tbxFCRTime" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRDelay" runat="server" HelpText="Delay between the start of one cube to the start of the next cube." Text="Delay between cubes:" ResourceKey="lblFCRDelay" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRDelay" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="0.1" />
																	<asp:RequiredFieldValidator ID="rfvFCRDelay" runat="server" ControlToValidate="tbxFCRDelay" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRDepthOffset" runat="server" HelpText="The offset during transition on the z-axis. Value between 100 and 1000 are recommended. But go for experiments. :)" Text="Offset during transition:" ResourceKey="lblFCRDepthOffset" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRDepthOffset" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="300" />
																	<asp:RequiredFieldValidator ID="rfvFCRDepthOffset" runat="server" ControlToValidate="tbxFCRDepthOffset" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRCubeDistance" runat="server" HelpText="The distance between the cubes during transition. Values between 5 and 50 are recommended. But go for experiments.:)." Text="Distance between the cubes:" ResourceKey="lblFCRCubeDistance" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRCubeDistance" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="30" />
																	<asp:RequiredFieldValidator ID="rfvCubeDistance" runat="server" ControlToValidate="tbxFCRCubeDistance" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRAutoplay" runat="server" HelpText="Number of seconds from one transition to another, if not stopped. Set to 0 to disable autoplay." Text="Autoplay:" ResourceKey="lblFCRAutoplay" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRAutoplay" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="10" />
																	<asp:RequiredFieldValidator ID="rfvFCRAutoplay" runat="server" ControlToValidate="tbxFCRAutoplay" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblFCRFieldOfView" runat="server" HelpText="See the official Adobe Docs." Text="Field of view:" ResourceKey="lblFCRFieldOfView" />
																</td>
																<td>
																	<asp:TextBox ID="tbxFCRFieldOfView" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="45" />
																	<asp:RequiredFieldValidator ID="rfvFCRFieldOfView" runat="server" ControlToValidate="tbxFCRFieldOfView" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" ResourceKey="Valuerequired.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
														</table>
													</asp:Panel>
													<asp:Panel ID="pnlCarouselRotator" runat="server" Visible="false" class="settingsTable">
														<div class="carousel_dimensions_calculator">
															<p class="columns_and_rows">
																<asp:Label ID="lblCarouselnumOfRows" runat="server" for="<%=tbxCarouselnumOfRows.ClientID%>" class="text bold" Text="Number of rows:" ResourceKey="lblCarouselnumOfRows" />
																<asp:TextBox ID="tbxCarouselnumOfRows" runat="server" Width="30px" CssClass="boxposition" MaxLength="4" ValidationGroup="SettingsSave" Text="1" />
																<asp:RequiredFieldValidator ID="rfvnumOfRows" runat="server" ControlToValidate="tbxCarouselnumOfRows" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" ResourceKey="Valuerequired.ErrorMessage" />
																<asp:RangeValidator ID="rvnumOfRows" runat="server" ControlToValidate="tbxCarouselnumOfRows" Display="Dynamic" ErrorMessage="1 - 500" MaximumValue="500" MinimumValue="1" Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" ResourceKey="rvnumOfRows.ErrorMessage" />
																<asp:Label ID="lblCarouselnumOfColumns" runat="server" for="<%=tbxCarouselnumOfColumns.ClientID%>" class="text bold" Text="Number of columns:" ResourceKey="lblCarouselnumOfColumns" />
																<asp:TextBox ID="tbxCarouselnumOfColumns" runat="server" Width="30px" CssClass="boxposition" MaxLength="4" ValidationGroup="SettingsSave" Text="3" />
																<asp:RequiredFieldValidator ID="rfvnumOfColumns" runat="server" ControlToValidate="tbxCarouselnumOfColumns" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" ResourceKey="Valuerequired.ErrorMessage" />
																<asp:RangeValidator ID="rvnumOfColumns" runat="server" ControlToValidate="tbxCarouselnumOfColumns" Display="Dynamic" ErrorMessage="1 - 500 " MaximumValue="500" MinimumValue="1" Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" ResourceKey="rvnumOfColumns.ErrorMessage" />
															</p>
															<div class="container">
																<p class="text bold">
																	<asp:Label ID="lblmcContainerWidth" runat="server" Text="Container width:" ResourceKey="lblmcContainerWidth" />
																</p>
																<p class="text unit_selection">
																	<asp:RadioButtonList ID="rblCarouselMainWidthType" runat="server" OnSelectedIndexChanged="rblCarouselMainWidthType_SelectedIndexChanged" AutoPostBack="true" RepeatLayout="Flow" RepeatDirection="Horizontal">
																		<asp:ListItem Value="false" Selected="True" Text="fixed size (px)" ResourceKey="liFixedSize" />
																		<asp:ListItem Value="true" Text="fluid (%)" ResourceKey="liFluid" />
																	</asp:RadioButtonList>
																</p>
																<p class="explanation text small">
																	<asp:Label ID="lblCarouselRSliderWPXInfo" runat="server" Text="((item width + item left and right padding) x columns + container left and right padding)" ResourceKey="lblCarouselRSliderWPXInfo" />
																</p>
																<p class="text">
																	<asp:TextBox ID="tbxCarouselRSliderW" runat="server" Width="40px" CssClass="small textCenter boxposition" MaxLength="4" ValidationGroup="SettingsSave" CausesValidation="True" Text="690" />
																	<asp:Label ID="lblCarouselRSliderWType" runat="server" Text="px" />
																	<asp:RequiredFieldValidator ID="rfvCarouselRSliderW" runat="server" ControlToValidate="tbxCarouselRSliderW" Display="Dynamic" ErrorMessage="Width Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" ResourceKey="Valuerequired.ErrorMessage" />
																	<asp:RangeValidator ID="rvCarouselRSliderW" runat="server" ControlToValidate="tbxCarouselRSliderW" Display="Dynamic" ErrorMessage=" (W) between 1 and 5000 px. " MaximumValue="5000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True"
																		ResourceKey="rvCarouselRSliderW.ErrorMessage" />
																</p>
																<p class="text bold clear" style="margin-top: 12px;">
																	<asp:Label ID="lblmcContainerHeight" runat="server" Text="Container height:" ResourceKey="lblmcContainerHeight" />
																</p>
																<p class="text unit_selection">
																	<asp:RadioButtonList ID="rblCarouselMainHeightType" runat="server" OnSelectedIndexChanged="rblCarouselMainHeightType_SelectedIndexChanged" AutoPostBack="true" RepeatLayout="Flow" RepeatDirection="Horizontal">
																		<asp:ListItem Value="false" Selected="True" Text="fixed size (px)" ResourceKey="liFixedSize" />
																		<asp:ListItem Value="true" Text="fluid (%)" ResourceKey="liFluid" />
																	</asp:RadioButtonList>
																</p>
																<p class="explanation text small">
																	<asp:Label ID="lblCarouselRSliderHPXInfo" runat="server" Text="((item height + item top and bottom padding) x rows + container top and bottom padding)" ResourceKey="lblCarouselRSliderHPXInfo" />
																</p>
																<p class="text">
																	<asp:TextBox ID="tbxCarouselRSliderH" runat="server" Width="40px" CssClass="boxposition small textCenter" MaxLength="4" ValidationGroup="SettingsSave" CausesValidation="True" Text="210" />
																	<asp:Label ID="lblCarouselRSliderHType" runat="server" Text="px" />
																	<asp:RequiredFieldValidator ID="rfvCarouselRSliderH" runat="server" ControlToValidate="tbxCarouselRSliderH" Display="Dynamic" ErrorMessage="Height Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" ResourceKey="Valuerequired.ErrorMessage" />
																	<asp:RangeValidator ID="rvCarouselRSliderH" runat="server" ControlToValidate="tbxCarouselRSliderH" Display="Dynamic" EnableViewState="False" ErrorMessage="(H) between 1 and 5000 px." MaximumValue="5000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																		SetFocusOnError="True" ResourceKey="rvCarouselRSliderH.ErrorMessage" />
																</p>
															</div>
															<div class="model">
																<asp:TextBox ID="tbxCarCompensationTopMargin" runat="server" CssClass="padding container top" Text="10" />
																<asp:TextBox ID="tbxCarCompensationRightMargin" runat="server" CssClass="padding container right" Text="0" />
																<asp:TextBox ID="tbxCarCompensationBottomMargin" runat="server" CssClass="padding container bottom" Text="20" />
																<asp:TextBox ID="tbxCarCompensationLeftMargin" runat="server" CssClass="padding container left" Text="0" />
																<asp:TextBox ID="tbxItemTopPadding" runat="server" CssClass="padding item top" MaxLength="4" ValidationGroup="SettingsSave" Text="15" />
																<asp:TextBox ID="tbxItemLeftPadding" runat="server" CssClass="padding item left" MaxLength="4" ValidationGroup="SettingsSave" Text="15" />
																<p class="item_size width">
																	<asp:Label ID="lblWidth" runat="server" Text="width:" ResourceKey="lblWidth" />
																	<asp:TextBox ID="tbxCarouselItemW" runat="server" MaxLength="4" ValidationGroup="SettingsSave" Text="220" />
																	<asp:Label ID="lblPx" runat="server" Text="px" ResourceKey="lblPx" />
																</p>
																<p class="item_size height">
																	<asp:Label ID="lblHeight" runat="server" Text="height:" ResourceKey="lblHeight" />
																	<asp:TextBox ID="tbxCarouselItemH" runat="server" MaxLength="4" ValidationGroup="SettingsSave" Text="180" />
																	<asp:Label ID="Label2" runat="server" Text="px" ResourceKey="lblPx" />
																</p>
															</div>
															<script type="text/javascript">
																/* <![CDATA[ */
																jQuery(document).ready(function ($) {
																	var $calculator_root = $('.carousel_dimensions_calculator'),

																		$num_of_rows = $('#<%=tbxCarouselnumOfRows.ClientID%>'),
																		$nom_of_columns = $('#<%=tbxCarouselnumOfColumns.ClientID%>'),

																		$container_padding_top = $('.container.padding.top', $calculator_root),
																		$container_padding_bottom = $('.container.padding.bottom', $calculator_root),
																		$container_padding_left = $('.container.padding.left', $calculator_root),
																		$container_padding_right = $('.container.padding.right', $calculator_root),

																		$item_padding_top = $('.item.padding.top', $calculator_root),
																		$item_padding_left = $('.item.padding.left', $calculator_root),

																		$item_width = $('#<%=tbxCarouselItemW.ClientID%>'),
																		$item_height = $('#<%=tbxCarouselItemH.ClientID%>'),

																		calculate_dimensions = function () {
																			var width = parseInt($container_padding_left.val()) + parseInt($container_padding_right.val()) + parseInt($item_width.val()) + (parseInt($nom_of_columns.val()) - 1) * (parseInt($item_padding_left.val()) + parseInt($item_width.val())),
																				height = parseInt($container_padding_top.val()) + parseInt($container_padding_bottom.val()) + parseInt($item_height.val()) + (parseInt($num_of_rows.val()) - 1) * (parseInt($item_padding_top.val()) + parseInt($item_height.val()));

																			if ($('#<%=rblCarouselMainWidthType.ClientID%>_0')[0].checked)
																				$('#<%=tbxCarouselRSliderW.ClientID%>').val(width);

																			if ($('#<%=rblCarouselMainHeightType.ClientID%>_0')[0].checked)
																				$('#<%=tbxCarouselRSliderH.ClientID%>').val(height);
																		};

																	$('input.padding, #<%=tbxCarouselItemW.ClientID%>, #<%=tbxCarouselItemH.ClientID%>, #<%=tbxCarouselnumOfRows.ClientID%>, #<%=tbxCarouselnumOfColumns.ClientID%>', $calculator_root)
																		.bind('change keyup', function () {
																			var $this = $(this),
																				target_class = '',
																				new_number = parseInt($this.val());

																			if ($this.val() == '' || isNaN(new_number) || new_number < 0)
																				new_number = 0;

																			$this[0].value = new_number;

																			calculate_dimensions();
																		});
																});
																/* ]]> */
															</script>
														</div>
														<table class="settings_table">
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblCaruselRMainPanel" runat="server" EnableViewState="False" Text="Main container:" ResourceKey="lblCaruselRMainPanel" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselOrientation" runat="server" Text="Orientation:" HelpText="Orientation." ControlName="ddlCarouselOrientation" ResourceKey="lblCarouselOrientation" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlCarouselOrientation" runat="server">
																			<asp:ListItem Value="horizontal" Text="Horizontal" ResourceKey="liHorizontal" />
																			<asp:ListItem Value="vertical" Text="Vertical" ResourceKey="liVertical" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSlideDuration" runat="server" Text="Slide Duration:" HelpText="The time (in milliseconds) that the thumbnails page switch effect will take." ControlName="tbxCarouselSlideDuration" ResourceKey="lblSlideDuration" />
																</td>
																<td>
																	<asp:TextBox ID="tbxCarouselSlideDuration" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="1000" />
																	<asp:RequiredFieldValidator ID="rfvSlideDuration" runat="server" ControlToValidate="tbxCarouselSlideDuration" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True" ResourceKey="Valuerequired.ErrorMessage" />
																	<asp:RangeValidator ID="rvSlideDuration" runat="server" ControlToValidate="tbxCarouselSlideDuration" Display="Dynamic" ErrorMessage="Positive number (0 - 20000)." MaximumValue="20000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True"
																		ResourceKey="rvSlideDuration.ErrorMessage" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselStep" runat="server" Text="Slide step:" HelpText="Carousel Step." ControlName="ddlCarouselStep" ResourceKey="lblCarouselStep" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlCarouselStep" runat="server" OnSelectedIndexChanged="ddlCarouselStep_SelectedIndexChanged" AutoPostBack="true">
																			<asp:ListItem Value="item" Text="Item" />
																			<asp:ListItem Value="page" Text="Page" />
																		</asp:DropDownList>
																	</div>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlCarouselPageEffect" runat="server" Visible="false">
																			<asp:ListItem Value="slide" Text="Slide" />
																			<asp:ListItem Value="fade" Text="Fade" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselEasing" runat="server" Text="Easing:" HelpText="Determines the animation style when changing items/pages." ControlName="ddlCarouselEasing" ResourceKey="lblCarouselEasing" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlCarouselEasing" runat="server" Width="150px">
																			<asp:ListItem Value="swing">swing</asp:ListItem>
																			<asp:ListItem Value="linear">linear</asp:ListItem>
																			<asp:ListItem Value="jswing">jswing</asp:ListItem>
																			<asp:ListItem Value="def">def</asp:ListItem>
																			<asp:ListItem Value="easeInQuad">easeInQuad</asp:ListItem>
																			<asp:ListItem Value="easeOutQuad">easeOutQuad</asp:ListItem>
																			<asp:ListItem Value="easeInOutQuad">easeInOutQuad</asp:ListItem>
																			<asp:ListItem Value="easeInCubic">easeInCubic</asp:ListItem>
																			<asp:ListItem Value="easeOutCubic">easeOutCubic</asp:ListItem>
																			<asp:ListItem Value="easeInOutCubic">easeInOutCubic</asp:ListItem>
																			<asp:ListItem Value="easeInQuart">easeInQuart</asp:ListItem>
																			<asp:ListItem Value="easeOutQuart">easeOutQuart</asp:ListItem>
																			<asp:ListItem Value="easeInOutQuart">easeInOutQuart</asp:ListItem>
																			<asp:ListItem Value="easeInQuint">easeInQuint</asp:ListItem>
																			<asp:ListItem Value="easeOutQuint">easeOutQuint</asp:ListItem>
																			<asp:ListItem Value="easeInOutQuint">easeInOutQuint</asp:ListItem>
																			<asp:ListItem Value="easeInSine">easeInSine</asp:ListItem>
																			<asp:ListItem Value="easeOutSine">easeOutSine</asp:ListItem>
																			<asp:ListItem Value="easeInOutSine">easeInOutSine</asp:ListItem>
																			<asp:ListItem Value="easeInExpo">easeInExpo</asp:ListItem>
																			<asp:ListItem Value="easeOutExpo">easeOutExpo</asp:ListItem>
																			<asp:ListItem Value="easeInOutExpo">easeInOutExpo</asp:ListItem>
																			<asp:ListItem Value="easeInCirc">easeInCirc</asp:ListItem>
																			<asp:ListItem Value="easeOutCirc">easeOutCirc</asp:ListItem>
																			<asp:ListItem Value="easeInOutCirc">easeInOutCirc</asp:ListItem>
																			<asp:ListItem Value="easeInElastic">easeInElastic</asp:ListItem>
																			<asp:ListItem Value="easeOutElastic">easeOutElastic</asp:ListItem>
																			<asp:ListItem Value="easeInOutElastic">easeInOutElastic</asp:ListItem>
																			<asp:ListItem Value="easeInBack">easeInBack</asp:ListItem>
																			<asp:ListItem Value="easeOutBack">easeOutBack</asp:ListItem>
																			<asp:ListItem Value="easeInOutBack">easeInOutBack</asp:ListItem>
																			<asp:ListItem Value="easeInBounce">easeInBounce</asp:ListItem>
																			<asp:ListItem Value="easeOutBack">easeOutBounce</asp:ListItem>
																			<asp:ListItem Value="easeInOutBounce">easeInOutBounce</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselInfinite" runat="server" Text="Loop:" HelpText="Loop content. (Works if options are set like: Case 1: orientation is set to horizontal and rotator has only one row, Case 2: orientation is set to vertical and rotator has 1 column. In both cases width and height are set in pixels and it will work, else if either are set as fluid, it depends on how many rows/columns will be generated and may not work.)"
																		ControlName="cbCarouselInfinite" ResourceKey="lblCarouselInfinite" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbCarouselInfinite" runat="server" Checked="false" Text="Loop" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblIsDraggable" runat="server" Text="Touch & Swipe:" HelpText="This option enables support for touch input devices such as iPhone, iPad... The carousel can be controlled by mouse dragging or moving." ControlName="cbIsDraggable" ResourceKey="lblIsDraggable" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbIsDraggable" runat="server" Checked="true" Text="Touch & Swipe" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselAutoplay" runat="server" Text="Autoplay interval (ms):" HelpText="If 0 ms then autoplay is off." ControlName="cbCarouselAutoplay" ResourceKey="lblCarouselAutoplay" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbCarouselAutoplay" runat="server" Checked="false" AutoPostBack="true" OnCheckedChanged="cbCarouselAutoplay_CheckedChanged" Text="Autoplay interval (ms)" />
																	</div>
																	<asp:TextBox ID="tbxCarouselAutoplay" runat="server" CssClass="small textCenter" ValidationGroup="SettingsSave" Enabled="false" Text="0" />
																	<asp:RequiredFieldValidator ID="rfvCarouselAutoplay" runat="server" ControlToValidate="tbxCarouselAutoplay" Display="Dynamic" ErrorMessage="Interval Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" ResourceKey="Valuerequired.ErrorMessage"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvCarouselAutoplay" runat="server" ControlToValidate="tbxCarouselAutoplay" Display="Dynamic" ErrorMessage="0 - 20000ms." MaximumValue="20000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True"
																		ResourceKey="rvCarouselAutoplay.ErrorMessage" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselLinkOpen" runat="server" Text="Redirect On Click Target:" HelpText="Redirect On Click Target." ControlName="ddlCarouselLinkOpen" ResourceKey="lblCarouselLinkOpen" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlCarouselLinkOpen" runat="server">
																			<asp:ListItem Value="_self" Selected="True">Self</asp:ListItem>
																			<asp:ListItem Value="_blank">Blank</asp:ListItem>
																			<asp:ListItem Value="_parent">Parent</asp:ListItem>
																			<asp:ListItem Value="_top">Top</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblCarouselPicture" resourcekey="lblCarouselPicture" runat="server" EnableViewState="False" Text="Thumbnail image:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselPictureThumb" runat="server" Text="Picture Width / Height:" HelpText="Width, height of the thumbs in pixels. If added in template then this values are overwritten."></dnn:Label>
																</td>
																<td>
																	<asp:TextBox ID="tbxCarouselThumbW" runat="server" CssClass="small textCenter" ValidationGroup="SettingsSave">220</asp:TextBox>&nbsp;/&nbsp;
																	<asp:TextBox ID="tbxCarouselThumbH" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">180</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvCarouselThumbW" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselThumbW" Display="Dynamic" ErrorMessage="Width Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvCarouselThumbH" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselThumbH" Display="Dynamic" ErrorMessage="Height Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvCarouselThumbW" resourcekey="rvCarouselThumbW.ErrorMessage" runat="server" ControlToValidate="tbxCarouselThumbW" Display="Dynamic" ErrorMessage="(W) 10 - 800 px. " MaximumValue="800" MinimumValue="10" Type="Integer" ValidationGroup="SettingsSave"
																		SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvCarouselThumbH" resourcekey="rvCarouselThumbH.ErrorMessage" runat="server" ControlToValidate="tbxCarouselThumbH" Display="Dynamic" EnableViewState="False" ErrorMessage="(H) 10 - 800 px." MaximumValue="800" MinimumValue="10" Type="Integer"
																		ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblCarouselRItemInfo" resourcekey="lblCarouselRItemInfo" runat="server" EnableViewState="False" Text="Title/description:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselItemInfTitleLenght" runat="server" HelpText="Number of characters in title string to display in Item Container" Text="Title lenght:" ControlName="tbxCarouselItemInfTitleLenght" ResourceKey="lblCarouselItemInfTitleLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxCarouselItemInfTitleLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">50</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvCarouselItemInfTitleLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselItemInfTitleLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvCarouselItemInfTitleLenght" resourcekey="rvCarouselItemInfTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxCarouselItemInfTitleLenght" Display="Dynamic" ErrorMessage="0 - 500" MaximumValue="500" MinimumValue="0"
																		Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselItemInfDescriptionLenght" runat="server" HelpText="Number of characters in description string to display in Item Container. Depends on html css tags in string" Text="Description lenght:" ControlName="tbxCarouselItemInfDescriptionLenght"
																		ResourceKey="lblCarouselItemInfDescriptionLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxCarouselItemInfDescriptionLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">90</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvCarouselItemInfDescriptionLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselItemInfDescriptionLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave"
																		SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvCarouselItemInfDescriptionLenght" resourcekey="rvCarouselItemInfDescriptionLenght.ErrorMessage" runat="server" ControlToValidate="tbxCarouselItemInfDescriptionLenght" Display="Dynamic" ErrorMessage="0 - 4000" MaximumValue="4000"
																		MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblCarouselStripHtml" runat="server" HelpText="Only text is displayed in rotator description place." Text="Strip HTML from description:" ControlName="cbCarouselStripHtmlDesc" ResourceKey="lblCarouselStripHtml" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbCarouselStripHtmlDesc" runat="server" Checked="true" Text="Strip HTML from description" />
																	</div>
																</td>
															</tr>
														</table>
														<table class="settings_table">
															<tr class="color2HighLighted">
																<td class="textCenter">
																	<asp:Label ID="lblCarouselRArrows" resourcekey="lblCarouselRArrows" runat="server" EnableViewState="False" Text="Navigation arrows:" />
																	<span class="onOffToggle color2">
																		<asp:CheckBox ID="cbCarouselArrDisplay" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="True" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlCarouselArrDisplay" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblCarouselArrAutoHide" runat="server" Text="Auto Hide:" HelpText="Auto hide arrows" ControlName="cbCarouselArrAutoHide" ResourceKey="lblCarouselArrAutoHide"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledCheckbox noLabel">
																			<asp:CheckBox ID="cbCarouselArrAutoHide" runat="server" Checked="true" Text="Auto Hide" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblCarouselArrPrevPosV" runat="server" Text="Previous Arrow Vertical position and Offset:" HelpText="Arrow Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlCarouselArrPrevPosV"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlCarouselArrPrevPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxCarouselArrPrevPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">50</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvCarouselArrPrevPosVOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselArrPrevPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCarouselArrPrevPosVOff" resourcekey="rvCarouselArrPrevPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxCarouselArrPrevPosVOff" Display="Dynamic" ErrorMessage="Integer between (-5000 to 5000). " MaximumValue="5000" MinimumValue="-5000"
																			Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlArrPrevVAsRatio" runat="server">
																				<asp:ListItem Value="false">px</asp:ListItem>
																				<asp:ListItem Value="true" Selected="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblCarouselArrPrevPosH" runat="server" Text="Previous Arrow Horizontal position and Offset:" HelpText="Arrow Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlCarouselArrPrevPosH" ResourceKey="lblCarouselArrPrevPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlCarouselArrPrevPosH" runat="server">
																				<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																				<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxCarouselArrPrevPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">-10</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvCarouselArrPrevPosHOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselArrPrevPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCarouselArrPrevPosHOff" resourcekey="rvCarouselArrPrevPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxCarouselArrPrevPosHOff" Display="Dynamic" ErrorMessage="Integer between (-5000 to 5000). " MaximumValue="5000" MinimumValue="-5000"
																			Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlArrPrevHAsRatio" runat="server">
																				<asp:ListItem Value="false">px</asp:ListItem>
																				<asp:ListItem Value="true">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblCarouselArrNextPosV" runat="server" Text="Next Arrow Vertical position and Offset:" HelpText="Arrow Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlCarouselArrNextPosV"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlCarouselArrNextPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxCarouselArrNextPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">50</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvCarouselArrNextPosVOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselArrNextPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCarouselArrNextPosVOff" resourcekey="rvCarouselArrNextPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxCarouselArrNextPosVOff" Display="Dynamic" ErrorMessage="Integer between (-5000 to 5000). " MaximumValue="5000" MinimumValue="-5000"
																			Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlArrNextVAsRatio" runat="server">
																				<asp:ListItem Value="false">px</asp:ListItem>
																				<asp:ListItem Value="true" Selected="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblCarouselArrNextPosH" runat="server" Text="Next Arrow Horizontal position and Offset:" HelpText="Arrow Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlCarouselArrNextPosH" ResourceKey="lblCarouselArrNextPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlCarouselArrNextPosH" runat="server">
																				<asp:ListItem resourcekey="liLeft" Value="left">Left</asp:ListItem>
																				<asp:ListItem resourcekey="liRight" Value="right" Selected="True">Right</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxCarouselArrNextPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">-10</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvCarouselArrNextPosHOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselArrNextPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCarouselArrNextPosHOff" resourcekey="rvCarouselArrNextPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxCarouselArrNextPosHOff" Display="Dynamic" ErrorMessage="Integer between (-5000 to 5000). " MaximumValue="5000" MinimumValue="-5000"
																			Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlArrNextHAsRatio" runat="server">
																				<asp:ListItem Value="false">px</asp:ListItem>
																				<asp:ListItem Value="true">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
															</table>
														</asp:Panel>
														<table class="settings_table">
															<tr class="color2HighLighted">
																<td class="textCenter">
																	<asp:Label ID="lblCarouselPagination" resourcekey="lblCarouselPagination" runat="server" EnableViewState="False" Text="Pagination:" />
																	<dnn:Label ID="lblCarouselPagiInfo" runat="server" HelpText="Pagination is displayed only if loop option is disabled." ControlName="cbCarouselPagiDisplay" ResourceKey="lblCarouselPagiInfo"></dnn:Label>
																	<span class="onOffToggle color2">
																		<asp:CheckBox ID="cbCarouselPagiDisplay" runat="server" CssClass="section_display_toggle normalCheckBox" Checked="True" />
																		<span class="offText">
																			<%=Off%></span> <span class="onText">
																				<%=On%></span> <span class="slider"></span></span>
																</td>
															</tr>
														</table>
														<asp:Panel ID="pnlCarouselPagiDisplay" runat="server" class="settingsTable">
															<table class="settings_table">
																<tr>
																	<td>
																		<dnn:Label ID="lblCarouselPagiPosV" runat="server" Text="Pagination Vertical Position:" HelpText="Pagination Vertical Position. If Top then offset is calculated from top, else Bottom" ControlName="ddlCarouselPagiPosV" ResourceKey="lblCarouselPagiPosV"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlCarouselPagiPosV" runat="server">
																				<asp:ListItem resourcekey="liTop" Value="top">Top</asp:ListItem>
																				<asp:ListItem resourcekey="liBottom" Value="bottom" Selected="True">Bottom</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxCarouselPagiPosVOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">0</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvCarouselPagiPosVOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselPagiPosVOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCarouselPagiPosVOff" resourcekey="rvCarouselPagiPosVOff.ErrorMessage" runat="server" ControlToValidate="tbxCarouselPagiPosVOff" Display="Dynamic" ErrorMessage="Integer (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000"
																			Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlCarouselPagiPosVRatio" runat="server">
																				<asp:ListItem Value="false">px</asp:ListItem>
																				<asp:ListItem Value="true">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>
																		<dnn:Label ID="lblCarouselPagiPosH" runat="server" Text="Horizontal Position and Offset:" HelpText="Pagination Horizontal Position. If Left then offset is calculated from left, else Right" ControlName="ddlCarouselPagiPosH" ResourceKey="lblCarouselPagiPosH"></dnn:Label>
																	</td>
																	<td>
																		<div class="styledSelect small">
																			<asp:DropDownList ID="ddlCarouselPagiPosH" runat="server">
																				<asp:ListItem resourcekey="liLeft" Value="left" Selected="True">Left</asp:ListItem>
																				<asp:ListItem resourcekey="liRight" Value="right">Right</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																		<asp:TextBox ID="tbxCarouselPagiPosHOff" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave">50</asp:TextBox>
																		<asp:RequiredFieldValidator ID="rfvCarouselPagiPosHOff" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxCarouselPagiPosHOff" Display="Dynamic" ErrorMessage="Value Required!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																			CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvCarouselPagiPosHOff" resourcekey="rvCarouselPagiPosHOff.ErrorMessage" runat="server" ControlToValidate="tbxCarouselPagiPosHOff" Display="Dynamic" ErrorMessage="Integer (-1000 - 20000). " MaximumValue="20000" MinimumValue="-1000"
																			Type="Integer" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																		<div class="styledSelect">
																			<asp:DropDownList ID="ddlCarouselPagiPosHRatio" runat="server">
																				<asp:ListItem Value="false">px</asp:ListItem>
																				<asp:ListItem Value="true" Selected="True">%</asp:ListItem>
																			</asp:DropDownList>
																		</div>
																	</td>
																</tr>
															</table>
														</asp:Panel>
													</asp:Panel>
													<asp:Panel ID="pnlPokerCarouselRotator" runat="server" Visible="false" class="settingsTable">
														<table class="settings_table">
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblPokerOptions" resourcekey="lblPokerOptions" runat="server" EnableViewState="False" Text="Rotator options:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrcarouselWidth" runat="server" HelpText="The width/height of the rotator in pixelst." Text="Rotator width/height:" ResourceKey="lblpkrcarouselWidth" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrcarouselWidth" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">1000</asp:TextBox>
																	/
																	<asp:TextBox ID="tbxpkrcarouselHeight" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">360</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrcarouselWidth" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrcarouselWidth" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrpkrcarouselWidth" resourcekey="rvpkrpkrcarouselWidth.ErrorMessage" runat="server" ControlToValidate="tbxpkrcarouselWidth" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680" MaximumValue="7680" MinimumValue="1" Type="Integer"
																		SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvpkrcarouselHeight" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrcarouselHeight" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrpkrcarouselHeight" resourcekey="rvpkrpkrcarouselHeight.ErrorMessage" runat="server" ControlToValidate="tbxpkrcarouselHeight" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680" MaximumValue="7680" MinimumValue="1" Type="Integer"
																		SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrfrontWidth" runat="server" HelpText="The width/height of the front image in pixels." Text="Front image width/height:" ResourceKey="lblpkrfrontWidth" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrfrontWidth" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">400</asp:TextBox>
																	/
																	<asp:TextBox ID="tbxpkrfrontHeight" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">300</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrfrontWidth" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrfrontWidth" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrfrontWidth" resourcekey="rvpkrfrontWidth.ErrorMessage" runat="server" ControlToValidate="tbxpkrfrontWidth" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680" MaximumValue="7680" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvpkrfrontHeight" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrfrontHeight" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrfrontHeight" resourcekey="rvpkrfrontHeight.ErrorMessage" runat="server" ControlToValidate="tbxpkrfrontHeight" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680" MaximumValue="7680" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrhAlign" runat="server" HelpText="Horizontally/Vertically aligned position of the front image." Text="Front image horizontal/vertical aligement:" ResourceKey="lblpkrhAlign" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlpkrhAlign" runat="server">
																			<asp:ListItem resourcekey="liCenter" Selected="True" Text="Center" Value="center" />
																			<asp:ListItem resourcekey="liLeft" Text="Left" Value="left" />
																			<asp:ListItem resourcekey="liRight" Text="Right" Value="right" />
																		</asp:DropDownList>
																	</div>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlpkrvAlign" runat="server">
																			<asp:ListItem resourcekey="liCenter" Selected="True" Text="Center" Value="center" />
																			<asp:ListItem resourcekey="liTop" Text="Top" Value="top" />
																			<asp:ListItem resourcekey="liBottom" Text="Bottom" Value="bottom" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrleft" runat="server" HelpText="This option is used if 'hAlign' option is set to left/right." Text="Front image left/right position:" ResourceKey="lblpkrleft" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrleft" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">0</asp:TextBox>&nbsp;/&nbsp;
																	<asp:TextBox ID="tbxpkrright" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">0</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrleft" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrleft" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrpkrleft" resourcekey="rvpkrpkrleft.ErrorMessage" runat="server" ControlToValidate="tbxpkrleft" Display="Dynamic" ErrorMessage=" (W) between 0 and 7680" MaximumValue="7680" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvpkrright" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrright" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrpkrright" resourcekey="rvpkrpkrright.ErrorMessage" runat="server" ControlToValidate="tbxpkrright" Display="Dynamic" ErrorMessage=" (W) between 0 and 7680" MaximumValue="7680" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrtop" runat="server" HelpText="The top/bottom position of the front image." Text="Front image top/bottom position:" ResourceKey="lblpkrtop" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrtop" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">0</asp:TextBox>&nbsp;/&nbsp;
																	<asp:TextBox ID="tbxpkrbottom" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">0</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrtop" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrtop" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrpkrtop" resourcekey="rvpkrpkrtop.ErrorMessage" runat="server" ControlToValidate="tbxpkrtop" Display="Dynamic" ErrorMessage=" (W) between 0 and 7680" MaximumValue="7680" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvpkrbottom" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrbottom" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrpkrbottom" resourcekey="rvpkrpkrbottom.ErrorMessage" runat="server" ControlToValidate="tbxpkrbottom" Display="Dynamic" ErrorMessage=" (W) between 0 and 7680" MaximumValue="7680" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrbackZoom" runat="server" HelpText="Dimension of the back image." Text="Back image dimension:" ResourceKey="lblpkrbackZoom" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrbackZoom" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">0.8</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrbackZoom" runat="server" ControlToValidate="tbxpkrbackZoom" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrbackZoom" runat="server" ControlToValidate="tbxpkrbackZoom" Display="Dynamic" ErrorMessage=" (W) between 1 and 100" MaximumValue="100" MinimumValue="-100" Type="Double" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CultureInvariantValues="True" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblhMargin" runat="server" HelpText="Horizontal/Vertical margin of the back image." Text="Back image horizontal/vertical margin:" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrhMargin" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">0.4</asp:TextBox>&nbsp;/&nbsp;
																	<asp:TextBox ID="tbxpkrvMargin" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">0.2</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrhMargin" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrhMargin" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrhMargin" resourcekey="rvpkrhMargin.ErrorMessage" runat="server" ControlToValidate="tbxpkrhMargin" Display="Dynamic" ErrorMessage=" (W) between 1 and 100" MaximumValue="100" MinimumValue="-100" Type="Double" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CultureInvariantValues="True" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvpkrvMargin" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrvMargin" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrvMargin" resourcekey="rvpkrvMargin.ErrorMessage" runat="server" ControlToValidate="tbxpkrvMargin" Display="Dynamic" ErrorMessage=" (W) between 1 and 100" MaximumValue="100" MinimumValue="-100" Type="Double" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CultureInvariantValues="True" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrbackOpacity" runat="server" HelpText="The opacity value of back images. (Value from 0 to 1)." Text="Back images opacity:" ResourceKey="lblpkrbackOpacity" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrbackOpacity" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">1</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrbackOpacity" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrbackOpacity" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrbackOpacity" resourcekey="rvpkrbackOpacity.ErrorMessage" runat="server" ControlToValidate="tbxpkrbackOpacity" Display="Dynamic" ErrorMessage="Between 0 and 1" MaximumValue="1" MinimumValue="0" Type="Double" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrspeed" runat="server" HelpText="Transition duration." Text="Transition duration:" ResourceKey="lblpkrspeed" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrspeed" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">500</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrspeed" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrspeed" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrpkrspeed" resourcekey="rvpkrpkrspeed.ErrorMessage" runat="server" ControlToValidate="tbxpkrspeed" Display="Dynamic" ErrorMessage="Between 1 and 5000" MaximumValue="5000" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrdirectionNav" runat="server" Text="Show navigation buttons:" HelpText="Show navigation buttons." ControlName="cbpkrdirectionNav" ResourceKey="lblpkrdirectionNav"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbpkrdirectionNav" runat="server" Checked="false" Text="Show navigation buttons" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrvbuttonNav" runat="server" HelpText="Type of navigation button that will be used: 'numbers', 'bullets', or 'none'. (default: 'none').." Text="Type of navigation button:" ResourceKey="lblpkrvbuttonNav" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlpkrvbuttonNav" runat="server">
																			<asp:ListItem resourcekey="liNone" Selected="True" Text="None" Value="none" />
																			<asp:ListItem resourcekey="liBullets" Text="Bullets" Value="bullets" />
																			<asp:ListItem resourcekey="liNumbers" Text="Numbers" Value="numbers" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrautoplay" runat="server" Text="Autoplay:" HelpText="Automatically progress through slides." ControlName="cbpkrautoplay" ResourceKey="lblpkrautoplay"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbpkrautoplay" runat="server" Checked="true" Text="Autoplay" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrautoplayInterval" runat="server" HelpText="The interval at which the autoplay should progress at in milliseconds. This option is only used if autoplay is turned on. (default: 5000).." Text="Autoplay interval:" ResourceKey="lblpkrautoplayInterval" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrautoplayInterval" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">5000</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrautoplayInterval" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrautoplayInterval" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrpkrautoplayInterval" resourcekey="rvpkrpkrautoplayInterval.ErrorMessage" runat="server" ControlToValidate="tbxpkrautoplayInterval" Display="Dynamic" ErrorMessage=" (W) between 1 and 5000" MaximumValue="5000" MinimumValue="1"
																		Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrpauseOnHover" runat="server" Text="Pause autoplay on mouse over:" HelpText="Pause autoplay on mouse over." ControlName="cbpkrpauseOnHover" ResourceKey="lblpkrpauseOnHover"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbpkrpauseOnHover" runat="server" Checked="True" Text="Pause autoplay on mouse over" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrmouse" runat="server" Text="Mouse wheel navigation:" HelpText="Enable mouse wheel navigation. (default: true)." ControlName="cbpkrmouse" ResourceKey="lblpkrmouse"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbpkrmouse" runat="server" Checked="True" Text="Mouse wheel navigation" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrshadow" runat="server" Text="Shadow effect:" HelpText="Enable the shadow effect." ControlName="cbpkrshadow" ResourceKey="lblpkrshadow"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbpkrshadow" runat="server" Checked="False" Text="Shadow effect" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrreflection" runat="server" Text="Image reflection:" HelpText="Enable or disable image reflection." ControlName="cbpkrreflection" ResourceKey="lblpkrreflection"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbpkrreflection" runat="server" Checked="False" Text="Image reflection" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrreflectionHeight" runat="server" HelpText="The height of the image reflection. The value is between 0 and 1." Text="Image reflection height:" ResourceKey="lblpkrreflectionHeight" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrreflectionHeight" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">0.2</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrreflectionHeight" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrreflectionHeight" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrreflectionHeight" resourcekey="rvpkrreflectionHeight.ErrorMessage" runat="server" ControlToValidate="tbxpkrreflectionHeight" Display="Dynamic" ErrorMessage=" (W) between 0 and 1" MaximumValue="1" MinimumValue="0" Type="Double"
																		SetFocusOnError="True" ValidationGroup="SettingsSave" CultureInvariantValues="True" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrreflectionOpacity" runat="server" HelpText="The starting opacity of the reflection. The range is 0 to 1." Text="Image reflection opacity:" ResourceKey="lblpkrreflectionOpacity" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrreflectionOpacity" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">0.5</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrreflectionOpacity" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrreflectionOpacity" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrreflectionOpacity" resourcekey="rvpkrreflectionOpacity.ErrorMessage" runat="server" ControlToValidate="tbxpkrreflectionOpacity" Display="Dynamic" ErrorMessage=" (W) between 0 and 1" MaximumValue="1" MinimumValue="0" Type="Double"
																		SetFocusOnError="True" ValidationGroup="SettingsSave" CultureInvariantValues="True" CssClass="smallInfo error" />
																</td>
															</tr>
															<%--<tr>
																<td>
																	<dnn:Label ID="lblpkrreflectionColor" runat="server" HelpText="The gradient color of reflection. (default: '255,255,255')." Text="Image reflection gradient color:" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrreflectionColor" runat="server" ValidationGroup="SettingsSave">255,255,255</asp:TextBox>
																</td>
															</tr>--%>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrdescription" runat="server" Text="Description:" HelpText="Enable the description feature." ControlName="cbpkrdescription" ResourceKey="lblpkrdescription"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbpkrdescription" runat="server" Checked="False" Text="Description" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrTitleLenght" runat="server" HelpText="Number of characters in title string." Text="Title lenght:" ControlName="tbxpkrTitleLenght" ResourceKey="lblpkrTitleLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrTitleLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">50</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrTitleLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrTitleLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrTitleLenght" resourcekey="rvpkrTitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxpkrTitleLenght" Display="Dynamic" ErrorMessage="0 - 500 " MaximumValue="500" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																		SetFocusOnError="True" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblpkrDescriptionLenght" runat="server" HelpText="Number of characters in description string." Text="Description lenght:" ControlName="tbxpkrDescriptionLenght" ResourceKey="lblpkrDescriptionLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxpkrDescriptionLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">500</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvpkrDescriptionLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxpkrDescriptionLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvpkrDescriptionLenght" resourcekey="rvpkrDescriptionLenght.ErrorMessage" runat="server" ControlToValidate="tbxpkrDescriptionLenght" Display="Dynamic" ErrorMessage="0 - 4000 " MaximumValue="4000" MinimumValue="0" Type="Integer"
																		ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																</td>
															</tr>
														</table>
													</asp:Panel>
													<asp:Panel ID="pnlNewsTickerRotator" runat="server" Visible="false" class="settingsTable">
														<table class="settings_table">
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="lblNewsTickerOptions" resourcekey="lblNewsTickerOptions" runat="server" EnableViewState="False" Text="Rotator options:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblntStyle" runat="server" HelpText="Style." Text="Style:" ControlName="ddlntStyle" ResourceKey="lblntStyle" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlntStyle" runat="server">
																			<asp:ListItem resourcekey="liScroll" Selected="True" Text="Scroll" Value="scroll" />
																			<asp:ListItem resourcekey="liReveal" Text="Reveal" Value="reveal" />
																			<asp:ListItem resourcekey="liFade" Text="Fade" Value="fade" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblntstylespeed" runat="server" HelpText="Speed of selected style in milliseconds." Text="Speed of selected style:" ResourceKey="lblntstylespeed" />
																</td>
																<td>
																	<asp:TextBox ID="tbxntstylespeed" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">100</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvntstylespeed" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxntstylespeed" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvntstylespeed" resourcekey="rvntstylespeed.ErrorMessage" runat="server" ControlToValidate="tbxntstylespeed" Display="Dynamic" ErrorMessage=" (W) between 1 and 50000" MaximumValue="50000" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblntshowControls" runat="server" Text="Show Controls:" HelpText="Whether to show the pause, resume, next and previous buttons." ControlName="cbntshowControls" ResourceKey="lblntshowControls"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbntshowControls" runat="server" Checked="True" Text="Show Controls" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblntautoStart" runat="server" Text="Auto start:" HelpText="Whether to start the news ticker animation automatically." ControlName="cbntautoStart"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbntautoStart" runat="server" Checked="True" Text="Auto start" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblntpauseOnHover" runat="server" Text="Pause on hover:" HelpText="Whether the animation should be paused when the mouse hovers over the news ticker." ControlName="cbntpauseOnHover" ResourceKey="lblntpauseOnHover"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbntpauseOnHover" runat="server" Checked="True" Text="Pause on hover" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblntShowTitleFromrescx" runat="server" Text="Show ticker title:" HelpText="Show/hide ticker title from NewsTickerRotator.ascx.resx file." ControlName="cbntShowTitleFromrescx" ResourceKey="lblntShowTitleFromrescx"></dnn:Label>
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbntShowTitleFromrescx" runat="server" Checked="True" Text="Show ticker title" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblTickerRedirectOnClickTarget" runat="server" Text="Redirect on click target:" HelpText="Redirect on click target" ControlName="ddlTickerRedirectOnClickTarget" ResourceKey="lblTickerRedirectOnClickTarget"></dnn:Label>
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlTickerRedirectOnClickTarget" runat="server">
																			<asp:ListItem resourcekey="liSelf" Value="_self" Selected="True">Self</asp:ListItem>
																			<asp:ListItem resourcekey="liBlank" Value="_blank">Blank</asp:ListItem>
																			<asp:ListItem resourcekey="liParent" Value="_parent">Parent</asp:ListItem>
																			<asp:ListItem resourcekey="liTopTarget" Value="_top">Top</asp:ListItem>
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
														</table>
													</asp:Panel>
													<asp:Panel ID="pnlSizeShifter" runat="server" Visible="false" class="settingsTable">
														<table class="settings_table">
															<tr class="color2HighLighted">
																<td colspan="2" class="textCenter">
																	<asp:Label ID="ssRotatorOptions" resourcekey="ssRotatorOptions" runat="server" EnableViewState="False" Text="Rotator options:" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblssWidthHeight" runat="server" HelpText="The width/height of the rotator in pixelst." Text="Rotator width/height:" ResourceKey="lblssWidthHeight" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSizeShifterWidth" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">600</asp:TextBox>
																	/
																	<asp:TextBox ID="tbxSizeShifterHeight" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">400</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvSizeShifterWidth" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSizeShifterWidth" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvSizeShifterWidth" resourcekey="rvSizeShifterWidth.ErrorMessage" runat="server" ControlToValidate="tbxSizeShifterWidth" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680" MaximumValue="7680" MinimumValue="1" Type="Integer"
																		SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvSizeShifterHeight" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSizeShifterHeight" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvSizeShifterHeight" resourcekey="rvSizeShifterHeight.ErrorMessage" runat="server" ControlToValidate="tbxSizeShifterHeight" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680" MaximumValue="7680" MinimumValue="1" Type="Integer"
																		SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSStransition" runat="server" HelpText="Transition of images." Text="Transition:" ResourceKey="lblSStransition" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlSStransition" runat="server">
																			<asp:ListItem resourcekey="liRandom" Value="random" Text="Random" />
																			<asp:ListItem resourcekey="liFade" Value="fade" Text="Fade" />
																			<asp:ListItem resourcekey="liHorizontalslice" Value="sliceH" Text="Horizontal slice" />
																			<asp:ListItem resourcekey="liVerticalslice" Value="sliceV" Text="Vertical slice" />
																			<asp:ListItem resourcekey="liHorizontalslide" Value="slideH" Text="Horizontal slide" />
																			<asp:ListItem resourcekey="liVerticalslide" Value="slideV" Text="Vertical slide" />
																			<asp:ListItem resourcekey="liScale" Value="scale" Text="Scale" />
																			<asp:ListItem resourcekey="liBlockscale" Value="blockScale" Text="Block scale" />
																			<asp:ListItem resourcekey="liKaleidoscope" Value="kaleidoscope" Text="Kaleidoscope" />
																			<asp:ListItem resourcekey="liFan" Value="fan" Text="Fan" />
																			<asp:ListItem resourcekey="liHorizontalblind" Value="blindH" Text="Horizontal blind" />
																			<asp:ListItem resourcekey="liVerticalblind" Value="blindV" Text="Vertical blind" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSStransitionDuration" runat="server" HelpText="Int (default 800): Transition length in ms." Text="Transition duration:" ResourceKey="lblSStransitionDuration" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSStransitionDuration" runat="server" CssClass="small textCenter" MaxLength="6" ValidationGroup="SettingsSave" Text="800" />
																	<asp:RequiredFieldValidator ID="rfvSStransitionDuration" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSStransitionDuration" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvSStransitionDuration" resourcekey="rvSStransitionDuration.ErrorMessage" runat="server" ControlToValidate="tbxSStransitionDuration" Display="Dynamic" ErrorMessage="Between 1 and 100" MaximumValue="100000" MinimumValue="1" Type="Integer"
																		SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSSuseThumbs" runat="server" HelpText="Navigation thumbnails." Text="Thumbnails:" ResourceKey="lblSSuseThumbs" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbSSuseThumbs" runat="server" Checked="true" Text="Thumbnails" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSSusePagination" runat="server" HelpText="Display an item pagination." Text="Pagination:" ResourceKey="lblSSusePagination" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbSSusePagination" runat="server" Checked="true" Text="Pagination" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSSthumbMargin" runat="server" HelpText="Percentage width of thumb margin (default 3)." Text="Width of thumb margin:" ResourceKey="lblSSthumbMargin" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSSthumbMargin" runat="server" CssClass="small textCenter" MaxLength="3" ValidationGroup="SettingsSave" Text="3" />
																	<asp:RequiredFieldValidator ID="rfvSSthumbMargin" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSSthumbMargin" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rfSSthumbMargin" resourcekey="rfSSthumbMargin.ErrorMessage" runat="server" ControlToValidate="tbxSSthumbMargin" Display="Dynamic" ErrorMessage="Between 1 and 100" MaximumValue="100" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSSuseArrows" runat="server" HelpText="Navigation with previous and next arrows." Text="Navigation arrows:" ResourceKey="lblSSuseArrows" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbSSuseArrows" runat="server" Checked="true" Text="Navigation arrows" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSSautoPlay" runat="server" HelpText="Auto-cycle slider." Text="Autoplay:" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbSSautoPlay" runat="server" Checked="true" Text="Autoplay" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSSdelay" runat="server" HelpText="Time between slides in ms (default 5000)." Text="Delay:" ResourceKey="lblSSdelay" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSSdelay" runat="server" CssClass="small textCenter" MaxLength="7" ValidationGroup="SettingsSave" Text="5000" />
																	<asp:RequiredFieldValidator ID="rfvSSdelay" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSSdelay" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvSSdelay" resourcekey="rvSSdelay.ErrorMessage" runat="server" ControlToValidate="tbxSSdelay" Display="Dynamic" ErrorMessage="Between 1 and 100000" MaximumValue="100000" MinimumValue="1" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSSkeyNav" runat="server" HelpText="Bool (default true): Use left/right arrow keys to switch slide." Text="Use left/right arrow keys to switch slide:" ResourceKey="lblSSkeyNav" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbSSkeyNav" runat="server" Checked="true" Text="Use left/right arrow keys to switch slide" />
																	</div>
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblcontentPosition" runat="server" HelpText="Title/description position." Text="Title/description position:" ResourceKey="lblcontentPosition" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlSScontentPosition" runat="server" OnSelectedIndexChanged="ddlSScontentPosition_SelectedIndexChanged" AutoPostBack="true">
																			<asp:ListItem resourcekey="liTop" Value="rs-top" Text="top" />
																			<asp:ListItem resourcekey="liRight" Value="rs-right" Text="right" />
																			<asp:ListItem resourcekey="liBottom" Value="rs-bottom" Text="bottom" />
																			<asp:ListItem resourcekey="liLeft" Value="rs-left" Text="left" />
																			<asp:ListItem resourcekey="liTop-Right" Value="rs-top-right" Text="top-right" />
																			<asp:ListItem resourcekey="liTop-Left" Value="rs-top-left" Text="top-left" />
																			<asp:ListItem resourcekey="liBottom-Right" Value="rs-bottom-right" Text="bottom-right" />
																			<asp:ListItem resourcekey="liBottom-Left" Value="rs-bottom-left" Text="bottom-left" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr runat="server" id="rowSScaptionWidth">
																<td>
																	<dnn:Label ID="lblSScaptionWidth" runat="server" HelpText="Int (default 50): Percentage of slide taken by caption." Text="Percentage of slide caption:" ResourceKey="lblSScaptionWidth" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSScaptionWidth" runat="server" CssClass="small textCenter" MaxLength="3" ValidationGroup="SettingsSave" Text="50" />
																	<asp:RequiredFieldValidator ID="rfvtbxSScaptionWidth" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSScaptionWidth" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvtbxSScaptionWidth" resourcekey="rvtbxSScaptionWidth.ErrorMessage" runat="server" ControlToValidate="tbxSScaptionWidth" Display="Dynamic" ErrorMessage="Between 0 and 100" MaximumValue="100" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSStitleLenght" runat="server" HelpText="Number of characters in title string to display in Item Container" Text="Title lenght:" ControlName="tbxCRTitleLenght" ResourceKey="lblSStitleLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSStitleLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">100</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvtbxSStitleLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSStitleLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvtbxSStitleLenght" resourcekey="rvtbxSStitleLenght.ErrorMessage" runat="server" ControlToValidate="tbxSStitleLenght" Display="Dynamic" ErrorMessage="0 - 500 " MaximumValue="500" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																		SetFocusOnError="True" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr>
																<td>
																	<dnn:Label ID="lblSSdescriptionLenght" runat="server" HelpText="Number of characters in description string to display in Item Container. Depends on html css tags in string" Text="Description lenght:" ControlName="tbxCRDescriptionLenght" ResourceKey="lblSSdescriptionLenght" />
																</td>
																<td>
																	<asp:TextBox ID="tbxSSdescriptionLenght" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave">200</asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvSSdescriptionLenght" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxSSdescriptionLenght" Display="Dynamic" ErrorMessage="Value!" ValidationGroup="SettingsSave" SetFocusOnError="True" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvSSdescriptionLenght" resourcekey="rvSSdescriptionLenght.ErrorMessage" runat="server" ControlToValidate="tbxSSdescriptionLenght" Display="Dynamic" ErrorMessage="0 - 4000 " MaximumValue="4000" MinimumValue="0" Type="Integer" ValidationGroup="SettingsSave"
																		SetFocusOnError="True" CssClass="smallInfo error" />
																</td>
															</tr>
														</table>
													</asp:Panel>
													<asp:Panel ID="pnlMultiROprions" runat="server" Visible="false" class="settingsTable">
														<table class="settings_table">
															<tr id="rowMultiRDimensions" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRWidthHeight" runat="server" HelpText="The base width/height of slides. It helps the slider to resize in correct ratio." Text="Rotator width/height:" ResourceKey="lblMultiRWidthHeight" />
																</td>
																<td>
																	<asp:TextBox ID="tbxMultiRWidth" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="600" />&nbsp;/&nbsp;
																	<asp:TextBox ID="tbxMultiRHeight" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="480" />
																	<asp:RequiredFieldValidator ID="rfvMultiRWidth" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxMultiRWidth" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvMultiRWidth" resourcekey="rvSizeShifterWidth.ErrorMessage" runat="server" ControlToValidate="tbxMultiRWidth" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680" MaximumValue="7680" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RequiredFieldValidator ID="rfvMultiRHeight" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxMultiRHeight" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvMultiRHeight" resourcekey="rvSizeShifterHeight.ErrorMessage" runat="server" ControlToValidate="tbxMultiRHeight" Display="Dynamic" ErrorMessage=" (W) between 1 and 7680" MaximumValue="7680" MinimumValue="1" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr id="rowMultiRshowtitle" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRShowTitle" runat="server" HelpText="Show title." Text="Show title:" ControlName="cbMultiRShowTitle" ResourceKey="lblMultiRShowTitle" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRShowTitle" runat="server" Checked="true" Text="Show title" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRlimittitle" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRTitleLength" runat="server" HelpText="Title Length. Enter 0 for unlimited" Text="Title Length:" ResourceKey="lblMultiRTitleLength" />
																</td>
																<td>
																	<asp:TextBox ID="tbxMultiRTitleLength" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="0" />
																	<asp:RequiredFieldValidator ID="rfvMultiRTitleLength" runat="server" ControlToValidate="tbxMultiRTitleLength" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvMultiRTitleLength" resourcekey="rvMultiRTitleLength.ErrorMessage" runat="server" ControlToValidate="tbxMultiRTitleLength" Display="Dynamic" ErrorMessage="Between 0 and 9999" MaximumValue="9999" MinimumValue="0" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr id="rowMultiRshowdescription" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRShowDescription" runat="server" HelpText="Show description." Text="Show description:" ControlName="cbMultiRShowTitle" ResourceKey="lblMultiRShowDescription" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRShowDescription" runat="server" Checked="true" Text="Show description" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRlimitdescription" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRDescriptionLength" runat="server" HelpText="Description Length. Enter 0 for unlimited" Text="Description Length:" ResourceKey="lblMultiRDescriptionLength" />
																</td>
																<td>
																	<asp:TextBox ID="tbxMultiRDescriptionLength" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="0" />
																	<asp:RequiredFieldValidator ID="rfvDescriptionLength" runat="server" ControlToValidate="tbxMultiRDescriptionLength" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvDescriptionLength" runat="server" resourcekey="rvMultiRDescriptionLength.ErrorMessage" ControlToValidate="tbxMultiRDescriptionLength" Display="Dynamic" ErrorMessage="Between 0 and 9999" MaximumValue="9999" MinimumValue="0" Type="Integer" SetFocusOnError="True" ValidationGroup="SettingsSave"
																		CssClass="smallInfo error" />
																</td>
															</tr>
															<tr id="rowMultiRstripdescription" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRStripDescription" runat="server" HelpText="Only text is displayed in rotator description place." Text="Strip HTML from description:" ControlName="cbCarouselStripHtmlDesc" ResourceKey="lblCarouselStripHtml" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRStripDescription" runat="server" Checked="false" Text="Strip HTML from description" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRshowreadmore" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRShowReadMore" runat="server" HelpText="Show Read more button." Text="Show Read more button:" ControlName="cbMultiRShowReadMore" ResourceKey="lblMultiRShowReadMore" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRShowReadMore" runat="server" Checked="true" Text="Show Read more button" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRstart" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRStart" runat="server" HelpText="The slider starting slide number." Text="Start:" ResourceKey="lblMultiRStart" />
																</td>
																<td>
																	<asp:TextBox ID="tbxMultiRStart" runat="server" CssClass="small textCenter" MaxLength="3" ValidationGroup="SettingsSave" Text="1" />
																	<asp:RequiredFieldValidator ID="rfMultiRStartMultiRStart" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxMultiRStart" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:CompareValidator ID="rvMultiRStart" resourcekey="rvMultiRStart.ErrorMessage" runat="server" ControlToValidate="tbxMultiRStart" Display="Dynamic" Operator="DataTypeCheck" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr id="rowMultiRspace" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRSpace" runat="server" HelpText="The spacing value between slides in pixels." Text="Space:" ResourceKey="lblMultiRSpace" />
																</td>
																<td>
																	<asp:TextBox ID="tbxMultiRSpace" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="0" />
																	<asp:RequiredFieldValidator ID="rfvMultiRSpace" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxMultiRSpace" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:CompareValidator ID="rvMultiRSpace" resourcekey="rvMultiRSpace.ErrorMessage" runat="server" ControlToValidate="tbxMultiRSpace" Display="Dynamic" ErrorMessage="Please enter number only." Operator="DataTypeCheck" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr id="rowMultiRgrabcursor" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRGrabCursor" runat="server" ControlName="cbMultiRGrabCursor" HelpText="Whether the slider uses grab mouse cursor." Text="Grab Cursor:" ResourceKey="lblMultiRGrabCursor" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRGrabCursor" runat="server" Checked="true" Text="Grab Cursor" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRswipe" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRSwipe" runat="server" ControlName="cbMultiRSwipe" HelpText="Whether the drag/swipe navigation is enabled." Text="Swipe:" ResourceKey="lblMultiRSwipe" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRSwipe" runat="server" Checked="true" Text="Swipe" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRmouseswipe" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRMouse" runat="server" ControlName="cbMultiRMouse" HelpText="Whether the user can use mouse drag navigation." Text="Mouse swipe:" ResourceKey="lblMultiRMouse" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRMouse" runat="server" Checked="true" Text="Mouse swipe" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRwheel" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRWheel" runat="server" ControlName="cbMultiRWheel" HelpText="Enables mouse scroll wheel navigation." Text="Wheel:" ResourceKey="lblMultiRWheel" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRWheel" runat="server" Checked="true" Text="Wheel" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRautoplay" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRAutoplay" runat="server" ControlName="cbMultiRAutoplay" HelpText="Enables the autoplay slideshow." Text="Autoplay:" ResourceKey="lblMultiRAutoplay" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRAutoplay" runat="server" Text="Autoplay" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRloop" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRLoop" runat="server" ControlName="cbMultiRLoop" HelpText="Enables the continuous sliding mode." Text="Loop:" ResourceKey="lblMultiRLoop" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRLoop" runat="server" Text="Loop" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRshuffle" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRShuffle" runat="server" ControlName="cbMultiRShuffle" HelpText="Enables the shuffle slide order." Text="Shuffle:" ResourceKey="lblMultiRShuffle" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRShuffle" runat="server" Text="Shuffle" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRpreload" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRPreload" runat="server" HelpText="Specifies number of slides which will be loaded by slider. 0 value means slider will load slides in sequence and 'all' value means slider will load all of the slides at starting. This option is only effective for images which has 'data-src' attribute."
																		Text="Preload:" ResourceKey="lblMultiRPreload" />
																</td>
																<td>
																	<asp:TextBox ID="tbxMultiRPreload" runat="server" CssClass="small textCenter" MaxLength="3" ValidationGroup="SettingsSave" Text="0" />
																	<asp:RequiredFieldValidator ID="rfvMultiRPreload" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxMultiRPreload" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:CompareValidator ID="rvMultiRPreload" resourcekey="rvMultiRThumbListPreload.ErrorMessage" runat="server" ControlToValidate="tbxMultiRPreload" Display="Dynamic" ErrorMessage="Please enter number only." Operator="DataTypeCheck" Type="Integer"
																		SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr id="rowMultiRfullwidth" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRFullwidth" runat="server" ControlName="cbMultiRFullwidth" HelpText="It enables the slider to adapt width to its parent element. It's very useful for creating full-width sliders. In default it takes max width as its base width value."
																		Text="Full width:" ResourceKey="lblMultiRFullwidth" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRFullwidth" runat="server" Text="Full width" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRfullheight" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRFullheight" runat="server" ControlName="cbMultiRFullheight" HelpText="It enables the slider to adapt height to its parent element." Text="Full height:" ResourceKey="lblMultiRFullheight" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRFullheight" runat="server" Text="Full height" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRautofill" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRAutofill" runat="server" ControlName="cbMultiRAutofill" HelpText="It enables the slider to adapt width and height to its parent element. It's very useful for creating fullscreen slider." Text="Auto fill:" ResourceKey="lblMultiRAutofill" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRAutofill" runat="server" Text="Auto fill" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRheightlimit" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRHeightLimit" runat="server" ControlName="cbMultiRHeightLimit" HelpText="It force the slide to use max height value as its base specified height value." Text="Height limit:" ResourceKey="lblMultiRHeightLimit" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRHeightLimit" runat="server" Text="Height limit" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRautoheight" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRAutoHeight" runat="server" ControlName="cbMultiRAutoHeight" HelpText="Whether the slider adapts its height to each slide height or not. It overrides heightLimit option." Text="Auto Height:" ResourceKey="lblMultiRAutoHeight" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRAutoHeight" runat="server" Text="Auto Height" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRsmoothheight" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRSmoothHeight" runat="server" ControlName="cbMultiRSmoothHeight" HelpText="Whether the slider uses smooth animation while its height changes." Text="Smooth Height:" ResourceKey="lblMultiRSmoothHeight" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRSmoothHeight" runat="server" Checked="true" Text="Smooth Height" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRendpause" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiREndPause" runat="server" ControlName="cbMultiREndPause" HelpText="Whether the slider pauses slideshow when it reachs to last slide." Text="End Pause:" ResourceKey="lblMultiREndPause" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiREndPause" runat="server" Text="End Pause" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRoverpause" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiROverPause" runat="server" ControlName="cbMultiROverPause" HelpText="Whether the slider pauses slideshow on hover." Text="Over pause:" ResourceKey="lblMultiROverPause" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiROverPause" runat="server" Text="Over pause" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRfillmode" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRFillMode" runat="server" ControlName="ddlMultiRFillMode" HelpText="Specifies the slide background scaling method. Its acceptable values are 'fill', 'fit', 'stretch', 'center' and 'tile'." Text="Fill mode:" ResourceKey="lblMultiRFillMode" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlMultiRFillMode" runat="server">
																			<asp:ListItem Text="fill" Value="fill" Selected="True" />
																			<asp:ListItem Text="fit" Value="fit" />
																			<asp:ListItem Text="stretch" Value="stretch" />
																			<asp:ListItem Text="center" Value="center" />
																			<asp:ListItem Text="tile" Value="tile" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRcentercontrols" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRCenterControls" runat="server" ControlName="cbMultiRCenterControls" HelpText="Whether the slider aligns UI controls to center. This option is only effective in full width mode." Text="Center controls:" ResourceKey="lblMultiRCenterControls" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRCenterControls" runat="server" Checked="false" Text="Center controls" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRlayersmode" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRLayersMode" runat="server" ControlName="ddlMultiRLayersMode" HelpText="It accepts two values 'center' and 'full'. The 'center' value indicates that the slider aligns layers to the center. This option is only effective in full width mode."
																		Text="Layers Mode:" ResourceKey="lblMultiRLayersMode" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlMultiRLayersMode" runat="server">
																			<asp:ListItem Text="center" Value="center" Selected="True" />
																			<asp:ListItem Text="full" Value="full" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRhidelayers" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRHideLayers" runat="server" ControlName="cbMultiRHideLayers" HelpText="Whether the slider hides all layers before changing slide." Text="Hide Layers:" ResourceKey="lblMultiRHideLayers" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRHideLayers" runat="server" Checked="false" Text="Hide Layers" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRborder" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRBorder" runat="server" ControlName="cbMultiRBorder" HelpText="Slider border." Text="Border:" ResourceKey="lblMultiRBorder" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRBorder" runat="server" Checked="false" Text="Border" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRslidelink" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRSlideLink" runat="server" ControlName="cbMultiRSlideLink" HelpText="Slide link." Text="Slide link:" ResourceKey="lblMultiRSlideLink" />
																</td>
																<td>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRSlideLink" runat="server" Checked="true" Text="Slide link" />
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRspeed" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRSpeed" runat="server" ControlName="tbxMultiRSpeed" HelpText="Specifies slide changing speed. It accepts float values between 0 and 100." Text="Speed:" ResourceKey="lblMultiRSpeed" />
																</td>
																<td>
																	<asp:TextBox ID="tbxMultiRSpeed" runat="server" CssClass="small textCenter" MaxLength="3" ValidationGroup="SettingsSave" Text="17" />
																	<asp:RequiredFieldValidator ID="rfvMultiRSpeed" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="tbxMultiRSpeed" Display="Dynamic" ErrorMessage="Value! " SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	<asp:RangeValidator ID="rvMultiRSpeed" resourcekey="rvMultiRThumbListSpeed.ErrorMessage" runat="server" ControlToValidate="tbxMultiRSpeed" Display="Dynamic" ErrorMessage="Speed between 0 and 100" MaximumValue="100" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																		ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																</td>
															</tr>
															<tr id="rowMultiRdir" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRDir" runat="server" HelpText="Specifies slide changing direction. It accepts two values 'h' (horizontal) and 'v' (vertical)." Text="Direction:" ResourceKey="lblMultiRDir" />
																</td>
																<td>
																	<asp:RadioButtonList ID="rblMultiRDir" runat="server" RepeatDirection="Horizontal" CssClass="styledRadio small">
																		<asp:ListItem Text="horizontal" Value="horizontal" Selected="True" />
																		<asp:ListItem Text="vertical" Value="vertical" />
																	</asp:RadioButtonList>
																</td>
															</tr>
															<tr id="rowMultiRview" runat="server" visible="false">
																<td>
																	<dnn:Label ID="lblMultiRTransitionType" runat="server" HelpText="You can change type of slide transitions in slider options." Text="Transition types:" ResourceKey="lblMultiRTransitionType" />
																</td>
																<td>
																	<div class="styledSelect">
																		<asp:DropDownList ID="ddlMultiRTransitionTypes" runat="server">
																			<asp:ListItem Text="basic" Value="basic" Selected="True" />
																			<asp:ListItem Text="fade" Value="fade" />
																			<asp:ListItem Text="mask" Value="mask" />
																			<asp:ListItem Text="wave" Value="wave" />
																			<asp:ListItem Text="flow" Value="flow" />
																			<asp:ListItem Text="stack" Value="stack" />
																			<asp:ListItem Text="scale" Value="scale" />
																			<asp:ListItem Text="focus" Value="focus" />
																			<asp:ListItem Text="parallaxMask" Value="parallaxMask" />
																			<asp:ListItem Text="partialWave" Value="partialWave" />
																			<asp:ListItem Text="fadeBasic" Value="fadeBasic" />
																			<asp:ListItem Text="fadeWave" Value="fadeWave" />
																			<asp:ListItem Text="fadeFlow" Value="fadeFlow" />
																		</asp:DropDownList>
																	</div>
																</td>
															</tr>
															<tr id="rowMultiRfullscreen" runat="server" visible="false">
																<td class="textTop">
																	<dnn:Label ID="lblMultiRfullscreen" runat="server" HelpText="Forces the slider to adapt width and height to the browser window dimension." Text="Fullscreen:" ResourceKey="lblMultiRfullscreen" />
																</td>
																<td>
																	<%--<div class="styledSelect">
																		<asp:DropDownList ID="ddlMultiRLayout" runat="server">
																			<asp:ListItem Text="boxed" Value="boxed" Selected="True" />
																			<asp:ListItem Text="fullwidth" Value="fullwidth" />
																			<asp:ListItem Text="fullscreen" Value="fullscreen" />
																			<asp:ListItem Text="fillwidth" Value="fillwidth" />
																			<asp:ListItem Text="autofill" Value="autofill" />
																			<asp:ListItem Text="partialview" Value="partialview" />
																		</asp:DropDownList>
																	</div>--%>
																	<div class="styledCheckbox noLabel">
																		<asp:CheckBox ID="cbMultiRfullscreen" Text="Fullscreen" runat="server" AutoPostBack="true" OnCheckedChanged="cbMultiRfullscreen_CheckedChanged" />
																	</div>
																	<div runat="server" id="rowMultiRfullscreenMargin" visible="false">
																		<dnn:Label ID="lblMultiRfullscreenMargin" runat="server" HelpText="Fullscreen margin." Text="Fullscreen margin:" ResourceKey="lblMultiRfullscreenMargin" />
																		<asp:TextBox ID="MultiRfullscreenMargin" runat="server" CssClass="small textCenter" MaxLength="4" ValidationGroup="SettingsSave" Text="0" />
																		<asp:RequiredFieldValidator ID="rfvMultiRfullscreenMargin" resourcekey="Valuerequired.ErrorMessage" runat="server" ControlToValidate="MultiRfullscreenMargin" Display="Dynamic" ErrorMessage="Value!" SetFocusOnError="True" ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																		<asp:RangeValidator ID="rvMultiRfullscreenMargin" resourcekey="rvMultiRfullscreenMargin.ErrorMessage" runat="server" ControlToValidate="MultiRfullscreenMargin" Display="Dynamic" ErrorMessage="(W) between 1 and 7680" MaximumValue="7680" MinimumValue="0" Type="Integer" SetFocusOnError="True"
																			ValidationGroup="SettingsSave" CssClass="smallInfo error" />
																	</div>
																</td>
															</tr>
														</table>
													</asp:Panel>
													<script type="text/javascript">
														jQuery(document).ready(function ($) {
															$("#<%=lbSaveSettings.ClientID%>").click(function () {
																if (Page_ClientValidate("SettingsSave")) {
																	$('#saveLoaderGif').css('display', 'block');
																}
															});
															$("#<%=lbSaveAndClose.ClientID%>").click(function () {
																if (Page_ClientValidate("SettingsSave")) {
																	$('#saveLoaderGif').css('display', 'block');
																}
															});
														});
													</script>
													<asp:Panel ID="pnlBottomButtons" runat="server">
														<div class="mainActions">
															<asp:LinkButton ID="lbSaveSettings" resourcekey="lbSaveSettings" runat="server" CssClass="downSave" OnClick="lbSaveSettings_Click" ValidationGroup="SettingsSave" CausesValidation="true">Save settings</asp:LinkButton>
															<asp:LinkButton ID="lbSaveAndClose" resourcekey="lbSaveAndClose" runat="server" CssClass="downSaveClose" OnClick="lbSaveAndClose_Click" ValidationGroup="SettingsSave" CausesValidation="true">Save & close settings</asp:LinkButton>
															<asp:HyperLink ID="lbBottomClose" resourcekey="lbBottomClose" runat="server" CssClass="downClose">Close</asp:HyperLink>
														</div>
														<div class="saveLoader">
															<asp:Label ID="lblSaveSettingsErr" runat="server" EnableViewState="False" Visible="false" />
															<img id="saveLoaderGif" src="<%=ModulePath%>Images/saveloader.gif" alt="AnimaedGif" style="display: none;" />
														</div>
													</asp:Panel>
												</asp:Panel>
												<asp:Panel ID="pnlExportXMLFuter" runat="server" Visible="false" class="contentSection exportSettings">
													<div class="specialOptions">
														<h2>
															<dnn:Label ID="lblExport" ResourceKey="lblExport" runat="server" HelpText="Settings are added to DropDownList from where you can load those settings. Setting are Saved to path - ModulePath/PreSettings/" Text="Save settings:" />
														</h2>
														<div class="optionsList paddingTopBottom">
															<div class="styledCheckbox big noLabel">
																<asp:CheckBox ID="cbExportSettings" resourcekey="cbExportSettings" runat="server" ToolTip="Enable/Disable Export" Checked="false" AutoPostBack="True" OnCheckedChanged="cbExportSettings_CheckedChanged" Text="Save settings" />
															</div>
														</div>
													</div>
													<asp:Panel ID="pnlExportSettings" runat="server" Visible="false" CssClass="saveLoadSettings">
														<table>
															<tr>
																<td>
																	<dnn:Label ID="lblExportSettingsName" runat="server" HelpText="Name of XML file. Location of file - ModulePath/PreSettings/. Try not too use existing file name or it will be overwriten!" Text="XML filename:" ControlName="tbxExportSettingsName" ResourceKey="lblExportSettingsName" />
																</td>
																<td>
																	<asp:TextBox ID="tbxExportSettingsName" runat="server" ValidationGroup="vgSaveExportXML" CausesValidation="True"></asp:TextBox>
																	<asp:RequiredFieldValidator ID="rfvExportSettingsName" runat="server" ErrorMessage="XML Filename." ControlToValidate="tbxExportSettingsName" ValidationGroup="vgSaveExportXML" Display="Dynamic" CssClass="smallInfo error" />
																	<div class="itemActions itemEditActions">
																		<asp:LinkButton ID="btnExportSettingsSave" resourcekey="btnExportSettingsSave" runat="server" Text="Export settings" ValidationGroup="vgSaveExportXML" OnClick="btnExportSettingsSave_Click" CssClass="itemEditAdd" />
																	</div>
																</td>
															</tr>
														</table>
													</asp:Panel>
													<asp:Label ID="lblImportExportInfo" runat="server" Visible="false" Text="" EnableViewState="false" CssClass="infoMessages info" />
													<asp:Button ID="btnExportSettings" runat="server" Text="Export" OnClick="ExportSettingsToXmlFile" Visible="false" />
												</asp:Panel>
											</asp:Panel>
										</div>
									</ContentTemplate>
								</asp:UpdatePanel>
							</div>
						</asp:Panel>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Panel>
