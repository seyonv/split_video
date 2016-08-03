#!/bin/bash
# GLOBAL COMMAND:  ffsplit video.mpeg 1200
# if video.mpeg is 3000 seconds long
# (video-001[1200 seconds],
#  video-002[1200 seconds,
#  video-003[600 seconds]) will be created

# ==============================

# modify this file
function usage {
        echo "Usage : ffsplit.sh input.file chunk-duration [output-filename-format]"
        echo -e "\t - input file may be any kind of file reconginzed by ffmpeg"
        echo -e "\t - chunk duration must be in seconds"
        echo -e "\t - output filename format must be printf-like, for example myvideo-part-%04d.avi"
        echo -e "\t - if no output filename format is given, it will be computed\
 automatically from input filename"
}

IN_FILE="$1"
OUT_FILE_FORMAT="$3"
typeset -i CHUNK_LEN
CHUNK_LEN="$2"

DURATION_HMS=$(ffmpeg -i "$IN_FILE" 2>&1 | grep Duration | cut -f 4 -d ' ')
DURATION_H=$(echo "$DURATION_HMS" | cut -d ':' -f 1)
DURATION_M=$(echo "$DURATION_HMS" | cut -d ':' -f 2)
DURATION_S=$(echo "$DURATION_HMS" | cut -d ':' -f 3 | cut -d '.' -f 1)
let "DURATION = ( DURATION_H * 60 + DURATION_M ) * 60 + DURATION_S"

if [ "$DURATION" = '0' ] ; then
        echo "Invalid input video"
        usage
        exit 1
fi

if [ "$CHUNK_LEN" = "0" ] ; then
        echo "Invalid chunk size"
        usage
        exit 2
fi

if [ -z "$OUT_FILE_FORMAT" ] ; then
        # Look for every part of the string before the period, this is the name. Every part after the period is the

        FILE_NAME=$(echo "$IN_FILE" | sed 's/\([a-z A-Z0-9_]*\).[a-zA-Z0-9 ]*/\1/')
        FILE_EXT=$(echo "$IN_FILE" | sed 's/[a-z A-Z0-9_]*\.\([a-zA-Z0-9 ]*\)/\1/')

        OUT_FILE_FORMAT="${FILE_NAME}-%03d.${FILE_EXT}"
        echo -e "in outfileformat if statement | File_name: $FILE_NAME | File_ext: $FILE_EXT | $File_name: $FILE_NAME |  out_file_format: $OUT_FILE_FORMAT"
        # echo "Using default output file format : $OUT_FILE_FORMAT"
fi

N='1'
OFFSET='0'
let 'N_FILES = DURATION / CHUNK_LEN + 1'

while [ "$OFFSET" -lt "$DURATION" ] ; do
        OUT_FILE=$(printf "$OUT_FILE_FORMAT" "$N")
        echo "writing $OUT_FILE ($N/$N_FILES)..."
        # added -n flag to skip if already present
        # ffmpeg -n -i "$IN_FILE" -vcodec copy -acodec copy -ss "$OFFSET" -t "$CHUNK_LEN" "$OUT_FILE"
        # modified it to use quiet log level
        ffmpeg -loglevel quiet -n -i "$IN_FILE" -vcodec copy -acodec copy -ss "$OFFSET" -t "$CHUNK_LEN" "$OUT_FILE"
        let "N = N + 1"
        let "OFFSET = OFFSET + CHUNK_LEN"
done