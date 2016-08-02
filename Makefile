# This version will use DESTDIR but have it be defined at
# /usr/local/vidtest4
#
# Within this directory, contents will be
# downloaded/, to_watch/, watched/, README.md

#
# Makefile, videos_to_download.txt, splitting_videos.sh, ffsplit.sh
# ****************************
MKDIR_P             = mkdir -p
TOUCH               = touch

# ****************************
DESTDIR             = /usr/local/vidtest4

DOWNLOADED_DIR      = ${DESTDIR}/downloaded
TO_WATCH_DIR        = ${DESTDIR}/to_watch
WATCHED_DIR         = ${DESTDIR}/watched
README              = ${DESTDIR}/README.md

# ****************************
SPLIT_VIDEO_DIR     = /Users/seyonvasantharajan/Desktop/split_video1

VIDS_TO_DOWNLOAD    = ${SPLIT_VIDEO_DIR}/videos_to_download.txt
SPLITTING_VIDEOS_SH = $(SPLIT_VIDEO_DIR)/splitting_videos.sh
FFSPLIT_SH          = $(SPLIT_VIDEO_DIR)/ffsplit.sh

# ****************************
PREFIX              = /usr/local
BINDIR              = $(PREFIX)/bin
MANDIR              = $(PREFIX)/man
SHAREDIR            = $(PREFIX)/share

# ****************************
# Location of files to copy over and install

all: ${DESTDIR} ${DOWNLOADED_DIR} ${TO_WATCH_DIR} ${WATCHED_DIR} install

${DESTDIR}:
	${MKDIR_P} ${DESTDIR}

${DOWNLOADED_DIR}:
	${MKDIR_P} ${DOWNLOADED_DIR}

${TO_WATCH_DIR}:
	${MKDIR_P} ${TO_WATCH_DIR}

${WATCHED_DIR}:
	${MKDIR_P} ${WATCHED_DIR}

install:
	# verify that ffsplit is accessible. Likely will need to merge it into the same bashfile (better to )
	install $(SPLITTING_VIDEOS_SH) $(BINDIR)/split_video1
	install $(FFSPLIT_SH) $(BINDIR)/ff_split

${README}:
	touch ${README}

clean:
	rm -rf ${DESTDIR} ${DOWNLOADED_DIR} ${TO_WATCH_DIR} ${WATCHED_DIR}
	# add removal for BINDIR/Split_Video1 and ffsplit(comment out ffsplit though as it's still being used by me though)
