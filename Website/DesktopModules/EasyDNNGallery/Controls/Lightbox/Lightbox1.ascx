﻿<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.DesktopModules_EasyDNNGallery_Controls_LightboxControl, App_Web_lightbox1.ascx.c5ff317f" %>
<style type="text/css">
	#<%=ModuleNBR%>EasyDNNGallery table.EDGlightbox.EDGresponsive
	{
		width: 100%;
		max-width: <%=maxwidth%>px;
	}
	#<%=ModuleNBR%>EasyDNNGallery table.EDGlightboxNested.EDGresponsive
	{
		width: 100%;
		max-width: <%=nestedmaxwidth%>px;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGlightbox.EDGresponsive td
	{
		display: inline-block;
		width: <%=percentWidth%>%;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGlightboxNested.EDGresponsive td
	{
		display: inline-block;
		width: <%=NGThumbWidthPercent%>%;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive a, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .titleempty
	{
		width: 100%;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGmain .EDGimage a .title, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGmain .EDGimage a .title span
	{
		width: 100%;
		max-width: 100%;
		padding: 2px 0;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGmain .EDGimage a .Description
	{
		max-width: 100%;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGmain
	{
		max-width: <%=myappSettings.TGImageWidth%>px;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGlightboxNested.EDGresponsive .EDGmain
	{
		max-width: <%=myappSettings.NGThumbWidth%>px;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGimage, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGvideo, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGaudio
	{
		max-width: 100%;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive img
	{
		max-width: <%=myappSettings.TGImageWidth%>px;
		width: 100%;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive input
	{
		width: 100%;
		max-width: <%=myappSettings.NGThumbWidth%>px;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGimage a img, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGimage a, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGimage a input, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGmain
	{
		float: none;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGvideo a img, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGvideo a, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGmain
	{
		float: none;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGaudio a img, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGaudio a, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGmain
	{
		float: none;
	}
	#<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGimage a:hover img, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGvideo a:hover img, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGaudio a:hover img, #<%=ModuleNBR%>EasyDNNGallery .EDGresponsive .EDGimage a:hover input
	{
		float: none;
	}
	.eds_edn_qtip2_style
	{
	-moz-border-radius: <%=myappSettings.TooltipRadius%>px;
	-webkit-border-radius: <%=myappSettings.TooltipRadius%>px;
	border-radius: <%=myappSettings.TooltipRadius%>px;
	border-width: <%=myappSettings.TooltipBorder%>px;
	}
</style>
<script type="text/javascript">
function sGoogle()
{
	var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	po.src = 'https://apis.google.com/js/plusone.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	
	var potw = document.createElement('script'); potw.type = 'text/javascript';
	potw.src = 'https://platform.twitter.com/widgets.js';
	var stw = document.getElementsByTagName('script')[0]; stw.parentNode.insertBefore(potw, stw);
}

<%=jQuery%>(document).ready(function($){
if('<%=ShowToolTips.ToString().ToLower()%>'=='true') {
	if('<%=showLightboxDescription.ToString().ToLower() %>'=='true') {
		$('#<%=ModuleNBR%>EasyDNNGallery .EDGimage a[title], #<%=ModuleNBR%>EasyDNNGallery .EDGvideo a[title], #<%=ModuleNBR%>EasyDNNGallery .EDGaudio a[title]').each(function() {
			if($(this).attr("title").length>0){
				$(this).qtip({
					show: {  effect: function(offset) { <%=myappSettings.ShowEffect%> } },
					hide: {  effect: function(offset) { <%=myappSettings.HideEffect%> } },
					position: { at: '<%=myappSettings.TargetPosition%>', my: '<%=myappSettings.TooltipPosition%>'},
					style: { classes: 'qtip-<%=myappSettings.TooltipTheme%> eds_edn_qtip2_style', tip: {corner: true, width: 10, height: 5},  border: { width: <%=myappSettings.TooltipBorder%>, radius: <%=myappSettings.TooltipRadius%> }} 
					});
				}
			});
		}
	}
});

function pageLoad(sender, args) {
	if (args.get_isPartialLoad()) {
	<%=jQuery%>(document).ready(function($) {
		$('#<%=ModuleNBR%>EasyDNNGallery a[rel^="prettyPhoto"], #<%=ModuleNBR%>EasyDNNGallery a[rel^="slP"]').each(function () {
			if ($(this).attr("title")) {
				if ($(this).attr("title").length > 0) {
					$(this).attr("pptitle", $(this).attr("title"));
				}
			}
		});
	if ('<%=myappSettings.LightboxSelection%>' == 'prettyphoto')
		{
			$("a[rel^='prettyPhoto'], a[rel^='slP']").prettyPhoto({
			animationSpeed: '<%=AnimSpeed%>',
			slideshow: <%=LightBoxSlideShow%>,
			autoplay_slideshow: <%=myappSettings.LightBoxSSAP%>, 
			padding: 40, 
			opacity: 0.8,
			showTitle: true, 
			allowresize: true,
			hideflash: true, 
			wmode: 'opaque',
			 downloadText:'<%=strDownloadImage%>',
			autoplay: <%=PlayOnLoadLB%>, 
			modal: false,    
			overlay_gallery: <%=showLightboxThumbnails.ToString().ToLower()%>,
			counter_separator_label: '/', 
			print_image_text: '<%=PrintImageText%>',
			item_emailing_text: '<%=EmailText%>',
			item_emailing_subject: '<%=EmailTextSubject%>',
			allow_image_printing:<%=myappSettings.LightboxShowPrint%>,
			enable_item_emailing:<%=myappSettings.LightboxShowEmail%>,
			show_social_sharing:<%=myappSettings.LightboxSocialSharing%>,
			download_handler_url:'<%=ShowDownloadLinkLightbox %>',
			theme: '<%=LightboxType %>', 
			callback: function() { }
			});
			}	
if('<%=ShowToolTips.ToString().ToLower()%>'=='true') {
	if('<%=showLightboxDescription.ToString().ToLower() %>'=='true') {
		$('#<%=ModuleNBR%>EasyDNNGallery .EDGimage a[title], #<%=ModuleNBR%>EasyDNNGallery .EDGvideo a[title], #<%=ModuleNBR%>EasyDNNGallery .EDGaudio a[title]').each(function() {
			if($(this).attr("title").length>0){
				$(this).qtip({
					show: {  effect: function(offset) { <%=myappSettings.ShowEffect%> } },
					hide: {  effect: function(offset) { <%=myappSettings.HideEffect%> } },
					position: { at: '<%=myappSettings.TargetPosition%>', my: '<%=myappSettings.TooltipPosition%>'},
					style: { classes: 'qtip-<%=myappSettings.TooltipTheme%> eds_edn_qtip2_style', tip: {corner: true, width: 10, height: 5}}
					});
				}
			});
		}
	}
});
}
}
</script>
<asp:literal id="ltOpenImage" runat="server" enableviewstate="False"></asp:literal>
<div id="LightBoxGallery">
	<asp:updatepanel id="upTableGallery" runat="server" updatemode="Always" enableviewstate="False" OnUnload="UpdatePanel_Unload">
		<contenttemplate>
		<asp:HiddenField ID="hfNestedOpen" runat="server" Value="0" />
			<div id="<%=CssClass%>">
				<div class="EDGbackground">
					<div class="EDGcontentbgrd">
						<div class="EDGcornerbotleft">
							<div class="EDGcornerbotright">
								<div class="EDGcornertopleft">
									<div class="EDGcornertopright">
										<div class="EDGcontent">
										<asp:Literal ID="ltedsLightBoxData" enableviewstate="False" runat="server"></asp:Literal>
											<asp:Panel ID="pnlBreadCrumb" runat="server" Visible="True" CssClass="nestedBreadCrumb">
												<asp:LinkButton ID="lbBCTOPGallery" runat="server" OnClick="lbBCTOPGallery_Click"></asp:LinkButton>
												>
												<asp:HyperLink ID="lblBCGallery" runat="server"></asp:HyperLink>
											</asp:Panel>
											<asp:Panel ID="pnlNestedGalleries" runat="server" HorizontalAlign="Center">
											<asp:DataList ID="dlNestedCategory" runat="server" DataKeyField="GalleryID" OnItemCommand="dlNestedCategory_ItemCommand"
													CellPadding="0" RepeatDirection="Horizontal" RepeatColumns="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" RepeatLayout="Table" HorizontalAlign="Center"
													EnableViewState="False" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center" CssClass='<%#FixedResponsiveNestedClass%>' ItemStyle-Wrap="False">
													<AlternatingItemStyle HorizontalAlign="Center" />
													<EditItemStyle HorizontalAlign="Center" />
													<ItemTemplate>
														<div class="EDGmain">
															<div class="EDGimage">
																<asp:HiddenField ID="hfGallID" runat="server" Value='<%#Eval("GalleryID")%>' />
																<a href="" runat="server">
																	<asp:ImageButton ID="ibNestedGallery" runat="server" CommandName="OpenNestedGallery"
																		CommandArgument='<%#Eval("GalleryID")%>' ImageUrl='<%#GetGalleryThumbPath(DataBinder.Eval(Container.DataItem, "GalleryID")) %>' ImageAlign="Middle" />
																	<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																	<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																	<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																	<span class="round4"></span></a>
															</div>
														</div>
														<div class="titleimage" style='max-width: <%=myappSettings.NGThumbWidth%>px;'>
															<div class='<%#NGTitleClass(DataBinder.Eval(Container.DataItem, "GalleryName"),DataBinder.Eval(Container.DataItem, "GalleryDescription"))%>'>
																<asp:Label ID="lblTGNGTitle" runat="server" Text='<%#Server.HtmlDecode(ShowNestedGalleryTitle(DataBinder.Eval(Container.DataItem, "GalleryName"),DataBinder.Eval(Container.DataItem, "GalleryID")))%>'
																	Visible='<%#NGTitleToDisplay(Eval("GalleryName"))%>'></asp:Label></div>
														</div>
														<div style='max-width: <%=myappSettings.NGThumbWidth%>px;'>
															<asp:Label ID="lblTGNGDescription" runat="server" CssClass="DescriptionImage" Text='<%#Server.HtmlDecode(ShowNestedGalleryDescription(DataBinder.Eval(Container.DataItem, "GalleryDescription"),DataBinder.Eval(Container.DataItem, "GalleryID")))%>'
																Visible='<%#NGDescriptionToDisplay(Eval("GalleryDescription"))%>'></asp:Label>
															<asp:Label ID="lbGalleryLink" runat="server" CssClass="NestedInfo" Text='<%#GetMediaInfo(Eval("GalleryID"))%>'
																Visible='<%#GalleryInfo%>'></asp:Label></div>
													</ItemTemplate><FooterStyle HorizontalAlign="Center" />
													<HeaderStyle HorizontalAlign="Center" />
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True" />
													<SelectedItemStyle HorizontalAlign="Center" />
													<SeparatorStyle HorizontalAlign="Center" />
												</asp:DataList>
												<asp:GridView ID="gvNestedPaging" runat="server" AllowPaging="True" AutoGenerateColumns="False"
													BorderStyle="None" BorderWidth="0px" CssClass="pagerbox" DataKeyNames="GalleryID"
													GridLines="None" HorizontalAlign="Center" OnPageIndexChanging="gvNestedPaging_PageIndexChanging"
													ShowHeader="False" Visible="False" ShowFooter="True">
													<Columns>
														<asp:BoundField DataField="GalleryID" Visible="false" />
													</Columns>
													<PagerStyle HorizontalAlign="Center" CssClass="EDGpager" BorderWidth="0px" BorderStyle="None" />
												</asp:GridView>
											</asp:Panel>
											<asp:Panel ID="pnlTGDisplay" runat="server" HorizontalAlign="Center">
												<div class="EDGTitle">
													<asp:Label ID="lblTGTitle" runat="server" CssClass="EDGTitleText"></asp:Label>
													<asp:Label ID="lblTGDescription" runat="server" CssClass="GalleryDescription"></asp:Label>
												</div>
												<asp:Panel ID="pnlTopButton" runat="server">
													<asp:Panel ID="pnlNestedGalleryBackTop" runat="server" Visible="False">
														<div style="overflow: hidden; margin-bottom: 10px;">
															<asp:LinkButton ID="btnBackButtonTop" runat="server" OnClick="btnBack_Click" CssClass="btnGalleryBack">
															</asp:LinkButton>
														</div>
													</asp:Panel>
												</asp:Panel>
												<asp:DataList ID="dlTableGallery" runat="server" CellPadding="0" RepeatDirection="Horizontal"
													RepeatColumns="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" CssClass='<%#FixedResponsiveClass%>'
													Font-Strikeout="False" Font-Underline="False" DataKeyField="PictureID" OnPreRender="dlTableGallery_PreRender"
													RepeatLayout="Table" HorizontalAlign="Center" OnItemCreated="dlTableGallery_ItemCreated"
													ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" EditItemStyle-VerticalAlign="Top"
													SelectedItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top" HeaderStyle-VerticalAlign="Top"
													EnableViewState="False">
													<AlternatingItemStyle HorizontalAlign="Center" />
													<EditItemStyle HorizontalAlign="Center" />
													<ItemTemplate>
														<asp:PlaceHolder ID="plImage" runat="server" Visible='<%# ToDisplay("Image",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGimage">
																	<a data-item-index='<%#Eval("MediaItemIndex")%>' data-mediatype="image" href='<%#Eval("LinkOrLightbox")%>' downhref='<%#Eval("GetLighboxImageDownURL")%>'
																		target="<%#Eval("TargetWin")%>" lbnestedurl='<%#Eval("GetLighboxNestedURL")%>'
																		edgpid='<%#Eval("PictureID")%>' edgmid='<%=ModuleId.ToString()%>' title='<%#Eval("GetDescription3")%>'
																		rel="<%#Eval("RelLink")%>">
																		<asp:Image ID="DataListImage" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			EnableTheming="True" alt='<%#Eval("GetAlt")%>' ImageAlign="Middle" />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=myappSettings.SocialSharingButtons%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																			<%#Eval("GetPinterestButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%#Eval("LinkOrLightbox")%>' target="<%#Eval("TargetWin")%>" edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ModuleId.ToString()%>' title='<%#Eval("GetDescription3")%>' rel="<%#RelLink2()%>">
																<div class="titleimage" style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="lblItemTitle" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<asp:Label ID="lblTGDescription6" runat="server" CssClass="DescriptionImage" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a>
															<div style="clear: both; display: block; text-align: center;">
																<asp:HyperLink ID="hlDownloadImage" runat="server" NavigateUrl='<%#Eval("GetImageDownURL")%>'
																	Visible='<%#Eval("GetDownloadVisible")%>' CssClass="downloadlink"><%=strDownloadImage%></asp:HyperLink></div>
														</asp:PlaceHolder>
														<asp:PlaceHolder ID="plEmbed" runat="server" Visible='<%# ToDisplay("Embeded Video",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ModuleId.ToString()%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="EmbedImageThumb" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			alt='<%#Eval("GetAlt")%>' ImageAlign="Middle" />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=myappSettings.SocialSharingButtons%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																			<%#Eval("GetPinterestButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%#FixVimeo(Eval("ShortEmbedUrl"),GetLightBoxSize(DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "Filename")))%>'
																lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ModuleId.ToString()%>' rel="<%#RelLink2()%>" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="EmbedTitleLabel" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<asp:Label ID="lblTGDescription2" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlash" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Normal")%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%=HostPath%><%=ModulePath.Replace("Controls/Lightbox/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=myappSettings.VGSkin%>&playonload=<%=PlayOnLoad%>&info=<%=myappSettings.InfoButton%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=myappSettings.AllowFullscren%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ModuleId.ToString()%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="FlashImageThumb" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			alt='<%#Eval("GetAlt")%>' ImageAlign="Middle"  />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=myappSettings.SocialSharingButtons%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																			<%#Eval("GetPinterestButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%=HostPath%><%=ModulePath.Replace("Controls/Lightbox/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=myappSettings.VGSkin%>&playonload=<%=PlayOnLoad%>&info=<%=myappSettings.InfoButton%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=myappSettings.AllowFullscren%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ModuleId.ToString()%>' rel="<%#RelLink2()%>" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="FlashTitle" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<asp:Label ID="lblTGDescription3" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashFlow" runat="server" Visible='<%# ToDisplayVideoFlow("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"),"Flow")%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%=HostPath%><%=ModulePath.Replace("Controls/Lightbox/","")%>videoFlow.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=myappSettings.VGSkin%>&playonload=<%=PlayOnLoad%>&info=<%=myappSettings.InfoButton%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=myappSettings.AllowFullscren%>&iframe=true<%# RepNamesFlow(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ModuleId.ToString()%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="Image4" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>' alt='<%#Eval("GetAlt")%>' ImageAlign="Middle"  />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=myappSettings.SocialSharingButtons%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																			<%#Eval("GetPinterestButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%=HostPath%><%=ModulePath.Replace("Controls/Lightbox/","")%>video.html?videourl=<%#RepVidNames(Eval("MediaType"),Eval("FileName"))%>&playerskin=<%=myappSettings.VGSkin%>&playonload=<%=PlayOnLoad%>&info=<%=myappSettings.InfoButton%>&description=<%#GetDescription2(DataBinder.Eval(Container.DataItem, "Description"))%>&fullscreen=<%=myappSettings.AllowFullscren%>&iframe=true<%# RepNames(Eval("MediaType"),Eval("ShortEmbedUrl"))%>'
																lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' rel="<%#RelLink2()%>" edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ModuleId.ToString()%>' title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label4" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<asp:Label ID="Label5" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plflash5" runat="server" Visible='<%#ToDisplayHtml5Video("Video",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<video controls="true" src='<%#Eval("Filename") %>' poster='<%#Eval("GetThumbPath") %>' width='<%=myappSettings.TGImageWidth%>' height='<%=myappSettings.TGImageHeight%>'>
																		Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>download the video here.</a>
																		</video>
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=myappSettings.SocialSharingButtons%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																			<%#Eval("GetPinterestButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%#Eval("Filename") %>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ModuleId.ToString()%>' rel="" edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ModuleId.ToString()%>' title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label6" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<asp:Label ID="Label7" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashMov5" runat="server" Visible='<%# ToDisplayVideoFlashMovHtml5("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<video controls="true" src='<%#Eval("Filename") %>' poster='<%#Eval("GetThumbPath") %>' width='<%=myappSettings.TGImageWidth%>' height='<%=myappSettings.TGImageHeight%>'>
																		Your browser doesn't support the video tag. You can <a href='<%#Eval("Filename") %>'>download the video here.</a>
																		</video>
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=myappSettings.SocialSharingButtons%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																			<%#Eval("GetPinterestButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a href='<%#Eval("Filename") %>' edgpid='<%#Eval("PictureID")%>' edgmid='<%=ModuleId.ToString()%>'
																rel="" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label1" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<asp:Label ID="Label3" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plFlashMov" runat="server" Visible='<%# ToDisplayVideoFlashMov("flashmov",DataBinder.Eval(Container.DataItem, "Info"),DataBinder.Eval(Container.DataItem, "FileExtension"))%>'>
															<div class="EDGmain">
																<div class="EDGvideo">
																	<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%#Eval("Filename") %>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ModuleId.ToString()%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="imgflasmovthumb" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>'
																			alt='<%#Eval("GetAlt")%>' ImageAlign="Middle"  />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=myappSettings.SocialSharingButtons%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																			<%#Eval("GetPinterestButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%#Eval("Filename") %>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ModuleId.ToString()%>' rel="<%#RelLink2()%>" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label2" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<asp:Label ID="lblTGDescription4" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plAudio" runat="server" Visible='<%# ToDisplay("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGaudio">
																	<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%=HostPath%><%=ModulePath.Replace("Controls/Lightbox/","")%>audio.html?audiourl=<%#HostPath%><%#Eval("Filename")%>&autoplay=<%=AudioPlayOnLoad%>&iframe=true&width=500&height=37&width=500&height=37'
																		lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ModuleId.ToString()%>' rel="<%#Eval("RelLink")%>" title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="imgTGAudio" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>' alt='<%#Eval("GetAlt")%>' ImageAlign="Middle"  />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=myappSettings.SocialSharingButtons%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																			<%#Eval("GetPinterestButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%=ModulePath.Replace("Controls/Lightbox/","")%>mp3player.swf?flashvars=autoLoad=true&autoPlay=<%=AudioPlayOnLoad%>&volume=1&song1url=<%=HostPath%><%#Eval("Filename")%>&width=560&height=33&salign=middle&swliveconnect=true&allowscriptaccess=always&wmode=transparent'
																lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ModuleId.ToString()%>' rel="<%#RelLink2()%>" title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="lblAudioTitle" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<asp:Label ID="lblTGDescription5" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<asp:PlaceHolder ID="plaHTNL5Audio" runat="server" Visible='<%# ShowHTML5Player("Audio",DataBinder.Eval(Container.DataItem, "MediaType"))%>'>
															<div class="EDGmain">
																<div class="EDGaudio">
																	<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%#Eval("Filename")%>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																		edgmid='<%=ModuleId.ToString()%>' title='<%#Eval("GetDescription3")%>'>
																		<asp:Image ID="Image5" runat="server" ImageUrl='<%#Eval("GetThumbPath")%>' alt='<%#Eval("GetAlt")%>' ImageAlign="Middle"  />
																		<span class="flagObject"></span><span class="flag"></span><span class="leftsh"></span>
																		<span class="rightsh"></span><span class="botsh"></span><span class="topsh"></span>
																		<span class="round1"></span><span class="round2"></span><span class="round3"></span>
																		<span class="round4"></span></a>
																	<div class="socialSharingContainer" style='<%=myappSettings.SocialSharingButtons%>'>
																		<div class="buttons">
																			<%#Eval("GetFacbookIframeLikeButton")%>
																			<%#Eval("GetGooglePlusButton")%>
																			<%#Eval("GetTwitterButton")%>
																			<%#Eval("GetPinterestButton")%>
																		</div>
																	</div>
																</div>
															</div>
															<a data-item-index='<%#Eval("MediaItemIndex")%>' href='<%#Eval("Filename")%>' lbnestedurl='<%#Eval("GetLighboxNestedURL")%>' edgpid='<%#Eval("PictureID")%>'
																edgmid='<%=ModuleId.ToString()%>' title='<%#Eval("GetDescription3")%>'>
																<div class="titleimage" style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<div class='<%#Eval("TitleClass")%>'>
																		<asp:Label ID="Label8" runat="server" Text='<%#Eval("ShowTitle")%>' Visible='<%#Eval("TitleToDisplay")%>'></asp:Label>
																	</div>
																</div>
																<div style='max-width: <%=myappSettings.TGImageWidth%>px;'>
																	<asp:Label ID="Label9" CssClass="DescriptionImage" runat="server" Text='<%#Eval("ShowDescription")%>'
																		Visible='<%#Eval("DescriptionToDisplay")%>'></asp:Label></div>
															</a></asp:PlaceHolder>
														<%--</div>--%>
													</ItemTemplate>
													<FooterStyle HorizontalAlign="Center" />
													<HeaderStyle HorizontalAlign="Center" />
													<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True" />
													<SelectedItemStyle HorizontalAlign="Center" />
													<SeparatorStyle HorizontalAlign="Center" />
												</asp:DataList>
												<%=SetupSSValues()%>
												<asp:GridView ID="gvTGPagination" runat="server" AllowPaging="True" DataKeyNames="PictureID"
													OnPageIndexChanged="GridView1_PageIndexChanged" OnPreRender="gvTGPagination_PreRender"
													Width="28px" HorizontalAlign="Center" ShowFooter="True" AutoGenerateColumns="False"
													PageSize="1" ShowHeader="False" BorderWidth="0" BorderStyle="None" Border="0"
													GridLines="None" CssClass="pagerbox" OnPageIndexChanging="gvTGPagination_PageIndexChanging">
													<Columns>
														<asp:BoundField DataField="FileName" Visible="False" />
													</Columns>
													<PagerStyle HorizontalAlign="Center" CssClass="EDGpager" BorderWidth="0px" BorderStyle="None" />
												</asp:GridView>
												<table cellpadding="0" cellspacing="0" border="0" align="center">
													<tr>
														<td>
															<asp:LinkButton ID="btnPrev" runat="server" OnClick="btnPrev_Click" CssClass="buttonPrev"
																Style="margin-top: 15px;" />
															<asp:LinkButton ID="btnNext" runat="server" OnClick="btnNext_Click" CssClass="buttonNext"
																Style="margin-top: 15px;" />
														</td>
													</tr>
												</table>
												<a id="hlUploadQuerstr" runat="server" visible="false">
													<asp:Image ID="Image1" runat="server" ImageUrl="~/DesktopModules/EasyDNNgallery/images/image_add.png" />
													<%=strUserUpload%>
												</a><a id="hlApproveMedia" runat="server" visible="false">
													<asp:Image ID="Image2" runat="server" ImageUrl="~/DesktopModules/EasyDNNgallery/images/note_accept.png" />
													<%=strApprove%>
												</a>
											</asp:Panel>
											<asp:UpdateProgress ID="upLighbox" runat="server" AssociatedUpdatePanelID="upTableGallery">
												<ProgressTemplate>
													<div class='<%=PreloaderBackground%>'>
													</div>
													<table cellpadding="0" cellspacing="0" align="center" style="margin-top: 10px;">
														<tr>
															<td>
																<div class='<%=PreloaderClass%>'>
																	<img id='preloader' src='<%=ModulePath.Replace("Controls/Lightbox/","")%>images/<%=PreloaderImage%>' />
																</div>
															</td>
														</tr>
													</table>
												</ProgressTemplate>
											</asp:UpdateProgress>
											<asp:Panel ID="pnlNestedGalleryBackBottom" runat="server">
												<asp:Panel ID="pnlNestedGalleryBack" runat="server" Visible="False">
													<div style="float: left;">
														<asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click" CssClass="btnGalleryBack">
													   
														</asp:LinkButton>
													</div>
												</asp:Panel>
											</asp:Panel>
											<asp:Panel ID="pnlFullscreenlink" runat="server">

												<script type="text/javascript">
												<%=jQuery%>(document).ready(function($) 
												{
													$('#<%=upTableGallery.ClientID%>').delegate('a#lnkFS<%=ModuleNBR%>', 'click', function() {
														$().fullscreenPortfolioGallery({
															ppgroup: '<%=ModuleNBR%>',
															pptheme: '<%=LightboxType %>',
															ppanimationSpeed: '<%=AnimSpeed%>',
															ppoverlay_gallery: <%=showLightboxThumbnails.ToString().ToLower()%>,
															ppslideshow: <%=LightBoxSlideShow%>,
															ppautoplay_slideshow: <%=myappSettings.LightBoxSSAP%>,
															showCategories: <%=myappSettings.DisplayNestedGalleries.ToLower()%>,
															ppLightboxTitle: '<%=showLightboxTitle.ToString().ToLower()%>',
															ppLightboxDescription: '<%=showLightboxDescription.ToString().ToLower()%>',
															ppMediaTitle: '<%=showMediaTitle.ToString().ToLower()%>',
															ppMediaDescription: '<%=showMediaDescription.ToString().ToLower()%>',
															pfqtip: '<%=showLightboxDescription.ToString().ToLower()%>',
															pfShowQtip: '<%=ShowToolTips.ToString().ToLower()%>',
															pfdiv: '<%=ModuleNBR%>EasyDNNGallery',
															pfShowEffect: '<%=myappSettings.ShowEffect%>',
															pfHideEffect: '<%=myappSettings.HideEffect%>',
															pfShowDuration: '<%=myappSettings.ShowEffectDuration%>',
															pfHideDuration: '<%=myappSettings.HideEffectDuration%>',
															pfTargetPos: '<%=myappSettings.TargetPosition%>',
															pfTooltipPos: '<%=myappSettings.TooltipPosition%>',
															pfTheme: '<%=myappSettings.TooltipTheme%>',
															pfcorner: <%=myappSettings.TooltipBorder%>,
															pfradius: <%=myappSettings.TooltipRadius%>,
															pfOpenMediaUrl: '<%=myappSettings.OpenMediaUrl%>',
															pfOpenMediaTarget: '<%=myappSettings.NewWindow%>',
															itemMargin: 11,
															allText: '<%=strAll%>',
															easing: 'easeOutExpo',
															animationSpeed: 1500,
															itemsPerPage: 0,
															wavyAnimation: false,
															myshowCategories: <%=myappSettings.LightboxFullscreenShowNavigation%>,
															navButtonWidth: 21,
															categorySelector: '<%=myappSettings.PortfolioMenuType%>',
															showNavigationArrows: <%=myappSettings.PortfolioShowArrows%>,
															hidableNavigationArrows: <%=myappSettings.PortfolioAutoHideArrows%>,
															customTitle: '<%=myappSettings.PortfolioDisplayTitle%>',
															navigationId: 'EDG_portfolio_pagination<%=ModuleNBR%>',
															categoriesId: 'EDG_portfolio_categories<%=ModuleNBR%>',
															navArrowsFile: '<%=PortfolioArrowFile%>',
															navDDMFile: '<%=ProtfolioDDMFile%>',
															ppprint_image_text: '<%=PrintImageText%>',
															ppitem_emailing_text: '<%=EmailText%>',
															ppitem_emailing_subject: '<%=EmailTextSubject%>',
															ppallow_image_printing:<%=myappSettings.LightboxShowPrint%>,
															ppenable_item_emailing:<%=myappSettings.LightboxShowEmail%>,
															ppshow_social_sharing:<%=myappSettings.LightboxSocialSharing%>,
															ppdownload_handler_url:'<%=ShowDownloadLinkLightbox %>',
															xmlRequestParams: {
																GalleryType: 'tablegallery',
																ModuleID: '<%=ModuleId.ToString()%>',
																ModulePath: '<%=ModulePath.Replace("Controls/Lightbox/", "")%>',
																PortalHome: '<%=PortalSettings.HomeDirectory%>',
																PortalID: '<%=PortalId.ToString() %>',
																LocaleCode: '<%=localecode.ToString().ToLower()%>',
																SettingCheck: '4535793'
															},
															maxImgWidth: <%=myappSettings.TGImageWidth%>,
															maxImgHeight: <%=myappSettings.TGImageHeight%>,
															smartResize: <%=myappSettings.TGSmartResize%>,
															fullscreenCssId: '<%=LightboxFullscreenTheme%>',
															fullscreenable: true,
															xmlSource: '<%=ModulePath.Replace("Controls/Lightbox/","")%>PortfolioHandler.ashx?tabid=<%=TabId%>'
														});
														return false;
													});
												});
												</script>

												<div style="padding: 3px 3px 0; overflow: hidden; display: inline; float: left; margin-left: 20px;">
													<a id='lnkFS<%=ModuleNBR%>' class="EasyDNNGallery_fullscreen_btn" href="#">
														<span class="icon"></span><span class="text">
															<%=ShowFullscreen%></span></a>
												</div>
											</asp:Panel>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="EDGclear">
						&nbsp;
					</div>
				</div>
			</div>
		</contenttemplate>
	</asp:updatepanel>
</div>
<asp:objectdatasource id="odsIntegrate" typename="EasyDNN.Modules.EasyDNNGallery.DataAcess" runat="server" selectmethod="GetIntegration" enableviewstate="False">
	<selectparameters>
		<asp:Parameter Name="PortalID" Type="Int32" />
		<asp:Parameter Name="ModuleID" Type="Int32" />
		<asp:Parameter Name="ArticleID" Type="Int32" />
	</selectparameters>
</asp:objectdatasource>
