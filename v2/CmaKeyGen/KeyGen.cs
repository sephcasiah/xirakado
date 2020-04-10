using System;
using System.Windows.Forms;

namespace CmaKeyGen
{
    public partial class KeyGen : Form
    {
        public KeyGen()
        {
            InitializeComponent();
        }


        private void aid_TextChanged(object sender, EventArgs e)
        {
            try
            {
                Int64 longlong = Convert.ToInt64(aid.Text, 16);

                byte[] AID = BitConverter.GetBytes(longlong);
                Array.Reverse(AID);

                byte[] DerivedKey = KeyDerivation.GenerateKey(AID);


                key.Text = BitConverter.ToString(DerivedKey).Replace("-", "");
            }
            catch(Exception)
            {

            }

        }
    }
}
