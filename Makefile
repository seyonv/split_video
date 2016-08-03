# make all must be run for these files

MKDIR_P             = mkdir -p
TOUCH               = touch

# ****************************
DEST_DIR             = /usr/local/split_video_dir

DOWNLOADED_DIR      = ${DEST_DIR}/downloaded
TO_WATCH_DIR        = ${DEST_DIR}/to_watch
WATCHED_DIR         = ${DEST_DIR}/watched
VIDS_TO_DOWNLOAD    = ${DEST_DIR}/videos_to_download.txt

# ****************************
SPLIT_VIDEO_DIR     = /usr/local/bin
BINARY_NAME 				= split_video1

# SPLITTING_VIDEOS_SH = $(pwd)/splitting_videos.sh
# FFSPLIT_SH          = $(pwd)/ffsplit.sh
SPLITTING_VIDEOS_SH = splitting_videos.sh
FFSPLIT_SH          = ffsplit.sh

# ****************************
PREFIX              = /usr/local
BINDIR              = $(PREFIX)/bin
MANDIR              = $(PREFIX)/man
SHAREDIR            = $(PREFIX)/share

# ****************************
all: create_directories create_vids_to_download_txt install

create_directories:
	${MKDIR_P} ${DEST_DIR}
	${MKDIR_P} ${DOWNLOADED_DIR}
	${MKDIR_P} ${TO_WATCH_DIR}
	${MKDIR_P} ${WATCHED_DIR}

create_vids_to_download_txt:
	touch $(VIDS_TO_DOWNLOAD)

install:
	install $(SPLITTING_VIDEOS_SH) $(BINDIR)/$(BINARY_NAME)
	install $(FFSPLIT_SH) $(BINDIR)/ff_split
	# install man page
	# install 	/usr/share/man/man1/split_video.1



clean:
	rm -rf ${DEST_DIR}
	rm $(BINDIR)/$(BINARY_NAME)
	rm $(BINDIR)/ff_split
	# add removal for BINDIR/Split_Video1 and ffsplit(comment out ffsplit though as it's still being used by me though)
