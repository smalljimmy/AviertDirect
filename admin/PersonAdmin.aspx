<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonAdmin.aspx.cs" Inherits="AviertDirect.admin.PersonAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
    <style type="text/css">
         BODY
         {
            font-family:Arial;
         }
         
         #tabs 
         {
             width: 700px;
             height: 500px;
         }
    </style>
     <script>
         $(function () {
             $("#tabs").tabs();
         });

         
    </script>
</head>
<body>

    <form id="form1" runat="server">
    <!-- DataSources -->
        <asp:SqlDataSource ID="personDataSource" Runat="server" 
            SelectCommand="SELECT PersonId,LastName,GivenName,Email FROM Person ORDER BY LastName" 
            ConnectionString="Data Source=(local);Initial Catalog=AviertDirect;Integrated Security=True">
            <UpdateParameters>
                <asp:Parameter Type="String" Name="Text"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="personDetailsSource" Runat="server" 
            SelectCommand="SELECT *,CONVERT(VARCHAR,birthday,104) as dob FROM Person WHERE PersonId=@PersonId" 
            ConnectionString="Data Source=(local);Initial Catalog=AviertDirect;Integrated Security=True">
            <SelectParameters>
              <asp:ControlParameter ControlID="GridView1" Name="PersonId" PropertyName="SelectedValue" Type="String" />
          </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="insuranceDetailsDataSource" Runat="server" 
            SelectCommand="SELECT DetailsId, convert(varchar, StartDate, 104) as StartDate,convert(varchar, EndDate, 104) as EndDate, franchise FROM InsuranceDetails WHERE PersonId=@PersonId" 
            ConnectionString="Data Source=(local);Initial Catalog=AviertDirect;Integrated Security=True">
            <SelectParameters>
              <asp:ControlParameter ControlID="GridView1" Name="PersonId" PropertyName="SelectedValue" Type="String" />
         </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="transactionsDataSource" Runat="server" 
            SelectCommand="SELECT t.TransactionId,CONVERT(VARCHAR,t.ExecutionDate,104) as ExecutionDate,t.amount,IsNull(t.dt_refNo, 'n.a.') as dt_refNo,IsNull(t.DT_uppTransactionId,'n.a.') as DT_uppTransactionId,IsNull(t.DT_pmethod, 'n.a.') as DT_pmethod,t.Status FROM Person p JOIN InsuranceDetails d ON d.PersonId = p.PersonId JOIN Transactions t on t.DetailsId = d.DetailsId WHERE p.PersonId=@PersonId" 
            ConnectionString="Data Source=(local);Initial Catalog=AviertDirect;Integrated Security=True">
            <SelectParameters>
              <asp:ControlParameter ControlID="GridView1" Name="PersonId" PropertyName="SelectedValue" Type="String" />
         </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="userDataSource" Runat="server" 
            SelectCommand="SELECT u.UserId, u.Status,u.CreationDate,u.Username,CONVERT(VARCHAR,u.PasswordDate,104) as pwdate, u.LastLogin FROM Person p JOIN [dbo].[User] u ON u.UserId = p.UserId WHERE p.PersonId = @PersonId" 
            ConnectionString="Data Source=(local);Initial Catalog=AviertDirect;Integrated Security=True">
            <SelectParameters>
              <asp:ControlParameter ControlID="GridView1" Name="PersonId" PropertyName="SelectedValue" Type="String" />
         </SelectParameters>
        </asp:SqlDataSource>

        <table>
            <tr valign="top">
                <td style="border: 1px solid; border-color: #D2D0D0;">
                    <asp:GridView ID="GridView1" Runat="server"
                        DataSourceID="personDataSource" DataKeyNames="PersonId"
                        AutoGenerateColumns="False" AllowPaging="True" 
                        BorderWidth="1px" BackColor="White" Width="550px"
                        CellPadding="4" BorderStyle="Solid" PageSize="18    " AlternatingRowStyle-BackColor="#F2EFEF">
                        <FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
                        <PagerStyle ForeColor="#003399" HorizontalAlign="Left" BackColor="#99CCCC"></PagerStyle>
                        <HeaderStyle Font-Bold="True" BackColor="#CAC7C7" Font-Names="Arial" Font-Size="Small"></HeaderStyle>
                        <Columns>
                            <asp:CommandField ItemStyle-BorderColor="#D2D0D0" ButtonType="Image" SelectImageUrl="/images/details.gif" ShowSelectButton="true" />
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="Name" HeaderStyle-HorizontalAlign="Left" DataField="LastName" SortExpression="LastName" ItemStyle-Width="150px" />
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="Vorname" HeaderStyle-HorizontalAlign="Left" DataField="GivenName" SortExpression="GivenName" ItemStyle-Width="150px" />
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="EMail" HeaderStyle-HorizontalAlign="Left" DataField="EMail" SortExpression="EMail" ItemStyle-Width="250px" />
                        </Columns>
                        <SelectedRowStyle Font-Italic="true" Font-Bold="True"></SelectedRowStyle>
                        <RowStyle Font-Names="Arial" Font-Size="Small" BackColor="White"></RowStyle>
                    </asp:GridView>
                </td>
                <td>
                  <div id="tabs">
                    <ul>
                      <li><a href="#tabs-1">Details</a></li>
                      <li><a href="#tabs-2">Versicherung</a></li>
                      <li><a href="#tabs-3">Transaktionen</a></li>
                      <li><a href="#tabs-4">Benutzer</a></li>
                    </ul>
                    <div id="tabs-1">
                        <asp:DetailsView AutoGenerateRows="False" DataKeyNames="PersonId" DataSourceID="personDetailsSource"
                            ID="personDetailsView" runat="server" Width="400px" 
                            HeaderStyle-BackColor="#c0d0e0" GridLines="None" 
                            ondatabound="personDetailsView_DataBound">
                            <Fields>
                                <asp:BoundField HeaderStyle-Width="150px" DataField="PersonId" HeaderText="ID:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="EMail" HeaderText="EMail:" ReadOnly="True" SortExpression="PersonId" ItemStyle-Font-Size="Small" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" />
                                <asp:BoundField DataField="LastName" HeaderText="Name:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="GivenName" HeaderText="Vorname:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="Gender" HeaderText="Anrede:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="dob" HeaderText="Geburtsdatum:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="Nationality" HeaderText="Nationalität:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="Language" HeaderText="Sprache:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="Phone" HeaderText="Telefon:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="Permit" HeaderText="Bewilligung:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="Co" HeaderText="Wohnhaft bei:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="Street" HeaderText="Strasse:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="StreetNo" HeaderText="Hausnummer" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="ZIP" HeaderText="PLZ:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="City" HeaderText="Ort:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                            </Fields>
                        </asp:DetailsView>
                    </div>
                    <div id="tabs-2">
                        <asp:DetailsView AutoGenerateRows="False" DataKeyNames="DetailsId" DataSourceID="insuranceDetailsDataSource"
                            ID="insuranceDetailsView" runat="server" Width="400px" 
                            HeaderStyle-BackColor="#c0d0e0" GridLines="None" 
                            ondatabound="insuranceDetailsView_DataBound">
                            <Fields>
                                <asp:BoundField DataField="StartDate" HeaderStyle-Width="150px" HeaderText="Beginn:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="EndDate" HeaderText="Ende:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="Franchise" HeaderText="Franchise:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                            </Fields>
                        </asp:DetailsView>
                    </div>
                    <div id="tabs-3">
                        <asp:GridView ID="transactionsGrid" Runat="server"
                        DataSourceID="transactionsDataSource" DataKeyNames="TransactionId"
                        AutoGenerateColumns="False" AllowPaging="True" 
                        BorderWidth="1px" BackColor="White" BorderColor="#D2D0D0" 
                        CellPadding="4" PageSize="15" AlternatingRowStyle-BackColor="#F2EFEF" 
                            onrowdatabound="GridView2_RowDataBound">
                        <PagerStyle BorderColor="#D2D0D0" Font-Size="Small" HorizontalAlign="Left" />
                        <HeaderStyle Font-Bold="True" BackColor="#CAC7C7" BorderColor="#D2D0D0" Font-Names="Arial" Font-Size="Small"></HeaderStyle>
                        <Columns>
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="ID"  DataField="TransactionId" ItemStyle-Width="50px" />
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="Datum"  DataField="ExecutionDate" ItemStyle-Width="50px" />
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="Betrag"  DataField="Amount" ItemStyle-Width="75px" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" />
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="Status"  DataField="Status" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="Datatrans Ref"  DataField="DT_RefNo" ItemStyle-Width="100px" />
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="UPP Transaction Id"  DataField="DT_uppTransactionId" ItemStyle-Width="150px" />
                            <asp:BoundField ItemStyle-BorderColor="#D2D0D0" HeaderText="Zahlungsart"  DataField="DT_pmethod" ItemStyle-Width="50px" />
                        </Columns>
                        <RowStyle Font-Names="Arial" Font-Size="Small" BackColor="White"></RowStyle>
                    </asp:GridView>
                    </div>
                    <div id="tabs-4">
                        <asp:DetailsView AutoGenerateRows="False" DataKeyNames="UserId" DataSourceID="userDataSource"
                            ID="userDetailsView" runat="server" Width="400px" 
                            HeaderStyle-BackColor="#c0d0e0" GridLines="None" 
                            ondatabound="userDetailsView_DataBound">
                            <Fields>
                                <asp:BoundField DataField="Username" HeaderStyle-Width="150px" HeaderText="Benutzername:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="Status" HeaderText="Status:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="CreationDate" HeaderText="Erstellt:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="LastLogin" HeaderText="Letzter Login:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                                <asp:BoundField DataField="pwdate" HeaderText="Passwort geändert:" ReadOnly="True" SortExpression="PersonId" HeaderStyle-Font-Size="Small" HeaderStyle-Font-Bold="true" ItemStyle-Font-Size="Small" />
                            </Fields>
                        </asp:DetailsView>
                    </div>
                </div> <!-- end tabs -->
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
