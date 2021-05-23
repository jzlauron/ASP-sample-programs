using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ica13_JuanCarlosLauron : System.Web.UI.Page
{
    /// <summary>
    /// Nothing really happening here
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {

        }
        else
        {
            int thing;
            if (!int.TryParse(_tbOrderID.Text, out thing))
                _tbOrderID.Text = "";
        }
    }
    /// <summary>
    /// Update GV button with customer
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void _btnGetOrder_Click(object sender, EventArgs e)
    {
        Part1GV.DataBind();
    }

    protected void _btnDelete_Click(object sender, EventArgs e)
    {
        if(Part1GV.SelectedIndex >= 0)
        {
            int prodID;
            int ordID;
            string temp = "status";
            int.TryParse(Part1GV.SelectedDataKey.Values["OrderID"].ToString(), out ordID);
            int.TryParse(Part1GV.SelectedDataKey.Values["ProductID"].ToString(), out prodID);

            string status = NorthwindAccess.DeleteOrderDetails( ordID,prodID,out temp);
            _lblStatus.Text = "Status: " + status;
            Part1GV.SelectedIndex = -1;
            Part1GV.DataBind();

        }
    }

    protected void Part2Button_Click(object sender, EventArgs e)
    {
        if(!string.IsNullOrEmpty(_tbOrderID2.Text) && !string.IsNullOrEmpty(_tbOrderID2.Text))
        {
            try
            {
                Part2Label.Text = "Status: " + NorthwindAccess.InsertOrderDetails(int.Parse(_tbOrderID2.Text), int.Parse(Part2DDL.SelectedValue), short.Parse(Part2TBQUantity.Text));
                _tbOrderID.Text = _tbOrderID2.Text;
                Part1GV.DataBind();

            }
            catch(Exception error)
            {
                Part2Label.Text = "Status: " + error.Message;
            }
        }
    }
}