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