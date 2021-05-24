<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ica 07</title>
    <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <div id ="main">
        <div class="header"><h1>CMPE2500 - ica07 - Color Generator</h1></div>
        <form id="form1" runat="server">
            <div class="firstColumn">
                <asp:Label ID="_lblRed" runat="server" Text="Red:"></asp:Label>
                <asp:Label ID="_lblRedVal" runat="server" Text="128" ></asp:Label>
            </div>
            <div class ="secondColumn">
                <asp:TextBox ID="_range" runat="server" min="0" Max="255" Value="128" type="range" CssClass="white"  width="95%" OnTextChanged="_range_TextChanged"  AutoPostBack="true"></asp:TextBox>
            </div>
            <div class ="firstColumn">
                <asp:Label ID="_lblGreen" runat="server" Text="Green:"></asp:Label><br />
            </div>
            <div class="secondColumn">
                <asp:RadioButtonList ID="_rblGreen" runat="server" RepeatDirection="Horizontal" width="95%" >
                    <asp:ListItem Text="0%" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="20%" Value="51" ></asp:ListItem>
                    <asp:ListItem Text="40%" Value="102" ></asp:ListItem>
                    <asp:ListItem Text="60%" Value="153"></asp:ListItem>
                    <asp:ListItem Text="80%" Value="204" ></asp:ListItem>
                    <asp:ListItem Text="100%" Value="255" ></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            
            <div class="firstColumn">
                <asp:Label Text="Blue:" runat="server" ID="_lblBlue"></asp:Label>
                
                
            </div>
            <div class ="secondColumn">
                <asp:DropDownList ID="_ddlBlue" runat="server" width="95%" >
                    <asp:ListItem Text="Nada" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Just a bit" Value="64" ></asp:ListItem>
                    <asp:ListItem Text="About a half" Value="128" ></asp:ListItem>
                    <asp:ListItem Text="Most of it" Value="192" ></asp:ListItem>
                    <asp:ListItem Text="Every bit" Value="255"  Selected="True" ></asp:ListItem>
                </asp:DropDownList>
                <br /><asp:CheckBox runat="server"  ID="_cbGrayscale" Text="Grayscale"/>
            </div>
            <div class="firstColumn">
                <asp:Label Text="Name:" runat="server" ID="_lblName"></asp:Label>
            </div>
            <div class="secondColumn">
                <asp:TextBox Text="" runat="server" ID="_tbName" width="95%"></asp:TextBox>
            </div>
            <div class="firstColumn">
                <asp:Button Text="Preview Chosen Color" ID="_btnChosen" runat="server" width ="95%" OnClick="_btnChosen_Click"/><br />
                <asp:Label Text="" ID="_lblColor" runat="server" Width="94%" ></asp:Label>
                <asp:Button Text="Save chosen Color" ID="_btnSave" runat="server" Width="95%" OnClick="_btnSave_Click"/>
            </div>
            <div class="secondColumn">
                <asp:ListBox ID="_lbNames" runat="server" width="95%" Rows="6" OnSelectedIndexChanged="_lbNames_SelectedIndexChanged" AutoPostBack="true">
                     
                </asp:ListBox>
            </div>
            <div class="firstColumn">
                <asp:Label ID="_lblStatus" ForeColor="LightGreen" Text="Loaded" runat="server"></asp:Label>
            </div>
            
        </form>
        <footer class="footer">
                <asp:Label ID="_lblFooter" Text="&copy; 2021 by Juan Carlos Lauron" runat="server"></asp:Label>
            
            </footer>
    </div>
</body>
</html>
