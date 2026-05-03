# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Windows Hello style facial authentication for Linux"
HOMEPAGE="https://github.com/boltgolt/howdy"

EGIT_REPO_URI="https://github.com/boltgolt/howdy.git"
EGIT_BRANCH="master"
PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=no
inherit distutils-r1 git-r3 meson

LICENSE="MIT"
SLOT="0"
IUSE="gtk3 qt6"
REQUIRED_USE="|| ( gtk3 qt6 )"

PATCHES=(
	"${FILESDIR}/${P}-fix-dlib-data.patch"
)

# NOTE: dlib version < 19.24.3 does not work with numpy 2.0
RDEPEND="
	dev-python/elevate[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	dev-python/python-pam[${PYTHON_USEDEP}]
	gtk3? (
		media-libs/opencv[gtk3,png,python,v4l]
	)
	qt6? (
		media-libs/opencv[qt6,png,python,v4l]
		>=dev-qt/qtbase-6.0.0[X]
		>=dev-qt/qtmultimedia-6.0.0[X]
	)
	>=sci-libs/dlib-19.24.3[python]
	sys-auth/howdy-models
"

src_prepare() {
	default
	rm "${S}"/README.md || die

	if ! use gtk3; then
		sed -i "s/^subdir('howdy-gtk')/#&/" "${S}"/meson.build || die
	fi
}
