using Fill.App_Tiers.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Fill.App_Tiers.Business
{
    public class BusinessObject
    {


        public DataTable JobDetails1(Object JobID)
        {
            Model mdl = new Model();
            mdl.StoreProcedureName = "JobDetails";
            mdl.JobID = JobID;
            return SqlServer.ExecuteReader(mdl);
        }

        public DataTable InsertUser(object JobID)
        {
            Model mdl = new Model();
            mdl.StoreProcedureName = "InsertUser";
            mdl.JobID = JobID;
            return SqlServer.ExecuteReader(mdl);
        }

        public DataTable SearchUsers(object JobID, object FirstName, object LastName, object JobTitle, object JobDescription)
        {
            Model mdl = new Model();
            mdl.StoreProcedureName = "SearchUsers";
            mdl.JobID = JobID;
            mdl.FirstName = FirstName;
            mdl.LastName = LastName;
            mdl.JobTitle = JobTitle;
            mdl.JobDescription = JobDescription;
            return SqlServer.ExecuteReader(mdl);
        }

        public DataTable FillSearch(object JobTitle, object JobDescription, object FirstName, object LastName)
        {
            Model mdl = new Model();
            mdl.StoreProcedureName = "FillSearch";
            mdl.JobTitle = JobTitle;
            mdl.JobDescription = JobDescription;
            mdl.FirstName = FirstName;
            mdl.LastName = LastName;
            return SqlServer.ExecuteReader(mdl);
        }

    }
}