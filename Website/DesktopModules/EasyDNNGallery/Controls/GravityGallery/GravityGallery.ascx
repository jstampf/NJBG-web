﻿<%@ control language="C#" autoeventwireup="true" inherits="EasyDNN.Modules.EasyDNNGallery.Controls_GravityGallery, App_Web_gravitygallery.ascx.8fefd58b" %>
<div id="main_eds_Gallery_Wrapper<%=ModuleId%>" class="eds_GravityGallery_<%=gravitySettings.ThemeName%> <%=(string.IsNullOrEmpty(gravitySettings.ThemeCssStlyeClass)?"": "edsgg_style_"+gravitySettings.ThemeCssStlyeClass)%>">
	<asp:Literal ID="ltGravityDisplay" runat="server" EnableViewState="False"></asp:Literal>
</div>
