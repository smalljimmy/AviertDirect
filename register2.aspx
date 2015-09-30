<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="register2.aspx.cs" Inherits="AviertDirect.register2" %>
<%@ Register Assembly="AviertDirect" Namespace="AviertDirect.Controls" TagPrefix="Aviert" %>
    <!DOCTYPE html>
    <!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
    <!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
    <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <!--[if (gte IE 9)|!(IE)]><!-->
    <html lang="de">
      <!--<![endif]-->

      <head>

        <meta charset="utf-8"/>
        <title>AVIERTdirect placement — Heilungskosten-Versicherung für temporär in der Schweiz arbeitende Personen aus dem Ausland</title>
        <meta name="robots" content="index, follow"/>
        <link rel="stylesheet" type="text/css" href="/styles/default.css"/>
        <link rel="stylesheet" type="text/css" href="/styles/table.css"/>
        <link rel="stylesheet" type="text/css" href="/opensans/opensans.css"/>
        <link rel="stylesheet" type="text/css" href="/opensans-condensed/opensans-condensed.css"/>
        <link rel="stylesheet" type="text/css" href="/styles/tooltip.css"/>
        <link href="/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="/styles/themes/base/minified/jquery-ui.min.css"/>
        <link rel="stylesheet" type="text/css" href="/styles/datepicker.css"/>
        <script src="/scripts/jquery-1.7.1.js"></script>
        <script src="/scripts/jquery.easing.1.3.js"></script>
        <script src="/scripts/jquery.tools.min.js"></script>
        <script src="/fancybox/jquery.fancybox-1.3.4.min.js"></script>
        <script src="/scripts/in_page.js"></script>
        <script src="/scripts/modernizr.js"></script>
        <script src="/scripts/facebook.js"></script>
        <script src="/scripts/ui/minified/jquery.ui.core.min.js"></script>
        <script src="/scripts/ui/minified/jquery.ui.datepicker.min.js"></script>
        <script src="/scripts/ui/minified/jquery.ui.widget.min.js"></script>
      </head>

      <body id="register">

        <div id="wrapper">
    <div id="mainheader"><h1>AVIERT<span>direct placement</span></h1></div><!-- End mainheader -->

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
            </div>
            <!-- End hello -->

            <section id="anmelden">
      <h1>Mit wenigen Schritten <br> <span style="color: rgb(85,120,22);">gut und günstig</span> versichert!</h1>
      <p>Wir danken Ihnen, dass Sie AviertDirect gewählt haben. Unser Partner, die ÖKK, gewährleistet einen einwandfreien Versicherungsschutz.
              </p>

              <div id="information">
                Tragen Sie den Versicherungsbeginn ein. Hat die Versicherung noch nicht begonnen, können Sie später einen neuen, späteren Termin eintragen. Tragen Sie auch das Versicherungsende ein, sofern es Ihnen bekannt ist. Sie können das Ende auch später eintragen – jedoch nie rückwirkend.
              </div>
              <!-- End information -->
              <form runat="server">
                <table class="insurance">
                  <tr>
                    <th scope="row">Versicherungsbeginn</th>
                    <td>
                      <asp:TextBox ID="txtBegin" runat="server" CssClass="textfield" />
                      <asp:RequiredFieldValidator ID="beginValidator"  runat="server" ControlToValidate="txtBegin" CssClass="error" ErrorMessage="Bitte geben Sie ein Datum an" Display="None" />
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">Versicherungsende</th>
                    <td>
                      <div>
                        <asp:TextBox ID="txtEnd" runat="server" CssClass="textfield" />
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">Franchise</th>
                    <td>
                      <asp:DropDownList  runat="server" ID="ddlFranchise" Width="200px" onchange="javascript:GetPaymentData()">
                        <asp:ListItem Text="Wählen Sie Ihre Franchise" Value="select" />
                        <asp:ListItem Value="300" Text="CHF 300.00" />
                        <asp:ListItem Value="500" Text="CHF 500.00" />
                        <asp:ListItem Value="1000" Text="CHF 1000.00" />
                        <asp:ListItem Value="1500" Text="CHF 1500.00" />
                      </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="franchiseValidator" runat="server" ControlToValidate="ddlFranchise" InitialValue="select" ErrorMessage="Bitte wählen Sie Ihre Franchise" CssClass="error" Display="None" />
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">Zahlungsart</th>
                    <td>
                      <asp:RadioButtonList ID="rbnPaymentMethod" runat="server" Height="29px" onchange="javascript:GetPaymentData()">
                        <asp:ListItem Value="1">Visa Debit</asp:ListItem>
                        <asp:ListItem Value="2">PayPal</asp:ListItem>
                        <asp:ListItem Value="3">PostFinance</asp:ListItem>
                        <asp:ListItem Value="4">Bank Dauerauftrag</asp:ListItem>
                      </asp:RadioButtonList>
                      <asp:RequiredFieldValidator Display="Dynamic"
                                                  ID="paymentMethodValidator"
                                                  runat="server"
                                                  ControlToValidate="rbnPaymentMethod"
                                                  CssClass="error"
                                                  ErrorMessage="Wählen Sie eine Zahlungsart" />
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" class="periods">Versicherungsprämie</th>
            <td><strong>CHF <asp:Label ID="lblCost" runat="server" Text="0.00" /></strong></td>
                  </tr>
                  <tr>
                    <th scope="row"  class="emptyhead"></th>
            <td class="empty">Ihre monatlichen Zahlungen setzen sich zusammen aus der Versicherungsprämie plus dem Vereinsbeitrag <asp:Label ID="lblZuschlagTxt" runat="server" Text="" />. <br>Im ersten Monat zahlen Sie nur die Anzahl versicherten Tage.</td>
                  </tr>
                  <tr>
                    <th scope="row" class="periods">Kosten Beginnmonat</th>
            <td>Erste Monatszahlung <strong>CHF <asp:Label ID="lblErstePraemie" runat="server" Text="0.00" /></strong></td>
                  </tr>
                  <tr>
                    <th scope="row" class="periods">Danach monatlich</th>
            <td>Danach folgende Monatszahlung <strong>CHF <asp:Label ID="lblWeitereZahlungen" runat="server" Text="0.00" /></strong></td>
                  </tr>
                  <tr>
                    <th scope="row"  class="emptyhead"></th>
                    <td class="empty">Eine Versicherungsperiode beginnt mit dem Eintrag des Versicherungsbeginns. Sind mehrere Perioden eingetragen, zeigt die erste Zeile die jüngste Periode.</td>
                  </tr>
                  <tr>
                    <th scope="row" class="periods">Versicherungsperiode</th>
            <td>Beginn: <asp:Label ID="lblBegin" runat="server" Text="n.a." /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ende: <asp:Label ID="lblEnd" runat="server" Text="n.a." /></td>
                  </tr>
                  <tr>
                    <th scope="row" class="periods">Zahlungsdetails</th>
                    <td class="empty">
                      <div>
                        <asp:Label ID="lblPaymentMethod" runat="server" />
                      </div>
                    </td>
                  </tr>
                </table>
                <div id="informationPaying">
                <asp:CheckBox runat="server" ID="cbxAgb" onchange="cbxAgb_Changed();"/> Ich habe die <a href="agb.html" class="iframe">Allg. Gesch&auml;ftsbedinungen</a> gelesen und akzeptiere diese.
                <asp:Panel runat="server" ID="pnlAgbError" ForeColor ="red" ><b>Bitte lesen und akzeptieren Sie die AGB !</b></asp:Panel>

                  <%
            if (AviertDirect.Helper.DatatransHelper.TestMode)
                  {
                Response.Write("<br /><br /><div style='background:red;text-align:center'><h1 style='color:white'>!!! TEST-MODUS !!!</h2><div style='color:white'><u>Belastung bei DataTrans CHF 1.00</u></div><br /></div>");
                  }
                  %>

                </div>
                <!-- End information -->

                <div id="functionpanel">
       <asp:LinkButton CommandName="submit" ID="btnSubmit" runat="server" onclick="btnSubmit_Click"><div id="functionbutton" >weiter</div></asp:LinkButton>
          <a href="index.html"><div id="functionbutton">abbrechen</div></a>
                </div>
              </form>

            </section>
            <!-- End anmelden -->
          </div>
          <!-- End container -->
          <footer id="mainfooter">

            <div id="mainfooter-left">
         <p><a href="http://aviert.com/" target="blank">Verein AVIERT.com</a><br>
         <a href="http://aviertcallmed.com/" target="blank">AviertCallmed für Temporärvermittler</a><br>
         <a href="http://binais.com/" target="blank">Binaïs the business model company</a><br>
         <a href="http://paracelsus-heute.com/" target="blank">Stiftung Paracelsus Heute</a><br>
         <a href="http://twi-consulting.ch/" target="blank">twi-consulting</a></p>
            </div>
            <!-- End mainfooter-left -->

            <div id="mainfooter-middle">
         <h1>AVIERT<span>direct placement</span></h1>
              <p>Alte Spinnerei . 8877 Murg am Walensee</p>
            </div>
            <!-- End mainfooter-direct -->

            <div id="mainfooter-right">
         <p><a href="downloads/507_d_callmed.pdf" target="blank">Produktblatt CALLMED</a><br>
         <a href="downloads/03900_d_demand.pdf" target="blank">24h Notfall 058 277 77 77</a><br>
         <a href="downloads/802_d_avb_arcosana_callmed.pdf" target="blank">Reglement Ausgabe 01.2012</a><br>
         <a href="agb.html" class="iframe">AVIERTdirect placement AGB</a></p>
            </div>
            <!-- End mainfooter-right -->

          </footer>
          <!-- mainfooter -->

        </div>
        <!-- End wrapper -->

        <script>
          $(function () {
          $('#wrapper').hide().fadeIn(1200);           // fades wrapper's content
          $('#anmelden a[title]').tooltip();      // tooltips
          }); // end ready
        </script>

        <script>
            function GetPaymentData() {
                if ($('#<%= ddlFranchise.ClientID %>').val() == 'select' || $('#<%= txtBegin.ClientID %>').val() == '') {
                    $('#<%= lblCost.ClientID %>').text('0.00');
                    $('#<%= lblErstePraemie.ClientID %>').text('0.00');
                    $('#<%= lblWeitereZahlungen.ClientID %>').text('0.00');
                    $('#<%= lblPaymentMethod.ClientID %>').html('');
                    return;
                }

                if ($('#<%= txtBegin.ClientID %>').val() != '') {
                    $('#<%= lblBegin.ClientID %>').text($('#<%= txtBegin.ClientID %>').val());
                }
                else {
                    $('#<%= lblBegin.ClientID %>').text('n.a.');
                }

                if ($('#<%= txtEnd.ClientID %>').val() != '') {
                    $('#<%= lblEnd.ClientID %>').text($('#<%= txtEnd.ClientID %>').val());
                }
                else {
                    $('#<%= lblEnd.ClientID %>').text('n.a.');
                }
                var paymentMethod = getPaymentMethod();

          $.ajax({
              type: "POST",
              url: "RegistrationService.asmx/GetPaymentData",
              data: '{ p_franchise: \'' + $('#<%= ddlFranchise.ClientID %>').val() + '\', p_begin: \'' + $('#<%= txtBegin.ClientID %>').val() + '\', p_paymentMethod: \'' + paymentMethod + '\' }',
              contentType: "application/json; charset=utf-8",
              dataType: "json",
              success: OnGetPraemie,
              error: OnError
          });
      }

          function OnGetPraemie(data, status) {
          var tmp = data.d;
          var cost = tmp.split('|');

          $('#<%= lblCost.ClientID %>').text(cost[0]);
          $('#<%= lblErstePraemie.ClientID %>').text(cost[1]);
          $('#<%= lblWeitereZahlungen.ClientID %>').text(cost[2]);
          var paymentFee = 0;

          var paymentMethod = getPaymentMethod();
          var paymentAmountFirst = $('#<%= lblErstePraemie.ClientID %>').text();
          var paymentAmountFollowing = $('#<%= lblWeitereZahlungen.ClientID %>').text();
          var paymentMethodText = 'unknown paymentMethod: ' + paymentMethod;
          var zuschlagTxt = "";
          var paymentFeeFollowingBegin = '01.xx.xxxx';
          var paymentFeeFollowingEnd = $('#<%= lblEnd.ClientID %>').text();
          if (paymentMethod == 1) {
              zuschlagTxt = 'plus dem Zuschlag für Visa Debit (CHF 1.80 pro Zahlung)';
              paymentMethodText = 'Sie werden für die Zahlung weitergeleitet auf die Website von Datatrans';
          } else if (paymentMethod == 2) {
              zuschlagTxt = 'plus dem Zuschlag für PayPal (4% pro Zahlung)';
              paymentMethodText = 'Sie werden für die Zahlung weitergeleitet auf die Website von PayPal';
          } else if (paymentMethod == 3) {
              zuschlagTxt = 'plus dem Zuschlag für PostFinance (CHF 6.00 pro Zahlung)';
              paymentMethodText = 'Sie werden für die Zahlung weitergeleitet auf die Website von Datatrans';
          } else if (paymentMethod == 4) {
              zuschlagTxt = '';
              var firstPaymentInfoLabel = [
                  "Name des Begünstigten",
                  "Adresse:",
                  "PLZ/Ort:",
                  "IBAN",
                  "Name der Bank",
                  "Ort der Bank",
                  "Zahlungsgrund",
                  "Ausführung",
                  "Betrag",
               ];
              var firstPaymentInfoValue = [
                  "AviertDirect GmbH???",
                  "Strasse???",
                  "Ort???",
                  "CH?????????",
                  "Bankname??",
                  "Bankort???",
                  "AviertDirect ABC123456",
                  "sofort",
                  "CHF " + paymentAmountFirst,
               ];
              var recurringPaymentInfoLabel = [
                  "Ausführung",
                  "erstmals am",
                  "letztmals am",
                  "Betrag",
               ];
              var recurringPaymentInfoValue = [
                  "Monatlich",
                  "xx.xx.xxxx",
                  paymentFeeFollowingEnd,
                  "CHF " + paymentAmountFollowing,
               ];
              paymentMethodText = 'Für den Beginnmonat tätigen Sie bitte bei Ihrer Bank die folgende Zahlung:<br><br><ul>';
              for (i = 0; i < firstPaymentInfoLabel.length; i++) {
                  paymentMethodText += '<li>' + firstPaymentInfoLabel[i] + ': <strong>' + firstPaymentInfoValue[i] + '</strong><br>';
              }
              paymentMethodText += '</ul>Für die Folgemonate erstellen Sie bei Ihrer Bank einen Dauerauftrag:<br><br><ul>';
              for (i = 0; i < recurringPaymentInfoLabel.length; i++) {
                  paymentMethodText += '<li>' + recurringPaymentInfoLabel[i] + ': <strong>' + recurringPaymentInfoValue[i] + '</strong><br>';
              }
              paymentMethodText += '</ul>Der Versicherungsschutz ist ab dem ersten Zahlungseingang wirksam.';
          }

          $('#<%= lblZuschlagTxt.ClientID %>').html(zuschlagTxt);
          $('#<%= lblPaymentMethod.ClientID %>').html(paymentMethodText);

      }

      function getPaymentMethod() {
          var paymentMethod = 0;
          var radioButtonlist = document.getElementsByName("<%=rbnPaymentMethod.ClientID%>");
          for (var x = 0; x < radioButtonlist.length; x++) {
              if (radioButtonlist[x].checked) {
                  paymentMethod = radioButtonlist[x].value;
              }
          }
          return paymentMethod;
      }

      function OnError(request, status, error) {
          alert(request.statusText);
          }

          $(function () {
          $("#<%= txtBegin.ClientID %>").datepicker({
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
          $("#<%= txtEnd.ClientID %>").datepicker({
          changeMonth: true,
          changeYear: true,
          numberOfMonths: 1,
          beforeShow: customRange,
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

          function customRange(input) {
          if (input.id == '<%= txtEnd.ClientID %>') {
          var minDate = parseDate($('#<%= txtBegin.ClientID %>').val());
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

      function cbxAgb_Changed() {
          var value = $('#<%= cbxAgb.ClientID %>').val();
          var accepted = (value == 'on');
          if (accepted) {
              //$('#<%= pnlAgbError.ClientID %>').text = 'Changed/<b>' + value + '</b>/' + accepted;
              $('#<%= pnlAgbError.ClientID %>').text('')
          }
      }
        </script>
      