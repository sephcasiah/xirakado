# Xirakado

# What is Xirakado?
    Xirakado is a (currently WIP) semi-automatic PS Vita jailbreaking tool code mostly in python

# What OFW is it compatible with?
    Xirakado is currently compatible with PS Vitas on OFW 3.60-3.73, Possibly 3.74(untested)

# What can the tool do?
    As of this writing, the included scripts, when run, will automatically install the required libraries needed to function, gather the user's AID (assuming they have used QCMA to connect to their PS Vita), and gather the corosponding encryption key provided by Henaku, then use it to encrypt a primed version of both H-Encore2, and H-Encore for use in the target device.

# Do I need other software?
    Yes, at present this tool requires you to have QCMA, and Python3 installed to your system at a minimum. All other required software are bundled with Xirakado.

# How do I use Xirakado?
    0. (make sure you have QCMA and Python3 installed)
        A. in QCMA, when asked, set database locations to default
    1. Connect your PS Vita to QCMA (no other action is required)
    3. Via terminal (Powershell, cmd prompt, etc) run prereqinst.py
    4. Run SendAID_getKEY_crypter.py
    5. Reconnect your PS Vita to QCMA and look for the H-Encore2 bubble (you may need to refresh your database if it is not present), and once found, move it to your device
    6. Launch h-encore² to exploit your device, (hold r button as app loads to make sure vitashell gets installed as well)
    7. Open Vitashell, and set it to FTP server by pressing start, set select to FTP, then exit that menu and press select.
    8. Run ftpmodorupush.py
        A. Script will promt user for an IP for te target FTP server, you must use the IP provided by the PS Vita when using the FTP 'Select' function.
        B. Please ensure the PS Vita is connected to the same network as your computer.
    9. Modoru.vpk will now be present on your PS Vita, install it.
        A. Installing VPK files as of the time of this writing will exit VitaShell, you will need to enter VitaShell again and press 'Select' in order to start the FTP server again.
-----END PHASE 1--------
-----BEGINS PHASE 2 WIP-----
    10. Run [OFW_PLACEHOLD_PSH.NULL]
        A. Script will promt user for an IP for te target FTP server, you must use the IP provided by the PS Vita when using the FTP 'Select' function.
        B. Please ensure the PS Vita is connected to the same network as your computer.
    11. Reboot your PSVita, run H-encore2, then Modoru to downgrade to your chosen firmware.
    12. Reconnect your PS Vita to QCMA and move H-Encore to your device.
    13. Launch h-encore to exploit your device, (hold r button as app loads to make sure vitashell gets installed as well)
    14. Open Vitashell, and set it to FTP server by pressing start, set select to FTP, then exit that menu and press select.
    15. Run [FTPENSOPSH.NULL]
        A. Script will promt user for an IP for te target FTP server, you must use the IP provided by the PS Vita when using the FTP 'Select' function.
        B. Please ensure the PS Vita is connected to the same network as your computer.
    16. Enso.vpk should now be present on your device, install it.
    17. Reboot your PSVita and rebuild your database.
    18. Enjoy, you're done!



# Q / A

Q: How do I know if everything worked?
A: PC side you should have 2 h-encore apps in your QCMA backup, and PSVita side you should be able to add apps and custom homebrew. If your PSVita has the molecule boot spash, you're probably good.

Q: I can't get QCMA to connect to my psvita!!
A: If at any point you have issues reconnecting to QCMA, remember to exit QCMA and reload it, you will be able to reconnect

Bundled tool Credits
https://github.com/TheOfficialFloW - TheFloW 
https://github.com/SKGleba - SKGleba