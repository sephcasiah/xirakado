from ftplib import FTP
import os

def upload_file_to_ftp(ip, username, password, local_file_path, remote_file_name):
    try:
        # Connects to the FTP server
        with FTP(ip) as ftp:
            ftp.login(user=username, passwd=password)

            # Change to the appropriate directory on the server
            ftp.cwd('/')

            # Opens the local file and uploads it to the FTP server
            with open(local_file_path, 'rb') as file:
                ftp.storbinary(f'STOR {remote_file_name}', file)

            print(f'{local_file_path} uploaded successfully to {ip}.')

    except Exception as e:
        print(f'Error: {e}')

if __name__ == "__main__":
    # Prompts the user for FTP credentials
    ftp_ip = input('Enter the IP address of the local FTP server: ')
    ftp_user = input('Enter FTP username: ')
    ftp_password = input('Enter FTP password: ')

    # Specifies the local file to upload
    local_file_path = os.path.join('payloads', 'modoru.vpk')

    # Checks if the file exists locally
    if os.path.exists(local_file_path):
        # Specify the remote file name on the FTP server
        remote_file_name = 'modoru.vpk'

        # Uploads the file to the FTP server
        upload_file_to_ftp(ftp_ip, ftp_user, ftp_password, local_file_path, remote_file_name)
    else:
        print(f'Error: {local_file_path} does not exist.')