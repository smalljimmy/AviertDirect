<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="AviertDirect.register" %>

<%@ Register Assembly="AviertDirect" Namespace="AviertDirect.Controls" TagPrefix="Aviert" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="de"> <!--<![endif]-->

<head>
<meta charset="utf-8">
<meta name="robots" content="index, follow" />
<link rel="stylesheet" type="text/css" href="/styles/default.css" />
<link rel="stylesheet" type="text/css" href="/styles/table.css" />
<link rel="stylesheet" type="text/css" href="opensans/opensans.css" />
<link rel="stylesheet" type="text/css" href="opensans-condensed/opensans-condensed.css" />

<link href="fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" />
<link rel="stylesheet" href="/styles/themes/base/jquery.ui.all.css" />
<link rel="stylesheet" href="/styles/anmelden.dialog.css" />
<link rel="stylesheet" type="text/css" href="/styles/datepicker.css" />

<script src="/scripts/jquery-1.7.1.js" type="text/javascript"></script>
<script src="/scripts/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="/scripts/jquery.tools.min.js" type="text/javascript"></script>
<script src="fancybox/jquery.fancybox-1.3.4.min.js" type="text/javascript"></script>
<script src="/scripts/in_page.js" type="text/javascript"></script>
<script src="/scripts/modernizr.js" type="text/javascript"></script>
<script src="/scripts/facebook.js" type="text/javascript"></script>

<script src="/scripts/ui/minified/jquery.ui.core.min.js" type="text/javascript"></script>
<script src="/scripts/ui/minified/jquery.ui.widget.min.js" type="text/javascript"></script>
<script src="/scripts/ui/minified/jquery.ui.mouse.min.js" type="text/javascript"></script>
<script src="/scripts/ui/minified/jquery.ui.draggable.min.js" type="text/javascript"></script>
<script src="/scripts/ui/minified/jquery.ui.position.min.js" type="text/javascript"></script>
<script src="/scripts/ui/minified/jquery.ui.resizable.min.js" type="text/javascript"></script>
<script src="/scripts/ui/minified/jquery.ui.button.min.js" type="text/javascript"></script>
<script src="/scripts/ui/minified/jquery.ui.dialog.min.js" type="text/javascript"></script>
<script src="/scripts/ui/minified/jquery.ui.datepicker.min.js" type="text/javascript"></script>

