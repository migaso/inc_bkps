# INCREMENTAL BACKUPS ON LINUX 👌

This script has been designed to create incremental backups to improve the way to preserve data on the OS level.

## Advantage 💡 

The advantage of this script are the next:

- Create a backup with Point In Time Recovery.
- Compress files to improve use of space.
- Automate backups. (daily, weekly, monthly and yearly)
- Reduce the time to create new backups.
- Select Volume or Disk to make the new backups.
- Order backups by years. (create a directory with year's name)

## How to use ❓

You have to edit this script "inc_lnx_bkps.sh" to costumize the next variables

```sh
src=/change/from/origin/files/dir
path=/change/to/target/files/dir
script_path=/chage/to/dir/scripts/files
```
e.g.
src=/home/user_name/data
path=/media/volume1/bkp_data
script_path=/home/user/inc_bkps/

Execute script in script_path

```sh
chmod +x inc_lnx_bkps.sh
mkdir -p /tmp/logs
./inc_lnx_bkps.sh >> /tmp/logs/inc_lnx_bkps.$$.log 2>&1
```

e.g. output:

```sh
total 35405
-rwxrwxrwx 1 user users 21968087 nov  8 03:34 bkp0.tgz
-rwxrwxrwx 1 user users 14220891 nov  8 19:00 bkp1.tgz
-rwxrwxrwx 1 user users      113 nov  8 03:08 restore_lnx_bkps.sh
-rwxrwxrwx 1 user users    60528 nov  8 19:00 snapshot.snar
```

## Automate process 🤖

```sh
sudo su
crontab -e

# weekly_backup
0 19 * * 0 <script_path>/inc_lnx_bkps.sh >> /tmp/logs/inc_lnx_bkps.$$.log 2>&1
```

## Restore Backup 📂

You have to change path variable with the correct target directory into the restore_lnx_bkps.sh

```sh
path=/change/to/target/files/dir
```

Execute restore script

```sh
chmod +x restore_lnx_bkps.sh
./restore_lnx_bkps.sh 
```

## Point in Time Recovery ⏰

You have to change path variable with the correct target directory into the ptr_lnx_bkps.sh

```sh
path=/change/to/target/files/dir
# change with the last number bkp file to restore
n_times=10 
```
e.g. from bkp0.tgz (2024-11-04 19:00) to bkp10.tgz (2024-11-10 19:00)

Execute PTR script

```sh
chmod +x ptr_lnx_bkps.sh
./ptr_lnx_bkps.sh
```
