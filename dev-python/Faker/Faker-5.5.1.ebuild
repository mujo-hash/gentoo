# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="a Python package that generates fake data for you"
HOMEPAGE="https://github.com/joke2k/faker"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-python/python-dateutil-2.4.2[${PYTHON_USEDEP}]
	>=dev-python/text-unidecode-1.3[${PYTHON_USEDEP}]"
DEPEND=""
BDEPEND="test? (
	dev-python/freezegun[${PYTHON_USEDEP}]
	dev-python/validators[${PYTHON_USEDEP}]
	)"

# Specific test dependency for one country post code tests
PATCHES=( "${FILESDIR}"/${PN}-5.5.1-ukposttest.patch )

distutils_enable_tests pytest
