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
VIDS_TO_DOWNLOAD    = ${DESTDIR}/videos_to_download.txt
# ****************************
SPLIT_VIDEO_DIR     = /usr/local/bin


# Remember that the below two files are binaries. but perhaps this is how these binaries are initialyl created (by accessing the bash files that are at this lcoation. If the latter case is true then it wouldn't be a case of that)

# if methoed being used is binaries to be curled directly than the below is actually useless
# SPLITTING_VIDEOS_SH = $(SPLIT_VIDEO_DIR)/splitting_videos.sh
# FFSPLIT_SH          = $(SPLIT_VIDEO_DIR)/ffsplit.sh

# ****************************
PREFIX              = /usr/local
BINDIR              = $(PREFIX)/bin
MANDIR              = $(PREFIX)/man
SHAREDIR            = $(PREFIX)/share

# ****************************
# Location of files to copy over and install

# install command has been removed
all: ${DESTDIR} ${DOWNLOADED_DIR} ${TO_WATCH_DIR} ${WATCHED_DIR}

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
