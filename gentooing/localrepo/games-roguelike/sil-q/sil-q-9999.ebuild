# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 flag-o-matic wrapper

DESCRIPTION="Roguelike with focus on tactics and Tolkien's lore."
HOMEPAGE="https://github.com/sil-quirk/sil-q"
EGIT_REPO_URI="https://github.com/sil-quirk/sil-q.git"

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
# If you are using this ebuild you know what you're doing
KEYWORDS="amd64 x86"
IUSE="+ncurses X tiles sound strict debug"
#REQUIRED_USE=""

# Configurable options:
# X11; GCU; CAP; NCURSES; tiles


DEPEND="
		ncurses? ( sys-libs/ncurses )
		X? ( x11-libs/libX11 )

		" # ncurses? X11 stuff? sound? 
RDEPEND="${DEPEND}"
BDEPEND=""

INST_LOC="/usr/share/$PN"

src_compile() {
	# if use ncurses; (gcu?) ; use x11; ; use CAP? use tiles?
	#HAVE_MKSTEMP flag?

	# NB: the "standard" is USE_X11 and USE_GCU...
	append-cflags '-Wall'
	append-cflags '-D"HAVE_MKSTEMP"'
	append-cflags '-D"USE_PRIVATE_SAVE_PATH"'
	#append-cflags '-D"DEFAULT_PATH=\"/usr/share/sil-q/lib\""'
	append-cflags "-D\"DEFAULT_PATH=\\\"${INST_LOC}/lib\\\"\""

	#USE_GRAPHICS is tileset toggle
	#USE_SOUND for sound toggle
	if use X; then
		append-cflags '-D"USE_X11"'
		append-cflags '-I/usr/X11R6/include'
		append-libs '-lX11'
		#append-libs '-L/usr/X11R6/lib'
		#append-libs '-lXaw' '-lXext'
		#append-libs '-lXmu' '-lXt' '-lX11'
	#else
	#	append-cflags '-U"USE_X11"'
	fi

	if use ncurses; then
		append-cflags '-D"USE_GCU"'
		append-cflags '-D"USE_NCURSES"'
		append-cflags '-I/usr/include/ncurses'
		append-libs '-lncurses' '-ltinfo'
	fi

	if use strict; then
		append-cflags '-D"VERIFY_HONOR"'
		append-cflags '-U"ALLOW_SPOILERS"'
		append-cflags '-U"SCORE_WIZARDS"'
		append-cflags '-U"SCORE_CHEATERS"'
	else
		append-cflags '-D"ALLOW_SPOILERS"'
		append-cflags '-U"VERIFY_HONOR"'
	fi

	if use debug; then
		append-cflags '-D"ALLOW_DEBUG"'
	else
		append-cflags '-U"ALLOW_DEBUG"'
	fi
	#append-libs '-lSM' '-lICE'

	cd src
	emake VERBOSE=1 CFLAGS="${CFLAGS}" LIBS="${LIBS}" -f Makefile.std install
}

src_install() {
	insinto $INST_LOC
	exeinto $INST_LOC
	doins -r lib
	doexe sil
	make_wrapper sil $INST_LOC/sil

	dodoc README.md "Sil 1.3 Manual.pdf" "Sil-Q 1.4.2 Manual.pdf"
	dodoc silg silx
}

pkg_postinst() {
	einfo "game files have been placed in $INST_LOC"
	einfo "documentation is in default dodoc location"
	einfo "(/usr/share/doc/${PF} most likely)"
	einfo "along with some ideas for launch script wrappers"
	einfo "for tiles and window mode, silg and silx respectively"
	einfo "launch using command sil [-h for options]"
}
