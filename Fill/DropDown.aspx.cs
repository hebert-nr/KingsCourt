using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fill
{
    public partial class DropDown : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Search_DD_PreRender(object sender, EventArgs a)
        {
            if (IsPostBack) Session["Search_DD"] = ((TextBox)sender).Text;

            ((TextBox)sender).Text = (Session["Search_DD"] ?? "").ToString();
        }

        


    }
}