</head>
<body id="register">
<div id="wrapper">
    <div id="dialog" title="So können Sie bezahlen">
            <p class="description">
              Die Bezahlung von AviertDirect erfolgt über Visa Debit, PayPal, Postfinance oder über einen Dauferauftrag Ihrer Bank.<br>
              Sie benötigen eines dieser Zahlungssysteme.
            </p>
            <br>
              <img src="/images/creditcards/visa-debit.png" alt="visa-debit.png" 
                  title="visa-debit.png" />
              <img src="/images/creditcards/paypal.png" alt="paypal.png" title="paypal.png" />
              <img src="images/creditcards/postfinance.png" alt="postfinance.png" title="postfinance.png">
              <img src="/images/creditcards/standing_order.png" alt="standing_order.png" title="standing_order.png" />
       </div>
   
   <div id="mainheader"><h1>AVIERT<span>direct placement</span></h1></div>
   <nav id="mainnavigation">
      <ul>
      <li id="mainnavigation-index"><a href="index.html">Home</a></li>
      <li id="mainnavigation-register"><a href="register.aspx">Anmelden</a></li>
      <li id="mainnavigation-plan"><a href="plan.html">Plan</a></li>
      <li id="mainnavigation-impressum"><a href="http://aviert.com/impressum.html" class="iframe">Impressum</a></li>
      <li id="mainnavigation-agb"><a href="agb.html" class="iframe">AGB</a></li>
      </ul>  
   </nav>

   <div id="container">

    <div id="hello">
         <p><a href="login.aspx">Login</a></p>
   </div><!-- End hello -->

   <section id="default">
   
      <h1>Mit wenigen Schritten<br> gut und günstig versichert!</h1>
      <p>
        Im <a href="plan.html">PLAN</a> finden Sie alles, was Sie über die Versicherung wissen müssen. Nehmen Sie sich Zeit und lesen Sie den Plan gründlich. Wir können diese guten Konditionen nur gewährleisten, weil wir keine persönliche oder telefonische Beratung wahrnehmen.
      </p>
      
      <div id="information">
         Alle Felder bitte ausfüllen; Ausnahmen sind angezeigt.
      </div><!-- End information -->
   
      <form id="register" runat="server">
      <table class="registering">
        <tr>
            <th scope="row"><asp:Label runat="server" AssociatedControlID="rbnGender">Anrede</asp:Label></th>
            <td>
              <asp:RadioButtonList ID="rbnGender" runat="server" RepeatDirection="Horizontal" Width="200px" >
                <asp:ListItem Value="male" Text="Herr" />
                <asp:ListItem Value="female" Text="Frau" />
              </asp:RadioButtonList>
              <asp:RequiredFieldValidator Display="Dynamic" 
                                          ID="genderValidator" 
                                          runat="server" 
                                          ControlToValidate="rbnGender" 
                                          CssClass="error" 
                                          ErrorMessage="Wählen Sie eine Anrede" />
            </td>
        </tr>
        <tr>   
            <th scope="row"><asp:Label runat="server" AssociatedControlID="txtGivenName">Vorname</asp:Label></th>
            <td>
              <asp:TextBox ID="txtGivenName" runat="server" CssClass="textfield" />
              <asp:RequiredFieldValidator Display="Dynamic" 
                                          ID="givenNameValidator" 
                                          runat="server" 
                                          ControlToValidate="txtGivenName" 
                                          CssClass="error" 
                                          ErrorMessage="Geben Sie Ihren Vornamen ein" />
            </td>
        </tr>       
        <tr>
            <th scope="row"><asp:Label runat="server" AssociatedControlID="txtLastName">Nachname</asp:Label></th>
            <td>
              <asp:TextBox ID="txtLastName" runat="server" CssClass="textfield" />
              <asp:RequiredFieldValidator Display="Dynamic" 
                                          ID="lastNameValidator" 
                                          runat="server" 
                                          ControlToValidate="txtLastName" 
                                          CssClass="error"
                                          ErrorMessage="Geben Sie Ihren Nachnamen ein" />
            </td>
        </tr>
      </table>
            
      <div id="information">
         Wählen Sie einen Benutzernamen und ein Passwort. Sie brauchen diese Daten, um sich anzumelden und Änderungen einzutragen.
      </div>
      <table class="logindata">
        <tr>   
            <th scope="row"><asp:Label runat="server" AssociatedControlID="txtUsername">Benutzername</asp:Label></th>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="textfield" onchange="javascript:checkUsername();"/>
                <asp:Label runat="server" ID="lblUserError"/>
                <asp:RequiredFieldValidator Display="Dynamic" 
                                            ID="usernameValidator"
                                            runat="server"
                                            ControlToValidate="txtUsername"
                                            CssClass="error"
                                            ErrorMessage="Wählen Sie einen Benutzernamen" />
            </td>
        </tr> 
        <tr>   
            <th scope="row"><asp:Label runat="server" AssociatedControlID="txtPassword1">Password</asp:Label></th>
            <td>
                <asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" CssClass="textfield" />
                <asp:RequiredFieldValidator ID="pwValidator1" 
                                            runat="server" 
                                            ControlToValidate="txtPassword1" 
                                            CssClass="error" 
                                            Display="Dynamic"
                                            ErrorMessage="Wählen Sie ein Passwort" />
            </td>
        </tr>
         <tr>   
            <th scope="row"><asp:Label runat="server" AssociatedControlID="txtPassword2">Passwort wiederholen</asp:Label></th>
            <td>
                <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" CssClass="textfield" />
                <asp:RequiredFieldValidator ID="pwValidator2" 
                                            Display="Dynamic" 
                                            runat="server" 
                                            ControlToValidate="txtPassword2"
                                            CssClass="error"
                                            ErrorMessage="Wiederholen Sie das Passwort" />
                <asp:CompareValidator ID="comparePasswords" 
                                      runat="server"
                                      ControlToCompare="txtPassword1"
                                      ControlToValidate="txtPassword2"
                                      CssClass="error"
                                      Display="Dynamic"
                                      ErrorMessage="Dass Passwort wurde nicht korrekt wiederholt" />
            </td>
        </tr>      
      </table>
            
      <table class="registering">   
        <tr>
            <th scope="row"  class="emptyhead"></th>
            <td class="empty">Wer kann sich über AVIERTdirect versichern lassen? Alle Bürger aus den nachstehenden Ländern mit den Bewilligungen B, G, L oder Aufenthalt bis 120 Tage.</td>
        </tr>   
        <tr>
          <th scope="row"><asp:Label runat="server" AssociatedControlID="ddlNationality">Nationalität</asp:Label></th>
          <td>
            <div>
            <asp:DropDownList ID="ddlNationality" runat="server" Width="200px">
                <asp:ListItem Value="select" Selected="True" Text="Wählen Sie Ihr Land" />
                <asp:ListItem Value="BE" Text="Belgien" />
                <asp:ListItem Value="BG" Text="Bulgarien" />
                <asp:ListItem Value="DE" Text="Deutschland" />
                <asp:ListItem Value="DK" Text="Dänemark" />
                <asp:ListItem Value="EE" Text="Estland" />
                <asp:ListItem Value="GR" Text="Griechenland" />
                <asp:ListItem Value="es" Text="Spanien" />
                <asp:ListItem Value="FI" Text="Finnland" />
                <asp:ListItem Value="FR" Text="Frankreich" />
                <asp:ListItem Value="IE" Text="Irland" />
                <asp:ListItem Value="is" Text="Island" />
                <asp:ListItem Value="IT" Text="Italien" />
                <asp:ListItem Value="HR" Text="Kroation" />
                <asp:ListItem Value="LV" Text="Lettland" />
                <asp:ListItem Value="LT" Text="Litauen" />
                <asp:ListItem Value="LU" Text="Luxemburg" />
                <asp:ListItem Value="MA" Text="Malta" />
                <asp:ListItem Value="NL" Text="Niederland" />
                <asp:ListItem Value="NO" Text="Norwegen" />
                <asp:ListItem Value="AT" Text="Österreich" />
                <asp:ListItem Value="PL" Text="Polen" />
                <asp:ListItem Value="PT" Text="Portugal" />
                <asp:ListItem Value="RO" Text="Rumänien" />
                <asp:ListItem Value="SE" Text="Schweden" />
                <asp:ListItem Value="SK" Text="Slowakei" />
                <asp:ListItem Value="SI" Text="Slowenien" />
                <asp:ListItem Value="ES" Text="Spanien" />
                <asp:ListItem Value="CZ" Text="Tschechische Republik" />
                <asp:ListItem Value="HU" Text="Ungarn" />
                <asp:ListItem Value="UK" Text="United Kingdom" />
                <asp:ListItem Value="CY" Text="Zypern" />
            </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator Display="Dynamic" 
                                        ID="nationalityValidator" 
                                        runat="server" 
                                        ControlToValidate="ddlNationality" 
                                        InitialValue="select" 
                                        CssClass="error"
                                        ErrorMessage="Wählen Sie Ihre Nationalität" />
          </td>
         </tr>
         <tr>
          <th scope="row"><asp:Label runat="server" AssociatedControlID="ddlLanguage">Sprache</asp:Label></th>
          <td>
            <div>
            <asp:DropDownList ID="ddlLanguage" runat="server" Width="200px">
                <asp:ListItem Value="select" Selected="True" Text="Wählen Sie Ihre Sprache" />
                <asp:ListItem Value="de" Text="Deutsch" />
                <asp:ListItem Value="en" Text="English" />
                <asp:ListItem Value="fr" Text="Français" />
                <asp:ListItem Value="it" Text="Italiano" />
            </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator Display="Dynamic" 
                                        ID="languageValidator"
                                        runat="server"
                                        ControlToValidate="ddlLanguage"
                                        InitialValue="select"
                                        CssClass="error" 
                                        ErrorMessage="Wählen Sie Ihre Sprache" />
          </td>
         </tr>
         <tr>
          <th scope="row"><asp:Label runat="server" AssociatedControlID="txtBirthday">Geburtsdatum</asp:Label></th>
          <td>
            <asp:TextBox runat="server" ID="txtBirthday" CssClass="textfield" />
            <asp:RequiredFieldValidator Display="Dynamic" 
                                        ID="birthdayValidator" 
                                        runat="server" 
                                        ControlToValidate="txtBirthday" 
                                        CssClass="error" 
                                        ErrorMessage="Geben Sie Ihr Geburtsdatum an" />
          </td>
         </tr>
         <tr>   
           <th scope="row"><asp:Label runat="server" AssociatedControlID="txtPhone">Telefon</asp:Label></th>
           <td>
             <asp:TextBox ID="txtPhone" runat="server" CssClass="textfield" />
           </td>
         </tr>
         <tr>   
           <th scope="row"><asp:Label runat="server" AssociatedControlID="txtEMail">EMail</asp:Label></th>
           <td>
              <asp:TextBox ID="txtEMail" runat="server" CssClass="textfield" />
              <asp:RequiredFieldValidator Display="Dynamic" 
                                          ID="emailValidator" 
                                          runat="server" 
                                          ControlToValidate="txtEmail" 
                                          CssClass="error"
                                          ErrorMessage="Geben Sie Ihre EMail-Adresse an" />
              <asp:RegularExpressionValidator Display="Dynamic"
                                              ID="emailFormatValidator"
                                              runat="server" 
                                              CssClass="error"
                                              ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                              ControlToValidate="txtEMail"
                                              ErrorMessage="Diese EMail-Adresse ist ungültig" />
           </td>
         </tr>
         <tr>
           <th scope="row"><asp:Label runat="server" AssociatedControlID="ddlPermit">Bewilligung</asp:Label></th>
           <td>
             <div>
             <asp:DropDownList runat="server" ID="ddlPermit" Width="200px">
                <asp:ListItem Value="select" Selected="True" Text="Wählen Sie Ihre Bewilligung" />
                <asp:ListItem Value="b" Text="B Jahresaufenthalt" />
                <asp:ListItem Value="g" Text="G Grenzgänger" />
                <asp:ListItem Value="l" Text="L Kurzaufenthalt" />
                <asp:ListItem Value="l" Text="Aufenthalt bis 120 Tage" />
             </asp:DropDownList>
             </div>
             <asp:RequiredFieldValidator Display="Dynamic" 
                                         ID="permitValidator" 
                                         runat="server" 
                                         ControlToValidate="ddlPermit" 
                                         InitialValue="select" 
                                         CssClass="error"
                                         ErrorMessage="Wählen Sie Ihre Bewilligung" />
           </td>
         </tr>
      </table>
      
      <div id="information">Wenn Sie in Untermiete oder im Hotel wohnen und keine eigene Wohnung mieten, dann im Feld “Wohnhaft bei” die c/o Adresse eintragen. Sonst leer lassen.</div>
      
      <table class="registering">
         <tr>   
           <th scope="row"><asp:Label runat="server" AssociatedControlID="txtCo">Wohnhaft bei</asp:Label></th>
           <td>
                <asp:TextBox ID="txtCo" runat="server" CssClass="textfield" />
            </td>
         </tr>
         <tr>   
           <th scope="row"><asp:Label runat="server" AssociatedControlID="txtStreet">Strasse</asp:Label></th>
           <td>
             <asp:TextBox ID="txtStreet" runat="server"  CssClass="textfield" />
             <asp:RequiredFieldValidator Display="Dynamic" 
                                         ID="streetValidator" 
                                         runat="server" 
                                         ControlToValidate="txtStreet" 
                                         CssClass="error"
                                         ErrorMessage="Geben Sie eine Strasse an" />
           </td>
         </tr> 
         <tr>   
           <th scope="row"><asp:Label runat="server" AssociatedControlID="txtStreetNo">Hausnummer</asp:Label></th>
           <td>
             <asp:TextBox ID="txtStreetNo" runat="server"  CssClass="textfield" />
           </td>
         </tr>
         <tr>   
           <th scope="row"><asp:Label runat="server" AssociatedControlID="txtZip">Postleitzahl</asp:Label></th>
           <td>
             <asp:TextBox ID="txtZip" runat="server" CssClass="textfield" />
             <asp:RequiredFieldValidator Display="Dynamic" 
                                         ID="zipValidator" 
                                         runat="server" 
                                         ControlToValidate="txtZip" 
                                         CssClass="error"
                                         ErrorMessage="Geben Sie eine Postleitzahl an" />
           </td>
         </tr>
         <tr>   
           <th scope="row"><asp:Label runat="server" AssociatedControlID="txtCity">Ort</asp:Label></th>
           <td>
             <asp:TextBox ID="txtCity" runat="server"  CssClass="textfield" />
             <asp:RequiredFieldValidator ID="cityValidator" 
                                         runat="server" 
                                         ControlToValidate="txtCity" 
                                         Display="Dynamic"
                                         CssClass="error"
                                         ErrorMessage="Geben Sie einen Ort an" />
           </td>
         </tr>
      </table>
         
         <div id="functionpanel">
          <asp:LinkButton CommandName="submit" ID="btnSubmit" runat="server" oncommand="btnSubmit_Command"><div id="functionbutton">weiter</div></asp:LinkButton>
          <a href="index.html"><div id="functionbutton">abbrechen</div></a>
         </div>
   </form>
      
   </section><!-- End anmelden -->
   <div id="okay">
       <img src="/images/okay/okay.002.png" style="height:200px; width:200px;" alt="okay.002.jpg" title="okay.002.jpg">
    </div><!-- End bestpractice -->
   </div><!-- End container -->
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
         <p><a href="/downloads/507_d_callmed.pdf" target="blank">Produktblatt CALLMED</a><br>
         <a href="/downloads/03900_d_demand.pdf" target="blank">24h Notfall 058 277 77 77</a><br>
         <a href="/downloads/802_d_avb_arcosana_callmed.pdf" target="blank">Reglement Ausgabe 01.2012</a><br>
         <a href="/agb.html" class="iframe">AVIERTdirect placement AGB</a></p>
      </div><!-- End mainfooter-right -->
      
   </footer><!-- mainfooter -->
   <!-- End include -->
