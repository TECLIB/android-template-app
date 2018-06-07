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

# Generate javadoc this folder must be on .gitignore
javadoc -d ./reports$1/javadoc -sourcepath ./app/src/main/java -subpackages . -bootclasspath $ANDROID_HOME/platforms/android-26/android.jar

# add reports
git add reports$1 -f

# create commit with temporary report folder
git commit -m "tmp report commit"

# get gh-pages branch
git fetch origin gh-pages

# move to gh-pages
git checkout gh-pages

# get javadoc folder
git checkout $CIRCLE_BRANCH reports$1/javadoc

# git add javadoc folder
git add reports$1/javadoc

# create commit for documentation
git commit -m "docs(javadoc): update javadoc"

# push to branch
git push origin gh-pages

# got back to original branch
git checkout $CIRCLE_BRANCH