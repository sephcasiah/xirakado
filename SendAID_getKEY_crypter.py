import os
import requests
from bs4 import BeautifulSoup
import subprocess
import shutil

def search_and_create_files():
    user_documents_psvita_folder = os.path.join(os.environ['USERPROFILE'], 'Documents', 'PS Vita', 'APP')

    if not os.path.exists(user_documents_psvita_folder):
        print('Documents/PS Vita/APP folder not found.')
        return

    target_folder_name = None

    # Search for a folder with a 16-digit name in %userprofile%\Documents\PS Vita\APP
    for root, dirs, files in os.walk(user_documents_psvita_folder):
        for folder in dirs:
            if len(folder) == 16 and folder.isdigit():
                target_folder_name = folder
                break

    if not target_folder_name:
        print('No folder with a 16-digit name found in the Documents/PS Vita/APP folder.')
        return

    # Set the AID variable
    AID = target_folder_name

    # Create an empty text file with the ID as its name
    AID_text_file_path = os.path.join(os.getcwd(), f'{AID}.txt')
    open(AID_text_file_path, 'w').close()

    print(f'Empty text file created: {AID_text_file_path}')

    # Construct the URL
    url = f'http://cma.henkaku.xyz?aid={AID}'

    # Navigate to the URL
    response = requests.get(url)

    if response.status_code == 200:
        # Parse the HTML content
        soup = BeautifulSoup(response.text, 'html.parser')

        # Search for a 64-character string in the HTML content
        key_element = soup.find(string=lambda text: text and len(text) == 64 and text.isalnum())

        if key_element:
            ID = key_element.strip()

            # Save the 64-character key to the AID text file
            with open(AID_text_file_path, 'w') as key_file:
                key_file.write(ID)

            print(f'64-character key found and saved in {AID_text_file_path}: {ID}')

            # Run the specified commands using subprocess
            commands = [
                f'psvimg-create -n app -K {ID} app ws/ph1/PCSG90096/app',
                f'psvimg-create -n appmeta -K {ID} appmeta ws/ph1/PCSG90096/appmeta',
                f'psvimg-create -n license -K {ID} license ws/ph1/PCSG90096/license',
                f'psvimg-create -n savedata -K {ID} savedata ws/ph1/PCSG90096/savedata',
                f'psvimg-create -n app -K {ID} app ws/ph2/h-encore/PCSG90096/app',
                f'psvimg-create -n appmeta -K {ID} appmeta ws/ph2/h-encore/PCSG90096/appmeta',
                f'psvimg-create -n license -K {ID} license ws/ph2/h-encore/PCSG90096/license',
                f'psvimg-create -n savedata -K {ID} savedata ws/ph2/h-encore/PCSG90096/savedata'
            ]

            for command in commands:
                subprocess.run(command, shell=True, check=True)
                print(f'Command executed successfully: {command}')

            # Verify the existence of specific files after running the commands
            missing_files = verify_files_existence(ID)
            if missing_files:
                print(f'Error: The following files are missing:\n{missing_files}')
            else:
                print('All required files present.')

            # Copy the contents of ws/ph1/PCSG90096 to Documents/PS Vita/{ID}/APP/PCSG90096
            copy_files_to_documents(ID)

        else:
            print('No 64-character string found in the HTML content.')
    else:
        print(f'Failed to fetch the URL. Status code: {response.status_code}')

def verify_files_existence(ID):
    folders_to_check = [
        'ws/ph1/PCSG90096/app',
        'ws/ph1/PCSG90096/license',
        'ws/ph1/PCSG90096/appmeta',
        'ws/ph1/PCSG90096/savedata',
        'ws/ph2/h-encore/PCSG90096/app',
        'ws/ph2/h-encore/PCSG90096/license',
        'ws/ph2/h-encore/PCSG90096/appmeta',
        'ws/ph2/h-encore/PCSG90096/savedata'
    ]

    missing_files = []

    for folder in folders_to_check:
        app_path = os.path.join(folder, f'*.psvimg')
        appmeta_path = os.path.join(folder, f'*.psvmd')

        if not os.path.exists(app_path):
            missing_files.append(f'Missing psvimg in {folder}')
        if not os.path.exists(appmeta_path):
            missing_files.append(f'Missing psvmd in {folder}')

    return missing_files

def copy_files_to_documents(ID):
    source_folder = os.path.join('ws', 'ph1', 'PCSG90096')
    destination_folder = os.path.join(os.environ['USERPROFILE'], 'Documents', 'PS Vita', ID, 'APP', 'PCSG90096')

    if not os.path.exists(source_folder):
        print(f'Source folder {source_folder} does not exist.')
        return

    if not os.path.exists(destination_folder):
        os.makedirs(destination_folder)
        print(f'Destination folder created: {destination_folder}')

    try:
        # Copy the contents of the source folder to the destination folder
        for item in os.listdir(source_folder):
            source_item = os.path.join(source_folder, item)
            destination_item = os.path.join(destination_folder, item)

            if os.path.isdir(source_item):
                shutil.copytree(source_item, destination_item, dirs_exist_ok=True)
            else:
                shutil.copy2(source_item, destination_item)

        print(f'Tasks run successfully! Please open QCMA and connect your PS Vita!')
    except Exception as e:
        print(f'Error copying files: {e}')

if __name__ == "__main__":
    search_and_create_files(