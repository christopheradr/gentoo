# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=0

DESCRIPTION="Themes for blinkensim"
HOMEPAGE="http://blinkenlights.net/project/developer-tools"
SRC_URI="http://blinkenlights.de/dist/blinkenthemes-0.10.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="media-libs/blib
	virtual/pkgconfig"
RDEPEND=""

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" \
		install || die "install failed"
}
