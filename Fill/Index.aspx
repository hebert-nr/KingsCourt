<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Fill.FillerUp" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Fill the List</title>
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>

<body>
     <p id="goThere">Go here to search by name or job specifically <b>>> </b><asp:HyperLink CssClass="ddllink" ID="FillrUpLink" runat="server" NavigateUrl="~/DropDown.aspx">Drop&nbsp;Down&nbsp;List</asp:HyperLink><b>&nbsp;&nbsp;<<</b></p>
    <form id="form1" runat="server">
        &nbsp;<br />
        What&nbsp;Can&nbsp;I&nbsp;Help&nbsp;You&nbsp;Find?&nbsp;
        <asp:TextBox ID="ThisSearches" runat="server" Height="16px" Width="222px"></asp:TextBox>
        <asp:LinkButton ID="Run_Search" runat="server" text="Search"/> 
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="JobID" DataSourceID="ObjectDataSource1">
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td><h1 id="NoData">No data was returned.</h1></td>
                        </tr>
                    </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="">
                    <td id="tdA" runat="server"></td>
                    <td><asp:Label ID="JobID_Label" runat="server" Text='<%# Eval("JobID") %>' /></td>
                    <td><asp:Label ID="FirstName_Label" runat="server" Text='<%# Eval("FirstName") %>' /></td>
                    <td><asp:Label ID="LastName_Label" runat="server" Text='<%# Eval("LastName") %>' /></td>
                    <td><asp:Label ID="JobTitle_Label" runat="server" Text='<%# Eval("JobTitle") %>' /></td>
                    <td><asp:Label ID="JobDescription_Label" runat="server" Text='<%# Eval("JobDescription") %>' /></td>
                    <td><asp:Label ID="IncomeAmount_Label" runat="server" Text='<%# Eval("IncomeAmount", "{0:c}")%>' /></td>
                </tr>
            </ItemTemplate>

            <LayoutTemplate>
                <table id="TheTable" runat="server" style="border: 5px solid green; width:800px">
                    <tr>
                        <th class="TableHeaderFormat">Job&nbsp;And&nbsp;Income&nbsp;Information</th>
                    </tr>
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table id="itemPlaceHolderContainer" runat="server">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th1" runat="server"></th>
                                <th id="Th7" runat="server"><asp:LinkButton ID="LinkButton6" runat="server" CommandArgument="JobID" CommandName="Sort">Job&nbsp;ID</asp:LinkButton></th>
                                <th id="Th2" runat="server"><asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="FirstName" CommandName="Sort">First&nbsp;Name</asp:LinkButton></th>
                                <th id="Th3" runat="server"><asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="LastName" CommandName="Sort">Last&nbsp;Name</asp:LinkButton></th>
                                <th id="Th4" runat="server"><asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="JobTitle" CommandName="Sort">Title</asp:LinkButton></th>
                                <th id="Th5" runat="server"><asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="JobDescription" CommandName="Sort">Description</asp:LinkButton></th>
                                <th id="Th6" runat="server"><asp:LinkButton ID="LinkButton5" runat="server" CommandArgument="IncomeAmount" CommandName="Sort">Income</asp:LinkButton></th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                
             </LayoutTemplate>   
        </asp:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="JobDetails1" 
        TypeName="Fill.App_Tiers.Business.BusinessObject" 
        OnSelected="ObjectDataSource1_Selected" DataObjectTypeName="model" FilterExpression="[LastName] LIKE '%{0}%' OR [FirstName] LIKE '%{0}%' OR [JobTitle] LIKE '%{0}%'">
        <FilterParameters>
            <asp:ControlParameter ControlID="ThisSearches" DefaultValue="%" Name="Filter" PropertyName="Text" />
        </FilterParameters>
        <SelectParameters>
            <asp:Parameter Name="JobID" Type="Object" ConvertEmptyStringToNull="true" />
        </SelectParameters>
    </asp:ObjectDataSource>

        <h2>Or if you feel the need to update some of the information...</h2>
        <p>Select one of the items on the table below</p>
        
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="JobID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Details" />
                <asp:BoundField DataField="JobID" HeaderText="JobID" InsertVisible="False" ReadOnly="True" SortExpression="JobID" />
                <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
                <asp:BoundField DataField="JobDescription" HeaderText="JobDescription" SortExpression="JobDescription" />
                <asp:BoundField DataField="IncomeAmount" HeaderText="IncomeAmount" SortExpression="IncomeAmount" DataFormatString="{0:C}" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Test_NoahConnectionString %>" SelectCommand="SELECT Job.JobID, Job.JobTitle, Job.JobDescription, Job.I_ID, Income.IncomeID, Income.IncomeLevel, Income.IncomeAmount FROM Job INNER JOIN Income ON Job.I_ID = Income.IncomeID"></asp:SqlDataSource>
        <br />
        <h3>And go ahead and update the information here.</h3>
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="JobID" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnItemUpdated="FormView1_ItemUpdated">
            <EditItemTemplate>
                JobID:
                <asp:Label ID="JobIDLabel1" runat="server" Text='<%# Eval("JobID") %>' />
                <br />
                JobTitle:
                <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' />
                <br />
                JobDescription:
                <asp:TextBox ID="JobDescriptionTextBox" runat="server" Text='<%# Bind("JobDescription") %>' Height="16px" Width="216px" />
                <br />
                Income:
                <asp:TextBox ID="IncomeTextBox" runat="server" Text='<%# Bind("I_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                JobTitle:
                <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' />
                <br />
                JobDescription:
                <asp:TextBox ID="JobDescriptionTextBox" runat="server" Text='<%# Bind("JobDescription") %>' />
                <br />
                I_ID:
                <asp:TextBox ID="I_IDTextBox" runat="server" Text='<%# Bind("IncomeAmount") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                JobID:
                <asp:Label ID="JobIDLabel" runat="server" Text='<%# Eval("JobID") %>' />
                <br />
                JobTitle:
                <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Bind("JobTitle") %>' />
                <br />
                JobDescription:
                <asp:Label ID="JobDescriptionLabel" runat="server" Text='<%# Bind("JobDescription") %>' />
                <br />
                <br />
                 <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;
                &nbsp;
            </ItemTemplate>
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Test_NoahConnectionString %>" 
            SelectCommand="SELECT * FROM [Job] WHERE ([JobID] = @JobID2)" DeleteCommand="DELETE FROM [Job] WHERE [JobID] = @JobID" InsertCommand="INSERT INTO [Job] ([JobTitle], [JobDescription], [I_ID]) VALUES (@JobTitle, @JobDescription, @I_ID)" UpdateCommand="UPDATE [Job] SET [JobTitle] = @JobTitle, [JobDescription] = @JobDescription, [I_ID] = @I_ID WHERE [JobID] = @JobID">
            <DeleteParameters>
                <asp:Parameter Name="JobID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="JobTitle" Type="String" />
                <asp:Parameter Name="JobDescription" Type="String" />
                <asp:Parameter Name="I_ID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="JobID2" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="JobTitle" Type="String" />
                <asp:Parameter Name="JobDescription" Type="String" />
                <asp:Parameter Name="I_ID" Type="Int32" />
                <asp:Parameter Name="JobID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <h2>Click here to <asp:HyperLink CssClass="incomelink" ID="WebFormLink" runat="server" NavigateUrl="~/WebForm1.aspx">Update&nbsp;Income&nbsp;Info</asp:HyperLink></h2>
    </form>
</body>
</html>
