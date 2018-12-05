using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using PSMS.Cloud.Common;

namespace PSMS.Cloud.Automation.PasswordChecker
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnGenerate_Click(object sender, EventArgs e)
        {
            string input = txtInput.Text;
            string output = CommonConfig.CalculateMD5Hash(input);
            txtOutput.Text = output;
        }
    }
}
