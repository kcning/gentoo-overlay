# Copyright 2023-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..14} )
inherit distutils-r1 pypi

DESCRIPTION="Powerful and highly extensible cmd based document and bibliography manager."
HOMEPAGE="
	https://pypi.org/project/papis
	https://github.com/papis/papis
"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="csl isbn rofi"
RESTRICT="test"

RDEPEND="
	>=dev-python/arxiv2bib-1.0.7[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.4.1[${PYTHON_USEDEP}]
	>=dev-python/bibtexparser-0.6.2[${PYTHON_USEDEP}]
	<dev-python/bibtexparser-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/click-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.2[${PYTHON_USEDEP}]
	>=dev-python/doi-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/dominate-2.8[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/habanero-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.5[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.5[${PYTHON_USEDEP}]
	>=dev-python/pyaml-3.12.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-3.0[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-1.2.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.11.1[${PYTHON_USEDEP}]

	csl? (
		>=dev-python/citeproc-py-0.6.0[${PYTHON_USEDEP}]
	)

	isbn? (
		>=dev-python/isbnlib-3.9.1[${PYTHON_USEDEP}]
	)

	rofi? (
		x11-misc/rofi
		dev-python/papis-rofi[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	eapply_user
	mv contrib/shell_completion/click/bash/{papis.bash,papis} || die
	sed -i -e 's/papis.bash/papis/g' contrib/shell_completion/Makefile || die
	sed -i -e 's/papis.bash/papis/g' pyproject.toml || die
	sed -i -e 's/papis.bash/papis/g' doc/source/shell_completion.rst || die
}
