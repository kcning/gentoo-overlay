# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit xdg-utils

KEYWORDS="~amd64 ~arm ~arm64"

DESCRIPTION="Frontend for ModemManager daemon able to control specific modem functions"
HOMEPAGE="https://sourceforge.net/projects/modem-manager-gui/"
SRC_URI="https://downloads.sourceforge.net/project/modem-manager-gui/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
IUSE="gtkspell ofono appindicator"

S="${WORKDIR}/${PN}"

DEPEND="
	>=dev-libs/glib-2.32.1
	>=sys-libs/gdbm-1.10
	>=gui-libs/gtk-3.4.0
	net-misc/modemmanager
	appindicator? (
		dev-libs/libappindicator
	)
	gtkspell? (
		>=app-text/gtkspell-3.0.3
	)
	ofono? (
		>=net-misc/ofono-1.9
	)
"

RDEPEND="${DEPEND}"

BDEPEND="
	>=app-text/po4a-0.45
	>=dev-util/itstool-1.2.0
"

PATCHES=(
	"${FILESDIR}/${P}-nocompress-man.patch"
	"${FILESDIR}/${P}-fix-assertion-not-set.patch"
	"${FILESDIR}/${P}-fix-segfault-on-DNS-entries.patch"
	"${FILESDIR}/${P}-fix-tray-icon.patch"
)

pkg_postinst() {
	xdg_icon_cache_update
}
