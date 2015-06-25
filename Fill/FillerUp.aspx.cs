using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fill
{
    public partial class FillerUp : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Run_Search_PreRender(object sender, EventArgs a)
        {
            if (IsPostBack) Session["Run_Search"] = ((TextBox)sender).Text;
            
            ((TextBox)sender).Text = (Session["Run_Search"] ?? "").ToString();
        }

        protected void ObjectDataSource1_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            DataTable dt = (DataTable)e.ReturnValue;
        }


        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
            FormView1.DataBind();
            ListView1.DataBind();
        }

   


        

    }
}