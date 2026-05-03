# Copyright 2023-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )
inherit distutils-r1

DESCRIPTION="python library to validate, clean, transform and get metadata of ISBN strings (for devs)."
HOMEPAGE="
	https://pypi.python.org/pypi/isbnlib
	https://github.com/xlcnd/isbnlib
"
SRC_URI="https://github.com/xlcnd/isbnlib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/wheel[${PYTHON_USEDEP}]
"
