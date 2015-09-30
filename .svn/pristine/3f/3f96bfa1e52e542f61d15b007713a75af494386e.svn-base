<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userarea.aspx.cs" Inherits="AviertDirect.userarea" %>
<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="utf-8">
<title>AVIERTdirect placement — Heilungskosten-Versicherung für temporär in der Schweiz arbeitende Personen aus dem Ausland</title>
<meta name="robots" content="index, follow">
<link rel="stylesheet" type="text/css" href="/styles/edit.css">
<!-- <link rel="stylesheet" type="text/css" href="styles/table.css"> -->
<link rel="stylesheet" type="text/css" href="/opensans/opensans.css">
<link rel="stylesheet" type="text/css" href="/opensans-condensed/opensans-condensed.css">
<link rel="stylesheet" type="text/css" href="/styles/scrollto.css">
<link rel="stylesheet" type="text/css" href="/styles/datepicker.css">
<link rel="stylesheet" type="text/css" href="/styles/themes/base/minified/jquery-ui.min.css">


<script src="/scripts/jquery-1.7.1.js"></script>
<script type='text/javascript' src='/scripts/jquery.scrollTo-min.js'></script>
<script type='text/javascript' src='/scripts/jquery.localscroll-min.js'></script>
<script type='text/javascript' src='/scripts/init.js'></script>
<script  type='text/javascript' src="/scripts/ui/minified/jquery.ui.datepicker.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.core.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.widget.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.mouse.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.draggable.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.position.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.resizable.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.button.min.js"></script>
<script src="/scripts/ui/minified/jquery.ui.dialog.min.js"></script>

<script src="/scripts/jquery.easing.1.3.js"></script>
<script src="/scripts/jquery.tools.min.js"></script>
<script src="/fancybox/jquery.fancybox-1.3.4.min.js"></script>
<script src="/scripts/in_page.js"></script>
<script src="/scripts/modernizr.js"></script>
<script src="/scripts/facebook.js"></script>
</head>

<body>
    <form id="Form1" runat="server">
<div id="wrapper">
   <div id="mainheader"><h1>AVIERT<span>direct placement</span></h1></div><!-- End mainheader -->
   
      <div id="container">
      <div id="hello">
      <p><p>Willkommen, <asp:Label ID="lblUsername" runat="server" /> | 
          <asp:LinkButton CommandName="logout" ID="btnLogout" runat="server" 
              Text="Logout" oncommand="btnLogout_Command" /></p>
      </div><!-- End hello -->
      <div id="headline">
         <h1>Willkommen bei AVIERTdirect placement <br>Hier können Sie Ihre Daten ändern</h1>
      </div><!-- End headline -->
      
      
      
   <!-- <div class="sidebar"></div> -->
   <ul id="navigation">
         <li class="sup"><a href="#section1">Versicherung</a>
         
         <ul>
      	<li><a href="#section1b">Abmelden</a></li>
      	<li><a href="#section1c">Wieder anmelden</a></li>
            <li><a href="#section1d">Beginn ändern</a></li>
            	<li><a href="#section1e">Ende ändern</a></li>
         </ul>	
         
   </li>
   
         <li class="sup"><a href="#section2">Wohnadresse</a>
         </li>
         
         <li class="sup"><a href="#section3">Passwort</a>
                  </li>
         
   </ul><!-- End navigation -->
   
   <div id="content">
<!-- SECTION 1 -->
         <div class="section">
	<ul>
	<li class="sub" id="section1">
	<h2>Hier die Versicherungsdaten ändern</h2>
	<p>Wählen Sie aus dem Menü auf der rechten Seite, was Sie tun möchten.</p>
            <br>
            <img src="images/bestpractices420x280.jpg" style="height:280px; width:420px;" alt="best friend" title="AVIERTdirect beste Lösung für Heilungskosten">
	</li>

