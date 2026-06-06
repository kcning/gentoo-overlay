# Copyright 2023-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..14} )
inherit distutils-r1 pypi

DESCRIPTION="client for Crossref search API"
HOMEPAGE="
	https://pypi.org/project/habanero/
	https://github.com/sckott/habanero
"

RDEPEND="
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-26.2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.67.3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.7.0[${PYTHON_USEDEP}]
	<dev-python/urllib3-3.0.0[${PYTHON_USEDEP}]
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
