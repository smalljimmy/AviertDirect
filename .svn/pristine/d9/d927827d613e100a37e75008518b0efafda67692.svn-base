<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestPassword.aspx.cs" Inherits="AviertDirect.RequestPassword" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="de"> <!--<![endif]-->

<head>

<meta charset="utf-8">
<title>AVIERTdirect placement — Heilungskosten-Versicherung für temporär in der Schweiz arbeitende Personen aus dem Ausland</title>
<meta name="robots" content="index, follow">
<link rel="stylesheet" type="text/css" href="/styles/default.css">
<link rel="stylesheet" type="text/css" href="/styles/table.css">
<link rel="stylesheet" type="text/css" href="/opensans/opensans.css">
<link rel="stylesheet" type="text/css" href="/opensans-condensed/opensans-condensed.css">
<link rel="stylesheet" type="text/css" href="/styles/tooltip.css">
<link href="/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/styles/themes/base/minified/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="/styles/datepicker.css">

<script src="/scripts/jquery-1.7.1.js"></script>
<script src="/scripts/jquery.easing.1.3.js"></script>
<script src="/scripts/jquery.tools.min.js"></script>
<script src="/fancybox/jquery.fancybox-1.3.4.min.js"></script>
<script src="/scripts/in_page.js"></script>
<script src="/scripts/modernizr.js"></script>
<script src="/scripts/ui/minified/jquery.ui.core.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.datepicker.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.widget.min.js"></script>
<script src="/scripts/facebook.js"></script>

</head>

<body id="index">
<div id="wrapper">
      
   <div id="mainheader"><h1>AVIERT<span>direct placement</span></h1></div><!-- End mainheader -->
   
   <div id="container">
   
   <section id="default">
      <form runat="server">
      <h1>Passwort oder Benutzername vergessen ?</h1>
      <p>
        Kein Problem, Sie können Ihr Passwort ganz einfach zurücksetzen. Geben Sie dazu Ihre registrierte EMail-Adresse sowie den
        Validierungs-Code ein. Ein neues Password wird Ihnen zusammen mit dem Benutzernamen per EMail zugestellt.
      </p>
      <br />
        <table class="registering">
            <tr>
                <th scope="row">EMail-Adresse:</th>
                <td>
                    <asp:TextBox ID="txtEMail" runat="server" CssClass="textfield" />
                    <asp:RequiredFieldValidator ID="emailValidator" Display="Dynamic" runat="server" ControlToValidate="txtEMail" CssClass="error" ErrorMessage="Bitte geben Sie Ihre EMail-Adresse ein" />
                    <asp:RegularExpressionValidator Display="Dynamic" ID="emailFormatValidator" runat="server"  CssClass="error" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEMail" ErrorMessage="Das Format der EMail-Adresse ist ungültig" />
                </td>
            </tr>
            <tr>
                <th scope="row" style="vertical-align: top">Validierung:</th>
                <td>
                <cc1:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
 CaptchaHeight="60" CaptchaWidth="200" CaptchaLineNoise="None" CaptchaMinTimeout="5"
 CaptchaMaxTimeout="240" FontColor="#529E00" BackColor="#F1F0EF" />
                    Bitte geben Sie die dargestellte Zeichenfolge ein.
                    <asp:TextBox runat="server" ID="txtCaptcha" /><br />
                    <asp:RequiredFieldValidator ID="captchaValidator" Display="Dynamic" runat="server" ControlToValidate="txtCaptcha" CssClass="error" ErrorMessage="Bitte geben Sie die dargestellte Zeichenfolge exakt ein" />
                </td>
            </tr>
         </table>
          <div id="functionpanel">
            <asp:LinkButton oncommand="getPassword" CommandName="getPassword" ID="btnGetPassword" runat="server"><div id="functionbutton">weiter</div></asp:LinkButton>
         </div>
      </form>
   </section>

      
      
   
   </div><!-- End container -->
   
<!-- seinclude mainfooter.txt -->
   <footer id="mainfooter">
   
      <div id="mainfooter-left">
         <p><a href="http://aviert.com/" target="blank">Verein AVIERT.com</a><br>
         <a href="http://aviertcallmed.com/" target="blank">AviertCallmed für Temporärvermittler</a><br>
         <a href="http://binais.com/" target="blank">Binaïs the business model company</a><br>
         <a href="http://paracelsus-heute.com/" target="blank">Stiftung Paracelsus Heute</a><br>
         <a href="http://twi-consulting.ch/" target="blank">twi-consulting</a></p>
      </div><!-- End mainfooter-left -->
      
      <div id="mainfooter-middle">
         <h1>AVIERT<span>direct placement</span></h1>
         <p>Alte Spinnerei . 8877 Murg am Walensee</p>
      </div><!-- End mainfooter-direct -->
      
      <div id="mainfooter-right">
         <p><a href="downloads/507_d_callmed.pdf" target="blank">Produktblatt CALLMED</a><br>
         <a href="downloads/03900_d_demand.pdf" target="blank">24h Notfall 058 277 77 77</a><br>
         <a href="downloads/802_d_avb_arcosana_callmed.pdf" target="blank">Reglement Ausgabe 01.2012</a><br>
         <a href="agb.html" class="iframe">AVIERTdirect placement AGB</a></p>
      </div><!-- End mainfooter-right -->
      
   </footer><!-- mainfooter -->
<!-- End include -->
   
</div><!-- End wrapper -->
</body>
</html>