<!--  SUBSECTION 1B  -->
      <li class="sub" id="section1b">
            <h2>Versicherung abmelden</h2>
            <p>Ändern Sie das Datum für das Versicherungsende. Das ist alles, was Sie tun müssen. Beachten Sie bitte: Sie können kein Datum eintragen, das vor dem heutigen Tag liegt. Sie können Ihre Versicherung jederzeit wieder neu anmelden.
            </p>
      <table class="insurance">
         <tr>
            <th scope="row">Versicherungsende</th>
               <td><asp:TextBox ID="txtCancelDate" runat="server" /></td>
         </tr>
         <tr>
            <th scope="row"  class="emptyhead"></th>
            <td class="empty">Ihre letzte Belastung erfolgt(e) am:</td>
            </tr>
         <tr>
            <th scope="row" class="periods">Letzte Belastung am</th>
               <td>
                    <asp:Label ID="lblLetzteBelastung" runat="server" Text="nie" />
               </td>
         </tr>
      </table>
      <div id="functionpanel">
          <asp:LinkButton CommandName="cancelInsurance" ID="btnCancelInsurance" runat="server" oncommand="btnCancelInsurance_Command"><div id="functionbutton">speichern</div></asp:LinkButton>
      </div>
   </li>

<!--  SUBSECTION 1C  -->				
      <li class="sub" id="section1c">
            <h2>Versicherung wieder anmelden</h2>
            <p>Sie können Ihre Versicherung jederzeit wieder neu anmelden. Tragen Sie im Versicherungsbeginn das Datum ein. Und auch das Versicherungsende, sofern Sie dieses bereits kennen. Sie können das Ende später angeben und auch ändern. Und Sie können Ihre Versicherung jederzeit wieder abmelden.</p>

      <table class="insurance">
         <tr>
            <th scope="row">Versicherungsbeginn</th>
               <td><asp:TextBox ID="txtBegin2" runat="server" /></td>
         </tr>
         <tr>
            <th scope="row">Versicherungsende</th>
               <td><asp:TextBox ID="txtEnd2" runat="server" /></td>
         </tr>
         <tr>
            <th scope="row"  class="emptyhead"></th>
            <td class="empty">Franchise und monatliche Kosten:</td>
            </tr>
         <tr>
            <th scope="row" class="periods">Ihre Franchise</th>
               <td><asp:Label ID="lblFranchise" runat="server" /></td>
         </tr>

         <tr>
            <th scope="row" class="periods">Kosten Beginnmonate</th>
            <td><asp:Label ID="lblErstePraemie" runat="server" /></td>
         </tr>
         <tr>
            <th scope="row" class="periods">Danach monatlich</th>
            <td><asp:Label ID="lblPraemie" runat="server" /></td>
         </tr>
      </table>
      <div id="functionpanel">
         <a href="#"><div id="functionbutton">speichern</div></a>
      </div>
   </li>

<!--  SUBSECTION 1D  -->            
      <li class="sub" id="section1d">
            <h2>Versicherungsbeginn ändern</h2>
            <p>Tragen Sie das neue Beginndatum ein. Beachten Sie, dass Sie kein zum heutigen Tag zurückliegendes Datum eintragen können. Vergessen Sie nicht zu speichern.
            </p>
         <table class="insurance">
            <tr>
               <th scope="row">Versicherungsbeginn</th>
               <td><asp:TextBox ID="txtBegin" runat="server" /></td>
            </tr>
         </table>      
         <div id="functionpanel">
          <asp:LinkButton CommandName="changeBegin" ID="btnChangeBegin" runat="server" oncommand="btnChangeBegin_Command"><div id="functionbutton">speichern</div></asp:LinkButton>
         </div>
      </li>

