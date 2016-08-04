<!-- Add a table of contents to navigate between sections here -->
INSTALLATION
------
1. Download repository
2. Run the following command within the repository

    ```$make all```

3. You're ready to start using the program!

DESCRIPTION
--------------
This program is used to download, split and manage videos for viewing.

By default, the parent directory, split_video_dir, is stored at /usr/local.


The file/folder structure used is

* **downloaded**:
  Downloaded stores downloaded files before they are separated into individual sections.

* **to_watch**
  To_watch stores the same files but split up into smaller time segments.

* **watched**
  *After these files are watched they will be automatically transferred to the watched folder so you can seamlessly keep track of the files you've watched.

* **videos_to_download.txt:**
  This is the file that stores the urls of all the clips to be downloaded


USAGE
------
The global command to run program is

    $split_video1

By itself this won't do anything. You must used various flags. The 4 most important commands can be seen right below and all options/flags can be seen further down.

**Downloading:**

This will download .mp4 files for every URL listed in videos_to_download.txt
    $split_video1 -d

**Adding URL:**

This will add a new URL to videos_to_download.txt.
    $split_video1 -a URL

**Splitting Downloaded Videos into smaller segments**

This will separate every downloaded file into smaller video segments
    $split_video1 -a SECONDS

**Play next video**

This will play the next video in the to_watch folder
    $split_video1 -n



OPTIONS
---------
`-h`
    Print this help text and exit

`-d`
  Download all urls in text file *videos_to_download.txt* to download folder

`-s` *time_in_seconds*

Split all download files into smaller files of length time_in_seconds. If no argument specified, default length of 480 seconds(8 minutes) is used

`-n`
  Play next file in to-watch folder

`-p`
  Play most recently played file

`-l`
  See list of all files in *videos_to_download.txt* along with corresponding titles

`-a` *url* *line_num*

  Add url to *videos_to_download.txt* at specified line number. If no line number is specified it is added to the end of the file

`-r` *line_num*
  Remove url at given line number. If no line number is specified, the last line of the file is deleted

`-c`
  Delete all urls in *videos_to_download.txt*


DEPENDENCIES
---------
The key dependency is [youtube-dl](https://github.com/rg3/youtube-dl)

AUTHOR
---------
Seyon Vasantharajan(seyon.vasantharajan@gmail.com)

Credit to Alexis Bezverkhyy <alexis@grapsus.net> for ffsplit.sh, which I only only made minimal modifications to his original