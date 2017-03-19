<%@ control language="C#" autoeventwireup="true" inherits="EasyDNNSolutions.Modules.EasyDNNRotator.View.CarouselRotator, App_Web_carouselrotator.ascx.b7830b06" enableviewstate="false" %>
<asp:PlaceHolder ID="includeJavaScriptChameleon" runat="server" />
<div id="edr_multicarousel<%=ModuleId%>" class="<%=ThemeName%>" style="<%=FullWidthHeight%> margin: auto;">
	<div class="wrapper" style="<%=wrapperStyle%>">
		<div class="slider" style="<%=sliderStyle%>">
			<asp:Literal ID="generatedHtm" runat="server" />
		</div>
	</div>
</div>
