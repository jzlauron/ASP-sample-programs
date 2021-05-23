using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ica11_JuanCarlosLauron : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            FillDropList("");
        }
    }
    protected void FillDropList(string fil)
    {

        _ddlSupplier.AppendDataBoundItems = true;
        _ddlSupplier.AutoPostBack = true;

        _ddlSupplier.DataSource = NorthwindAccess.GetSuppliersSDS(fil);
        _ddlSupplier.DataTextField = "CompanyName";
        _ddlSupplier.DataValueField = "SupplierID";
        _ddlSupplier.Items.Clear();
        _ddlSupplier.DataBind();
        _ddlSupplier.Items.Insert(0, new ListItem("Now pick a company from[" + _ddlSupplier.Items.Count + "]"));        //add count

    }

    protected void _btnFilter_Click(object sender, EventArgs e)
    {
        FillDropList(_tbFilter.Text);
    }

    protected void _ddlSupplier_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (_ddlSupplier.SelectedIndex <= 0)
            return;
        List<List<string>> result = NorthwindAccess.GetProducts(_ddlSupplier.SelectedValue);
        if (result.Count <= 0)
            return;
        TableHeaderRow header = new TableHeaderRow();
        result[0].ForEach(x => header.Cells.Add(new TableCell() { Text = x }));
        _tableProducts.Rows.Add(header);
        foreach(List<string> item in result.Skip(1))
        {
            TableRow row = new TableRow();
            item.ForEach(x => row.Cells.Add(new TableCell() { Text = x }));
            _tableProducts.Rows.Add(row);
        }
    }
}