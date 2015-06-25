using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fill.App_Tiers.Business
{
    public class Model
    {
        public Model() { }

        //Model object not in database
        public string StoreProcedureName { get; set; }

        //Model objects built from stored procedure
        public object @IncomeID { get; set; }
        public object @IncomeLevel { get; set; }
        public object @IncomeAmount { get; set; }
        public object @JobID { get; set; }
        public object @JobTitle { get; set; }
        public object @JobDescription { get; set; }
        public object @I_ID { get; set; }
        public object @UserID { get; set; }
        public object @FirstName { get; set; }
        public object @LastName { get; set; }
        public object @J_ID { get; set; }
        

    }
}