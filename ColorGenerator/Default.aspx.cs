//Submission code : 1202_2500_A07
//Juan Carlos Lauron
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
public partial class _Default : System.Web.UI.Page
{
        byte b;
        byte g;
        byte r;
        
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) // is it first time request, or is it a postback/submit from existing
        {
            _lblColor.Text = "&nbsp";
            _lblColor.BorderStyle = BorderStyle.Inset;

        }
        else //returning block 
        {

        }
        //Always block
        
       
    }
    protected Color? theColor()
    {
        if(byte.TryParse(_range.Text, out r) && byte.TryParse(_rblGreen.SelectedItem.Value, out g) && byte.TryParse(_ddlBlue.SelectedItem.Value, out b))
        {
            return Color1.WhatColor(r, g, b, _cbGrayscale.Checked);
        }
        else
            return null;

    }
    protected void _range_TextChanged(object sender, EventArgs e)
    {
        _lblRedVal.Text = _range.Text;
    }
    protected void _lbNames_SelectedIndexChanged(object sender, EventArgs e)
    {
        int x;
        if (int.TryParse(_lbNames.SelectedValue, out x))
        {
            Color c = Color.FromArgb(x); //try parse
            _lblColor.BackColor = c;
            _lblColor.ForeColor = c;
            _lblStatus.Text = "Color - " + _lbNames.SelectedItem.Text + " : Successfully Loaded";
        }
    }

    protected void _btnSave_Click(object sender, EventArgs e)
    {
        Color color = (Color)theColor();
        if (_tbName.Text == "")
        {
            _lblStatus.Text = "No color name input. Please name the color.";
        }
        else
        {
            if(Color1.GetName(_tbName.Text,_lbNames))
            {
                _lblStatus.Text = "Name used, please try a different name.";
            }
            else if(Color1.GetColor(color,_lbNames))
            {
                _lblStatus.Text = "Color used, please try a different color.";
            }
            else
            {
                _lbNames.Items.Add(new ListItem(_tbName.Text,color.ToArgb().ToString()));
                _lblColor.BackColor = color;
                _lblColor.ForeColor = color;
                _lblStatus.Text = "Color: " + _tbName.Text + " successfully saved!";
            }
        }
    }

    protected void _btnChosen_Click(object sender, EventArgs e)
    {
        _lblColor.BackColor = (Color)theColor();
        _lblStatus.Text = "";
    }
}