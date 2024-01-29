import subprocess

def install_required_libraries():
    libraries = ['ftplib', 'beautifulsoup4', 'requests']

    for library in libraries:
        try:
            # Check if the library is installed
            subprocess.run(['python', '-m', 'pip', 'show', library], check=True)
            print(f'{library} is already installed.')

        except subprocess.CalledProcessError:
            # The library is not installed, attempt to install it
            try:
                subprocess.run(['python', '-m', 'pip', 'install', library], check=True)
                print(f'{library} installed successfully.')

            except subprocess.CalledProcessError:
                print(f'Error installing {library}. Make sure you have pip installed and try again.')

if __name__ == "__main__":
    install_required_libraries()