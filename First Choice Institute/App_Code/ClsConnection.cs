using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

public class ClsConnection
{
    private SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConStr"]);

    public bool OpenCon()
    {
        bool val = false;
        try
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            val = true;
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        return val;
    }
    public bool CloseCon()
    {
        bool val = false;
        try
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            val = true;
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        return val;
    }
    public DataSet retdata(SqlCommand cmd)
    {
        DataSet ds =new DataSet();
        try
        {
            OpenCon();
            cmd.Connection = con;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            CloseCon();
        }
        return ds;
    }
    public int ExecuteQueries(string sql)
    {
        int val = 0;
        try
        {
            OpenCon();
            SqlCommand cmd = new SqlCommand(sql, con);
            val = cmd.ExecuteNonQuery();
            CloseCon();
        }
        catch (Exception ex)
        {
            throw (ex);
        }
        finally
        {
            CloseCon();
        }
        return val;
    }
}