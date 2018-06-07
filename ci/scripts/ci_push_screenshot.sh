#!/usr/bin/env bash
#
#  LICENSE
#
#  This file is part of Android Template App.
#
#  Android Template App is a subproject of Teclib.
#
#  Android Template App is free software: you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 3
#  of the License, or (at your option) any later version.
#
#  Android Template App is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  ------------------------------------------------------------------------
#  @author    Rafael Hernandez <rhernandez@teclib.com>
#  @copyright Copyright (c) 2018 Teclib
#  @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
#  @link      https://github.com/TECLIB/android-template-app/
#  @link      https://teclib.github.io/android-template-app/
#  @link      https://teclib-edition.com/en/
#  ------------------------------------------------------------------------
#

# Push commits and tags to origin branch
sudo mv ./fastlane/metadata/android ./screenshots
sudo mv ./screenshots/screenshots.html ./screenshots/index.html

# add
git add .

# temporal commit
git commit -m "ci(tmp): temporal commit"

# fetch
git fetch origin gh-pages

# move to branch
git checkout gh-pages

# clean workspace
sudo git clean -fdx

# git get screenshots
git checkout $CIRCLE_BRANCH ./screenshots

# add header
ruby ./ci/add_header_screenshot.rb

# add
git add ./screenshots

# commit
git commit -m "ci(screenshot): update screenshot"

# push to branch
git push origin gh-pages

# got back to original branch
git checkout $CIRCLE_BRANCH