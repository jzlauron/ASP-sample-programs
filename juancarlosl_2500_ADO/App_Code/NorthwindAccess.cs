using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
/// <summary>
/// Summary description for NorthwindAccess
/// </summary>
public static class NorthwindAccess
{
    public static SqlDataSource GetSuppliersSDS(string what)
    {
        string query;
        query = "select * from suppliers where CompanyName like " + "'%" + "" + "%'"; 
        if(what != "" )
            query = "select * from suppliers where CompanyName like " + "'%" + what + "%'";

        return new SqlDataSource(ConfigurationManager.ConnectionStrings["jlauron1_NorthwindConnectionString"].ConnectionString,query);
    }
    public static List<List<string>> GetProducts(string str)
    {
        List<List<string>> ListList = new List<List<string>>();
        string query = "select EmployeeID as 'ID', concat(LastName, ', ', FirstName) as 'FullName', format(HireDate,'dd-MMM-yy hh:mm:ss tt') as 'HireDate' from Employees where year(HireDate) > 2000";
        using(SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["jlauron1_NorthwindConnectionString"].ConnectionString))
        {
            using(SqlCommand command = new SqlCommand(query,connection))
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                if (!reader.HasRows) return ListList;
                List<string> header = new List<string>();
                for (int i = 0; i < reader.FieldCount; i++)
                    header.Add(reader.GetName(i));
                ListList.Add(header);
                while(reader.Read())
                {
                    List<string> row = new List<string>();
                    for(int i = 0; i<header.Count;i++)
                    {
                        row.Add(reader[header[i]].ToString());
                    }
                    ListList.Add(row);
                }
            }
        }
        return ListList;
    }
    public static void FillCustomersDDL(string filter, DropDownList ddl)
    {

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["jlauron1_NorthwindConnectionString"].ConnectionString))
        {
            using (SqlCommand command =  new SqlCommand())
            {
                //command as store procedure
                command.Connection = con;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "GetCustomers";

                // Create and populate our parameters
                SqlParameter pFilter = new SqlParameter("@filter", System.Data.SqlDbType.VarChar);
                pFilter.Value = filter;
                pFilter.Direction = System.Data.ParameterDirection.Input; // sending value in
                command.Parameters.Add(pFilter); // ACTUALLY add the parameter to the command. DON'T FORGET

                con.Open();
                ddl.DataSource = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                ddl.DataTextField = "CompanyName";
                ddl.DataValueField = "CustomerID";
                ddl.Items.Clear();
                ddl.DataBind();
                ddl.Items.Insert(0, new ListItem("Please pick a Customer from [" + ddl.Items.Count + "]", ""));
                ddl.AutoPostBack = true;

            }
        }
        
    }
    public static SqlDataReader CustomerCategorySummary(string customerID)
    {
        SqlDataReader reader = null;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["jlauron1_NorthwindConnectionString"].ConnectionString);
        con.Open();
        //SqlCommand sqlCommand = new SqlCommand(query, con);
        using (SqlCommand command = new SqlCommand())
        {
            //command as store procedure
            command.Connection = con;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "CustCatSummary";

            // Create and populate our parameters
            SqlParameter idparam = new SqlParameter("@id", System.Data.SqlDbType.VarChar);
            idparam.Value = customerID;
            idparam.Direction = System.Data.ParameterDirection.Input; // sending value in
            command.Parameters.Add(idparam); // ACTUALLY add the parameter to the command. DON'T FORGET


            reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
        return reader;
    }
    public static string DeleteOrderDetails(int orderID, int productID, out string status)
    {
        string what = null;
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["jlauron1_NorthwindConnectionString"].ConnectionString))
        {
            conn.Open();
            using (SqlCommand comm = new SqlCommand())
            {
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Connection = conn;
                comm.CommandText = "DeleteOrderDetails";


                SqlParameter pOrderID = new SqlParameter("@orderID", orderID);
                pOrderID.Direction = ParameterDirection.Input;
                comm.Parameters.Add(pOrderID);

                SqlParameter pProductID = new SqlParameter("@productID", SqlDbType.Int);
                pProductID.Value = productID;
                pProductID.Direction = ParameterDirection.Input;
                comm.Parameters.Add(pProductID);

                SqlParameter pStatus = new SqlParameter("@status", SqlDbType.VarChar,80);
                pStatus.Value = "";
                pStatus.Direction = ParameterDirection.Output;
                comm.Parameters.Add(pStatus);

                comm.ExecuteNonQuery();

                status = (string)pStatus.Value;

                what = status;

            }
        }


        return what; 
    }
    public static string InsertOrderDetails(int OID, int PID, short Q)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["jlauron1_NorthwindConnectionString"].ConnectionString))
        {
            conn.Open();
            using (SqlCommand comm = new SqlCommand())
            {
                comm.CommandType = CommandType.StoredProcedure;
                comm.Connection = conn;
                comm.CommandText = "InsertOrderDetails";

                comm.Parameters.Add(new SqlParameter("@OrderID", OID));
                comm.Parameters.Add(new SqlParameter("@ProductID", PID));
                comm.Parameters.Add(new SqlParameter("Quantity", Q));
                SqlParameter returnVal = new SqlParameter("@rows", 0);
                returnVal.Direction = ParameterDirection.ReturnValue;
                comm.Parameters.Add(returnVal);
                
                comm.ExecuteNonQuery();
                return "Inserted: " + returnVal.Value.ToString() + " rows";
            }
        }
    }
}