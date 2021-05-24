//Submission code : 1202_2500_A07
//Juan Carlos Lauron
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Web.UI.WebControls;
/// <summary>
/// Summary description for Color1
/// </summary>
public static class Color1
{
    static Color1()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static Color WhatColor(byte r, byte g, byte b, bool cb)
    {
        Color _finalColor;
        if (cb)
        {
            _finalColor = Color.FromArgb(r, r, r);
        }
        else
        {
            _finalColor = Color.FromArgb(r, g, b);
        }
        return _finalColor;
    }
    public static bool GetName(string name, ListBox listBox)
    {
        ListItem item = listBox.Items.FindByText(name);
        return item != null;
        
    }
    public static bool GetColor(Color generated, ListBox listbox)
    {
        int x = generated.ToArgb();
        ListItem item = listbox.Items.FindByValue(x.ToString());
        return item != null;
    }
    
}