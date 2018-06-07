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
git push --follow-tags origin $CIRCLE_BRANCH

# Merge back the develop branch step

# delete branch
git branch -D develop

# get fresh branch
git fetch origin develop

# go to develop
git checkout develop

# review some change
git pull origin develop

# merge with master
git merge master

# push develop
git push origin develop --force

# return to master
git checkout master