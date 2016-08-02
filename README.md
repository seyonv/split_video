Split_Video 1 "July 2016"
======================

NAME
------
split_video

SYNOPSIS
----------
`split_video` [`-hdsnplard`]

DESCRIPTION
--------------
This program is used to download, split and manage videos for viewing. The file/folder structure used is

* **downloaded**:
  * Downloaded stores downloaded files before they are separated into individual sections.
* **to_watch**
  * To_watch stores the same files but split up into smaller time segments.
* **watched**
  *  After these files are watched they will be automatically transferred to the watched folder so you can seamlessly keep track of the files you've watched.
* **videos_to_download.txt:**
  * This is the file that stores the urls of all the clips to be downloaded



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

AUTHOR
---------
Seyon Vasantharajan(seyon.vasantharajan@gmail.com)