<!--  SUBSECTION 1E  -->				
      <li class="sub" id="section1e">
            <h2>Versicherungsende ändern</h2>
            <p>Tragen Sie das neue Endedatum ein. Beachten Sie, dass Sie kein zum heutigen Tag zurückliegendes Datum eintragen können. Vergessen Sie nicht zu speichern.
            </p>
      <table class="insurance">
         <tr>
            <th scope="row">Versicherungsende</th>
               <td><asp:TextBox ID="txtEnd" runat="server" /></td>
         </tr>
      </table>
      <div id="functionpanel">
          <asp:LinkButton CommandName="changeEnd" ID="btnChangeEnd" runat="server"  oncommand="btnChangeEnd_Command" ><div id="functionbutton">speichern</div></asp:LinkButton>
      </div>
      </li>
      		
   </div><!-- End section 1 -->

<!-- SECTION 2 -->        
         <div class="section">
         	<ul>
         	<li class="sub" id="section2">
         	<h2>Wohnadresse ändern</h2>
         	<p>Wenn Sie in Untermiete oder im Hotel wohnen und keine eigene Wohnung mieten, dann im Feld “Wohnhaft bei” die c/o Adresse eintragen. Sonst leer lassen.</p>
      
      <table class="registering">
            <tr> 
               <th scope="row">Wohnhaft bei</th>
               <td><asp:TextBox ID="txtCo" runat="server" /></td>
               </tr>       
            <tr>
               <th scope="row">Strasse</th>
               <td>
                    <asp:TextBox ID="txtStreet" runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="adresse" ID="validateStreet" Display="Dynamic" runat="server" ControlToValidate="txtStreet" CssClass="error" ErrorMessage="Bitte geben Sie eine Strasse ein" />
               </td>
            </tr>      
            <tr>
               <th scope="row">Hausnummer</th>
               <td>
                    <asp:TextBox ID="txtStreetNo" runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="adresse" ID="validateStreetNo" Display="Dynamic" runat="server" ControlToValidate="txtStreetNo" CssClass="error" ErrorMessage="Bitte geben Sie eine Hausnummer ein" />
               </td>
            </tr>           
            <tr>
               <th scope="row">PLZ</th>
               <td>
                    <asp:TextBox ID="txtZip" runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="adresse" ID="validateZip" Display="Dynamic" runat="server" ControlToValidate="txtZip" CssClass="error" ErrorMessage="Bitte geben Sie eine Postleitzahl ein" />
               </td>
            </tr>      
            <tr>
               <th scope="row">Ort</th>
               <td>
                    <asp:TextBox ID="txtCity" runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="adresse" ID="validateCity" Display="Dynamic" runat="server" ControlToValidate="txtCity" CssClass="error" ErrorMessage="Bitte geben Sie einen Ort ein" />
               </td>
            </tr>           
      </table><!-- registering -->
      <div id="functionpanel">
          <asp:LinkButton CommandName="updateAddress" ValidationGroup="adresse" ID="btnSubmitAddress" runat="server" oncommand="btnSubmitAddress_Command"><div id="functionbutton">speichern</div></asp:LinkButton>
      </div>
   </li>
</ul>
</div><!-- End section 2 -->

<!-- SECTION 3 -->               
         <div class="section">
         	<ul>
         	<li class="sub" id="section3">
         	<h2>Neues Passwort</h2>
         	<p>Notieren Sie Ihr neues Passwort an einem geschützten Ort.
             </p>
            <table class="logindata">       
            <tr>
               <th scope="row">Neues Passwort</th>
               <td>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="changePw" ID="pwValidator1" Display="Dynamic" runat="server" ControlToValidate="txtPassword" ErrorMessage="Bitte wählen Sie ein Passwort" CssClass="error" />
                    
               </td>
               </tr>            
            <tr>
               <th scope="row">Passwort wiederholen</th>
               <td>
                    <asp:TextBox ID="txtPassword2" TextMode="Password" runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="changePw" ID="pwValidator2" Display="Dynamic" runat="server" ControlToValidate="txtPassword2" CssClass="error" ErrorMessage="Bitte wiederholen Sie das Passwort" />
                    <asp:CompareValidator ValidationGroup="changePw" id="comparePasswords" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPassword2" CssClass="error" Display="Dynamic" ErrorMessage="Bitte wiederholen Sie das Passwort korrekt" />
          
               </td>
               </tr>            
         </table><!-- End logindata -->
         <div id="functionpanel">
          <asp:LinkButton CommandName="updatePassword" ValidationGroup="changePw" ID="btnChangePassword" runat="server" oncommand="btnChangePassword_Command"><div id="functionbutton">speichern</div></asp:LinkButton>
         </div>
      </li>
   </ul>
