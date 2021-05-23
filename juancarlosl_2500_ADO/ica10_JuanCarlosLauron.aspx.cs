using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ica10_JuanCarlosLauron : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            _ddlNames.AppendDataBoundItems = true;
            _ddlNames.Items.Insert(0, new ListItem("Pick a customer..",""));
        }
        

    }


    protected void _ddlNames_SelectedIndexChanged(object sender, EventArgs e)
    {
        _lvOrders.SelectedIndex = -1;
        DataPager dp = _lvOrders.FindControl("DataPager1") as DataPager;
        dp.SetPageProperties(0, dp.MaximumRows, true);
        _lvOrders.EditIndex = -1;

    }

    protected void _lvOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        _dv.PageIndex = 0;



    }

    protected void CustomerDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        _dv.PageIndex = 0;
        _lvOrders.SelectedIndex = -1;
        DataPager dp = _lvOrders.FindControl("DataPager1") as DataPager;
        dp.SetPageProperties(0, dp.MaximumRows, true);

    }

    protected void DataPager1_DataBinding(object sender, EventArgs e)
    {
       
    }

    protected void _lvOrders_PagePropertiesChanged(object sender, EventArgs e)
    {
        _lvOrders.SelectedIndex = -1;
        
        _lvOrders.EditIndex = -1;

    }
}