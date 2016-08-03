#!/bin/bash

dest_dir='/usr/local/split_video_dir'

url_file="$dest_dir/videos_to_download.txt"
download_loc="$dest_dir/downloaded"
move_to_loc="$dest_dir/to_watch"
watched_loc="$dest_dir/watched"

download_videos(){
  cd $download_loc
  youtube-dl -a $url_file -o "%(title)s"
}

split_this_video(){
  if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
  fi

  filename=$1
  time_to_split=$2
  # could add error handling statement here to throw error if no argument is passed to function
  cd $download_loc
  cp $filename ../to_watch/$filename
  cd $move_to_loc

  # TEST FFSPLIT and FIX below line so naming works
  ffsplit $filename $time_to_split
  rm $filename
  # May add line to rmeove it from the new folder location
}

split_videos(){
  time_to_split=480
  IFS=$(echo -en "\n\b")
  for fname in `ls`; do
    split_this_video $fname $time_to_split
  done
}

play_previous(){
  cd $watched_loc
  last_played="$(ls -rU | sed -n 1p)"
  echo "Playing the previous file: $last_played"
  open "$last_played"
}

# refactor next and other to make more efficient [combine lines]
play_next(){
  cd $move_to_loc
  next_to_play="$(ls -U | sed -n 1p)"
  echo "Opening file: $next_to_play "
  # test out ffplay here instead of default open
  mv "$next_to_play" ../watched/"$next_to_play"
  cd $watched_loc
  open "$watched_loc/$next_to_play"
}

display_urls(){
  count=0
  while read f; do
    # check if the line is blank. If so, skip it and don't do anything
    if [ -n $f ]; then
      title=$(wget -q $f -O - | grep \<title\>| sed "s/\<title\>\([^<]*\).*/\1/")
      printf "$count - $title - $f \n"
      ((count++))
    fi


  done < $url_file
}

# params (url,line_num[optional param])
# this function should either take 1 or 2 arugments
add_url(){
  cd $dest_dir
  if [ $# -eq 0 ]; then
    echo "error need at least 1 argument [the url to add] and optionally 1 more [what line number to add it] "
    exit 1
  fi
  if [ $# -eq 1 ]; then
    echo -ne "$1\n" >> "$url_file"
  fi
  # might need to modify the gsed used here to insert in the correct line
  # number. Want to make sure the last line is always a newline
  if [ $# -eq 2 ]; then
    $lin=$2
    if [ "$2" -gt 0]; then
      $lin=`expr $2 - 1`
    else
      $lin=`expr $lin1 - 1`
    fi
    gsed -i "$lini $1" "$url_file"
  fi
}

remove_url(){
  cd $dest_dir
  if [ $# -eq 0 ]; then
    gsed -i '$ d' "$url_file"
  fi
  if [ $# -eq 1 ]; then
    sed -ie "$1d" "$url_file"
  fi
}

clear_all_urls(){
  cd $dest_dir
  > $url_file
}

show_help() {
  echo "help man manpage will be soon put here"
}


while getopts ":h :d :s :n :p :l :a: :r :d" opt; do
  # echo $@
  # when calling add_url want to be able to either have 1 or 2 optional parameters passed
  case $opt in
    h) show_help ;;
    d) download_videos ;;
    s) split_videos ;; #add arg
    n) play_next ;;
    p) play_previous ;;
    l) display_urls ;;
    a) if [ "$#" -eq 3 ]; then add_url $2 $3 #add args url, line_num
       else add_url $2;
       fi ;;
    r) remove_url ;; #add line_num
    d) clear_all_urls ;;
  esac
done