</div><!-- End section 3 -->
</form>
         
   </div><!-- End content -->

   <div id="baseline">
      <p>Wir danken Ihnen, dass Sie AVIERTdirect placement gewählt haben. <br>Sie unterstützen damit die Arbeit des Vereins Aviert.com.</p>
      </div><!-- End baseline -->
      
   <!-- </div> --><!-- End container -->
</div><!-- End wrapper -->

<script language="javascript">
    function GetPaymentData() {
        if ($('#<%= txtBegin2.ClientID %>').val() == '') {
            $('#<%= lblErstePraemie.ClientID %>').text('0.00');
            $('#<%= lblPraemie.ClientID %>').text('0.00');
            return;
        }

        $.ajax({
            type: "POST",
            url: "RegistrationService.asmx/GetPaymentData",
            data: '{ p_franchise: \'<%=m_details.Franchise %>\', p_begin: \'' + $('#<%= txtBegin2.ClientID %>').val() + '\' }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnGetPraemie,
            error: OnError
        });
    }

    function OnGetPraemie(data, status) {
        var tmp = data.d;
        var cost = tmp.split('|');

        $('#<%= lblPraemie.ClientID %>').text('CHF ' + cost[0]);
        $('#<%= lblErstePraemie.ClientID %>').text('CHF ' + cost[1]);
    }

    function OnError(request, status, error) {
        alert(request.statusText);
    }

    $(function () {
        var dates = $("#<%= txtBegin.ClientID %>").datepicker({
            minDate: '-0D',
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

   $(function () {
       var dates = $("#<%= txtBegin2.ClientID %>").datepicker({
           minDate: '-0D',
           changeMonth: true,
           changeYear: true,
           numberOfMonths: 1,
           dateFormat: 'dd.mm.yy',
           onSelect: function (selectedDate) {
               var option = this.id == "from" ? "minDate" : "maxDate",
                instance = $(this).data("datepicker"),
                date = $.datepicker.parseDate(
                instance.settings.dateFormat ||
                $.datepicker._defaults.dateFormat,
                selectedDate, instance.settings);
               dates.not(this).datepicker("option", option, date);
               GetPaymentData();
           }
       });
   });

   $(function () {
       var dates = $("#<%= txtEnd2.ClientID %>").datepicker({
           minDate: '-0D',
           changeMonth: true,
           beforeShow: customRange,
           changeYear: true,
           numberOfMonths: 1,
           dateFormat: 'dd.mm.yy',
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

   $(function () {
       var dates = $("#<%= txtCancelDate.ClientID %>").datepicker({
           minDate: '-0D',
           changeMonth: true,
           changeYear: true,
           numberOfMonths: 1,
           dateFormat: 'dd.mm.yy',
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

   $(function () {
       var dates = $("#<%= txtEnd.ClientID %>").datepicker({
           minDate: '-0D',
           changeMonth: true,
           changeYear: true,
           numberOfMonths: 1,
           dateFormat: 'dd.mm.yy',
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

   function customRange(input) {
       if (input.id == '<%= txtEnd2.ClientID %>') {
           var minDate = parseDate($('#<%= txtBegin2.ClientID %>').val());
           minDate.setDate(minDate.getDate() + 1)
           return {
               minDate: minDate
           };
       }
   }

   function parseDate(input) {
       var parts = input.match(/(\d+)/g);
       return new Date(parts[2], parts[1] - 1, parts[0]); // months are 0-based
   }
</script>

</body>

</html>