<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AviertDirect.login" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>AVIERTdirect placement — Login</title>
<meta name="robots" content="index, follow" />
<link rel="stylesheet" type="text/css" href="styles/login.css">
<link rel="stylesheet" type="text/css" href="opensans/opensans.css">
<link rel="stylesheet" type="text/css" href="opensans-condensed/opensans-condensed.css">
<link href="fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet">

<script src="scripts/jquery-1.7.1.js"></script>
<script src="fancybox/jquery.fancybox-1.3.4.js"></script>
<script src="scripts/in_page.js"></script>
</head>

<body>
<div id="wrapper">
  
  <div id="login">
   <form runat="server">
         <h1><span style="color:rgb(255,234,82);">Login</span> zu Ihrer AVIERTdirect Karte</h1>
         <p class="register">Noch keine Versicherungskarte? <asp:HyperLink NavigateUrl="Register.aspx" Text="Hier anmelden" runat="server" ID="lnkRegister" /></p>
         
         <table class="loginad">
                  <tr>
                     <th scope="row"><asp:Label ID="lblUsername" AssociatedControlID="txtUsername" runat="server">Benutzername</asp:Label></th>
                     <td>
                        <asp:TextBox ID="txtUsername" runat="server" />
                        <asp:RequiredFieldValidator Display="Dynamic" 
                                                    ID="usernameValidator" 
                                                    runat="server" 
                                                    ControlToValidate="txtUsername" 
                                                    CssClass="error" 
                                                    ErrorMessage="Bitte geben sie Ihren Benutzernamen ein" />
                     </td>
                  </tr>
                  <tr>
                     <th scope="row"><asp:Label ID="lblPassword" AssociatedControlID="txtPassword" runat="server">Passwort</asp:Label> </th>
                     <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" />
                        <asp:RequiredFieldValidator Display="Dynamic" 
                                                    ID="passwordValidator" 
                                                    runat="server" 
                                                    ControlToValidate="txtPassword" 
                                                    CssClass="error" 
                                                    ErrorMessage="Bitte geben sie Ihr Passwort ein" />
                     </td>
                  </tr>                     
         </table>
         
   <!-- password-request.html -->
          <p class="forgot"><asp:HyperLink NavigateUrl="RequestPassword.aspx" Text="Das Passwort vergessen ?" runat="server" ID="lnkRequestPw" /></p>	
         
         <div class="button">
               <p><asp:Button CommandName="submit" ID="btnSubmit" runat="server" 
            onclick="btnSubmit_Click" />Login</p>
         </div>
         
         <p class="back"><asp:HyperLink NavigateUrl="index.html" Text="Ohne Login zur Hauptseite" runat="server" ID="lnkIndex" /></p>
   </form><!-- End login -->

   </div>
</div><!-- End wrapper -->

</body>
</html>