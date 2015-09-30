<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="success_da.aspx.cs" Inherits="AviertDirect.success" %>

<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="utf-8">
<title>AVIERTdirect placement - Sie sind erfolgreich angemeldet</title>
<meta name="robots" content="index, follow">
<link rel="stylesheet" type="text/css" href="/styles/info.css">
<link rel="stylesheet" type="text/css" href="/opensans/opensans.css">
<link rel="stylesheet" type="text/css" href="/opensans-condensed/opensans-condensed.css">
</head>

<body>
<div id="wrapper">
   <div id="container">
      
      <h1>Willkommen bei AviertDirect. Sie haben sich erfolgreich angemeldet. Nach Eingang 
          Ihrer Zahlung sind Sie im Zeitraum Ihrer Wahl für Heilungskosten versichert. </h1>
      
      <p>Wir danken Ihnen, dass Sie AviertDirect gewählt haben. <br>Sie unterstützen damit die Arbeit des Vereins Aviert.com.</p>

      <%
          string datatrans_response = AviertDirect.Helper.DatatransHelper.RequestParamsToString(Request);
          
          if (AviertDirect.Helper.DatatransHelper.TestMode)
          {
              Response.Write("<div style='background:white;border:1px solid'><pre>TestMode is active !\r\n\r\nDataTrans response\r\n==================\r\n");
              Response.Write(datatrans_response.Replace(@"\r\n", "<br />"));
              Response.Write("</pre></div>");
          } 
      %>

   </div>
</div>
</body>

</html>