using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
public sealed class Utility
{
    private Utility() { }
    public class GetValue
    {
        public sealed class HttpRequest
        {
            private HttpRequest() { }

            public static string HeaderByName(object httpRequest, object name) 
            { 
                if (name is string) 
                {
                    if (httpRequest is System.Web.HttpRequest) 
                    { 
                        System.Web.HttpRequest request = ((System.Web.HttpRequest)httpRequest); 
                        if (request != null) 
                        { 
                            if (request.Headers.Count > 0) 
                            { 
                                if (request.Headers[((String)name)] != null) 
                                { 
                                    return request.Headers[((String)name)].ToString(); 
                                } 
                            }
                        }
                    }
                } return ""; 
             }
            
            public static string PostBackName(System.Web.HttpRequest sender) 
            { 
                return (sender.Form["__EVENTTARGET"] ?? "").ToString(); 
            }
            
            public static string PostBackValue(System.Web.HttpRequest sender) 
            {
                return (sender.Form["__EVENTARGUMENT"] ?? "").ToString(); 
            }
        }
    }


    public class OutputWindow
    {
        public sealed class Write
        {
            private Write() { }

            public static void SQLParameter(SqlCommand a) 
            { StringBuilder sb = new StringBuilder(); 
                sb.AppendLine("----------------------------------------------------------"); 
                sb.AppendLine(String.Concat("[SQL PARAMETERS - ", a.CommandText, " ", DateTime.Now.ToShortTimeString(), " ]"));
                foreach (SqlParameter b in a.Parameters)
                {
                    if (b.ParameterName != null) 
                    { 
                        if (!(b.ParameterName.Contains("RETURN_VALUE"))) 
                        { 
                            sb.AppendLine(String.Concat(b.ParameterName.PadRight(30), ":", (b.Value ?? "***").ToString())); 
                        } 
                    } 
                } Debug.Write(sb.ToString()); 
            }
        }
    }

    public sealed class DataTableExtensions
    {
        private DataTableExtensions() { }

        public static StringBuilder WriteDataTable(DataTable sourceTable, bool includeHeaders) 
        { 
            StringBuilder sb = new StringBuilder(); if (includeHeaders) 
            { 
                List<string> headerValues = new List<string>(); 
                foreach (DataColumn column in sourceTable.Columns) 
                { 
                    headerValues.Add(QuoteValue(column.ColumnName)); 
                } 
                sb.AppendLine(String.Join(",", headerValues.ToArray())); 
            } 
            string[] items = null; foreach (DataRow row in sourceTable.Rows) 
            { 
                items = row.ItemArray.Select(o => QuoteValue(o.ToString())).ToArray(); sb.AppendLine(String.Join(",", items)); 
            } 
            return sb; 
        }
        
        private static string QuoteValue(string value) 
        {
            return String.Concat("\"", value.Replace("\"", "\"\""), "\""); 
        }
    }

    public sealed class StringExtensions
    {
        private StringExtensions() { }
    }
}
