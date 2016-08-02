<<<<<<< HEAD
# makefile should create entire directory structure in this folder along with files. DO NOT CALL IT split_video, want it to ba completely new


# THE THINGS THAT WILL CHANGE ARE OUT_DIR and SPLIT_VIDEO_DIR. These absolutely cannot be specified by need to be inferred from the command line and usage with an RPM helps alot too
# ****************************
MKDIR_P             = mkdir -p
TOUCH               = touch

# ****************************
OUT_DIR             = /Users/seyonvasantharajan/Desktop/makefile_folder/makefile4/vidtest4

DOWNLOADED_DIR      = ${OUT_DIR}/downloaded
TO_WATCH_DIR        = ${OUT_DIR}/to_watch
WATCHED_DIR         = ${OUT_DIR}/watched
README              = ${OUT_DIR}/README.md

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

all: ${OUT_DIR} ${DOWNLOADED_DIR} ${TO_WATCH_DIR} ${WATCHED_DIR} install

${OUT_DIR}:
	${MKDIR_P} ${OUT_DIR}

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
	rm -rf ${OUT_DIR} ${DOWNLOADED_DIR} ${TO_WATCH_DIR} ${WATCHED_DIR}
	# add removal for BINDIR/Split_Video1 and ffsplit(comment out ffsplit though as it's still being used by me though)
=======
# youtube-dl doesn't use mkdir command. see reference to determine if this directory should be included in the "all:" section
# -Find a reference besides youtube-dl that creates directories(will have a similar strucuture)
# -How to test makefile? How to test homebrew package
# -Process for creating homebrew package
#
# ----------------------------------------------------
all:

clean:

# See that DESTDIR is not defined anywhere else. why not? Is this implicit, what does it standfor
PREFIX ?= /usr/local
BINDIR ?= /usr/bin
MANDIR ?= $(PREFIX)/bin
SHAREDIR ?= $(PREFIX)/share

# look more into SYSCONFDIR. Is this needed to get homebrew installation working?

# look at differences between -d and -m flag. There is a line before the install statements in youtube-dl Makefile. What does this do?
install:

# Look into tar file meanings as well
tar:

# look at "youtube-dl:" as reference. this seems to be wear executable is created
youtube-dl:
>>>>>>> 92a1adb7fdaf8abf224f360c05531b59d28da918
