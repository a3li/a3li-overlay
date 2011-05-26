# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
GENTOO_DEPEND_ON_PERL=no

inherit perl-module

DESCRIPTION="A flexible yet simple backup solution using bash to wrap standard UNIX commands"
HOMEPAGE="http://wertarbyte.de/tartarus.shtml"
SRC_URI="http://wertarbyte.de/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="afio crypt +charon lvm orpheus pbzip2"

DEPEND="
	charon? ( dev-lang/perl )"
RDEPEND="${DEPEND}
	afio? ( app-arch/afio )
	crypt? ( app-crypt/gnupg )
	lvm? ( sys-fs/lvm2 )
	pbzip2? ( app-arch/pbzip2 )
"

src_prepare() {
	# We don't need a version check
	sed -i -e 's/CHECK_FOR_UPDATE="yes"/CHECK_FOR_UPDATE="no"/' bin/tartarus || die
}

src_compile() {
	emake || die
}

src_install() {
	dosbin bin/tartarus
	doman man/tartarus.1

	if use charon; then
		dosbin bin/charon*
		doman man/charon*
		
		perlinfo
		insinto ${VENDOR_LIB}
		pushd lib &>/dev/null
		doins -r Tartarus
		popd &>/dev/null
	fi

	if use orpheus; then
		dosbin bin/orpheus
	fi
}
