using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i = 0; i < 100; i++)
        {
            ddlVolume.Items.Add(i.ToString());
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        var title = tbTitle.Text;
        var volume = ddlVolume.SelectedItem.Text;
        var autherId = transNameToId("Auther", ddlAuther.SelectedItem.Text);
        var categoryId = transNameToId("Category", ddlCategory.SelectedItem.Text);
        var familyId = transNameToId("Family", ddlFamily.SelectedItem.Text);
        var formatId = transNameToId("Format", ddlFormat.SelectedItem.Text);
        var sizeId = transNameToId("Size", ddlSize.SelectedItem.Text);
        var other = string.Empty;

        insertBook(title, volume, autherId, categoryId, familyId, formatId, sizeId, other);
        
        Response.Redirect(Request.RawUrl);
    }

    private string getSqlConnectionString
    {
        get
        {
            return "Data Source=LocalHost;Initial Catalog=Books;Integrated Security=True";
        }
    }

    private string executeSqlCommand(string command, bool returnResult)
    {
        var sqlConnection = new SqlConnection(getSqlConnectionString);
        sqlConnection.Open();

        var sqlCommand = new SqlCommand();
        sqlCommand.Connection = sqlConnection;
        sqlCommand.CommandText = command;

        var result = sqlCommand.ExecuteScalar();

        sqlConnection.Close();

        if (returnResult)
        { return result.ToString(); }
        else
        { return string.Empty; }
    }

    private string transNameToId(string col, string name)
    {
        string query = @"SELECT [Id] 
FROM [Books].[dbo].[" + col + @"Id] 
where [" + col + @"]='" + name + @"'";

        return executeSqlCommand(query, true);
    }

    private void insertBook(string title,string volume,string auther,
        string category,string family,string format,
        string size,string other)
    {
        string query = @"
    insert into[Books].[dbo].[Books]
([Title],[Volume],[Auther],[Category],[Family],[Format],[Size],[Other])
values
('"+title+ "','" + volume.ToString() + "','" +auther + "','" 
+ category + "','" + family + "','" + format + "','" 
+ size + "','" + other + "')";

        executeSqlCommand(query, false);
    }
}