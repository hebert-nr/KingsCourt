<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropDown.aspx.cs" Inherits="Fill.DropDown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>DropDown Search</title>
	<link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<form id="form1" runat="server">
		&nbsp;<br />
        Search&nbsp;First&nbsp;Name
        <asp:TextBox ID="FirstNameSearch" runat="server" Width="216px"></asp:TextBox>
        <br />
        Search&nbsp;Last&nbsp;Name
        <asp:TextBox ID="LastNameSearch" runat="server" Width="216px"></asp:TextBox>
		 <br />
        Search&nbsp;By&nbsp;Job&nbsp;Title
       <asp:DropDownList ID="ThisSearches" runat="server" DataSourceID="SqlDataSource1" DataTextField="JobTitle" DataValueField="JobTitle" AppendDataBoundItems="true">
           <asp:ListItem Text="Select One" Selected="True" Value="" />
		</asp:DropDownList>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Test_NoahConnectionString %>" SelectCommand="SELECT * FROM [Job]">
		</asp:SqlDataSource>
		<asp:LinkButton ID="Run_Search" runat="server" text="Search" /> 
			<asp:ListView ID="ListView1" runat="server" DataKeyNames="JobTitle" DataSourceID="SqlDataSource2">
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

					<td><asp:Label ID="FirstName_Label" runat="server" Text='<%# Eval("FirstName") %>' /></td>
					<td><asp:Label ID="LastName_Label" runat="server" Text='<%# Eval("LastName") %>' /></td>
					<td><asp:Label ID="JobTitle_Label" runat="server" Text='<%# Eval("JobTitle") %>' /></td>
					<td><asp:Label ID="JobDescription_Label" runat="server" Text='<%# Eval("JobDescription") %>' /></td>
					
				</tr>
			</ItemTemplate>

			<LayoutTemplate>
				<table id="TheTable" runat="server" style="border: 5px solid green; width:800px">
					<tr>
						<th class="TableHeaderFormat">Job&nbsp;Information</th>
					</tr>
					<tr id="Tr1" runat="server">
						<td id="Td1" runat="server">
							<table id="itemPlaceHolderContainer" runat="server">
							<tr id="Tr2" runat="server" style="">
								<th id="Th1" runat="server"></th>
								
								<th id="Th2" runat="server"><asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="FirstName" CommandName="Sort" Width="150">First&nbsp;Name</asp:LinkButton></th>
								<th id="Th3" runat="server"><asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="LastName" CommandName="Sort" Width ="150">Last&nbsp;Name</asp:LinkButton></th>
								<th id="Th4" runat="server"><asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="JobTitle" CommandName="Sort" Width="120">Title</asp:LinkButton></th>
								<th id="Th5" runat="server"><asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="JobDescription" CommandName="Sort" Width="300">Description</asp:LinkButton></th>
							</tr>
							<tr runat="server" id="itemPlaceholder">
							</tr>
							</table>
						</td>
					</tr>
				</table>
				
			 </LayoutTemplate>   
		</asp:ListView>
	    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Test_NoahConnectionString %>" SelectCommand="FillSearch" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="FirstNameSearch" Name="FirstName" PropertyName="Text" DefaultValue="%"/>
                <asp:ControlParameter ControlID="LastNameSearch" Name="LastName" PropertyName="Text"  defaultValue="%"/>
                <asp:ControlParameter ControlID="ThisSearches" Name="JobTitle" Type="String" PropertyName="SelectedValue" DefaultValue="%" />
            </SelectParameters>
        </asp:SqlDataSource>
      </form>

    <p id="goThere">Head back to the basic <asp:HyperLink CssClass="ddllink" ID="FillrUpLink" runat="server" NavigateUrl="~/FillerUp.aspx">Search</asp:HyperLink> function</p>
          </body>
    </html>