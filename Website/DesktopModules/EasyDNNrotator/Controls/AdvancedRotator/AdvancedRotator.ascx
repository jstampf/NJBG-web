<%@ control language="C#" autoeventwireup="true" inherits="EasyDNNSolutions.Modules.EasyDNNRotator.View.AdvancedRotator, App_Web_advancedrotator.ascx.f03b91de" enableviewstate="false" %>
<asp:PlaceHolder ID="includeJavaScriptAdvanced" runat="server" />
<asp:Panel ID="pnlRotator" runat="server">
	<div style="overflow: hidden; margin: auto; <%=FullWidthHeight%>">
		<div class="slider_shadows_wrapper <%=rm.ShadowCss%> <%=rm.ShadowStyle%>">
			<div id="container<%=ModuleId%>" <%=ChameleonMCInlineStyle%>>
				<div class="<%=ThemeName%>">
					<div class="screen">
						<noscript>
							<img src="<%=ModulePath.Replace("/Controls/AdvancedRotator","")%>Themes/AdvancedRotator/Main_rotator/assets/loader.gif" alt="" />
						</noscript>
					</div>
					<div class="thumbnails">
						<ul>
							<asp:Repeater ID="repRotator" runat="server" EnableViewState="false">
								<ItemTemplate>
									<li>
										<div class="thumb">
											<img src="<%=PathToImage%>thumb/thumb_<%#Eval("FileSystemName") %>" alt="" width="<%=rm.ThumbW%>" height="<%=rm.ThumbH%>" />
											<p>
												<span class="title">
													<%#stringCut(Eval("Title"), settings.TitleLenght.ToString())%></span><br />
												<%#stringCut(Eval("SubTitle"), settings.SubTitleLenght.ToString())%>
											</p>
										</div>
										<a href="<%=PathToImage%><%#Eval("FileSystemName")%>"></a><a href="<%#Eval("Link")%>" target="_self"></a>
										<div class="AdvancedTextBox" style="top: <%=settings.TBPosTop.ToString()%>px; left: <%=settings.TBPosLeft.ToString()%>px; width: <%=settings.TextBoxW.ToString()%>px; height: <%=settings.TextBoxH.ToString()%>px; display: none;">
											<a href="<%#Eval("Link")%>" target="_self">
												<h1>
													<%#stringCut(Eval("Title"), settings.TBTitleLenght.ToString())%></h1>
											</a>
											<div class="advancedtbx">
												<%#stringCut(Eval("Description"), settings.DescriptionLenght.ToString())%>
											</div>
										</div>
									</li>
								</ItemTemplate>
							</asp:Repeater>
						</ul>
					</div>
				</div>
			</div>
			<asp:Literal ID="noscriptinclude" runat="server" Visible="false" />
			<div class="top_left shadow">
			</div>
			<div class="top_right shadow">
			</div>
			<div class="left_top shadow">
			</div>
			<div class="left_bottom shadow">
			</div>
			<div class="right_top shadow">
			</div>
			<div class="right_bottom shadow">
			</div>
			<div class="bottom_left shadow">
			</div>
			<div class="bottom_right shadow">
			</div>
			<div class="corner_top_left shadow">
			</div>
			<div class="corner_top_right shadow">
			</div>
			<div class="corner_bottom_left shadow">
			</div>
			<div class="corner_bottom_right shadow">
			</div>
		</div>
	</div>
</asp:Panel>
