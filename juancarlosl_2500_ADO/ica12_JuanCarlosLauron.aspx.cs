using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ica12_JuanCarlosLauron : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            NorthwindAccess.FillCustomersDDL("", _ddlCustomers);
        }
        else
        {

        }
    }

    protected void _btnFilter_Click(object sender, EventArgs e)
    {
      
        NorthwindAccess.FillCustomersDDL(_tbFilter.Text, _ddlCustomers);
    }

    protected void _ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(_ddlCustomers.SelectedIndex > 0)
        {
            _gvCustomer.DataSource = NorthwindAccess.CustomerCategorySummary(_ddlCustomers.SelectedValue);
            _gvCustomer.DataBind();
        }
        else
        {
            _gvCustomer.DataSource = null;
            _gvCustomer.DataBind();
        }
    }

    protected void _gvCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
    {


        e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;

        if (e.Row.RowType != DataControlRowType.Header)
        {
            e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;
        }
    }
}