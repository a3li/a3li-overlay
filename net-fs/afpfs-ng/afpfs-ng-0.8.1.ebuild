# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit autotools base

DESCRIPTION="An Apple Filing Protocol (AFP) client, also providing a FUSE filesystem."
HOMEPAGE="http://sites.google.com/site/alexthepuffin/home"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+fuse +gcrypt"

DEPEND="
	dev-libs/gmp
	fuse?   ( sys-fs/fuse )
	gcrypt? ( dev-libs/libgcrypt )"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-fixes.patch" )

src_prepare() {
	base_src_prepare
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable fuse) \
		$(use_enable gcrypt) \
		--disable-static
}
src_install() {
	base_src_install
	dodoc docs/{FEATURES.txt,README,REPORTING-BUGS.txt}

	rm -f "${D}"/usr/$(get_libdir)/*.la || die ".la removal failed"
}
