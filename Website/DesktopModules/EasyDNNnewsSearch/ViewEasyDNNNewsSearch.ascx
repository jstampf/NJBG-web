﻿<%@ control language="C#" inherits="EasyDNNSolutions.Modules.EasyDNNNews.Search.ViewEasyDNNNewsSearch, App_Web_vieweasydnnnewssearch.ascx.75700bee" autoeventwireup="true" %>
<asp:PlaceHolder ID="phincludeAutoComplete" runat="server" />
<asp:Literal ID="litSettingsInfo" runat="server" Visible="false" />
<div class="<%=MainDivClass%>">
	<asp:PlaceHolder ID="phincludeParentDDLJavaScript" runat="server" />
	<asp:Literal ID="litIncludeDatePickerJavaScript" runat="server" />
	<asp:UpdatePanel ID="upSearch" runat="server" UpdateMode="Conditional" OnUnload="UpdatePanel_Unload">
		<ContentTemplate>
			<asp:Panel ID="pnlAdvancedSearch" runat="server">
				<asp:PlaceHolder ID="phCustomFields" Visible="false" runat="server">
					<asp:HiddenField runat="server" ID="hfParenSelectedValue" />
					<asp:HiddenField runat="server" ID="hfLastSelectedIndexChanged" />
					<asp:HiddenField runat="server" ID="hfCFLastTriggerdByList" />
				</asp:PlaceHolder>
			</asp:Panel>
			<asp:Panel ID="pnlSimpleSearch" runat="server" DefaultButton="btnSearch" Visible="false">
				<div class="input" runat="server" id="pnlSearchBoxValue">
					<asp:TextBox ID="tbSearchText" runat="server" AutoCompleteType="Search" />
					<asp:RequiredFieldValidator ID="rfvtbSearchText" runat="server" ControlToValidate="tbSearchText" />
				</div>
				<asp:LinkButton ID="btnSearch" runat="server" CssClass="do_search" OnClick="btnSearch_Click"><span><%=_("Search")%></span></asp:LinkButton>
			</asp:Panel>
		</ContentTemplate>
	</asp:UpdatePanel>
	<asp:Label ID="lblMessage" runat="server" resourcekey="lblMessage" Visible="False" Text="Please edit and save settings." EnableViewState="false" />
</div>
