# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/plasma-applet-daisy/plasma-applet-daisy-0.0.4.25.ebuild,v 1.2 2011/01/31 14:28:25 tampakrap Exp $

EAPI=3

inherit kde4-base

DESCRIPTION="Modified version of KDE 4.7 taskbar applet and taskmanager library"
HOMEPAGE="http://kde-look.org/content/show.php/Icon+Tasks?content=144808"
SRC_URI="http://kde-look.org/CONTENT/content-files/144808-${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"
