using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;


namespace xirakado
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
          //  CmaKeyGen.KeyGen.aid.text = Form1.textBox1.text;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process process = new System.Diagnostics.Process();
            System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
            startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
            startInfo.FileName = "cmd.exe";
            startInfo.Arguments = @"md %APPDATA%\xirakado";
            process.StartInfo = startInfo;
            process.Start();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            CmaKeyGen.KeyGen.aid.Text = Form1.textBox1.Text;
        }
    }
}
