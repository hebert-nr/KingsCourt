using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fill
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        object val;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //item is inserted into table actively
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void SqlDataSource2_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            
            e.Command.Parameters["@IncomeID"].Value = Session["InsertedIncomeID"].ToString();

        }

        //If one of the buttons is clicked, collects IncomeID and stores in a session
        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "New")
            {
                object a = e.CommandArgument;
                Session["InsertedIncomeID"]= a;
            
            }
            else if (e.CommandName == "Delete")
            {
                object a = e.CommandArgument;
                Session["DeletedIncome"] = a;
            }
            else if (e.CommandName == "Edit")
            {
                object a = e.CommandArgument;
                Session["EditedIncome"] = a;
            }
        }

        protected void SqlDataSource2_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@IncomeID"].Value = Session["DeletedIncome"];
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void SqlDataSource2_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            e.Command.Parameters["@IncomeID"].Value = Session["EditedIncome"];
        }

        
    }
}