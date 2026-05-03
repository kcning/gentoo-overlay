# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )
inherit distutils-r1

CSL_LOCALE_V=0.0.93
CSL_SCHEMA_V=1.0.1
DESCRIPTION="Yet another Python CSL Processor"
HOMEPAGE="
	https://pypi.org/project/citeproc-py/
	https://github.com/citeproc-py/citeproc-py
"
SRC_URI="
	https://github.com/citeproc-py/citeproc-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/citation-style-language/locales/archive/refs/tags/v${CSL_LOCALE_V}.tar.gz -> ${P}-locale.tar.gz
	https://github.com/citation-style-language/schema/archive/refs/tags/v${CSL_SCHEMA_V}.tar.gz -> ${P}-schema.tar.gz
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	app-text/rnc2rng[${PYTHON_USEDEP}]
"

RDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
"

CSL_DATA_PATH=citeproc/data
src_prepare() {
	rm -rf ${WORKDIR}/${P}/${CSL_DATA_PATH}/{locales,schema}
	mv ${WORKDIR}/locales-${CSL_LOCALE_V} ${WORKDIR}/${P}/${CSL_DATA_PATH}/locales
	mv ${WORKDIR}/schema-${CSL_SCHEMA_V} ${WORKDIR}/${P}/${CSL_DATA_PATH}/schema
	default
}
