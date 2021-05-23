using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
public partial class ica09_JuanCarlosLauron : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)//first load
        {
            
        }
    }

    protected void _btnProducts_Click(object sender, EventArgs e)
    {
        multiview.ActiveViewIndex = 0;
    }

    protected void _gvProducts_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e == null || e.Row == null || e.Row.DataItem == null) return; //chain incomplete data bad
        DataRowView drv = e.Row.DataItem as DataRowView;
        decimal price = decimal.Parse(drv["unitprice"].ToString());
        decimal units = decimal.Parse(drv["UnitsInStock"].ToString());
        int order;
        int.TryParse(drv["unitsonorder"].ToString(), out order);
        if (price > 25)
            e.Row.Cells[2].BackColor = Color.Yellow;
        if (units < 25)
            e.Row.BackColor = Color.LightSalmon;
        if(units < 20 && order < 5 )
        {
            e.Row.BackColor = Color.Cyan;
            e.Row.Cells[3].BackColor = Color.GreenYellow;
        }
        foreach(TableCell item in e.Row.Cells)
        {
            e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
            double d = 0;
            if(double.TryParse(item.Text,out d))
            {
                item.HorizontalAlign = HorizontalAlign.Right;
            }    
        }
    }

    protected void _btnEditEmp_Click(object sender, EventArgs e)
    {
        multiview.ActiveViewIndex = 1;
    }
}