<%@ control language="C#" autoeventwireup="true" inherits="EasyDNNSolutions.Modules.EasyDNNRotator.View.FlashCubeRotator, App_Web_flashcuberotator.ascx.89713b1e" enableviewstate="false" %>
<script type="text/javascript">
	jQuery(document).ready(
		function () {
			var flashvars = {};
			flashvars.cssSource = "<%=rotatorCss%>";
			flashvars.xmlSource = "<%=rotatorXml%>";
			var params = {};
			params.play = "true";
			params.menu = "false";
			params.scale = "showall";
			params.wmode = "transparent";
			params.allowfullscreen = "true";
			params.allowscriptaccess = "always";
			params.allownetworking = "all";
			swfobject.embedSWF('<%=flashRotator%>', 'pnlRotator<%=ModuleId%>', '<%=RotatorW%>', '<%=RotatorH%>', '10', null, flashvars, params, null);
		});
</script>
<div style="width: <%=RotatorW%>px; height: <%=RotatorH%>px; margin: auto;">
	<div id="pnlRotator<%=ModuleId%>">
		<p>
			Flash cube failed to load.</p>
	</div>
	<asp:Literal ID="noscriptinclude" runat="server" Visible="false" />
</div>
