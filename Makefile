# this implementation tests creation in Cellar

MKDIR_P             = mkdir -p
TOUCH               = touch

# ****************************
DEST_DIR             = /usr/local/cellar/split_video
LOCAl_DIR     			 = /usr/local

# ****************************
# MODIFY BIN DIR TO ACTUALLY BE AT /usr/local/bin instead of at /usr/local/cellar

BINDIR              = $(LOCAl_DIR)/bin
MANDIR              = $(DEST_DIR)/share/man/man1
LIBDIR							= ${DEST_DIR}/lib

DOWNLOADED_DIR      = ${LIBDIR}/downloaded
TO_WATCH_DIR        = ${LIBDIR}/to_watch
WATCHED_DIR         = ${LIBDIR}/watched
VIDS_TO_DOWNLOAD    = ${LIBDIR}/videos_to_download.txt

# ****************************
SPLITTING_VIDEOS_SH = splitting_videos.sh
SPLIT_VIDEO_BINARY	= split_video1
MANPAGE_NAME				= split_video1.1
FFSPLIT_SH          = ffsplit.sh
FFSPLIT_BINARY			=	ff

# ****************************
all: create_directories_and_file install

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
	install $(SPLITTING_VIDEOS_SH) $(BINDIR)/$(SPLIT_VIDEO_BINARY)
	install $(FFSPLIT_SH) $(BINDIR)/${FFSPLIT_BINARY}

	# add installation for manpage after bash scripts
clean:
	rm -rf ${DEST_DIR}
	rm -rf ${BINDIR}/${BINARY_NAME}
