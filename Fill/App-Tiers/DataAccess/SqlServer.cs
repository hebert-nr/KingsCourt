using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Fill.App_Tiers.Business;
using System.Reflection;

namespace Fill.App_Tiers.DataAccess
{
    public class SqlServer
    {
        public static DataTable ExecuteReader(Model mdl)
        {
            DataTable dt = new DataTable();
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["TestConnectionString"].ToString()))
            {
                cn.Open();
                SqlCommand cm = new SqlCommand(mdl.StoreProcedureName.ToString(), cn);
                cm.CommandType = CommandType.StoredProcedure;
                foreach (SqlParameter p in cm.Parameters)
                {
                    if (p.Direction == ParameterDirection.Input || p.Direction == ParameterDirection.InputOutput)
                    {
                        foreach (PropertyInfo pi in mdl.GetType().GetProperties())
                        {
                            if (p.ParameterName.ToLower().Replace("@", "") == pi.Name.ToLower())
                            {
                                p.Value = FormatObject(p, pi.GetValue(mdl, null));
                                break;
                            }
                        }
                    }

                }
                dt.Load(cm.ExecuteReader());
            }
            return dt;
        }



        private static object FormatObject(SqlParameter p, object value)
        {
            if (value == null)
            {
                return DBNull.Value;
            }
            string v = "";
            if (value is string)
            {
                v = value.ToString().Trim();
                if (v.ToString().Trim().Length < 1)
                {
                    return DBNull.Value;
                }
            }
            switch (p.DbType)
            {
                case DbType.Decimal:
                v = value.ToString().Replace(",", "");
                break;
                case DbType.Int32:
                case DbType.Binary:
                v = value.ToString().Replace("True", "1").Replace("False", "0");
                break;
                case DbType.String:
                v = value.ToString();
                break;
                default:
                break;
            }

            return v;
        }
    }
}
