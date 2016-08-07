# this implementation tests creation in Cellar

MKDIR_P             = mkdir -p
TOUCH               = touch

# ****************************
DEST_DIR             = /usr/local/cellar/split_video

# ****************************
BINDIR              = $(DEST_DIR)/bin
MANDIR              = $(DEST_DIR)/share/man/man1
LIBDIR							= ${DEST_DIR}/lib

DOWNLOADED_DIR      = ${LIBDIR}/downloaded
TO_WATCH_DIR        = ${LIBDIR}/to_watch
WATCHED_DIR         = ${LIBDIR}/watched
VIDS_TO_DOWNLOAD    = ${LIBDIR}/videos_to_download.txt

# ****************************
BINARY_NAME 				= split_video1
MANPAGE_NAME				= split_video1.1
SPLITTING_VIDEOS_SH = splitting_videos.sh
FFSPLIT_SH          = ffsplit.sh

# ****************************
all: create_directories_and_file

create_directories_and_file:
	${MKDIR_P} ${DEST_DIR}
	${MKDIR_P} ${BINDIR}
	${MKDIR_P} ${LIBDIR}
	${MKDIR_P} ${MANDIR}
	${MKDIR_P} ${DOWNLOADED_DIR}
	${MKDIR_P} ${TO_WATCH_DIR}
	${MKDIR_P} ${WATCHED_DIR}
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
