<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditNls.aspx.cs" Inherits="AviertDirect.admin.EditNls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="nlsDataSource" Runat="server" 
            SelectCommand="SELECT NlsId,Text,Language,NlsKey FROM NlsObject ORDER BY NlsKey,Language" 
            UpdateCommand="UPDATE NlsObject SET Text=@Text WHERE NlsId=@NlsId" 
            ConnectionString="Data Source=(local);Initial Catalog=AviertDirect;Integrated Security=True">
            <UpdateParameters>
                <asp:Parameter Type="String" Name="Text"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" Runat="server"
            DataSourceID="nlsDataSource" DataKeyNames="NlsId"
            AutoGenerateColumns="False" AllowPaging="True" 
            BorderWidth="1px" BackColor="White"
            CellPadding="4" BorderStyle="None" BorderColor="#3366CC" PageSize="25">
            <FooterStyle ForeColor="#003399" 
               BackColor="#99CCCC"></FooterStyle>
            <PagerStyle ForeColor="#003399" HorizontalAlign="Left" 
               BackColor="#99CCCC"></PagerStyle>
            <HeaderStyle ForeColor="#CCCCFF" Font-Bold="True" 
               BackColor="#003399"></HeaderStyle>
            <Columns>
                <asp:CommandField ShowEditButton="True"></asp:CommandField>
                <asp:BoundField HeaderText="Key" 
                    DataField="NlsKey" 
                    SortExpression="NlsKey" ReadOnly="true"></asp:BoundField>
                <asp:BoundField HeaderText="Sprache" 
                    DataField="Language" 
                    SortExpression="Language" ReadOnly="True"></asp:BoundField>
                <asp:BoundField HeaderText="Text" 
                    DataField="Text" 
                    SortExpression="Text"></asp:BoundField>
            </Columns>
            <SelectedRowStyle ForeColor="#CCFF99" Font-Bold="True" 
                BackColor="#009999"></SelectedRowStyle>
            <RowStyle ForeColor="#003399" BackColor="White"></RowStyle>
        </asp:GridView>
    
    </div>
    </form>

</body>
</html>
