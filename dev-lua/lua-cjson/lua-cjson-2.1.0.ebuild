# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A fast JSON encoding/parsing module for Lua"
HOMEPAGE="https://www.kyne.com.au/~mark/software/lua-cjson.php https://github.com/mpx/lua-cjson/"
SRC_URI="https://www.kyne.com.au/~mark/software/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND=">=dev-lang/lua-5.1:0"
DEPEND="${RDEPEND}"
BDEPEND="test? ( dev-lang/perl )"

DOCS=( NEWS THANKS )

src_test() {
	cd tests || die
	ln -s "${BUILD_DIR}"/cjson.so ./ || die
	ln -s "${S}"/lua/cjson ./ || die
	./genutf8.pl || die
	./test.lua || die
}

src_install() {
	use doc && local HTML_DOCS=( manual.html performance.html )
	cmake-utils_src_install
}
