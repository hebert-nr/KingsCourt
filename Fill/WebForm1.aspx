<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Fill.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Views Practice</title>
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        var pa = $('p.real');
        $(pa).hide();
        $("button").click(function (e) {
            $(pa).slideToggle("slow");
            e.preventDefault();
        });
    });
</script>
</head>
<body>
    <div class="king">
    <button>Want to be King?</button>
        <p class="to">Click the button to see what kind of money you could potentially make as said king.</p>
        <p class="real">Let's be real. You'll never be king.</p>
    </div>
        
    <form id="form1" runat="server">
    
    
        <div>
            <br />
            <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IncomeID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="IncomeID" HeaderText="IncomeID" InsertVisible="False" ReadOnly="True" SortExpression="IncomeID"  />
                <asp:BoundField DataField="IncomeLevel" HeaderText="IncomeLevel" SortExpression="IncomeLevel" />
                <asp:BoundField DataField="IncomeAmount" HeaderText="Income&nbsp;Amount" SortExpression="IncomeAmount"  DataFormatString="{0:C}" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Test_NoahConnectionString %>" SelectCommand="SELECT * FROM [Income]"></asp:SqlDataSource>
    
    </div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="IncomeID" DataSourceID="SqlDataSource2" OnItemCommand="FormView1_ItemCommand" OnItemInserted="FormView1_ItemInserted" OnItemDeleted="FormView1_ItemDeleted" OnItemUpdated="FormView1_ItemUpdated" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
            <EditItemTemplate>
                IncomeID:
                <asp:Label ID="IncomeIDLabel1" runat="server" Text='<%# Eval("IncomeID") %>' />
                <br />
                IncomeLevel:
                <asp:TextBox ID="IncomeLevelTextBox" runat="server" Text='<%# Bind("IncomeLevel") %>' />
                <br />
                IncomeAmount:
                <asp:TextBox ID="IncomeAmountTextBox" runat="server" Text='<%# Bind("IncomeAmount") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                IncomeLevel:
                <asp:TextBox ID="IncomeLevelTextBox" runat="server" Text='<%# Bind("IncomeLevel") %>' />
                <br />
                IncomeAmount:
                <asp:TextBox ID="IncomeAmountTextBox" runat="server" Text='<%# Bind("IncomeAmount") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                IncomeID:
                <asp:Label ID="IncomeIDLabel" runat="server" Text='<%# Eval("IncomeID") %>' />
                <br />
                IncomeLevel:
                <asp:Label ID="IncomeLevelLabel" runat="server" Text='<%# Bind("IncomeLevel") %>' />
                <br />
                IncomeAmount:
                <asp:Label ID="IncomeAmountLabel" runat="server" Text='<%# Bind("IncomeAmount", "{0:c}") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandArgument='<%# Bind("IncomeID") %>' CommandName="Delete" Text="Delete"/>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandArgument='<%# Bind("IncomeID") %>' CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Test_NoahConnectionString %>" DeleteCommand="DELETE FROM [Income] WHERE [IncomeID] = @IncomeID" InsertCommand="INSERT INTO [Income] ([IncomeLevel], [IncomeAmount]) VALUES (@IncomeLevel, @IncomeAmount)" OnInserting="SqlDataSource2_Inserting" SelectCommand="SELECT * FROM [Income] WHERE ([IncomeID] = @IncomeID)" UpdateCommand="UPDATE [Income] SET [IncomeLevel] = @IncomeLevel, [IncomeAmount] = @IncomeAmount WHERE [IncomeID] = @IncomeID" OnDeleting="SqlDataSource2_Deleting" OnUpdated="SqlDataSource2_Updated">
            <DeleteParameters>
                <asp:Parameter Name="IncomeID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="IncomeLevel" Type="String" />
                <asp:Parameter Name="IncomeAmount" Type="Int32" />
                <asp:Parameter Name="IncomeID" Type="Int32" DefaultValue="-1"/>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="IncomeID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="IncomeLevel" Type="String" />
                <asp:Parameter Name="IncomeAmount" Type="Int32" />
                <asp:Parameter Name="IncomeID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <a><asp:HyperLink CssClass="goHere" ID="FillrUpLink" runat="server" NavigateUrl="~/FillerUp.aspx">Back</asp:HyperLink></a>
    </form>
</body>
</html>
