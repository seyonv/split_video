# make all must be run for these files

MKDIR_P             = mkdir -p
TOUCH               = touch

# ****************************
DEST_DIR             = /usr/local/cellar/split_video

DOWNLOADED_DIR      = ${DEST_DIR}/downloaded
TO_WATCH_DIR        = ${DEST_DIR}/to_watch
WATCHED_DIR         = ${DEST_DIR}/watched
VIDS_TO_DOWNLOAD    = ${DEST_DIR}/videos_to_download.txt

# ****************************
BINARY_NAME 				= split_video1
MANPAGE_NAME				= split_video1.1
SPLITTING_VIDEOS_SH = splitting_videos.sh
FFSPLIT_SH          = ffsplit.sh

# ****************************
BINDIR              = $(DEST_DIR)/bin
MANDIR              = $(DEST_DIR)/share/man/man1

# ****************************
all: create_directories create_vids_to_download_txt install

create_directories:
	${MKDIR_P} ${DEST_DIR}
	${MKDIR_P} ${DOWNLOADED_DIR}
	${MKDIR_P} ${TO_WATCH_DIR}
	${MKDIR_P} ${WATCHED_DIR}
	${MKDIR_P} ${BINDIR}
	${MKDIR_P} ${MANDIR}

create_vids_to_download_txt:
	touch $(VIDS_TO_DOWNLOAD)

install:
	install $(SPLITTING_VIDEOS_SH) $(BINDIR)/$(BINARY_NAME)
	install $(FFSPLIT_SH) $(BINDIR)/ff_split
	# sudo cp split_video /usr/share/man/man1/split_video.1
	install $(MANPAGE_NAME) $(MANDIR)/$(MANPAGE_NAME)
	# install man page
	# install 	/usr/share/man/man1/split_video.1

clean:
	rm -rf ${DEST_DIR}
	rm $(BINDIR)/$(BINARY_NAME)
	rm $(BINDIR)/ff_split
	rm $(MANDIR)/$(MANPAGE_NAME)
