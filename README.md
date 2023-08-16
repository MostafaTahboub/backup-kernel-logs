
# Kernel Logs Collection and Backup

This project aims to automate the collection, compression, and backup of kernel logs on a Linux system using systemd timers and Dropbox. The provided shell script gathers kernel logs for the last hour, compresses them using the bzip2 algorithm, and uploads the compressed file to a specified Dropbox folder. This ensures that crucial kernel logs are regularly backed up for analysis and troubleshooting.


## Project Components
### Shell Script ('kernel-logs.sh')

The shell script performs the following tasks:

1. Generates a timestamp in the format "YYYY-MM-DDTHH-MM" for the file names.   
2. Reads kernel logs from the last hour using the journalctl command.  
3. Saves the logs to a plain text file named according to the generated timestamp.    
4. Compresses the plain text log file into a tarball using bzip2 compression.    
5. Uploads the compressed tarball to a specified folder in Dropbox using the dbxcli command-line tool.    
6. Cleans up temporary files after uploading.

### systemd Timer ('kernel-logs.timer')

The systemd timer unit is responsible for scheduling the execution of the shell script at the beginning of every hour.
The timer is configured as follows:

- ' OnCalendar=*:0/1 ' triggers the timer at the start of each hour.
- ' Persistent=true ' ensures that missed jobs are executed when the system is back online.

### systemd Service ('kernel-logs.service ')

The systemd service unit is associated with the shell script and executed by the timer. It specifies the path to the shell script to be executed when the service is started.



## Getting Started

1. Clone this repository to your Linux system.

2. Install the dbxcli Dropbox CLI tool as detailed in the dbxcli GitHub repository.

3. Customize the kernel-logs.sh script by providing the appropriate Dropbox folder path.

4. Copy the kernel-logs.timer and kernel-logs.service files to /etc/systemd/system/.

5. Enable and start the timer using the following commands:
```
sudo systemctl enable kernel-logs.timer
sudo systemctl start kernel-logs.timer

```


## Note
-  Make sure the system has an active internet connection for Dropbox uploads.
-  The compressed tarball is created for each hour and uploaded to Dropbox , Replace /path/to/Dropbox/folder in the script with your actual Dropbox folder path.

## Contributions

Contributions to this project are welcome. If you encounter any issues or have ideas for improvements, feel free to open an issue or create a pull request.
