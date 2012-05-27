# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/bundler/bundler-1.0.22.ebuild,v 1.3 2012/05/01 18:24:03 armin76 Exp $

EAPI=2

USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_TEST="spec"

# No documentation task
#RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Character encoding detection, brought to you by ICU"
HOMEPAGE="https://github.com/brianmario/charlock_holmes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Tests fail with obscure file not founds
RESTRICT="test"

ruby_add_rdepend "dev-ruby/rake-compiler"

ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"

RDEPEND="${RDEPEND}
	dev-vcs/git
	sys-apps/file"
DEPEND="${DEPEND}
	test? ( dev-vcs/git )"

each_ruby_prepare() {
	cd ext/charlock_holmes || die
	epatch "${FILESDIR}/extconf.patch" || die
}

each_ruby_configure() {
    ${RUBY} -Cext/charlock_holmes extconf.rb || die
}

each_ruby_compile() {
    emake -Cext/charlock_holmes || die
    mv ext/charlock_holmes/charlock_holmes$(get_modname) lib/charlock_holmes/ || die
}
