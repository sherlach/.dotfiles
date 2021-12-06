# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
DOCS=( README.md )
DISTUTILS_USE_SETUPTOOLS=pyproject.toml
PATCHES=(
	"${FILESDIR}/${P}-man.patch"
)
inherit git-r3 distutils-r1

DESCRIPTION="Unicode selector using rofi"
HOMEPAGE="https://github.com/fdw/rofimoji"
EGIT_REPO_URI="https://github.com/fdw/rofimoji"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
# If you are using this ebuild you know what you're doing
KEYWORDS="amd64 x86"

#xsel works instead of xclip too but cbb configging 
#use flags
DEPEND="
		x11-misc/rofi
		x11-misc/xdotool
		x11-misc/xclip
		dev-python/configargparse
"


RDEPEND="${DEPEND}"
BDEPEND=""

#INST_LOC="/usr/share/$PN"

python_install_all() {
	#distutils-r1_python_install_all
	doman src/picker/docs/*.1
}

pkg_postinst() {
	einfo "set 'rofimoji' to a nice keybinding!"
}