</div><!-- End wrapper -->

<script>
    $(function () {
        $('#wrapper').hide().fadeIn(1200);           // fades wrapper's content
        $('#anmelden a[title]').tooltip();      // tooltips 
        $("#dialog").dialog();
    }); // end ready
</script>

<script>
      function checkUsername() {
           $.ajax({
               type: "POST",
               url: "RegistrationService.asmx/CheckUsername",
               data: '{ p_username: \'' + $('#<%= txtUsername.ClientID %>').val() + '\' }',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: OnUserCheckSuccess,
               error: OnError
            });
       }

       function OnUserCheckSuccess(data, status)
       {
           if (data.d != 'ok') {
               alert('Der Benutzername \'' + $('#<%= txtUsername.ClientID %>').val() + '\' ist bereits vergeben ! Vorschlag: ' + data.d);
               $("#<%= txtUsername.ClientID %>").val(data.d);
           }
       }
 
       function OnError(request, status, error)
       {
           alert(request.statusText);
       }

       $(function () {
           var dates = $("#<%= txtBirthday.ClientID %>").datepicker({
               minDate: '-80Y',
               maxDate: "-18Y",
               yearRange: "-65:+0",
               dateFormat: 'dd.mm.yy',
               changeMonth: true,
               changeYear: true,
               numberOfMonths: 1,
               onSelect: function (selectedDate) {
               var option = this.id == "from" ? "minDate" : "maxDate",
               instance = $(this).data("datepicker"),
               date = $.datepicker.parseDate(
               instance.settings.dateFormat ||
               $.datepicker._defaults.dateFormat,
               selectedDate, instance.settings);
               dates.not(this).datepicker("option", option, date);
               }
           });
       });
</script>
</body>