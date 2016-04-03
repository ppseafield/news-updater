# This file is licensed under the General Public License version 3 or
# later. See the LICENSE.txt file.
# @author Bernhard Posselt <dev@bernhard-posselt.com>
# @copyright Bernhard Posselt 2016

# This makefile is only intended for development
.PHONY: install
install:
	sudo python3 setup.py install --install-scripts=/usr/bin

.PHONY: clean
clean:
	rm -rf dist
	rm -rf MANIFEST
	rm -rf build
	rm -rf owncloud_news_updater.egg-info

.PHONY: update
update: clean
	sudo pip3 uninstall owncloud_news_updater
	sudo python3 setup.py install

.PHONY: uninstall
uninstall: clean
	sudo pip3 uninstall owncloud_news_updater

.PHONY: clean
pypi: clean
	python3 setup.py sdist upload

.PHONY: test
test:
	# keep it simple until we've got tests
	pep8 owncloud_news_updater
	python3 -m owncloud_news_updater --version

