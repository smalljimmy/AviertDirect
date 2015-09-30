<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing.aspx.cs" Inherits="AviertDirect.Landing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>AVIERTdirect placement — Heilungskosten-Versicherung für temporär in der Schweiz arbeitende Personen aus dem Ausland</title>
    <meta name="robots" content="index, follow">
    <link rel="stylesheet" type="text/css" href="/styles/landing.css">
    <link rel="stylesheet" type="text/css" href="/opensans/opensans.css">
    <link rel="stylesheet" type="text/css" href="/opensans-condensed/opensans-condensed.css">
    <script src="/scripts/jquery-1.7.1.js"></script>
</head>
<body>
<form runat="server"> 
<div id="wrapper">
   
   <div id="mainheader"><h1>AVIERT<span>direct placement</span></h1></div><!-- End mainheader -->
   <div id="container">

      <div id="hello">
      <p>Willkommen, <asp:Label ID="lblUsername" runat="server" /> | 
          <asp:LinkButton CommandName="logout" ID="btnLogout" runat="server" 
              Text="Logout" oncommand="btnLogout_Command" /></p>
      </div><!-- End hello -->

      <div id="headline">
         <h1>Willkommen bei AVIERTdirect placement <br>Was möchten Sie tun? </h1>
      </div><!-- End headline -->
      
      <section id="choice">
         
         <ul class="hover_block">
         <li><a href="userarea.aspx#section2"><img src="/images/landing.003.jpg" style="height:200px; width:300px;" alt="Umziehen" title="Bitte melden Sie Ihren neuen Wohnort an AVIERTdirect placement">Eine <strong>neue Wohnadresse</strong> erfassen. Hier klicken und mit ein paar Inputs ist die Ummeldung erledigt.</a></li>
         <li><a href="userarea.aspx#section1"><img src="/images/landing.002.jpg" style="height:200px; width:300px;" alt="abmelden" title="Bei AVIERTdirect placement einfach und schnell abgemeldet, nur ein Datum erfassen.">Ihre Versicherung <strong>ändern:</strong> <br>&rsaquo; abmelden<br>&rsaquo; neu beginnen<br>&rsaquo; Beginndatum verschieben<br>&rsaquo; Endedatum verschieben</a></li>
         </ul>
         <ul class="hover_block2">
         <li><a href="#"><img src="/images/landing.004.jpg" style="height:200px; width:300px;" alt="neu anmelden" title="Das Beginndatum erfassen und schon sind Sie bei AVIERTdirect wieder versichert.">Ihre Kreditkarte <strong>ändern:</strong> <br>&rsaquo; das Ablaufdatum korrigieren<br>&rsaquo; eine andere Karte wählen<br>&rsaquo; eine andere Zahlungsart wählen<br>Zahlungsarten sind Kreditkarte, PayPal, Postfinance</a>
         </li>
         <li><a href="userarea.aspx#section3"><img src="/images/landing.005.jpg" style="height:200px; width:300px;" alt="Home page" title="AVIERTdirect placement bringt vorteilhafte Bedingungen für Ihre Heilungskosten-Versicherung">Ein <strong>neues Passwort</strong> erfassen.</a>
         </li>
         </ul>
         
      </section><!-- End selection -->
      
      <div id="baseline">
      <p>Wir danken Ihnen, dass Sie AVIERTdirect placement gewählt haben. <br>Sie unterstützen damit die Arbeit des Vereins Aviert.com.</p>
      </div><!-- End baseline -->
      
   </div><!-- End container -->
</div><!-- End wrapper -->

<script>
    $(function () {
        $('ul.hover_block li').hover(function () {
            $(this).find('img').animate({ top: '182px' }, { queue: false, duration: 500 });
        }, function () {
            $(this).find('img').animate({ top: '0px' }, { queue: false, duration: 500 });
        });
        $('ul.hover_block2 li').hover(function () {
            $(this).find('img').animate({ left: '300px' }, { queue: false, duration: 500 });
        }, function () {
            $(this).find('img').animate({ left: '0px' }, { queue: false, duration: 500 });
        });
    });
</script>
 </form>
</body>
</html>
