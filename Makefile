# #{prefix} stores /usr/local/Cellar/video_queue/1.0.8
# modify this to mimc the directory structure used by youtube-dl
# bin/, share/,

MKDIR_P             = mkdir -p
TOUCH               = touch

# ******************************
DEST_DIR             = /usr/local/video_queue_dir

TEMP_DIR						= ${PREFIX}/bin
DOWNLOADED_DIR      = ${TEMP_DIR}/downloaded
TO_WATCH_DIR        = ${TEMP_DIR}/to_watch
WATCHED_DIR         = ${TEMP_DIR}/watched
VIDS_TO_DOWNLOAD    = ${TEMP_DIR}/videos_to_download.txt

# ****************************
BINARY_NAME 				= video_queue1
MANPAGE_NAME				= video_queue1.1
SPLITTING_VIDEOS_SH = splitting_videos.sh
FFSPLIT_SH          = ffsplit.sh

# ****************************
LOCAL              = /usr/local
BINDIR              = $(LOCAL)/bin
MANDIR              = $(LOCAL)/share/man/man1

# ****************************
all: create_directories install

create_directories:
	${MKDIR_P}  ${DOWNLOADED_DIR} ${TO_WATCH_DIR} ${WATCHED_DIR}
	touch $(VIDS_TO_DOWNLOAD)

install:
	install $(SPLITTING_VIDEOS_SH) $(BINDIR)/$(BINARY_NAME)
	install $(FFSPLIT_SH) $(BINDIR)/ff_split
	# sudo cp video_queue /usr/share/man/man1/video_queue.1
	install $(MANPAGE_NAME) $(MANDIR)/$(MANPAGE_NAME)
	# install man page
	# install 	/usr/share/man/man1/video_queue.1

clean:
	rm -rf ${DEST_DIR}
	rm $(BINDIR)/$(BINARY_NAME)
	rm $(BINDIR)/ff_split
	rm $(MANDIR)/$(MANPAGE_NAME)
